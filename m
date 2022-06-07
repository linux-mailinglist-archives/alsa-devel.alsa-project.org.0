Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 04F4853FC1A
	for <lists+alsa-devel@lfdr.de>; Tue,  7 Jun 2022 12:50:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 96CB4192F;
	Tue,  7 Jun 2022 12:49:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 96CB4192F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654599010;
	bh=rDaQ/Y3jfWu1H3Cy/83eSHNsodbTFoBuSmzrNWGOWQs=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Ih9/SkSfcwmGgOF2mMclLpgGnrzCb9AhHfiTiiq3bXWzYVny0IyLPQCmMxf6LIDho
	 5YwDinbm9hUzz85HgNS3eu80mKDY+2YOxI2VxrbwbWBBbO2XvoYHBa9cWHZ1DHyY5E
	 hmKGu2NFP1CrKtjCU05CN13e7bDL0qU9e7F4/f80=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EF2E3F805A1;
	Tue,  7 Jun 2022 12:45:58 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 37B34F805A8; Tue,  7 Jun 2022 12:45:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E1ADFF8059F;
 Tue,  7 Jun 2022 12:45:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E1ADFF8059F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="H7zET4PR"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id A9AA16152A;
 Tue,  7 Jun 2022 10:45:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6FCCC34119;
 Tue,  7 Jun 2022 10:45:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1654598752;
 bh=rDaQ/Y3jfWu1H3Cy/83eSHNsodbTFoBuSmzrNWGOWQs=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=H7zET4PR1e8M7DIIGnHwCBPE1qlTjKd1CkGbrfof+gcN/Rb7HqNrEvuEWyejZSHEe
 709jmODZ9Pzwwm5Npm6Ai9bNowqeG5HOcFB6xOOk+rUvr8obvc37+A74GVApGT3fYc
 R4kzmYm7Uf4h9RBk6yRHbpPaM/tqi7DifUCFSj9xs9dh+Kv1SnX/3iS4QVRgTNdSHG
 Rjy3YugAgiUKjnTqIq4/j8m1/DBu20WgYKihoDNEA+CcYVGDKZOyN++Yh8Tw8BHUvi
 etr66Foq4oGkQlIMiQaVTS0f2bpiOmhHbJc6Xp98cLbpe71HlNqS6uJQ48RV9e/eSt
 kJJSryXd+uJCQ==
From: Mark Brown <broonie@kernel.org>
To: amadeuszx.slawinski@linux.intel.com, pierre-louis.bossart@linux.intel.com
In-Reply-To: <20220602135757.3335351-1-amadeuszx.slawinski@linux.intel.com>
References: <20220602135757.3335351-1-amadeuszx.slawinski@linux.intel.com>
Subject: Re: [PATCH] ASoC: SOF: Fix potential NULL pointer dereference
Message-Id: <165459875046.301808.2650890872025754338.b4-ty@kernel.org>
Date: Tue, 07 Jun 2022 11:45:50 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, kai.vehmanen@linux.intel.com,
 Liam Girdwood <lgirdwood@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 ranjani.sridharan@linux.intel.com, daniel.baluta@nxp.com,
 sound-open-firmware@alsa-project.org
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

On Thu, 2 Jun 2022 15:57:57 +0200, Amadeusz Sławiński wrote:
> Cleanup path for sof_prepare_widgets_in_path() should check if unprepare
> callback exists before calling it, instead it checks if it does not
> exist. Fix the check.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: SOF: Fix potential NULL pointer dereference
      commit: 2fe08216fda33bbc1f80133b8fd560ffd094b987

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
