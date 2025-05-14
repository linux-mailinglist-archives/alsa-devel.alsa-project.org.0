Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6572DAB7FD3
	for <lists+alsa-devel@lfdr.de>; Thu, 15 May 2025 10:08:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9778C65978;
	Thu, 15 May 2025 10:07:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9778C65978
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1747296478;
	bh=W2lPWkK0xtLvB6EVRo0hijyvktlOgtLlUSX5Erkw4Ns=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=C/2iXSD/hPibGwMtl8cCrUImzeOfXau6TDdqTXfpfg5h6Y4PeXiA6uPMw6kLG9LLg
	 hsJjQoEwLCmuh3RQjX6GhFbfHa4yPcQCJY7y63WhUyH86TCj4dOFPr8fnIEskYEeth
	 i4zvVKIeZaTFnFTfIWV9KibK2MGq9mHtOcjgEN44=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 86475F89C1E; Wed, 14 May 2025 20:03:13 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 64C5CF89C13;
	Wed, 14 May 2025 20:03:13 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AF7FEF8063D; Wed, 14 May 2025 08:42:50 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id A542CF8063B
	for <alsa-devel@alsa-project.org>; Wed, 14 May 2025 08:42:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A542CF8063B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256
 header.s=qcppdkim1 header.b=FkY7rKVA
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id
 54E1ck9a008618
	for <alsa-devel@alsa-project.org>; Wed, 14 May 2025 06:42:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JE3ywahSgKeZLLk2eR+4hbG6tcJpuko/WfGL5GE2avk=; b=FkY7rKVAQBZQLgGs
	hhYD/mzVaCZ9Y52SZvnHOGxHF6AcOAp3ICdjiGOCzb6gUldH4k7bEu7OEWVwF++J
	U1objVR9edQ5PBMw91kobQbrTa7PmqtO+jGNbXJ4RKI7Ujo2KcWXN2QrdGFIxbPd
	JIFejx5Bq8I/PKX9fGnxLkFIvQ7PmUOOcaudB2v3SxFbC6j3c969KHmKpVarR3X6
	yEDKjkDNlfQbqBqXdLnZfZMlsKEL7b26HBn84gxIwAmjsN2lI04JIDwSbTXwuBaj
	dN9GfLwFA0nDJY0f6kBeqpl7i5zH2Y7yagE8FlII+liBhFsubUHdWo4IP/dKkWRr
	IPK3GQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46mbcr1n90-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <alsa-devel@alsa-project.org>; Wed, 14 May 2025 06:42:45 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-7cabd21579eso762944285a.3
        for <alsa-devel@alsa-project.org>;
 Tue, 13 May 2025 23:42:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747204965; x=1747809765;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JE3ywahSgKeZLLk2eR+4hbG6tcJpuko/WfGL5GE2avk=;
        b=mEpPBGiTv4CMFc2JxlEB+yA/QVU28gWEM4hubbnkm3VgjhRD6dUFIrMDhevfw39J8I
         dlcOixV987Zl87wSOXfAPIpmBErKGGdICdbd0cA3Ri8XZcaRnWKq1n4XPJB3STVVgK3B
         Rt47sEYsArnhEqcQ5n+VSmvlSa5XhjUVsiv9tlmPOTX39MbrcrncUl2GS/7nOVmyTCGB
         kFpvblQQUNccC/p4BcDLf9OpSHURG2UFOhJElUvX1v40KtsfMY87XGpS8HcfCmvkb1Rs
         CH3K+TZWaKoq2iPVC1LrNOJhlP7SZqit6VGSJfiHKCthlRYLeN21Wa7Y5AmYzu4IX1TI
         dyrA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWDrTIRqcJhiK9JydyKlKCF0fim5VQcMRsO5Z9/uqXGWrMWXatg7Fo/LcVIktugT05CrYyaUy1AdHjO@alsa-project.org
