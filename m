Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0147139FBFD
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Jun 2021 18:09:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 697631792;
	Tue,  8 Jun 2021 18:08:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 697631792
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1623168540;
	bh=1HqMT85up1oW7BsV1x894Wk/ligU+lf2igXNAdPf+zo=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=g5+SkJjZHOeJF1/owdboL8l9w2rRZUuuSvMAvmSjXNfep2f8gRKV1sK+nECWXZ7kE
	 kUoJj163w5lW5+3JtTRSS62RljaJfwGp9pL4yEHlsCbEeeHM7meQ/4GjIOh9rqlQzO
	 aE7/QgUEK2/Yb/qb0r54T6VVo5j7GsRerZyM1d5I=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0CA63F801EC;
	Tue,  8 Jun 2021 18:07:20 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CC489F80256; Tue,  8 Jun 2021 18:07:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D8766F80218
 for <alsa-devel@alsa-project.org>; Tue,  8 Jun 2021 18:07:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D8766F80218
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="JEfc7dD1"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5596661278;
 Tue,  8 Jun 2021 16:07:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1623168426;
 bh=1HqMT85up1oW7BsV1x894Wk/ligU+lf2igXNAdPf+zo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=JEfc7dD10fJrJpnJ1ax1qNWhEZeKKzHXiLDCVeIy3Gtu9qozOVOTX4OFUlsGJpaRS
 fLAzwrGjrAH2sGZ8GY5G8dGm0Qp3rEt4xRNsx44+dip+D2Y/ZKhk925pGkSJEb+4PJ
 XWLSmYNSGF71ajFwjY2WLvC8zH7QSoPfOD0gI2Ntf5a3JShXu9fKHAUlUMGN4jTPhv
 MpMX656dFheHucESYjuoIMmpGEkFWMM3orcs6tpIEP2gaxardV9m/Cd/wi6Rmx5HHZ
 DtcWFDgQMWB6/mMEVly3H8tWtCDjRueQqJ+DrdLTryc4tMpydh9Ufj7tJDTkYW54E8
 2PoRZyNJiJDXw==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: Re: (subset) [PATCH 0/9] ASoC: tidyup snd_soc_of_parse_daifmt()
Date: Tue,  8 Jun 2021 17:06:35 +0100
Message-Id: <162316808975.49749.4671185267832421707.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <875yypdxlm.wl-kuninori.morimoto.gx@renesas.com>
References: <875yypdxlm.wl-kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Timur Tabi <timur@kernel.org>, Neil Armstrong <narmstrong@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Kevin Hilman <khilman@baylibre.com>, Shengjiu Wang <shengjiu.wang@gmail.com>,
 Xiubo Li <Xiubo.Lee@gmail.com>, Nicolas Ferre <nicolas.ferre@microchip.com>,
 Nicolin Chen <nicoleotsuka@gmail.com>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Mark Brown <broonie@kernel.org>,
 Codrin Ciubotariu <codrin.ciubotariu@microchip.com>,
 alsa-devel@alsa-project.org, Fabio Estevam <festevam@gmail.com>,
 Sameer Pujar <spujar@nvidia.com>, Jerome Brunet <jbrunet@baylibre.com>
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

On 08 Jun 2021 09:11:17 +0900, Kuninori Morimoto wrote:
> I want to add new audio-graph-card2 sound card driver,
> and this is last part of necessary soc-core cleanup for it.
> 
> Current some drivers are using DT, and Then,
> snd_soc_of_parse_daifmt() parses daifmt, but bitclock/frame provider
> parsing part is one of headache, because we are assuming below both cases.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/9] ASoC: soc-core: don't use discriminatory terms on snd_soc_runtime_get_dai_fmt()
      commit: 640eac4c849d6390f272862ba8db14f28d423670

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
