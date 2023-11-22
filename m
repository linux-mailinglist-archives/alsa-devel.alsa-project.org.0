Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E91C37F50F7
	for <lists+alsa-devel@lfdr.de>; Wed, 22 Nov 2023 20:57:56 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1EFF6DEE;
	Wed, 22 Nov 2023 20:57:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1EFF6DEE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1700683076;
	bh=na0CHeU/iXRHI2W8bRm/a0dCgDYe6MckkHoHqoMu9NA=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=MiXKqIo09Zn1+B9KP02BmGmKsSn+AodtAM2nyb2h/dm+oxxz9xkDr/FWFfI/uGeiL
	 KnfgwWd40QRqGH5s5iC+NFsqflYITJHqgzN3qiOk95oqA8OvRn+xKcVJIubWX+XWk9
	 QWpqac8+3y2rxXm1sFp0YhSFFVHy+jbtLal6hQQE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 86B6CF80579; Wed, 22 Nov 2023 20:57:24 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B6AF6F80579;
	Wed, 22 Nov 2023 20:57:23 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AF7D6F802E8; Wed, 22 Nov 2023 20:57:19 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_SBL_CSS,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3A9D6F80093
	for <alsa-devel@alsa-project.org>; Wed, 22 Nov 2023 20:57:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3A9D6F80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=ZLUHAS9p
Received: by mail-lf1-x133.google.com with SMTP id
 2adb3069b0e04-50797cf5b69so110365e87.2
        for <alsa-devel@alsa-project.org>;
 Wed, 22 Nov 2023 11:57:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700683033; x=1701287833;
 darn=alsa-project.org;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=z3eKzYiaUPur0IhJyaSZpFt+RCAlVJJsNbMkeIZr53A=;
        b=ZLUHAS9pl1YS8PS2mNGurfqufi9+TnPp/pbn6TI9SQ8C7BHyBLHn67M+7CMICPBte7
         d9d3oHSsPHFXimGPGs3ieQ17mtO7lt2//+gjkSLKPcNh69qNX2B4mfa9GgRcI5OyloPv
         L465gHb+TZgYSdPxkVaIBxvWu50TEMrPwIlB4VBIoe3hmSQM3+qAcaL8EpILaTd78yaf
         zfupLY66H1nm5DSNoOfvQRyaofUGMt5M+UNjPIvA957kDGChjeYK66hHVifamMoXhnkS
         RF6i/1LDnThCNuWBNDe7cgE3weazcLbisXbfN28EbXtO0vSaGYHc3D0roTjGOZKZ9vPt
         W1pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700683033; x=1701287833;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=z3eKzYiaUPur0IhJyaSZpFt+RCAlVJJsNbMkeIZr53A=;
        b=KNWE26ZZ3kKMhG8eqnOsqZV03eImlBavowjCcugqheEEhPanpIyA7DKmRYRbw01fuP
         5N9tovLFhP6SZZVgxUig5gcrDbFe/VNm+PhW1dsArPaAobpIEiqGzQVsgSibbPcip6oh
         ImDE2zii4HEzNCX63tPzi/Nai6SzAhpQmSaI9Wnp4ANXeFHPtlbiPpFuvOy97hwBSqEF
         nhhSSqWxP3JfHRiVTLzGhTOelm5F9aVdjJo4PNJWBG8gthto74d9QEa6rcRQgQOl9V77
         Z20psjVyt+P/mYXzixgfw6xEhTofVNe1mDv69gW+myS0UfQ90UuB6OickfkpKQEdOPNk
         +GAQ==
X-Gm-Message-State: AOJu0Yx920Essv0N5P0vKnOZYFQ9ox922FvPR7RhL1DtWrw0vi7+smTb
	o1AxFaGi/k6GOVNye0AdvmuDbQ==
X-Google-Smtp-Source: 
 AGHT+IFXLsNjyGl1aWYWlgDu4MftGSAqzRIBwU82aj9LRkzZJs8EcwuYv+qq3oVWL6RWFELs3lHO0Q==
X-Received: by 2002:a05:6512:3254:b0:50a:a571:88 with SMTP id
 c20-20020a056512325400b0050aa5710088mr2424023lfr.61.1700683033496;
        Wed, 22 Nov 2023 11:57:13 -0800 (PST)
Received: from [172.30.204.74] (UNUSED.212-182-62-129.lubman.net.pl.
 [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id
 u19-20020a05651220d300b0050300e013f3sm1935876lfr.254.2023.11.22.11.57.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Nov 2023 11:57:13 -0800 (PST)
Message-ID: <4fe84f86-b7e8-4f71-8a01-dabb835959c3@linaro.org>
Date: Wed, 22 Nov 2023 20:57:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] soundwire: qcom: drop unneeded
 qcom_swrm_stream_alloc_ports() cleanup
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Vinod Koul <vkoul@kernel.org>, Bard Liao <yung-chuan.liao@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Sanyog Kale <sanyog.r.kale@intel.com>, linux-arm-msm@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
References: <20231120190740.339350-1-krzysztof.kozlowski@linaro.org>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20231120190740.339350-1-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Message-ID-Hash: PQLYEWI54GXEGXAHFFGPJ4M2HE2MYW23
X-Message-ID-Hash: PQLYEWI54GXEGXAHFFGPJ4M2HE2MYW23
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/PQLYEWI54GXEGXAHFFGPJ4M2HE2MYW23/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 11/20/23 20:07, Krzysztof Kozlowski wrote:
> The cleanup in "err" goto label clears bits from pconfig array which is
> a local variable.  This does not have any effect outside of this
> function, so drop this useless code.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
