Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 17001419D84
	for <lists+alsa-devel@lfdr.de>; Mon, 27 Sep 2021 19:51:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8C78A16BD;
	Mon, 27 Sep 2021 19:51:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8C78A16BD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1632765113;
	bh=eImAKFj2KerqdVxJQBZixAfZh68imEgLxm2oO4+ohfw=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=CqI+zrArVe+a8ZtIXvy/tzM6iaUULRWqTYW1O8QT/SA/68aEVddYFddkqz2TUoGA7
	 EAJTrIdrxDyUJwCBocmwaLiQhglkoVIQ5qKop872dMTh1HNlX2D7H7VPhyLJDx1zqw
	 6EUD5+zzftONaX5xtvEMkCP2AKMOuyCXkZyEhy80=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id ACB4DF80528;
	Mon, 27 Sep 2021 19:47:39 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B02DDF8051F; Mon, 27 Sep 2021 19:47:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 49A53F8051B
 for <alsa-devel@alsa-project.org>; Mon, 27 Sep 2021 19:47:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 49A53F8051B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="EIecxS/n"
Received: by mail.kernel.org (Postfix) with ESMTPSA id BB12860F9B;
 Mon, 27 Sep 2021 17:47:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1632764849;
 bh=eImAKFj2KerqdVxJQBZixAfZh68imEgLxm2oO4+ohfw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=EIecxS/nvws1KcnN2Xid9eFRbSGsCBkowuEnlTb05Nm5ZZ4aB5MoiLIFM5NB3GYHF
 2gJuiWkx3TbikHTnxSTIc3oXGC231AEWnMAMvsCikkg2D6D/yfvnSm7G87RHYMfgLB
 L0qa126YsnwYTUAOXm3yYrxKtof6lUIU32W+zu3yeFjRodmMVE2f7SEoP5N/wTdS7P
 +InmNAYJi2gSKlBdXs4Ld992k27o8kDeWWFPkdOhu8a0G/GvwaLaDrfvpQDlRTyS10
 5Hs1nanmyJmbb6mECH0rrrXV8EAYflJR2s3KuS83ynNgsLKvgHYvEUVVsFRgF5l41k
 evWTL6564Wm1Q==
From: Mark Brown <broonie@kernel.org>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>
Subject: Re: [PATCH] ASoC: ep93xx: Convert to modern clocking terminology
Date: Mon, 27 Sep 2021 18:45:33 +0100
Message-Id: <163276442020.18200.9009782916919076076.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210916143828.36215-1-broonie@kernel.org>
References: <20210916143828.36215-1-broonie@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org
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

On Thu, 16 Sep 2021 15:38:28 +0100, Mark Brown wrote:
> As part of the effort to remove our old APIs based on outdated terminology
> update the EP93xx drivers to use modern terminology.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: ep93xx: Convert to modern clocking terminology
      commit: c7801a3c6849f5df68390cb035ff10fe97333bdc

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
