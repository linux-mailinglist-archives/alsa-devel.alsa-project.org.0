Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 35D8226E506
	for <lists+alsa-devel@lfdr.de>; Thu, 17 Sep 2020 21:06:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C285816AD;
	Thu, 17 Sep 2020 21:05:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C285816AD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1600369567;
	bh=araJfiJ+kmWz4pIb/SGg02CpwFKtGCvtcajg+qf9GYw=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ZijbEsyAu2twYhJNDLdoYQUAhk5/UqSt5ouU4ah5pOT56ulIPAZHqCxBAypzWzYD4
	 q5A1U3UT6kaUsQ97EVltkzOGrq8ihWUK+XxrXUkLgX9SBo/b/pkUxXO8SlkAY1Fd9t
	 xCa/QzxPqMa42MAyOV1rUnn2Gx0OydmCoOrDgOnw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 913A3F80333;
	Thu, 17 Sep 2020 20:58:49 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 90B0FF80335; Thu, 17 Sep 2020 20:58:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1BC12F80333
 for <alsa-devel@alsa-project.org>; Thu, 17 Sep 2020 20:58:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1BC12F80333
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="zj9ZNv8l"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 104AB206A1;
 Thu, 17 Sep 2020 18:58:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1600369123;
 bh=araJfiJ+kmWz4pIb/SGg02CpwFKtGCvtcajg+qf9GYw=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=zj9ZNv8lweI4Sr+NvvM6UEgFWEf2eI3JkmwiJE4OZg/jTvgS2FNAHLy5LpFpVn0nf
 yYnLR1jtk+posThYcFbTj1St3H2vuDmFQnyTMzWBKd76qH/Gh0+220DfpIRguOPwey
 4KpItyWpzI5Pb75LTx+ZEuYYDqCZQUQiqPgBxWkM=
Date: Thu, 17 Sep 2020 19:57:53 +0100
From: Mark Brown <broonie@kernel.org>
To: tiwai@suse.com, lgirdwood@gmail.com, perex@perex.cz, timur@kernel.org,
 Shengjiu Wang <shengjiu.wang@nxp.com>, Xiubo.Lee@gmail.com, festevam@gmail.com,
 nicoleotsuka@gmail.com, alsa-devel@alsa-project.org
In-Reply-To: <1600323079-5317-1-git-send-email-shengjiu.wang@nxp.com>
References: <1600323079-5317-1-git-send-email-shengjiu.wang@nxp.com>
Subject: Re: [PATCH v2 0/3] ASoC: fsl_sai: update the register list
Message-Id: <160036900933.20113.13971334794679632002.b4-ty@kernel.org>
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
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

On Thu, 17 Sep 2020 14:11:16 +0800, Shengjiu Wang wrote:
> As sai ip is upgraded, so update sai register list.
> 
> Shengjiu Wang (3):
>   ASoC: fsl_sai: Add new added registers and new bit definition
>   ASoC: fsl_sai: Add fsl_sai_check_version function
>   ASoC: fsl_sai: Set MCLK input or output direction
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/3] ASoC: fsl_sai: Add new added registers and new bit definition
      commit: 0b2cbce6898600aae5e87285f1c2000162d59c76
[2/3] ASoC: fsl_sai: Add fsl_sai_check_version function
      commit: 1dc658b13c1c365274b27bfc3c4d4f2955348fb8
[3/3] ASoC: fsl_sai: Set MCLK input or output direction
      commit: a57d4e8730c1a55b2547ff81aef4753b67121cb8

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
