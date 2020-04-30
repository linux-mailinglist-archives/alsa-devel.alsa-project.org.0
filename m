Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C11EC1BF653
	for <lists+alsa-devel@lfdr.de>; Thu, 30 Apr 2020 13:16:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 332CD168C;
	Thu, 30 Apr 2020 13:15:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 332CD168C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1588245392;
	bh=II0LpP8LYtwM0znscVzxdltbyyXpa1FjNHfRIaR6KLo=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=D9nSZQ7PvfWvZHgkaVj76QDUc1xWuiOcQ7ddSS2la98dAGLEm1Bdtl2BfsafLNKos
	 qfQujW7Kdjo0uxUBnpcYLRGaVMRMcHLqmHiT8oUnPJqOTlVGF+JHUw4yc4HiEKYcDK
	 4XyDvYEoXjH7k112M1AF56AtZfUZkBGRMFBgCWgs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 50645F80123;
	Thu, 30 Apr 2020 13:14:51 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 04AA1F801DB; Thu, 30 Apr 2020 13:14:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C9982F800E5
 for <alsa-devel@alsa-project.org>; Thu, 30 Apr 2020 13:14:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C9982F800E5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="HuaAOGtK"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id E82912076D;
 Thu, 30 Apr 2020 11:14:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1588245279;
 bh=II0LpP8LYtwM0znscVzxdltbyyXpa1FjNHfRIaR6KLo=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=HuaAOGtKcX8V628RxxiH3HxbVIeCa2COTXcza5mkgLkCdXDRiV9fdWDgniV8dH2yv
 Lvz7RZQZhBhsEQO6JKFi6PcGO8lP7rj8voFIoonMoqlrDun9MAAXEQJdcDaD21qbey
 Vt2Xmq8Fo3LF8KiPvCnPlxs/10mkDW6AfPMSHu7A=
Date: Thu, 30 Apr 2020 12:14:36 +0100
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
In-Reply-To: <20200427162953.21107-1-ranjani.sridharan@linux.intel.com>
References: <20200427162953.21107-1-ranjani.sridharan@linux.intel.com>
Subject: Re: [PATCH] ASoC: Intel: broadwell: Fix oops during module removal
Message-Id: <158824527683.22336.7315911008650322110.b4-ty@kernel.org>
Cc: tiwai@suse.de, pierre-louis.bossart@linux.intel.com
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

On Mon, 27 Apr 2020 09:29:53 -0700, Ranjani Sridharan wrote:
> When removing the SOF module, the RT286 jack detect
> handler will oops if jack detection is not disabled.
> Disable the jack in the machine driver remove callback
> to prevent this. This fix is only for SOF support and is
> not needed for earlier versions.
> 
> Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
> Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.7

Thanks!

[1/1] ASoC: Intel: broadwell: Fix oops during module removal
      commit: 8382f2949a0def8e9519603b77b3c26f81a66576

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
