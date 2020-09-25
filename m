Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D2BFE279285
	for <lists+alsa-devel@lfdr.de>; Fri, 25 Sep 2020 22:45:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6AAC41931;
	Fri, 25 Sep 2020 22:44:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6AAC41931
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1601066740;
	bh=nepMzFSaNIWGuxvkPkhRS9U2GlxbM0iL0eqO6N+HKLo=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=R9V07yxu8pXAA+hx0+w4YWpEc8aew22qTMvvUVi0t/gR7d80/zuaGlZPkD6l4Tj9H
	 MiuzlHLWZQtVmV0jnWwON/12ohuNrVu3ZsU9SluPOYO3d2nJ1aVv7Fq6nYUrSBhHrN
	 KpxRL1CExmK8zLG1Cd4m+gh10mQNg9Bm1eWcnjVc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 56B92F802DB;
	Fri, 25 Sep 2020 22:42:40 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9A52AF80254; Fri, 25 Sep 2020 22:42:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 32C3BF801EC
 for <alsa-devel@alsa-project.org>; Fri, 25 Sep 2020 22:42:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 32C3BF801EC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="pCkDikzI"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0D35B2086A;
 Fri, 25 Sep 2020 20:42:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1601066546;
 bh=nepMzFSaNIWGuxvkPkhRS9U2GlxbM0iL0eqO6N+HKLo=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=pCkDikzIhtdTP4bvGUomx/0wLSWLHpejHeU9wZDVmmVFwi0x5oGbLBVcwGk0iMpVt
 ku0xZbRNup/A5AmlFXRsv1WQeAfr4A6qsYh6qFxXNunPENqlaT+VuoRFcZS/fgwNO8
 /lYvczd0vvSyHDN9i0YSPq6ulBXZbN/sTGkqYtuY=
Date: Fri, 25 Sep 2020 21:41:31 +0100
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, tiwai@suse.com, festevam@gmail.com,
 nicoleotsuka@gmail.com, Xiubo.Lee@gmail.com,
 Shengjiu Wang <shengjiu.wang@nxp.com>, perex@perex.cz,
 alsa-devel@alsa-project.org, timur@kernel.org
In-Reply-To: <1600424760-32071-1-git-send-email-shengjiu.wang@nxp.com>
References: <1600424760-32071-1-git-send-email-shengjiu.wang@nxp.com>
Subject: Re: [PATCH] ASoC: fsl_sai: Instantiate snd_soc_dai_driver
Message-Id: <160106647646.2866.2202767097591123725.b4-ty@kernel.org>
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

On Fri, 18 Sep 2020 18:26:00 +0800, Shengjiu Wang wrote:
> Instantiate snd_soc_dai_driver for independent symmetric control.
> Otherwise the symmetric setting may be overwritten by other
> instance.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: fsl_sai: Instantiate snd_soc_dai_driver
      commit: 22a16145af824f91014d07f8664114859900b9e6

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
