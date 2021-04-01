Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 17687351345
	for <lists+alsa-devel@lfdr.de>; Thu,  1 Apr 2021 12:20:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9A6231692;
	Thu,  1 Apr 2021 12:19:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9A6231692
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1617272410;
	bh=4nUY9I4CyD90zzyBEwHOwJerWxSoS4SDKkbN8Bii3xs=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=GsLz+cq4YF1jkGPAMSozs5wstNI1tc0j128b6PwKRkG0Ec909kOIxxO5oKN4K3ONb
	 KG67w/8jA/HjvJZKdl/psaeK4r5ntuiO+22/2Xi3toZBwfdJUNmugZ4bgz+gySTV0W
	 ebe56fLybqTc9CvP8eKGINr4k5mgRUuy2TWlQQR0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 17550F80475;
	Thu,  1 Apr 2021 12:17:22 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 67AB5F80425; Thu,  1 Apr 2021 12:17:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_26,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9C62AF8026F
 for <alsa-devel@alsa-project.org>; Thu,  1 Apr 2021 12:17:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9C62AF8026F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="ojMkS8dJ"
Received: by mail.kernel.org (Postfix) with ESMTPSA id DFA9A60FDB;
 Thu,  1 Apr 2021 10:17:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1617272224;
 bh=4nUY9I4CyD90zzyBEwHOwJerWxSoS4SDKkbN8Bii3xs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ojMkS8dJCUuVGA7EChbuHZ3r/rFpPvdZKSfV6QoQUWzQyjxV9zm7GNFnlAcTxsLZk
 0wHWxVAZXhWh6rh8z8n/9C9F+oRcHjdJIA2v5IXWTqngufxy7/W4/z5z+gBjj0rGvH
 9No4RtkplSCOM06gUTD+o6ohE3oD2JUjtJJmGr0cNwC88WQInvuX2bcOXdIGjEcpl4
 eCy8Re77nl3ZiD0oSh2OlI7UwGJn4bQVU1lbEJh4JfxEozTSulmELG8YxQJk1X1G2V
 XdpfdNLcy8gGZpVrQdm9nzgwi2UpyBBYzJRrq85WNfLX/GgUypvZVxaJr//t4a8igR
 N5pUdKTzkBT0A==
From: Mark Brown <broonie@kernel.org>
To: Chen-Yu Tsai <wens@csie.org>, bage@linutronix.de,
 Maxime Ripard <mripard@kernel.org>
Subject: Re: [PATCH v2] ASoC: sunxi: sun4i-codec: fill ASoC card owner
Date: Thu,  1 Apr 2021 11:16:20 +0100
Message-Id: <161726938994.2219.2578765032151583218.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210331151843.30583-1-bage@linutronix.de>
References: <20210331150622.GE4758@sirena.org.uk>
 <20210331151843.30583-1-bage@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 linux-arm-kernel@lists.infradead.org
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

On Wed, 31 Mar 2021 17:18:43 +0200, bage@linutronix.de wrote:
> card->owner is a required property and since commit 81033c6b584b ("ALSA:
> core: Warn on empty module") a warning is issued if it is empty. Add it.
> This fixes following warning observed on Lamobo R1:
> 
> WARNING: CPU: 1 PID: 190 at sound/core/init.c:207 snd_card_new+0x430/0x480 [snd]
> Modules linked in: sun4i_codec(E+) sun4i_backend(E+) snd_soc_core(E) ...
> CPU: 1 PID: 190 Comm: systemd-udevd Tainted: G         C  E     5.10.0-1-armmp #1 Debian 5.10.4-1
> Hardware name: Allwinner sun7i (A20) Family
> Call trace:
>  (snd_card_new [snd])
>  (snd_soc_bind_card [snd_soc_core])
>  (snd_soc_register_card [snd_soc_core])
>  (sun4i_codec_probe [sun4i_codec])

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: sunxi: sun4i-codec: fill ASoC card owner
      commit: 7c0d6e482062eb5c06ecccfab340abc523bdca00

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark
