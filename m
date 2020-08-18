Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BCC1A248C90
	for <lists+alsa-devel@lfdr.de>; Tue, 18 Aug 2020 19:08:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6BFA317D2;
	Tue, 18 Aug 2020 19:07:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6BFA317D2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1597770497;
	bh=CJ+7MrW9n8maKY/KRemfT07oZ9ah6UedsLiX0UnR0KE=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jnjr/K6o7Yvm/1NvNKHdSdPgeSuOcuGXV6O89CcR+mUO67rX8UvjXjSp/By8IASvg
	 qZaTY39CRysjNC35bKD55a8irBExmIhTnhZtYnyqmgAuy0qU9BrC7dcDOeKlJHp0Kc
	 3sLvuMbWzbE0k4RlWz8rHOTAc1D/eVTcV6W1NNGQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A8A46F8037D;
	Tue, 18 Aug 2020 18:56:01 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CB4B7F80377; Tue, 18 Aug 2020 18:55:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,PRX_BODY_26,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 72A6FF80372
 for <alsa-devel@alsa-project.org>; Tue, 18 Aug 2020 18:55:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 72A6FF80372
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="lTyzTzUF"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 7B1F820786;
 Tue, 18 Aug 2020 16:55:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1597769756;
 bh=CJ+7MrW9n8maKY/KRemfT07oZ9ah6UedsLiX0UnR0KE=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=lTyzTzUFRGDcvFr8HzJv0+oTkdOkF81E+6+SI8nOb3ubUWp80lLTDdBJxv+xXxeGW
 Dr1diSgDgJuJFD0sd7tETwV891v/CiVCOBK4PyiMPA0z0MDVh8Gg6Bm+acsXEOLt9O
 GugKMoye5KfFyDl3hJ+MOouItRhMhSrtgFeuusLY=
Date: Tue, 18 Aug 2020 17:55:25 +0100
From: Mark Brown <broonie@kernel.org>
To: Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Chen-Yu Tsai <wens@csie.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Takashi Iwai <tiwai@suse.com>
In-Reply-To: <20200726025334.59931-1-samuel@sholland.org>
References: <20200726025334.59931-1-samuel@sholland.org>
Subject: Re: [PATCH v2 0/8] ASoC: sun50i-codec-analog: Cleanup and power
 management
Message-Id: <159776961932.56094.11388923690461869289.b4-ty@kernel.org>
Cc: Ondrej Jirman <megous@megous.com>, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
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

On Sat, 25 Jul 2020 21:53:26 -0500, Samuel Holland wrote:
> This series performs some minor cleanup on the driver for the analog
> codec in the Allwinner A64, and hooks up the existing mute switches to
> DAPM widgets, in order to provide improved power management.
> 
> Changes since v1:
>   - Collected Acked-by/Reviewed-by tags
>   - Used SOC_MIXER_NAMED_CTL_ARRAY to avoid naming a widget "Earpiece"
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/8] ASoC: sun50i-codec-analog: Fix duplicate use of ADC enable bits
      commit: ad5b7f69a09b6784f6fc263d7c0fffdda947a8ce
[2/8] ASoC: sun50i-codec-analog: Gate the amplifier clock during suspend
      commit: 9b7612bb75e50acc55d2143cadb8057a6721d9c7
[3/8] ASoC: sun50i-codec-analog: Group and sort mixer routes
      commit: cababecb33c05b8229558df6248d5869a38ceec3
[4/8] ASoC: sun50i-codec-analog: Make headphone routes stereo
      commit: 241a578a9ebf866351e12029fc77f5a48b742042
[5/8] ASoC: sun50i-codec-analog: Enable DAPM for headphone switch
      commit: 4b9f39e14cf606def16897d85da492fc54b94a43
[6/8] ASoC: sun50i-codec-analog: Make line out routes stereo
      commit: dd8286a34963c47964ab3c73d56656c9719a36b4
[7/8] ASoC: sun50i-codec-analog: Enable DAPM for line out switch
      commit: 95d34762f201c0f7cf0ed920815f349cfe336fe1
[8/8] ASoC: sun50i-codec-analog: Enable DAPM for earpiece switch
      commit: 7829e68d55692c9f7f5665ebec9fa1f33d5ad72f

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
