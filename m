Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AFAA55B9F1
	for <lists+alsa-devel@lfdr.de>; Mon, 27 Jun 2022 15:29:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BFDC7168C;
	Mon, 27 Jun 2022 15:28:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BFDC7168C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1656336560;
	bh=z9PVCuLwYojxAkS7HtYVZSwdcH1Sn2Xb8zOWtG/TKa4=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dVptZmiGbYjcGjr8QtRvvNqrT1p3Khuh3q+HFN5vFNs9CSP+Xhn0rR2AE2ROSXHiX
	 mLXvJjkCLXijPzIiJZ/qi/KG7d5mzIDjuLPZfYbEG+ZqNNt+gJhDoAh0jkIUMzL6ZQ
	 fMskjsvuI0XJxtKQbnU7/VN8dTTOEJjwiqSnRK+w=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1A91FF8028D;
	Mon, 27 Jun 2022 15:28:22 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C6C22F8028B; Mon, 27 Jun 2022 15:28:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 99968F80128
 for <alsa-devel@alsa-project.org>; Mon, 27 Jun 2022 15:28:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 99968F80128
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="Jd0mnpny"
Received: by mail-wr1-x433.google.com with SMTP id e28so7909417wra.0
 for <alsa-devel@alsa-project.org>; Mon, 27 Jun 2022 06:28:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=ls6yB7m2qi6FUlQi0e95Lc81JKfij9i9l6rtcmcTak8=;
 b=Jd0mnpnyP4rJZ9Y4IhxngJKeUIOf0Z/VNFHnAFqnaaAy2z7OkGrRewlJPEiUcsZD87
 PIlMG2oSpUu7u+GTFQMuajnL9dKQcpt5pyZKd1deRSVB9nOYV+B1myKwmSZAuHx6AibA
 iolrI0LSUo0gNVgzQaibDJi4t0Yo4v0AjbRpiA8hL/vk3PGO2oHFrruanBcjtZVAVDRA
 3wjH05iBG8qcXs00ugZgTErw9NBaOSTFBGgP1h7srx00mHlBAfY+BCGjC9CKeauFNGdF
 I0YCsAlWvVvbLiFJlGyzEVR6+25+InTsPs2H6eAxdiIMfYGka2kjiXU1sCuOKycmgnOt
 toTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=ls6yB7m2qi6FUlQi0e95Lc81JKfij9i9l6rtcmcTak8=;
 b=vzTodA5XtvoQLGmz2Zm/GsQkVftVJg9WfeMPYaQ1kw8VyVX2r4/EjrtQWNLPisdo2O
 uydWppP49bKjmUP7FeXYjlkpjHsScJXEOJHdK4s2CTKCIAXqIclzb3/d3ay5VLrWOtc3
 xHwZL+xJ6Qdx76/eOOm7kGHUD+eqwSkq6qXrfURolBLXW4OHJkyn5VufZsgKEUM7CpQ/
 Azue241D/gcjuM+M3AQ/k7QkIt0QVpL6J8BDL2tVLtPQBWjiF4CEKAV9XQ8bONx/+93k
 cDtXwamN4zgq4m9tKxC+tyoUvih+ht+Y0NEE6Ut0p9YyOubI3EPcIpIgldTasi6k8RVQ
 qKeA==
X-Gm-Message-State: AJIora9iWvvC4+zFXs9Gq9w3lddxz8B/mh6rJVjTYhnpgxBZqJP9PrTQ
 URO4xsQ/GmgA9qthiMCY7FM2Jg==
X-Google-Smtp-Source: AGRyM1tsqKmfD0LspHT7HlY65vqjpsSthGGW/eUJ1V0K0Z5bfsNimFwCoKv+V2gUeWRwD9QslV7Qgg==
X-Received: by 2002:a5d:5984:0:b0:21b:a858:3678 with SMTP id
 n4-20020a5d5984000000b0021ba8583678mr12519365wri.293.1656336490689; 
 Mon, 27 Jun 2022 06:28:10 -0700 (PDT)
Received: from [192.168.0.251] (xdsl-188-155-176-92.adslplus.ch.
 [188.155.176.92]) by smtp.gmail.com with ESMTPSA id
 j22-20020a05600c485600b0039aef592ca0sm13404144wmo.35.2022.06.27.06.28.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Jun 2022 06:28:10 -0700 (PDT)
Message-ID: <4ec8e2d2-f199-976d-52ae-bbba2d6ac40c@linaro.org>
Date: Mon, 27 Jun 2022 15:28:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH] ASoC: samsung: s3c24xx-i2s: Fix typo in DAIFMT handling
Content-Language: en-US
To: Mark Brown <broonie@kernel.org>
References: <20220627094335.3051210-1-ckeepax@opensource.cirrus.com>
 <803785ef-42b7-647c-9653-702067439ae9@linaro.org>
 <YrmYbZV4mj9d9++t@sirena.org.uk>
 <a25126ed-ef39-8316-6ae5-9551aa8120b0@linaro.org>
 <YrmvZonpB5GhLGbG@sirena.org.uk>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <YrmvZonpB5GhLGbG@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, Charles Keepax <ckeepax@opensource.cirrus.com>,
 patches@opensource.cirrus.com, lgirdwood@gmail.com,
 linux-kernel@vger.kernel.org, jrdr.linux@gmail.com
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

On 27/06/2022 15:23, Mark Brown wrote:
>>> That coverage has apparently also been missing in -next for several
>>> weeks.
> 
>> Eh, it seems defconfigs for this old platform do not select sound, so we
>> rely on randconfig. :(
> 
> It's not even turning up in an allmodconfig?

No, because it is old driver for S3C24xx platform which:
1. Does not have compile test (I can try to fix that),
2. Depends on/Is selected by S3C24xx code which is not multiplatform
thus is not enabled on ARM allyes/allmod.

Best regards,
Krzysztof
