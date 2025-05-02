Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTP id 13C34AB7F3C
	for <lists+alsa-devel@lfdr.de>; Thu, 15 May 2025 09:51:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 99D1D61535;
	Thu, 15 May 2025 09:23:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 99D1D61535
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1747293833;
	bh=/47+sMA0JkyFBnR95B9nb3p/4mhJHYfJBzwuNp3cdaU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=TAxe5Dug6Da+PFdh8tRUkdUEDTvBxcW31+RFB+xOm0ck5sx7+MmnNvopFUBK1AE3R
	 flt3cqj+SwqM0OGXaIbkeFbNrZkiQwL5LhacAD03kfztwFDxkSoMK4IFwMA0jHAGiL
	 KB+MQI2McKc3G4X0xDytSfcjASVDuXTcgdu/O3WI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9AEB2F897FF; Sun, 11 May 2025 16:32:54 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 80383F897DE;
	Sun, 11 May 2025 16:32:54 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F147AF8F17E; Fri,  2 May 2025 13:06:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id F113CF8F0A3
	for <alsa-devel@alsa-project.org>; Fri,  2 May 2025 13:06:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F113CF8F0A3
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256
 header.s=qcppdkim1 header.b=lk/jsNsU
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id
 5421Munx015015
	for <alsa-devel@alsa-project.org>; Fri, 2 May 2025 11:06:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	n1zoogZ0mW4AaQa7oJlvbkJUvuNkb6MBNOT54+2ShgI=; b=lk/jsNsUuvJn+oUC
	GUrJtP8ak2oQDXtsr3fqw3ytUMcaQATxpYZZQuaLM7TtfKTa4GQjwjIkkO4UXJWK
	XW8qMwUyc8y/PnUCV/YYfmXxe/k/EEsjJeayFdapxHnYk+sG5pqh5VPrAiMxckrd
	Z4tHWhFXS5vE4pl08Y0+1z/Pgg3Eq48idLLLP0jtfTcfbO7fVIpF+s697usd5eA0
	QNlhh4Ys+9pzC1eMIgenRcRnX50RQ40r97JqnI5rJvyV5pAkOXB6i25al8MbnsSE
	XeZ/H/P9wsdJqLh0dXGiu2fssuq8LexUWUiy0BQaRW7JUl12H/EhWUeH0/DPT7UL
	ug8a6Q==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46b6ub00bd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <alsa-devel@alsa-project.org>; Fri, 02 May 2025 11:06:49 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-7c5c9abdbd3so188546685a.1
        for <alsa-devel@alsa-project.org>;
 Fri, 02 May 2025 04:06:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746184009; x=1746788809;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=n1zoogZ0mW4AaQa7oJlvbkJUvuNkb6MBNOT54+2ShgI=;
        b=KtwWotmvmD6RppPAutzgmvT1uURDwCllfp2b8pzJ21tgPYC+30m01TdnCVTDcfPYPz
         tXlMoW63VSW3obyKCe+YiwgsFhIpozp8QUptObilKOo4n6jsx/jOKO/AapQxX3X/GCeJ
         EmOPhgVO0KdewvAUeHzJWeOnbe8gnnTgeIgreExY37w8vLuf253tFA0/QhoxkjbOcFgp
         i80Men3IbwGHcpRWmDXZ38psMOI948a05LUXQKlTDPss2+Y+95witoVhf0TeRv9SUDoZ
         bjQFcOdjXDKrd4y/Oohtmy6cWWIpB+lBG9zbOgRzMkezHlEFNM1xRbh0KFeUt/nX8jTn
         HmUQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXT/Ug2LChLslREO2ymSujmYzSgbMOu/7ASmppg5RozZyMdso3MrLh31H3scAufNDg4FBa+b0V3DuWq@alsa-project.org
X-Gm-Message-State: AOJu0Yxo6qjazrbVRn63FXjl6GGHEbYbCQNi1wB5W6olPSncWlpo0rNQ
	1tTpkrkZ5X6AAncl5OfMPAQ5aUXYSzoso32EZxxrY8yHssMdNOoJ75aktuXcxL1b77PlHtLONcm
	vbji61QGP8UVHVHwePecCV/Y3xfVnVcNHpSWrziqw684Xt1vYkYiaAy1mHd7i6Q==
