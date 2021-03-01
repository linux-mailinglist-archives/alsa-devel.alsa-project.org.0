Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BAB632954C
	for <lists+alsa-devel@lfdr.de>; Tue,  2 Mar 2021 00:41:44 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 99F3D1685;
	Tue,  2 Mar 2021 00:40:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 99F3D1685
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1614642103;
	bh=mwsay5s5eqahx5ekc52x1LsK1xRv62c49/5yZJhJD1Y=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=FydqDVMJ4e6lE9MClNsPg6oiFsOi+iydDK/jbiFZBXoLnE/iV7i2OX4GobxYlZcbD
	 a4CT00wWbSLZHCzl9WOu3Zye89MY+g6oOGRb5PJmLncSEQRa9NTna4sbrOGmCL2fLB
	 9lAJjFTfhaf/x2qthOrSL0J08rOOSEwyjd+n/H2I=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A0714F804F3;
	Tue,  2 Mar 2021 00:36:52 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E4038F804FA; Tue,  2 Mar 2021 00:36:50 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 829BDF804ED
 for <alsa-devel@alsa-project.org>; Tue,  2 Mar 2021 00:36:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 829BDF804ED
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="utsnrD+u"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6DE0560C3E;
 Mon,  1 Mar 2021 23:36:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1614641807;
 bh=mwsay5s5eqahx5ekc52x1LsK1xRv62c49/5yZJhJD1Y=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=utsnrD+uYaKXVnROaqQ2X+dMagsOxB/5oBHugEZimKr6ZBxwBLSOTjfcHrAMWpu5G
 gY0tDIRe3DHLcLSvWgHsMDTZ32vhyxSFc+JXAMMOtRQPl9zf8A1dZE2FoGV/KQqcZk
 xvlM/Di+sq0l4BYTHSWCqGYDJCVTKPs8txGE52qYxpLKywtz/6+U3LxfKsnGljdbtv
 /9PcXFmL0+D6/+mm3ShrFKeBBxFpz6Yf2zqMdeNN0MBRirPm6erklg6HtO9cbDq2OA
 vBiiPHoq7/gSFlh7V7F/07FIa0mKCrKTVvyG8gaxrwyJAPze9LtILDwR8l4n7+d7C4
 6gMasxszOtWew==
From: Mark Brown <broonie@kernel.org>
To: Julia Lawall <Julia.Lawall@inria.fr>,
 Jernej Skrabec <jernej.skrabec@siol.net>
In-Reply-To: <20210213101907.1318496-1-Julia.Lawall@inria.fr>
References: <20210213101907.1318496-1-Julia.Lawall@inria.fr>
Subject: Re: [PATCH 0/4] drop unneeded snd_soc_dai_set_drvdata
Message-Id: <161464168096.31144.9397377400950127725.b4-ty@kernel.org>
Date: Mon, 01 Mar 2021 23:34:40 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>,
 Takashi Iwai <tiwai@suse.com>, NXP Linux Team <linux-imx@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, linux-arm-kernel@lists.infradead.org
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

On Sat, 13 Feb 2021 11:19:03 +0100, Julia Lawall wrote:
> snd_soc_dai_set_drvdata is not needed when the set data comes from
> snd_soc_dai_get_drvdata or dev_get_drvdata.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/4] ASoC: mmp-sspa: drop unneeded snd_soc_dai_set_drvdata
      commit: 131036ffae211a9cc3bfb053fadce87484e13fc5
[2/4] ASoC: mxs-saif: drop unneeded snd_soc_dai_set_drvdata
      commit: 7150186f1edb2fa94554be1bec26aa65a7df3388
[3/4] ASoC: sun4i-i2s: drop unneeded snd_soc_dai_set_drvdata
      commit: 0c34af2d5c9ba5103637c33c4f52d658172b991d
[4/4] ASoC: fsl: drop unneeded snd_soc_dai_set_drvdata
      commit: eb9db3066cdb57dbfd1fb3d85ca143ad5d719bfb

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
