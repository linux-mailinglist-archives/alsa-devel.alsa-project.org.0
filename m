Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3602D67CBF4
	for <lists+alsa-devel@lfdr.de>; Thu, 26 Jan 2023 14:23:19 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BA347868;
	Thu, 26 Jan 2023 14:22:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BA347868
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1674739398;
	bh=PFjk7Lwomgg5i2CpzGsGjt10RBQ/x3BeqMztijLbhMw=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=ImcRuc8exAOpkYCMHPECjZSyyLIlsVeg9aPPY2gZ5ax3wdP2XG+XMwjCt+evaV5qP
	 Loj1StfyFE9ShnTqDWbRGVyNZJJPAZKh+eLf5mdAv++fK+/uoJ8zKJLFkHtbnEBElb
	 EsPVpd371furXIAg3hzkU2SmKAtk6eYTG+nAcCfg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 18B0CF800AE;
	Thu, 26 Jan 2023 14:22:20 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D8507F8027D; Thu, 26 Jan 2023 14:22:17 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 81A7DF80224
 for <alsa-devel@alsa-project.org>; Thu, 26 Jan 2023 14:22:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 81A7DF80224
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=collabora.com header.i=@collabora.com
 header.a=rsa-sha256 header.s=mail header.b=L1rfx53K
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 23F5C6602E70;
 Thu, 26 Jan 2023 13:22:12 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1674739332;
 bh=PFjk7Lwomgg5i2CpzGsGjt10RBQ/x3BeqMztijLbhMw=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=L1rfx53K/+HWdvL1cFrlzGxZv387Xj8Ya90h3fuTz4wMoksDSXelcJszna55ZhRbL
 g4USt4nnYYxPHhEAHfCu8fQxK6Q8cfPl+A1FEMKC1MUNkbEBBYVhYcbM8hsLjRQmtc
 J0aHr59lUYz6GUfuZrH5I6yJAoJtJEV1kr0aGGPtn94D9nwsBgUYIRvQ31PffMO8HF
 EkgrUEk2lau+3IpH6suc9ngYFTg6cp5dWk7CbOnYXPbiTCRuHZdmcikQmU8lD5e12P
 7kFZniCswiQV0vwKifCAMoeMwEEnuTWVZ+GzvOCW11ZOkxyvrHGkZy8ULBaUAyBpfp
 a0PFtoVdaPJmA==
Message-ID: <6f376bb9-2f44-b705-6843-795c0c1da742@collabora.com>
Date: Thu, 26 Jan 2023 14:22:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH] ASoC: mediatek: mt8188: remove some dead code
Content-Language: en-US
To: Dan Carpenter <error27@gmail.com>, Liam Girdwood <lgirdwood@gmail.com>
References: <Y9JHSwcfdNcfMjjt@kili>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <Y9JHSwcfdNcfMjjt@kili>
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
Cc: alsa-devel@alsa-project.org, kernel-janitors@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, Mark Brown <broonie@kernel.org>,
 Yang Li <yang.lee@linux.alibaba.com>, Trevor Wu <trevor.wu@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-mediatek@lists.infradead.org
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Il 26/01/23 10:26, Dan Carpenter ha scritto:
> We know that "irq < 0", so delete the unnecessary check.
> 
> Signed-off-by: Dan Carpenter <error27@gmail.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

