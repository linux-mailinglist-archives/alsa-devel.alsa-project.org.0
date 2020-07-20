Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 304C122625E
	for <lists+alsa-devel@lfdr.de>; Mon, 20 Jul 2020 16:43:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BBF7A850;
	Mon, 20 Jul 2020 16:42:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BBF7A850
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1595256192;
	bh=+WvfaW/LxcgFPTrBL+EfFYzz7ctpjxkmyhhSoyAN57E=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=sFdeLI0XxF82Bg/a5Hhrv16zL2lNVQRcH5N7MjnN+LgudN4gfNzepkR0vEkUAVxpQ
	 NoCf0RkjRGJKST9mxwTV4sLondXrSDpbLEks+g1fR5R1zRh+jUYxb7ZvL6oE5BGxOP
	 glfEWcesBKbGifc8NIz2AzTlktWdPlVPUvdwXccs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4E6C6F802BE;
	Mon, 20 Jul 2020 16:39:07 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DAB6AF802C2; Mon, 20 Jul 2020 16:39:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EADCEF80279
 for <alsa-devel@alsa-project.org>; Mon, 20 Jul 2020 16:38:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EADCEF80279
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="XK/xeZv3"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0518222CB1;
 Mon, 20 Jul 2020 14:38:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1595255936;
 bh=+WvfaW/LxcgFPTrBL+EfFYzz7ctpjxkmyhhSoyAN57E=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=XK/xeZv3Y8B8mt+X9PcZSHufP5b3Stxuh1zzFY5JjjUVnbNykR6nF+5M4zwkOnLBT
 DC+6bEzZqmVVgNdvx6cBRHezQCM24exvcbtmMoroamhGxdBfJhfPHQ+MM4M64UxieN
 dQxbumgZOdCfkUyEFn3Dsy/SLvY+KjQ9J6CiWsEo=
Date: Mon, 20 Jul 2020 15:38:44 +0100
From: Mark Brown <broonie@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 alsa-devel@alsa-project.org
In-Reply-To: <20200717211337.31956-1-pierre-louis.bossart@linux.intel.com>
References: <20200717211337.31956-1-pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH 0/6] ASoC: Intel: machine driver updates for 5.9
Message-Id: <159525589434.6792.2400800009292925244.b4-ty@kernel.org>
Cc: tiwai@suse.de
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

On Fri, 17 Jul 2020 16:13:31 -0500, Pierre-Louis Bossart wrote:
> Small patchset to harden the SoundWire machine driver, change bad
> HIDs, update PLL settings and avoid memory leaks. Given that the
> SoundWire core parts are not upstream it's probably not necessary to
> provide the patches to stable branches.
> 
> Bard Liao (1):
>   ASoC: Intel: sof_sdw_rt711: remove hard-coded codec name
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/6] ASoC: Intel: sof_sdw_rt711: remove hard-coded codec name
      (no commit info)
[2/6] ASoC: Intel: sof_sdw_rt711: remove properties in card remove
      (no commit info)
[3/6] ASoC: Intel: sof_sdw: add support for systems without i915 audio
      (no commit info)
[4/6] ASoC: Intel: sof_sdw: avoid crash if invalid DSP topology loaded
      (no commit info)
[5/6] ASoC: intel: board: sof_rt5682: Update rt1015 pll input clk freq
      (no commit info)
[6/6] ASoC: Intel: common: change match table ehl-rt5660
      commit: 58ef60025a1263e78de01b135d05784996383611

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
