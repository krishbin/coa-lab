def default():
    c = [2,3,2,1,5,2,4,5,3,2,5,2]
    frame = []
    frame_stay = []
    hit = 0
    miss = 0
    for i in c:
        if i not in frame:
            miss = miss + 1
            if len(frame) == 3:
                val = max(frame_stay)
                loc = frame_stay.index(val)
                # print("Loc:",loc)
                # print("R:",frame[loc])
                # print("U:",i)
                frame_stay[loc] = -1
                frame[loc] = i
            else:
                frame.append(i)
                if(len(frame_stay) < frame.index(i)):
                    frame_stay[frame.index(i)] = -1
                else:
                    frame_stay.append(-1)
        else:
            # print("Loc:",frame.index(i))
            # print("V:",frame[frame.index(i)])
            print("H")
            hit = hit + 1

        for j in range(0,3):
            if(len(frame) > j):
                frame_stay[j] = frame_stay[j] +1
            else:
                pass

        print("\n")
        print(frame)
        print(frame_stay)

    print("hit ratio")
    hit_ratio = hit/(hit+miss)
    print(hit_ratio)


# LRU and LFU

if __name__ == "__main__":
    default()
