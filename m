Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B87D568AEE
	for <lists+alsa-devel@lfdr.de>; Wed,  6 Jul 2022 16:10:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7D0D21657;
	Wed,  6 Jul 2022 16:09:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7D0D21657
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657116643;
	bh=ulTlpfjbk/4uoDVcSwnQVB7MKrB8P0kwZfVfx8hedBI=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NEtaE+RD7H3cka7jciGoJQl/93pDEa4Jn/CDjyu1l/AjFxoU32eVwtlGztwEmiWOA
	 eN2k71olsh70x6gHZ93l86GhgdS+v/xyRKH0WcgU6yqIK31UTUfR3AodbdMj5fWeH3
	 bmVFwuOxdLQbZSNzKk0/cQxbgAppkOdYiYfVUwks=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E4D24F804B4;
	Wed,  6 Jul 2022 16:09:42 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F2808F8032B; Wed,  6 Jul 2022 16:09:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8496FF80104
 for <alsa-devel@alsa-project.org>; Wed,  6 Jul 2022 16:09:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8496FF80104
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="nNVyXRtR"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 1408B61E55;
 Wed,  6 Jul 2022 14:09:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84DE0C3411C;
 Wed,  6 Jul 2022 14:09:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1657116574;
 bh=ulTlpfjbk/4uoDVcSwnQVB7MKrB8P0kwZfVfx8hedBI=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=nNVyXRtRCGd4bW5DiB+WK22OcXr3lSBJ6ESdap38p60CBgbpvG3HH709pU7sPreow
 LIaRC1PdYQpLkjsLbui1lx8PQohdLDT6mfjeALZoaWeLNp04aLy8G2BK+wZUSDHCsZ
 87lJQiN7s5D4raN2X8spFcKMkkV1CYeBe3YNC0k0/Onw5uzjYBju8JfYPeYWfbP34F
 J7rHEU2BbsVQfn3rjokMbi32K4MHS+2R6I8Zu2Xf0wZjlB5fK+2TSTIr1pgsipQQO5
 4YS+eVGNWrjJ5Y++6sbFyiInsvnNCpmrexNacMi2wVQPN8vYspW2ZQKEHR8Xvg+WvE
 FlmYol7PBZTUw==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, alsa-devel@alsa-project.org, shengjiu.wang@nxp.com,
 Xiubo.Lee@gmail.com, shengjiu.wang@gmail.com, nicoleotsuka@gmail.com,
 perex@perex.cz, festevam@gmail.com, tiwai@suse.com
In-Reply-To: <1657100575-8261-1-git-send-email-shengjiu.wang@nxp.com>
References: <1657100575-8261-1-git-send-email-shengjiu.wang@nxp.com>
Subject: Re: [PATCH] ASoC: imx-card: Fix DSD/PDM mclk frequency
Message-Id: <165711657225.3718491.10041938555621440041.b4-ty@kernel.org>
Date: Wed, 06 Jul 2022 15:09:32 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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

On Wed, 6 Jul 2022 17:42:55 +0800, Shengjiu Wang wrote:
> The DSD/PDM rate not only DSD64/128/256/512, which are the
> multiple rate of 44.1kHz,  but also support the multiple
> rate of 8kHz, so can't force all mclk frequency to be
> 22579200Hz, need to assign the frequency according to
> rate.
> 
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: imx-card: Fix DSD/PDM mclk frequency
      commit: c0fabd12a8570cb932f13d9388f3d887ad44369b

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
