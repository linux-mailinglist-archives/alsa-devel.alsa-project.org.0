Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 658285A3FD4
	for <lists+alsa-devel@lfdr.de>; Sun, 28 Aug 2022 23:05:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F3722AE9;
	Sun, 28 Aug 2022 23:04:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F3722AE9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1661720728;
	bh=dvr+0FsOsHb/g/YQGPJX8tDGZzGNU6WJ7c4FEWevhk4=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RDjoh+KIQalIePeJHv7YWEONrGXlRL1JLNLj0SL3aGdccbdCgF/MIzsFSzoEv9H9X
	 QNrm78goxmVCH+8Vl0DXrncG/dn3rs2XBO9pX1K0/PkU1JNPPPvN4AIpmfFpMK0ZIY
	 feqPxCxwVpx6iXUBNg2MI3Hp0AUe4NNmpGnyUX+c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2EFAAF804D6;
	Sun, 28 Aug 2022 23:04:08 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 485E6F804B3; Sun, 28 Aug 2022 23:04:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D1425F8012A
 for <alsa-devel@alsa-project.org>; Sun, 28 Aug 2022 23:03:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D1425F8012A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="UDXSH6F0"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id DE1E360E9A;
 Sun, 28 Aug 2022 21:03:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 577B6C433D7;
 Sun, 28 Aug 2022 21:03:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1661720633;
 bh=dvr+0FsOsHb/g/YQGPJX8tDGZzGNU6WJ7c4FEWevhk4=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=UDXSH6F0xwcjYkF3/UgiFvOJ/gXimbJUsU2LpRndksy/Cht1hAolAVbiGVF+MCnWl
 VpoxRaG1IrAQHa59C2u2CoGecoinG7ud9FLHhatYQvnf4upIPijUlL6hAWTemPkeKd
 826bWsX1/ScEBHAd+XSYAaVT3umH+Q1gC2IVTUZpY+PrAiDuYMBClXZ9qsmD7AOCQB
 NapkFQGs+tax8oQZleKDTBy+hGALKYbf+H4B8qn8u82pcqY+u2OUzr+2vRE2s9jh2r
 WOUmvX4YYrIeMdbjYoTYpbYZmvJAo6BM4RtRs5mQRsIpfZ/DxuD+pILPk/MOCS2D8a
 Pab0O8wmxubLA==
From: Mark Brown <broonie@kernel.org>
To: perex@perex.cz, lgirdwood@gmail.com, bgoswami@quicinc.com, tiwai@suse.com,
 aidanmacdonald.0x0@gmail.com, srinivas.kandagatla@linaro.org
In-Reply-To: <20220721102558.25457-1-aidanmacdonald.0x0@gmail.com>
References: <20220721102558.25457-1-aidanmacdonald.0x0@gmail.com>
Subject: Re: [PATCH -next 0/2] ASoC: Cleanup deprecated regmap-irq
 functionality
Message-Id: <166172063107.600125.6867338355172165841.b4-ty@kernel.org>
Date: Sun, 28 Aug 2022 22:03:51 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
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

On Thu, 21 Jul 2022 11:25:56 +0100, Aidan MacDonald wrote:
> Update two ASoC codec drivers to remove uses of regmap-irq type
> registers, which have recently been deprecated by the "regmap-irq
> cleanups and refactoring" series in linux-next.
> 
> Link: https://lore.kernel.org/lkml/20220623211420.918875-1-aidanmacdonald.0x0@gmail.com/
> 
> Aidan MacDonald (2):
>   sound: soc: codecs: wcd9335: Convert irq chip to config regs
>   sound: soc: codecs: wcd938x: Remove spurious type_base from irq chip
> 
> [...]

Applied to

   broonie/sound.git for-next

Thanks!

[1/2] sound: soc: codecs: wcd9335: Convert irq chip to config regs
      commit: 255a03bb1bb3b10d1c1ca785c596db84723f59d7
[2/2] sound: soc: codecs: wcd938x: Remove spurious type_base from irq chip
      commit: de3287f177a5666409978a1a0331a33e2842d43b

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
