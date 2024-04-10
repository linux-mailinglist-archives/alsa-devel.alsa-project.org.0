Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B0E58A9F04
	for <lists+alsa-devel@lfdr.de>; Thu, 18 Apr 2024 17:50:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4AF521060;
	Thu, 18 Apr 2024 17:49:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4AF521060
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1713455405;
	bh=rJB6/4cV26EW5syN+P1RUCaw8vdLd265D4NK23+6Ks8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=u8BDmlrX6e9l1UTEqENeH3f5QVRaa2R56PLvegCoLX7HyFXn8QvzQIySGnz3Srhff
	 6ANpfhOnc+kOLkIdIe+Vw/h2e/7KSgBmsfEuAfcoRI66B3Nw1iCDktw7E36pqaTxGD
	 t4iMBzn4pZ1HMGIeptCBEhJwC3bZehD9vS/v5HjU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 52748F8064F; Thu, 18 Apr 2024 17:46:09 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8C53DF8061A;
	Thu, 18 Apr 2024 17:46:09 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id ED85BF8026D; Wed, 10 Apr 2024 16:02:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D7DCFF800C9
	for <alsa-devel@alsa-project.org>; Wed, 10 Apr 2024 16:02:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D7DCFF800C9
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=baylibre-com.20230601.gappssmtp.com
 header.i=@baylibre-com.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=CHRvPvTv
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-346406a5fb9so1122137f8f.1
        for <alsa-devel@alsa-project.org>;
 Wed, 10 Apr 2024 07:02:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1712757737;
 x=1713362537; darn=alsa-project.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VMjbesMdn+qtLdaftXdet62uuV9p5A/VNrKt/cHgu0g=;
        b=CHRvPvTvBC04Ic1weuctFMDzBMjxFghXdXtylVM/XX1BlE1UDqvl7YdiHFH0EJhT5r
         BexT6oUV/nljr8wpJROFE5ukFq4uP9oZfXLjjtv3jM1gajO/a7Eyy+sdV/7OKw2omy/A
         TgU6Z38o/NDsNx+vuUDmaSIEvV2x0uD3Lwox1VF/XUQoUl6uIbSBCftfds5g8R6jNK0D
         f2RV7SI9ML8aMb6z5dDbOHGQaVI51b7fSesr/7AKmXGWhXfuMaD46/W3cQjLBR3v4GJA
         OmKq8F7Rpv270XGnrud5UjJj2QXKID+GNHvqiPaSHV2w2uQ+L1MT6NxuPG7WvZNp83DR
         9omw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712757737; x=1713362537;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VMjbesMdn+qtLdaftXdet62uuV9p5A/VNrKt/cHgu0g=;
        b=Y8zAGJXmHYSyVLye+cqvG9qDZsfcasHdJC80FTYq5MRvot8A7oB6s36Lp7rBPPZypH
         vRYp2lA46PRLLKUOdhCScSDQusQPeP0zaRRFaG4fK80e3tccMq6z2o+UTqtc665ViGBe
         gU3XUFC73KMAYflQRLIGqvZpPRpVJYLr4k6YhbDHjZSaTTMAmAj89OZqUDTZWe/9Unm1
         WjeByf55SQSnC85Jy7x4CAiCVzRT/VfY7iQQ5pTLeatdlTjs7hnSpYTGF96CrQRbHLR9
         65F2X3Mn3CRT32rj9CHoV27sz0Hy4dzJ9OfL1lO7p0U9a9n3TaVIMc6uRUlDC/oInCPN
         lcgg==
X-Forwarded-Encrypted: i=1;
 AJvYcCU4dCEeDEj/4sqJ52WkgZF3+DULa62W9ev7bj+P/muQHtiKeYrCpz0cGtDcHMHaqQTv0aDRqsEJWfE2d6XCXFy8IJ/UFdSff1z+Lrc=
X-Gm-Message-State: AOJu0Yw/yKLEVZ6X80RfYN7hs5WF//ECT50As//qTBdyorF0jVsw7MPR
	Q6CPb0rBtwhTWNjEUI1GZQ7lILOUfH6YtSwcS4kAuLsb5n2vDQfwE2gvZ6MSAKM=
X-Google-Smtp-Source: 
 AGHT+IHDRsDMr0SXIA1BZFJa3MxdxnnQmiYZftYqYOsfFpe40vWDa1uC6IrsGh3VJIa1HBNRB3jl0Q==
X-Received: by 2002:a5d:628d:0:b0:343:bccb:dbbb with SMTP id
 k13-20020a5d628d000000b00343bccbdbbbmr1888712wru.12.1712757736649;
        Wed, 10 Apr 2024 07:02:16 -0700 (PDT)
Received: from [192.168.1.172] ([93.5.22.158])
        by smtp.gmail.com with ESMTPSA id
 w5-20020a5d5445000000b003439d2a5f99sm13761613wrv.55.2024.04.10.07.02.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Apr 2024 07:02:16 -0700 (PDT)
Message-ID: <50bf4fb6-7ad8-40b7-ad95-c1fc5e292149@baylibre.com>
Date: Wed, 10 Apr 2024 16:02:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 06/18] ASoC: mediatek: mt8186: Migrate to
 mtk_soundcard_common_probe
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 broonie@kernel.org
Cc: wenst@chromium.org, lgirdwood@gmail.com, robh@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 matthias.bgg@gmail.com, perex@perex.cz, tiwai@suse.com,
 trevor.wu@mediatek.com, maso.huang@mediatek.com,
 xiazhengqiao@huaqin.corp-partner.google.com, arnd@arndb.de,
 kuninori.morimoto.gx@renesas.com, shraash@google.com,
 nicolas.ferre@microchip.com, u.kleine-koenig@pengutronix.de,
 dianders@chromium.org, frank.li@vivo.com, allen-kh.cheng@mediatek.com,
 eugen.hristev@collabora.com, claudiu.beznea@tuxon.dev,
 jarkko.nikula@bitmer.com, jiaxin.yu@mediatek.com, alpernebiyasak@gmail.com,
 ckeepax@opensource.cirrus.com, zhourui@huaqin.corp-partner.google.com,
 nfraprado@collabora.com, alsa-devel@alsa-project.org,
 shane.chien@mediatek.com, linux-sound@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 kernel@collabora.com
References: <20240409113310.303261-1-angelogioacchino.delregno@collabora.com>
 <20240409113310.303261-7-angelogioacchino.delregno@collabora.com>
Content-Language: en-US
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <20240409113310.303261-7-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MailFrom: amergnat@baylibre.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: PCE5H6CWWTM4ZFVKRSAO2FM6IQ7VHDBR
X-Message-ID-Hash: PCE5H6CWWTM4ZFVKRSAO2FM6IQ7VHDBR
X-Mailman-Approved-At: Thu, 18 Apr 2024 15:46:02 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/PCE5H6CWWTM4ZFVKRSAO2FM6IQ7VHDBR/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>

On 09/04/2024 13:32, AngeloGioacchino Del Regno wrote:
> Add mtk_soundcard_pdata platform data for the MediaTek common sound card
> probe mechanism, including a driver/soc-specific probe extension (used
> for bits that cannot be commonized  hence specific to this driver), and
> change the probe function to mtk_soundcard_common_probe.
> 
> This is also adding the possibility of specifying the links and routing
> with the audio-routing property and (x)-dai-link nodes in device trees
> to stop hardcoding machine specific links in the card driver assupported
> by the common probe function, but support for legacy device trees is
> retained with a legacy_probe function, which is used only in case the
> new properties are not found.

-- 
Regards,
Alexandre
