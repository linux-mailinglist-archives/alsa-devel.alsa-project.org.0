Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 74AB647C740
	for <lists+alsa-devel@lfdr.de>; Tue, 21 Dec 2021 20:13:46 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CA5DE17F4;
	Tue, 21 Dec 2021 20:12:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CA5DE17F4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1640114025;
	bh=O3S5FDEGvUEzy2gVtEQoUg/vvqyOLdya7T8+6tn8dX4=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WhuSG516o32QajRSFKwDkPwN9lAeEzG5fAPIW4pjzLOAyYBjKyPeXWHGxX7FzTMZX
	 Z5dS3KF/S0yUJg9at3rxEHU3bs0J3YREtqnkup4rKpl3OT1aIT91aPT36A4dC0GbNU
	 b4P/RO5adtGHjYM1NeyzKmW0Vv8ZAKnn41++SmHk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 252B4F8012E;
	Tue, 21 Dec 2021 20:12:40 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A2B77F80118; Tue, 21 Dec 2021 20:12:38 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D8136F80084
 for <alsa-devel@alsa-project.org>; Tue, 21 Dec 2021 20:12:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D8136F80084
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="o8EF2woB"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id F324A61773;
 Tue, 21 Dec 2021 19:12:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3146DC36AE8;
 Tue, 21 Dec 2021 19:12:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1640113949;
 bh=O3S5FDEGvUEzy2gVtEQoUg/vvqyOLdya7T8+6tn8dX4=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=o8EF2woBDzix9iVnoMUBlDsEqv1BCjY4u754dRFAHvRPXI5MtHoYiW9+CQi2rD+t/
 KJAsf94f+LYVatapcCiUHunUP2Mf6FrWejNuXsFSfqMVuVmk2vOih3es1ka8H0BIIF
 CVnxGptIYRAXJSynlxZtlAQtc6voJLhyuYQai3zGdL4nlsMe79L5LTthRM5GPJBxvR
 egWjwb+ORUVnZ+0WgysqFfuA3H2PcZHgSJJRcPp8647twl5dG3SVaHyrOakKM8G2e6
 PVxYBgByJJ4vEmk97mx4StQCCJMkKRfoRmcqZMzr+W4iyJUKeSKiS4wFmf1XkQFFq+
 Y9tuM1axhm/kw==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Florian Fainelli <f.fainelli@gmail.com>,
 Michal Simek <michal.simek@xilinx.com>, Takashi Iwai <tiwai@suse.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 bcm-kernel-feedback-list@broadcom.com, Rob Herring <robh+dt@kernel.org>
In-Reply-To: <20211219181039.24812-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20211219181039.24812-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH 0/2] sound/soc: Use platform_get_irq() to fetch IRQ's
Message-Id: <164011394691.93163.1449464407728800638.b4-ty@kernel.org>
Date: Tue, 21 Dec 2021 19:12:26 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Prabhakar <prabhakar.csengg@gmail.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
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

On Sun, 19 Dec 2021 18:10:37 +0000, Lad Prabhakar wrote:
> This patch series aims to drop using platform_get_resource() for IRQ types
> in preparation for removal of static setup of IRQ resource from DT core
> code.
> 
> Dropping usage of platform_get_resource() was agreed based on
> the discussion [0].
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: xlnx: Use platform_get_irq() to get the interrupt
      commit: c2efaf8f2d53ffa2ecc487e21c62d13bbb8d88c3
[2/2] ASoC: bcm: Use platform_get_irq() to get the interrupt
      commit: 5de035c270047e7ae754fbfb69031707aa5b54f7

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
