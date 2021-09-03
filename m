Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 599ED4001F0
	for <lists+alsa-devel@lfdr.de>; Fri,  3 Sep 2021 17:21:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 68EF918B8;
	Fri,  3 Sep 2021 17:20:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 68EF918B8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1630682471;
	bh=oYmN5T7sshaoWGSEc1MfWpgCjISXeg/z9xk1wh6OKJU=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=DW/H/z2nLe/zVwAkI01Cx4ohcfq4wrDLezXKttulnLgAKkBpPhwZZnuavWkwA9V6z
	 Gsex/y54HGfXEpyej3KOYGFak8moM3OWnLe32TaKyMzVY03sW5eXGFil7U9mgYhV9i
	 1Hp6gWDkdOH1KnQA/X6w5OQ9sDxpCtX/d7QJXaEQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1C6A2F8032B;
	Fri,  3 Sep 2021 17:19:32 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D0532F80254; Fri,  3 Sep 2021 17:19:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6D0BAF80088
 for <alsa-devel@alsa-project.org>; Fri,  3 Sep 2021 17:19:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6D0BAF80088
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="UGlylsOL"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 64FD8610E6;
 Fri,  3 Sep 2021 15:19:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1630682363;
 bh=oYmN5T7sshaoWGSEc1MfWpgCjISXeg/z9xk1wh6OKJU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=UGlylsOLgVVOjPq+FLhiRA9ULl1yVvH89glH0h7EL/ekI34mqjOimsUgJ0We5A3rY
 W8npyG3wt0agsSjxDzmCfz/nAG+myRyVTa5pPslo3rIdePH9VXUUC8wp2ZW6gsDVSq
 Ym89RMSRrNkM6jKWi8D7b0RPaL050zDIRO7EL3fycbBuJITX7O6FRXM+qCu1ZmnaGA
 MadMpzYWWovy3HHMsr42VW5biCBKEAMsqdHqSV6R+n7qvfH73Fd7SW4KiNlM64gt4h
 NX1AhU1widThJS+yDh0c+IwnUDNE7KGmVz+E+KGa+gIimAUOK7PBGRd9C4FWUvLoNE
 zM8BDsurg013g==
From: Mark Brown <broonie@kernel.org>
To: matthias.bgg@gmail.com, Trevor Wu <trevor.wu@mediatek.com>, tiwai@suse.com
Subject: Re: [PATCH] ASoC: mt8195: correct the dts parsing logic about DPTX
 and HDMITX
Date: Fri,  3 Sep 2021 16:18:45 +0100
Message-Id: <163068203907.50844.7644629918689811156.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210903060049.20764-1-trevor.wu@mediatek.com>
References: <20210903060049.20764-1-trevor.wu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
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

On Fri, 3 Sep 2021 14:00:49 +0800, Trevor Wu wrote:
> According to the description in dt-bindings, phandle assignment of
> HDMI TX and DP TX are not required properties, but driver regards them
> as required properties.
> In real use case, it's expected that DP TX and HDMI TX are optional
> features, so correct the behavior in driver.
> 
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: mt8195: correct the dts parsing logic about DPTX and HDMITX
      commit: 7eac1e24fbf6c56c9e3be302748ae73104bb40bd

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
