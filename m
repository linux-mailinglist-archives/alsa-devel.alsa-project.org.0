Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 789558A9EF7
	for <lists+alsa-devel@lfdr.de>; Thu, 18 Apr 2024 17:48:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1B201B70;
	Thu, 18 Apr 2024 17:48:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1B201B70
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1713455317;
	bh=GlhTbnoCH5LqqMhlWZX4WN6cM8JR3RmYHTCTw3QDhGU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Rw4NqtQIiT2re7x7VIXFxudFFt610hhZ5yuak8sknG5bZCB75uq/Ijag0Utw8Ck6u
	 lBNViFY+eEj6Y5vHwPplBV5wERiyzqkI3C4Ust5va917Y49byCeuIjPViYTgBv6iMa
	 8C67kvNG6AlbFnBj8PSBcIoHC/voVmnNKYO9I22s=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 23971F808C0; Thu, 18 Apr 2024 17:45:14 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5B6B6F8085C;
	Thu, 18 Apr 2024 17:45:14 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CCEA0F8026D; Wed, 10 Apr 2024 14:46:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id EB4E1F800C9
	for <alsa-devel@alsa-project.org>; Wed, 10 Apr 2024 14:46:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EB4E1F800C9
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=baylibre-com.20230601.gappssmtp.com
 header.i=@baylibre-com.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=WHU4aSaq
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-417c3296643so1256515e9.0
        for <alsa-devel@alsa-project.org>;
 Wed, 10 Apr 2024 05:46:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1712753183;
 x=1713357983; darn=alsa-project.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AvhmE586Q7RJLDEspXESCrmM8e1J4xn7f2FL+r1Qxs4=;
        b=WHU4aSaqe4D6onI6bKsb0XTAbWAvhRiHntAoWV6fV7tmCFB5y1SKphyGx+gRXL3O9A
         mChtKkiTfPovRnUE9H9ug5dmddJHsuNMirUN/JP9uNSsFxxYf+N2HTnOOIDx/k7hdFUW
         vkbOSyTUE9fYbi8YywRdLjEdmDcpN9Xekf8ZUCv5eVcr/63ARq+i5TuLRr2Bko07IxPh
         p9FlcZ8q35BaHutOctA5lzNc6mF+12NTv7DW3yoWztiEwWYZh3Uc5m+ncfYDmlwD1RFt
         V5Sh718MRdD4gsZNGpXKAUt3xUXAdwBhQxCkUr/4pOlsHU6RqI6Dofx2TiueteiCMJuN
         wncA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712753183; x=1713357983;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AvhmE586Q7RJLDEspXESCrmM8e1J4xn7f2FL+r1Qxs4=;
        b=AchPIreQRermtyo4eO57la7F9flMbfB7L+yAc1Pf4QPGkHmc7HzfcZ7b/nG+zvmjMY
         6bv0v2Vhpp8DUTdqaqiutZN7zK3htJCwP7kOV+SM7ZVzuLBqm76ODf1lFRMBsHNxVDMH
         degTefLTsKKV8HqK28q0ENG2r3YOb9D+asPyj1cfRK1sP3Zvq9XjboL6kDxKSV7PT3eS
         5DGKu8D3evk/lncCaae8ZyHbfVhen5GJC6fzDaTxtydz/byZoOECMwewh5dk+SzwuA38
         Rlj0RXmhExL7bRD7o57NAbMJik8xg1u9Ti0cIQfhSl0POQByBJ68kuGp3qXD0hFr6l0i
         6XWg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXQyIKpRI2ffoZr4XU6LRPF8a/RnJg1IfEiUjBZdS0xStyonHozxleAZznVsKL0yNi1307fDFhNEQbfKQh9P1eTbdca8zIXXGAg07k=
X-Gm-Message-State: AOJu0YzxIhb7lndmVUI0QSVPCahYlKp7naCzbrlG+TAr8NXUzzpdk1am
	rQtPtFLw2PGeZJiIAkdY1aAknLq0n6XnIFuleGOG6ZHn3mTr9lWLXjVP36VTylw=
X-Google-Smtp-Source: 
 AGHT+IH/p5zp4MA87AZJY28HHV74sXRlJbaCaAhPeW3fvyn77BGC/TGc4xDQpjJDHMWC56s9vnYqaw==
X-Received: by 2002:a05:600c:198e:b0:416:a8b8:a8a7 with SMTP id
 t14-20020a05600c198e00b00416a8b8a8a7mr1764086wmq.40.1712753182974;
        Wed, 10 Apr 2024 05:46:22 -0700 (PDT)
Received: from [192.168.1.172] ([93.5.22.158])
        by smtp.gmail.com with ESMTPSA id
 v13-20020a05600c470d00b00416b06656ecsm2190983wmo.9.2024.04.10.05.46.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Apr 2024 05:46:22 -0700 (PDT)
Message-ID: <713cbf7d-8418-44a8-9b35-6503fe3df0d6@baylibre.com>
Date: Wed, 10 Apr 2024 14:46:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 02/18] ASoC: mediatek: common: Constify struct
 mtk_sof_priv
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
 <20240409113310.303261-3-angelogioacchino.delregno@collabora.com>
Content-Language: en-US
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <20240409113310.303261-3-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MailFrom: amergnat@baylibre.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: CLJMFNWCM4OW6RFR223LCUCKPFJJ6RXN
X-Message-ID-Hash: CLJMFNWCM4OW6RFR223LCUCKPFJJ6RXN
X-Mailman-Approved-At: Thu, 18 Apr 2024 15:45:01 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/CLJMFNWCM4OW6RFR223LCUCKPFJJ6RXN/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>

On 09/04/2024 13:32, AngeloGioacchino Del Regno wrote:
> Apart from a dai_link_list variable, the mtk_sof_priv currently holds
> data that never gets modified during runtime.
> 
> Constify the mtk_sof_priv structure and move the SOF dai_link_list as
> sof_dai_link_list in struct mtk_soc_card_data, which is a structure
> that already holds the card's machine specific, runtime modified data.
> 
> This allows to safely pass the mtk_sof_priv structure as platform data
> for the commonized card probe mechanism.

-- 
Regards,
Alexandre
