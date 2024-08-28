Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BC422963098
	for <lists+alsa-devel@lfdr.de>; Wed, 28 Aug 2024 21:01:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 36BFB105F;
	Wed, 28 Aug 2024 21:00:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 36BFB105F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1724871662;
	bh=RBJz/zzglqhWIoTl5eUntzhmPrkWOg8/XY8mlpDT9ww=;
	h=Date:Subject:To:CC:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=KffKs3Y9DDeGlmkYfN5EDXwF/Bk2wOo1ms5fnItbUveCLXhGQnOgNV/q985O2KEEa
	 NCxnabsBJU6Dw0zEzQaXBTuMFv4ExZERFtclbBDhAI+bDeY0lrn2n2Yti8R1NN6Srg
	 3BfOEOSGvuDH3Tefbc9ecRL/S6jxAP+1OM99jBLg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 74636F805B1; Wed, 28 Aug 2024 21:00:28 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9B2AAF8059F;
	Wed, 28 Aug 2024 21:00:27 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9F0F4F80518; Wed, 28 Aug 2024 21:00:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 94E87F80107
	for <alsa-devel@alsa-project.org>; Wed, 28 Aug 2024 21:00:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 94E87F80107
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256
 header.s=qcppdkim1 header.b=cnyW3MOE
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id
 47SBC6xs002429;
	Wed, 28 Aug 2024 19:00:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ac2F4en+f7psj+DcGIT6h3TuBaKdmQsv/G+RfBE8thg=; b=cnyW3MOEcbliUvTA
	4au+ulRW4w3FEnGSGxrSipH1r4oIA0tMyS77eUdXDz+AbhWmey5l/pHYt4D5EWdk
	tNG3Uy5RicqhGk5BXkhvQ4BTSGrIvINoB1WC3SNXKUC86hR/t/I2sKk07PvncRBQ
	mqKB4W4egzGIFF9khuayZWoMZiTP3/sdkWMxzTizdSRFBZLcjBu7l7H5PM3PmV9s
	DZRwiDH/nr/EGhWNbzn3lQDBHiZ7CzLJFQLYdffJxVt8I0hZpaGb45K+7APrFLd9
	8kAOE2WNbUJnvc++LCye5wtS1aoJJxSVgBxlEvt2ZKtXXsMeFtd7s4UMJjT2nXko
	+6nFGA==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 419puuath0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 28 Aug 2024 19:00:19 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com
 [10.47.209.197])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id
 47SJ0FP4022838
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 28 Aug 2024 19:00:15 GMT
Received: from [10.110.100.101] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 28 Aug
 2024 12:00:14 -0700
Message-ID: <2133dfd6-40f4-41cb-85ea-63fd9467a75f@quicinc.com>
Date: Wed, 28 Aug 2024 12:00:14 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v25 00/33] Introduce QC USB SND audio offloading support
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
        <srinivas.kandagatla@linaro.org>, <mathias.nyman@intel.com>,
        <perex@perex.cz>, <conor+dt@kernel.org>, <dmitry.torokhov@gmail.com>,
        <corbet@lwn.net>, <broonie@kernel.org>, <lgirdwood@gmail.com>,
        <tiwai@suse.com>, <krzk+dt@kernel.org>, <Thinh.Nguyen@synopsys.com>,
        <bgoswami@quicinc.com>, <robh@kernel.org>,
        <gregkh@linuxfoundation.org>
CC: <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-sound@vger.kernel.org>, <linux-usb@vger.kernel.org>,
        <linux-input@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-doc@vger.kernel.org>, <alsa-devel@alsa-project.org>
References: <20240823200101.26755-1-quic_wcheng@quicinc.com>
 <f4e609c0-92ff-4724-8243-bfe5de50d308@linux.intel.com>
Content-Language: en-US
From: Wesley Cheng <quic_wcheng@quicinc.com>
In-Reply-To: <f4e609c0-92ff-4724-8243-bfe5de50d308@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: jyj30OcvCZMaYaVv6BDWhbv4i4P4-mXk
X-Proofpoint-ORIG-GUID: jyj30OcvCZMaYaVv6BDWhbv4i4P4-mXk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-28_08,2024-08-28_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 impostorscore=0 adultscore=0 malwarescore=0 suspectscore=0 bulkscore=0
 clxscore=1015 mlxlogscore=999 mlxscore=0 phishscore=0 lowpriorityscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408280138
Message-ID-Hash: FTUPMXXPWP42DRGBKHCUS7FRGMK32USH
X-Message-ID-Hash: FTUPMXXPWP42DRGBKHCUS7FRGMK32USH
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/FTUPMXXPWP42DRGBKHCUS7FRGMK32USH/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Pierre,

