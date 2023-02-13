Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E551269517C
	for <lists+alsa-devel@lfdr.de>; Mon, 13 Feb 2023 21:13:19 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7FFDC82C;
	Mon, 13 Feb 2023 21:12:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7FFDC82C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1676319198;
	bh=U8YsCCobIuaJ0vevhN8klG9+L4unYIR4XYBp19UQI6I=;
	h=Date:Subject:To:References:From:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=XSmYaue/djjCpIAPzVpDzvsTgofWXSkFFXoGrmyld79NpIvNVlPQKD+FrnScm55zZ
	 zzbFeU5t9jmk2z/eARhnxgjKuG/IWV1leZ5hkQUy+D8tODz97juI5hbjFeedKwGBxg
	 ABNL6jJFRGUcP53RQVyJv6RY+NFwsL2zJOBbtKwI=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D65A4F804B0;
	Mon, 13 Feb 2023 21:12:27 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5D997F804B4; Mon, 13 Feb 2023 21:12:23 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 11FA9F800B0
	for <alsa-devel@alsa-project.org>; Mon, 13 Feb 2023 21:12:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 11FA9F800B0
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256
 header.s=qcppdkim1 header.b=eCVbx1lr
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 31DInCVL015554;
	Mon, 13 Feb 2023 20:12:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=1tRrHjWpyfCk+2YRqqlygRJTHxcsyAOt0LyPmmlRyWI=;
 b=eCVbx1lrYyJzrG/m98d4pIiPNcUHuQLG3zEAmnG6GKusM80hAT6Xg+AKe6e6kG5zG05G
 vrWlG7RzM5O1cUvTsQGk5FFrjfQ2xrxOCUdpd8mHnfx1ua2EaN6QcYYEAI/tk4DHXjCo
 CJs41FJuhuz3UwV0FglGdFHGFzFm2kM3oWQuRSgUbCrDNKyWUD9xylZltwkEqHWyLXeD
 Q9mvXyke6vR7HbrRgYnIRNstPMATmcnh8W5BSk16odTyzPP4WBgYVbJedT5ZMhbVn/G5
 7K/ZF5h9HfIolVa46/zvH8FnryBCuqMgGYfAonduiecIV9qAivOpYI+nlLmGzWcqYqmG Bg==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3nqtsur543-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 13 Feb 2023 20:12:04 +0000
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com
 [10.47.209.197])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id
 31DKC2JW018133
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 13 Feb 2023 20:12:02 GMT
Received: from [10.110.116.218] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Mon, 13 Feb
 2023 12:12:01 -0800
Message-ID: <2f16d312-381e-8d34-894c-5bd02a645d68@quicinc.com>
Date: Mon, 13 Feb 2023 12:12:01 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [RFC PATCH v2 20/22] sound: usb: Prevent starting of audio stream
 if in use
Content-Language: en-US
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
        <srinivas.kandagatla@linaro.org>, <mathias.nyman@intel.com>,
        <perex@perex.cz>, <lgirdwood@gmail.com>, <andersson@kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>, <gregkh@linuxfoundation.org>,
        <Thinh.Nguyen@synopsys.com>, <broonie@kernel.org>,
        <bgoswami@quicinc.com>, <tiwai@suse.com>, <robh+dt@kernel.org>,
        <agross@kernel.org>
References: <20230126031424.14582-1-quic_wcheng@quicinc.com>
 <20230126031424.14582-21-quic_wcheng@quicinc.com>
 <557f8f76-38f5-5e07-905e-774e03120bd2@linux.intel.com>
 <b26c9e4c-5a9c-a2ff-19a7-78419c6b81df@quicinc.com>
 <b532bf7b-e1fb-3a9d-1b88-02f3159be47d@linux.intel.com>
 <60e42db4-1bbc-beea-d87d-6f93871b70c7@quicinc.com>
 <2c398ffb-6dd8-d43a-f99c-2033519a36be@linux.intel.com>
From: Wesley Cheng <quic_wcheng@quicinc.com>
In-Reply-To: <2c398ffb-6dd8-d43a-f99c-2033519a36be@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: ud9Y2Oz8GfpjSBVCDF8tTMy3n4L85z5x
X-Proofpoint-ORIG-GUID: ud9Y2Oz8GfpjSBVCDF8tTMy3n4L85z5x
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-13_12,2023-02-13_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0
 priorityscore=1501 malwarescore=0 mlxlogscore=999 phishscore=0
 lowpriorityscore=0 bulkscore=0 mlxscore=0 adultscore=0 impostorscore=0
 suspectscore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2212070000 definitions=main-2302130177
