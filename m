Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A0ADF8B4191
	for <lists+alsa-devel@lfdr.de>; Fri, 26 Apr 2024 23:56:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A135CB71;
	Fri, 26 Apr 2024 23:55:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A135CB71
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1714168563;
	bh=7/12lQ8m5ACp3C54KCnXpyWNuV5AkXC4wJVhYXCnf8Y=;
	h=Date:Subject:To:CC:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=TOa7R9JV2z0SOEpXsll/StOLEu8htqiw9lxARG6GoFx2paM+YyxxKRrgzkGZ8S6r7
	 DZWhrzm96CKyVOQmEuH7Pzt4qZBoUhPLYmdo98WU9ImTjujAS9xTmlOMjMyL1qU4JB
	 2qf3ykJbm8ZxOlB0nTf12O2B3isgcFi3PSScc2aU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B5096F805AC; Fri, 26 Apr 2024 23:55:32 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D8FEEF8057B;
	Fri, 26 Apr 2024 23:55:31 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 56CB1F80423; Fri, 26 Apr 2024 23:55:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8A343F800B5
	for <alsa-devel@alsa-project.org>; Fri, 26 Apr 2024 23:55:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8A343F800B5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256
 header.s=qcppdkim1 header.b=UB1c/KyQ
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id
 43QLqmWU024490;
	Fri, 26 Apr 2024 21:55:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=CoaUWkpf4ziyf5/z5HH9Em0tl4jcL6HqmjBiVk7KXP0=; b=UB
	1c/KyQ8V2QkCCL7+hSWaN1MmFJUooEw7xjJQRzhC+Qia9tFlPoljc5Q45qI97+xe
	ApPCubZg1MjaYW3I7gUECUXYIJXaOQOt8dmuKb3G9KTmKLJwYVVf4aR+9z2OpahB
	vU8rZdBpCsv+KdJUXkMj8zX8XnEKsg2tf2RDVxQjp1ikFadKI4YeSHk3S3YXYC4n
	eemk8dc0DeTuaOlo3MtyQVf7LpZn+IRf7o3bVb8qprvPF6nAK+GZ4QhbdFaNy84+
	oQZ07TDe/IU6q9FqCH2cQyuN+PvTYvo3gwRD8qoRGNBVh880QEnsTK+RLx4GJ09j
	m6VX/Pkudy5y7M2cijYw==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3xr35eu06j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 26 Apr 2024 21:55:14 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com
 [10.47.209.197])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id
 43QLtBOi024640
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 26 Apr 2024 21:55:11 GMT
Received: from [10.110.6.235] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 26 Apr
 2024 14:55:10 -0700
Message-ID: <f128feb6-4be2-2f14-b4cb-8bf1d0908892@quicinc.com>
Date: Fri, 26 Apr 2024 14:55:09 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v20 09/41] ASoC: Add SOC USB APIs for adding an USB
 backend
Content-Language: en-US
To: =?UTF-8?Q?Amadeusz_S=c5=82awi=c5=84ski?=
	<amadeuszx.slawinski@linux.intel.com>,
        <srinivas.kandagatla@linaro.org>, <mathias.nyman@intel.com>,
        <perex@perex.cz>, <conor+dt@kernel.org>, <corbet@lwn.net>,
        <lgirdwood@gmail.com>, <andersson@kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>, <gregkh@linuxfoundation.org>,
        <Thinh.Nguyen@synopsys.com>, <broonie@kernel.org>,
        <bgoswami@quicinc.com>, <tiwai@suse.com>, <robh@kernel.org>,
        <konrad.dybcio@linaro.org>
CC: <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-sound@vger.kernel.org>, <linux-usb@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-doc@vger.kernel.org>,
        <alsa-devel@alsa-project.org>
References: <20240425215125.29761-1-quic_wcheng@quicinc.com>
 <20240425215125.29761-10-quic_wcheng@quicinc.com>
 <b8ff8777-6bcb-4fd7-9480-231536d23759@linux.intel.com>
From: Wesley Cheng <quic_wcheng@quicinc.com>
In-Reply-To: <b8ff8777-6bcb-4fd7-9480-231536d23759@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: R74DSglKBDCBfnJ5wNDAeCcJ3-qNHc_Q
X-Proofpoint-ORIG-GUID: R74DSglKBDCBfnJ5wNDAeCcJ3-qNHc_Q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-04-26_18,2024-04-26_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 mlxlogscore=999
 lowpriorityscore=0 malwarescore=0 spamscore=0 bulkscore=0 impostorscore=0
 phishscore=0 priorityscore=1501 clxscore=1015 suspectscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2404010003
 definitions=main-2404260154
Message-ID-Hash: ZL7K2QDUQ3XYRN4CBU3UBRA3HV2K53QW
X-Message-ID-Hash: ZL7K2QDUQ3XYRN4CBU3UBRA3HV2K53QW
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZL7K2QDUQ3XYRN4CBU3UBRA3HV2K53QW/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Amadeusz,

On 4/26/2024 6:25 AM, Amadeusz Sławiński wrote:
> On 4/25/2024 11:50 PM, Wesley Cheng wrote:
>> Some platforms may have support for offloading USB audio devices to a
>> dedicated audio DSP.  Introduce a set of APIs that allow for 
>> management of
>> USB sound card and PCM devices enumerated by the USB SND class driver.
>> This allows for the ASoC components to be aware of what USB devices are
>> available for offloading.
>>
>> Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
>> ---
> 
> (...)
> 
>> +const char *snd_soc_usb_get_components_tag(bool playback)
>> +{
>> +    if (playback)
>> +        return "usbplybkoffld: 1";
>> +    else
>> +        return "usbcapoffld: 1";
>> +}
>> +EXPORT_SYMBOL_GPL(snd_soc_usb_get_components_tag);
> 
> Is this used to expose some information to userspace?
> Can those be some more readable strings if so, like:
> usbplaybackoffload, usbcaptureoffload
> 

Sure we can make it a bit more complete.  Was trying to keep it short, 
but if the intention isn't clear on the tag, then we can keep the full form.

> (...)
> 
>> +
>> +    node = snd_soc_find_phandle(usbdev);
>> +    if (IS_ERR(node))
>> +        return -ENODEV;
>> +
>> +    ctx = snd_soc_find_usb_ctx(node);
>> +    of_node_put(node);
>> +    if (!ctx)
>> +        return -ENODEV;
> 
> Perhaps introduce some helper function, you do this 
> snd_soc_find_phandle() followed by snd_soc_find_usb_ctx() in few places...
> 

Will do.  Will make a helper and replace instances with this.

Thanks
Wesley Cheng
