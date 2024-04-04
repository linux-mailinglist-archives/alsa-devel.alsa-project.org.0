Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D71B3898F27
	for <lists+alsa-devel@lfdr.de>; Thu,  4 Apr 2024 21:42:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F383F2CE7;
	Thu,  4 Apr 2024 21:42:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F383F2CE7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1712259751;
	bh=aVZcAkeixF4g7qxwWjpSl0cSU4/81MEvk4V1zf7bPjc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=DnEP9iMV5RhRwv78onDBV0q4Cny0U9Wg6ei1Jt2FYqoqwebXUkrKXpY+V+Gf2L/0g
	 Oz2H5Eug5B35+wQUF1XLvPzy43IQAzXv0nlX1kQTbb9PP/xSDTTwXIWBeBZ00qCeZe
	 FTSQCmRvSgEBAY3ePzjUFafLC97fuXVjT7SCPJ+k=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 99038F8058C; Thu,  4 Apr 2024 21:41:59 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2D90CF805A0;
	Thu,  4 Apr 2024 21:41:59 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 58F35F8020D; Thu,  4 Apr 2024 21:41:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [IPv6:2a00:1450:4864:20::236])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 67ED1F80130
	for <alsa-devel@alsa-project.org>; Thu,  4 Apr 2024 21:41:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 67ED1F80130
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=ArK3/E4E
Received: by mail-lj1-x236.google.com with SMTP id
 38308e7fff4ca-2d85da5a7d1so6665791fa.0
        for <alsa-devel@alsa-project.org>;
 Thu, 04 Apr 2024 12:41:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712259703; x=1712864503;
 darn=alsa-project.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hk29yQ8J33vjFT2n+Z8izmlALMtAMOY/5K09yHLiz2A=;
        b=ArK3/E4EVcNbcIOFnJYzX59fCgS33MSH7cTIwYnI3wpjqDG/6yIj9CT7tbeekdChEq
         DhwFdF7wOZY56jcnLCq7iYoKMyKFrocUqbuHvXaF+RBv+37ajsY+82oA0tdX9exgxE1x
         662WSqIJDck6CEQCJjnYihMczHN+mzgCtv07Z16/UL89ZJ/uxLCmmDw/r4AXTPgog4EG
         DlmATDNxrfZABnPr/7IwXqszpdhFGSTjxhq5F/48OduYsaACh7BlvxICWCNTnVlK2ZEo
         cfSuxmelRHaBehlzIM1T+W5zn+zj1P1u1/l9zX+gvrAb9tiOGo8qa/oxqhDU06BNrzmV
         96dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712259703; x=1712864503;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hk29yQ8J33vjFT2n+Z8izmlALMtAMOY/5K09yHLiz2A=;
        b=tVUOs+WzElX1CRJ5jXNuC39JeH7J4kFYyjWq6pXY9gkGsiZye2O3Z0lZu/Fs9DLr75
         iTBCfrsIzvX4OEtvGW5gJLpBAQ0wLmcS6E5jmRtEHPcVtq95kEgcJmhwVUDTKTx3CKmG
         w+vrggvr2lVrprsqaQkOIn6ktiUvtQjhF+Ai1MKdIXCjS6twqVX9YTkMWMYn1HVzFEky
         SlwbMTs61ztVpS8Nc6/l9G62osD5WAszJiB9IV+icsoOcDU3kcqBsmA1ZJRzp0bGs5dT
         Eqmg+uRgWzSxBLBH61nmulz83xAUwVFCvf4jukIHI/dDM4V3QFtXX8MEigZtiC8r+CUy
         /Esg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVOt70SZefKpoa2aQAm99jSRo65lOG1zQCQhSPkrQi67UK7NCZ9x3WMmLEWrKtaY/a8tSZjYakMP1N0e2vMaW36jTG2nSE0P9l6g0E=
X-Gm-Message-State: AOJu0YxPn5H9aL5Xe+Bw976JauA4/+1pgSi7+0UuQfMvwAzxkYkOj0eF
	x9Hjem4OrmR047frmmUUYwygVQPlRQPKM16X7p6Kwb7TQJ1m2OoEVrpqMXhrFRo=
X-Google-Smtp-Source: 
 AGHT+IGjdt8eK/21R8SNEkAuKUSS9YVD3OAhgQRK4DIdtp+I52YPNa8vy4Q5T+/BRUqKTzQAx5ppVA==
X-Received: by 2002:a05:651c:210d:b0:2d8:635d:56b9 with SMTP id
 a13-20020a05651c210d00b002d8635d56b9mr181907ljq.4.1712259702667;
        Thu, 04 Apr 2024 12:41:42 -0700 (PDT)
Received: from [172.30.205.19] (UNUSED.212-182-62-129.lubman.net.pl.
 [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id
 u14-20020a2e844e000000b002d46be28dcfsm2239298ljh.127.2024.04.04.12.41.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Apr 2024 12:41:41 -0700 (PDT)
Message-ID: <8f6236db-0692-44c9-b136-8e0dff714c55@linaro.org>
Date: Thu, 4 Apr 2024 21:41:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/7] arm64: dts: qcom: Add SM8550 Xperia 1 V
Content-Language: en-US
To: neil.armstrong@linaro.org, James Schulman <james.schulman@cirrus.com>,
 David Rhodes <david.rhodes@cirrus.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Ricardo Rivera-Matos <rriveram@opensource.cirrus.com>,
 Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abel.vesa@linaro.org>,
 Sai Prakash Ranjan <quic_saipraka@quicinc.com>,
 Kees Cook <keescook@chromium.org>, Tony Luck <tony.luck@intel.com>,
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: Marijn Suijten <marijn.suijten@somainline.org>,
 alsa-devel@alsa-project.org, patches@opensource.cirrus.com,
 linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-hardening@vger.kernel.org
References: <20240210-topic-1v-v1-0-fda0db38e29b@linaro.org>
 <20240210-topic-1v-v1-7-fda0db38e29b@linaro.org>
 <05e6f92c-388c-4bc6-a4cd-e9d981166d1c@linaro.org>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <05e6f92c-388c-4bc6-a4cd-e9d981166d1c@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Message-ID-Hash: H227BCVDRANBX74LHYWVFGS74ZIAUX64
X-Message-ID-Hash: H227BCVDRANBX74LHYWVFGS74ZIAUX64
X-MailFrom: konrad.dybcio@linaro.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/H227BCVDRANBX74LHYWVFGS74ZIAUX64/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 2/12/24 18:26, Neil Armstrong wrote:
> On 12/02/2024 14:10, Konrad Dybcio wrote:
>> Add support for Sony Xperia 1 V, a.k.a PDX234. This device is a part
>> of the SoMC SM8550 Yodo platform.
>>

[...]

>> +/* TODO: Only one SID of PMR735D seems accessible? */
> 
> 
> What's reported by the cpuinfo pmic array  ?

PMK8550 2.1
PM8550 2.0
PM8550VS 2.0
PM8550VS 2.0
PM8550VS 2.0
PM8550VE 2.0
PM8550VS 2.0
PM8550B 2.0
PMR735D 2.0
PM8010 1.1
PM8010 1.1

Not sure if there's only one or the other one is secure?

> 
> <snip>
> 
> With the pcie thing fixed:
> Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

It's gonna be fine with the recent aux clock additions. If you
have no further comments, I'll happily ask for this to be merged ;)

Konrad
