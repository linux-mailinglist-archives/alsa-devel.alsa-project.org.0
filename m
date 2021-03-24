Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BECDA348571
	for <lists+alsa-devel@lfdr.de>; Thu, 25 Mar 2021 00:41:31 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 547AC1672;
	Thu, 25 Mar 2021 00:40:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 547AC1672
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1616629291;
	bh=sE82qgo6DjUJmVvzp7IsDmSwvXE5yvUHIUem2fZuhbE=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fF8dfyZfFR1kV+LSrvI6bWGoS4LD6sJhCMqEW78wyEYfWq24FyZS2ViIrle+aqPbW
	 YdDuWRYVRNXYY26nXYNpAqBX7yCUqBSpdKl7SS4tkqM3PfFzxD7NL3yVsd1mc/3iPM
	 sCkH7383hJMv/FjvUYtesFjV22wclMe+V5vKL8aA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B340AF80156;
	Thu, 25 Mar 2021 00:40:06 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B7C47F801D5; Thu, 25 Mar 2021 00:40:03 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 37D72F80104
 for <alsa-devel@alsa-project.org>; Thu, 25 Mar 2021 00:39:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 37D72F80104
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="VQ+wU+ly"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 88BE461A25;
 Wed, 24 Mar 2021 23:39:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1616629196;
 bh=sE82qgo6DjUJmVvzp7IsDmSwvXE5yvUHIUem2fZuhbE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=VQ+wU+lyP9CR7fqVu3PRXeHIlED38cpAQz38kOSLpgcmSZxOTXq0cAFXPgz82hONa
 1hRlLEgKcO3OMOeNUyCz8IDWRl/gsJ3iznsk0KxBA85nFIj0zfcAYCgSupxKqMOsGq
 V2t7JuobEhiwHPYN1eCaCvzUOsNwJxUku+o7/pWgQteUlwd805X773V2ysioR/i6jO
 5eSwVxEef54bTvJFElMBW84edC49K5OaPq12XZ2oGYedWIij7C8Xir5Q7pZ569onc7
 b8H/aP9aJt/16R52j4p2tPB2/pUBME7ppKZzuImbcROWQanU/wbQlclKOZ7D9aelN9
 rNDuZolLpyEaA==
From: Mark Brown <broonie@kernel.org>
To: Shengjiu Wang <shengjiu.wang@nxp.com>, festevam@gmail.com,
 Xiubo.Lee@gmail.com, timur@kernel.org, nicoleotsuka@gmail.com,
 tiwai@suse.com, perex@perex.cz, alsa-devel@alsa-project.org
Subject: Re: [PATCH 0/6] ASoC: fsl: Don't use devm_regmap_init_mmio_clk
Date: Wed, 24 Mar 2021 23:39:36 +0000
Message-Id: <161662872375.51441.3639448957854720448.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <1616579928-22428-1-git-send-email-shengjiu.wang@nxp.com>
References: <1616579928-22428-1-git-send-email-shengjiu.wang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: Mark Brown <broonie@kernel.org>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
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

On Wed, 24 Mar 2021 17:58:42 +0800, Shengjiu Wang wrote:
> When there is power domain bind with ipg clock,
> 
> The call flow:
> devm_regmap_init_mmio_clk
>     - clk_prepare()
>         - clk_pm_runtime_get()
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/6] ASoC: fsl_esai: Don't use devm_regmap_init_mmio_clk
      commit: 203773e39347922b3923df6094324d430664466e
[2/6] ASoC: fsl_spdif: Don't use devm_regmap_init_mmio_clk
      commit: c2562572467a74fd637d2d22fb773b052512528c
[3/6] ASoC: fsl_asrc: Don't use devm_regmap_init_mmio_clk
      commit: cab04ab5900fea6655f2a49d1f94c37200b63a59
[4/6] ASoC: fsl_easrc: Don't use devm_regmap_init_mmio_clk
      commit: 069b24f22eb9dba2e0886b40ea3feaa98e3f4f9b
[5/6] ASoC: fsl_audmix: Don't use devm_regmap_init_mmio_clk
      commit: 3feaba79d8f701a774815483aa0e7f4edb15c880
[6/6] ASoC: fsl_micfil: Don't use devm_regmap_init_mmio_clk
      commit: b5cf28f7a890f3554ca15a43edbbb86dd1b9663c

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
