Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 572C5344479
	for <lists+alsa-devel@lfdr.de>; Mon, 22 Mar 2021 14:02:37 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EBA871660;
	Mon, 22 Mar 2021 14:01:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EBA871660
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1616418157;
	bh=I1rM7cd8e3ihOuidStsjXpCvxgU1JeiBWj6CfWBrf9c=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=DnASUjtTy7IhiHAxuvrVXFSbXUG9l/0LPVb6zCIFyQBrKqcY29u2w0DWBWs0qb13X
	 BQT0Jjhnq61qTYCy+5rMJkRtwEFFBgnVfAeegqgYN452Sx7+MyTRIG1oDzdenOAOAp
	 KiUR5HNSQyzisUDg+RHkvvpxJC5HZ2SK3yvMuBX8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 396EBF80246;
	Mon, 22 Mar 2021 14:00:55 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 05D7EF8016B; Mon, 22 Mar 2021 14:00:51 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 36326F80107
 for <alsa-devel@alsa-project.org>; Mon, 22 Mar 2021 14:00:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 36326F80107
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="RFdk6ckm"
Received: by mail.kernel.org (Postfix) with ESMTPSA id E9AC6601FF;
 Mon, 22 Mar 2021 13:00:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1616418041;
 bh=I1rM7cd8e3ihOuidStsjXpCvxgU1JeiBWj6CfWBrf9c=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=RFdk6ckm9eiho+qzdSEVj3R7AXpWUyPH5xzgSXVyLnutLIrf0qAWBmBGGzPx+gTwZ
 je3PB2ZElXSDsJKiViOINfQcTlZSEPfYTW9FdmdbwPb6ceDYXPVMsMayHCJ5DqlE2x
 9eqvzFkZ/7UedCS9HC1SSndw/e/KNW886NoG1msvllmra12pcQusywpjEkSuiKrLWb
 u8Zn3+aDwGiomWJT5m9SZISSiOo2fxR/wWumCfSHn+r6IeVRg31HcSWYKCmSdKnRmI
 NfYXc8MeFDS+HeEDkny1SQEnfWLM7yY521nel4kyjn38Nxp5rXABNm/7MyZfohtL4W
 1m+8ik2SwURSg==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, festevam@gmail.com,
 timur@kernel.org, Shengjiu Wang <shengjiu.wang@nxp.com>,
 linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org,
 Xiubo.Lee@gmail.com, linuxppc-dev@lists.ozlabs.org, nicoleotsuka@gmail.com
Subject: Re: [PATCH] ASoC: fsl_sai: Don't use devm_regmap_init_mmio_clk
Date: Mon, 22 Mar 2021 13:00:30 +0000
Message-Id: <161641797252.25992.12180615467371169455.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <1616141203-13344-1-git-send-email-shengjiu.wang@nxp.com>
References: <1616141203-13344-1-git-send-email-shengjiu.wang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: Mark Brown <broonie@kernel.org>
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

On Fri, 19 Mar 2021 16:06:43 +0800, Shengjiu Wang wrote:
> When there is power domain bind with bus clock,
> 
> The call flow:
> devm_regmap_init_mmio_clk
>    - clk_prepare()
>       - clk_pm_runtime_get()
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: fsl_sai: Don't use devm_regmap_init_mmio_clk
      commit: 2277e7e36b4b8c27eb8d2fb33a20440bc800c2d7

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
