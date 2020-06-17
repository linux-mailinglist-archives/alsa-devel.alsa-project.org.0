Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 643BF1FCE74
	for <lists+alsa-devel@lfdr.de>; Wed, 17 Jun 2020 15:32:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7C1AD1679;
	Wed, 17 Jun 2020 15:31:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7C1AD1679
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1592400754;
	bh=yqPhqEFGOGGnf8tKs0A9o2GYo4CEG0qvZht6TK9uQRk=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=a+2adsGrEfshipmS+4IkdqsLg1yRfPKHjfjBLrS0i9qHrhVGEqeCQGRkPp+EQEDNe
	 DgUimFmDay/zyaYK/q7FTfS2GyP4zWrllEv7HYEBv0l5ZGJua1vOhtbW0qrLctVeTZ
	 WwXU/C+kr4OSUhrDRz/u3vdT/wfnnb1mumC0cX1g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3D68AF80162;
	Wed, 17 Jun 2020 15:30:53 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CAD75F801D9; Wed, 17 Jun 2020 15:30:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D104FF80116
 for <alsa-devel@alsa-project.org>; Wed, 17 Jun 2020 15:30:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D104FF80116
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="xScVLiM4"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id F26DD2080D;
 Wed, 17 Jun 2020 13:30:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1592400645;
 bh=yqPhqEFGOGGnf8tKs0A9o2GYo4CEG0qvZht6TK9uQRk=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=xScVLiM4utiA2ijBBxaLGjDzdmBjZPDtyufiTw9HFMGHgIjPQluNDgj2DFGvw+pYo
 N8nxi/imPtpCa7rZp+UhzFPRJ5WLLYGglf8qZBwDPSj1IApRb4QfEm+xJoHTuAnbRT
 MQBOSJFe6KPMaImD7l+tKBDnU2IWxM+KrQ1FgZQE=
Date: Wed, 17 Jun 2020 14:30:43 +0100
From: Mark Brown <broonie@kernel.org>
To: Xiubo.Lee@gmail.com, nicoleotsuka@gmail.com, alsa-devel@alsa-project.org,
 lgirdwood@gmail.com, robh+dt@kernel.org, tiwai@suse.com,
 Shengjiu Wang <shengjiu.wang@nxp.com>, devicetree@vger.kernel.org,
 festevam@gmail.com, timur@kernel.org, perex@perex.cz
In-Reply-To: <feda3bb02296455d43aeebb7575918d9b28e1a3f.1592376770.git.shengjiu.wang@nxp.com>
References: <feda3bb02296455d43aeebb7575918d9b28e1a3f.1592376770.git.shengjiu.wang@nxp.com>
Subject: Re: [PATCH v3 1/2] ASoC: bindings: fsl_spdif: Add new compatible
 string for imx6sx
Message-Id: <159240063808.19287.10407096002593271687.b4-ty@kernel.org>
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

On Wed, 17 Jun 2020 14:58:00 +0800, Shengjiu Wang wrote:
> Add new compatible string "fsl,imx6sx-spdif" in the binding document.
> And add compatible string "fsl,vf610-spdif" which was missed before.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: bindings: fsl_spdif: Add new compatible string for imx6sx
      commit: 632108afda6aa1d380e05f1eaa25463047fd00b3
[2/2] ASoC: fsl_spdif: Add support for imx6sx platform
      commit: f61b9273c347980f570d1f9cecb867a7835c613d

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
