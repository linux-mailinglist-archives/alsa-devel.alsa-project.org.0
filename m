Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 047588AFC37
	for <lists+alsa-devel@lfdr.de>; Wed, 24 Apr 2024 00:49:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0A93F191C;
	Wed, 24 Apr 2024 00:49:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0A93F191C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1713912578;
	bh=TRuX/tTAJzD7cSBZjxwlCUN8qWsw1eNS9r8xYN+qJVw=;
	h=Date:Subject:To:CC:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=BXRZUyHrUj5gDioXVR85vNzJuaCDpTYFl/jtCBLcXnhXydE1sOSQPKUFkcHgPcO8I
	 GJrO9bTfonJYz7Ep4a+QZX8zs0odT/v6IAd56MJbc/Ru3Eh1/0/56WAMjfpSklu4HH
	 /zRybl8eXBExHpbY5kY2dPHfSw/l9tmfAIfj1x0k=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 62AF2F80589; Wed, 24 Apr 2024 00:49:06 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CBDAFF805A0;
	Wed, 24 Apr 2024 00:49:05 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DF4E5F80423; Wed, 24 Apr 2024 00:48:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3070CF800B5
	for <alsa-devel@alsa-project.org>; Wed, 24 Apr 2024 00:48:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3070CF800B5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256
 header.s=qcppdkim1 header.b=cBW+NGtN
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id
 43NM5IQN015367;
	Tue, 23 Apr 2024 22:48:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=DDXZUb9B2qp1xMWb0EroroBnTTf58sdaiaj+26UKu5I=; b=cB
	W+NGtNYFM1GqoOmyCowtmgRlTJaC2dalqNTOCyIa1B4tBeynyAvca5C5fvTmmvcj
	jDzKC/l6wzG/EaGZeQsMwjMqjAbaK9a0N4MG4gnHxZDdi2eiebpl/LPBKUtl1PcM
	9g5x2oV6G1gZNpF8XFXy6R2n9vLcAClfUSksV36DkTDoWKgb7esBgqdxbKNqLSUP
	HTuZby/22SS/haVSE4yq6RwshxKOOxWekycPAEqRmAgmFJiSI3Z0EH7cW3RF8OKS
	vPGA3ZU5xoPc2Zc6ueVlzG8ZQcTFaWMYeNVcu3jR2SXFxsaEn+8AAMJizpXhg1xB
	5hmtyvO22MVROv/Cgd9Q==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3xpjp8gqp4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 23 Apr 2024 22:48:45 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com
 [10.47.209.197])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id
 43NMmit4014980
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 23 Apr 2024 22:48:44 GMT
Received: from [10.110.64.215] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 23 Apr
 2024 15:48:43 -0700
Message-ID: <32ea2ffa-5ee4-5344-826d-3572085af705@quicinc.com>
Date: Tue, 23 Apr 2024 15:48:43 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v19 41/41] ASoC: doc: Add documentation for SOC USB
Content-Language: en-US
To: Bagas Sanjaya <bagasdotme@gmail.com>, <srinivas.kandagatla@linaro.org>,
        <mathias.nyman@intel.com>, <perex@perex.cz>, <conor+dt@kernel.org>,
        <corbet@lwn.net>, <lgirdwood@gmail.com>, <andersson@kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>, <gregkh@linuxfoundation.org>,
        <Thinh.Nguyen@synopsys.com>, <broonie@kernel.org>,
        <bgoswami@quicinc.com>, <tiwai@suse.com>, <robh@kernel.org>,
        <konrad.dybcio@linaro.org>
CC: <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-sound@vger.kernel.org>, <linux-usb@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-doc@vger.kernel.org>,
        <alsa-devel@alsa-project.org>
References: <20240422224906.15868-1-quic_wcheng@quicinc.com>
 <20240422224906.15868-42-quic_wcheng@quicinc.com>
 <ZicSOzE8KyaYGi0v@archie.me>
