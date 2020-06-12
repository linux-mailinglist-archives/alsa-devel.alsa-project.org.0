Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 582981F793B
	for <lists+alsa-devel@lfdr.de>; Fri, 12 Jun 2020 16:00:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BE5041680;
	Fri, 12 Jun 2020 16:00:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BE5041680
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1591970452;
	bh=7lLROIKj308gj2dNhR1qP0gVcCU/EHvwMTDRiLNOYnI=;
	h=Date:From:To:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=AiAzzO8dMefiGz6ffiFbYmZr3kL9zEfobrLMgkX9ahK38HdmcHsC4OiILiJkfBgHS
	 A1lJj0L3eRXZ966Rs3TKxL1D8wdc+OV+8bs5Klv6Hg9ULqWivcYzzrPVworp7Zd+aS
	 8EX3yhDAYZXIimCdbniuaDjjnPBJ4xgPXJmXbCNA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9A481F80058;
	Fri, 12 Jun 2020 15:59:11 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 836DFF80058; Fri, 12 Jun 2020 15:59:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D87A4F80058
 for <alsa-devel@alsa-project.org>; Fri, 12 Jun 2020 15:59:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D87A4F80058
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Z9ioPCMu"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id B6AA9206A4;
 Fri, 12 Jun 2020 13:59:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1591970343;
 bh=7lLROIKj308gj2dNhR1qP0gVcCU/EHvwMTDRiLNOYnI=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=Z9ioPCMuDYl8KiWosYw3x0x+Vd03QskUIPH0bfkOcra/fTIx585gVcevB/XFbO9/H
 c9zURyT4/PlsW9+HY39b2xaPbA7BXwGWsd+BaoScDLcyVhqGtdhEgo2uOm9XDO9XaX
 7A2xgcZPQwYdp9m0/Ban4Q9tL1YmtesLKFgpIZ4o=
Date: Fri, 12 Jun 2020 14:59:01 +0100
From: Mark Brown <broonie@kernel.org>
To: nicoleotsuka@gmail.com, Shengjiu Wang <shengjiu.wang@nxp.com>,
 timur@kernel.org, tiwai@suse.com, festevam@gmail.com, lars@metafoo.de,
 Xiubo.Lee@gmail.com, alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 perex@perex.cz, lgirdwood@gmail.com, linuxppc-dev@lists.ozlabs.org
In-Reply-To: <cover.1591947428.git.shengjiu.wang@nxp.com>
References: <cover.1591947428.git.shengjiu.wang@nxp.com>
Subject: Re: [RFC PATCH v3 0/4] Reuse the dma channel if available in Back-End
Message-Id: <159197034097.50978.12090792972224185067.b4-ty@kernel.org>
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

On Fri, 12 Jun 2020 15:37:47 +0800, Shengjiu Wang wrote:
> Reuse the dma channel if available in Back-End
> 
> Shengjiu Wang (4):
>   ASoC: soc-card: export snd_soc_lookup_component_nolocked
>   ASoC: dmaengine_pcm: export soc_component_to_pcm
>   ASoC: fsl_asrc_dma: Reuse the dma channel if available in Back-End
>   ASoC: fsl_asrc_dma: Fix data copying speed issue with EDMA
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/4] ASoC: soc-card: export snd_soc_lookup_component_nolocked
      commit: 6fbea6b6a838f9aa941fe53a3637fd8d8aab1eba
[2/4] ASoC: dmaengine_pcm: export soc_component_to_pcm
      commit: a9a21e1eafc94b79502cab8272b392f7f63ef7bb
[3/4] ASoC: fsl_asrc_dma: Reuse the dma channel if available in Back-End
      commit: 706e2c8811585f42612b6cff218ab3adbe63a4ee
[4/4] ASoC: fsl_asrc_dma: Fix data copying speed issue with EDMA
      commit: b287a6d9723c601dd947f1c27d4cc0192e384a5a

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
