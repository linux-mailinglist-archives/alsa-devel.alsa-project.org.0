Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AF21F662912
	for <lists+alsa-devel@lfdr.de>; Mon,  9 Jan 2023 15:52:52 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0E17E5242;
	Mon,  9 Jan 2023 15:52:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0E17E5242
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1673275972;
	bh=B6YlCa7nb1F/jDAT6jqtVJ5U2Yhbs2TLuUZpLLpXN6s=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=iPPUqHMxsJ9cLplSoTEzJZ7sYpSFHNnOa+MaBSQoQtU4InOiyJXmkpMRDO2c2nzLf
	 hXolVobCv2sWZlKLFnhKv00oX5SGcUUmuGu9N3NPgGBYhe1/324BEoOYjLRAppdLnE
	 7od4nLWL/Kho5+WCewc2M9OpG+Zb9YnLdubdQgdo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 04938F803DC;
	Mon,  9 Jan 2023 15:51:53 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4C80FF80425; Mon,  9 Jan 2023 15:51:50 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
 SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0A594F8030F
 for <alsa-devel@alsa-project.org>; Mon,  9 Jan 2023 15:51:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0A594F8030F
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=U90BLoXO
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 46D11B80D40;
 Mon,  9 Jan 2023 14:51:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9730C433D2;
 Mon,  9 Jan 2023 14:51:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1673275906;
 bh=B6YlCa7nb1F/jDAT6jqtVJ5U2Yhbs2TLuUZpLLpXN6s=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=U90BLoXOh2H4SLpPrDmFKhFbJhVyCDK0ATmKvgxqN6tDhGrG1Y1CuKXa3JwTwFr8D
 34+66Bh203fjiHKDwUgqJ3f0iE0uk40Gjz+JTx0pzbtOin0Gj+ufAGSzAsqVE3SX+7
 vhgqpifcjC1isjGul1Owz2DjuLNq19jnbK8ebHKeNzgRZscmRPglDujJ7mq/CnIeeI
 oUgIqhue2bR/+fWptIPSzXE7uulUiAnOUoC5hSOHGzmVC0lucy/M0CC6U73dWts5EF
 4HJh1QXjZmkcxwKd0l74tEePZ0D5uUUK4j8sWyEyK6+owCP9muDl0JSuTnaGuAC02A
 1JrMyDpbV/v1g==
From: Mark Brown <broonie@kernel.org>
To: Stephan Gerhold <stephan@gerhold.net>
In-Reply-To: <20221231115506.82991-1-stephan@gerhold.net>
References: <20221231115506.82991-1-stephan@gerhold.net>
Subject: Re: [PATCH] ASoC: qcom: Fix building APQ8016 machine driver without
 SOUNDWIRE
Message-Id: <167327590447.170440.5367928554725513789.b4-ty@kernel.org>
Date: Mon, 09 Jan 2023 14:51:44 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12-dev-8b3d1
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: alsa-devel@alsa-project.org,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Banajit Goswami <bgoswami@quicinc.com>,
 ~postmarketos/upstreaming@lists.sr.ht
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Sat, 31 Dec 2022 12:55:06 +0100, Stephan Gerhold wrote:
> Older Qualcomm platforms like APQ8016 do not have hardware support for
> SoundWire, so kernel configurations made specifically for those platforms
> will usually not have CONFIG_SOUNDWIRE enabled.
> 
> Unfortunately commit 8d89cf6ff229 ("ASoC: qcom: cleanup and fix
> dependency of QCOM_COMMON") breaks those kernel configurations, because
> SOUNDWIRE is now a required dependency for SND_SOC_QCOM_COMMON (and in
> turn also SND_SOC_APQ8016_SBC). Trying to migrate such a kernel config
> silently disables SND_SOC_APQ8016_SBC and breaks audio functionality.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: qcom: Fix building APQ8016 machine driver without SOUNDWIRE
      commit: 0cbf1ecd8c4801ec7566231491f7ad9cec31098b

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
