Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 29F931D81B3
	for <lists+alsa-devel@lfdr.de>; Mon, 18 May 2020 19:50:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A67C0177A;
	Mon, 18 May 2020 19:49:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A67C0177A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1589824226;
	bh=K8uUP7NW7k8HEW4UogoNFxWX1ipPwAsm8gKwhU3oCs0=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=UDFePrJWw5j2OwOUqMcUhdPXgdY/e3kS7aGml9sLBFOKYFZaxBEuiqUCvdJv0VnKm
	 pzVJiwvFpmkGmmJVPjLsKma7LPi+Xq0AzXP7v+U76ifOZ30xx4DtOLFxsAVYftjiFJ
	 cN/Ccs4Yn8D0SLb1cFEXDnmOd9+RYTFxGr9nOGCY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D32BDF80086;
	Mon, 18 May 2020 19:48:45 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 81F25F801DA; Mon, 18 May 2020 19:48:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BD482F80086
 for <alsa-devel@alsa-project.org>; Mon, 18 May 2020 19:48:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BD482F80086
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="MphKsm9j"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id A274520715;
 Mon, 18 May 2020 17:48:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1589824117;
 bh=K8uUP7NW7k8HEW4UogoNFxWX1ipPwAsm8gKwhU3oCs0=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=MphKsm9jtCtCS52CMTsrp7SxST49jHIRP5THSf/Sjs044t1DfGLb1OGWln48xURgQ
 LY4+uMj9M42lHGTLnotLv0lvi/4GoW1s5HczZnxPEDDTecP/aiODGfi7GmxF6B94Et
 x91558XV/c/0rP22O0j+GPd4din1R0fCcWPA3+eA=
Date: Mon, 18 May 2020 18:48:34 +0100
From: Mark Brown <broonie@kernel.org>
To: Jie Yang <yang.jie@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20200518072416.5348-1-hdegoede@redhat.com>
References: <20200518072416.5348-1-hdegoede@redhat.com>
Subject: Re: [PATCH] ASoC: Intel: bytcr_rt5640: Add quirk for Toshiba Encore
 WT8-A tablet
Message-Id: <158982411450.4488.13635482284429965850.b4-ty@kernel.org>
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

On Mon, 18 May 2020 09:24:16 +0200, Hans de Goede wrote:
> The Toshiba Encore WT8-A tablet almost fully works with the default
> settings for non-CR Bay Trail devices. The only problem is that its
> jack-detect switch is not inverted (it is active high instead of
> the normal active low).
> 
> Add a quirk for this model using the default settings +
> BYT_RT5640_JD_NOT_INV.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.8

Thanks!

[1/1] ASoC: Intel: bytcr_rt5640: Add quirk for Toshiba Encore WT8-A tablet
      commit: 0e0e10fde0e9808d1991268f5dca69fb36c025f7

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
