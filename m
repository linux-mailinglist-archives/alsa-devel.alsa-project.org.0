Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D496521B9B6
	for <lists+alsa-devel@lfdr.de>; Fri, 10 Jul 2020 17:42:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 86A921658;
	Fri, 10 Jul 2020 17:41:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 86A921658
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594395758;
	bh=0xKrMGr98Vst8t6JlRN/Q/frZtzHFefZ9evBMg8BW6Q=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=SPCFAAfMhSu+z9feKLqP9KVmo5u5+H6o2ZSYNT1p8GY/Jooycx1mC94dphOPFwIHb
	 Di4yb3wG31uUiyWO+cNDNwg/Vn0kOSAf0gd2oSvVIUgtx0dRSnz8PkKDXnokCsCF4d
	 N6oigZNEfxdWULcTKnNFTjrEx6xUZ8AmZkHuTR7c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2542AF802BD;
	Fri, 10 Jul 2020 17:40:06 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 41BA0F80258; Fri, 10 Jul 2020 17:39:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4E104F8015D
 for <alsa-devel@alsa-project.org>; Fri, 10 Jul 2020 17:39:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4E104F8015D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="BFIWZcy2"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 39F0E207BB;
 Fri, 10 Jul 2020 15:39:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1594395594;
 bh=0xKrMGr98Vst8t6JlRN/Q/frZtzHFefZ9evBMg8BW6Q=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=BFIWZcy2tHKEY11Fo/wwV+Nz7aoYZbnqF1hWwMLp6CfnlouDye0K2Gkl8NACnwpEx
 36t+GG9wPGBI50/sTPjDacO3s1cPpPpdeHsPC5E4yuLO+bts++Tug2N4hpvyXAdmEy
 Vwua11njm3Kmv09b4CVudefYrqvFWlf2GyME9yPE=
Date: Fri, 10 Jul 2020 16:39:48 +0100
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Jie Yang <yang.jie@linux.intel.com>, Oder Chiou <oder_chiou@realtek.com>,
 Hans de Goede <hdegoede@redhat.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <20200703103840.333732-1-hdegoede@redhat.com>
References: <20200703103840.333732-1-hdegoede@redhat.com>
Subject: Re: [PATCH] ASoC: Intel: cht_bsw_rt5672: Improve dai-set-fmt comment
 in cht_codec_fixup()
Message-Id: <159439557865.48910.7254570674274096705.b4-ty@kernel.org>
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

On Fri, 3 Jul 2020 12:38:40 +0200, Hans de Goede wrote:
> As Pierre-Louis Bossart pointed out, saying that the default mode for the
> SSP is TDM 4 slot is not entirely accurate.
> 
> There really are 2 default modes:
> The default mode for the SSP configuration is TDM 4 slot for the
> cpu-dai (hard-coded in DSP firmware),
> The default mode for the SSP configuration is I2S for the codec-dai
> (hard-coded in the 'SSP2-Codec" .dai_fmt masks, so far unused).
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: Intel: cht_bsw_rt5672: Improve dai-set-fmt comment in cht_codec_fixup()
      commit: 984b2cadd9e1cb060c27b7d5c1113bcf7e30f129

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
