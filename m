Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A3C696276A6
	for <lists+alsa-devel@lfdr.de>; Mon, 14 Nov 2022 08:49:21 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0C2C31630;
	Mon, 14 Nov 2022 08:48:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0C2C31630
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1668412161;
	bh=ruOxFGh3LPZoixXrU58A5riFjZ9F4QKBja/IiS33reI=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=btdQJTV77IY6xEftRDMqKS2fZNlWCPRm1cBxgRYRmKSFBfaQ/8F1u7/sDQw+Sl7M3
	 K1JtjAnKAEDwAqzCKR+RfAvSH/tbJnmHIRQuw2nQQWn+9pEJ/JDL319/2l6NGAArW2
	 RCawW9loI0ol1Xs46xz5KGslUZOvriNr43JSuxg0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7C54FF800AA;
	Mon, 14 Nov 2022 08:48:25 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E9135F80431; Mon, 14 Nov 2022 08:48:23 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, NICE_REPLY_A, RCVD_IN_ZEN_BLOCKED_OPENDNS, SPF_HELO_NONE,
 SPF_NONE, T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 391FEF800B6
 for <alsa-devel@alsa-project.org>; Mon, 14 Nov 2022 08:48:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 391FEF800B6
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="SMH/wDR0"
Received: by mail-lf1-x133.google.com with SMTP id g7so17958788lfv.5
 for <alsa-devel@alsa-project.org>; Sun, 13 Nov 2022 23:48:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=RtaXBhnGo8MVscIrQnKGheYkcw3Kx7+UsbUghToyCVI=;
 b=SMH/wDR0ipSJQ9BUzSRMG2RWykZI8v94NQ6rQnIPL3+Oq+ZKPi/veswxkIv+yEMztD
 2QmI0HH5GldekYzi2aGpmm2oQ8bYqWvWukggo1oah2jteXry9sKr9hhszaCUNhe7JaZB
 wtQ2IWfLRze8qnIqqOUGV270budQ2QuruVB/5jdcg93GlDmIcmNOQ93VZ2dwFWHN/cNM
 JLIE+7LyCVT068CkPRhtyAPK3R1eNs1lvDXpLB6AOz3Qp4VaXNsJRRW7UsnXmx6847Yu
 TDymNZOPJZcegB76FHBGkSFkdBDkb9j47VZng4bShYGV0+c1jYTr0NOza+VNBooBqfle
 LnBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=RtaXBhnGo8MVscIrQnKGheYkcw3Kx7+UsbUghToyCVI=;
 b=SHoeegCmTAybpxBFIl4FQLMaTc93REYScjseBP+vSftVJ99s7Zu+YSM153XEAjjYGp
 SfYb+EyMROb1gpY1MkWja5Z0Ds603yiQdo4bKUE20PdDhKnXww0YeFsZH5r7pXspgCx4
 dePZFAt3XCQaybjLWOXfnaRb3mfIgMnQvTM08tyolFXncUHsaTRmYwarSS5ZMny9sFYQ
 ER+BSFp4kMwUvNnCohsrYf8D0IVwochZpmy+Gh+dHMNqN4nOttkg8T9iXzH8mYDQWmNA
 153VPUISB2DMMjj4yYVVLR/LaSUf8SskyX60jPB9VIZMQsDbd/Z5q+efd8Px+kqeAYCO
 iIQw==
X-Gm-Message-State: ANoB5pmCJUsbn4EKABSao4MZTkcqcA7e98gl8kFNtKiUKymS5GboJzDN
 i3XjHaDupAZPJZGTsJnfauyBCw==
X-Google-Smtp-Source: AA0mqf4L855tMQ/hmtg1Tuny5MoKVDR9pzpMX2tlC4Cl8NJCd/Q5ZQSx1O0gm5QI6BjibY6zuXXH2w==
X-Received: by 2002:a05:6512:6d5:b0:4a9:6659:40d5 with SMTP id
 u21-20020a05651206d500b004a9665940d5mr4232367lff.516.1668412098837; 
 Sun, 13 Nov 2022 23:48:18 -0800 (PST)
Received: from [192.168.0.20]
 (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
 by smtp.gmail.com with ESMTPSA id
 k20-20020a2eb754000000b0026b2094f6fcsm1899097ljo.73.2022.11.13.23.48.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 13 Nov 2022 23:48:18 -0800 (PST)
Message-ID: <0ee5db9e-d80c-947d-73d6-6214e9299b23@linaro.org>
Date: Mon, 14 Nov 2022 08:48:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 00/10] ASoC: dt-bindings: Rework Qualcomm APR/GPR Sound
 nodes for SM8450
Content-Language: en-US
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20221111113547.100442-1-krzysztof.kozlowski@linaro.org>
 <06da072c-8cf0-8181-3c32-4592fe41f9c2@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <06da072c-8cf0-8181-3c32-4592fe41f9c2@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: Patrick Lai <plai@qti.qualcomm.com>,
 Srinivasa Rao Mandadapu <srivasam@qti.qualcomm.com>
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On 11/11/2022 17:15, Srinivas Kandagatla wrote:
> 
> 
> On 11/11/2022 11:35, Krzysztof Kozlowski wrote:
>> Adding sound support for Qualcomm SM8450 SoC (and later for SC8280XP) brought
>> some changes to APR/GPR services bindings.  These bindings are part of
>> qcom,apr.yaml:
>>
>>    apr-or-gpr-device-node <- qcom,apr.yaml
>>      apr-gpr-service@[0-9] <- qcom,apr.yaml
>>        service-specific-components <- /schemas/sound/qcom,q6*.yaml
>>
>> The schema for services (apr-gpr-service@[0-9]) already grows considerably and
>> is still quite not specific.  It allows several incorrect combinations, like
>> adding a clock-controller to a APM device.  Restricting it would complicate the
>> schema even more.  Bringing new support for sound on Qualcomm SM8450 and
>> SC8280XP SoC would grow it as well.
> 
> Why would this grow? All the dsp services are static and they will not 
> change per SoC unless there is a total firmware change in DSP.

They grow now with SM8450 which requires changes there. Otherwise DTS
does not pass with current bindings. The bindings before my fixing in
2022 were really incomplete. Now they are complete, but:
1. Not for SM8450 - this will bring new things,
2. Very unspecific as they allow multiple invalid configurations.

> 
>>
>> Refactor the bindings before extending them for Qualcomm SM8450 SoC.
> 
> I dont understand this bit, what is SoC audio support to do with DSP 
> bindings. DSP bindings should be totally independent of this.

APR/GPR bindings are for SoC audio, so while adding SoC audio the first
are affected. If you went through the commits here, you would notice the
changes.

Best regards,
Krzysztof

