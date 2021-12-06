Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 819C246A3C7
	for <lists+alsa-devel@lfdr.de>; Mon,  6 Dec 2021 19:04:59 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2E23C2342;
	Mon,  6 Dec 2021 19:04:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2E23C2342
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1638813899;
	bh=qOyUKJ/q4tpHts63eyHa7j3yANk+RknprGHSSCDq6dQ=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Sxlkb34J9XD8thK6j2XMchZ3tkDeFLwS5ROfbblYUVQ4SpMsREhxpjFtfdBxKoy8e
	 OCO8ao5PSx8aLEDAT9accxF6CMXg+lJHT4G7rTrt2wMFNzJVrQ0cWAwmZsLD3mGdC3
	 Z5WxkODxsHXzJ/tnRWRojO+a1a18rtRG2caQhl68=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2C847F80535;
	Mon,  6 Dec 2021 19:00:59 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 23EABF80537; Mon,  6 Dec 2021 19:00:58 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B1347F80535
 for <alsa-devel@alsa-project.org>; Mon,  6 Dec 2021 19:00:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B1347F80535
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="AJUiWkk4"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 71600B811E1;
 Mon,  6 Dec 2021 18:00:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B90F3C341C2;
 Mon,  6 Dec 2021 18:00:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1638813652;
 bh=qOyUKJ/q4tpHts63eyHa7j3yANk+RknprGHSSCDq6dQ=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=AJUiWkk4/dvF/Mxl/SYYahxRDSzTN/YisNZjONLfZcJmOuPoUZQXKDhkqL1aJPIS0
 AsT+MJRn9wCUp5sbiXYGPoZNgPYIYNPL+IyRETeM867t4H5PL9X/CDk5n7z4Uk+gVr
 t2Ai+kfM7zjporxfkGjlldR1X2q+DI1kFEvdeXM9sH9JLI3eKfhCpGFAkf/TF8hT96
 ubl+ajkWmBhf5x3Y8NultoU/HuqqqsRKOT4Fyd5f85PMIP8+ad2kY18g71DkaXFN3I
 96xERwQpPWTwRoASaQWUraPK9y5y7EKHMl43Z3caoSEz7hxAUSM2fdwAxXDtdWO+tR
 yr3pybWl7j5Cg==
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org,
 Ariel D'Alessandro <ariel.dalessandro@collabora.com>,
 devicetree@vger.kernel.org
In-Reply-To: <20211203175018.252641-1-ariel.dalessandro@collabora.com>
References: <20211203175018.252641-1-ariel.dalessandro@collabora.com>
Subject: Re: [PATCH 1/1] ASoC: fsl-asoc-card: Add missing Kconfig option for
 tlv320aic31xx
Message-Id: <163881364846.2769299.4416026362989007354.b4-ty@kernel.org>
Date: Mon, 06 Dec 2021 18:00:48 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: kuninori.morimoto.gx@renesas.com, Xiubo.Lee@gmail.com, tony@atomide.com,
 festevam@gmail.com, tiwai@suse.com, lgirdwood@gmail.com,
 nicoleotsuka@gmail.com, robh+dt@kernel.org, bcousson@baylibre.com,
 michael@amarulasolutions.com, shengjiu.wang@gmail.com
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

On Fri, 3 Dec 2021 14:50:17 -0300, Ariel D'Alessandro wrote:
> This is a follow up of patchsets:
> 
>   [RFC patch 0/5] Support BCLK input clock in tlv320aic31xx
>   [PATCH 0/4] fsl-asoc-card: Add optional dt property for setting mclk-id
> 
> Patch "ASoC: fsl-asoc-card: Support fsl,imx-audio-tlv320aic31xx codec"
> in "[RFC patch 0/5] Support BCLK input clock in tlv320aic31xx" missed a
> Kconfig option. Sending incremental patch fix.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: fsl-asoc-card: Add missing Kconfig option for tlv320aic31xx
      commit: b6ce5d85b1425d3a1211f85835ab152c9bf3803a

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
