Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 73F7427B575
	for <lists+alsa-devel@lfdr.de>; Mon, 28 Sep 2020 21:38:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 16E7B1878;
	Mon, 28 Sep 2020 21:37:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 16E7B1878
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1601321906;
	bh=UQgq/R/rvV1UHO3MgvdAQZgvrq/shbSpegQaL/xvcJA=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WcMMcfrk8lfRdv4S/S0mOdoA8S2J/Xhh0s6/NdSkpvz5fmE8lqC12OjM7XGmW9qOv
	 j0A3jJ58Cf3Q6TKqyxtDLcaE9CFvohz5hKLbPLSJqRqZRAIuyPI1zlBsWhUryNc0fE
	 lB8g5ONFydrQT9ToaDV9hJoIZmlFJMcRA8uSs65Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 91107F802C3;
	Mon, 28 Sep 2020 21:36:00 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 39FEEF8023F; Mon, 28 Sep 2020 21:35:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8ABCBF801ED
 for <alsa-devel@alsa-project.org>; Mon, 28 Sep 2020 21:35:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8ABCBF801ED
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="cXl7/thh"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 09B792080C;
 Mon, 28 Sep 2020 19:35:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1601321749;
 bh=UQgq/R/rvV1UHO3MgvdAQZgvrq/shbSpegQaL/xvcJA=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=cXl7/thhxHT77u2AwqILgPQ1d+exVsro9lK3+ocWeaZsvBL/2UczbeiByYNny2ZIX
 yXsCQbydYPFZRuOwdOo0tZXaD6wfx6ZLrsbL7symgAb+6JJcPeoNYkFt9lx/ANlxOb
 7T95CvKERe6hh+76hiDotGBXisdYW4gOuo24LAcM=
Date: Mon, 28 Sep 2020 20:34:52 +0100
From: Mark Brown <broonie@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <20200926171844.7792-1-srinivas.kandagatla@linaro.org>
References: <20200926171844.7792-1-srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH] ASoC: q6afe-clocks: Fix typo in SPDX Licence
Message-Id: <160132168198.55254.5121932439754252927.b4-ty@kernel.org>
Cc: lukas.bulwahn@gmail.com, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, tiwai@suse.com
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

On Sat, 26 Sep 2020 18:18:44 +0100, Srinivas Kandagatla wrote:
> Looks like there was a major typo in SPDX Licence version,
> Not sure how it was missed.
> This patch is to fix it.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: q6afe-clocks: Fix typo in SPDX Licence
      commit: d56a7ed2d8f93d95de3f3217c8d563233fde858b

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
