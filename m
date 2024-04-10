Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 991A98A9F0F
	for <lists+alsa-devel@lfdr.de>; Thu, 18 Apr 2024 17:50:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6B7CBE65;
	Thu, 18 Apr 2024 17:50:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6B7CBE65
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1713455457;
	bh=UKOOA8/7HQj4e+/LtfW4BZ4tyj66iZmzmBjEbudutfI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=eZH7cNz5fqL9BNlkY8ElBF2cdjEM0iaFlm7IDnWAnZgCs7kWCYWBgf3/ECEiCeeQF
	 pzodd2MnozdwTqLyGlpJLRPb9fi1bwfoI/7QhVmvlDv6kvCBjN70PtipDI+M+rDwF8
	 DwpBJgemnTuxshvJijd5wOO11QjnYJp5knWK+/Tg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1499FF89625; Thu, 18 Apr 2024 17:46:18 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 49AEBF8962F;
	Thu, 18 Apr 2024 17:46:18 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B87B7F8026D; Wed, 10 Apr 2024 16:55:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 54C03F80130
	for <alsa-devel@alsa-project.org>; Wed, 10 Apr 2024 16:55:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 54C03F80130
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=baylibre-com.20230601.gappssmtp.com
 header.i=@baylibre-com.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=np/nVNqg
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-416c3aca500so7966385e9.3
        for <alsa-devel@alsa-project.org>;
 Wed, 10 Apr 2024 07:55:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1712760943;
 x=1713365743; darn=alsa-project.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qkM79gW6w0NVDaaTQoSffcdoou57mwLCTgADK37diJ0=;
        b=np/nVNqgHCF76TwIjqR6S/2vM9T8jC+ItkRZtnSLiPZlGEP1Z5Tw+ekocmGmDyBsLO
         7UOvEnyGMeIzkIoztQhTxruEAUjSNNl3yoZWG7r21wdwQ3xF7qY5YOjXSBhKzme38IaF
         VYCrd8jMRGoWJjPHDbTyKzU3emHUMrBxnTkQTGZNWGNHMU0KJWuJuRC6bjz7P6TebhEb
         xoNe2+lEQWX3c5pKLTXJi5y8ISlnC/A/kkJAeWfhGs3xEKHgxTvUkm9wkahboM352NJO
         XDWC4OrHV0r/akeMSp5fkNezLZjLHG8iMjS6oE9Kq5azM497ojnyoq5l0Owr5w0TZbkI
         EbdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712760943; x=1713365743;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qkM79gW6w0NVDaaTQoSffcdoou57mwLCTgADK37diJ0=;
        b=FxX+FPnjJw7w8vWUkrFRe2OzJ4lGPGXznsWsutHz63JQ2jvzijm1gqTCoW+RdiWTof
         PYWfx7VKk+n863dmZHSIQIhLyT5ecEXdo9J0VVdQ5V+15frIOtY9Ju1TjpY1F1QgbdtU
         i9LNb+xndRgXclqqaIYxe2aNXdYC2ddz7uwJtYyWY621rrwxuhcPaLYUlIPidyxt8z7S
         CsyyUl/pQrCZyDgjd8utX9wa/TzPUt0o6WhfAt/PqqywTthQoAuLdQdEoG0W3MBmwCGW
         PdFwKoFNsp8PUTQO3b1ejRCgMDOlLsZrgs08pw+QTDBLoqxyia051XiWcaJbq16fdkQd
         BDWQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCURSu92lCBQoIt79/y+ZkrQIB1RbL/JXBZu5mKXZ+EkoEt6RNdFb713PWnxnGmZKXsNsz4zZs6wz1y0awElfowJmdmd5ztwkaAuJkI=
X-Gm-Message-State: AOJu0YxB9uZAZBRpREHGLCPMl4s38Cv6nBxdyWi2sokEQZ6LuJqxHsbl
	uff0SGqv5gFCgSKr0i+O970uaezZE4SJENwF32+D+810EuMB1Qh4G7SPg2YS+6M=
X-Google-Smtp-Source: 
 AGHT+IGNeLxOaiscREzifrbAz46PPEQrwOJh5pOyr0RZ/5W5R5nlpeialGLWcsM4T9o9oxKaQqjncg==
X-Received: by 2002:a05:600c:4511:b0:415:8651:9b8e with SMTP id
 t17-20020a05600c451100b0041586519b8emr2356050wmo.39.1712760943089;
        Wed, 10 Apr 2024 07:55:43 -0700 (PDT)
Received: from [192.168.1.172] ([93.5.22.158])
        by smtp.gmail.com with ESMTPSA id
 bg25-20020a05600c3c9900b004162d06768bsm2523860wmb.21.2024.04.10.07.55.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Apr 2024 07:55:42 -0700 (PDT)
Message-ID: <c86fb571-fc66-4549-9592-9ea984f3e49b@baylibre.com>
Date: Wed, 10 Apr 2024 16:55:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 09/18] ASoC: mediatek: mt8192: Migrate to the common
 mtk_soundcard_startup
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
 <20240409113310.303261-10-angelogioacchino.delregno@collabora.com>
Content-Language: en-US
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: 
 <20240409113310.303261-10-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MailFrom: amergnat@baylibre.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: ROM6X5SSWCOMD33UQ5JZ6OPPZIW2YEGF
X-Message-ID-Hash: ROM6X5SSWCOMD33UQ5JZ6OPPZIW2YEGF
X-Mailman-Approved-At: Thu, 18 Apr 2024 15:46:03 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ROM6X5SSWCOMD33UQ5JZ6OPPZIW2YEGF/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>

On 09/04/2024 13:33, AngeloGioacchino Del Regno wrote:
> Add a const mtk_pcm_constraints_data struct array with all of the
> (again, constant) constraints for all of the supported usecases,
> remove the duplicated functions and call mtk_soundcard_startup()
> instead in all of the .startup() callbacks.

-- 
Regards,
Alexandre
