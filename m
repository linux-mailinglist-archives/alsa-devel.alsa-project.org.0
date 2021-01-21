Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E7502FF4D3
	for <lists+alsa-devel@lfdr.de>; Thu, 21 Jan 2021 20:43:36 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E56D61936;
	Thu, 21 Jan 2021 20:42:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E56D61936
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1611258216;
	bh=N0U+XWIf0wWuQGetEOr/vLTRMW3Qgr7Tde8oPv8YgWs=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=N0ofaKqLFaYOfu7qp4FUlkQMh1C1bTp7f3zMgc1ug8Ip5/cyqaCUVetuXRiR6Q9Jz
	 cf5PEFOCJVjTv9nZYBEg/qV5o3Ehw/GyRf3gpUosGvZQjpti36DHm4G3O7Aosx6oi6
	 r3xgu5YSHcn+NsjJK3t5s6bLKsb7kDv/1/BAuLAI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9B3CCF804E3;
	Thu, 21 Jan 2021 20:40:28 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B1241F804EB; Thu, 21 Jan 2021 20:40:26 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F14C7F804E3
 for <alsa-devel@alsa-project.org>; Thu, 21 Jan 2021 20:40:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F14C7F804E3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="HTyZQkGK"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 379D123A3A;
 Thu, 21 Jan 2021 19:40:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1611258021;
 bh=N0U+XWIf0wWuQGetEOr/vLTRMW3Qgr7Tde8oPv8YgWs=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=HTyZQkGKeUeDcbyaOAdGK7eVFwCwNaQy/59IRXOBZ1ZdF5yFogOkcItdm3+kIwClc
 Js2NH8GhbnNh+BTTz9Cx8M0IaoTt+z8GZIlizvKQEeqr8a1c6BHLv41jWrwqzubG+4
 qann443jt52H43Ku74iNnja3hmbMBkrlseN4g1inR+i7LisLqspdVtL2O4Z3FcNuGz
 bgvG7rCs6ce6feQIe14IH8Gg8dHFH/I/xgFgBMtpR+TCm2opL3PAeqbgb3YiSMJ2Kj
 YJLWUDh6f+BlTbuSLq2XFG/1ZuxVN+UsXcEYanH3F1HxRd0J0MGqVMlAacyGTV2qbq
 DK7q7bnlpdjMw==
From: Mark Brown <broonie@kernel.org>
To: Stephen Boyd <swboyd@chromium.org>
In-Reply-To: <20210115203329.846824-1-swboyd@chromium.org>
References: <20210115203329.846824-1-swboyd@chromium.org>
Subject: Re: [PATCH] ASoC: qcom: Fix number of HDMI RDMA channels on sc7180
Message-Id: <161125795422.35635.5979635189908672108.b4-ty@kernel.org>
Date: Thu, 21 Jan 2021 19:39:14 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Banajit Goswami <bgoswami@codeaurora.org>,
 Srinivasa Rao <srivasam@codeaurora.org>,
 V Sujith Kumar Reddy <vsujithk@codeaurora.org>, linux-arm-msm@vger.kernel.org,
 Patrick Lai <plai@codeaurora.org>, Liam Girdwood <lgirdwood@gmail.com>,
 linux-kernel@vger.kernel.org,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Cheng-Yi Chiang <cychiang@chromium.org>
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

On Fri, 15 Jan 2021 12:33:29 -0800, Stephen Boyd wrote:
> Suspending/resuming with an HDMI dongle attached leads to crashes from
> an audio regmap.
> 
>  Unable to handle kernel paging request at virtual address ffffffc018068000
>  Mem abort info:
>    ESR = 0x96000047
>    EC = 0x25: DABT (current EL), IL = 32 bits
>    SET = 0, FnV = 0
>    EA = 0, S1PTW = 0
>  Data abort info:
>    ISV = 0, ISS = 0x00000047
>    CM = 0, WnR = 1
>  swapper pgtable: 4k pages, 39-bit VAs, pgdp=0000000081b12000
>  [ffffffc018068000] pgd=0000000275d14003, pud=0000000275d14003, pmd=000000026365d003, pte=0000000000000000
>  Internal error: Oops: 96000047 [#1] PREEMPT SMP
>  Call trace:
>   regmap_mmio_write32le+0x2c/0x40
>   regmap_mmio_write+0x48/0x6c
>   _regmap_bus_reg_write+0x34/0x44
>   _regmap_write+0x100/0x150
>   regcache_default_sync+0xc0/0x138
>   regcache_sync+0x188/0x26c
>   lpass_platform_pcmops_resume+0x48/0x54 [snd_soc_lpass_platform]
>   snd_soc_component_resume+0x28/0x40
>   soc_resume_deferred+0x6c/0x178
>   process_one_work+0x208/0x3c8
>   worker_thread+0x23c/0x3e8
>   kthread+0x144/0x178
>   ret_from_fork+0x10/0x18
>  Code: d503201f d50332bf f94002a8 8b344108 (b9000113)
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: qcom: Fix number of HDMI RDMA channels on sc7180
      commit: 7dfe20ee92f681ab1342015254ddb77a18f40cdb

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
