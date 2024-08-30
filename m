Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F5A096C17C
	for <lists+alsa-devel@lfdr.de>; Wed,  4 Sep 2024 16:58:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C16C8A4A;
	Wed,  4 Sep 2024 16:58:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C16C8A4A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1725461900;
	bh=ghVIUx9TaJyMm4SETqSo3lqEOUOm5837gqrdXGcmX9I=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=C6TayhUcckDug4Rfmj+c6MB4m8F6kO3mqQTz3Cc7LapQZi2fVQMTM3JzCQxsevZsF
	 dWw4+Vyf1pcL5N2bfIqLUS2uXdkUOv108R0Dt0mfXCcuAQb+O20RlDnQQJ7ZEMUfAW
	 I4RGL0Omv8J7FgksKejuk+Lb0QgEpjQBczCXqTG8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0ACCCF805BF; Wed,  4 Sep 2024 16:57:50 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 94E75F805B3;
	Wed,  4 Sep 2024 16:57:49 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 22937F80518; Fri, 30 Aug 2024 10:37:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 142AAF80087
	for <alsa-devel@alsa-project.org>; Fri, 30 Aug 2024 10:37:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 142AAF80087
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=nexus-software-ie.20230601.gappssmtp.com
 header.i=@nexus-software-ie.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=TvVKaJnT
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-5c22b1f470dso1191635a12.1
        for <alsa-devel@alsa-project.org>;
 Fri, 30 Aug 2024 01:37:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexus-software-ie.20230601.gappssmtp.com; s=20230601; t=1725007062;
 x=1725611862; darn=alsa-project.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tz5xgDVzbjElSEwTue+4JQ6a6tFd6FbY1QoSeaQ1ceo=;
        b=TvVKaJnT9JMvjXa5rzheYnpJsW/enNRunTmKtbk+8tlCGM3x7HXX/74RSojahlVeMZ
         KPWksYCtdooT6b1mQn2fg6SxPT0QcowDCdMoCo1n585I6TEcmp4sQMr4b0SardYU2xw9
         wYsLpVGYCM40BnxEOSRUVSfrYT/8TFrR6b+ihx9O+Qmzt4F8Ae+QL5ZdYwSF+xCoAmvD
         +Qv6Tl8JxxENZ+WtA/IsifzilzilfiaOPVZQy41kV8bVX01ZUw/R0MdLpLBpJXQUq7K7
         1Auzijw3z8m9imNrHONcdmF73iYHh0euk2t1r73M1qlbo4ZHAfuEg6yLVfq56316I5kO
         YyGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725007062; x=1725611862;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tz5xgDVzbjElSEwTue+4JQ6a6tFd6FbY1QoSeaQ1ceo=;
        b=b5YLoGgihOi1V2wPQBFc+RcrMag2UYVmkHz/UZDfUl2gqwYqyGldxHRctA2qMnBlDT
         kgkK6s2CEB5Iboq6r4vpKdtSHWal+omc6uyKqenBLo2KplPGet8kEbNxUL9h5AKgXlER
         feyG9Cdv7HQKSub7UN5egHM3BkPpCl0AURkNeqU2VLtwNAM//f4LikjNrGQK17jO86St
         e6Emy99/0hAJ3rgTMJ+WxKnQ6gx2JMlkvur6e0t0dmEKdGMwWpw0x+oxGUtt8J4OLU/z
         RJDeoR2PTgLTvB907HJzAmqmjwi+wot83BbMk04p3SVU48CSfZ1swadiMcEQujtNhA3Y
         pGJw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWB/S0+WTcHvIZEAcZbkDPgARVJM0y9MELiStGfczW36LbrJLdMM53hk0xpujMnQxywUmpQR+4WNHF9@alsa-project.org
X-Gm-Message-State: AOJu0YzlaOyjRF5kLvegiBHHSMCBEWa5k5ff0MnWmE3Qo13mKi8CB3AR
	oM+ZpqdAFQ3PG6tzMhFNMW6mriLzuse8orHe0tzkZZ3/lggNf1O5QYNrMz6L0StMLSRwWkOiiCD
	K
X-Google-Smtp-Source: 
 AGHT+IHoWfq/90PKtaBCC6Uhi6DqQ09Ism7NBj8fzh8R+arnT/DKgjvjTl/SHIkJT75B9ohmJj4xBw==
X-Received: by 2002:a05:6402:3493:b0:5c2:2b1f:f757 with SMTP id
 4fb4d7f45d1cf-5c22b1ff81dmr2599958a12.17.1725007061676;
        Fri, 30 Aug 2024 01:37:41 -0700 (PDT)
Received: from [192.168.0.25] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c226c7bf90sm1674423a12.43.2024.08.30.01.37.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Aug 2024 01:37:40 -0700 (PDT)
Message-ID: <0fcd3421-8086-44bc-b24f-7fb2262a675c@nexus-software.ie>
Date: Fri, 30 Aug 2024 09:37:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] ASoC: codecs: lpass-va-macro: set the default codec
 version for sm8250
To: srinivas.kandagatla@linaro.org, broonie@kernel.org
Cc: perex@perex.cz, tiwai@suse.com, alsa-devel@alsa-project.org,
 linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org, amit.pundir@linaro.org,
 dmitry.baryshkov@linaro.org
References: <20240816091210.50172-1-srinivas.kandagatla@linaro.org>
Content-Language: en-US
From: Bryan O'Donoghue <pure.logic@nexus-software.ie>
In-Reply-To: <20240816091210.50172-1-srinivas.kandagatla@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MailFrom: pure.logic@nexus-software.ie
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: QDHXH4W3P6YDBIJJQQHPW77Q26GHPYJK
X-Message-ID-Hash: QDHXH4W3P6YDBIJJQQHPW77Q26GHPYJK
X-Mailman-Approved-At: Wed, 04 Sep 2024 14:57:45 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QDHXH4W3P6YDBIJJQQHPW77Q26GHPYJK/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 16/08/2024 10:12, srinivas.kandagatla@linaro.org wrote:
> From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> 
> sm8250 and sc7280 have lpass codec version 1.0, as these are very old
> platforms, they do not have a reliable way to get the codec version
> from core_id registers.
> 
> On codec versions below 2.0, even though the core_id registers are
> available to read, the values of these registers are not unique to be
> able to determine the version of the codec dynamically.
> 
> Add the version info into of_data, so that driver does not need to use
> core_id registers to get version number for such situations.
> 
> Fixes: 378918d59181 ("ASoC: codecs: lpass-macro: add helpers to get codec version")
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

Seems to be fixing the reset I've been seeing on rb5

Tested-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