X-Gm-Message-State: AOJu0YyiGfcx34s80y8c/haEroBy+mKxnNQ+t7JpGCXKKmj2Y3B4GSZF
	hg3ABTq/nh8aOxMQSbhsQ6rJk6aJg8oJ7mPksCEFlZn8qPAlut4vNX6JzsLNOwtz56KQEBJBu+y
	EKFALXpQBvtrS6jRDuWop4TBXkkti7OpLC1klWzFXVI7LMNCeYhh3/5E2FVvB4w==
X-Gm-Gg: ASbGncuD2ekhQ+7uY1YcM+t4UXGTMdFBKuHFO4Lbsq0LbWUSL4aBHQiTO8iR2COwHwj
	STpimnk5iRyBTjCBlFQKaowduOkAbrF/wZOsxfC8QRBasLrCg+dLwXrL5QKJP1Xj8tc7xK8vLxl
	eFGrA0PwgL1WJUZqDPCnEKBDFHtbDqNHLLwH6lDfS4fVrdvLBflFumKJbLqXwvwDtvrOsri2eX2
	UFA9sGAxi5OBpXDm7ZTxqnyCwV+n9YQ07JcIKeNIL2LHGzIQt0W62HGyYNpd8ge2FoAPW/cRpu7
	w0uOjh5T9oBlBqO196RkzFdCEvbhLP3xxibS9RzhMHQNZ8pB6S/kYTJ8HL8iHA==
X-Received: by 2002:a05:620a:179f:b0:7ca:c6c7:be14 with SMTP id
 af79cd13be357-7cd287def2fmr311052685a.1.1747204965148;
        Tue, 13 May 2025 23:42:45 -0700 (PDT)
X-Google-Smtp-Source: 
 AGHT+IE/TX+EOyLGPx3RCZxzUdd7gY67Jbmj+T3fCNfY8HTMGXEWyH6YEm+X+YAuMYfMaxiKp8G7Lw==
X-Received: by 2002:a05:620a:179f:b0:7ca:c6c7:be14 with SMTP id
 af79cd13be357-7cd287def2fmr311048785a.1.1747204964660;
        Tue, 13 May 2025 23:42:44 -0700 (PDT)
Received: from [10.61.1.19] (110.8.30.213.rev.vodafone.pt. [213.30.8.110])
        by smtp.googlemail.com with ESMTPSA id
 ffacd0b85a97d-3a1f5a4d0dbsm18271702f8f.88.2025.05.13.23.42.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 May 2025 23:42:44 -0700 (PDT)
Message-ID: <ee60c802-f4b6-4d0d-9c0d-b16ab732e6c5@oss.qualcomm.com>
Date: Wed, 14 May 2025 07:42:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/5] ASoC: qcom: sm8250: set card driver name from
 match data
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
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Neil Armstrong <neil.armstrong@linaro.org>
References: <20250507-fp5-dp-sound-v4-0-4098e918a29e@fairphone.com>
 <20250507-fp5-dp-sound-v4-2-4098e918a29e@fairphone.com>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <20250507-fp5-dp-sound-v4-2-4098e918a29e@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: noMToo1n30c6sWlOke3-I-ljA3szpK8E
