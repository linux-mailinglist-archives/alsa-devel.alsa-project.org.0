Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ECE74C78B7
	for <lists+alsa-devel@lfdr.de>; Mon, 28 Feb 2022 20:21:44 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AFA3E1872;
	Mon, 28 Feb 2022 20:20:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AFA3E1872
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646076103;
	bh=zIiVJ1L5zOogc76dNbEiTo1r/Y9HE6t9b3m9SmckNrk=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=n4UlbfQhBc+bfivD/paJ77j5PtfxmgJYyhtWdrYFsdxNfvr92a4AV2NRR/HP0Dz5f
	 mmW6LP4c9464Xlv48ypqj44w3TqQyFPJMVml7AL79QZWciyC2oYDw+BaH8QVJbwn3A
	 39rpdzo3dW4VSlEQ2j2lsboRKtz96iWxPGQKeO5I=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2AA39F805AF;
	Mon, 28 Feb 2022 20:16:00 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EF55CF8052E; Mon, 28 Feb 2022 20:15:39 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EA01BF8051E
 for <alsa-devel@alsa-project.org>; Mon, 28 Feb 2022 20:15:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EA01BF8051E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="TL3o1ZnF"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 4E5AEB8162C;
 Mon, 28 Feb 2022 19:15:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41720C340F4;
 Mon, 28 Feb 2022 19:15:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1646075735;
 bh=zIiVJ1L5zOogc76dNbEiTo1r/Y9HE6t9b3m9SmckNrk=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=TL3o1ZnFJlPADYSyQMS/bOoOrcpedPtXAnyrVM1k8beQlF9qpNAJInud5ITIzVBz7
 2k7IYduPgbagwVQT6TPCAqh+fUGbxFv7CJlCKyWA+lFWoBZnw7tdKFVr59BP1EiCdp
 kKxrMOZGWk4MiPi3drlKzXzgzknetQYvnvV1qxCt6AhGKphEw6wXj77Z4KlEFLI+LA
 ri2PL/1REL3hnSwpZnxgzOUzOkepekGIQLHSBLUWflROIjST2diiEfN65jxvomg9sl
 +EcuU5ldWG+NuRy/z1irFtAsx6ZxdA9W1twdrCHnnNZGoTrIZi8rqYH/D19BueTUlM
 5A/emXXh81jGA==
From: Mark Brown <broonie@kernel.org>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>
In-Reply-To: <20220223014846.2765382-1-broonie@kernel.org>
References: <20220223014846.2765382-1-broonie@kernel.org>
Subject: Re: [PATCH 1/4] ASoC: pcm1681: Use modern ASoC DAI format terminology
Message-Id: <164607573398.3538791.4960026872602408915.b4-ty@kernel.org>
Date: Mon, 28 Feb 2022 19:15:33 +0000
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

On Wed, 23 Feb 2022 01:48:43 +0000, Mark Brown wrote:
> As part of moving to remove the old style defines for the bus clocks update
> the pcm1681 driver to use more modern terminology for clocking.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/4] ASoC: pcm1681: Use modern ASoC DAI format terminology
      commit: 1900cb5375c3e95382601deed6ef95fb7b121a2e
[2/4] ASoC: pcm186x: Use modern ASoC DAI format terminology
      commit: 765e30ac665777d7d7ad4fe75490138a85931d3a
[3/4] ASoC: pcm3168a: Use modern ASoC DAI format terminology
      commit: 9231bb1b25348bff738181e4614c997bcdeba7cf
[4/4] ASoC: pcm512x: Use modern ASoC DAI format terminology
      commit: e0dab08973c890d554e14089b756e81b50ed8af4

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
