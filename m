Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DDFA1D7ECA
	for <lists+alsa-devel@lfdr.de>; Mon, 18 May 2020 18:42:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B93D31712;
	Mon, 18 May 2020 18:42:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B93D31712
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1589820175;
	bh=1mORd+n7+hjWf6dF3uFh+kuCN5qO/5gF28hOZXdPev4=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WggyV2CGTG/ODkeXeciEh7MwIack08p6eNYDvKKUo+v+nNlqjvTrUaOgJUXFEIBsn
	 JplSo+X60EgLOt62ZLa7XtMYI4NTquXVntHioJYBfVEl2Vr73mz+Ukg78+KTKzjNRP
	 L++oXxiqo+GG+yFe1OIL4/xxt7eXXv+dtVZOO11A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D7393F801F9;
	Mon, 18 May 2020 18:41:14 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 97F64F80213; Mon, 18 May 2020 18:41:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6BDCDF800C9
 for <alsa-devel@alsa-project.org>; Mon, 18 May 2020 18:41:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6BDCDF800C9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="PLjQYaj4"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id C254720758;
 Mon, 18 May 2020 16:41:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1589820061;
 bh=1mORd+n7+hjWf6dF3uFh+kuCN5qO/5gF28hOZXdPev4=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=PLjQYaj4MViTn37+76iGdU40xkyJk1/SYPFw4+6dY/7V8Bt3C/U71wT9JTVk41hKj
 xSW3uB2LQMi82GfX8JYYHIktkXifXD/GEAGpPcsDOtyuDOLFP/fVt9Htwmrsjkx0si
 Pd8J5UG/+7+OmsSXVIlMhfgy1EgmVU76qawvc8yg=
Date: Mon, 18 May 2020 17:40:58 +0100
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org, Kai Vehmanen <kai.vehmanen@linux.intel.com>
In-Reply-To: <20200515135958.17511-1-kai.vehmanen@linux.intel.com>
References: <20200515135958.17511-1-kai.vehmanen@linux.intel.com>
Subject: Re: [PATCH 0/8] ASoC: SOF: Intel and IMX updates for 5.8
Message-Id: <158982005876.28736.6270537965994775713.b4-ty@kernel.org>
Cc: daniel.baluta@nxp.com, ranjani.sridharan@linux.intel.com,
 pierre-louis.bossart@linux.intel.com
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

On Fri, 15 May 2020 16:59:50 +0300, Kai Vehmanen wrote:
> here's a series of minor fixes and improvements to SOF. Add support
> for smart amplifier component type. Cover more systems by relaxing
> match rules for the generic Soundwire machine driver. Fix issues with
> driver unload and address a few compiler warnings.
> 
> Daniel Baluta (2):
>   ASoC: SOF: Do nothing when DSP PM callbacks are not set
>   ASoC: SOF: define INFO_ flags in dsp_ops
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.8

Thanks!

[1/8] ASoC: SOF: Do nothing when DSP PM callbacks are not set
      commit: c26fde3b15ed41f5f452f1da727795f787833287
[2/8] ASoC: SOF: add a power_down_notify method
      commit: 3541aef1b83fa3a13e9c4ecc0919156ff2ec9c22
[3/8] ASoC: SOF: inform DSP that driver is going to be removed
      commit: 9f369f7e4660d05b5318aa413db199a70dfb2c4f
[4/8] ASoC: SOF: topology: add support to smart amplifier
      commit: 82e8c00fa18a3ef0ad3087dcad1d82637a738e30
[5/8] ASoC: SOF: Intel: sdw: relax sdw machine select constraints
      commit: 7d1952bceb8a1a2372a1cb86ab109c6ec8772c5c
[6/8] ASoC: SOF: define INFO_ flags in dsp_ops
      commit: 5c2c3cb1ca7875a2685c8cc65f08a1238e00cedb
[7/8] ASoC: SOF: imx: make dsp_ops static
      commit: 35e7c09d1edd6c60bfa98070b657986500819fd6
[8/8] ASoC: SOF: imx: make imx8m_dsp_ops static
      commit: 99cb681e7b8eec917ddb34b76e303aa20b2d1c1a

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