X-Authority-Analysis: v=2.4 cv=Auju3P9P c=1 sm=1 tr=0 ts=68243b66 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=mS7wm7roH4dnaGY2uMEGzA==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=6H0WHjuAAAAA:8 a=WerGdG9rmgDbcAo0O2AA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=cvBusfyB2V15izCimMoJ:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-GUID: noMToo1n30c6sWlOke3-I-ljA3szpK8E
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE0MDA1NyBTYWx0ZWRfXyAwDdvOV076z
 DqyltCv+NtwJ0zyJbL7WphiI9pg5zaSldX+NvAUcmPVcmChy0iOJfiYVTz4fsKYopY8+/rvojzy
 xHD6oRgWtLblYWRvkOZ1sNQGWBnzZzX6/VwtzbWOWRYx2FwmPT0R/a81elV1vf+bf4OJfdoDIyO
 8mb7J1vVTf21GbAorGYgNjMCSjfCSnnRwQFlV7BxE4ZT70H1Dx0tzkWZ44L8omBctfcn8rK6Tp6
 Sx82AD2E6Mv+Uj7Ga0ebw01euke+HESjqlUfSNb56Wo8WckQC6g7bVzqAUQTeh80OP5Tyhysy1Z
 LL/t8XwvafO1OYixX9slgOZljuQIpjXluzmwolEhcp1l5jl2glUyOvsKR6xc/L7q6nUe+n7d6Zg
 lY76vVem2yz0VMVngfGWE3wTAaeNCubKgY0MdH79NZWiI+HUrDkeSVxQYtI51iNQhnRJetZZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-14_02,2025-05-14_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 spamscore=0 impostorscore=0 lowpriorityscore=0
 malwarescore=0 mlxscore=0 adultscore=0 priorityscore=1501 mlxlogscore=999
 phishscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505140057
X-MailFrom: srinivas.kandagatla@oss.qualcomm.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: 6XRXLULQVCHTXYW4D5CSDQ74JLUNOHLI
X-Message-ID-Hash: 6XRXLULQVCHTXYW4D5CSDQ74JLUNOHLI
X-Mailman-Approved-At: Wed, 14 May 2025 18:03:10 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6XRXLULQVCHTXYW4D5CSDQ74JLUNOHLI/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 5/7/25 09:01, Luca Weiss wrote:
> Sound machine drivers for Qualcomm SoCs can be reused across multiple
> SoCs. But user space ALSA UCM files depend on the card driver name which
> should be set per board/SoC.
> 
> Allow such customization by using driver match data as sound card driver
> name. The QRB4210 RB2 gets its name set to "sm4250" as requested by
> Srinivas Kandagatla, and since no (known) UCM has been written yet this
> should not break anything.
> 
> Also while we're already touching these lines, sort the compatibles
> alphabetically.
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>

Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>

> ---
>  sound/soc/qcom/sm8250.c | 9 ++++-----
>  1 file changed, 4 insertions(+), 5 deletions(-)
> 
> diff --git a/sound/soc/qcom/sm8250.c b/sound/soc/qcom/sm8250.c
> index b70b2a5031dfbf69024666f8a1049c263efcde0a..f0d83a843765d8dcdd51569e7cbc95eb72292497 100644
> --- a/sound/soc/qcom/sm8250.c
> +++ b/sound/soc/qcom/sm8250.c
> @@ -16,7 +16,6 @@
>  #include "usb_offload_utils.h"
>  #include "sdw.h"
>  
> -#define DRIVER_NAME		"sm8250"
>  #define MI2S_BCLK_RATE		1536000
>  
>  struct sm8250_snd_data {
> @@ -200,15 +199,15 @@ static int sm8250_platform_probe(struct platform_device *pdev)
>  	if (ret)
>  		return ret;
>  
> -	card->driver_name = DRIVER_NAME;
> +	card->driver_name = of_device_get_match_data(dev);
>  	sm8250_add_be_ops(card);
>  	return devm_snd_soc_register_card(dev, card);
>  }
>  
>  static const struct of_device_id snd_sm8250_dt_match[] = {
> -	{.compatible = "qcom,sm8250-sndcard"},
> -	{.compatible = "qcom,qrb4210-rb2-sndcard"},
> -	{.compatible = "qcom,qrb5165-rb5-sndcard"},
> +	{ .compatible = "qcom,qrb4210-rb2-sndcard", .data = "sm4250" },
> +	{ .compatible = "qcom,qrb5165-rb5-sndcard", .data = "sm8250" },
> +	{ .compatible = "qcom,sm8250-sndcard", .data = "sm8250" },
>  	{}
>  };
>  
> 

