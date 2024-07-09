//spdx-license-identifier: unlicense
pragma solidity ^0.8.0;

contract youtube {
    // declaring the videocount 0 by default
    uint256 public videocount = 0;
    // name of your contract
    string public name = "youtube";
    // creating a mapping of videocount to video
    mapping(uint256 => video) public videos;
    //  create a struct called 'video' with the following properties:
    struct video {
        uint256 id;
        string hash;
        string title;
        string description;
        string location;
        string category;
        string thumbnailhash;
        string date;
        address author;
    }

    // create a 'videouploaded' event that emits the properties of the video
    vent videouploaded(
        uint256 id,
        string hash,
        string title,
        string description,
        string location,
        string category,
        string thumbnailhash,
        string date,
        address author
    );

    constructor() {}
    // function to upload a video
    function uploadvideo(
        string memory _videohash,
        string memory _title,
        string memory _description,
        string memory _location,
        string memory _category,
        string memory _thumbnailhash,
        string memory _date
    ) public {
        // validating the video hash, title and author's address
        require(bytes(_videohash).length > 0);
        require(bytes(_title).length > 0);
        require(msg.sender != address(0));

        // incrementing the video count
        videocount++;
        // adding the video to the contract
        videos[videocount] = video(
             videocount,
            _videohash,
            _title,
            _description,
            _location,
            _category,
            _thumbnailhash,
            _date,
            msg.sender
        );
        // triggering the event
        emit videouploaded(
            videocount,
            _videohash,
             _title,
            _description,
            _location,
            _category,
            _thumbnailhash,
            _date,
            msg.sender
        );
    }
}