Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 96AD247B89F
	for <lists+alsa-devel@lfdr.de>; Tue, 21 Dec 2021 03:54:38 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2EBDC179F;
	Tue, 21 Dec 2021 03:53:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2EBDC179F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1640055278;
	bh=hB9Ki9E0Om8Ig/meipe0fE2n2sixWINxeAb6XU2zms0=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=cKVrijWGTFg7EL+hVMVPaPmLPr+7Ag4IoSwYNAi45qzeIVFly9Ydp5WVqbvWDzUj0
	 bdmUtBuKLI/gJHbiviCz/xdpQGSPitl75LHyBeVNkHe9SKTx2oC9II1LyjRpRyG6Tc
	 MwYJs0R0eJiLNDEiKH2OFOrHvPITSW0gnhfMt9vI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CE78AF8053A;
	Tue, 21 Dec 2021 03:51:07 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A2B70F80518; Tue, 21 Dec 2021 03:50:59 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F0ED1F8032B
 for <alsa-devel@alsa-project.org>; Tue, 21 Dec 2021 03:50:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F0ED1F8032B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="WGFNEwB6"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id BE0E8B81113;
 Tue, 21 Dec 2021 02:50:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DDDBFC36AE5;
 Tue, 21 Dec 2021 02:50:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1640055053;
 bh=hB9Ki9E0Om8Ig/meipe0fE2n2sixWINxeAb6XU2zms0=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=WGFNEwB6hbrXRKT77Sl658ptcyfmquRN++maXxDtLz3IYzz3nRPvDcIhwbPzaGL/s
 xWJCxsGonVzKV8YefZVs8UHh9tOWWuV/JLAOQfhgMKCXDfWBx4a18qoNF5Tj79Qaxu
 iEfGF0yS6TEK0xCnlQegBkQvQSPEqJNPqEMOrF7sBc1sFdsug3PnD5g65KEN6QFD/R
 DRyDJMOsIqf8ZsVW90+Lu5eCLRvXsf/o6LADtu0e9e0SzuQjY4UjlG8dHM/kku7Vbl
 OVItRxZwtAFkbOPuCmDDp6xNpa3vRj4tqvo7MLPlicPOyksNcoDHw2/xS2YIb4Gtxf
 tY6tqbtNHSuyg==
From: Mark Brown <broonie@kernel.org>
To: Ricard Wanderlof <ricardw@axis.com>, Liam Girdwood <lgirdwood@gmail.com>
In-Reply-To: <alpine.DEB.2.21.2112151801370.27889@lap5cg0092dnk.se.axis.com>
References: <alpine.DEB.2.21.2112151801370.27889@lap5cg0092dnk.se.axis.com>
Subject: Re: [PATCH v7 2/2] ASoC: codec: tlv320adc3xxx: New codec driver
Message-Id: <164005505263.2647792.3409324742858691382.b4-ty@kernel.org>
Date: Tue, 21 Dec 2021 02:50:52 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: alsa-devel <alsa-devel@alsa-project.org>
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

On Wed, 15 Dec 2021 18:04:23 +0100, Ricard Wanderlof wrote:
> New codec driver for Texas Instruments TLV320ADC3001 and
> TLV320ADC3101 audio ADCs.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[2/2] ASoC: codec: tlv320adc3xxx: New codec driver
      commit: e9a3b57efd28fe889a98171bdc1e9e0dd7eb9a50

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
