Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C92034C78AB
	for <lists+alsa-devel@lfdr.de>; Mon, 28 Feb 2022 20:19:58 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5A18518DE;
	Mon, 28 Feb 2022 20:19:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5A18518DE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646075998;
	bh=M4EWp2m8wRLlBPQgV2v756dZRF38BeF7u0Q6VKlIeoI=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bsO1sRJUCb4prljIxKqmFGv429usV7wAb92BxM/kgjncsuLDvL8F1BI+GYtVhXEIw
	 EgC1I8WIwycVeN9uJCqN21900vxgdvSCRV4v6ed1OoNlgn7SxTDBh0ljT5nsMxom8F
	 /IaAyg56JylrFMVZH6A6m2RLpgTc7xvIcTRxuU+c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D2928F80559;
	Mon, 28 Feb 2022 20:15:44 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0E1EDF8051E; Mon, 28 Feb 2022 20:15:33 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 866BFF8052E
 for <alsa-devel@alsa-project.org>; Mon, 28 Feb 2022 20:15:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 866BFF8052E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="BlzDseBO"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 4037D61580;
 Mon, 28 Feb 2022 19:15:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60107C340F3;
 Mon, 28 Feb 2022 19:15:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1646075729;
 bh=M4EWp2m8wRLlBPQgV2v756dZRF38BeF7u0Q6VKlIeoI=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=BlzDseBOtWTu55bV8Q5/WE6n0QFIgI/qqkC8eVaYu6RLIAkR5v40oO5HGmf4LiPCO
 FP7kyQqQVntEGyhZjAE5vrm0k6jX/D/jpGy6QxTB6Kr/L05YaZgZsf5a7eVR4f1gsi
 lbwegIJnmnaLlebK6a0wHLkSk5wP3vE9MJJs1bPLsTmX5sthfGVqviHrpJWgIzKfXl
 tmc26hjVNrCUwbrQGfDP/3qGIO1Ik54cdTL9hGS2qzN6lUNGezoSqYUIYO2VQgE0EL
 h7yHfATvUgHvXADl9BNNZY4VD6/McXTRXCsKrp4IccuTesFHVCz/QkMOoK9DjmgUTY
 reRRQus/LfNjQ==
From: Mark Brown <broonie@kernel.org>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>
In-Reply-To: <20220223003207.1748248-1-broonie@kernel.org>
References: <20220223003207.1748248-1-broonie@kernel.org>
Subject: Re: [PATCH] ASoC: uda1334: Use modern ASoC DAI format terminology
Message-Id: <164607572811.3538791.7230630487547279062.b4-ty@kernel.org>
Date: Mon, 28 Feb 2022 19:15:28 +0000
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

On Wed, 23 Feb 2022 00:32:07 +0000, Mark Brown wrote:
> As part of moving to remove the old style defines for the bus clocks update
> the uda1334 driver to use more modern terminology for clocking.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: uda1334: Use modern ASoC DAI format terminology
      commit: aac21939bb2c8989082048054e1887d3be459980

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
