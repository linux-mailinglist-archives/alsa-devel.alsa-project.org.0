Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EE6A41FD5B1
	for <lists+alsa-devel@lfdr.de>; Wed, 17 Jun 2020 22:01:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9B318167F;
	Wed, 17 Jun 2020 22:00:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9B318167F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1592424104;
	bh=0uXlbSRspCPJFRXVnzCBg1HTefAtGDy3yvVmM9Op5l8=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=G0ntnwD86Y9mGPbV1R6z4dmMZDG5WbaqNZPAtBMDSP126/+AkfUHZRIfHz3dIYn/i
	 E+yaZmVa1pr8KnAXlYDU6TzuOrT0Dj3z5nY8Xk2F45KVuDYcmsR2aCV3+Uz21ezMfR
	 Go49O+cb/COj5ccP0MbPxlXZ8KjC7kfGSK/zN/5c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8B853F80162;
	Wed, 17 Jun 2020 21:59:19 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EC8D5F8025F; Wed, 17 Jun 2020 21:59:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 95ACEF80101
 for <alsa-devel@alsa-project.org>; Wed, 17 Jun 2020 21:59:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 95ACEF80101
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="F9Q6bhUa"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id BBCBA208B8;
 Wed, 17 Jun 2020 19:59:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1592423952;
 bh=0uXlbSRspCPJFRXVnzCBg1HTefAtGDy3yvVmM9Op5l8=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=F9Q6bhUaCrK/TbsAxj8X46Wz1/XwMV5lJhtMmWKgnyG7GJjFnIqNJSbFz1ro2/5CN
 xLRpxbz9w/nZivwtOTC8xN5UpcHzivTF9Tirnb1hcpaT980lh8Je4/TP2GwECegNqG
 B9K+0fc2xZljpL3mhyTQVj1o3iHTkoUjWEobT398=
Date: Wed, 17 Jun 2020 20:59:10 +0100
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20200617164755.18104-1-pierre-louis.bossart@linux.intel.com>
References: <20200617164755.18104-1-pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH 0/3] ASoC: SOF: Intel: update PCI IDs
Message-Id: <159242394494.17586.13999952220582052008.b4-ty@kernel.org>
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

On Wed, 17 Jun 2020 11:47:52 -0500, Pierre-Louis Bossart wrote:
> Clean-up CometLake and add missing PCI IDs. Changes for the legacy
> driver are sent separately.
> 
> Pierre-Louis Bossart (3):
>   ASoC: Intel: SOF: merge COMETLAKE_LP and COMETLAKE_H
>   ASoC: SOF: Intel: add PCI ID for CometLake-S
>   ASoC: SOF: Intel: add PCI IDs for ICL-H and TGL-H
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/3] ASoC: Intel: SOF: merge COMETLAKE_LP and COMETLAKE_H
      commit: 4228668eb936357657046b486207b167caea5175
[2/3] ASoC: SOF: Intel: add PCI ID for CometLake-S
      commit: 258fb4f4c34a0db9d3834aba6784d7b322176bb9
[3/3] ASoC: SOF: Intel: add PCI IDs for ICL-H and TGL-H
      commit: c8d2e2bfaeffa0f914330e8b4e45b986c8d30b58

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
