Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F8F36E0E70
	for <lists+alsa-devel@lfdr.de>; Thu, 13 Apr 2023 15:21:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B1371F18;
	Thu, 13 Apr 2023 15:20:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B1371F18
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1681392066;
	bh=fiVbRYVJgy+2ZHaK5RJJdYNNzMiNbH1SfT0w+/lH5Co=;
	h=Date:Subject:To:References:In-Reply-To:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From:Reply-To:Cc:From;
	b=gJ7DQUB917ltqdSJVl4pMFWl2INGeXXEQ3foVg9wRgLFwUifB+QT677cLUFfMSGSD
	 SKXUvgkv8ZG4F7IE765oTDI4ef3GD+NOQcDpJKupg7q0QcA48yUT7zuJ8ysy1Pm6Ft
	 gC6xuBQZJ+6eurWbcnyJvz/iLK6u9TedGfUEm1a4=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6204AF8025E;
	Thu, 13 Apr 2023 15:20:16 +0200 (CEST)
Date: Thu, 13 Apr 2023 15:19:57 +0200
Subject: Re: [PATCH 6/7] ASoC: mediatek: mt8188: add bus protection
To: Trevor Wu <trevor.wu@mediatek.com>, broonie@kernel.org,
 lgirdwood@gmail.com, tiwai@suse.com, perex@perex.cz, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com
References: <20230413104713.7174-1-trevor.wu@mediatek.com>
 <20230413104713.7174-7-trevor.wu@mediatek.com>
In-Reply-To: <20230413104713.7174-7-trevor.wu@mediatek.com>
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ICTZLVYY74GACZD3ZDWDTSZC4A4X6HNO/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>
MIME-Version: 1.0
Message-ID: 
 <168139201516.26.18295375005864163316@mailman-core.alsa-project.org>
From: AngeloGioacchino Del Regno via Alsa-devel <alsa-devel@alsa-project.org>
Reply-To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: alsa-devel@alsa-project.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
Content-Type: message/rfc822
Content-Disposition: inline

Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EBFFDF80448; Thu, 13 Apr 2023 15:20:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7C81BF800E5
	for <alsa-devel@alsa-project.org>; Thu, 13 Apr 2023 15:20:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7C81BF800E5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=collabora.com header.i=@collabora.com
 header.a=rsa-sha256 header.s=mail header.b=cIUmClu7
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id DBD726603218;
	Thu, 13 Apr 2023 14:19:59 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1681392000;
	bh=zyLNmnfNyceNKY5LBE9mhScILY9Dbz+FbeLmTMBp8cI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=cIUmClu7FHs9xjiZexEXmR0VU1d1P+tGwjVpRX4TWVwOZElm4SUn04vjhvZtr3nB2
	 RKOAO9gIeSpqAciIquSuCiAZvOIOQ5i6jBFabD15GZzyxsNO/ln1NrWMYBj5ibtT8i
	 A5zp7xgt/QP21zGOovUYf24THw2egu5cLb6sEE8+p08GGgG/ilL0PaY6in2022QgPr
	 BgENQvB70mbOOkS4n8eaW+DpvpqAxkNcZnkYOJYgVvWnhKJng0Uh49Yrn194vnEBgc
	 UFfkNGDGELPO2TI5fNikL3WgDAGJIzpcbhIRHt6UAtXYtOHITGyFHVvy0cqXhEj4mh
	 PzRyRSAaBpHdA==
Message-ID: <23dea66b-27cd-dbeb-37f5-ad9566e50962@collabora.com>
Date: Thu, 13 Apr 2023 15:19:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH 6/7] ASoC: mediatek: mt8188: add bus protection
Content-Language: en-US
To: Trevor Wu <trevor.wu@mediatek.com>, broonie@kernel.org,
 lgirdwood@gmail.com, tiwai@suse.com, perex@perex.cz, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com
References: <20230413104713.7174-1-trevor.wu@mediatek.com>
 <20230413104713.7174-7-trevor.wu@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230413104713.7174-7-trevor.wu@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Message-ID-Hash: ICTZLVYY74GACZD3ZDWDTSZC4A4X6HNO
X-Message-ID-Hash: ICTZLVYY74GACZD3ZDWDTSZC4A4X6HNO
X-MailFrom: angelogioacchino.delregno@collabora.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ICTZLVYY74GACZD3ZDWDTSZC4A4X6HNO/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Il 13/04/23 12:47, Trevor Wu ha scritto:
> Add bus protection for reset controller.
> 
> Signed-off-by: Trevor Wu <trevor.wu@mediatek.com>

Is MT8188 the only SoC that will ever use bus protection for reset, now and
in the future?

...otherwise, I think that the best solution here would be to implement that
into the reset controller itself.

Regards,
Angelo
