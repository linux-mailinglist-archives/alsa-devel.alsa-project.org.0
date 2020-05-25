Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 69CF01E1131
	for <lists+alsa-devel@lfdr.de>; Mon, 25 May 2020 17:01:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1389716B0;
	Mon, 25 May 2020 17:00:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1389716B0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1590418878;
	bh=xv7x59AoctvLsjyArJKKMotK6vJa0TElIvyKjP6jGP4=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=C3SDjkPpP1wlFlrTb3d3obpzi54Lvhn3RIgVM4oLlJ4Tz+7Orx1CUyLpoqFXc3NqY
	 ymSPE0B5w5lDV0cppJMCD0mPI+WlDrNn4NsmmodygPbIT+saM2P/t2HwIpcwxU43lH
	 niHiY0Ngum1xEkyDL3GksQ3MvaI7td/Zf4DILxs8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D75AAF802BE;
	Mon, 25 May 2020 16:57:28 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2239CF802BD; Mon, 25 May 2020 16:57:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8899AF802A9
 for <alsa-devel@alsa-project.org>; Mon, 25 May 2020 16:57:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8899AF802A9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Vt8IWFBM"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 7B3CD20890;
 Mon, 25 May 2020 14:57:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1590418643;
 bh=xv7x59AoctvLsjyArJKKMotK6vJa0TElIvyKjP6jGP4=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=Vt8IWFBMCLjX7YmfudACYHN6YkW0RjJpqgJvENaS7c5aEw29p6ZZk3RbUWC5/sUTM
 W0kL4PGYN3Yfjsa1p+kOX3PLGuw6Berq1xpEYkBhnH32um3c5Js0Xnp3yNsa9NDPw9
 S+yCeM8jYheAPvYy/g539gCH+E2VbaJCsC4CL+GQ=
Date: Mon, 25 May 2020 15:57:20 +0100
From: Mark Brown <broonie@kernel.org>
To: Xiubo.Lee@gmail.com, lgirdwood@gmail.com,
 Tang Bin <tangbin@cmss.chinamobile.com>, festevam@gmail.com, timur@kernel.org,
 perex@perex.cz, nicoleotsuka@gmail.com
In-Reply-To: <20200513111408.11452-1-tangbin@cmss.chinamobile.com>
References: <20200513111408.11452-1-tangbin@cmss.chinamobile.com>
Subject: Re: [PATCH] ASoC: fsl: imx-audmix: Fix unused assignment to variable
 'ret'
Message-Id: <159041861697.1370.3156349238499561936.b4-ty@kernel.org>
Cc: alsa-devel@alsa-project.org, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org,
 Zhang Shengju <zhangshengju@cmss.chinamobile.com>
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

On Wed, 13 May 2020 19:14:08 +0800, Tang Bin wrote:
> Omit unused initialized value, because 'ret' will be assigined
> by the function snd_soc_component_read().

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: fsl: imx-audmix: Fix unused assignment to variable 'ret'
      commit: 085c02d355ac585184ef4f00eb333cd86f6add80

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
