Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CF918A9F13
	for <lists+alsa-devel@lfdr.de>; Thu, 18 Apr 2024 17:51:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EB65E14EA;
	Thu, 18 Apr 2024 17:51:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EB65E14EA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1713455495;
	bh=n4JrkSorhynZmSYFDegpGZt7tneK34MYTFY2bPGDfD0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=K665wspAxBqC2ovH0fvxdzin3VREuPWjo4GkNnVKNIAX9RMEvoDr49oCBAom1NXJ9
	 fN0tkSNk3HK64kVPMXWI+U2KxHc0B2YYKQKLFswjvZwl/jV0wZkgnSrWeoOFFYQfaI
	 KdTmW/874K2f34rhFAz4xtxl2waCBrPBW3h1sIzQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7AA2CF896EB; Thu, 18 Apr 2024 17:46:25 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id EA49AF896FC;
	Thu, 18 Apr 2024 17:46:24 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 24211F800C9; Wed, 10 Apr 2024 17:13:56 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 213F1F800C9
	for <alsa-devel@alsa-project.org>; Wed, 10 Apr 2024 17:13:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 213F1F800C9
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=baylibre-com.20230601.gappssmtp.com
 header.i=@baylibre-com.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=iIo0zJRc
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-34682953048so409883f8f.3
        for <alsa-devel@alsa-project.org>;
 Wed, 10 Apr 2024 08:13:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1712762030;
 x=1713366830; darn=alsa-project.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Xb0tDuasjSNlJsy4sDFiJMtEhz1/MxQR3B46cvvCuH4=;
        b=iIo0zJRccYf3vOKNJv398mm7Y6FkCF3VrLqebyLBm7CKjZ/QQH9SB/vzeQxwnFgi3u
         yDQVRnQtwFmT+Ah9ElGCZi8Mi4MeqN+Nh7uFunFcZxQQ+vcRvYzluZaF7Gw6afOiik/Q
         haelVqR7KmxzcgMM2YfzXk2iRmqxJ8lgacXtvU9F9iYnyXk6fBCyzJgziQReJvC7rGT0
         xGjbsizoogn51mF9LOBN8RwL57kCniJocb71IPx7l6JAw0lq0Supr1btTK7TueP181BZ
         Hr1A1Bi0D0mVvM6GjNLxY9VUqAA7vH77OLpsn+sLUI27DkkwODTYNuY33HvISf2R5zK2
         ex7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712762030; x=1713366830;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Xb0tDuasjSNlJsy4sDFiJMtEhz1/MxQR3B46cvvCuH4=;
        b=mZaV8iLHMYpz/n3UONMloBLG+CZ1j3QNWPPczwVFhtgb1HfUduIv5CLPuCcm7n/bww
         qbpobU8zmPOHv2G341X5U0+phmSKLWT5aJG5Hioc/B1sHVGX7fadOW24H275VIkP6NM+
         qb5dp8643aWR96plHBHjAxKdQ1uezTt9JWS4mjPhjxd/fD/PQX31z5DYUu0jgiAFU8z1
         R/D70oXAYWIe45gg6PBD5bbRUxUP5Aw4Lk8BFla2EoqxkZZOgsiSNiHxdPGDDIXwMSi8
         l0hJKtFhQiLlwmMSlitGXKXKgff429aIoIQZUcTqMREH/hWZKVMls2+oou1KzJjY0Trz
         4QJw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWnFRvdFiG/vt/3N8Y1nQOypdIiISj9lR1B3sq+owJ1truZtmOibaJM/RM7oS1W6NqIi0LNf+GqNCh0W80GjRHWnHca8iHho3Oj0lw=
X-Gm-Message-State: AOJu0YwnwIuDU2EOAcbNNlfH8pveesV0L9kKnYs2BD7dn0IfYsZn6ky6
	qRRaI4G+j5EwFxrQaPy0F97Pbu1VZFcEGMAVATJ4gleE4Wyi+dDOO3jpLo/KRuE=
X-Google-Smtp-Source: 
 AGHT+IGoier3Sm8gMlqmjZALBvxdoG/1vWwzVX851wh99fQXUyteeMA3kD8B7Fgl7bkM9Q+1QuTWTQ==
X-Received: by 2002:a05:6000:186b:b0:343:6b76:251f with SMTP id
 d11-20020a056000186b00b003436b76251fmr3201804wri.42.1712762030404;
        Wed, 10 Apr 2024 08:13:50 -0700 (PDT)
Received: from [192.168.1.172] ([93.5.22.158])
        by smtp.gmail.com with ESMTPSA id
 n15-20020a05600c500f00b00417c0fa4b82sm1118117wmr.25.2024.04.10.08.13.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Apr 2024 08:13:50 -0700 (PDT)
Message-ID: <fd7cc1d7-f293-47f9-9ff6-98b78150d61e@baylibre.com>
Date: Wed, 10 Apr 2024 17:13:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 11/18] ASoC: mediatek: Add common
 mtk_afe_component_probe callback
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
 <20240409113310.303261-12-angelogioacchino.delregno@collabora.com>
Content-Language: en-US
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: 
 <20240409113310.303261-12-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MailFrom: amergnat@baylibre.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: J3WSNYXICBK74OHHUPFAABCNK7QVHMLT
X-Message-ID-Hash: J3WSNYXICBK74OHHUPFAABCNK7QVHMLT
X-Mailman-Approved-At: Thu, 18 Apr 2024 15:46:03 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/J3WSNYXICBK74OHHUPFAABCNK7QVHMLT/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>

On 09/04/2024 13:33, AngeloGioacchino Del Regno wrote:
> Multiple MediaTek AFE PCM component drivers are using their own .probe()
> callback, but most of those are simply duplicated functions as they are
> doing exactly the same thing over and over.
> 
> Add a common probe callback for this component to reduce duplication.

-- 
Regards,
Alexandre
