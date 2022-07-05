Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4049D5676E7
	for <lists+alsa-devel@lfdr.de>; Tue,  5 Jul 2022 20:54:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 895B516FD;
	Tue,  5 Jul 2022 20:53:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 895B516FD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657047246;
	bh=yI0MSQYt/2idYq5077oft4Ko3AKuq2lB9fmiQNZBdv0=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LESRJGcucs3ROZukY4OEcUSMq/OwPvsetDnzKwEjhs7nblvNZhjVhwSZWJnY1vTr6
	 cpP7UE3HlL1lYrGKIXdbUv3ZKIwbfyrcNAylUak8Y+dIhxO63bVZEWItwYXTBMZs3U
	 0Ue3OWXWYRzvjOQhJBEisFfDW3sYtwfHxnEVr9UM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 72C83F8052E;
	Tue,  5 Jul 2022 20:52:29 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BA19AF80519; Tue,  5 Jul 2022 20:52:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 204E1F80515
 for <alsa-devel@alsa-project.org>; Tue,  5 Jul 2022 20:52:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 204E1F80515
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="rfzbtF7e"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id E5954B81915;
 Tue,  5 Jul 2022 18:52:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 303C5C341C7;
 Tue,  5 Jul 2022 18:52:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1657047141;
 bh=yI0MSQYt/2idYq5077oft4Ko3AKuq2lB9fmiQNZBdv0=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=rfzbtF7es33J4ZWS3ihPhg0w1qCtpvFpMU/qDwjfwbnzcFn8lTwXPBom3UWuLTSqY
 Gogb/BCK0IvwTzQtNyStAvLafvyeWLg5cF2i6E3RO2WMFcd0gYu5UrGWXB+NWTUtdQ
 rOTPuEIlKtdgM3VdlACvJhmP6CDdR4yS6gspxdvbQ6mYX+/ctTiSJ5v+MlAILbF3Wn
 5ntLlLvx2rWJZ37RW8GIAafECM01nX7vi8JhwklRRNDpkQBKswdKb/8UjjznaeCRqD
 5o+Wnf9+x8R1dpiBxW2n6t2j/Xvngrui2suJ/9b2ZH1KsEiOizC4igzVJeGUs9Xm/q
 XkweOITeQ/hhA==
From: Mark Brown <broonie@kernel.org>
To: amadeuszx.slawinski@linux.intel.com, lukas.bulwahn@gmail.com,
 cezary.rojewski@intel.com, alsa-devel@alsa-project.org
In-Reply-To: <20220705103238.7484-1-lukas.bulwahn@gmail.com>
References: <20220705103238.7484-1-lukas.bulwahn@gmail.com>
Subject: Re: [PATCH] ASoC: Intel: avs: correct config reference for I2S test
 board
Message-Id: <165704713892.1050281.16411314466657755512.b4-ty@kernel.org>
Date: Tue, 05 Jul 2022 19:52:18 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: kai.vehmanen@linux.intel.com, peter.ujfalusi@linux.intel.com,
 kernel-janitors@vger.kernel.org, tiwai@suse.com,
 pierre-louis.bossart@linux.intel.com, liam.r.girdwood@linux.intel.com,
 ranjani.sridharan@linux.intel.com, yung-chuan.liao@linux.intel.com,
 linux-kernel@vger.kernel.org
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

On Tue, 5 Jul 2022 12:32:38 +0200, Lukas Bulwahn wrote:
> Commit e39acc4cfd92 ("ASoC: Intel: avs: Add I2S-test machine board") adds
> the config "SND_SOC_INTEL_AVS_MACH_I2S_TEST", but in the Makefile refers
> to  config "SND_SOC_INTEL_AVS_MACH_i2s_TEST" (notice the uppercase and
> lowercase difference).
> 
> Adjust the Makefile to refer to the actual existing config.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: Intel: avs: correct config reference for I2S test board
      commit: f4ba35b79bd0104f00e8e21e400b980bfaa2f17e

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
