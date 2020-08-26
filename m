Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 952F525382E
	for <lists+alsa-devel@lfdr.de>; Wed, 26 Aug 2020 21:19:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 33DED17B0;
	Wed, 26 Aug 2020 21:18:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 33DED17B0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1598469544;
	bh=0H6AKIRhKk8pjwIpNJ1qeXyffDG7WNeaHBbBTs3CeAw=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=GUT5SgAXH30LInIr6X9ckM8BHshwvtVqEK+ghUZudOdgRg7i9gwtwvfbkuoKnsxtw
	 Ykd6QCSjlb/OvHkU1EG2BXyQHMIhlYyBBZwmLJs5roo/K9QpaFYOrW2vDmJRa1hmQT
	 smjXJrUJVu8e3RoZzbQfYqGgQCCgjFqDRQ94Morc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 462E1F8016F;
	Wed, 26 Aug 2020 21:17:23 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 68BB6F801D9; Wed, 26 Aug 2020 21:17:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C5CC6F800EB
 for <alsa-devel@alsa-project.org>; Wed, 26 Aug 2020 21:17:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C5CC6F800EB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="ZiCZuNhm"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id AF71E2078A;
 Wed, 26 Aug 2020 19:17:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1598469436;
 bh=0H6AKIRhKk8pjwIpNJ1qeXyffDG7WNeaHBbBTs3CeAw=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=ZiCZuNhmWPoftkP1giXAxL3KKv8kxyu8FywRiqwvNgbAk3UiReFw8QWqoRAmQlDXC
 0HdOekZaDZKz40p2MhoYd7/T6UaPa0OKCiHE0OfItmOBdbjEHZT+pmTgm2766hL5xY
 gL+M2Jt3fTHSFKtfPBjD8ZHEKH0dtvQj/8vqXDwQ=
Date: Wed, 26 Aug 2020 20:16:39 +0100
From: Mark Brown <broonie@kernel.org>
To: Vinod Koul <vkoul@kernel.org>
In-Reply-To: <20200826163340.3249608-1-vkoul@kernel.org>
References: <20200826163340.3249608-1-vkoul@kernel.org>
Subject: Re: [PATCH v2 0/5] ASoC: Fix return check for devm_regmap_init_sdw()
Message-Id: <159846939971.39744.13669389911848588325.b4-ty@kernel.org>
Cc: Oder Chiou <oder_chiou@realtek.com>, alsa-devel@alsa-project.org,
 Ryan Lee <ryans.lee@maximintegrated.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, Takashi Iwai <tiwai@suse.com>,
 linux-kernel@vger.kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Shuming Fan <shumingf@realtek.com>, Naveen Manohar <naveen.m@intel.com>,
 Rander Wang <rander.wang@linux.intel.com>
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

On Wed, 26 Aug 2020 22:03:35 +0530, Vinod Koul wrote:
> This series attempts to fix return check for devm_regmap_init_sdw()
> 
> Changes in v2:
>  - Add missing patch for rt711
>  - Add patch for rt700
> 
> Vinod Koul (5):
>   ASoC: max98373: Fix return check for devm_regmap_init_sdw()
>   ASoC: rt1308-sdw: Fix return check for devm_regmap_init_sdw()
>   ASoC: rt711: Fix return check for devm_regmap_init_sdw()
>   ASoC: rt715: Fix return check for devm_regmap_init_sdw()
>   ASoC: rt700: Fix return check for devm_regmap_init_sdw()
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/5] ASoC: max98373: Fix return check for devm_regmap_init_sdw()
      commit: 6e0c9b5f90978287b5a3d38ee83203d295f375f1
[2/5] ASoC: rt1308-sdw: Fix return check for devm_regmap_init_sdw()
      commit: 344850d93c098e1b17e6f89d5e436893e9762ef3
[3/5] ASoC: rt711: Fix return check for devm_regmap_init_sdw()
      commit: be1a4b2c56db860a220c6f74d461188e5733264a
[4/5] ASoC: rt715: Fix return check for devm_regmap_init_sdw()
      commit: 282eb0b52e3f0399ee48a4cad0d9ffec840b0164
[5/5] ASoC: rt700: Fix return check for devm_regmap_init_sdw()
      commit: db1a4250aef53775ec0094b81454213319cc8c74

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
