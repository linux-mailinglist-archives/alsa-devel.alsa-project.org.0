Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D9AC1FA4AD
	for <lists+alsa-devel@lfdr.de>; Tue, 16 Jun 2020 01:43:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D67EB1681;
	Tue, 16 Jun 2020 01:42:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D67EB1681
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1592264608;
	bh=T0rnuvVjeJSYHDi4W2lrrHlq2P7qYT+X9jNjT15U5JU=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=eH1uK73RoNx0zTyH7/4LOGoyoq56mBDMMPKFykfBdNQUj6q5sgEXUQZ84THsJBH0b
	 TEdIEEww/B8mhkGK7UKaPg6oK29RHDf5VENAjkB0WJpGDlm1e1cUpMQHFilB6PObTs
	 GhHBkF/8mHmLW0uXkUgNdLbKNMLJz3urxUpsW2hM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A1947F802DB;
	Tue, 16 Jun 2020 01:40:21 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id ABBC4F802BE; Tue, 16 Jun 2020 01:40:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 16BE6F802A1
 for <alsa-devel@alsa-project.org>; Tue, 16 Jun 2020 01:40:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 16BE6F802A1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="fpWlWhX2"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id C38F4207D4;
 Mon, 15 Jun 2020 23:40:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1592264410;
 bh=T0rnuvVjeJSYHDi4W2lrrHlq2P7qYT+X9jNjT15U5JU=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=fpWlWhX2WB5QqsGoxkCv14/W3luZTWN65SiYi8Wiym+c+0wiwrStR0Qh0HZPWMIOM
 mOOM/SV21lsQYTBVGd+stxlprTKQZM0ye2o39yep7Xoc3moP+zc523wX1gTRaZukqv
 I5nuUOVE5S7XL5kCF3AJlhODKlHzQLoBnep4nvQ4=
Date: Tue, 16 Jun 2020 00:40:07 +0100
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20200612204050.25901-1-pierre-louis.bossart@linux.intel.com>
References: <20200612204050.25901-1-pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH 0/3] ASoC: improve core dmesg logs and verbosity
Message-Id: <159226439190.27409.8023638721138982918.b4-ty@kernel.org>
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

On Fri, 12 Jun 2020 15:40:47 -0500, Pierre-Louis Bossart wrote:
> Try to both reduce useless verbosity and keep useful error reports.
> 
> Pierre-Louis Bossart (3):
>   ASoC: soc-core: reduce verbosity of BE override message
>   ASoC: soc-pcm: improve error messages in soc_pcm_new()
>   ASoC: soc-pcm/compress: reduce verbosity on mapping ok messages
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/3] ASoC: soc-core: reduce verbosity of BE override message
      commit: 1328948fea693679ab81601aa72a9ed6025f81ea
[2/3] ASoC: soc-pcm: improve error messages in soc_pcm_new()
      commit: 799827a42045e77a34bd4a90ba8bde372ed8058d
[3/3] ASoC: soc-pcm/compress: reduce verbosity on mapping ok messages
      commit: 1d5cd5254f67bc65622f4cac04c25d6e082f21b0

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
