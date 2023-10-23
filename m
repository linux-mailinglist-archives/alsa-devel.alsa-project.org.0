Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B51E67D3168
	for <lists+alsa-devel@lfdr.de>; Mon, 23 Oct 2023 13:08:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E32CD850;
	Mon, 23 Oct 2023 13:08:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E32CD850
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1698059336;
	bh=H1B9KGgQAiRUFMaOD7pDr+fGSwuRs81e04oqqbnXjZ0=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=F2H/+84M8fAg64IkXccFElKLYiL3zWXa9UMkE/1m/7r2rTAKDjgxfWq9+LxPZLDeh
	 LENJ1R1JYOFa4ixwQCWF0Wr+VijFTGW2iqqzjJaWZs8e4O5e3ZkZ9a5cm+6OVh35BK
	 4m7vWq2qRXkMqgW5d2OIdhwtdZeDSS8uj/j01KQ4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B7ACCF80567; Mon, 23 Oct 2023 13:07:16 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id F0394F8055A;
	Mon, 23 Oct 2023 13:07:15 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A289BF804F3; Mon, 23 Oct 2023 13:07:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C4CFEF80134
	for <alsa-devel@alsa-project.org>; Mon, 23 Oct 2023 13:07:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C4CFEF80134
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=collabora.com header.i=@collabora.com
 header.a=rsa-sha256 header.s=mail header.b=TMmCx2aK
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 9D3796606F51;
	Mon, 23 Oct 2023 12:07:04 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1698059225;
	bh=H1B9KGgQAiRUFMaOD7pDr+fGSwuRs81e04oqqbnXjZ0=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=TMmCx2aKkdcBER4WpXQVelH7qKmezHjQUJy5COnfDn6OHB3zqBVlTo9CVwPKEo3IS
	 VpaTwSsPGsCPN6AiPa/NHfebcyOfP4awZmHhbZK/HcohNASZ0VyN51NhiSJ/qNyUAy
	 OPklcHBMBhh+wadySMo+ufaI/n4ANhf5+q8SrQN52toT02g5dMVQi8xWCbRWgSXV4+
	 y9gJClwIYYgjwiRgylhJ8Y59IkUpeV+HoZskBcZYGF3HCewS9eR8L/6sFe4k2LC7Lj
	 P7uBU41qCXV2IE3JvdBfsa8zfSJSaDzkLvu3UGtQTxWVjFMG6YnL3i6CXltevycI1V
	 XAII2clCo2drA==
Message-ID: <07af235a-c6d5-4d8d-9b44-ff7157e2a80c@collabora.com>
Date: Mon, 23 Oct 2023 13:07:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] ASoC: mediatek: mt7986: remove redundant remove
 function
Content-Language: en-US
To: Maso Huang <maso.huang@mediatek.com>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20231023095453.4860-1-maso.huang@mediatek.com>
 <20231023095453.4860-2-maso.huang@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20231023095453.4860-2-maso.huang@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Message-ID-Hash: A6OTCZMQI6KNFC274HB47I52BJJYGAYB
X-Message-ID-Hash: A6OTCZMQI6KNFC274HB47I52BJJYGAYB
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/A6OTCZMQI6KNFC274HB47I52BJJYGAYB/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Il 23/10/23 11:54, Maso Huang ha scritto:
> Remove redundant remove function of mt7986-wm8960.
> 
> Signed-off-by: Maso Huang <maso.huang@mediatek.com>

You're doing more than what you're advertising; you are:

1. Dropping the remove callback; and
2. Removing the mt7986_wm8960_priv structure

You can do that in one single commit if you really want to, but you have to
use the appropriate commit title and description, saying exactly what you're doing.

Regards,
Angelo

