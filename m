Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 01195250924
	for <lists+alsa-devel@lfdr.de>; Mon, 24 Aug 2020 21:18:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5D934167C;
	Mon, 24 Aug 2020 21:17:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5D934167C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1598296726;
	bh=jwN7ZNTY2Iw9Y5P8potD/uzWRk1BHJ9ZXOqf9yQIoTU=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=oGs52c/5bqUP3pGG0qTqAlWo4WQefOwgn6HahPy0Hq9Bwc5LTV4KI7QHE+KTSpxfE
	 lFixCXOTWbqF12HSyqW63ocJkhKKeYV7yyDgjntLJOKhO32We+I0/z2IWaNk2LQV9D
	 BGAQ18rY03cgkoeTdOmei6/xxnGioXzsG2MvJcJA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 85361F800B8;
	Mon, 24 Aug 2020 21:17:05 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7B2BBF801D9; Mon, 24 Aug 2020 21:17:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 55A61F800B8
 for <alsa-devel@alsa-project.org>; Mon, 24 Aug 2020 21:16:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 55A61F800B8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="DXQbJt88"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 31F3620578;
 Mon, 24 Aug 2020 19:16:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1598296610;
 bh=jwN7ZNTY2Iw9Y5P8potD/uzWRk1BHJ9ZXOqf9yQIoTU=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=DXQbJt884Hp7RrBHsdsqDs2LiWObUDSFa7l2Q0QIfeNP2miZsSeulmSOTkf+WLd15
 za6ThZnUuRES/qnD97Em5YjdjeYIPRjuXCAc3t9rsevoPDvLMGgKHqQCV5TCWNU1Gm
 XHlsNepQDj8o+KIywqFC6b35qyxmTM/1HO7BuhF0=
Date: Mon, 24 Aug 2020 20:16:16 +0100
From: Mark Brown <broonie@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 alsa-devel@alsa-project.org
In-Reply-To: <20200821195603.215535-1-pierre-louis.bossart@linux.intel.com>
References: <20200821195603.215535-1-pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH 00/14] ASoC: Intel: machine driver updates for 5.10
Message-Id: <159829657608.37668.3583799963093180346.b4-ty@kernel.org>
Cc: tiwai@suse.de, vinod.koul@intel.com,
 Bard liao <yung-chuan.liao@linux.intel.com>,
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

On Fri, 21 Aug 2020 14:55:47 -0500, Pierre-Louis Bossart wrote:
> This series updates the tables used to select SoundWire configurations
> for CometLake and TigerLake, and adds support for SDCA (SoundWire
> Device Class for Audio) codecs in the common machine driver. These
> codec drivers are still being tested on early silicon/boards and will
> be contributed at a later time.
> 
> For TigerLake Chromebooks a new DMI quirk is added, as well as a means
> to override the topology names. A pm_runtime fix is also provided to
> deal with playback/capture dependencies with an amplifier w/
> feedback. I also included a minor codec correction for the TGL
> amplifier.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: Intel: tgl_max98373: fix a runtime pm issue in multi-thread case
      commit: e300486ad94d2608ebc3aaed4e03e86eeeb97084

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
