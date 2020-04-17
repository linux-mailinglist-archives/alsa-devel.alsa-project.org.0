Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C3611AE54C
	for <lists+alsa-devel@lfdr.de>; Fri, 17 Apr 2020 20:57:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BE2E41669;
	Fri, 17 Apr 2020 20:56:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BE2E41669
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1587149869;
	bh=chjoPw0QUGIW5xQ9zvKzRGErH9x28BDTGValPKJegBs=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=r2lhT/RmyczTk9h52N845fZSYlNiVPffiVvGjSsRkzwiapKN1IPm84TvApvX1WMyE
	 wt0IQhjjyQPP6HjFocAVJzLa+WRpuuKQCOdt+XMr94S0vk6KE7ZxZWmaLNVYxp+iGA
	 Oyfd3FRIjSL+gTvBeqF4VfDkpJ/4JzA85Ag1se94=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C8118F80229;
	Fri, 17 Apr 2020 20:56:08 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8074DF80245; Fri, 17 Apr 2020 20:56:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 426C7F8012E
 for <alsa-devel@alsa-project.org>; Fri, 17 Apr 2020 20:56:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 426C7F8012E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="w/oKa7SX"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id B18B7206E9;
 Fri, 17 Apr 2020 18:55:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1587149760;
 bh=chjoPw0QUGIW5xQ9zvKzRGErH9x28BDTGValPKJegBs=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=w/oKa7SXrOteaMWQK1FD7GVJAENyCJqO5iqkNsNUuOFx0saAum+QS1S3qZAr7bSmR
 JjsUBuz2CYOjgbPbHGmBwKKS3k6GcmFWtPNh8NBc7A7VTYMJmWdZ3eOToy0nIkgBPb
 3TTGEot36dTzrVIAEVyNK5YJuYXmVFCkBcGQohu4=
Date: Fri, 17 Apr 2020 19:55:57 +0100
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20200417172014.11760-1-pierre-louis.bossart@linux.intel.com>
References: <20200417172014.11760-1-pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH] ASoC: SOF: Intel: add min/max channels for SSP on
 Baytrail/Broadwell
Message-Id: <158714975762.9428.18237000588388245061.b4-ty@kernel.org>
Cc: tiwai@suse.de, Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>
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

On Fri, 17 Apr 2020 12:20:14 -0500, Pierre-Louis Bossart wrote:
> Major regressions were detected by SOF CI on CherryTrail and Broadwell:
> 
> [   25.705750]  SSP2-Codec: ASoC: no backend playback stream
> [   27.923378]  SSP2-Codec: ASoC: no users playback at close - state
> 
> This is root-caused to the introduction of the DAI capability checks
> with snd_soc_dai_stream_valid(). Its use in soc-pcm.c makes it a
> requirement for all DAIs to report at least a non-zero min_channels
> field.
> 
> [...]

Applied, thanks!

[1/1] ASoC: SOF: Intel: add min/max channels for SSP on Baytrail/Broadwell
      commit: 8c05246c0b58cbe80580ea4be05f6d51228af8a9

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
