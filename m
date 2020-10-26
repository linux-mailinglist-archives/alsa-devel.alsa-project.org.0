Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A759299B7D
	for <lists+alsa-devel@lfdr.de>; Tue, 27 Oct 2020 00:51:54 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 973B616A9;
	Tue, 27 Oct 2020 00:51:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 973B616A9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1603756313;
	bh=6VZp7NN9RQR4KCneTrrelWbguEBi3gdQgdStBN86o94=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=G9zjbpRJt740CLbiOTKKbj09blOp11nucOcZNZPJeBbDy6MpIIKw4WSbzquaWUXhr
	 Q50ZeSh7yW3QXeLuAN6u/QfOar3Gb6lRua/2WtaCm7TN7kUgQluQZnPVdEuIJ66x5f
	 vTKJnvueIWDdpTTmVZd3Kev9Cd/l1piWplgToq3M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 808A1F8051E;
	Tue, 27 Oct 2020 00:46:42 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C6E64F8051F; Tue, 27 Oct 2020 00:46:40 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AF2D9F8051D
 for <alsa-devel@alsa-project.org>; Tue, 27 Oct 2020 00:46:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AF2D9F8051D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="LCruTU3A"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id D407120809;
 Mon, 26 Oct 2020 23:46:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1603755996;
 bh=6VZp7NN9RQR4KCneTrrelWbguEBi3gdQgdStBN86o94=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=LCruTU3AiDgmDU34kPT7CWX4BDxhZKTvJp0PJYSBr0JimputKtRvL0Jr4ctkzh87G
 1iWw7tT6hG2iB8u/LS/+kmQvUu7xkmYZVMjDBdptK6j0OdWmTKgC9SG4aKmLNMv/Tr
 GoTh6NGL/J4bhxzjunF2DfdBItfw/kDvzC6B4Uco=
Date: Mon, 26 Oct 2020 23:46:32 +0000
From: Mark Brown <broonie@kernel.org>
To: Lars-Peter Clausen <lars@metafoo.de>
In-Reply-To: <20201023092346.5777-1-lars@metafoo.de>
References: <20201023092346.5777-1-lars@metafoo.de>
Subject: Re: [PATCH] ASoC: jz4740-i2s: Remove manual DMA peripheral ID
 assignment
Message-Id: <160375592348.31132.17522559874327603236.b4-ty@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: Paul Cercueil <paul@crapouillou.net>, alsa-devel@alsa-project.org
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

On Fri, 23 Oct 2020 11:23:46 +0200, Lars-Peter Clausen wrote:
> All platforms that use the jz4740-i2s driver have been switched to
> devicetree for a while now and the assignment of the DMA peripheral ID
> is done in the devicetree.
> 
> It is no longer necessary to manually assign the peripheral ID in the
> driver, so remove that. The DMA driver does not even look at the value
> assigned in the driver anymore and always uses the value provided by the
> devicetree.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: jz4740-i2s: Remove manual DMA peripheral ID assignment
      commit: 81dde99f1ac64e27290990c67439b49ecc1f7c29

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
