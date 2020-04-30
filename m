Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B80DF1BF9C2
	for <lists+alsa-devel@lfdr.de>; Thu, 30 Apr 2020 15:42:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5CF731697;
	Thu, 30 Apr 2020 15:41:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5CF731697
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1588254158;
	bh=VhqX0HsQbZfOc9fdwlGXtb1kKBdlKfnsyMsYsZ5tC1Q=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dS7TVpylaSzSUet+xSizyvOnudGAembC+7iczHdYYe7JpVckpD+rRrol+dzk/lqZ6
	 cgkPBIOd0YhQvA12vCAnGWa1h2gII+0Q2r6aR3q0/jsa09DEBzSaGdsHivIOkuVk3C
	 NI9BlryJFnBeOokrePhfeIT49MvoyMtjG98xJHGw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 151E1F8024A;
	Thu, 30 Apr 2020 15:40:15 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9D9D3F801DB; Thu, 30 Apr 2020 15:40:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5A3E6F80136;
 Thu, 30 Apr 2020 15:40:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5A3E6F80136
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="vEyNwKh1"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 4EEA72074A;
 Thu, 30 Apr 2020 13:40:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1588254002;
 bh=VhqX0HsQbZfOc9fdwlGXtb1kKBdlKfnsyMsYsZ5tC1Q=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=vEyNwKh17sc1MGjKVDP/VBDZCx5SjPCctcZsgiAdAqZRhzpx12dE85noRGTwn2fs+
 NloayhqvlqTgdwY9v1uEOL44vVIaqaW+qmNgAN8y2TNDU2kds55Zx6GkuIuYniqLlE
 ekZgSwQeqMuERtODKsbrkA50qcXA40F0fTTyQ+Bs=
Date: Thu, 30 Apr 2020 14:40:00 +0100
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Arnd Bergmann <arnd@arndb.de>
In-Reply-To: <20200428212752.2901778-1-arnd@arndb.de>
References: <20200428212752.2901778-1-arnd@arndb.de>
Subject: Re: [PATCH] ASoC: SOF: sort out Kconfig, again
Message-Id: <158825399444.18388.10906948463767019815.b4-ty@kernel.org>
Cc: Daniel Baluta <daniel.baluta@nxp.com>,
 Stephen Rothwell <sfr@canb.auug.org.au>, alsa-devel@alsa-project.org,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Fabio Estevam <festevam@gmail.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Takashi Iwai <tiwai@suse.com>, YueHaibing <yuehaibing@huawei.com>,
 linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 NXP Linux Team <linux-imx@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>, linux-arm-kernel@lists.infradead.org,
 sound-open-firmware@alsa-project.org
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

On Tue, 28 Apr 2020 23:27:36 +0200, Arnd Bergmann wrote:
> The imx8 config keeps causing issues:
> 
> WARNING: unmet direct dependencies detected for SND_SOC_SOF_IMX8M
>   Depends on [n]: SOUND [=y] && !UML && SND [=y] && SND_SOC [=m] && SND_SOC_SOF_TOPLEVEL [=y] && SND_SOC_SOF_IMX_TOPLEVEL [=y] && IMX_DSP [=n]
>   Selected by [m]:
>   - SND_SOC_SOF_IMX_OF [=m] && SOUND [=y] && !UML && SND [=y] && SND_SOC [=m] && SND_SOC_SOF_TOPLEVEL [=y] && SND_SOC_SOF_IMX_TOPLEVEL [=y] && SND_SOC_SOF_IMX8M_SUPPORT [=y]
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.8

Thanks!

[1/1] ASoC: SOF: sort out Kconfig, again
      commit: f9dfa8f25462a2b9bb47dcb563688d616e21ee83

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
