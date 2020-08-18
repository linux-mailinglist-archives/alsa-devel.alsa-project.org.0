Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A1821248D60
	for <lists+alsa-devel@lfdr.de>; Tue, 18 Aug 2020 19:42:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E6F0317F1;
	Tue, 18 Aug 2020 19:41:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E6F0317F1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1597772545;
	bh=QoPaf4egRW2rnSHqEO2/BiqGRsXuylKPG8k1819llQY=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qj77bZdNgThga+6ZNVol+t9x2uZblwL1E08GINEI3U8HCMUkJHIPwM7Np+i8zP8O7
	 +nx5gObnKdEAyJzLjahskvfPpfYSvtkEk7Naf9t0WrVW47eiv9g8qlASiGz346wTRS
	 7sGxGfmIqSR2wlXydQVmCoExggG8IA7X1obvfQ5E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E5C16F802A2;
	Tue, 18 Aug 2020 19:39:59 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A6AC9F80228; Tue, 18 Aug 2020 19:39:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3A603F800D3
 for <alsa-devel@alsa-project.org>; Tue, 18 Aug 2020 19:39:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3A603F800D3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="ViDeIAN1"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 6527420674;
 Tue, 18 Aug 2020 17:39:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1597772392;
 bh=QoPaf4egRW2rnSHqEO2/BiqGRsXuylKPG8k1819llQY=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=ViDeIAN1u1pBpmkfysiM7caC8Z7NB5kupBFZkv0jAmUFMpMzZdRVfKCtRFqhDuzNC
 2CihM5ost/lypnKIww84i8XVsf0slzwwYrwxUZ7FcpvR7pEhNsRJgDV44KABiYqHcU
 ckkcO7g2HoVq6uZQbslykPeakNxg359pWa8riXOU=
Date: Tue, 18 Aug 2020 18:39:22 +0100
From: Mark Brown <broonie@kernel.org>
To: Brent Lu <brent.lu@intel.com>, alsa-devel@alsa-project.org
In-Reply-To: <20200818143632.16539-1-brent.lu@intel.com>
References: <20200818004413.12852-1-brent.lu@intel.com>
 <20200818143632.16539-1-brent.lu@intel.com>
Subject: Re: [PATCH v3] ASoC: hdac_hdmi: support 'ELD' mixer
Message-Id: <159777235703.24785.10482285356223108247.b4-ty@kernel.org>
Cc: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>, Kai Vehmanen <kai.vehmanen@linux.intel.com>, Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org, Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>, Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
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

On Tue, 18 Aug 2020 22:36:32 +0800, Brent Lu wrote:
> Add a binary mixer 'ELD' to each HDMI PCM device so user-space can
> read the ELD data of external HDMI display.
> 
> If same PCM is connected to multiple receivers, the mixer returns the
> ELD data for the first one found in the port list and ignore the rest.
> Thie behavior seems iffy but is aligned with the user-space interface
> exposed by patch_hdmi.c. Also the pcm-to-many routing is nor really
> supported by the driver now.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: hdac_hdmi: support 'ELD' mixer
      commit: 1f53bcb3fc952b55a0ad0e7f6eabfc93a170659d

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
