Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C154E67961C
	for <lists+alsa-devel@lfdr.de>; Tue, 24 Jan 2023 12:05:03 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A8C49A4E;
	Tue, 24 Jan 2023 12:04:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A8C49A4E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1674558302;
	bh=c7rwFTilVrOZNcOXpqSZCuIj1ZlwXY7Pn4yaXa6ma2s=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=Meb7NKzwfGG/gefjuf4nr08sC6ukARQP8HOrHlwfteOc2Ld2uE/n5KayBGDfrlHcK
	 M2yxum30HSbn3pdFfJjy0Od+7eCKBEC4eE9rgL2UT4H8LRTh0CnuxxEKiN7LS/hM07
	 rEJ/+QCegLOjxTeRpX0ovgVuStkJ4SE6wSy/2DrQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A2BADF800FB;
	Tue, 24 Jan 2023 12:04:05 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9750AF8027D; Tue, 24 Jan 2023 12:04:01 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1327AF800FB
 for <alsa-devel@alsa-project.org>; Tue, 24 Jan 2023 12:03:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1327AF800FB
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=collabora.com header.i=@collabora.com
 header.a=rsa-sha256 header.s=mail header.b=DCwEBBqa
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id B49196602E2A;
 Tue, 24 Jan 2023 11:03:54 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1674558235;
 bh=c7rwFTilVrOZNcOXpqSZCuIj1ZlwXY7Pn4yaXa6ma2s=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=DCwEBBqaLYMAAnzeL323Dd4c1qrmPLoi2Wi93tqWWlK8Wobk+NevjcO6FlN+HLuof
 3u5yEO2Ae/UkdfbDvcIgoJOYnfOj91MTYvp9c9wEnByV98jgf+7+hkGpuikfWhfz7c
 TYkIP2DhR6SPEO9Cjgtk1jmhqwO8XKPKoCOyv6hqF2pWZ9Vpjx4/89Mv7pJmPpAIfG
 xWY3s698u0GjScCLWRxcfrq8WxAhbX4dnrkYFz+Vz4zX/v1mI68JrK90V7DuguFOaw
 zpSc3z1COxQJbZh29DrCO+b+GyzTm+aoY3zCb5+vE3WvfYbfwPRdqblEiXZ9Nl3GX5
 qGlpGh7PCzc7g==
Message-ID: <2ae768dc-ac83-eda2-c425-014251c40a74@collabora.com>
Date: Tue, 24 Jan 2023 12:03:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v2 14/25] ASoC: mediatek: use helper function
Content-Language: en-US
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Mark Brown <broonie@kernel.org>
References: <87y1psu1m1.wl-kuninori.morimoto.gx@renesas.com>
 <87edrku1cy.wl-kuninori.morimoto.gx@renesas.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <87edrku1cy.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Cc: Linux-ALSA <alsa-devel@alsa-project.org>,
 Chunxu Li <chunxu.li@mediatek.com>,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 Minghao Chi <chi.minghao@zte.com.cn>, linux-mediatek@lists.infradead.org,
 Jiaxin Yu <jiaxin.yu@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Il 24/01/23 03:12, Kuninori Morimoto ha scritto:
> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> 
> Current ASoC has many helper function.
> This patch use it.
> 
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

