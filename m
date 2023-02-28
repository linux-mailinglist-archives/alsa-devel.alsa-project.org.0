Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E9326A557B
	for <lists+alsa-devel@lfdr.de>; Tue, 28 Feb 2023 10:20:48 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 50E50827;
	Tue, 28 Feb 2023 10:19:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 50E50827
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1677576047;
	bh=J5Dxa83EXfxNESCUDIZhLZ8xTHq/sujyGVGaQUoJJaI=;
	h=Date:Subject:To:References:From:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=DstVWH4bkhbyPERlCQquYIQ2C4OgMS6L9MBDApDPofISM0jJDCw6PAwWZDhrq8k8D
	 0CDxm158sk8oDoWzRVfha5r3F1Ks5iFTuAqAEAsNSTUH5nzTHsEXaxqq60QBkDh1Hu
	 gjSHtblu389Dx5n44X6OMu3p3k0jyWr0CuCVOR5E=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9DDF5F802BE;
	Tue, 28 Feb 2023 10:19:56 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EA7CBF8049C; Tue, 28 Feb 2023 10:19:51 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_LOW,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3C439F800BA
	for <alsa-devel@alsa-project.org>; Tue, 28 Feb 2023 10:19:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3C439F800BA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256
 header.s=qcppdkim1 header.b=XdaXyaLc
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 31S6vHLg007210;
	Tue, 28 Feb 2023 09:19:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=uwOTuHrVMWpvvUNqAI8f62i8ckHBQO46YUiqhs/HMOo=;
 b=XdaXyaLcEoTDf3DAGXT7XF9+GZ2/Dy/TUV28vU1bD5llwDPRBbm3irTTd8Fcw/Ep7BYv
 SsC959stLi/NLwEw8gi4VT66aMSCg9ZXsyExGTKn7grywQChP3mOc3c7rorQWu4xqkW+
 wqOie4SJKsYIkO22Kcnkg9z/tVa2mxwkbSSxDZKPIYaO/+zcz2c2r8mIPplx8HY7Mf43
 o1/ZizwL0COALerhdv6+AVQnlQi4l+STi1a6YJQfR+oyRH9UslOQ73EfvjtQaF3MbS+Y
 jO5oEnEnK9owO5Ywqej2wIPlU52uF7Y0vCNvasBJrIHoF95Z+Aim4nfQL/WmWaxn4A3v gg==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3p1csvrc2s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 28 Feb 2023 09:19:36 +0000
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com
 [10.47.209.197])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id
 31S9JZwJ032179
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 28 Feb 2023 09:19:35 GMT
Received: from [10.110.31.193] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.41; Tue, 28 Feb
 2023 01:19:33 -0800
Message-ID: <b38b317e-9c5e-a655-4364-df49c3b64b88@quicinc.com>
Date: Tue, 28 Feb 2023 01:19:33 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [RFC PATCH v2 12/22] sound: usb: card: Introduce USB SND platform
 op callbacks
Content-Language: en-US
To: Greg KH <gregkh@linuxfoundation.org>
References: <20230126031424.14582-1-quic_wcheng@quicinc.com>
 <20230126031424.14582-13-quic_wcheng@quicinc.com>
 <Y9Ui82OaI54Qx8Ft@kroah.com>
 <2c062ab0-905c-f1fe-eca2-02e23cc9fa6f@quicinc.com>
 <5e5c6481-8d5d-dc3f-e40e-986e3ac30387@quicinc.com>
 <Y/2tsfGGzAlLzxwd@kroah.com>
From: Wesley Cheng <quic_wcheng@quicinc.com>
In-Reply-To: <Y/2tsfGGzAlLzxwd@kroah.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: zegdGRIhjVcJgJu5qHW9tmkSNaG3Dc9t
X-Proofpoint-ORIG-GUID: zegdGRIhjVcJgJu5qHW9tmkSNaG3Dc9t
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-28_06,2023-02-27_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0
 suspectscore=0 phishscore=0 mlxscore=0 priorityscore=1501 malwarescore=0
 adultscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2302280074
Message-ID-Hash: RZGSAQVOHMZLDGY34YH574PXYV6JAAJP
X-Message-ID-Hash: RZGSAQVOHMZLDGY34YH574PXYV6JAAJP
X-MailFrom: quic_wcheng@quicinc.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: srinivas.kandagatla@linaro.org, mathias.nyman@intel.com,
 lgirdwood@gmail.com, andersson@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 Thinh.Nguyen@synopsys.com, broonie@kernel.org, bgoswami@quicinc.com,
 tiwai@suse.com, robh+dt@kernel.org, agross@kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-usb@vger.kernel.org, quic_jackp@quicinc.com, quic_plai@quicinc.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/RZGSAQVOHMZLDGY34YH574PXYV6JAAJP/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Greg,

