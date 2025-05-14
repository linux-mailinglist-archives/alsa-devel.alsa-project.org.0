Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 054AFAB7FD0
	for <lists+alsa-devel@lfdr.de>; Thu, 15 May 2025 10:08:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 559C862F9B;
	Thu, 15 May 2025 10:07:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 559C862F9B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1747296466;
	bh=t6oieiC6PkmHUBT5J/m/ariSEMtMKZPl7YTPtb1Qy+8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=uHuPDx6WvaROL/SQOjsEmG6t8+lQD8BghOweeafqPNqtVxqVpaNCIBD7uWqBmwLs+
	 A7ALbKE1CxDHIr6kMw24b8hm8z773LXmk7bYpk0DNvNL4QqSE+Qv4PQOYs2kD5C9Q3
	 89mbrTLg96720okWEtWGEmkVn6e76bBOMpd6nFqI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 73831F89C48; Wed, 14 May 2025 20:03:14 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 15408F89C3D;
	Wed, 14 May 2025 20:03:14 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AF81BF8064F; Wed, 14 May 2025 08:43:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,RCVD_IN_VALIDITY_SAFE_BLOCKED,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C0BD7F8063D
	for <alsa-devel@alsa-project.org>; Wed, 14 May 2025 08:43:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C0BD7F8063D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256
 header.s=qcppdkim1 header.b=ODUBxBGC
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id
 54E2JKHS025908
	for <alsa-devel@alsa-project.org>; Wed, 14 May 2025 06:43:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1+kTWHR6Q/nKIsQr5M8KaRL7ZteEdh3CROcFdHwMXPY=; b=ODUBxBGC3ip4iDDR
	qArtlQ7am/X45/1LBoNrBWnK6VRqXHKfPncnRFigXBAG6d4mfQJaTMHu09duID8C
	qNFrL0A0+n28pd5X3ynfKJIVjOaJ7z3m5yrEloSiUecOrm3otoBJuSVQS2S2wyTD
	E5DSypKc3cxiGgWB2DNOrNYYVE+zPpHLkocgDKadNoc290V+JFExWLGjOnES8FRt
	Yeu0y+mQoGjmcEgLesJdOAov1Hl5ki6SKEDa2Td7T03w6V2ltAwA8HBxIW53k4Sh
	Ndlv8176VxptKF1xb5cnLe57g3qXX93y/ECF02ewYMWYVqWcxRwHWvqES91pnsme
	t5C5iQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46mbew1nwf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <alsa-devel@alsa-project.org>; Wed, 14 May 2025 06:43:35 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-7c7c30d8986so2095335385a.2
        for <alsa-devel@alsa-project.org>;
 Tue, 13 May 2025 23:43:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747205014; x=1747809814;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1+kTWHR6Q/nKIsQr5M8KaRL7ZteEdh3CROcFdHwMXPY=;
        b=OGIz7gRWe61X2umr7uKWHKsJHIyoJ5EHcLFaS2ulyIFboDrBSMCPjNsuqkpilsbBgJ
         LUWV8ULmlGSFr0OjVLWP5cMGousmZWPoaBJDQLnc8VnS3HG4vcLqHipRefuJBsq9ydUx
         U4Oku6KsRyty5g0h3UDjiT0TrSZPqzh1hOzgdgjplNqwGV7KmIA59WAyhQrsN+IAnERh
         bUcbZ3Jd1BnO/Yetf8HWB39Mc/7k4tjnZAoqrdNUZ27GvmtBqZqQ6PzGAuQDzfJcPds4
         3TjBk7RQMu6pxT2CP6apO7upK1ZyuoFxXV1GgJjvtZGbmdHxVqaNdGl3qaCcF+waAzrd
         VfPA==
X-Forwarded-Encrypted: i=1;
 AJvYcCX3mSgQrrYJiLd9qNESvg20udVu/nJ65en7BVOb+pDN+K3k9Mn3qzgSqsKBCzUcGdH639UMrH8l8ZK4@alsa-project.org
