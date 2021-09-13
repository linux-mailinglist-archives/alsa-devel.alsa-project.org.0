Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 367774089A2
	for <lists+alsa-devel@lfdr.de>; Mon, 13 Sep 2021 12:59:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CB08D1616;
	Mon, 13 Sep 2021 12:58:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CB08D1616
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1631530739;
	bh=qVDEd4KPGzwlXD7REl4gi3XNnBFXMku8Vz1o29jsDWo=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fs778i0Vu6UtL3hBOh0g0pbDLtpgprH7HrIhRJEodeTeDtAs4KKEfEHBLn5WHoZd2
	 iwnMPY8Rj7khf90xHn5vbAAwd//mwqC39Gvzygpo0kWMukah67r+5w0Mi6lG3Jg/6D
	 4rGLTv+xCBMf/PStJh20oE1CX65Wh933snh54k1U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 636C8F8051E;
	Mon, 13 Sep 2021 12:55:17 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 76F07F80510; Mon, 13 Sep 2021 12:55:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AFE85F804FB
 for <alsa-devel@alsa-project.org>; Mon, 13 Sep 2021 12:55:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AFE85F804FB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Kn0pYiZ/"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 759906103B;
 Mon, 13 Sep 2021 10:55:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1631530502;
 bh=qVDEd4KPGzwlXD7REl4gi3XNnBFXMku8Vz1o29jsDWo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Kn0pYiZ/IyDNur0YZLsxyjXh+Ej6lL1Bg+fVYqkCh5e9kkHMXFDzm4C3ZsHvsOYeJ
 +rbpcUPsDLtJYwYYJo9xukdBBq/3pkn18zo8SnHY0g/c5yjHhZrCJPVYmlAohMuayz
 Z2zP4hn8k9dMysdbEG4JT20NvPSG+dFFMntoVh9Jd3dw3d+N2iUOio6jhZ02nC71zT
 WCC4MYRZP8CT9bRuHofdoEF7zP/jwDVw7ffDvz9as6MrpEs/W+L/CH8Duk+ZJFZAYw
 WBQ5v/XpEay2L25mKi9krzGUM5sUyLkzLGtR0faaZx9Uj+pyp6Ym+2X5ZG8tUn9AvM
 i2wy/e0j+jZSw==
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] ASoC: mediatek: mt8195: Remove unsued irqs_lock.
Date: Mon, 13 Sep 2021 11:53:23 +0100
Message-Id: <163152996586.45703.9396342816792427705.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210910094847.3430413-1-bigeasy@linutronix.de>
References: <20210910094847.3430413-1-bigeasy@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
 Thomas Gleixner <tglx@linutronix.de>, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>
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

On Fri, 10 Sep 2021 11:48:47 +0200, Sebastian Andrzej Siewior wrote:
> irqs_lock is not used, never was.
> 
> Remove irqs_lock.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: mediatek: mt8195: Remove unsued irqs_lock.
      commit: c3815f8bc777370999ced0b6b6f846094b33d583

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