On 8/26/2024 2:28 AM, Pierre-Louis Bossart wrote:
>> Changelog
>> --------------------------------------------
>> Changes in v25:
>> - Cleanups on typos mentioned within the xHCI layers
>> - Modified the xHCI interrupter search if clients specify interrupter index
>> - Moved mixer_usb_offload into its own module, so that other vendor offload USB
>> modules can utilize it also.
>> - Added support for USB audio devices that may have multiple PCM streams, as
>> previous implementation only assumed a single PCM device.  SOC USB will be
>> able to handle an array of PCM indexes supported by the USB audio device.
>> - Added some additional checks in the QC USB offload driver to check that device
>> has at least one playback stream before allowing to bind
>> - Reordered DT bindings to fix the error found by Rob's bot.  The patch that
>> added USB_RX was after the example was updated.
>> - Updated comments within SOC USB to clarify terminology and to keep it consistent
>> - Added SND_USB_JACK type for notifying of USB device audio connections
> I went through the code and didn't find anything that looked like a
> major blocker. There are still a number of cosmetic things you'd want to
> fix such as using checkpatch.pl --strict --codespell to look for obvious
> style issues and typos, see selection below. git am also complains about
> EOF lines.

Thanks for the consistent reviews.  Will fix the checkpatch errors and mis-spells.  I didn't have codespell added so fixed that and resolved the typos.

Thanks

Wesley Cheng

> Overall this is starting to look good and ready for other reviewers to
> look at.
>
>
>
> WARNING: 'reaquire' may be misspelled - perhaps 'reacquire'?
> #54: FILE: drivers/usb/host/xhci-ring.c:3037:
> + * for non OS owned interrupter event ring. It may drop and reaquire
> xhci->lock
>                                                              ^^^^^^^^
> WARNING: 'compliation' may be misspelled - perhaps 'compilation'?
> #16:
> module compliation added by Wesley Cheng to complete original concept code
>        ^^^^^^^^^^^
> CHECK: Prefer kzalloc(sizeof(*sgt)...) over kzalloc(sizeof(struct
> sg_table)...)
> #105: FILE: drivers/usb/host/xhci-sideband.c:35:
> +	sgt = kzalloc(sizeof(struct sg_table), GFP_KERNEL);
>
> CHECK: struct mutex definition without comment
> #557: FILE: include/linux/usb/xhci-sideband.h:35:
> +	struct mutex			mutex;
>
> WARNING: 'straightfoward' may be misspelled - perhaps 'straightforward'?
> #22:
> straightfoward, as the ASoC components have direct references to the ASoC
> ^^^^^^^^^^^^^^
> CHECK: Unnecessary parentheses around 'card == sdev->card_idx'
> #142: FILE: sound/soc/qcom/qdsp6/q6usb.c:217:
> +	if ((card == sdev->card_idx) &&
> +		(pcm == sdev->ppcm_idx[sdev->num_playback - 1])) {
>
> CHECK: Unnecessary parentheses around 'pcm ==
> sdev->ppcm_idx[sdev->num_playback - 1]'
> #142: FILE: sound/soc/qcom/qdsp6/q6usb.c:217:
> +	if ((card == sdev->card_idx) &&
> +		(pcm == sdev->ppcm_idx[sdev->num_playback - 1])) {
>
> WARNING: 'seqeunces' may be misspelled - perhaps 'sequences'?
> #8:
> seqeunces.  This allows for platform USB SND modules to properly initialize
> ^^^^^^^^^
>
> WARNING: 'exisiting' may be misspelled - perhaps 'existing'?
> #12:
> exisiting parameters.
> ^^^^^^^^^
>
> CHECK: Please use a blank line after function/struct/union/enum declarations
> #1020: FILE: sound/usb/qcom/usb_audio_qmi_v01.h:98:
> +};
> +#define QMI_UAUDIO_STREAM_REQ_MSG_V01_MAX_MSG_LEN 46
>
> CHECK: Please use a blank line after function/struct/union/enum declarations
> #1054: FILE: sound/usb/qcom/usb_audio_qmi_v01.h:132:
> +};
> +#define QMI_UAUDIO_STREAM_RESP_MSG_V01_MAX_MSG_LEN 202
>
> CHECK: Please use a blank line after function/struct/union/enum declarations
> #1081: FILE: sound/usb/qcom/usb_audio_qmi_v01.h:159:
> +};
> +#define QMI_UAUDIO_STREAM_IND_MSG_V01_MAX_MSG_LEN 181
>
> CHECK: Macro argument 'n' may be better as '(n)' to avoid precedence issues
> #100: FILE: sound/usb/mixer_usb_offload.c:19:
> +#define PCM_IDX(n)  (n & 0xffff)
>
> CHECK: Macro argument 'n' may be better as '(n)' to avoid precedence issues
> #101: FILE: sound/usb/mixer_usb_offload.c:20:
> +#define CARD_IDX(n) (n >> 16)
>
