Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CA00F62F7D9
	for <lists+alsa-devel@lfdr.de>; Fri, 18 Nov 2022 15:40:29 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6914F168E;
	Fri, 18 Nov 2022 15:39:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6914F168E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1668782429;
	bh=bHTp8WxD0cqwio5pXFuWtKnMnq/qdJErDoBEBwvP2sk=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dY4OZA1tR87EgfF3Mu/tpnIszCTm7GLbdnxrgORCF0AAjlupj6Ps7EMwDWcVCQ67W
	 zMAOtJGYXnvLikDiw2Hp3Gh088OlvIm4tlO8ZXYdfFBSBHOhUeL2HhwAn9VYxMRTE2
	 MlduIu+Aio4onkVFAzlfSyNStly/IGU4NZL36seY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E3E79F8020D;
	Fri, 18 Nov 2022 15:39:34 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D448EF8016E; Fri, 18 Nov 2022 15:39:32 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS,URIBL_ZEN_BLOCKED_OPENDNS autolearn=disabled
 version=3.4.0
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [IPv6:2a00:1450:4864:20::233])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 881EAF800B8
 for <alsa-devel@alsa-project.org>; Fri, 18 Nov 2022 15:38:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 881EAF800B8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="puMgpYaj"
Received: by mail-lj1-x233.google.com with SMTP id d20so6965337ljc.12
 for <alsa-devel@alsa-project.org>; Fri, 18 Nov 2022 06:38:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=bHTp8WxD0cqwio5pXFuWtKnMnq/qdJErDoBEBwvP2sk=;
 b=puMgpYajPPIk3Ykwm+tcdadpD9lyTeJKAI8z7HlGRfY+NSsZJzna7GjQwGMfo7ijwB
 iMiDRyWrLxnQDh2Xk/HHqZIDQpReMj8EaCSSDojD/pUFT88/vaxUopxAiCUrK1nkpf9y
 zx1A6H8fCPSqKaAuMRXeuqc13VkN5XWPdJ+MYCiS6UTmSgtU/fp02mjEg7QqNimoAESV
 Yemliv0VkZNZnFjH9XfCYCW5iiwYr6ZXZ5b9h8g0d87gGOS1BuX9IZ6AArhlIf/8DWf1
 5LqY32e/5L0u4XEYhQUmVWJGRf6b6TSL8VNR+8qfrO/KOt0AVJMPu9RyBGmGWVsCEt2A
 gkkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=bHTp8WxD0cqwio5pXFuWtKnMnq/qdJErDoBEBwvP2sk=;
 b=C2NnJGxB9i7lQ6Y2eyM3PQFMLkI3dBirN2AabvOcVsKgU9lVNS0WTPGGtwitXR9/uY
 n2L0xvksxVuWK5QHlh4cQUocvcJ7TDf6cVhy9w2urI8ZEvzzO7/jMJYVfbNG6qocCrB0
 MfKSJlslOU3JJfVjpKFsaGAihx0ZjGkR5DfNOIEasNTpIEFJXUNXYYP5X3krseL0aOPw
 abrFCyYp5ErE76w+cebq8wfMSWLzbz+aw2xavKtMLqkt0uHGjxMBJ2Z7GKKe9hdmL979
 khPWziRtILAiQ06MOiJ0CH6TMmu6bDICedhrJhSdSymrOeJQp1RMC30NLQycfnn2AOMy
 qgmQ==
X-Gm-Message-State: ANoB5pl/Xfvp6avAoW/4XB0uD82F3IyJ7z1U8fjOav1AtHZrKokpd46U
 4MGrki0iepGhFkpNAloGBliJVw==
X-Google-Smtp-Source: AA0mqf5itRuxKo/p8JLJKY1b/siNfqPJIRbSguu2UNOYtp1ZnFiPakQHISIDlIACodjd11xaVMuKbA==
X-Received: by 2002:a05:651c:b26:b0:277:9847:286a with SMTP id
 b38-20020a05651c0b2600b002779847286amr2474891ljr.309.1668782314025; 
 Fri, 18 Nov 2022 06:38:34 -0800 (PST)
Received: from [192.168.0.20]
 (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
 by smtp.gmail.com with ESMTPSA id
 t17-20020a195f11000000b004994117b0fdsm678523lfb.281.2022.11.18.06.38.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 18 Nov 2022 06:38:33 -0800 (PST)
Message-ID: <c3a2316f-2956-6417-f1ea-a6a64df037c6@linaro.org>
Date: Fri, 18 Nov 2022 15:38:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v2 1/2] ASoC: dt-bindings: lpass-va: add npl clock for new
 VA macro
Content-Language: en-US
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, broonie@kernel.org
References: <20221118071849.25506-1-srinivas.kandagatla@linaro.org>
 <20221118071849.25506-2-srinivas.kandagatla@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221118071849.25506-2-srinivas.kandagatla@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 lgirdwood@gmail.com, linux-kernel@vger.kernel.org, tiwai@suse.com,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org
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

On 18/11/2022 08:18, Srinivas Kandagatla wrote:
> LPASS VA Macro now has soundwire master to deal with access to
> analog mic in low power island use cases. This also means that VA macro
> now needs to get hold of the npl clock too. Add clock bindings required
> for this.


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

