Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B1D72052BE
	for <lists+alsa-devel@lfdr.de>; Tue, 23 Jun 2020 14:42:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 91DE717E7;
	Tue, 23 Jun 2020 14:41:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 91DE717E7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1592916157;
	bh=ElqinQ8jLXlb518VHlHFZai+tOFrbXjuJZhuXR6rshk=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=YteW7us74TjSBmNhuc69oDzc9PTWdvAP5s4AdtXz/gTaMOg1dt1auFvjJkBChNXeS
	 oVAw+/CUPOEAotHb+iJv3QgdYKjrNn2a+2ryGtcuI+xmBx5ipmgqBYcofi9fZBu+dL
	 BelK+4ibPIt+qceaXx2ndNzZY05tsQxFinZKfs4k=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8BEEEF802BC;
	Tue, 23 Jun 2020 14:39:27 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B623DF802A0; Tue, 23 Jun 2020 14:39:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1075EF802A0
 for <alsa-devel@alsa-project.org>; Tue, 23 Jun 2020 14:39:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1075EF802A0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="KHypS/Il"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 3852920771;
 Tue, 23 Jun 2020 12:39:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1592915961;
 bh=ElqinQ8jLXlb518VHlHFZai+tOFrbXjuJZhuXR6rshk=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=KHypS/IlrCvuiRyNEcfy1xg/VqW3ooQRuUifFQVgyQhFh0rxCC1lj6VKErALutBIe
 c+ReURHePpe95Kyc+fwcCrjcsSm7GUVXGVt2PULMxuuHU0A/nMMPvQudpjyOQXgdVe
 4dLq7GeHrW8pd7kWAqSf8SiH1z14O9y0CBUHQWl0=
Date: Tue, 23 Jun 2020 13:39:19 +0100
From: Mark Brown <broonie@kernel.org>
To: perex@perex.cz, alsa-devel@alsa-project.org, tiwai@suse.com,
 Shengjiu Wang <shengjiu.wang@nxp.com>, Xiubo.Lee@gmail.com, festevam@gmail.com,
 timur@kernel.org, nicoleotsuka@gmail.com, lgirdwood@gmail.com
In-Reply-To: <1592816611-16297-1-git-send-email-shengjiu.wang@nxp.com>
References: <1592816611-16297-1-git-send-email-shengjiu.wang@nxp.com>
Subject: Re: [PATCH] ASoC: fsl_easrc: Fix uninitialized scalar variable in
 fsl_easrc_set_ctx_format
Message-Id: <159291594453.44561.6202689479797567993.b4-ty@kernel.org>
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

On Mon, 22 Jun 2020 17:03:31 +0800, Shengjiu Wang wrote:
> The "ret" in fsl_easrc_set_ctx_format is not initialized, then
> the unknown value maybe returned by this function.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: fsl_easrc: Fix uninitialized scalar variable in fsl_easrc_set_ctx_format
      commit: 5748f4eb01a4df7a42024fe8bc7855f05febb7c5

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
