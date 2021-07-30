Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B0ADB3DBEB5
	for <lists+alsa-devel@lfdr.de>; Fri, 30 Jul 2021 21:06:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3EAE820BC;
	Fri, 30 Jul 2021 21:05:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3EAE820BC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1627671979;
	bh=R4HqYE4p9RbCYoGmBHCVifsnu6zFKQ5Jbfm93fo2Z8I=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ph0btUq1SO4ia/5fT5JInO0miHD9kRWXiPFmLR78smNNl2FBkoraVaX+bIeY3ajO1
	 /X9ZlvzF3HiLM1800hRfzfXi+YppaqkyDmbQU444di6NVvN9Jje6a9IOPgJ3ovZEE3
	 Jk1GZkugiQPzD17/0vBY5iOFiffdvShe9LKjVOjU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 48A8FF804E0;
	Fri, 30 Jul 2021 21:04:07 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 67F72F8028B; Fri, 30 Jul 2021 21:04:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F3B5FF8025E
 for <alsa-devel@alsa-project.org>; Fri, 30 Jul 2021 21:04:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F3B5FF8025E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="dTePPkx0"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7A9DD6052B;
 Fri, 30 Jul 2021 19:03:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1627671840;
 bh=R4HqYE4p9RbCYoGmBHCVifsnu6zFKQ5Jbfm93fo2Z8I=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=dTePPkx0x+ugvfaLcDYzVUrt50rApzRUIKAhR0F/2DzrdsV38GxJ+eDGDk9XuNsTJ
 f2zv3eqUOzVF3fVSJeTx39ZYmOiFi0Qb75f2olX0AxCyrlqesebHqh2Foed2TqihEe
 xPnrZy3MS56a+Q7xNfO098GX28CM10OebYeSKe7d4qkPDMIE6B7yehUESQgg1RgnEo
 XbyHe3AWvWX4LxQC8DNMAOIY7l2QK1AftCwPUgKTTJYUJtKHvh3ZzpnB53Y32HA7sG
 7l2+92rIRo995OpOWOm/3VGlYB/C1wUgkGTpFlsNhQkxdqJrei/v3wdsMgYlJBQnOK
 fGUvu0pH7UH1A==
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>,
	alsa-devel@alsa-project.org
Subject: Re: [PATCH] ASoC: amd: Drop superfluous mmap callbacks
Date: Fri, 30 Jul 2021 20:03:37 +0100
Message-Id: <162767143674.56427.4932382017370188684.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210728141843.17685-1-tiwai@suse.de>
References: <20210728141843.17685-1-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: Mark Brown <broonie@kernel.org>
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

On Wed, 28 Jul 2021 16:18:43 +0200, Takashi Iwai wrote:
> All ASoC AMD drivers just call the standard mmap handler, hence those
> are superfluous.  Let's drop them.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: amd: Drop superfluous mmap callbacks
      commit: f211f5f606335d75c3b346e03bceb9b10261b6b3

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
