Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 804544D47DE
	for <lists+alsa-devel@lfdr.de>; Thu, 10 Mar 2022 14:15:30 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DA2211913;
	Thu, 10 Mar 2022 14:14:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DA2211913
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646918130;
	bh=2Ijf7mnkC3H3KU2ylXeDHiFTv2e24/Uk6a1zlh5kRPY=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=gjUi9Q7vOXDrkmr0qgTwFCwC4Na6Vj8huSUZ3lTJqwk/65iSuuDAlm4NOnW5mCi+k
	 n0t5JvCLakWAwgVkHHFAtdcNg1k0Q16HLTIviYEdWjbdTPxwpZcUKgcUUOfkAl5QPT
	 uMz2paSt8DVClxIAlLG0DAoXDnFS18BUi/VK4OGA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9F933F80516;
	Thu, 10 Mar 2022 14:13:59 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 04AB2F8016C; Thu, 10 Mar 2022 14:13:57 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D1E1AF800D2
 for <alsa-devel@alsa-project.org>; Thu, 10 Mar 2022 14:13:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D1E1AF800D2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="W5a5GfAx"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 6136761A2B;
 Thu, 10 Mar 2022 13:13:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E865EC340F3;
 Thu, 10 Mar 2022 13:13:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1646918031;
 bh=2Ijf7mnkC3H3KU2ylXeDHiFTv2e24/Uk6a1zlh5kRPY=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=W5a5GfAxUilpGsPS8yY+hkrYHKQPkjoxTrpfjxhl72kvueUSNMuQ0gaapHSZ4ghse
 j32wYoyeRhLegBnEmgZbLNNPOq733ITRasukMHDj/zvYwESBPbqlDgmcmPsiSTP+jy
 2k52aLnRCfRilPvB5XcRmdLaxT28w8eiz8jE6jvysJl8mWnBI0YSi+IAsbPdvSKyF8
 WHgbUbHvF2jlj2lVe2LQRcVNVB5dtgVkt3HL/JVrhG8CO0lESBYn0ncotAZHCRpk0J
 VuzBNMVjFQQUy7O0i7sJA7gFBBZISdtC+LTiidQyG+RywY0L0IoVdWl/3twXqFyanW
 hZMdByCv29iDA==
From: Mark Brown <broonie@kernel.org>
To: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>,
 codrin.ciubotariu@microchip.com
In-Reply-To: <20220310082756.1183-1-jiapeng.chong@linux.alibaba.com>
References: <20220310082756.1183-1-jiapeng.chong@linux.alibaba.com>
Subject: Re: [PATCH v2] ASoC: atmel: mchp-pdmc: Remove unnecessary print
 function dev_err()
Message-Id: <164691802867.2018412.8160055841689752479.b4-ty@kernel.org>
Date: Thu, 10 Mar 2022 13:13:48 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, alexandre.belloni@bootlin.com,
 linux-kernel@vger.kernel.org, tiwai@suse.com,
 Abaci Robot <abaci@linux.alibaba.com>, lgirdwood@gmail.com,
 nicolas.ferre@microchip.com, claudiu.beznea@microchip.com,
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

On Thu, 10 Mar 2022 16:27:56 +0800, Jiapeng Chong wrote:
> The print function dev_err() is redundant because
> platform_get_irq() already prints an error.
> 
> Eliminate the follow coccicheck warning:
> 
> ./sound/soc/atmel/mchp-pdmc.c:991:2-9: line 991 is redundant because
> platform_get_irq() already prints an error.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: atmel: mchp-pdmc: Remove unnecessary print function dev_err()
      commit: 2588a01431a85a9bb8b2eac9023181ddd714a695

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
