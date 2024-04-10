Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ED438A9EFB
	for <lists+alsa-devel@lfdr.de>; Thu, 18 Apr 2024 17:49:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3632114EA;
	Thu, 18 Apr 2024 17:49:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3632114EA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1713455352;
	bh=QvOn6cvji9QTSJm7bpuEUbJNN7acKTTuonvs3yRgL0s=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Yocks8hDmyBiqqbX0qtjNUxFGfKmJsmxnaC+IGHVjSnZ9ZAv1xF7pT9tmkk51b4z2
	 YQdonALK4eJh4LWR2w4YlA+aN8Oi5bTstsR15ANwKBNCdN9Y1+5t9RPdeKlDZEYNqO
	 i3ayfOiFqZGK14Q9rSSXtQe5jKdw/uJ52qWek/bI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4CD50F80815; Thu, 18 Apr 2024 17:45:18 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 33A16F8087C;
	Thu, 18 Apr 2024 17:45:18 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6304CF8026D; Wed, 10 Apr 2024 15:46:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C20EAF800C9
	for <alsa-devel@alsa-project.org>; Wed, 10 Apr 2024 15:46:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C20EAF800C9
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=baylibre-com.20230601.gappssmtp.com
 header.i=@baylibre-com.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=BkUvSQIf
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-417c5cc6be0so1213185e9.3
        for <alsa-devel@alsa-project.org>;
 Wed, 10 Apr 2024 06:46:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1712756774;
 x=1713361574; darn=alsa-project.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QNwy39mEHd5CSC3eirYZIbXLLfL+/dRw/DVFAe0gv+k=;
        b=BkUvSQIfPAbZ7dVsUHih2LTfXrVl6I+dJIGgFJ6djSILrueVHlm1W+VvMDMOkU072t
         /Y9y3fqF7nakEr3FC7ztjfypueOd3tdBRqJ9JW6oHFalg+GL8movPcpowbtZPIB44v6q
         Vg5lOJBsOwAQ27k2AlV3OCLvf6mjEz/Q33o1a/Byl3g9I9QJ7kFxn+eWkqXZOgaIu0AR
         F0mnmvw7XetQS4M0f+e3op6Z9lXoIe1t34wmQPK2+04G2KNbKACov+Vfho03JDTEUql8
         qqjVpk5nxu0XOXmg/zZyos9qkSLmHgp9STs7ZtrGNPoZGJFrMHgcQxFyZfpvwWxYHJVH
         Gn+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712756774; x=1713361574;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QNwy39mEHd5CSC3eirYZIbXLLfL+/dRw/DVFAe0gv+k=;
        b=pF6FUjiLF9FGY42a+tm1pDQX9fj2mgUgZE5ysgKFFCo3Ng1ZEOR2ZlOYskUu5XqADy
         TMVNWF92vRPB0rg+NfNH0i554rMmyRxQ+wFa77dzSQmm4rJRGV9jUVyFhOmomd09Jm6b
         5lhb/A+UfMGolXSF5dHer+8SGlHSCE6ucD9BYQO9IG6yiIUZbcCJepUxpr1cROz4uV28
         4ALNXHds/511yDvR9YXX2yE4DCyW7U50bX54swFjKjUll3x8IGvxaVZ4f5cvIatbMlXR
         CSsWx0IphV3oXVnG++M7vxX/Pm0qqLKO/oynQ86HZejX0Od4LVhkUZhhB2mjQZkUncsN
         dMUg==
X-Forwarded-Encrypted: i=1;
 AJvYcCX47ezx9sslgvn38tMgEM7b7Nn/Q7Y4QiTFoU8lfbm1FfKvHSA7SJK8hs6NuVmRcj9cJqowseWBd3CUTQV49F1Rp7t3DGMKzMoI9Pg=
X-Gm-Message-State: AOJu0YzOn4PWtCqh1LQXpC9yUbmqfRG8FWqfB6Nqh79N9nfvsI27uV1Q
	ZmgwAT5KyI1IP4RUI0RxhrU/iC3g1X6tiEJCJo2ukBIksKTKvIUsDVK7iTmUIQg=
X-Google-Smtp-Source: 
 AGHT+IGxsQggXycRi+dm4Bw4Xi8pQLO4aefRSNITx/omDNTFi8n4uULRx1pb1qcEcpuljXdkWzOSMA==
X-Received: by 2002:a05:600c:4446:b0:416:c990:d668 with SMTP id
 v6-20020a05600c444600b00416c990d668mr1409845wmn.8.1712756774480;
        Wed, 10 Apr 2024 06:46:14 -0700 (PDT)
Received: from [192.168.1.172] ([93.5.22.158])
        by smtp.gmail.com with ESMTPSA id
 o4-20020a05600c4fc400b004170e0aff7asm1931574wmq.35.2024.04.10.06.46.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Apr 2024 06:46:14 -0700 (PDT)
Message-ID: <dba5a3d3-97ba-491a-9290-35ffd42c740b@baylibre.com>
Date: Wed, 10 Apr 2024 15:46:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 04/18] ASoC: mediatek: mt8195: Migrate to
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
 <20240409113310.303261-5-angelogioacchino.delregno@collabora.com>
Content-Language: en-US
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <20240409113310.303261-5-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MailFrom: amergnat@baylibre.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: LEHMKS6KL632TADW4G5YTDI5FCETZY7A
X-Message-ID-Hash: LEHMKS6KL632TADW4G5YTDI5FCETZY7A
X-Mailman-Approved-At: Thu, 18 Apr 2024 15:45:04 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/LEHMKS6KL632TADW4G5YTDI5FCETZY7A/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 09/04/2024 13:32, AngeloGioacchino Del Regno wrote:
> @@ -29,6 +30,13 @@
>   #define RT1019_SPEAKER_AMP_PRESENT		BIT(1)
>   #define MAX98390_SPEAKER_AMP_PRESENT		BIT(2)
>   
> +#define DUMB_CODEC_INIT				BIT(0)
> +#define MT6359_CODEC_INIT			BIT(1)
> +#define RT1011_CODEC_INIT			BIT(2)
> +#define RT1019_CODEC_INIT			BIT(3)
> +#define MAX98390_CODEC_INIT			BIT(4)
> +#define RT5682_CODEC_INIT			BIT(5)
> +

Why are you using defines+single variable to track inited parts in the 
probe function but do it in the different way for legacy_probe using 
bool: is5682s, init6359 ? AFAII, both can use the same method with the 
defines above.

>   #define RT1011_CODEC_DAI	"rt1011-aif"
>   #define RT1011_DEV0_NAME	"rt1011.2-0038"
>   #define RT1011_DEV1_NAME	"rt1011.2-0039"

-- 
Regards,
Alexandre