On 2/27/2023 11:30 PM, Greg KH wrote:
> On Mon, Feb 27, 2023 at 06:59:32PM -0800, Wesley Cheng wrote:
>> Hi Greg,
>>
>> On 2/10/2023 2:49 PM, Wesley Cheng wrote:
>>> Hi Greg,
>>>
>>> On 1/28/2023 5:28 AM, Greg KH wrote:
>>>> On Wed, Jan 25, 2023 at 07:14:14PM -0800, Wesley Cheng wrote:
>>>>> Allow for different platforms to be notified on USB SND
>>>>> connect/disconnect
>>>>> seqeunces.  This allows for platform USB SND modules to properly
>>>>> initialize
>>>>> and populate internal structures with references to the USB SND chip
>>>>> device.
>>>>>
>>>>> Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
>>>>> ---
>>>>>    sound/usb/card.c | 28 ++++++++++++++++++++++++++++
>>>>>    sound/usb/card.h | 20 ++++++++++++++++++++
>>>>>    2 files changed, 48 insertions(+)
>>>>>
>>>>> diff --git a/sound/usb/card.c b/sound/usb/card.c
>>>>> index 26268ffb8274..803230343c16 100644
>>>>> --- a/sound/usb/card.c
>>>>> +++ b/sound/usb/card.c
>>>>> @@ -117,6 +117,24 @@ MODULE_PARM_DESC(skip_validation, "Skip
>>>>> unit descriptor validation (default: no)
>>>>>    static DEFINE_MUTEX(register_mutex);
>>>>>    static struct snd_usb_audio *usb_chip[SNDRV_CARDS];
>>>>>    static struct usb_driver usb_audio_driver;
>>>>> +static struct snd_usb_platform_ops *platform_ops;
>>>>
>>>> You can not have a single "platform_ops" pointer, this HAS to be
>>>> per-bus.
>>>>
>>>
>>> Agreed.
>>>
>>
>> I looked at seeing how we could implement this at a per bus level, but the
>> USB class driver model doesn't exactly have a good framework for supporting
>> this.  Reason being is because, at the time of the USB SND class driver
>> initialization, there is a big chance that there isn't a USB bus registered
>> in the system, so the point of adding the operations is not clear.  However,
>> we need to ensure that we've added the platform/driver operations before any
>> USB SND devices are detected.
> 
> But the offload "engine" is associated with the specific USB bus
> controller instance in the system, so perhaps you are just not adding
> this to the correct location?
> 

There are several parts to the offload logic:
1.  XHCI interrupter/resource components - fetching addresses to the 
proper event ring and transfer rings for the audio DSP.  This is the 
part which is specific to the controller instance, and APIs are being 
directly exported from the XHCI HCD, as the offloading features utilized 
are only specific for XHCI based controllers.  This is handled in 
patches 1-6 in this series.  Each XHCI instance will have its own set of 
interrupters, and transfer resources.

2.  USB offload class driver - driver which interacts with USB SND for 
operations like UAC descriptor parsing, USB audio device support params, 
and USB endpoint setup (ie issuing SET_INTERFACE to enable the device to 
start playback this is a SETUP transaction).  It will interact with the 
USB backend and items in #1, to set up the audio playback.

> The sound core shouldn't care about this at all, add the logic to the
> USB host controller driver instead, why isn't this just another USB bus
> function?
> 

The intention of the platform ops here is to mainly keep track of USB 
SND card/pcm device creation, and access to the main "struct 
snd_usb_audio".  This structure carries all the information about the 
different substreams allocated, as well as the formats supported by the 
audio device.  This is passed onto the USB backend, which will be 
utilized in my next revision to allow userspace to specifically select 
the proper card/PCM device to enable offload on.

>> To add to the above, in case of OTG/DRD (dual role) designs, the USB HCD/bus
>> isn't created until we move into the host role.  At that time, using DWC3 as
>> an example, we will create the XHCI platform device, and probe the USB HCD,
>> where a USB bus is created.
> 
> Great, again, tie it to the specific xhci host controler instance.
> 
>> In general, we currently think this USB offload driver should co-exist with
>> the USB SND class driver, which handles all devices connected across every
>> bus.
> 
> And that is incorrect, please do not do that.
> 

To clarify, I think we can summarize that the qc_audio_offload driver 
(the one that registers the platform operations) is mainly responsible 
for USB SND card management, and communicating that to the USB backend.

>> We can add a check to the platform connect routine to ensure that
>> there is a reference to the USB backend.  If so, then that particular USB
>> bus/sysdev can be supported by the audio DSP.  That way, we do not falsely
>> populate USB SND cards which are present on another USB bus/controller.
> 
> You should NEVER be able to populate a USB card unless the USB bus
> controller has given you the USB interface structure to control, so I do
> not understand how this is an issue.
> 

This might not be so clear with the current revision.  In the next 
revision I have prepared, as I mentioned, we are proposing using the 
platform connect/disconnect ops here to build a reference to all USB SND 
card and PCM devices available in the system.

For example, if you have an external hub connected to the root hub, and 
each port on that hub has an audio device connected.  We want to allow 
userspace to select which card# and pcm# to start offload on. (versus 
userspace having to rely on trail and error, which Pierre touched on on 
why that is not desired)

Since the USB SND driver is based on udevs (not bus specific), if there 
are multiple roothubs (correlates to usb buses), then we only want to 
notify the USB backend of the USB SND cards on the controller which has 
offloading enabled.  Otherwise, if userspace selects a device on an 
unsupported controller, then that path would obviously fail.

I hope that clarifies some things.

Thanks
Wesley Cheng
