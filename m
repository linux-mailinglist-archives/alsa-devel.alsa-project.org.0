Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C8ED07BD5E4
	for <lists+alsa-devel@lfdr.de>; Mon,  9 Oct 2023 10:54:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0FD97E12;
	Mon,  9 Oct 2023 10:53:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0FD97E12
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1696841689;
	bh=jVa5JJsIbd+rahqR791/qfoLZyjPB6foWAxVg7HpF4Q=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=UaskVMrBii+1SWc8mtEEQ+c4Ezeu44n5bSzFFsCM38F3jHEHUNyezajJF5pNCLQKj
	 djt8ScuSf6RW80j6T/bpZ+1l3nSvjRiEW3bmIHeIkH6V6leE8bZaxow1CSgj5M3J8r
	 Vjjdh0Zt4OqsY8ILvmE7hTYK55K065olFS+FNI8s=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F00E8F805D9; Mon,  9 Oct 2023 10:52:08 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 912BFF805C4;
	Mon,  9 Oct 2023 10:52:08 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 01780F805D5; Mon,  9 Oct 2023 10:52:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 081F6F8015B
	for <alsa-devel@alsa-project.org>; Mon,  9 Oct 2023 10:51:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 081F6F8015B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=collabora.com header.i=@collabora.com
 header.a=rsa-sha256 header.s=mail header.b=d9GAwpGy
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 6DA5366071A0;
	Mon,  9 Oct 2023 09:51:24 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1696841485;
	bh=jVa5JJsIbd+rahqR791/qfoLZyjPB6foWAxVg7HpF4Q=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=d9GAwpGy1eJgl1FB0lX80aRoFnxkbYksVn/r3F1yA+ms6jfgwAvql7A7GKhH2WYER
	 9V2U0IcVwCX6VQ7/5CoDDpe0Pa5ELNiivAILkwGboSQ1eACY728vy+83J8eN/l0f5y
	 65QuLsuIasNdehhJagG5lMUZH7yzReH2mnC8/KkTG0mTlQxntDoxer2Y3cAA2M27MA
	 DZDmZfeQG8uvnX9fqKL+/uNqi/EEESo00MNgeEtwBIUFJgwqsTtrWp/Bhj9NajsPip
	 dQ7XlJLz1fnitxnnLIawJwXndTPQZRjspqz9sRauhJbnDbGZAin/uKb6b6V4d1iKDo
	 V//5RC1YpI6ng==
Message-ID: <83998d0d-057f-191e-fd91-263f3c1eb2a7@collabora.com>
Date: Mon, 9 Oct 2023 10:51:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH 4/8] ASoC: mt8173-rt5650-rt5514: Drop unused includes
Content-Language: en-US
To: Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Andy Shevchenko <andy@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 alsa-devel@alsa-project.org
References: <20231006-descriptors-asoc-mediatek-v1-0-07fe79f337f5@linaro.org>
 <20231006-descriptors-asoc-mediatek-v1-4-07fe79f337f5@linaro.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20231006-descriptors-asoc-mediatek-v1-4-07fe79f337f5@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Message-ID-Hash: DXAUY5UK6DQDKPWOKHWXCMGLWGL6MHLD
X-Message-ID-Hash: DXAUY5UK6DQDKPWOKHWXCMGLWGL6MHLD
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/DXAUY5UK6DQDKPWOKHWXCMGLWGL6MHLD/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Il 06/10/23 15:46, Linus Walleij ha scritto:
> This driver includes the legacy GPIO header <linux/gpio.h> and
> <linux/of_gpio.h> but does not use any symbols from either of
> them so drop the includes.
> 
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

