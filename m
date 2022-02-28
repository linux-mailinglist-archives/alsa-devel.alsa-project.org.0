Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A6A094C7896
	for <lists+alsa-devel@lfdr.de>; Mon, 28 Feb 2022 20:16:27 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 07B53186C;
	Mon, 28 Feb 2022 20:15:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 07B53186C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646075787;
	bh=BENzDUFuSBvcaUV+FsBDBCXgBCL1guugHp4dDe7Y+nY=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=vgHY54fX0rrqOfBqFZrMhkLdFaM5iP9akWlFGMxI3BxiQY4xZauj7v4CNFFv03EWI
	 fxRZdSV9LAp0JJiQXU3XCGP73IIRMyt5mFczLNjC1r6LKUzpamtewz204JfsF9ksX1
	 peiO6too6zyJM7CcLAQKrxseLrny1XHBZOIFLXYY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3BE50F80154;
	Mon, 28 Feb 2022 20:15:21 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 08274F800F8; Mon, 28 Feb 2022 20:15:18 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5573FF800F8
 for <alsa-devel@alsa-project.org>; Mon, 28 Feb 2022 20:15:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5573FF800F8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="omTGl6bR"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 7295F6157F;
 Mon, 28 Feb 2022 19:15:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 344A0C340F1;
 Mon, 28 Feb 2022 19:15:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1646075712;
 bh=BENzDUFuSBvcaUV+FsBDBCXgBCL1guugHp4dDe7Y+nY=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=omTGl6bRGyO6QaBw+dJlSPcmQNWN7zzScUHPeeLvdIAFcMskcnPExShrOYKLqLPqb
 c2rOlk5/0WIZTtjo7OZoFDQAlrrmqL+/7SADk9G7TKtTePLh2AKIQowH1YP6+drRSy
 2sIB8kB5kFC3uwdlJORb9cML8TboVRqB9oNyM2TJVdS7VabZ6NLTX5/poM18DmOWYi
 W4GRaH93OVfIceK+6qyWCNFX2LBqQrTRuk334a5YaYvKSsYQPAUfpQxLoPgJc2xG/4
 3GQPTMLk4juc+BMk9HA70/oh7FM145EmTTnBzL01nOHnxfpFlvYBPDRM0Gc/KM7jU0
 ZryMpKNzwp4vA==
From: Mark Brown <broonie@kernel.org>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>
In-Reply-To: <20220222222715.2994339-1-broonie@kernel.org>
References: <20220222222715.2994339-1-broonie@kernel.org>
Subject: Re: [PATCH] ASoC: es7134: Use modern ASoC DAI format terminology
Message-Id: <164607571189.3538791.9717268518474230567.b4-ty@kernel.org>
Date: Mon, 28 Feb 2022 19:15:11 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org
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

On Tue, 22 Feb 2022 22:27:15 +0000, Mark Brown wrote:
> As part of moving to remove the old style defines for the bus clocks update
> the es7134 driver to use more modern terminology for clocking.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: es7134: Use modern ASoC DAI format terminology
      commit: cce15e481859720a5889453e43ba36edd5154ae1

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
