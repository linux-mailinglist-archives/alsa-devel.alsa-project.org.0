Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 690004F297A
	for <lists+alsa-devel@lfdr.de>; Tue,  5 Apr 2022 11:33:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 59462172F;
	Tue,  5 Apr 2022 11:32:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 59462172F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1649151224;
	bh=pOJGaCsrQN3x9r+PY1FtlGxQPslrXTTIlgn21bMNlm4=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jsqaGJcgBo57FmCkd+06NzsuWdMSxfp9DwJj1kNy+LxM6q91tR2+HcUeBZ0kLbBo7
	 4ilcvrwS5IYdUz5EPVLY7Sy3U1LqqBpD2qhheMvRRCectb08bDuoXnwd/mZr0G6XzB
	 fjyZTc8V6eLR/JVMilawskr+79dXryd8+Pkqdih8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 751F9F80527;
	Tue,  5 Apr 2022 11:31:16 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2DEE4F8051B; Tue,  5 Apr 2022 11:31:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3A1DFF80516
 for <alsa-devel@alsa-project.org>; Tue,  5 Apr 2022 11:31:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3A1DFF80516
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="s1qJ74J5"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 89CB5B81B14;
 Tue,  5 Apr 2022 09:31:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74931C385A2;
 Tue,  5 Apr 2022 09:31:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1649151069;
 bh=pOJGaCsrQN3x9r+PY1FtlGxQPslrXTTIlgn21bMNlm4=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=s1qJ74J5Qg5S4QZNnwSCrKsz71rWVroUteBFHhnlqpokmx2mj7Pg/jM/XyzddvfkD
 44S++w3zK90yPOlSvTTwvyvamg564l1CWzNPvO+wK4fJVKR4xd9uYdfCzSca3hwFRA
 0lH/OC8UBB9ZBGqQvnmwCH+YmTXhIs0RJdR6OP628xS7bb72aq8k1Gv6ngqICS9m24
 MnnYlxeMcx1d7K0p24AQT3fYmb7dfQQt9dAYMCGfA7/IOvrK66PfVIl6gch5wlbynL
 DQgrskefTf7NnyOJOFh4WQUWGs4gOj8vKC89UBO74AKMzvTVByUXO7EPUxiqnO1sTw
 tC97+CIWsJRkA==
From: Mark Brown <broonie@kernel.org>
To: broonie@kernel.org, codrin.ciubotariu@microchip.com,
 Liam Girdwood <lgirdwood@gmail.com>
In-Reply-To: <20220325154241.1600757-1-broonie@kernel.org>
References: <20220325154241.1600757-1-broonie@kernel.org>
Subject: Re: [PATCH v1 0/3] ASoC: atmel: Fixes for AT91SAM9G20-EK audio driver
Message-Id: <164915106820.276574.15570595209250540791.b4-ty@kernel.org>
Date: Tue, 05 Apr 2022 10:31:08 +0100
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

On Fri, 25 Mar 2022 15:42:38 +0000, Mark Brown wrote:
> At some point the machine driver for the audio subsystem on the
> AT91SAM9G20-EK appears to have bitrotted, no longer probing due to
> effects of the transition to the common clock framework. The first patch
> in this series fixes the initial probe problem, with the rest of the
> series being random other fixes and cleanups I noticed while looking at
> the driver.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/3] ASoC: atmel: Remove system clock tree configuration for at91sam9g20ek
      commit: c775cbf62ed4911e4f0f23880f01815753123690
[2/3] ASoC: atmel: Fix error handling in at91samg20ek probe()
      commit: 28103509248b94392e04a8ffcbc47da5e3e31dfc
[3/3] ASoC: atmel: Don't squash error codes from atmel_ssc_set_audio()
      commit: 01251dd004d8e106295c3aa8e3ba890f0dd55e02

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
