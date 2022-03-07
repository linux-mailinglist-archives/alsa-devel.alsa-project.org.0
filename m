Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CC3364D089E
	for <lists+alsa-devel@lfdr.de>; Mon,  7 Mar 2022 21:41:26 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 594D01735;
	Mon,  7 Mar 2022 21:40:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 594D01735
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646685686;
	bh=Px4o5lf7HpdJy/XDdxnoU0/Ry91h2ECPFIhoNt683YY=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XkTlFIhmA80Rf4aZHaMHObbxYKnDHHbbjZtwf6dMQFCb7nlkbUVV5NfLU/4F8Jn1E
	 6Ttyw+SA4rwmghkyT6pWUQrud82FNA/fWhfg9LvSZMpYrHfJTMtHs0bOYZxBH/xBKl
	 QLVmWiJPOgutSB6oDt1Ij0Aj9iRPKKqbWzxPmZU0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 64CA3F8051F;
	Mon,  7 Mar 2022 21:39:13 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DF142F80519; Mon,  7 Mar 2022 21:39:11 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0EF14F80271
 for <alsa-devel@alsa-project.org>; Mon,  7 Mar 2022 21:39:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0EF14F80271
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="WTglm/+3"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 149CBB8170D;
 Mon,  7 Mar 2022 20:39:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1124C340EB;
 Mon,  7 Mar 2022 20:39:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1646685544;
 bh=Px4o5lf7HpdJy/XDdxnoU0/Ry91h2ECPFIhoNt683YY=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=WTglm/+3jYSLIN3HYqaX/Ir63rb6CVfHu0+SquOHSM96gwkxl/iWiQin2mr9Q7Zjq
 GgiOSu68CNvaL2zwtdmppKFsquNUTwQeJWT2QISu/Gfja/WPwnbYqOvepS8miD0kSA
 2BxXsexThIlA+8sDP6t5GeUM8RwIkQJmSVLFFjbnED0yv7IFcf8mZrl7O1Vuwy6nOl
 bNN8u2D32PJ0Noa544semPxqmj+Z1yPxvsOyRXNK4oaHC96o85l1R4CZ6FxoPGVjpw
 /VMK0gB7N0bGFs82bP+kBYoiN8kC4xNBAc8fU6VSndYBeYXACZDdbbRPCTY5M43+nW
 EMcoc/lRqSh5w==
From: Mark Brown <broonie@kernel.org>
To: Sascha Hauer <s.hauer@pengutronix.de>, alsa-devel@alsa-project.org
In-Reply-To: <20220302083428.3804687-1-s.hauer@pengutronix.de>
References: <20220302083428.3804687-1-s.hauer@pengutronix.de>
Subject: Re: [PATCH 0/7] ASoC: fsl_sai: Cleanups and 1:1 bclk:mclk ratio
 support
Message-Id: <164668554338.3137316.7799933449362131142.b4-ty@kernel.org>
Date: Mon, 07 Mar 2022 20:39:03 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: Nicolin Chen <nicoleotsuka@gmail.com>, kernel@pengutronix.de,
 Xiubo Li <Xiubo.Lee@gmail.com>
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

On Wed, 2 Mar 2022 09:34:21 +0100, Sascha Hauer wrote:
> This series has some updates for the fsl_sai driver: Some general
> cleanup patches, a bugfix in the ip revision checking and finally
> the mclk setting is made more accurate and support for 1:1 bclk:mclk
> setting is added.
> 
> Ahmad Fatoum (2):
>   ASoC: fsl_sai: simplify register poking in fsl_sai_set_bclk
>   ASoC: fsl_sai: implement 1:1 bclk:mclk ratio support
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/7] ASoC: fsl_sai: Drop unnecessary defines
      commit: bd393e2ecc30bde95fcfab23af8246d1724e25cd
[2/7] ASoC: fsl_sai: simplify irq return value
      commit: cb00b4c18f89aa8ffb847cd033467f0958c025a0
[3/7] ASoC: fsl_sai: simplify register poking in fsl_sai_set_bclk
      commit: 814c9fc46fb987bdb3af093e4818c86e62db4fa5
[4/7] ASoC: fsl_sai: store full version instead of major/minor
      commit: 99c1e74f25d435c1c714b8ee0dceb7ebb7d2f2f1
[5/7] ASoC: fsl_sai: Use better variable names
      commit: c56359f4f2adfb81cf7cbea1e8ef9bfc59dbd4ec
[6/7] ASoC: fsl_sai: use DIV_ROUND_CLOSEST() to calculate divider
      commit: 1d4cbdf7bf2eaa794528250a29aed08f1df7f837
[7/7] ASoC: fsl_sai: implement 1:1 bclk:mclk ratio support
      commit: a50b7926d015c3b8194ab1d7c8aa86db8e4b7700

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