X-Gm-Message-State: AOJu0YztBpQy9MFf2keG7BY/eOl6vUCMLwGsyj+17EZCgguuqo2kc9H4
	PUl31TSwwar89HZKGQG/wJJWyu+XlEFb8jpEYnKlG84599YFz5qiVq7+GTkBSJNLR6Jrhqud759
	qrN/tjvLRge5lKlhh4FEJRyFewr47dYwA9JOjyrOyFZTIkDapUhZv6XcpHVqYjg==
X-Gm-Gg: ASbGncsvYASRdRrodJD6HiwRLgzUtz4CN2ebOhhHzoXWFpTeWngKtCcZHe7j54Z/nZ9
	473ckeyPLxhSwDMZE5UXhMmunnnWdM3xiNs3mNIXU8poydoq51P/fDOqqh5/MHiN1pmyU4F8+7C
	BVlO9UB9+pfdidAEikOofd1jAG7/dH+ivfCl/HUcYmVo94/KU3AN6pbe1w1ll32NnaG5RCUQOkH
	3YrQe4yreuYXJf/8LpzQrGJXSbnFRC4oMNQs7jtzN8WWsi6MFGn43mxyYtTLshoX6PoujdzNxXg
	DgZJz0LLPG848XC85/8Vbmmpu/NkZO68Q2cLGrMOWGAd5mZs7FJUJf0YcCHB6A==
X-Received: by 2002:a05:620a:4156:b0:7c5:6df2:b7a5 with SMTP id
 af79cd13be357-7cd287f9650mr287541085a.29.1747205014570;
        Tue, 13 May 2025 23:43:34 -0700 (PDT)
X-Google-Smtp-Source: 
 AGHT+IGCYe0F7XxHWYbhu7NVkdrepacB2uWQjdlsK87LfnyU0uT99TRX1IkmjHkIXO+a5nsoJ1a2jw==
X-Received: by 2002:a05:620a:4156:b0:7c5:6df2:b7a5 with SMTP id
 af79cd13be357-7cd287f9650mr287539785a.29.1747205014272;
        Tue, 13 May 2025 23:43:34 -0700 (PDT)
Received: from [10.61.1.19] (110.8.30.213.rev.vodafone.pt. [213.30.8.110])
        by smtp.googlemail.com with ESMTPSA id
 ffacd0b85a97d-3a1f57ddfc9sm18334688f8f.5.2025.05.13.23.43.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 May 2025 23:43:33 -0700 (PDT)
Message-ID: <bd36e7e3-480a-4876-98b9-73af8298ff50@oss.qualcomm.com>
Date: Wed, 14 May 2025 07:43:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/5] ASoC: qcom: sm8250: add DisplayPort Jack support
To: Luca Weiss <luca.weiss@fairphone.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Banajit Goswami <bgoswami@quicinc.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org,
        linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20250507-fp5-dp-sound-v4-0-4098e918a29e@fairphone.com>
 <20250507-fp5-dp-sound-v4-3-4098e918a29e@fairphone.com>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <20250507-fp5-dp-sound-v4-3-4098e918a29e@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: glwZlJt5-FPMxKXlfxq4_8G96xCVFkhW
