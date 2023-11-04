package com.example.demo.beans;


import java.time.LocalDateTime;

public class Post {
    private long id;
    private String imageName;
    private String title;
    private String descriptions;
    private double price;
    private String area;
    private Long userId;
    private Integer provinceCode;
    private String provinceName;
    private Integer districtCode;
    private String districtName;
    private Integer wardCode;
    private String wardName;
    private Long roomTypeId;
    private String roomTypeName;
    private RoomType roomType;
    private User user;
    private Address address;
    private String addressDetail;
    private LocalDateTime startAt;
    private LocalDateTime endAt;
    private LocalDateTime createAt;
    private LocalDateTime updateAt;

    public Post(long id,
                String imageName,
                String title,
                String descriptions,
                double price,
                String area,
                Address address,
                String addressDetail,
                long userId,
                LocalDateTime startAt,
                LocalDateTime endAt,
                LocalDateTime createAt,
                LocalDateTime updateAt) {
        this.id = id;
        this.imageName = imageName;
        this.title = title;
        this.descriptions = descriptions;
        this.price = price;
        this.area = area;
        this.address = address;
        this.addressDetail = addressDetail;
        this.userId = userId;
        this.startAt = startAt;
        this.endAt = endAt;
        this.createAt = createAt;
        this.updateAt = updateAt;
    }

    public Post() {
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getImageName() {
        return imageName;
    }

    public void setImageName(String imageName) {
        this.imageName = imageName;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getDescriptions() {
        return descriptions;
    }

    public void setDescriptions(String descriptions) {
        this.descriptions = descriptions;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getArea() {
        return area;
    }

    public void setArea(String area) {
        this.area = area;
    }

    public Long getUserId() {
        return userId;
    }

    public void setUserId(Long userId) {
        this.userId = userId;
    }

    public Integer getProvinceCode() {
        return provinceCode;
    }

    public void setProvinceCode(Integer provinceCode) {
        this.provinceCode = provinceCode;
    }

    public String getProvinceName() {
        return provinceName;
    }

    public void setProvinceName(String provinceName) {
        this.provinceName = provinceName;
    }

    public Integer getDistrictCode() {
        return districtCode;
    }

    public void setDistrictCode(Integer districtCode) {
        this.districtCode = districtCode;
    }

    public String getDistrictName() {
        return districtName;
    }

    public void setDistrictName(String districtName) {
        this.districtName = districtName;
    }

    public Integer getWardCode() {
        return wardCode;
    }

    public void setWardCode(Integer wardCode) {
        this.wardCode = wardCode;
    }

    public String getWardName() {
        return wardName;
    }

    public void setWardName(String wardName) {
        this.wardName = wardName;
    }

    public Long getRoomTypeId() {
        return roomTypeId;
    }

    public void setRoomTypeId(Long roomTypeId) {
        this.roomTypeId = roomTypeId;
    }

    public String getRoomTypeName() {
        return roomTypeName;
    }

    public void setRoomTypeName(String roomTypeName) {
        this.roomTypeName = roomTypeName;
    }

    public RoomType getRoomType() {
        return roomType;
    }

    public void setRoomType(RoomType roomType) {
        this.roomType = roomType;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Address getAddress() {
        return address;
    }

    public void setAddress(Address address) {
        this.address = address;
    }

    public String getAddressDetail() {
        return addressDetail;
    }

    public void setAddressDetail(String addressDetail) {
        this.addressDetail = addressDetail;
    }

    public LocalDateTime getStartAt() {
        return startAt;
    }

    public void setStartAt(LocalDateTime startAt) {
        this.startAt = startAt;
    }

    public LocalDateTime getEndAt() {
        return endAt;
    }

    public void setEndAt(LocalDateTime endAt) {
        this.endAt = endAt;
    }

    public LocalDateTime getCreateAt() {
        return createAt;
    }

    public void setCreateAt(LocalDateTime createAt) {
        this.createAt = createAt;
    }

    public LocalDateTime getUpdateAt() {
        return updateAt;
    }

    public void setUpdateAt(LocalDateTime updateAt) {
        this.updateAt = updateAt;
    }

    @Override
    public String toString() {
        return "Post{" +
                "id=" + id +
                ", imageName='" + imageName + '\'' +
                ", title='" + title + '\'' +
                ", descriptions='" + descriptions + '\'' +
                ", price=" + price +
                ", area='" + area + '\'' +
                ", userId=" + userId +
                ", provinceCode=" + provinceCode +
                ", districtCode=" + districtCode +
                ", wardCode=" + wardCode +
                ", roomTypeId=" + roomTypeId +
                ", roomType=" + roomType +
                ", user=" + user +
                ", address=" + address +
                ", addressDetail='" + addressDetail + '\'' +
                ", startAt=" + startAt +
                ", endAt=" + endAt +
                ", createAt=" + createAt +
                ", updateAt=" + updateAt +
                '}';
    }
}