From: Wesley Cheng <quic_wcheng@quicinc.com>
In-Reply-To: <ZicSOzE8KyaYGi0v@archie.me>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: W15zYV3-qeG-OQ9c9nb1NdmLHuOGZuDd
X-Proofpoint-ORIG-GUID: W15zYV3-qeG-OQ9c9nb1NdmLHuOGZuDd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-04-23_18,2024-04-23_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 mlxlogscore=999
 priorityscore=1501 phishscore=0 spamscore=0 clxscore=1011 bulkscore=0
 impostorscore=0 suspectscore=0 lowpriorityscore=0 adultscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2404010003 definitions=main-2404230061
Message-ID-Hash: 5CQ6WKHIP3I3SPF55LNEIK3AXN4Z7JA4
X-Message-ID-Hash: 5CQ6WKHIP3I3SPF55LNEIK3AXN4Z7JA4
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/5CQ6WKHIP3I3SPF55LNEIK3AXN4Z7JA4/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Bagas,

On 4/22/2024 6:43 PM, Bagas Sanjaya wrote:
> On Mon, Apr 22, 2024 at 03:49:06PM -0700, Wesley Cheng wrote:
>> +.. code-block:: rst
>> +
>> +int snd_soc_usb_setup_offload_jack(struct snd_soc_component *component,
>> +					struct snd_soc_jack *jack)
>> +..
> 
> You forget to indent snd_soc_usb_setup_offload_jack() prototype:
> 
> ---- >8 ----
> diff --git a/Documentation/sound/soc/usb.rst b/Documentation/sound/soc/usb.rst
> index 3f7c3ef6a0c03c..0b6da0be9f317f 100644
> --- a/Documentation/sound/soc/usb.rst
> +++ b/Documentation/sound/soc/usb.rst
> @@ -218,8 +218,8 @@ state.
>   
>   .. code-block:: rst
>   
> -int snd_soc_usb_setup_offload_jack(struct snd_soc_component *component,
> -					struct snd_soc_jack *jack)
> +        int snd_soc_usb_setup_offload_jack(struct snd_soc_component *component,
> +        					struct snd_soc_jack *jack)
>   ..
>   
>     - ``component``: ASoC component to add the jack
> 
>> +USB Offload Playback Route Select Kcontrol
>> +-----------------------------------
> 
> USB offload playback heading underlines are not long enough to cover heading
> titles, so I have to extend them:
> 
> ---- >8 ----
> diff --git a/Documentation/sound/soc/usb.rst b/Documentation/sound/soc/usb.rst
> index 0b6da0be9f317f..5e0e9fad131b24 100644
> --- a/Documentation/sound/soc/usb.rst
> +++ b/Documentation/sound/soc/usb.rst
> @@ -482,7 +482,7 @@ into the physical USB port and enumerated.  The kcontrols are defined as:
>       kcontrol exposed by the platform card.
>   
>   USB Offload Playback Route Select Kcontrol
> ------------------------------------
> +------------------------------------------
>   In order to allow for vendor specific implementations on audio offloading device
>   selection, the SOC USB layer exposes the following:
>   
> @@ -545,7 +545,7 @@ along to the external DSP.
>   
>   
>   USB Offload Playback Route Status
> --------------------
> +---------------------------------
>   SOC USB exposes APIs for keeping track of the offloading state, and expects this
>   to be maintained by the BE DAI link that created/added the SOC USB device.
>   
> @@ -573,7 +573,7 @@ When executing the kcontrol get callback, it will loop across the active_list ar
>   and report to the application for active USB sound card and USB PCM device indexes.
>   
>   USB Offload Playback Capable Card
> --------------------------------
> +---------------------------------
>   USB sound also creates a kcontrol for applications to help determine which platform
>   sound card USB offloading is linked to.  This will allow applications to further
>   query the platform sound card for specific information about the current USB offload
> 
> Thanks.
> 

Thanks for the review.  Will fix these all in the next revision.

Thanks
Wesley Cheng
