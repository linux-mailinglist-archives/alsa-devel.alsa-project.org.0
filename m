Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BC3F7F50FA
	for <lists+alsa-devel@lfdr.de>; Wed, 22 Nov 2023 20:59:32 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 93A0DA4D;
	Wed, 22 Nov 2023 20:59:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 93A0DA4D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1700683171;
	bh=shNwK/Gh0rR5F8X8E7Xh/4BcARQ8vxaKf4OhRIduPUs=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=QXkM3EqPzTrPtS17t+BS0rWXzzegbJKwS3AfgtBgBbmkdkzBWHtxj9qQVIW/9NwjT
	 lac8Hi0va55ZyKXRoibvP7fIxhWE7yexMVzHp3h88wZ384MTs9WfTp7eFIk19Og3yj
	 XuD0C26O49vLqKX3DcI6GFOh9TIBtlbuFXccyjVs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E4E2EF80578; Wed, 22 Nov 2023 20:58:59 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7A6B1F80579;
	Wed, 22 Nov 2023 20:58:59 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A3897F802E8; Wed, 22 Nov 2023 20:58:55 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: ***
X-Spam-Status: No, score=3.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,RCVD_IN_SBL_CSS,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=no autolearn_force=no version=3.4.6
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 04F4DF80093
	for <alsa-devel@alsa-project.org>; Wed, 22 Nov 2023 20:58:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 04F4DF80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=HuCk9uSk
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-507c5249d55so120371e87.3
        for <alsa-devel@alsa-project.org>;
 Wed, 22 Nov 2023 11:58:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700683132; x=1701287932;
 darn=alsa-project.org;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=owGEeKQSkUhkxsVwujRwMFyJouN+ra21rm+Zo53wjqY=;
        b=HuCk9uSkVXv6TE3wMfAwoAJQlipNlQ+E0+q6QXYGEsQSgHxuzDUOViDEeKwuWVTVjC
         0b4Pw3wQsHoM0bICouz/HjcHEwsoOhCeAzxV3tKtA8FUY4OqdiOmUXIMMp83CKiuBNS7
         QEHrLJKbJW71JIcieivenFNWeERONSatoxPQtsnVHP0ClVyXdKOCYebmSTaiGwEMvA0/
         Cc7a2djSQJ1zxOK+gjXRVwK3dofVDfISILOQ/EYtMlbC4KAgws12E+I0cis1f2rQZQlx
         29CkhQN6h4LhnS4+7wv0EivSlDQUR3JiDJCfpcxHmv0AjApHbYLIklu5wNm9swegFp7H
         6sYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700683132; x=1701287932;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=owGEeKQSkUhkxsVwujRwMFyJouN+ra21rm+Zo53wjqY=;
        b=KnjgYxMMnonwOehmS1YK7VFitBuvYRApeC2Qk/Qe6PMZ4DinBcxBkM3KSXcgA99Zzh
         5hnZUNeq0pRVt1ut0cJMyt3E2t9jMgHR16YX+RoJIhAC05/yrCiK2MaGWrPOR+2tedvD
         hdWrUNwEphNT6nuHGlnnIBzMNxXlTs8G7lcJzg7HF+ZGhI4xggDUTFOjc8psqmN79vFy
         TUvVqpt+IDBnMAbvSbXXqLdqLe5byn3xVp/e74UBGtmwLroxW1UvfyycVcaOnZXuTtu2
         3WLbEa8zddLV18M1neMQPwcLyfUaTirr/Tv1xE9QFqxobFog+xK/EIaeGCwueEVE2bwt
         8AdQ==
X-Gm-Message-State: AOJu0YwPxoqd9r0VXWf0g9gEriFF84NGYI9RXoT5T/gJ5Bkkz1STkWHf
	QXAkwmUXy9ZRV6IBDbhACZxsntXRLg4rlaIqiGp6hXq6
X-Google-Smtp-Source: 
 AGHT+IGYqOWN7ZE1DBlANCP1hywbHhcJvA+AMBnV5R5G1Kpc69S8u66ZkA3X4OqbdUjjha8Wo36dKg==
X-Received: by 2002:a05:6512:b86:b0:509:8fbf:7af0 with SMTP id
 b6-20020a0565120b8600b005098fbf7af0mr1044667lfv.69.1700683131795;
        Wed, 22 Nov 2023 11:58:51 -0800 (PST)
Received: from [172.30.204.74] (UNUSED.212-182-62-129.lubman.net.pl.
 [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id
 u19-20020a05651220d300b0050300e013f3sm1935876lfr.254.2023.11.22.11.58.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Nov 2023 11:58:51 -0800 (PST)
Message-ID: <b7b7db08-7294-4085-8249-e7b1741dd796@linaro.org>
Date: Wed, 22 Nov 2023 20:58:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] soundwire: qcom: move sconfig in
 qcom_swrm_stream_alloc_ports() out of critical section
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Vinod Koul <vkoul@kernel.org>, Bard Liao <yung-chuan.liao@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Sanyog Kale <sanyog.r.kale@intel.com>, linux-arm-msm@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
References: <20231120190740.339350-1-krzysztof.kozlowski@linaro.org>
 <20231120190740.339350-2-krzysztof.kozlowski@linaro.org>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20231120190740.339350-2-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Message-ID-Hash: WM7P7AC4F7BJFXCONHXYFXDCMHV744Z2
X-Message-ID-Hash: WM7P7AC4F7BJFXCONHXYFXDCMHV744Z2
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/WM7P7AC4F7BJFXCONHXYFXDCMHV744Z2/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 11/20/23 20:07, Krzysztof Kozlowski wrote:
> Setting members of local variable "sconfig" in
> qcom_swrm_stream_alloc_ports() does not depend on any earlier code in
> this function, so can be moved up before the critical section.  This
> makes the code a bit easier to follow because critical section is
> smaller.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
