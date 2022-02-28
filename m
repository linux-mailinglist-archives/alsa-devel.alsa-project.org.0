Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F31E04C78A4
	for <lists+alsa-devel@lfdr.de>; Mon, 28 Feb 2022 20:19:09 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7E09418D0;
	Mon, 28 Feb 2022 20:18:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7E09418D0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646075949;
	bh=d+LznrnCBd1xWoEoxWr2XSbbhBTaeLpSJJR1C8/AgXg=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=TIuFZFu1Y4Dt6N0SOg4dx25swpEQOB5XWupz5J0iwOQ2e/06pXIp6G4PBxB1UXOeP
	 1tPvJ3F7AlS0ljy756JXYXd2ZKtIBXL9M95D//EaoY56BtyU9suNtisEp/QB5TmntS
	 oMqkXPoyWLzku4EOW/HcBJoOIdDKkTDcx0z5CUlo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C5AB2F80542;
	Mon, 28 Feb 2022 20:15:42 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 93156F80533; Mon, 28 Feb 2022 20:15:30 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C658EF80519
 for <alsa-devel@alsa-project.org>; Mon, 28 Feb 2022 20:15:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C658EF80519
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="cAYEQJIQ"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 7B0F2B8162C;
 Mon, 28 Feb 2022 19:15:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D0A8C340F1;
 Mon, 28 Feb 2022 19:15:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1646075723;
 bh=d+LznrnCBd1xWoEoxWr2XSbbhBTaeLpSJJR1C8/AgXg=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=cAYEQJIQmmnao1dZyPOG/chAuJQhqjPlh19e/Tw24rgrdhgQQIrRP+5rqwogOf3h0
 YKKpGBU5chKkfbL4Z0kFp2bJ6dCvXgQCpUlCfg2wPGYq9Hw5r01oudVZiExGi1gagW
 aNcRJIbHPBVDodu3iSNYlpr+ejMmAZn15I8uwTzf5nvQ39fjZnr3SrLXEDLwnPkA61
 52q8lRrjcJeIUu+lXHSRkwx2lRNhlQJLj5BG9vIxyf7tmWPRbDA1YznQl7ISBeZgh0
 NcwolI6ZGWawMwR5ZS1uBcIZ2bTpDGNfb47fzx8W3nRkx42GGMi6jPbr21b5LYfKOQ
 PoTV2xW+jpNrg==
From: Mark Brown <broonie@kernel.org>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>
In-Reply-To: <20220223001416.1235951-1-broonie@kernel.org>
References: <20220223001416.1235951-1-broonie@kernel.org>
Subject: Re: [PATCH] ASoC: mc13783: Use modern ASoC DAI format terminology
Message-Id: <164607572223.3538791.14557977518371493978.b4-ty@kernel.org>
Date: Mon, 28 Feb 2022 19:15:22 +0000
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

On Wed, 23 Feb 2022 00:14:16 +0000, Mark Brown wrote:
> As part of moving to remove the old style defines for the bus clocks update
> the mc13783 driver to use more modern terminology for clocking.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: mc13783: Use modern ASoC DAI format terminology
      commit: f948202284a1c86f09f880653962c9c71d5bc3a7

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
