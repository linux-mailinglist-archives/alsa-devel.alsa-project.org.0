Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E23671983F
	for <lists+alsa-devel@lfdr.de>; Thu,  1 Jun 2023 12:04:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 49917822;
	Thu,  1 Jun 2023 12:03:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 49917822
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1685613877;
	bh=huazch6Zt+IHAcq/GNSQQgxY8jrr5NELWOKD4q8xUaE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=AtsWjtXABx8norxIt5Ulztfq0RWeH+zdQmSyMun1rH/T/kBXV8HRX5DRD/OoC4u4w
	 rZefakbi7x90m9rp8TWY4hNC9rNE9Sx8qS9/4Gog85o2JMPssDYp5rWJTkHrnTNXV+
	 ioDp6+SGsDe+0GxS5LpaS+FYO4ERCHFRqJ3fuOJc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A91C9F8055C; Thu,  1 Jun 2023 12:02:57 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 60739F80549;
	Thu,  1 Jun 2023 12:02:57 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B66A5F80149; Thu,  1 Jun 2023 12:02:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3075BF800C1
	for <alsa-devel@alsa-project.org>; Thu,  1 Jun 2023 12:02:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3075BF800C1
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=collabora.com header.i=@collabora.com
 header.a=rsa-sha256 header.s=mail header.b=ATNpvjzQ
Received: from [IPV6:2001:b07:2ed:14ed:a962:cd4d:a84:1eab] (unknown
 [IPv6:2001:b07:2ed:14ed:a962:cd4d:a84:1eab])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 25F406606EBC;
	Thu,  1 Jun 2023 11:02:45 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1685613765;
	bh=huazch6Zt+IHAcq/GNSQQgxY8jrr5NELWOKD4q8xUaE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ATNpvjzQe4zTjY8d+Fe0GtJpH9aKZB1O4xYWet9M9Aac9H/m1JsBYANT35Jj4/hJX
	 xPXttlFd17NVY1zYfVfqGFK8tkPuRwPXODazZXmQcClMXv10XPaC9/oYk153Mr4WBf
	 YquoYvs7smmxUFZCgF9VI//ro5f6tjFwMmsuqS11nIHEDwx2dfY3WGJopj+Jn8c6/c
	 UOJtK3QqiLw57xYQgdI/RPYHfEaSv8MNJtamhWyJD2UanyWHwJ4+cYeITE4CwcQ6/T
	 N4PhIjjuDa2sTYfSRg8LnDhTZsSalqwleac5w/vadk3wlQWIJe1M1dRGewqW5+weFZ
	 NM3BfJeiJC06w==
Message-ID: <b7864c7d-172e-9903-278c-63df45f6a0ff@collabora.com>
Date: Thu, 1 Jun 2023 12:02:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH v2 2/2] ASoC: mediatek: mt8195: fix use-after-free in
 driver remove path
Content-Language: en-US
To: Trevor Wu <trevor.wu@mediatek.com>, broonie@kernel.org,
 lgirdwood@gmail.com, tiwai@suse.com, perex@perex.cz, matthias.bgg@gmail.com
Cc: dianders@chromium.org, alsa-devel@alsa-project.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20230601033318.10408-1-trevor.wu@mediatek.com>
 <20230601033318.10408-3-trevor.wu@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230601033318.10408-3-trevor.wu@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Message-ID-Hash: R7V336QUK56NBOY4SWUFQV4SJ42JVH4X
X-Message-ID-Hash: R7V336QUK56NBOY4SWUFQV4SJ42JVH4X
X-MailFrom: angelogioacchino.delregno@collabora.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/R7V336QUK56NBOY4SWUFQV4SJ42JVH4X/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Il 01/06/23 05:33, Trevor Wu ha scritto:
> During mt8195_afe_init_clock(), mt8195_audsys_clk_register() was called
> followed by several other devm functions. At mt8195_afe_deinit_clock()
> located at mt8195_afe_pcm_dev_remove(), mt8195_audsys_clk_unregister()
> was called.
> 
> However, there was an issue with the order in which these functions were
> called. Specifically, the remove callback of platform_driver was called
> before devres released the resource, resulting in a use-after-free issue
> during remove time.
> 
> At probe time, the order of calls was:
> 1. mt8195_audsys_clk_register
> 2. afe_priv->clk = devm_kcalloc
> 3. afe_priv->clk[i] = devm_clk_get
> 
> At remove time, the order of calls was:
> 1. mt8195_audsys_clk_unregister
> 3. free afe_priv->clk[i]
> 2. free afe_priv->clk
> 
> To resolve the problem, we can utilize devm_add_action_or_reset() in
> mt8195_audsys_clk_register() so that the remove order can be changed to
> 3->2->1.
> 
> Fixes: 6746cc858259 ("ASoC: mediatek: mt8195: add platform driver")
> Signed-off-by: Trevor Wu <trevor.wu@mediatek.com>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