X-Gm-Gg: ASbGncswj545EfKtH3TL5N4s+AsBg1Vr7D/WxZ+kZkClxlroEQ/wdZDkctrAYvTjsdN
	MoC+egPdNzjZbAcz7P+wHY2H9FT5Z9TNPPIvDjoFvHKFHQwCwJGrXwVb+XW/gY8OcAq9dh1xS4m
	RaY58ReijAGC0rYlR2dwGevCoNf5TN/n99TzzIp/eu3eUugPJr62Ypza6MzbhFd1RkdZzc6dcdi
	+EQtxHuylKEfvhCztWgzWi5XD72c13vzbXtV4yNJQzxt8Hyx6hb8zK702AXEVf9Vue7iYAVVW3y
	wmWrRYKplEKdcK/31QIfvdP7vlwO8ZC7HbYURQ==
X-Received: by 2002:a05:620a:440c:b0:7ca:ca21:23d9 with SMTP id
 af79cd13be357-7cad5b1e908mr391000285a.7.1746184009078;
        Fri, 02 May 2025 04:06:49 -0700 (PDT)
X-Google-Smtp-Source: 
 AGHT+IFxEfw/oGZXNbT+wq9xh4TIiYE0dP+RWQJIzPOf851X459NKI0wxZw1jeI309e25HlZlax9AQ==
X-Received: by 2002:a05:620a:440c:b0:7ca:ca21:23d9 with SMTP id
 af79cd13be357-7cad5b1e908mr390992385a.7.1746184008501;
        Fri, 02 May 2025 04:06:48 -0700 (PDT)
Received: from [192.168.68.119] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id
 ffacd0b85a97d-3a099ae7afesm1820418f8f.47.2025.05.02.04.06.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 May 2025 04:06:48 -0700 (PDT)
Message-ID: <0d094cec-0a2e-4e21-845f-977f3a77993d@oss.qualcomm.com>
Date: Fri, 2 May 2025 12:06:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/5] ASoC: qcom: sm8250: set card driver name from
 match data
To: Luca Weiss <luca@lucaweiss.eu>, ~postmarketos/upstreaming@lists.sr.ht,
        Srinivas Kandagatla <srini@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>
Cc: Banajit Goswami <bgoswami@quicinc.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, phone-devel@vger.kernel.org,
        alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org,
        linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Neil Armstrong <neil.armstrong@linaro.org>
References: <20250425-fp5-dp-sound-v3-0-7cb45180091b@fairphone.com>
 <20250425-fp5-dp-sound-v3-2-7cb45180091b@fairphone.com>
 <aBNdCRk_fP2q1vxQ@srini-hackbase>
 <91110CA9-6E83-4811-AA04-C0312B99B95E@lucaweiss.eu>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <91110CA9-6E83-4811-AA04-C0312B99B95E@lucaweiss.eu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: RZU3oaaY6V9fqHVxIJePpEm8W88rsDyL
X-Authority-Analysis: v=2.4 cv=KtlN2XWN c=1 sm=1 tr=0 ts=6814a749 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=KKAkSRfTAAAA:8 a=6H0WHjuAAAAA:8
 a=-0JhTq91CruwOFu3ng0A:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
 a=cvBusfyB2V15izCimMoJ:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-ORIG-GUID: RZU3oaaY6V9fqHVxIJePpEm8W88rsDyL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTAyMDA4NyBTYWx0ZWRfX7RZqfJvoBdAZ
 pjEG1npXTmrbMBrZ8BjWPdiYiFdq03LsQ0tO0MZe913EcBkjtmcTSle6wumyyO2HFhvFLZ425D0
 6xZjH4IkbBQH10mOK2q8aNewJW93qpZtKm/NQyaVL6zfMv/cDOUtkniyCFPmq3lJqrRS+2kxkgz
 fEih3d9kFrMjoGBwTQQKdzo2U6fzoxqPc4b6r8PE2f/6a2BlzUPMqHWeBNC/avgSqq0mYXvv2vZ
 lRtpcAbMrCES8li9pcIbi718lHytEkiQ4gV9uI819hUrnk/p+bRLNxBn85sr/HZlB+rj0v6AVr3
 qcWFeK+JAYRVkbkjoyk2raC5inWy056g3t3eYdZq2IaOdqLJtWOxoozN+B1nWesIjbzPss2bkdG
 4nRXHDWrUL4Hgx9cOvAbY6ZR8dmElb9V3oaSb08zpvelJNcVWKG5YbRRmBHuuiCtChJjadoK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-02_01,2025-04-30_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 suspectscore=0
 lowpriorityscore=0 phishscore=0 adultscore=0 priorityscore=1501
 malwarescore=0 mlxscore=0 bulkscore=0 mlxlogscore=999 spamscore=0
 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505020087
