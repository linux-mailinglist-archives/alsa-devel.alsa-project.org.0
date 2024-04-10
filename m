Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 911CD8A9EF8
	for <lists+alsa-devel@lfdr.de>; Thu, 18 Apr 2024 17:48:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3BB00EBE;
	Thu, 18 Apr 2024 17:48:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3BB00EBE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1713455317;
	bh=XvD5fOS/hQ7HPF9KYvW4fabBNiId/tBgRPWvKt02DhA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=HDweBnHH2HKtjxMAc9CvbOHIYuztrN0brEnZNWpwV/6gvhsvjr4teaRd0e54jlfwA
	 0b6FrwC+7un/8Z/wLJU6qQZPDo4ou4erZ+/w7lqIex2GhfTI1sqoe4M+s85/JEUxtW
	 em4cNUuqMfrnmGbPBH+uNCEXTIXEbMGRZt62FIb4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 45182F80BF3; Thu, 18 Apr 2024 17:45:16 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 49427F808C6;
	Thu, 18 Apr 2024 17:45:16 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B8961F8026D; Wed, 10 Apr 2024 14:58:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E5D17F80130
	for <alsa-devel@alsa-project.org>; Wed, 10 Apr 2024 14:58:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E5D17F80130
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=baylibre-com.20230601.gappssmtp.com
 header.i=@baylibre-com.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=LarEj+xQ
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-343c7fae6e4so4466523f8f.1
        for <alsa-devel@alsa-project.org>;
 Wed, 10 Apr 2024 05:58:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1712753892;
 x=1713358692; darn=alsa-project.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SAPCyLKBSHRTWSRRoqdJH1JxTgNtm+xffvG0gyEDWQ8=;
        b=LarEj+xQ0M02CKWNX7uSZm/6sOjwvBWDkvsNlewBkAWxPUZ2JmtVLCxK58aMpb2akj
         m/5Qh3fR/wlJoMfvhDTD/S6ALrXLYPgkrPMXIuY4F2hL37iB++tr6A5hIVPH/ryPFHd8
         Pm6lMZJM13TnVhosrm5x6jqeFGdMDqC6Foi6jfhCKuzCL0y0yrOHMnfyRr1BnzIU0D5e
         JwgJXFlSDfjWGoBd75jqov5yMRCY9YS0R1ZmOAvYtiGo8RSeZWBoF3Rm8BwOGd76IEzK
         EkYYuIgiii6M448EOuOUsiD7PAL8Iy7CCHp/tkPWeoa0He4Wg/tL9x3YX9rrWxc7jfok
         I9UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712753892; x=1713358692;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SAPCyLKBSHRTWSRRoqdJH1JxTgNtm+xffvG0gyEDWQ8=;
        b=oplG/EawuN8V7+GFi7ZUjHEDaIrIbbeazne6ByHipHuxAFAD+U5RrUg/v2agXqLiVV
         HbD2xWfO8TiTkDk7OuzCKFlV9yEcaD7b0vjkgQJr80hn1rGYxBsd6GdyEhHynQDd5ByS
         qV+rm+iGjj8myJKCYrd93095An/D7qIdUQGInSBMVCdnzkMWx3z7D++fpCDOzYuRHVch
         xj2+ipTyUBy4oP7WQ9R2qXH1uGMCXApn6HIMyKW8w/u3NNW3e+sUVUx92tAvxBfZqnG1
         EO3e/X2mPBGOKvKH163BAV2xhJmegzc7ZYrGymV72lWl8yd1UNoPl7huyFY7NaTAU2Qw
         JD/A==
X-Forwarded-Encrypted: i=1;
 AJvYcCVpKZO80/olUiP3mHU3K6mnXk71ijwiSyrAQ6TEfwGfxhwKg0Ez6q2GXSpB5yLK9pps9Dd5agMgVaFVWKWlYh3p+t04T4H9eC+SyO4=
X-Gm-Message-State: AOJu0Yxob4iJ4pCbHVDm4cSKxM/3j4G8hgM10IL+XdK64I7gi/M1wiRv
	BzqKXakNEM3AOOfPctnrT7iidR5YLEH8svhQft6C8ELAyBcAtHBc6YFKB4+jkjU=
X-Google-Smtp-Source: 
 AGHT+IHfa120qRAfspKcAyRMy5PXxHlCGJzmW0vlTzwyQGnoeYFwCg8fQKa0TokP1NrBdWntPAlpFg==
X-Received: by 2002:adf:ee8c:0:b0:346:47d6:5d17 with SMTP id
 b12-20020adfee8c000000b0034647d65d17mr1758280wro.57.1712753891611;
        Wed, 10 Apr 2024 05:58:11 -0700 (PDT)
Received: from [192.168.1.172] ([93.5.22.158])
        by smtp.gmail.com with ESMTPSA id
 l4-20020a5d4104000000b00343e392829dsm13404941wrp.97.2024.04.10.05.58.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Apr 2024 05:58:11 -0700 (PDT)
Message-ID: <4c43eafe-f173-4a35-962f-a5f5f020a587@baylibre.com>
Date: Wed, 10 Apr 2024 14:58:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 03/18] ASoC: mediatek: mt8188: Migrate to
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
 <20240409113310.303261-4-angelogioacchino.delregno@collabora.com>
Content-Language: en-US
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <20240409113310.303261-4-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MailFrom: amergnat@baylibre.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: XEZB6Q4DC42JB4QBCKIUKFKKQBZIZEQA
X-Message-ID-Hash: XEZB6Q4DC42JB4QBCKIUKFKKQBZIZEQA
X-Mailman-Approved-At: Thu, 18 Apr 2024 15:45:03 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/XEZB6Q4DC42JB4QBCKIUKFKKQBZIZEQA/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Similar changes has been done for mt8365, it works.

Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>

On 09/04/2024 13:32, AngeloGioacchino Del Regno wrote:
> Add mtk_soundcard_pdata platform data for the MediaTek common sound card
> probe mechanism, including a driver/soc-specific probe extension (used
> for bits that cannot be commonized  hence specific to this driver), and
> change the probe function to mtk_soundcard_common_probe.

-- 
Regards,
Alexandre
