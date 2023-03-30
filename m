Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E5E486D0344
	for <lists+alsa-devel@lfdr.de>; Thu, 30 Mar 2023 13:33:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ABD791F0;
	Thu, 30 Mar 2023 13:32:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ABD791F0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1680176021;
	bh=rgatby/hsW2pwp1qz9ifQ6Vdk8dOH8/7DIqpFnEhU48=;
	h=Date:Subject:To:References:From:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=OC1LLThq5G575AZdqhEmY4vLAHq0kOkVUlwtv9rPWoQUiQR4I1qXZRtza/Z5wmDdn
	 w3vQ1yjdI+FG44Y9Go/5ib0cpLSwankVx8fBMc5C7ivrjhy7yvBNEh24tfQRa67RFK
	 +46wkE7m/smgBOMH6Hzmn9sqldWUnciLNYbLPuus=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2278DF8024E;
	Thu, 30 Mar 2023 13:32:51 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 03F37F80272; Thu, 30 Mar 2023 13:32:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E5E28F80114
	for <alsa-devel@alsa-project.org>; Thu, 30 Mar 2023 13:32:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E5E28F80114
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=a/g+QQMg
Received: by mail-lf1-x12f.google.com with SMTP id q16so24071232lfe.10
        for <alsa-devel@alsa-project.org>;
 Thu, 30 Mar 2023 04:32:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680175959;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ML54njYnRDk7o4HcEtvBM1tdyqleAobA4f6MiXOsND0=;
        b=a/g+QQMgnVz1l1tCLbVoEfKvVrzG4Xjf9B/g2JnuhGkNI4tS1LKGp1kHbW4YojKXJP
         Ku6fYadkn41YpAXh6gfuoR19XBByfRsf+RL7L7hWXCOUEeYxV0AYmurCdxeKIpD8RPss
         PH8d1/1V+EoHMV+xfrP1f0DwGPhHQNgfzWwGZJD4KkBOBxZIIMv7oURArB/WMsSkHX3h
         VVSDTx9HY6t6ViPQAbDKHYyxvr+oLuos8cOinpMc9vfwWqUQF8ktCMuSXpObwAIhahoG
         +bwkrBcFsuOwsueSArm8r8Tws1djOqLQ/+dDrJIGdhdWTFRY8hRcyi5iOcB8tHeyAbtC
         /kLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680175959;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ML54njYnRDk7o4HcEtvBM1tdyqleAobA4f6MiXOsND0=;
        b=RMJfL+j6+bzRdfbW2Tk/OHQHm3AFVkbtR0lFZfNGU80veft6JOIT0gPwdM9rpGbicF
         Ia/HeacvIqlJSDzA/Xy7zArFVreAqAF96sajq2o+gKFZyuEpY1HuV/2kBuhpKD2CsC6l
         65kmDfBG44twNG5qHA1qbgHDjCNbJ6riDctZP47Hfb6ZCz8vWPyPSBlrU/vmQuAFYDp5
         2dgTU9JNvvHn/NgRMX0GIATwfUvcnd4YyVSTVx0OoK2+r5Mw5Cqcsq9ll9nVjSdMbX6m
         uhSNeC360dtMsa9ceZmuB0N2yO6rJ8RvPVp8sf69AdAb/6Epmwls0z2sI4FcNGBqkcMv
         A83g==
X-Gm-Message-State: AAQBX9eL6/HCfWyGuXEI/dmd5v6N+Rfpd7ZjywMml8zlcjoEb7NR/eNS
	g80ELMvMSNQMJ3Lyybc9Mnbb9w==
X-Google-Smtp-Source: 
 AKy350bMZjydyBjP+bF1x8VvhUrc9aWFBhqR/qTQGnyb2aqUrAWzyEDsIgUBBXfUgRNjjkMMx0iANw==
X-Received: by 2002:ac2:4903:0:b0:4db:3928:d66d with SMTP id
 n3-20020ac24903000000b004db3928d66dmr6644024lfi.42.1680175959204;
        Thu, 30 Mar 2023 04:32:39 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl.
 [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id
 r17-20020a056512103100b004e8483bff82sm5830343lfr.271.2023.03.30.04.32.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Mar 2023 04:32:38 -0700 (PDT)
Message-ID: <e10bb710-3515-8350-b3be-cb740751c130@linaro.org>
Date: Thu, 30 Mar 2023 13:32:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v4] ASoC: dt-bindings: qcom,lpass-va-macro: Add missing
 NPL clock
To: Mark Brown <broonie@kernel.org>
References: <20230330070342.19448-1-krzysztof.kozlowski@linaro.org>
 <ZCVxTlb+qQXXuaay@sirena.org.uk>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <ZCVxTlb+qQXXuaay@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: FVXE7ZYRTIG5A527G4OSQ27DI45UTWQ7
X-Message-ID-Hash: FVXE7ZYRTIG5A527G4OSQ27DI45UTWQ7
X-MailFrom: krzysztof.kozlowski@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/FVXE7ZYRTIG5A527G4OSQ27DI45UTWQ7/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 30/03/2023 13:23, Mark Brown wrote:
> On Thu, Mar 30, 2023 at 09:03:42AM +0200, Krzysztof Kozlowski wrote:
>> Several devices (e.g. SC8280XP and SM8450) expect a NPL (Near Pad Logic)
>> clock.  Add the clock and customize allowed clocks per each variant.
>> The clocks are also required by ADSP in all variants.
> 
> This doesn't apply against current code, please check and resend.

Indeed, there is a minor change going through Rob's tree. I'll rebase.

Best regards,
Krzysztof

