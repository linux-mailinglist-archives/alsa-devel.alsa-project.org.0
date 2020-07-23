Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F3C4F22B785
	for <lists+alsa-devel@lfdr.de>; Thu, 23 Jul 2020 22:21:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 86EA2168C;
	Thu, 23 Jul 2020 22:20:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 86EA2168C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1595535696;
	bh=RbLhyF8VmUxPARdbjTpY75MIQJTxGEkWc+pLG9Iw87s=;
	h=Date:From:To:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mRjpixELPk91K8hbC8mlishJOqQC40UAlOpYv9Co4CI77geMNH7TW+lRPWjie1hPV
	 /VwwgIw8TYPzsR1BizKP0zM/hvA24tREKlHwDP252gGVQpS1ZNCleFqpH4hU5fbi58
	 Rtintr5rdUmAEHQUqrqqBgnYgdU9PnLRef38xQtM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B494FF8011F;
	Thu, 23 Jul 2020 22:19:55 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 70BC7F80212; Thu, 23 Jul 2020 22:19:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B4B76F80090
 for <alsa-devel@alsa-project.org>; Thu, 23 Jul 2020 22:19:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B4B76F80090
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="uo7E/Tfd"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id B035620792;
 Thu, 23 Jul 2020 20:19:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1595535589;
 bh=RbLhyF8VmUxPARdbjTpY75MIQJTxGEkWc+pLG9Iw87s=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=uo7E/Tfd8suvWNQuLxz+Lkd99dI+N0SIg/3w2xsXNTM9hCi97ZChUGKMnTR8aSI55
 b7VGhER6VhwdVlrWVhis6PE1lxQ5MYi6f5Vo4HxTcQHFFC8d2eh0f45+zm+hMLjZPC
 /TtZc6QL7ziUNCG14mISAdJtdae9qvPLheQszmqY=
Date: Thu, 23 Jul 2020 21:19:34 +0100
From: Mark Brown <broonie@kernel.org>
To: LKML <linux-kernel@vger.kernel.org>, Randy Dunlap <rdunlap@infradead.org>,
 moderated for non-subscribers <alsa-devel@alsa-project.org>,
 Peter Ujfalusi <peter.ujfalusi@ti.com>
In-Reply-To: <e74c690c-c7f8-fd42-e461-4f33571df4ef@infradead.org>
References: <e74c690c-c7f8-fd42-e461-4f33571df4ef@infradead.org>
Subject: Re: [PATCH -next] ASoC: ti: fix SND_SOC_J721E_EVM warnings & errors
Message-Id: <159553557414.41908.11173564334335807148.b4-ty@kernel.org>
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

On Mon, 20 Jul 2020 11:32:21 -0700, Randy Dunlap wrote:
> SND_SOC_J721E_EVM should not select SND_SOC_PCM3168A_I2C when I2C
> is not enabled. That causes build errors, so make this driver's
> symbol depend on I2C.
> 
> WARNING: unmet direct dependencies detected for SND_SOC_PCM3168A_I2C
>   Depends on [n]: SOUND [=m] && !UML && SND [=m] && SND_SOC [=m] && I2C [=n]
>   Selected by [m]:
>   - SND_SOC_J721E_EVM [=m] && SOUND [=m] && !UML && SND [=m] && SND_SOC [=m] && (DMA_OMAP [=y] || TI_EDMA [=m] || TI_K3_UDMA [=n] || COMPILE_TEST [=y]) && (ARCH_K3_J721E_SOC [=n] || COMPILE_TEST [=y])
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: ti: fix SND_SOC_J721E_EVM warnings & errors
      commit: 83249952ffab43b82487c1c497f1b49324c602d4

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
