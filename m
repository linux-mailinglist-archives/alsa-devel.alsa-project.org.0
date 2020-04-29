Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D9CD1BE3E0
	for <lists+alsa-devel@lfdr.de>; Wed, 29 Apr 2020 18:30:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C355F1673;
	Wed, 29 Apr 2020 18:29:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C355F1673
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1588177826;
	bh=OiQXZe6hCW138tYAnRswGeoKdLQ6Hw8I5G+iCYDuqSY=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=BB2ZDHcp0JjtnUdsugJNYW+BBDv2HRumditK/5fZSSDwQ4QF8xLI6Kd1JZoRqSv8+
	 fQYccaBtgMEhrJGW6icP6JSz5fvWkoK+kBdAlFUBdupEX3EWpXWcfUwIYPfBOvA+xF
	 DpBcXJSUrc9slzUkJeutaKv2isytbHu+JY0oyP/w=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CDAB2F80292;
	Wed, 29 Apr 2020 18:26:38 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D6A72F8029B; Wed, 29 Apr 2020 18:26:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4D546F80299
 for <alsa-devel@alsa-project.org>; Wed, 29 Apr 2020 18:26:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4D546F80299
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="XNlg6OYI"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 405D12083B;
 Wed, 29 Apr 2020 16:26:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1588177592;
 bh=OiQXZe6hCW138tYAnRswGeoKdLQ6Hw8I5G+iCYDuqSY=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=XNlg6OYIYarsvAQRR1teQRTPiMKRK2f4WIUG3ton2/DuJ1pahK98nRiIBdGX+7ttn
 3b8aVbvslCIEwoVNW3/O7Y+V2L4Yla5Gk1Rm2/ZexSeMggqyXkMuKvDip6ZJlIOHKg
 tJwcEKSNbEdRfOeOg1ixTijn7KIAF2udi1UZgqxk=
Date: Wed, 29 Apr 2020 17:26:30 +0100
From: Mark Brown <broonie@kernel.org>
To: nicoleotsuka@gmail.com, festevam@gmail.com, alsa-devel@alsa-project.org,
 tiwai@suse.com, timur@kernel.org, Xiubo.Lee@gmail.com,
 Shengjiu Wang <shengjiu.wang@nxp.com>, lgirdwood@gmail.com, perex@perex.cz
In-Reply-To: <1587731404-29750-1-git-send-email-shengjiu.wang@nxp.com>
References: <1587731404-29750-1-git-send-email-shengjiu.wang@nxp.com>
Subject: Re: [PATCH] ASoC: fsl_easrc: Check NULL pinter before dereference
Message-Id: <158817756638.27768.6987853594586973570.b4-ty@kernel.org>
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

On Fri, 24 Apr 2020 20:30:04 +0800, Shengjiu Wang wrote:
> The patch 955ac624058f: "ASoC: fsl_easrc: Add EASRC ASoC CPU DAI
> drivers" from Apr 16, 2020, leads to the following Smatch complaint:
> 
> sound/soc/fsl/fsl_easrc.c:1529 fsl_easrc_hw_free()
> warn: variable dereferenced before check 'ctx' (see line 1527)
> 
> sound/soc/fsl/fsl_easrc.c
>   1526          struct fsl_asrc_pair *ctx = runtime->private_data;
>   1527          struct fsl_easrc_ctx_priv *ctx_priv = ctx->private;
>                                                       ^^^^^
> Dereference
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.8

Thanks!

[1/1] ASoC: fsl_easrc: Check for null pointer before dereferencing "ctx" in fsl_easrc_hw_free()
      commit: f3fc1ea011f09156886e8f4beb240ea814f2197a

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
