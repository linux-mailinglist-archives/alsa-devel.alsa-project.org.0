Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EBD173ABC4
	for <lists+alsa-devel@lfdr.de>; Thu, 22 Jun 2023 23:44:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ACA7B832;
	Thu, 22 Jun 2023 23:43:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ACA7B832
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1687470263;
	bh=tHxbl8Q9Nrryr9eFui+LGWkE4l3NJ3fvNNBwuk0UpXU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=FKetkO5N7DEQtgSrDHtsZ7ZH0uRsSA45FerlnIomFllznmKmzAHZ0g9xip7FX1hA7
	 ZO6iPSamLrLSVYJ8ko5Rp5qoFVnrr+b2vTtCMHMrwqMsV77nUhu5Q3M6tHemBNzjQY
	 hA0C37TIysaFeftaCciQRqOA6t5poC2lclTgizOw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 27A11F80553; Thu, 22 Jun 2023 23:42:49 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A8862F8051E;
	Thu, 22 Jun 2023 23:42:49 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5D489F80132; Thu, 22 Jun 2023 23:42:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D24C0F80130
	for <alsa-devel@alsa-project.org>; Thu, 22 Jun 2023 23:42:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D24C0F80130
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=KfPO/uU2
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 23AD4618A9;
	Thu, 22 Jun 2023 21:42:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5CD94C433C9;
	Thu, 22 Jun 2023 21:42:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1687470155;
	bh=tHxbl8Q9Nrryr9eFui+LGWkE4l3NJ3fvNNBwuk0UpXU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=KfPO/uU2uRVxQwqMWbAs9fMxBz2yjlEsusXCr6KK1QpRJnEor7nBwtyrWCzIPgxfT
	 j6tVLhgrsBBRWCv4MtQYkV5SX8NCIyMZHE0CmC2QV2uPtrCDaJEkyDrNpwMLIxzKio
	 +L0gNfHgsYvlYt03uBiiwMVnp5ez2mVUVYUTUIgahhSYp3sKJGee9BJAsrwz+CAY2u
	 yO6Z3o/Ns8hAawUCOKflLeGcd0MvW8dO7dG2QsD93Jp0Xw3o0yg1cNR6iE05+VJO//
	 K+syfTtTj1D85AMoDylfXEf6tCii//YBWEQcrSyPdWO5kFks7B6gm3LozXg87iNUcU
	 IOxEh44LBVZZg==
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org, Hui Wang <hui.wang@canonical.com>
Cc: shengjiu.wang@nxp.com
In-Reply-To: <20220616040046.103524-1-hui.wang@canonical.com>
References: <20220616040046.103524-1-hui.wang@canonical.com>
Subject: Re: [PATCH 1/2] ASoC: fsl-asoc-card: add nau8822 support
Message-Id: <168747015398.308583.11306627604621757182.b4-ty@kernel.org>
Date: Thu, 22 Jun 2023 22:42:33 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-c6835
Message-ID-Hash: 53QYVVAPIYW6GAACO4TTNZNUJFHVQVNZ
X-Message-ID-Hash: 53QYVVAPIYW6GAACO4TTNZNUJFHVQVNZ
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/53QYVVAPIYW6GAACO4TTNZNUJFHVQVNZ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, 16 Jun 2022 12:00:45 +0800, Hui Wang wrote:
> This is for an imx6sx EVB which has a nau8822 codec connects to the
> SSI2 interface, so add the nau8822 support in this machine driver.
> 
> Because the codec driver nau8822.c doesn't handle mclk enabling, here
> adding a codec_priv->mclk for nau8822 and similar codecs which need to
> enable the mclk in the machine driver, and enable the mclk in the
> card_late_probe() conditionally.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: fsl-asoc-card: add nau8822 support
      commit: 1075df4bdeb320bbf94a1f6d3761391264eb2c7f
[2/2] ASoC: bindings: fsl-asoc-card: add compatible string for nau8822 codec
      commit: 424a64a2bbc6014c76b9ef6356d38ad8e66d95ad

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

