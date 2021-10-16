Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A03843038C
	for <lists+alsa-devel@lfdr.de>; Sat, 16 Oct 2021 17:51:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B3DB6181A;
	Sat, 16 Oct 2021 17:51:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B3DB6181A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1634399518;
	bh=nt8SLksBvMwsI1uJpLhRXVo72AmQPuul/KbHjb+HJkw=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=SiFmhjE+L1MH0VMaMR64vTq023wb8IHu3IiXSVflxjm4KuZQp8rxifp2nUn4crvlS
	 8xrXVxOqDHq6N4Cjghgwug8HetjBO+cAF5XHpAVN97jFmOz8344WuJC2WebBNb41il
	 XzBvbGV8vgz3MFBLhfcS2wS+5T19zy6aVCkpuJPc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3B307F80167;
	Sat, 16 Oct 2021 17:50:42 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 99433F80212; Sat, 16 Oct 2021 17:50:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 84640F80167
 for <alsa-devel@alsa-project.org>; Sat, 16 Oct 2021 17:50:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 84640F80167
Received: from p508fce7c.dip0.t-ipconnect.de ([80.143.206.124]
 helo=phil.localnet)
 by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <heiko@sntech.de>)
 id 1mblx1-0007WI-5i; Sat, 16 Oct 2021 17:50:23 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: Nicolas Frattaroli <frattaroli.nicolas@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Nicolas Frattaroli <frattaroli.nicolas@gmail.com>
Subject: Re: [PATCH 1/4] ASoC: rockchip: i2s-tdm: Strip out direct CRU use
Date: Sat, 16 Oct 2021 17:50:22 +0200
Message-ID: <1782571.1Dz21PRzoM@phil>
In-Reply-To: <20211016105354.116513-2-frattaroli.nicolas@gmail.com>
References: <20211016105354.116513-1-frattaroli.nicolas@gmail.com>
 <20211016105354.116513-2-frattaroli.nicolas@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Cc: linux-rockchip@lists.infradead.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
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
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Am Samstag, 16. Oktober 2021, 12:53:50 CEST schrieb Nicolas Frattaroli:
> In cases where both rx and tx lrck are synced to the same source,
> the resets for rx and tx need to be triggered simultaneously,
> according to the downstream driver.
> 
> As there is no reset API to atomically bulk (de)assert two resets
> at once, what the driver did was implement half a reset controller
> specific to Rockchip, which tried to write the registers for the
> resets within one write ideally or several writes within an irqsave
> section.
> 
> This of course violates abstractions quite badly. The driver should
> not write to the CRU's registers directly.
> 
> In practice, for the cases I tested the driver with, which is audio
> playback, replacing the synchronised asserts with just individual
> ones does not seem to make any difference.
> 
> If it turns out that this breaks something in the future, it should
> be fixed through the specification and implementation of an atomic
> bulk reset API, not with a CRU hack.
> 
> Signed-off-by: Nicolas Frattaroli <frattaroli.nicolas@gmail.com>

Reviewed-by: Heiko Stuebner <heiko@sntech.de>