Message-ID-Hash: ZOR3EA2SA6WLFWSS5LY3XC27TIZY63EV
X-Message-ID-Hash: ZOR3EA2SA6WLFWSS5LY3XC27TIZY63EV
X-MailFrom: quic_wcheng@quicinc.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, quic_jackp@quicinc.com, quic_plai@quicinc.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZOR3EA2SA6WLFWSS5LY3XC27TIZY63EV/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Pierre,

On 2/13/2023 7:22 AM, Pierre-Louis Bossart wrote:
> 
> 
> On 2/11/23 03:52, Wesley Cheng wrote:
>> Hi Pierre,
>>
>> On 2/7/2023 5:29 AM, Pierre-Louis Bossart wrote:
>>>
>>>
>>> On 2/6/23 19:15, Wesley Cheng wrote:
>>>> Hi Pierre,
>>>>
>>>> On 1/26/2023 8:12 AM, Pierre-Louis Bossart wrote:
>>>>>
>>>>>
>>>>> On 1/25/23 21:14, Wesley Cheng wrote:
>>>>>> With USB audio offloading, an audio session is started from the ASoC
>>>>>> platform sound card and PCM devices.  Likewise, the USB SND path is
>>>>>> still
>>>>>> readily available for use, in case the non-offload path is
>>>>>> desired.  In
>>>>>> order to prevent the two entities from attempting to use the USB bus,
>>>>>> introduce a flag that determines when either paths are in use.
>>>>>>
>>>>>> If a PCM device is already in use, the check will return an error to
>>>>>> userspace notifying that the stream is currently busy.  This ensures
>>>>>> that
>>>>>> only one path is using the USB substream.
>>>>>
>>>>> It's good to maintain mutual exclusion, but it's still very hard for an
>>>>> application to figure out which card can be used when.
>>>>>
>>>>> Returning -EBUSY is not super helpful. There should be something like a
>>>>> notification or connection status so that routing decisions can be made
>>>>> without trial-and-error.
>>>>>
>>>>
>>>> The USB offload driver does have access to the USB substream that is
>>>> being utilized/offloaded.  Maybe in addition to this check, we can also
>>>> set the PCM runtime state as well (for that particular substream)?  That
>>>> way userspace can fetch information about if the stream is busy or not.
>>>
>>> You're missing the point. When a card is exposed but the PCM devices may
>>> or may not be usable (consuming data with no sound rendered or returning
>>> an error), it's much better to provide a clear connection status to
>>> userspace.
>>>
>>> Let me give you an example. Intel drivers can expose 3 HDMI/DP PCM
>>> devices. Userspace has no idea which one to use, so there's a jack
>>> control that tells userspace whether there is a receiver connected so
>>> that the audio server can use the relevant PCM device.
>>>
>>> Audio routing based on trial and error is really problematic, errors can
>>> happen but they should be exceptional (e.g. xruns), not a means of
>>> driver-userspace communication on the device status.
>>
>> Thanks for clarifying.  The example helped me understand a bit more on
>> how the potential use of the SND control interface.  Since we're dealing
>> with multiple sound cards here (platform sound card (offload) and USB
>> SND card (legacy)), what do you think about creating a SND control on
>> both the USB backend (platform card) and the USB SND card listing the
>> PCM device status?
>>
>> That way at least userspace can have the information about which PCM dev
>> (USB substream) is available (and not offloaded, or vice versa).  So the
>> USB SND control will contain the PCM devices (exposed by the card) and
>> if any are offloaded (if so mark them as unavailable).  Likewise, for
>> the USB backend, if the legacy path is being used, mark them as
>> unavailable for offloading.
> 
> We definitively need a control to indicate that a PCM offload device is
> available or not.
> There's still a very large open with the notion of having separate cards
> for the same audio device. Not only would it duplicate the control parts
> for e.g. volume control, but it would introduce the need to tag devices
> across two cards are being the same physical device.

The volume control would still be done through the card that is exposed 
by the USB SND card (even for the offload path)[no vol control option 
for the USB device on the platform card].

In the last discussion, you did mention that maybe we can tag the 
offload path as the "power saving" option for a particular USB stream. 
Although I'm not sure how intricate the logic is, but if userspace marks 
to use the power saving path, then would it already know which card and 
PCM devices are involved?

Although, that part is missing, ie to select the card and pcm device 
that we want to offload.  It may be possible to do this with another 
control on the USB ASoC backend driver.  I believe the audio DSP can 
support device selection.

> I still think the least-bad option is to have a single card and an
> optional PCM device for offload.

This is most likely the end goal, but as mentioned previously, its going 
to be a large effort to slowly decouple some of the PCM related 
operations from USB SND.  IMO, that would most likely be another 
significant patch series in itself.

Thanks
Wesley Cheng
