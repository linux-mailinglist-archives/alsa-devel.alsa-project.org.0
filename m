Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7436E1FA4C5
	for <lists+alsa-devel@lfdr.de>; Tue, 16 Jun 2020 01:49:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1882B15E5;
	Tue, 16 Jun 2020 01:48:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1882B15E5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1592264954;
	bh=VNG0x2ry8DNg0uuOprW2CZEqy4U0NPn9pUHqCmHFaAY=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=q7n9ZjQ8ZpKc2DotajeZu7cQD7aloe5mIgnVFVrPWZvd3ZuFSdiPC6hE8B5SHY5B0
	 LiqghkvhmbOpP3aR3+Ib8Q8Ny8xAhYdkaxZiKMKni1uuUG9vLWM8jtlCIhhvTjOLqC
	 1q/0xAFAsA7uAw1VXZDEApZsyr8scfbuhcc204i0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A51A1F80338;
	Tue, 16 Jun 2020 01:41:07 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6A892F80337; Tue, 16 Jun 2020 01:41:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BE091F80335
 for <alsa-devel@alsa-project.org>; Tue, 16 Jun 2020 01:41:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BE091F80335
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="dIR6A3sE"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id BB929208C7;
 Mon, 15 Jun 2020 23:41:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1592264461;
 bh=VNG0x2ry8DNg0uuOprW2CZEqy4U0NPn9pUHqCmHFaAY=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=dIR6A3sEGPc+ZJizlBLA68Bn/sllJmUGuRuuFj8hMyoLQYDB7lB33qMLYXMEKnHC1
 /BP3Q9l8ms78KGfKFHRX0olTqkQic5T4NMu4yWNVCk7cYZCsHRmT5n2RFHDzoOPXOa
 H1Zn86f1pQ1xtMalF6D7ogFi0Le8chBA+37yRjeM=
Date: Tue, 16 Jun 2020 00:40:59 +0100
From: Mark Brown <broonie@kernel.org>
To: nicoleotsuka@gmail.com, timur@kernel.org, perex@perex.cz,
 lgirdwood@gmail.com, alsa-devel@alsa-project.org, festevam@gmail.com,
 tiwai@suse.com, Shengjiu Wang <shengjiu.wang@nxp.com>, Xiubo.Lee@gmail.com
In-Reply-To: <cover.1591155860.git.shengjiu.wang@nxp.com>
References: <cover.1591155860.git.shengjiu.wang@nxp.com>
Subject: Re: [PATCH 0/3] ASoC: fsl_easrc: Fix several warnings
Message-Id: <159226439189.27409.5606494453578496957.b4-ty@kernel.org>
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

On Wed, 3 Jun 2020 11:39:38 +0800, Shengjiu Wang wrote:
> Fix several warnings with "make W=1"
> 
> Shengjiu Wang (3):
>   ASoC: fsl_easrc: Fix -Wmissing-prototypes warning
>   ASoC: fsl_easrc: Fix -Wunused-but-set-variable
>   ASoC: fsl_easrc: Fix "Function parameter not described" warnings
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/3] ASoC: fsl_easrc: Fix -Wmissing-prototypes warning
      commit: e4cc0aaac390a87f80ae542c75d4c84de08816f9
[2/3] ASoC: fsl_easrc: Fix -Wunused-but-set-variable
      commit: 633a2c7d6e621e748d69423fa85be88c7dcd4f94
[3/3] ASoC: fsl_easrc: Fix "Function parameter not described" warnings
      commit: d73d682a9e87fa494868e8094fcc5b6a6b505464

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