X-MailFrom: srinivas.kandagatla@oss.qualcomm.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: XD3K2RJZYDPK3MBSE35N2H233Z6YY54I
X-Message-ID-Hash: XD3K2RJZYDPK3MBSE35N2H233Z6YY54I
X-Mailman-Approved-At: Sun, 11 May 2025 14:32:48 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/XD3K2RJZYDPK3MBSE35N2H233Z6YY54I/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 5/1/25 15:13, Luca Weiss wrote:
> Hi Srini,
> 
> Srinivas Kandagatla <srini@kernel.org> schreef op 1 mei 2025 13:37:45 CEST:
>> On Fri, Apr 25, 2025 at 10:07:26AM +0200, Luca Weiss wrote:
>>> Sound machine drivers for Qualcomm SoCs can be reused across multiple
>>> SoCs. But user space ALSA UCM files depend on the card driver name which
>>> should be set per board/SoC.
>>>
>>> Allow such customization by using driver match data as sound card driver
>>> name.
>>>
>>> Also while we're already touching these lines, sort the compatibles
>>> alphabetically.
>>>
>>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>>> Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
>>> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
>>> ---
>>>  sound/soc/qcom/sm8250.c | 9 ++++-----
>>>  1 file changed, 4 insertions(+), 5 deletions(-)
>>>
>>> diff --git a/sound/soc/qcom/sm8250.c b/sound/soc/qcom/sm8250.c
>>> index b70b2a5031dfbf69024666f8a1049c263efcde0a..e920b413b762c803cfcc4049f35deba828275478 100644
>>> --- a/sound/soc/qcom/sm8250.c
>>> +++ b/sound/soc/qcom/sm8250.c
>>> @@ -16,7 +16,6 @@
>>>  #include "usb_offload_utils.h"
>>>  #include "sdw.h"
>>>  
>>> -#define DRIVER_NAME		"sm8250"
>>>  #define MI2S_BCLK_RATE		1536000
>>>  
>>>  struct sm8250_snd_data {
>>> @@ -200,15 +199,15 @@ static int sm8250_platform_probe(struct platform_device *pdev)
>>>  	if (ret)
>>>  		return ret;
>>>  
>>> -	card->driver_name = DRIVER_NAME;
>>> +	card->driver_name = of_device_get_match_data(dev);
>>>  	sm8250_add_be_ops(card);
>>>  	return devm_snd_soc_register_card(dev, card);
>>>  }
>>>  
>>>  static const struct of_device_id snd_sm8250_dt_match[] = {
>>> -	{.compatible = "qcom,sm8250-sndcard"},
>>> -	{.compatible = "qcom,qrb4210-rb2-sndcard"},
>>> -	{.compatible = "qcom,qrb5165-rb5-sndcard"},
>>> +	{ .compatible = "qcom,qrb4210-rb2-sndcard", .data = "sm8250" },
>>
>> sm4250 for rb2?
> 
> Since this name is visible to user space and used for picking the UCM config, I don't think it's a good idea to change it.
> 
It is not correct to pretend that rb2 is sm8250 for ucm cases, I agree previous code was
already doing this, Good thing is that we do not have a ucm written yet for RB2.

Lets fix this as you are already doing this for other compatibles.

--srini

> Regards
> Luca
> 
>>
>>> +	{ .compatible = "qcom,qrb5165-rb5-sndcard", .data = "sm8250" },
>>> +	{ .compatible = "qcom,sm8250-sndcard", .data = "sm8250" },
>>>  	{}
>>>  };
>>>  
>>>
>>> -- 
>>> 2.49.0
>>>

