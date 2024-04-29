while True:
    # Task 1: Mở file
    answer = "B,A,D,D,C,B,D,A,C,C,D,B,A,B,A,C,B,D,A,C,A,A,B,D,D"
    answer_key = answer.split(",") # Tách đáp án thành chuỗi để tiện so sánh đáp án của từng câu hỏi
    while True: # Tạo vòng lặp vô hạn để nhập tên file và đọc file đó, nếu tên không tồn tại thì cho phép lựa chọn nhập lại
        try:
            filename = input("Enter a class to grad (i.e. class1 for class1.txt): ")
            with open(f"/Users/chaupham/Data_Science/MMC_DS/Module_1/Final _project/Data Files/{filename}.txt", "r") as file:
                # Mở file dưới dạng chỉ đọc
                print(f"Successfully opended {filename}.txt")
                data = file.readlines() # Tạo data là 1 list các dòng trong file
            break # Khi file tồn tại và đã được đọc thì thoát khỏi vòng lặp vô hạn này để thực hiện các nhiệm vụ tiếp theo
        except:
            # Trường hợp không tìm thấy tên file đã nhập thì cho phép lựa chọn để thử nhập lại
            print("File cannot be found")
            choice = input("Do you want to try another class (Y/N): ")
            if choice.capitalize() == "N":
                print("Thank you and Goodbye")
                quit() # Thoát khỏi chương trình nếu không muốn nhập lại
        
    # Task 2: Kiểm tra các dữ liệu không hợp lệ
    def valid_check(data): # Định nghĩa một hàm để kiểm tra các dòng invalid
        print("**** ANALYZING ****")
        len_file = len(data)
        invalid = 0
        invalid_list = []
        for idx,line in enumerate(data):
            line_split = line.split(",")
            if len(line_split) != 26:
                print("Invalid line of the data: does not contain exactly 26 values:")
                print(line)
                invalid += 1
                invalid_list.append(idx)
            elif len(line_split[0]) != 9:
                print("Invalid line of the data: N# is incalid:")
                print(line)
                invalid += 1
                invalid_list.append(idx)
            elif True:
                for i in line_split[0][1:9]:
                    if i.isnumeric(): # Kiểm tra các ký tự đằng sau N có phải là số hay không
                        continue
                    else:
                        print("Invalid line of the data: N# is invalid:")
                        print(line)
                        invalid += 1
                        invalid_list.append(idx)
        if invalid == 0: # Khi không có dòng nào invalid thì in ra thông báo không có lỗi
            print("No error found")
        print("**** REPORT ****")
        print(f"Total valid lines of the file: {len_file - invalid}")
        print(f"Total invalid lines of the file: {invalid}")
        return invalid_list # Trả về một list các giá trị index của các dòng invalid
    invalid_list = valid_check(data)
    # Task 3
    # Tính điểm
    def grading(data,invalid_list,answer_key):
        result = dict() # Tạo dictionary rỗng
        skip = [0]*25 
        wrong = [0]*25
        for idx,line in enumerate(data):
            line_split = line.split(",") # Tách từng dòng trong file thành 1 list 
            line_split[-1] = line_split[-1].strip("\n") # Loại bỏ ký tự \n ở phần tử cuối cùng
            if idx in invalid_list: # Nếu giá trị index của dòng hiện tại nằm trong list các index invalid thì bỏ qua và tiếp tục lặp
                continue
            else:
                score = 0
                for i in range(1,26):
                    if line_split[i] == answer_key[i-1]: # So sánh từng câu trả lời với đáp án tương ứng
                        score += 4
                    elif line_split[i] == "":
                        score = score
                        skip[i-1] += 1 # Ghi lại câu hỏi bị bỏ qua 1 lần
                    else:
                        score -= 1
                        wrong[i-1] += 1 # Ghi lại câu hỏi bị trả lời sai 1 lần
            result[line_split[0]] = score # Gán mã số học sinh (key) với số điểm (value) vào dictionary
        return result, skip, wrong
    result, skip, wrong = grading(data,invalid_list,answer_key)

    # Thống kê
    def statistic(result, skip, wrong):
        count = 0
        sum = 0
        for score in result.values():
            if score >= 80:
                count += 1
            sum += score
        print(f"Total students with high scores: {count}")
        print(f"Mean of scores of this class: {round(sum/len(result.values()),2)}")
        print(f"Highest score: {max(result.values())}")
        print(f"Lowest score: {min(result.values())}")
        print(f"Range of scores: {max(result.values())-min(result.values())}")
        # Tạo list điểm của cả lớp và tìm median
        scores = [score for score in result.values()]
        scores.sort()
        if len(scores)%2 != 0:
            scores_median = scores[int(len(scores)/2)]
        else:
            scores_median = (scores[int(len(scores)/2)] + scores[int((len(scores)+1)/2)])/2
        print(f"Median of scores: {round(scores_median,3)}")
        def most(skip):
            most_skip_list = [(idx+1) for idx,number in enumerate(skip) if number == max(skip)]
            # Tạo list ghi lại thứ tự của những câu hỏi bị bỏ qua nhiều nhất (index + 1)
            for i,idx in enumerate(most_skip_list):
                while i < len(most_skip_list):
                    print(f"{idx} - {skip[idx-1]} - {round(skip[idx-1]/len(result.values()),2)}, ", end ="")
                else:
                    print(f"{idx} - {skip[idx-1]} - {round(skip[idx-1]/len(result.values()),2)}")
                # In ra Thứ tự của câu hỏi bị bỏ qua nhiều nhất - số lần bị bỏ qua - tỷ lệ bị bỏ qua
        def most(wrong):
            most_wrong_list = [(idx+1) for idx,number in enumerate(wrong) if number == max(wrong)]
            # Tạo list ghi lại thứ tự của những câu hỏi bị sai nhiều nhất (index + 1)
            for i,idx in enumerate(most_wrong_list):
                if i < (len(most_wrong_list)-1):
                    print(f"{idx} - {wrong[idx-1]} - {round(wrong[idx-1]/len(result.values()),2)}, ", end ="")
                else:
                    print(f"{idx} - {wrong[idx-1]} - {round(wrong[idx-1]/len(result.values()),2)}")
                # In ra Thứ tự của câu hỏi bị sai nhiều nhất - số lần bị sai - tỷ lệ bị sai
        print("Question that most people skip: ", end = "")
        most(skip)
        print("Question that most people answer incorrectly: ",end = "")
        most(wrong)
    statistic(result, skip, wrong)
    text = ''
    for score in result:
        text = text + str(score) + "," + str(result[score])  + "\n"
    with open(f"/Users/chaupham/Data_Science/MMC_DS/Module_1/Final _project/Data Files/{filename}_grades.txt", "w") as filewrite:
        filewrite.write(text)
    choice = input("Do you want to enter another class (Y/N): ")
    if choice.capitalize() == "N":
        print("Thank you and Goodbye")
        break
