Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2631A6462F2
	for <lists+alsa-devel@lfdr.de>; Wed,  7 Dec 2022 22:06:06 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AB55C16AE;
	Wed,  7 Dec 2022 22:05:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AB55C16AE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1670447165;
	bh=ySSPPoq/swi2WcD6kgQKifwpywyuBetdwyVhpvcCEuc=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hczqwmFWQK/46qmX9ms0S+IYz/EBREuSJNMvNfTgevbKOKGP9NrvKJskelI+QhZHj
	 a8LJRQi8jMtl3D46edc0vsH5V0hO0aq7psfMk6k0m6gakeOBFJUhtbms3i+azlZQyG
	 c8qZ1TaLfMMdJV9OjQgJkho1Lm6xPKnK9vvqSeGg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3F4CDF800EE;
	Wed,  7 Dec 2022 22:05:08 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 78BF0F80121; Wed,  7 Dec 2022 22:05:07 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 44151F80121
 for <alsa-devel@alsa-project.org>; Wed,  7 Dec 2022 22:05:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 44151F80121
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Co9391eI"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 73ADEB82132;
 Wed,  7 Dec 2022 21:05:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC2AEC433D7;
 Wed,  7 Dec 2022 21:04:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1670447101;
 bh=ySSPPoq/swi2WcD6kgQKifwpywyuBetdwyVhpvcCEuc=;
 h=From:To:In-Reply-To:References:Subject:Date:From;
 b=Co9391eI+6Omj/U8d4PJXsrphkgH8y3rMt+I0NK97CbNqHv4KFHZl87uNJQSaNEhq
 xHeZLN9ZqTSZdHi0KB0OdHHuMckPEoyGhcRVg5enip8RfQTre1pb6rSbS3aT7FWV0f
 qTc4jsuKgXj9o2yeL5+HTttMxjT+rOA9wY/vc9YBUScvxP/0BPbWIeBUplGSNSDIVK
 LXxXuw+NDucRvCWc2FCChHxLOtrMfxZGrxTa1U9tyJ2+kmYqqavjLOoS8Mu0DJxfSL
 h8S7FwrQphAmCWPQ28L/LEMJN7x+2q7SwuhQiSplpiOfzv25cNmU0FBUqDz5b5b6tg
 svAHm2DGZobBQ==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Chancel Liu <chancel.liu@nxp.com>
In-Reply-To: <20221128060950.3540845-1-chancel.liu@nxp.com>
References: <20221128060950.3540845-1-chancel.liu@nxp.com>
Subject: Re: [PATCH] ASoC: soc-pcm.c: Clear DAIs parameters after
 stream_active is updated
Message-Id: <167044709968.572887.4310845274377067555.b4-ty@kernel.org>
Date: Wed, 07 Dec 2022 21:04:59 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.11.0-dev-b77ec
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

On Mon, 28 Nov 2022 14:09:50 +0800, Chancel Liu wrote:
> DAIs parameters should be cleared if there's no active stream. Before,
> we implemented it in soc_pcm_hw_free() by detecting stream_active. If
> the running stream is the last active stream, we're going to clear
> parameters.
> 
> However it will cause DAIs parameters never be cleared if there're
> more than one stream. For example, we have stream1 and stream2 about
> to stop. stream2 executes soc_pcm_hw_free() before stream1 executes
> soc_pcm_close(). At the moment, stream2 should clear DAIs parameters.
> Since stream_active is not yet updated by stream1 in soc_pcm_close(),
> stream2 will not clear DAIs parameters. In result both stream1 and
> stream2 don't clear the parameters.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: soc-pcm.c: Clear DAIs parameters after stream_active is updated
      commit: 1da681e52853f0abfbfff8c69833d31e538ff9c0

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
