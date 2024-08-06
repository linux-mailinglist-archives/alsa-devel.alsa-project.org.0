Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 738479498D8
	for <lists+alsa-devel@lfdr.de>; Tue,  6 Aug 2024 22:13:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DBEAF211A;
	Tue,  6 Aug 2024 22:13:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DBEAF211A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1722975201;
	bh=OQLJiIkny94KECYHJtVp+i8bZZ1zlTH93kKv+2o8Aig=;
	h=Date:Subject:To:CC:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=DaTaqmNUyHfJUZPZ5H3gizihWKC4qBf63CgKnTBRiRinkppkD6zG/UdUEpnVMw8vd
	 V+YrUEGDDrvy0k9SiqYGW5OpFoUReVr7GG5bQcguXxC4wquCCQRmD2c6sTS+efMTQ0
	 Sq46KWvy5STd38tuQQfbZ0rSGIdwAg1a57owPq7k=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 76E0EF805BF; Tue,  6 Aug 2024 22:12:50 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C0A56F805AE;
	Tue,  6 Aug 2024 22:12:48 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5EAFFF800E3; Tue,  6 Aug 2024 21:58:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	TIME_LIMIT_EXCEEDED,URIBL_BLOCKED shortcircuit=no
	autolearn=unavailable version=3.4.6
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D9675F800E3
	for <alsa-devel@alsa-project.org>; Tue,  6 Aug 2024 21:52:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D9675F800E3
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256
 header.s=qcppdkim1 header.b=MDl3p4rP
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id
 476H6Pju021361;
	Tue, 6 Aug 2024 19:52:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	70Lq7orQebnxRFnaTzLwJ4HqQh/eJyGl2eF5/RFh48I=; b=MDl3p4rPzpT7t6iw
	4Y8C7wRhe+/61+PIUUI+i8pI9ObxhFjvGAmP1rYwJQLkkUetmVMn1+potifLH05r
	EyMO5QC+7L5sMbDh7WZbc2d8iryifpM20un7z4ND7uCISeNb3r6Xv9GtQFW5TLUY
	Gv33Igscf2adDMF1BGY7DPW5qBSh6B4ucntiRZknXovtol3qZ0cyGo1GB1JAv1ng
	Zwq81MA/haqAW1P6V3/QOUl6o0r+dXy/uPk5YaI5fIgHU1gz59IEqL2tyQYICn+/
	S5yLbNy7K+/nMba+yoZMzrCBOS34bKMk1zOmXfEYgQy4AvGA4qaZiqBoDfHcyg5m
	iXdIAQ==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40sbgs0jks-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 06 Aug 2024 19:52:46 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com
 [10.47.209.197])
	by NALASPPMTA01.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id
 476JqjB0008058
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 6 Aug 2024 19:52:45 GMT
Received: from [10.71.113.127] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 6 Aug 2024
 12:52:44 -0700
Message-ID: <b323a813-b02e-488b-86f9-06796f9bbf50@quicinc.com>
Date: Tue, 6 Aug 2024 12:52:44 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v24 09/34] ASoC: Add SOC USB APIs for adding an USB
 backend
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
        <srinivas.kandagatla@linaro.org>, <mathias.nyman@intel.com>,
        <perex@perex.cz>, <conor+dt@kernel.org>, <corbet@lwn.net>,
        <broonie@kernel.org>, <lgirdwood@gmail.com>, <krzk+dt@kernel.org>,
        <Thinh.Nguyen@synopsys.com>, <bgoswami@quicinc.com>, <tiwai@suse.com>,
        <gregkh@linuxfoundation.org>, <robh@kernel.org>
CC: <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-sound@vger.kernel.org>, <linux-usb@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-doc@vger.kernel.org>,
        <alsa-devel@alsa-project.org>
References: <20240801011730.4797-1-quic_wcheng@quicinc.com>
 <20240801011730.4797-10-quic_wcheng@quicinc.com>
 <09fde4e6-c3be-484d-a7a5-bd653dc42094@linux.intel.com>
 <f761530c-a49b-4dd5-b01c-97d08931e0ab@quicinc.com>
 <acf4de1d-d551-4539-8353-3c85aa3d965c@linux.intel.com>
Content-Language: en-US
From: Wesley Cheng <quic_wcheng@quicinc.com>
In-Reply-To: <acf4de1d-d551-4539-8353-3c85aa3d965c@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: yYw0m-dlgfRq1_xa_E0JOK1i5VwHIAdk
X-Proofpoint-GUID: yYw0m-dlgfRq1_xa_E0JOK1i5VwHIAdk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-06_16,2024-08-06_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999
 impostorscore=0 malwarescore=0 suspectscore=0 phishscore=0 mlxscore=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 adultscore=0 spamscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408060140
Message-ID-Hash: YVBYY5WAEUFR25WM7XKCZ2ZGQ3EXTJ34
X-Message-ID-Hash: YVBYY5WAEUFR25WM7XKCZ2ZGQ3EXTJ34
X-MailFrom: quic_wcheng@quicinc.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/YVBYY5WAEUFR25WM7XKCZ2ZGQ3EXTJ34/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Pierre,

