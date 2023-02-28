Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AEBB6A5192
	for <lists+alsa-devel@lfdr.de>; Tue, 28 Feb 2023 04:00:51 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5554F828;
	Tue, 28 Feb 2023 04:00:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5554F828
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1677553250;
	bh=Jdpu0OIEVOn3VZsm6kaPQn7MbpCWAMy/ZwhdIIdFWqs=;
	h=Date:Subject:From:To:References:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=FPvWtIlAL/Xa6LWm6HQUvB5iOtFgmVirk+eS+KOyeT0E+st7icP3R7phzgD7P/EbX
	 q2a5StY9mgcWZxVap1cz4DjpMufUo7cB5Zm6EwAEI8fQPn/K0hZ0D919srPGFOUEai
	 IHtSlgJvN2CgsRfNjds12CScKT4pwn8cX2x2gJqE=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A2920F802BE;
	Tue, 28 Feb 2023 03:59:59 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5C5D4F8049C; Tue, 28 Feb 2023 03:59:55 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5D4FAF800BA
	for <alsa-devel@alsa-project.org>; Tue, 28 Feb 2023 03:59:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5D4FAF800BA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256
 header.s=qcppdkim1 header.b=oXwk5/gM
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 31S2Rpqh010567;
	Tue, 28 Feb 2023 02:59:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : from : to : cc : references : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=iGExTyfqA8UiNaWVM0CI3ERBpJ+ppSBXThFNDZNWvK0=;
 b=oXwk5/gMO3nnoQ3P1KcNZleSvKuZqit8I0FiBa65PV2bn6RtCDKE/6j95NxtdYUvXHxv
 mItLLNhIlVPQ+U/NehbpdViJwsZ1UufCsNhciEV6IKFYMO0kF8An6OjIe40ANQBnjMFm
 yePoXLWawYELCIbDaxtmWpqJRDgo2QTL4FQ9IgkWwGSJFTObPrsQBP5X/Dtc8wvUaFUh
 QYgG3LAXuYU0tdws+uFI3utDIprUOW16ubk7ECuLVhO+8czFLk98v+usiBXbzK9WwpXU
 bBh//Y0LZLu/8g41ES06UIxrjFJ65QBEad/9DRfHnUJv/rZtBwa5EloPxinJ8dP3FCcD pA==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3p17ryr78w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 28 Feb 2023 02:59:41 +0000
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com
 [10.47.209.197])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id
 31S2xe9F013059
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 28 Feb 2023 02:59:40 GMT
Received: from [10.110.31.193] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.41; Mon, 27 Feb
 2023 18:59:39 -0800
Message-ID: <5e5c6481-8d5d-dc3f-e40e-986e3ac30387@quicinc.com>
Date: Mon, 27 Feb 2023 18:59:32 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [RFC PATCH v2 12/22] sound: usb: card: Introduce USB SND platform
 op callbacks
Content-Language: en-US
From: Wesley Cheng <quic_wcheng@quicinc.com>
To: Greg KH <gregkh@linuxfoundation.org>
References: <20230126031424.14582-1-quic_wcheng@quicinc.com>
 <20230126031424.14582-13-quic_wcheng@quicinc.com>
 <Y9Ui82OaI54Qx8Ft@kroah.com>
 <2c062ab0-905c-f1fe-eca2-02e23cc9fa6f@quicinc.com>
In-Reply-To: <2c062ab0-905c-f1fe-eca2-02e23cc9fa6f@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: 6SRmoeFCRlxObLlSUAo-jbjYTEJwar6h
X-Proofpoint-GUID: 6SRmoeFCRlxObLlSUAo-jbjYTEJwar6h
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-27_19,2023-02-27_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999
 lowpriorityscore=0 bulkscore=0 priorityscore=1501 mlxscore=0 phishscore=0
 adultscore=0 malwarescore=0 suspectscore=0 clxscore=1011 spamscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302280018
Message-ID-Hash: T27UIE3G7E5BFZLOGRXL6N34SXJD5VWV
X-Message-ID-Hash: T27UIE3G7E5BFZLOGRXL6N34SXJD5VWV
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/T27UIE3G7E5BFZLOGRXL6N34SXJD5VWV/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Greg,

On 2/10/2023 2:49 PM, Wesley Cheng wrote:
> Hi Greg,
> 
> On 1/28/2023 5:28 AM, Greg KH wrote:
>> On Wed, Jan 25, 2023 at 07:14:14PM -0800, Wesley Cheng wrote:
>>> Allow for different platforms to be notified on USB SND 
>>> connect/disconnect
>>> seqeunces.  This allows for platform USB SND modules to properly 
>>> initialize
>>> and populate internal structures with references to the USB SND chip
>>> device.
>>>
>>> Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
>>> ---
>>>   sound/usb/card.c | 28 ++++++++++++++++++++++++++++
>>>   sound/usb/card.h | 20 ++++++++++++++++++++
>>>   2 files changed, 48 insertions(+)
>>>
>>> diff --git a/sound/usb/card.c b/sound/usb/card.c
>>> index 26268ffb8274..803230343c16 100644
>>> --- a/sound/usb/card.c
>>> +++ b/sound/usb/card.c
>>> @@ -117,6 +117,24 @@ MODULE_PARM_DESC(skip_validation, "Skip unit 
>>> descriptor validation (default: no)
>>>   static DEFINE_MUTEX(register_mutex);
>>>   static struct snd_usb_audio *usb_chip[SNDRV_CARDS];
>>>   static struct usb_driver usb_audio_driver;
>>> +static struct snd_usb_platform_ops *platform_ops;
>>
>> You can not have a single "platform_ops" pointer, this HAS to be
>> per-bus.
>>
> 
> Agreed.
> 

I looked at seeing how we could implement this at a per bus level, but 
the USB class driver model doesn't exactly have a good framework for 
supporting this.  Reason being is because, at the time of the USB SND 
class driver initialization, there is a big chance that there isn't a 
USB bus registered in the system, so the point of adding the operations 
is not clear.  However, we need to ensure that we've added the 
platform/driver operations before any USB SND devices are detected.

To add to the above, in case of OTG/DRD (dual role) designs, the USB 
HCD/bus isn't created until we move into the host role.  At that time, 
using DWC3 as an example, we will create the XHCI platform device, and 
probe the USB HCD, where a USB bus is created.

In general, we currently think this USB offload driver should co-exist 
with the USB SND class driver, which handles all devices connected 
across every bus.  We can add a check to the platform connect routine to 
ensure that there is a reference to the USB backend.  If so, then that 
particular USB bus/sysdev can be supported by the audio DSP.  That way, 
we do not falsely populate USB SND cards which are present on another 
USB bus/controller.

Thanks
Wesley Cheng
