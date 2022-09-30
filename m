Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AAAC05F092D
	for <lists+alsa-devel@lfdr.de>; Fri, 30 Sep 2022 12:34:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C55411687;
	Fri, 30 Sep 2022 12:34:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C55411687
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1664534095;
	bh=0X3E+aPWputC4RRQGG3fy3Z4J+gXjer7t+Iz6mKE8MY=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Z45IjAuBeh6DorDXvVTArJp4Mq8XpQf2v0R3acv1g4F8j/WFUBwGaHr9oQPSqM1Xa
	 EEsexGBwvisnFBw6xWXaxkV/9WYV/5K6Z24In9G7H1w1upAxwZl5WEQDF47DEbUmsF
	 J0z8JE7DXNv76CdCJc0+DP9+GE8AQcIeMbhNHFwE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1C386F80155;
	Fri, 30 Sep 2022 12:33:59 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B0323F80153; Fri, 30 Sep 2022 12:33:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,MIME_8BIT_HEADER,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EEDFBF800AA
 for <alsa-devel@alsa-project.org>; Fri, 30 Sep 2022 12:33:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EEDFBF800AA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="miPRh/4E"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id A01466222B;
 Fri, 30 Sep 2022 10:33:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3EA7FC433C1;
 Fri, 30 Sep 2022 10:33:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1664534031;
 bh=0X3E+aPWputC4RRQGG3fy3Z4J+gXjer7t+Iz6mKE8MY=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=miPRh/4Ev5GjJcFQskAKTih6sZnHx5DXHx+D0MB7YLVHLqslzLM4Q2TSezOZJysRF
 syIY9FpaCy3YZeDb93+RJEr2N4shFAWiiHUb2f9oQF0v0AtC4UNwArHot8UBou4Eeu
 E6nWvblbC0jhiPd/E4ko48EuDLij+86NjGXw72a4Qwu2Li5uLmGjxHIi4J9Gp/Sc27
 sJi4qMDTrAUp4En1jTjokMOtNER8DAYPTmD4LLvNWZ2RTT/6QIJJ6c47v3dwOlxg/v
 s4Gbe/PYJ+YzPNpXtlhuS2TD/BG/sx5obqxFMaMPylFkELAh+e8AHHQCtby2BldfdX
 APoRlYJAL4Z4A==
From: Mark Brown <broonie@kernel.org>
To: Nícolas F. R. A. Prado <nfraprado@collabora.com>
In-Reply-To: <20220929205453.1144142-1-nfraprado@collabora.com>
References: <20220929205453.1144142-1-nfraprado@collabora.com>
Subject: Re: [PATCH] ASoC: mediatek: mt8192-mt6359: Set the driver name for
 the card
Message-Id: <166453402795.109056.12992219800008251777.b4-ty@kernel.org>
Date: Fri, 30 Sep 2022 11:33:47 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.0-dev-fc921
Cc: Miaoqian Lin <linmq006@gmail.com>, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Jiaxin Yu <jiaxin.yu@mediatek.com>,
 Tzung-Bi Shih <tzungbi@google.com>, linux-mediatek@lists.infradead.org,
 Akihiko Odaki <akihiko.odaki@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, kernel@collabora.com,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
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

On Thu, 29 Sep 2022 16:54:53 -0400, Nícolas F. R. A. Prado wrote:
> The ASoC core automatically populates the driver name field in the card
> from the card name if left unset. However, since the driver name can be
> at most 16 characters long, wrapping will happen if the card name is
> longer, which is the case for the mt8192-mt6359 driver.
> 
> Explicitly set the driver name for the card in order to avoid said
> wrapping and have a readable driver name exposed to userspace.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: mediatek: mt8192-mt6359: Set the driver name for the card
      commit: 4674284aa74cfc6db0c54c16f9557ed8c3552409

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