On 8/1/2024 11:26 PM, Pierre-Louis Bossart wrote:
>
> On 8/1/24 23:43, Wesley Cheng wrote:
>> Hi Pierre,
>>
>> On 8/1/2024 1:02 AM, Pierre-Louis Bossart wrote:
>>>
>>>> +/**
>>>> + * struct snd_soc_usb_device
>>>> + * @card_idx - sound card index associated with USB device
>>>> + * @pcm_idx - PCM device index associated with USB device
>>>> + * @chip_idx - USB sound chip array index
>>>> + * @num_playback - number of playback streams
>>>> + * @num_capture - number of capture streams
>>> so here we have a clear separation between playback and capture...
>> Thanks for the quick review of the series, I know that its a lot of work, so its much appreciated.
>>
>> I guess in the past revisions there was some discussions that highlighted on the fact that, currently, in our QC USB offload implementation we're supporting playback only, and maybe it should be considered to also expand on the capture path.  I went ahead and added some sprinkles of that throughout the SOC USB layer, since its vendor agnostic, and some vendors may potentially have that type of support.  Is it safe to assume that this is the right thinking?  If so, I will go and review some of the spots that may need to consider both playback and capture paths ONLY for soc-usb. (as you highlighted one below)  Else, I can note an assumption somewhere that soc-usb supports playback only and add the capture path when implemented.
> I don't think it's as simple as playback only or playback+capture. If
> there is no support for capture, then there is also no support for
> devices with implicit feedback - which uses the capture path. So you
> gradually start drawing a jagged boundary of what is supported and what
> isn't.
>
> My preference would be to add capture in APIs where we can, with TODOs
> added to make sure no one us under any illusion that the code is fully
> tested. But at least some of the basic plumbing will be in place.
>
> Takashi should chime in on this...
>
>>>> + * @list - list head for SoC USB devices
>>>> + **/
>>>> +struct snd_soc_usb_device {
>>>> +	int card_idx;
>>>> +	int pcm_idx;
>>>> +	int chip_idx;
>>>> +	int num_playback;
>>>> +	int num_capture;
>>>> +	struct list_head list;
>>>> +};
>>>> +
>>>> +/**
>>>> + * struct snd_soc_usb
>>>> + * @list - list head for SND SOC struct list
>>>> + * @component - reference to ASoC component
>>>> + * @num_supported_streams - number of supported concurrent sessions
>>> ... but here we don't. And it's not clear what the working 'sessions'
>>> means in the comment.
>>>
>>>> + * @connection_status_cb - callback to notify connection events
>>>> + * @priv_data - driver data
>>>> + **/
>>>> +struct snd_soc_usb {
>>>> +	struct list_head list;
>>>> +	struct snd_soc_component *component;
>>>> +	unsigned int num_supported_streams;
>>>> +	int (*connection_status_cb)(struct snd_soc_usb *usb,
>>>> +			struct snd_soc_usb_device *sdev, bool connected);
>>>> +	void *priv_data;
>>>> +};
>>>> +/**
>>>> + * snd_soc_usb_allocate_port() - allocate a SOC USB device
>>> USB port?
>> Noted, refer to the last comment.
>>>> + * @component: USB DPCM backend DAI component
>>>> + * @num_streams: number of offloading sessions supported
>>> same comment, is this direction-specific or not?
>> Depending on what you think about my first comment above, I'll also fix or remove the concept of direction entirely.
>>>> + * @data: private data
>>>> + *
>>>> + * Allocate and initialize a SOC USB device.  This will populate parameters that
>>>> + * are used in subsequent sequences.
>>>> + *
>>>> + */
>>>> +struct snd_soc_usb *snd_soc_usb_allocate_port(struct snd_soc_component *component,
>>>> +					      int num_streams, void *data)
>>>> +{
>>>> +	struct snd_soc_usb *usb;
>>>> +
>>>> +	usb = kzalloc(sizeof(*usb), GFP_KERNEL);
>>>> +	if (!usb)
>>>> +		return ERR_PTR(-ENOMEM);
>>>> +
>>>> +	usb->component = component;
>>>> +	usb->priv_data = data;
>>>> +	usb->num_supported_streams = num_streams;
>>>> +
>>>> +	return usb;
>>>> +}
>>>> +EXPORT_SYMBOL_GPL(snd_soc_usb_allocate_port);
>>>> +
>>>> +/**
>>>> + * snd_soc_usb_free_port() - free a SOC USB device
>>>> + * @usb: allocated SOC USB device
>>>> +
>>>> + * Free and remove the SOC USB device from the available list of devices.
>>> Now I am lost again on the device:port relationship. I am sure you've
>>> explained this before but I forget things and the code isn't
>>> self-explanatory.
>>>
>> Ok, I think the problem is that I'm interchanging the port and device terminology, because from the USB perspective its one device connected to a USB port, so its a one-to-one relation.  Removing that mindset, I think the proper term here would still be "port," because in the end SOC USB is always only servicing a port.  If this is the case, do you have any objections using this terminology in the Q6AFE as well as ASoC?  I will use consistent wording throughout SOC USB if so.
> I am not sure USB uses 'port' at all. If by 'port' you meant 'connector'
> it's not quite right, USB audio works across hubs.
>
Remember, this is technically the term used to explain the channel created for ASoC to communicate w/ USB.  If we use a term like "device," USB devices come and go, but this ASoC path won't be unallocated along with the USB device, since it does service/know about all the available USB devices connected to the system. (ie through usb hubs)

Thanks

Wesley Cheng