X-Proofpoint-ORIG-GUID: glwZlJt5-FPMxKXlfxq4_8G96xCVFkhW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE0MDA1NyBTYWx0ZWRfX62aEPTt+NlIJ
 jcW4bBwYjcgzb6qsvQ7IGZTHDsPQr3fLSGndmJq/c1ooNMVSYDFKHuFV3SnUXWp4I9FWVPghq1a
 +uHzJvDBmKrvxmVgHN+InrbsANg1p7U2jL54mt+F6UsUJe+6BX0Pe50r/R/8yRk5UWwysOnjZfd
 PZfqi/I28NDmTZ2V02X5EOXD3tr36SHzq7RfutTKUDh+/exBbFhvR6CxVM2BwiW2pGWbaHz0N/X
 mUtb/GeBcpBHhSPK2MRQNPKtRhEBSHg/n8SCSJ8MOApusKWLZb/65RAssSi6Y+0+/DmV8nKY/pz
 ng0mjx+nxMp0Fe4RclvNd4pxYiWoP8LPtFXS2WmdL6f11kLx96VEsSU+Fjm6l49YZvdHJLkycH6
 QHsWAmitRNYYMw2/W32Gxtd7gZNP1nSTXBlccUxyhtVAKOZGGp4DAtkFVeDfAGeBBKP1PpV/
X-Authority-Analysis: v=2.4 cv=LOFmQIW9 c=1 sm=1 tr=0 ts=68243b97 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=mS7wm7roH4dnaGY2uMEGzA==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=6H0WHjuAAAAA:8
 a=uaetQlgIYQjjGCg3SJwA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-14_02,2025-05-14_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 adultscore=0 priorityscore=1501 suspectscore=0
 mlxscore=0 malwarescore=0 mlxlogscore=999 impostorscore=0 bulkscore=0
 clxscore=1015 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505140057
X-MailFrom: srinivas.kandagatla@oss.qualcomm.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: FCY72BQJDOI5VX46WHGVNIGIDQVMKYL7
X-Message-ID-Hash: FCY72BQJDOI5VX46WHGVNIGIDQVMKYL7
X-Mailman-Approved-At: Wed, 14 May 2025 18:03:10 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/FCY72BQJDOI5VX46WHGVNIGIDQVMKYL7/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 5/7/25 09:01, Luca Weiss wrote:
> Add support for DisplayPort Jack events, so that user space can
> configure the audio routing correctly.
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>

Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
> ---
>  sound/soc/qcom/sm8250.c | 17 ++++++++++-------
>  1 file changed, 10 insertions(+), 7 deletions(-)
> 
> diff --git a/sound/soc/qcom/sm8250.c b/sound/soc/qcom/sm8250.c
> index f0d83a843765d8dcdd51569e7cbc95eb72292497..2317fe285ee7d41689d7fac453164fbe706744ff 100644
> --- a/sound/soc/qcom/sm8250.c
> +++ b/sound/soc/qcom/sm8250.c
> @@ -25,6 +25,7 @@ struct sm8250_snd_data {
>  	struct snd_soc_jack jack;
>  	struct snd_soc_jack usb_offload_jack;
>  	bool usb_offload_jack_setup;
> +	struct snd_soc_jack dp_jack;
>  	bool jack_setup;
>  };
>  
> @@ -32,14 +33,16 @@ static int sm8250_snd_init(struct snd_soc_pcm_runtime *rtd)
>  {
>  	struct sm8250_snd_data *data = snd_soc_card_get_drvdata(rtd->card);
>  	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
> -	int ret;
>  
> -	if (cpu_dai->id == USB_RX)
> -		ret = qcom_snd_usb_offload_jack_setup(rtd, &data->usb_offload_jack,
> -						      &data->usb_offload_jack_setup);
> -	else
> -		ret = qcom_snd_wcd_jack_setup(rtd, &data->jack, &data->jack_setup);
> -	return ret;
> +	switch (cpu_dai->id) {
> +	case DISPLAY_PORT_RX:
> +		return qcom_snd_dp_jack_setup(rtd, &data->dp_jack, 0);
> +	case USB_RX:
> +		return qcom_snd_usb_offload_jack_setup(rtd, &data->usb_offload_jack,
> +						       &data->usb_offload_jack_setup);
> +	default:
> +		return qcom_snd_wcd_jack_setup(rtd, &data->jack, &data->jack_setup);
> +	}
>  }
>  
>  static void sm8250_snd_exit(struct snd_soc_pcm_runtime *rtd)
> 

