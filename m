Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C05C27D1E33
	for <lists+alsa-devel@lfdr.de>; Sat, 21 Oct 2023 18:18:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 973B6832;
	Sat, 21 Oct 2023 18:17:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 973B6832
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1697905114;
	bh=dd3HU0Eq1JBgBSK+yv97iziTRFsJgqLfvbxn6z6KmZ0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=OdpyneK/hYekGXTo93lbSNKAhWBIn6CpuQVqpbYaPNoTX5rjuGQAiyjwhog6mxGlU
	 xuyzDxmFRd+NrqpgrIvGIdYqPDZs/jtHzqFEcNEF/G4kZnl+pGZyAHtwvrWhTq3wak
	 OUPLINchxEq2PzUiQhm3x+/EMWQfuUqYa9XdnK8U=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1BAE1F80557; Sat, 21 Oct 2023 18:17:43 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A4FBAF8024E;
	Sat, 21 Oct 2023 18:17:43 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A3AF6F8025F; Sat, 21 Oct 2023 18:17:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [IPv6:2a00:1450:4864:20::229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 07C02F800C9
	for <alsa-devel@alsa-project.org>; Sat, 21 Oct 2023 18:17:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 07C02F800C9
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=g7vgCtU8
Received: by mail-lj1-x229.google.com with SMTP id
 38308e7fff4ca-2bb9a063f26so27286341fa.2
        for <alsa-devel@alsa-project.org>;
 Sat, 21 Oct 2023 09:17:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697905051; x=1698509851;
 darn=alsa-project.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2QCO7vKJdpewvnrGf7uSRM6TlZdVHtky0YfzwG9dgVY=;
        b=g7vgCtU8m/i2gULG0qed1AZcjZqdtD27FtLs7Ay1zm8YnjkiAku0AkV1/r70wYvXAl
         znJqob68DBUNDkv+PbCC2VpuBCogxSctHR5MtjKLdVY2LDeZKv8FMaKNrqC0JSfnr89g
         5qCoJc8nXVezB1WABrpRG84+euuRJGgmbvM/YLrg7edkO6TtUHTJC5w2POpgSdReAn8W
         WC5vxYDwU2HNKLAdY5VVOhQYCZxIE4HMFyPq/RnBjZBgsW9pIwQ4dj5YKOug30cush4M
         3u0ObCIIgOle7oQ7dRDNB4Ylo4mG4ARByuKrqaglj9kqvuZGiHu0PvgHqlfSqwe0YpmW
         oNhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697905051; x=1698509851;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2QCO7vKJdpewvnrGf7uSRM6TlZdVHtky0YfzwG9dgVY=;
        b=umSI7pty5ZvFsNoFQJeg4Sx8r702wXVc2ns6V0zkkTjoyyN2x/2KZhh38d3s7QpM52
         htHdIPBTvjkr+pF9QpCGCAxkppWvY1rQtITOcUQKWer/8xyKp98fyR48gZKtjpWLpD+N
         jdRGiVyvnyzz79tu4TWehBJfdG0j+pB/2eIH6Ic5BiK+XiantDMAgLJIolZJUrf9+BVz
         fJs1CKrE+Q4XuZ/bdVIy32E6lSl7/eLL6W/WQms45bDuRDgY4g2aiH/SIxnLLyQvfPZx
         pPfth0iKM2QwUws9aDOtB1r4gNpPdo/QhscyxfUOk3Ey/6aUlE0d6EVR0gciQiZrKpvk
         gnWA==
X-Gm-Message-State: AOJu0YxVPlcPVkLwpvl/aDxNET3zVm8VPh0EqMymkzuzRIbUZXTGzP75
	6H7RkZiOjrtGvJy6K2Jcxyl4uA==
X-Google-Smtp-Source: 
 AGHT+IGUX29kGn+O+8jtH1EHnalh5tcVZoDjnw2thl7vfAv7LtObZoQC9rYzurf+iaRF8Wb17E7sig==
X-Received: by 2002:a2e:9210:0:b0:2bf:f7ea:884a with SMTP id
 k16-20020a2e9210000000b002bff7ea884amr3462294ljg.30.1697905051347;
        Sat, 21 Oct 2023 09:17:31 -0700 (PDT)
Received: from [192.168.1.116] (abyl4.neoplus.adsl.tpnet.pl. [83.9.31.4])
        by smtp.gmail.com with ESMTPSA id
 h5-20020a05651c124500b002b95eb96ab7sm876376ljh.18.2023.10.21.09.17.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 21 Oct 2023 09:17:30 -0700 (PDT)
Message-ID: <ae070706-2f0a-4932-b917-b8cc9a59b46e@linaro.org>
Date: Sat, 21 Oct 2023 18:17:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] sc7180: Add qdsp baked soundcard
To: Nikita Travkin <nikita@trvn.ru>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>
Cc: jenneron@postmarketos.org, linux-arm-msm@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20231020-sc7180-qdsp-sndcard-v1-0-157706b7d06f@trvn.ru>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20231020-sc7180-qdsp-sndcard-v1-0-157706b7d06f@trvn.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Message-ID-Hash: 7P3RB5VXK2BIMEXFNHNE3LDW4TIXWDHM
X-Message-ID-Hash: 7P3RB5VXK2BIMEXFNHNE3LDW4TIXWDHM
X-MailFrom: konrad.dybcio@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7P3RB5VXK2BIMEXFNHNE3LDW4TIXWDHM/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 10/20/23 17:33, Nikita Travkin wrote:
> Some devices, such as Acer Aspire 1, can't use lpass dirrectly, but
> instead must use adsp core to play sound. Since otherwise the hardware
> is, usually, very similar across the devices on the same platform, it
> makes sense to reuse the same boardfile.
> 
> This series refactors the sc7180.c slightly and adds the functions to
> control clocks via adsp instead of controlling the hardware directly.
> 
> Existing google devices should experience no change.
> 
> Signed-off-by: Nikita Travkin <nikita@trvn.ru>
> ---
s/baked/backed, unless it's a nice bread :)

Konrad
