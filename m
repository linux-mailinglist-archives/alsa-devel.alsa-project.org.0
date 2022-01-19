Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F40A493F98
	for <lists+alsa-devel@lfdr.de>; Wed, 19 Jan 2022 19:04:26 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E0D10314A;
	Wed, 19 Jan 2022 19:03:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E0D10314A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1642615466;
	bh=lFbFmk/aY3Awpx6kg8ejVPc7bOfnP/ly0j3vvYiYSLk=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hCA8LHOqGtXizarEN+dtaTE0zMS+MQivJgFMtv2mF8P70nduvGdAdxu26DlpsVHti
	 nVAPvvokQwXhHu0oi3tBqIZhNoJlkL4eQ6uIjKTy3psnuCXdWRZQ6FzjpTs8BG3l0/
	 Ej+wvDdVwFbd1M+mP1Y8SJW+8AxijleXu+q7B15Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9EC85F80245;
	Wed, 19 Jan 2022 19:02:46 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 429A9F801F7; Wed, 19 Jan 2022 19:02:44 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C3E5EF80128
 for <alsa-devel@alsa-project.org>; Wed, 19 Jan 2022 19:02:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C3E5EF80128
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="X13pX4fJ"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 277D161659;
 Wed, 19 Jan 2022 18:02:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0858EC340E1;
 Wed, 19 Jan 2022 18:02:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1642615355;
 bh=lFbFmk/aY3Awpx6kg8ejVPc7bOfnP/ly0j3vvYiYSLk=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=X13pX4fJy3fRJZKI7F7MRVUE9FDrT6nBmOjzxghhUmAx2oa89pVuGluI1ZYQomcy6
 J+u9NeebYvDBhaYmNBCPyWnAjj843aXJvGQIg5lEMex3rGmpPraZKtS0Sx3GixOSWu
 vOFCHvDwIjpsucj9Dm3JF8fyjUVl+U1NJKul284TSlhz9ilYs39lj11XWUJ/f0eAWA
 aoMRjTtdGCjJ1nOQKkTsTFwusUiXG8pCTiSkWRpA4jWRHdLqZ9X43k7TEqlfTQxDbf
 s7aV3RXj48GWZ8ij+1oHhON0CDe042M5476jVs1mtL2ADTwQ7m1iF2hjoGebAbAjNd
 8fitwOsx/LB2w==
From: Mark Brown <broonie@kernel.org>
To: tiwai@suse.com, lgirdwood@gmail.com, Julian Braha <julianbraha@gmail.com>,
 matthias.bgg@gmail.com, tzungbi@google.com, geert+renesas@glider.be,
 perex@perex.cz, trevor.wu@mediatek.com
In-Reply-To: <20220117050324.68371-1-julianbraha@gmail.com>
References: <20220117050324.68371-1-julianbraha@gmail.com>
Subject: Re: [PATCH] ASoC: mediatek: fix unmet dependency on GPIOLIB for
 SND_SOC_DMIC
Message-Id: <164261535273.2816847.12797426159265748718.b4-ty@kernel.org>
Date: Wed, 19 Jan 2022 18:02:32 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: fazilyildiran@gmail.com, alsa-devel@alsa-project.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
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

On Mon, 17 Jan 2022 00:03:24 -0500, Julian Braha wrote:
> When SND_SOC_MT8195_MT6359_RT1011_RT5682 is selected,
> and GPIOLIB is not selected,
> Kbuild gives the following warning:
> 
> WARNING: unmet direct dependencies detected for SND_SOC_DMIC
>   Depends on [n]: SOUND [=y] && !UML && SND [=y] && SND_SOC [=y] && GPIOLIB [=n]
>   Selected by [y]:
>   - SND_SOC_MT8195_MT6359_RT1011_RT5682 [=y] && SOUND [=y] && !UML && SND [=y] && SND_SOC [=y] && I2C [=y] && SND_SOC_MT8195 [=y] && MTK_PMIC_WRAP [=y]
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-linus

Thanks!

[1/1] ASoC: mediatek: fix unmet dependency on GPIOLIB for SND_SOC_DMIC
      commit: 579b2c8f72d974f27d85bbd53846f34675ee3b01

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
