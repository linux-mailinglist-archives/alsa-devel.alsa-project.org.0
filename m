Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B95088A9F15
	for <lists+alsa-devel@lfdr.de>; Thu, 18 Apr 2024 17:51:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5B84C20C5;
	Thu, 18 Apr 2024 17:51:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5B84C20C5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1713455508;
	bh=xJfhI9QPat0r98+lhtVmHv0dk3LFeZuD6e/my70ds9U=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=OA3p3bia2yNuyjhU2YoXvMRq2JZ4Sg860XzAq6OMwJJwMtVHPQQkHOzGQI1xQGNNh
	 ecAwDYNQvzfIpSsUvOQro8zGFqjsDBheMFj8BF+me7QSd3obFLt/sh2PMwnSYzr0IO
	 CDU0LTDkpjAcVsv00X3JAbJCG4kB96qTVjjfILdU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9D1EAF805D2; Thu, 18 Apr 2024 17:47:04 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A594EF805A0;
	Thu, 18 Apr 2024 17:47:04 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 73B8BF8026D; Wed, 10 Apr 2024 17:14:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3FD50F8013D
	for <alsa-devel@alsa-project.org>; Wed, 10 Apr 2024 17:14:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3FD50F8013D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=baylibre-com.20230601.gappssmtp.com
 header.i=@baylibre-com.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=1hgOk/Bt
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-343e46ec237so4099425f8f.2
        for <alsa-devel@alsa-project.org>;
 Wed, 10 Apr 2024 08:14:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1712762071;
 x=1713366871; darn=alsa-project.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rTWr7zCunTSu7yV6LyAJ4TilgZ8hrFbQ0RRY5+GeIDY=;
        b=1hgOk/BtKSoUdR4Zi/hX7ozBOn6x0+k6LOi2xiDKBJ8A+lmGLTd8Oo25+R1k0A9wwv
         Wb6PrZKEqg39/p3LzZggdkOJprVWDh9Jo9SS4yEk85uSJkbOjDXST4y4tbb3oKIvSj6D
         CJ0iMHV8qd9vKOijPwa3RSRVhzE0coogce6Jh5QUvITKnSdrZDYyZxd9BsCIsvsQT7Cu
         JbW6PepKtrHqbaUeKFSyIndC9v5ayT5T/cmZS82tvlis4SfF6kEC6XsRXO3fUJSeGzSF
         xVq/7j7+YrWPfnU9kPY7zyCPi5TTQ6kOmFO6ZGjx200LKY1H99ngsFY3jxTvDgFsFg33
         O6SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712762071; x=1713366871;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rTWr7zCunTSu7yV6LyAJ4TilgZ8hrFbQ0RRY5+GeIDY=;
        b=MLw8Fcf2CFEGICuxS+58lGLa/ynS+DAldUMrYlnFr2IfSxpDt680ki/PzI8K25HcSI
         v0nCyXEjv72IOKYux75ypSGJlYGQGWTuZIDOn8J2KWoWf3bW+og/bDT/EC2h9Fgfp5yH
         AlMgO0/PrJsxADbQhkPhiXeMP6YaXul0pcnIgaBUeE9SIyMrYJaZy55wJldoPmclFdbd
         3+akMLT0zJctg1M4+g+1/oacsp70N0OGbKoei+7FavMVroV9VHQcbkHjCB2Ssbu5QcVu
         w46NRf/l2eJukRdQ1yjO5ZBBJ2yX/WX8mhnRdtZb+x05/jMn5SHL4uJGZ/HRp/cpT3Vg
         UWPA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUayKa6HNIrBbTT81bSiJb73pwYVWsDEOwnGyBlGByiWg4eAagDiFpGs8Njk2fB4R1AE8cyc5dVnKFqlYNjBN/1nyYqel8GOQi+agk=
X-Gm-Message-State: AOJu0YyY7v8g3Ow4uF6rCNz6eFPQbtIT54VuTO3Xc6wW8qteF4V31NpF
	2bLJBBNZbBG93dt/fyXaYk2wwlbCURPQXuGZjwogRcWVFrMc3hq4KxVtBKNYpGA=
X-Google-Smtp-Source: 
 AGHT+IHsg96eOL2a4LJhVDQUrGOMuFbwCCDLT+zKpSk4ARDLKr/ObMqBjfvII1zIu2uKlKh/jpN3ew==
X-Received: by 2002:a05:6000:2a5:b0:343:7b6b:dcc6 with SMTP id
 l5-20020a05600002a500b003437b6bdcc6mr2373938wry.30.1712762070970;
        Wed, 10 Apr 2024 08:14:30 -0700 (PDT)
Received: from [192.168.1.172] ([93.5.22.158])
        by smtp.gmail.com with ESMTPSA id
 d26-20020adfa35a000000b003469e7f5c52sm176322wrb.80.2024.04.10.08.14.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Apr 2024 08:14:30 -0700 (PDT)
Message-ID: <437bdabd-f16e-4a2d-b9c2-55c91b2e399e@baylibre.com>
Date: Wed, 10 Apr 2024 17:14:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 12/18] ASoC: mediatek: Use common mtk_afe_pcm_platform
 with common probe cb
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
 <20240409113310.303261-13-angelogioacchino.delregno@collabora.com>
Content-Language: en-US
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: 
 <20240409113310.303261-13-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MailFrom: amergnat@baylibre.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: 2EQP2H4W3J6HXVT77W4YITH4HCZBGXHI
X-Message-ID-Hash: 2EQP2H4W3J6HXVT77W4YITH4HCZBGXHI
X-Mailman-Approved-At: Thu, 18 Apr 2024 15:47:00 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2EQP2H4W3J6HXVT77W4YITH4HCZBGXHI/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Also done for mt8365-afe-pcm in my serie

Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>

On 09/04/2024 13:33, AngeloGioacchino Del Regno wrote:
> Since the mtk-afe-platform-driver generic mtk_afe_pcm_platform now has
> a common .probe() callback, there is no reason to keep duplicating this
> function over and over in the SoC specific AFE-PCM drivers: switch over
> to register with the common bits instead.
> 
> Note that MT8186 was left out of this because it is registering some
> extra sinegen controls in the AFE-PCM probe callback and needs extra
> cleanups to be able to use the common bits.

-- 
Regards,
Alexandre
