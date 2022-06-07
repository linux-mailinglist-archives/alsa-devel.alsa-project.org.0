Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A7C753FC58
	for <lists+alsa-devel@lfdr.de>; Tue,  7 Jun 2022 12:52:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BD04E1A44;
	Tue,  7 Jun 2022 12:51:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BD04E1A44
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654599145;
	bh=fUWj1cWqPq80cipRk8uUYphKUiT2JJ/NvVIZffcYwZM=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=IyKENieni4RtTrT1bjYHOh9ivCx3UNmZ5IhpfEnx7x5fkwBlpUOi9zqo/SPYQbl0e
	 d0EAVUKR6JXjmYsZOi80Z3ZLBwkEk8/+HVq03Gw5tON6vd8re988IB4CxRZsUvthqD
	 yLTupBW6bxt1GCjAh3ph9hj9muqO4CirWjftAYAU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B1520F805E3;
	Tue,  7 Jun 2022 12:46:12 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2F0E8F805E6; Tue,  7 Jun 2022 12:46:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C40A9F805DA
 for <alsa-devel@alsa-project.org>; Tue,  7 Jun 2022 12:46:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C40A9F805DA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Wpnhz2pz"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id AF581B81EF8;
 Tue,  7 Jun 2022 10:46:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 69D30C3411F;
 Tue,  7 Jun 2022 10:46:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1654598766;
 bh=fUWj1cWqPq80cipRk8uUYphKUiT2JJ/NvVIZffcYwZM=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=Wpnhz2pzpJAMkkf5hX97XA6VF86Yke8jikzPNFKYIaN8VgFr14KLTDcPWkOe0iTye
 /MgYSYEQfuRf3W9OTW3pSjz67/EJ4eqgb6EXfsdXtlWvx8Smqoy1MV2KU8xWC7HB74
 dEvlI+8Vfkggqa+RQlAEi+Y82WGnEggMfW+GIhaYWWfa9VW48HlLt/Epy2gFvo6r3t
 WYfdVgdZaGv+zxlt36B0qq9gWOxF4DxLkeCH2iim4Y0LqFQYDwo6zs85IA9GfnKnSz
 MfzFeKiZiknqRs1qKqDfpb966yXAFyhMbUsSz/zFhtGI4QPU/NmOGnq3Bvgp1fwRJr
 Qc1XgpxIE8P/Q==
From: Mark Brown <broonie@kernel.org>
To: tiwai@suse.com, Xiubo.Lee@gmail.com, shengjiu.wang@gmail.com,
 perex@perex.cz, zhangqilong3@huawei.com
In-Reply-To: <20220602072024.33236-1-zhangqilong3@huawei.com>
References: <20220602072024.33236-1-zhangqilong3@huawei.com>
Subject: Re: [PATCH V4] ASoC: fsl_xcvr:Fix unbalanced pm_runtime_enable in
 fsl_xcvr_probe
Message-Id: <165459876415.301808.9458096235617694686.b4-ty@kernel.org>
Date: Tue, 07 Jun 2022 11:46:04 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: nicoleotsuka@gmail.com, linuxppc-dev@lists.ozlabs.org,
 alsa-devel@alsa-project.org, festevam@gmail.com, lgirdwood@gmail.com
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

On Thu, 2 Jun 2022 15:20:24 +0800, zhangqilong wrote:
> a) Add missing pm_runtime_disable() when probe error out. It could
> avoid pm_runtime implementation complains when removing and probing
> again the driver.
> b) Add remove for missing pm_runtime_disable().
> 
> Fix:c590fa80b3928 ("ASoC: fsl_xcvr: register platform component before registering cpu dai")
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: fsl_xcvr:Fix unbalanced pm_runtime_enable in fsl_xcvr_probe
      commit: 9c3148dec7d2d40ef727b8789d3e9410ad6d4a1f

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
