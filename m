Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 680AB218DD1
	for <lists+alsa-devel@lfdr.de>; Wed,  8 Jul 2020 19:03:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AEABD167B;
	Wed,  8 Jul 2020 19:02:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AEABD167B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594227796;
	bh=XfowqsBrQuXK4VSqYvSvDJQi9sfQuQ4Rl35+ME0f5ZM=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JYFY3uGpfzTVkdJZtZG0gfwRHKooUX/tmj+Gw797cVwKBvsoNL3Spa2YRVut/C8Zm
	 razvxQGI0sXoTS5SviuXXSOBWx2wrGRcvsBTeAx5x7F4PUU5OLN1U59II/R21BBSNY
	 8GRfMyhZpLzJ558yxHSVoyqFyq3MxZF+v7xbNYnU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 282F9F802E0;
	Wed,  8 Jul 2020 19:00:19 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B9307F802E0; Wed,  8 Jul 2020 19:00:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D6204F802DB
 for <alsa-devel@alsa-project.org>; Wed,  8 Jul 2020 19:00:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D6204F802DB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="KBC8aZjV"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 029A9206F6;
 Wed,  8 Jul 2020 17:00:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1594227608;
 bh=XfowqsBrQuXK4VSqYvSvDJQi9sfQuQ4Rl35+ME0f5ZM=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=KBC8aZjV+7lJ+xd+/QmocON1I4TbH6ZjAkMLPnEEleJHT/76bvJOOm6IYpBN0AEsY
 BEGzHReBRisO3R5apiV62qGTqARqmsh2T1G0Akd3yLAvz4Ku0FNWXeOmo/YXNbTbuR
 NQeNU/z45EYRLKGUvPFvSO/j8CpSD0asYBFv6xIU=
Date: Wed, 08 Jul 2020 18:00:03 +0100
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20200707203749.113883-1-pierre-louis.bossart@linux.intel.com>
References: <20200707203749.113883-1-pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH 0/5] ASoC: topology: fix error handling flow
Message-Id: <159422758800.28431.4587731674052739985.b4-ty@kernel.org>
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

On Tue, 7 Jul 2020 15:37:44 -0500, Pierre-Louis Bossart wrote:
> While experimenting and introducing errors in Baytrail topology files
> until I got them right, I encountered multiple kernel oopses and
> memory leaks. This is a first batch to harden the code, but we should
> probably think of a tool to fuzz the topology...
> 
> Pierre-Louis Bossart (5):
>   ASoC: topology: fix kernel oops on route addition error
>   ASoC: topology: fix tlvs in error handling for widget_dmixer
>   ASoC: topology: use break on errors, not continue
>   ASoC: topology: factor kfree(se) in error handling
>   ASoC: topology: add more logs when topology load fails.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/5] ASoC: topology: fix kernel oops on route addition error
      commit: 6f0307df83f2aa6bdf656c2219c89ce96502d20e
[2/5] ASoC: topology: fix tlvs in error handling for widget_dmixer
      commit: 8edac489e7c3fce44208373bb3e7b5835a672c66
[3/5] ASoC: topology: use break on errors, not continue
      commit: 129fc2ba01c8322575173cc97afa324e54a5d4ce
[4/5] ASoC: topology: factor kfree(se) in error handling
      commit: 952bd9377ef61c843236fd3e7cf65076025e26a4
[5/5] ASoC: topology: add more logs when topology load fails.
      commit: 8bf9475fe49fa96eea57724bb04e0931d101bc5a

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
