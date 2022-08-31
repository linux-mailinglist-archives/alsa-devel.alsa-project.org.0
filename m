Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BB015A7DB1
	for <lists+alsa-devel@lfdr.de>; Wed, 31 Aug 2022 14:42:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E8F3816C3;
	Wed, 31 Aug 2022 14:41:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E8F3816C3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1661949757;
	bh=7VXQYgpXHFCTbsB76XEzNCO0/kCouomL6yAB9DRolFU=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pYQemmode3A3p7oCtr5HQH4kVdSg0lkdAi9AVRCEyN/G+OVY/WinqGFLkDYx7pi2O
	 eJXcnnGIJKgFXyfHndxZypdy+ocEKaAMT/eEUSlSujHMA9BviXWph77o67GW1dVDkg
	 eUrH9IXKNRFHrebAIdZqhze6eAs8PDI7/2k72Lfs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 921FAF800AA;
	Wed, 31 Aug 2022 14:41:12 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AD3F4F80494; Wed, 31 Aug 2022 14:41:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,MIME_8BIT_HEADER,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0D76DF800AA
 for <alsa-devel@alsa-project.org>; Wed, 31 Aug 2022 14:41:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0D76DF800AA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="gK8ay9jX"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 293DEB82079;
 Wed, 31 Aug 2022 12:41:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80FCCC433D6;
 Wed, 31 Aug 2022 12:40:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1661949660;
 bh=7VXQYgpXHFCTbsB76XEzNCO0/kCouomL6yAB9DRolFU=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=gK8ay9jX2GrmzFfm/INug7cwJ3Vfwp9XYW5uQMddvnKaa8evOjTkpOvFF5Nbp5gfO
 JodIaicNHhSnIUlvXRsizxFvU1ItfcHy36SiEw8hpg/kROAJt1fhfTofN4xmGJ9GOj
 M9Y6dB00tL+fA8ZQTNdbtbVrB0Mt6D+ew1/SJXKlMLkOrPSwakKRD903UTnYG1K0kj
 9eBd+BzSkbbN2uUij4pKzlCXn83dhYGtzeLQejcPbNG/Wt/Rh3VqXVODId6BHkzVjS
 Kcl//nHCkhdAn3tMzvHikW7v7uMUAjafHkiXbt0z43cM/GjaS+f8fHtpnYT9ozAJ1V
 1mr40x6Yte2dg==
From: Mark Brown <broonie@kernel.org>
To: Hector Martin <marcan@marcan.st>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Sven Peter <sven@svenpeter.dev>, Rob Herring <robh+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Liam Girdwood <lgirdwood@gmail.com>, Martin Povišer <povik+lin@cutebit.org>
In-Reply-To: <20220824160715.95779-1-povik+lin@cutebit.org>
References: <20220824160715.95779-1-povik+lin@cutebit.org>
Subject: Re: (subset) [PATCH v3 0/4] ASoC platform driver for Apple MCA
Message-Id: <166194965823.85274.11181035918338902693.b4-ty@kernel.org>
Date: Wed, 31 Aug 2022 13:40:58 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.0-dev-0c1df
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 asahi@lists.linux.dev
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

On Wed, 24 Aug 2022 18:07:11 +0200, Martin Povišer wrote:
> sending what should be the final touches on Apple MCA driver. It most
> likely goes without saying but please do not merge the DT additions
> into the ASoC tree.
> 
> Martin
> 
> Changes since v2:
>  - fix Mark's style nit
>  - order compatibles in schema
>  - redo the DT additions for t8103
>  - remove stray unlock in mca_be_prepare (and rename the locking patch)
> Link: https://lore.kernel.org/asahi/20220819125430.4920-1-povik+lin@cutebit.org/T/#t
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/4] dt-bindings: sound: Add Apple MCA I2S transceiver
      commit: 6ed462d1c1167506479089e655355b3c123fee89
[3/4] ASoC: apple: mca: Start new platform driver
      commit: 3df5d0d972893d3c0df5aead8152fe1ad48ef45c
[4/4] ASoC: apple: mca: Add locking
      commit: 4065f0b25b7b30ba4dd4665deb5305ead1c0db25

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
