Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 14D04419D83
	for <lists+alsa-devel@lfdr.de>; Mon, 27 Sep 2021 19:51:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 58AFD16A6;
	Mon, 27 Sep 2021 19:50:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 58AFD16A6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1632765095;
	bh=8/A/jeCawfw68tEtcP5SPa0rdUO9ePWNHH+Y2u0o2/M=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=apAZkuMNkUspCB4FZjcqJOibYVrbpwhmhLcwWY5OD5bmkO8S/e/FQy1/pTYJVR8y6
	 3sHEmFO9WzSEkCOKaIYCpqtpc6vydJGeaEsi1gHxyv1jWoSiKi+sp1FACPtVRv0Xh+
	 MZ5YJV094CHPOH4fChzU4F2DL4eRvD2FB4tuE5no=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 85C70F8051B;
	Mon, 27 Sep 2021 19:47:38 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BBF9DF80520; Mon, 27 Sep 2021 19:47:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 004E6F80506
 for <alsa-devel@alsa-project.org>; Mon, 27 Sep 2021 19:47:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 004E6F80506
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="uyeeE5Ak"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 175A060F9B;
 Mon, 27 Sep 2021 17:47:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1632764846;
 bh=8/A/jeCawfw68tEtcP5SPa0rdUO9ePWNHH+Y2u0o2/M=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=uyeeE5Akc/RVJGMzCW3EuvvHMxpeSmXdFf5E7CJfPCZ04Q0NpUhdsHYYmFlJMTAz9
 GAZmD8PCBQ+7bP7xxdzYpZlaCQrFbGMQnd0kAc9EAF0wWUp8Qv9uQmiadq0r33Ryee
 skl2x+NKya+dnTarAJhz0u0LkgDdzMMMne5Irr3XbWsuKcoKJNwdCSehW1xPdFBPB9
 igXVCy1sV4RM/nAk+o1F/4KJCvKRwuRUyzA8+rrP/DdBQo8cP1T8Hq8EPdohfjr5jI
 ZgLVzQqhOTwyRMmdp7i5IW34T2z1UEKJ60ZybC7VdD4jiKWiI4l5LbuVaTwDxc/ZvB
 SkHBLzFLMivLQ==
From: Mark Brown <broonie@kernel.org>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>
Subject: Re: [PATCH] ASoC: ak4671: Use modern ASoC DAI format terminology
Date: Mon, 27 Sep 2021 18:45:32 +0100
Message-Id: <163276442022.18200.13384234474428691856.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210920164211.16718-1-broonie@kernel.org>
References: <20210920164211.16718-1-broonie@kernel.org>
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

On Mon, 20 Sep 2021 17:42:11 +0100, Mark Brown wrote:
> As part of moving to remove the old style defines for the bus clocks update
> the ak4671 driver to use more modern terminology for clocking.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: ak4671: Use modern ASoC DAI format terminology
      commit: a35f2d4406f9f8fede3296ecb2a0e016ccaf699a

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
