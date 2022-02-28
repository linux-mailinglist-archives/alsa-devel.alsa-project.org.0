Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 077994C789C
	for <lists+alsa-devel@lfdr.de>; Mon, 28 Feb 2022 20:17:31 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 83B1E186C;
	Mon, 28 Feb 2022 20:16:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 83B1E186C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646075850;
	bh=v1cEfwRlcc67ONKdqM7MU2B2ihGFix3rjFnEdUQsDVQ=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Q5I+Vl6dlVqFI7vpfGYaUZ45kZ+A4nyTUdjaoa36OmYq1rIDiAZWm3X1ox2tg9kRI
	 blNM+uIRJs/NuthhsyjaD19qQwuFphHAItPPHLzf7RIuqUtvA7sc/Ep4ZVI8oAN0P6
	 ohwN8pVS3AHcjJew7oKR6SqxN0GRmArLpc6cfOGc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C7C30F8051A;
	Mon, 28 Feb 2022 20:15:27 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4C03EF800F8; Mon, 28 Feb 2022 20:15:22 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E054CF800F8
 for <alsa-devel@alsa-project.org>; Mon, 28 Feb 2022 20:15:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E054CF800F8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="AsUepOeE"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id BBE8061583;
 Mon, 28 Feb 2022 19:15:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C22D4C340F4;
 Mon, 28 Feb 2022 19:15:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1646075716;
 bh=v1cEfwRlcc67ONKdqM7MU2B2ihGFix3rjFnEdUQsDVQ=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=AsUepOeEZr9/YXgbMWvHiNkFF49z9uluQx+8ahhFM1R4KHXNNMGHUJqlQ3Ccfje5o
 Mk+EAkx3SmFjmprmjLl/d9d6NBfL6omaE9gB51USPOPjZq/gVb9DwsIdeJmfcd8cmy
 RfDCktq5YE/CXy4db/CeNqB9bFlNZX6IDe+gMhGvq4eG0JQktN9w/YH1KxkKO4xSOU
 IMQNeW+WjKHx3V/0FI2CNVTYAaTjGnHVk5/+lIRJDUQ+I7bPX106zbHcQOUfyj8Msw
 8O494qleIYWZ/W9sRZlRyA0QLyLolqt9x1cAe7zJ2uo1neMBhRCXUSAn1VIDPwlcA0
 m44hu5++uTE7g==
From: Mark Brown <broonie@kernel.org>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>
In-Reply-To: <20220222223534.3212743-1-broonie@kernel.org>
References: <20220222223534.3212743-1-broonie@kernel.org>
Subject: Re: [PATCH] ASoC: es8328: Use modern ASoC DAI format terminology
Message-Id: <164607571550.3538791.1932305585679183724.b4-ty@kernel.org>
Date: Mon, 28 Feb 2022 19:15:15 +0000
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

On Tue, 22 Feb 2022 22:35:34 +0000, Mark Brown wrote:
> As part of moving to remove the old style defines for the bus clocks update
> the es8328 driver to use more modern terminology for clocking.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: es8328: Use modern ASoC DAI format terminology
      commit: 6d2608804ebe3516f9dd30c5428b11d9bc121764

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
