Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C3A9F211608
	for <lists+alsa-devel@lfdr.de>; Thu,  2 Jul 2020 00:29:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 70CB3168C;
	Thu,  2 Jul 2020 00:28:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 70CB3168C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1593642580;
	bh=MZDLyLA8acGzO9yHIN4h77587T3pKwK3OCF/8mjr1T4=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Dq5sUGTaoeNTI5ZmM/zlcXQyG8COiDSYjzGjBRYrUZ4hdI4YaApWqdXvD8bvxC5Sa
	 YI8V7yRf4jeuq5sFYCoJ8eFsAstp6aSE92QHvbqpVB0DnizcOuUXDWg3qWFemTKHc2
	 27tiqA4W2sphhBltYUrn+H3gIWRm/pvazhrOL1po=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B4685F80328;
	Thu,  2 Jul 2020 00:23:29 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6BA65F80323; Thu,  2 Jul 2020 00:23:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 83280F80316
 for <alsa-devel@alsa-project.org>; Thu,  2 Jul 2020 00:23:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 83280F80316
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="OwzRtDOM"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 8150E20780;
 Wed,  1 Jul 2020 22:23:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1593642203;
 bh=MZDLyLA8acGzO9yHIN4h77587T3pKwK3OCF/8mjr1T4=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=OwzRtDOMcJlv9bj6O59TgwJLA6UVR42K0I24tKzFMuD7ans/rBy2deG+BFDNg8aTV
 44AuFhe/9mOv/Rp0O3fp3NtY5k32XL40R2Aviz4U1HBbE/hSkcAH6f1RuMVf3w4OzW
 1mXQgOGUFojXTtDw36jREyNMrtew9/7fp0BcH4P8=
Date: Wed, 01 Jul 2020 23:23:20 +0100
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, Oder Chiou <oder_chiou@realtek.com>
In-Reply-To: <20200701071645.32061-1-oder_chiou@realtek.com>
References: <20200701071645.32061-1-oder_chiou@realtek.com>
Subject: Re: [PATCH] ASoC: rt5682: cancel jack_detect_work if hs_jack is set
 to null even soundwire mode
Message-Id: <159364215574.10630.4566381066826223824.b4-ty@kernel.org>
Cc: jack.yu@realtek.com, alsa-devel@alsa-project.org, albertchen@realtek.com,
 derek.fang@realtek.com, flove@realtek.com, shumingf@realtek.com,
 bard.liao@intel.com
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

On Wed, 1 Jul 2020 15:16:45 +0800, Oder Chiou wrote:
> Base on https://patchwork.kernel.org/patch/11237953/
> Soundwire mode also should follow it.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: rt5682: cancel jack_detect_work if hs_jack is set to null even soundwire mode
      commit: bc4be656471b39af8f2ad57ee372012c55da1da7

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
