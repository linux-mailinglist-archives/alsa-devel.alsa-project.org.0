Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E6C28A0E15
	for <lists+alsa-devel@lfdr.de>; Thu, 11 Apr 2024 12:11:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CA7DB20C6;
	Thu, 11 Apr 2024 12:11:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CA7DB20C6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1712830272;
	bh=c88CtbpASLW+lMC3ncUfeLi/X9N2GHnGhifVL+4uUu4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=m/n2QBb1DGAilmTqHO5xDcwoto8RSpN8g3RIYhUh+PXpYCXnu518luN6IGfJtFbSG
	 +CRLIIUjLsrmsAvybLttJ8Y5HN9w/kI6U77a7+c20UeSH/aFbUkORLTFgJKVuG+gGs
	 XFOPxbs16/5K5Xb3630GwVPquqFD00HsBd9rhqGE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6BD42F805AA; Thu, 11 Apr 2024 12:10:40 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2303AF8058C;
	Thu, 11 Apr 2024 12:10:40 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A413BF80238; Thu, 11 Apr 2024 12:10:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A4E5CF8013D
	for <alsa-devel@alsa-project.org>; Thu, 11 Apr 2024 12:10:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A4E5CF8013D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=qr6JmcjU
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-417d14b39ebso4206815e9.0
        for <alsa-devel@alsa-project.org>;
 Thu, 11 Apr 2024 03:10:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712830231; x=1713435031;
 darn=alsa-project.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=IbcuPYzDJIFh9oPzYtxj0nVD0h7WR7t8sWLiBPKjH3g=;
        b=qr6JmcjUNYnMlXEP28VFtKHW8RIPPhQePbaiCY/4F/CLOwD9m5VjHXiqi+GJ6/esay
         fQ3INizyie/vMCqMlvoHx+XT8/RdHYTy1socjZZwnyOZUxKqIfkdVR8EStsy44OwdnHa
         1JPyxSGZhg1NfGPf8F8ZuxWANb1//np9vliaCVu2O8Au7e9KGWiA+HIGTbT98Nk1AHAs
         MngvMq7duAiugtho8miIW79Eh9W6lnuqFhwHe5mySWlk99lpaVnkMKvZET30orEKFNPs
         m0jwER2WyVgD9H9k/K6STpBdGlKFoILGhv9gnUTxdjcNgYcWvD2lMjwerogAUpgRxFG0
         9Rmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712830231; x=1713435031;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IbcuPYzDJIFh9oPzYtxj0nVD0h7WR7t8sWLiBPKjH3g=;
        b=fsrc14GhV0DwhyKuo/6g006lD6q+kZMoxCT02LsBWEZ2/Z336ciWmsD1T4tP+oKAym
         GafdjMYO/QuQ5ClHAeR2cCBz4VkMYXPmDpxA0mp07+5T8/z0tOg87cnse6o7rsGtogpi
         5mBbz6eR5R2PPkC1nw263SMpQWOlzc7wY1bJqHeScx7qfQlVfUJetM4DGyX4jqheMu4f
         9X2ds3ysqf82odQqzHHyFeVnfK9DLqo0YeNfolm0IgTxddc9KZnOL+iTQEp1Jdpt1ZrZ
         lOos7L+Be8synEiNTVPHx6dZnHt6aBOA3ORm0evEyGusNaTdppkCPIv7hfMZe69Cr00t
         eDhg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUAh4sG6A017C4zkhzZ0vK6FSvhCPUiwYeLGn/Ot2Usu+FtY4zlZv3Fqxjr0uiAaltbQovC+cabOJ0/3c39jc/JvQCb6pn3de61/BE=
X-Gm-Message-State: AOJu0YyOriFFAdz/1Fa0lkBU+dQLNA8xTZIjpTWMH/KTdcN5mQ8m//CA
	fxgfrLpNE1w4US1wg4j9t7F2RfjAHi4Nzr+nSkuyhqlYoGOlOWTvfOuypsL9Ygs=
X-Google-Smtp-Source: 
 AGHT+IHRKrRLubhr+Lnf9ntcc3NGKnH39WbmBok4qFy8BKIHtyPtVJY8JT7mh5VwhPSvyUJk4CEkEQ==
X-Received: by 2002:a05:600c:19cf:b0:416:fdb2:fa75 with SMTP id
 u15-20020a05600c19cf00b00416fdb2fa75mr2614634wmq.9.1712830230728;
        Thu, 11 Apr 2024 03:10:30 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.16])
        by smtp.gmail.com with ESMTPSA id
 l23-20020a05600c1d1700b004163ee3922csm5052531wms.38.2024.04.11.03.10.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Apr 2024 03:10:30 -0700 (PDT)
Message-ID: <5cad6693-8a76-4a74-92a0-00a0818b5210@linaro.org>
Date: Thu, 11 Apr 2024 12:10:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] soundwire: qcom: allow multi-link on newer devices
To: Vinod Koul <vkoul@kernel.org>
Cc: Bard Liao <yung-chuan.liao@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Sanyog Kale <sanyog.r.kale@intel.com>, linux-arm-msm@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Mark Brown <broonie@kernel.org>
References: <20240405144141.47217-1-krzysztof.kozlowski@linaro.org>
 <ZheyJ5PORudx9gsK@matsya>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <ZheyJ5PORudx9gsK@matsya>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: X5LYOOW2BFELRIJAMHETGHRTXJEX2M5U
X-Message-ID-Hash: X5LYOOW2BFELRIJAMHETGHRTXJEX2M5U
X-MailFrom: krzysztof.kozlowski@linaro.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/X5LYOOW2BFELRIJAMHETGHRTXJEX2M5U/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 11/04/2024 11:49, Vinod Koul wrote:
> On 05-04-24, 16:41, Krzysztof Kozlowski wrote:
>> Newer Qualcomm SoCs like X1E80100 might come with four speakers spread
>> over two Soundwire controllers, thus they need a multi-link Soundwire
>> stream runtime.
>>
>> Cc: Mark Brown <broonie@kernel.org>
>> Cc: alsa-devel@alsa-project.org
>> Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>
>> ---
>>
>> Changes in v2:
>> 1. Only rebase (slightly different context)
> 
> Applying /tmp/v2_20240405_krzysztof_kozlowski_soundwire_qcom_allow_multi_link_on_newer_devices.mbx
> Applying: soundwire: qcom: allow multi-link on newer devices
> error: drivers/soundwire/qcom.c: does not match index
> Patch failed at 0001 soundwire: qcom: allow multi-link on newer devices
> 
> This fails as well :-(

I just applied it on v6.9-rc3 and next-20240410 with b4. No problems.

Did anything change since yesterday next? Can you point me to the tree
and branch you are using?

Best regards,
Krzysztof

