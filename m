Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0290E419D82
	for <lists+alsa-devel@lfdr.de>; Mon, 27 Sep 2021 19:51:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7460916AB;
	Mon, 27 Sep 2021 19:50:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7460916AB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1632765074;
	bh=i6C1j/rVSaKCT6VZs7hNmd9rfXiX+ZOqCInscH6GliU=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=MRxaCk0uupnbn0wqd7oqrVi8cbB+OjibvJ/R8e1/UO+Irxcnzw4diycNavHZmhvBp
	 PtRwGlkG5B48mS+anEA0klrpNHiWW0VfDAEBM2SmEPEiD/VMztKx9Nzh9Yh9KZ26jp
	 Bf5V/G1fuhzidbE9yzQjNgOJPaYg9x7nfaBwTchI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 58A2EF8051D;
	Mon, 27 Sep 2021 19:47:33 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7B7C5F8050F; Mon, 27 Sep 2021 19:47:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 31ABAF804E3
 for <alsa-devel@alsa-project.org>; Mon, 27 Sep 2021 19:47:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 31ABAF804E3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="r8Yw6Drk"
Received: by mail.kernel.org (Postfix) with ESMTPSA id E648460FBF;
 Mon, 27 Sep 2021 17:47:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1632764841;
 bh=i6C1j/rVSaKCT6VZs7hNmd9rfXiX+ZOqCInscH6GliU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=r8Yw6DrkQMNMNhrFVCWdQ65qa1RCnrKgcfptX/h+Im3mqomdgenGb0QWw+wzQ3yhY
 pQKKEEC0rFogz1yPHog1X2HYowB6w+xEBSD06zRuUN/xKv9/XiIozNZNcNr85sHC6n
 nuIGrLGYvmXYsXaWNcCE3tSreT7ivGQtfQr93jS9jz1WhnmSveFF8cAZclqTvAmXzd
 f5MhYvk/4BrAiz10yL68i9+DQ9BMAW1TT7Q6xPA/YE7wHvydDoQICSdsPo/SG8QDz5
 xYKu363L1BzMHFHeuVG0G0TDpXuTKbUpp0bu6Cs+Cgfx7vCD/PwicJbrdxmpFlmeaS
 rzfN4o7Iroo3A==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, alsa-devel@alsa-project.org,
 Takashi Iwai <tiwai@suse.com>, Oder Chiou <oder_chiou@realtek.com>,
 Colin King <colin.king@canonical.com>, Jaroslav Kysela <perex@perex.cz>
Subject: Re: [PATCH] ASoC: codecs: Fix spelling mistake "Unsupport" ->
 "Unsupported"
Date: Mon, 27 Sep 2021 18:45:30 +0100
Message-Id: <163276442024.18200.2988591432282232659.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210924231003.144502-1-colin.king@canonical.com>
References: <20210924231003.144502-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: Mark Brown <broonie@kernel.org>, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org
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

On Sat, 25 Sep 2021 00:10:03 +0100, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> There are spelling mistakes in dev_err error messages. Fix them.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: codecs: Fix spelling mistake "Unsupport" -> "Unsupported"
      commit: a4db95b2824157bdf0394da429ea49280bfad6b9

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
