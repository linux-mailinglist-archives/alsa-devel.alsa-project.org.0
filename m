Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 55798737843
	for <lists+alsa-devel@lfdr.de>; Wed, 21 Jun 2023 02:35:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 811481F1;
	Wed, 21 Jun 2023 02:34:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 811481F1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1687307735;
	bh=k8xGm2WZP3/cbMKDHI6S5ksO1caQvMhK+da2C1vCkvU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=AEmOuSzVhazHwosor6DetueA92Ig76K7asKLOUlxIi10IY16Uq/yh/RY694HXe7WA
	 pWAwsVZVI9JKCSzI9IGmYmHtyZ63VHFUhRc9uEPLzx0sI6kWt0i6HjZHhickkBxkC1
	 ADtK2/X5pZ+8iGFduuur5ocmM4s/IuEfO5VQmmpA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 60D39F801F5; Wed, 21 Jun 2023 02:34:41 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id ED31BF80163;
	Wed, 21 Jun 2023 02:34:40 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6FE5AF80169; Wed, 21 Jun 2023 02:34:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id BF1F2F80022
	for <alsa-devel@alsa-project.org>; Wed, 21 Jun 2023 02:34:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BF1F2F80022
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=KrrZWeq0
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 85D7661382;
	Wed, 21 Jun 2023 00:34:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9EBDC433C0;
	Wed, 21 Jun 2023 00:34:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1687307663;
	bh=k8xGm2WZP3/cbMKDHI6S5ksO1caQvMhK+da2C1vCkvU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=KrrZWeq0IMLJzLHFFmtInxPMsUN5sUnTFioo4fFPe4QWoMdy4rSYAo2AroF5T95nk
	 1ioCKtSG7Ft5PoEF9Wbqpc1z/HxHuCJlAaXfNf7b22o3jZv6yFl9EA8gmBcPLMch6L
	 DXxyMySgzykL/KSqmSjcdCeqZc2oOHAzwcK15e0EkBNOyvcIr71FBwTPA2ogigyJu6
	 G0DyhLKgENH6riZXqVegfCvx1sPg7S2NaLi2XT+1xbEql38ELAeg0dHnoYHRU8qirr
	 xIntuLA17Vi8AWXJgP+Yz6UBKxeiUyxpy4Ffya2tM7+WdgE3QrgD2TxT41sYPWIX0t
	 +z9+vJrUz/zdQ==
From: Mark Brown <broonie@kernel.org>
To: Banajit Goswami <bgoswami@quicinc.com>,
 Jaroslav Kysela <perex@perex.cz>, Jerome Brunet <jbrunet@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>,
 Shengjiu Wang <shengjiu.wang@gmail.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Stephan Gerhold <stephan@gerhold.net>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>, Takashi Iwai <tiwai@suse.com>,
 Xiubo Li <Xiubo.Lee@gmail.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Fabio Estevam <festevam@gmail.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Nicolin Chen <nicoleotsuka@gmail.com>,
 Shengjiu Wang <shengjiu.wang@nxp.com>, alsa-devel@alsa-project.org
In-Reply-To: <87mt12hp75.wl-kuninori.morimoto.gx@renesas.com>
References: <87mt12hp75.wl-kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH 0/8] add snd_soc_{of_}get_dlc()
Message-Id: <168730765961.219941.16507826098678501702.b4-ty@kernel.org>
Date: Wed, 21 Jun 2023 01:34:19 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-c6835
Message-ID-Hash: VE3FDAN4V4TPPR3QBU7LPCQXEZCZ3GIJ
X-Message-ID-Hash: VE3FDAN4V4TPPR3QBU7LPCQXEZCZ3GIJ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VE3FDAN4V4TPPR3QBU7LPCQXEZCZ3GIJ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, 14 Jun 2023 00:17:50 +0000, Kuninori Morimoto wrote:
> Current soc-core.c has snd_soc_{of_}get_dai_name() to get DAI name
> for dlc (snd_soc_dai_link_component). It gets .dai_name, but we need
> .of_node too. Therefor user need to arrange.
> 
> It will be more useful if it gets both .dai_name and .of_node.
> This patch adds snd_soc_{of_}get_dlc() for it, and convert to use it.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/8] ASoC: soc-core.c: add snd_soc_{of_}get_dlc()
      commit: 05722a0ce6fbd1c603ec0f0ecb5ed839dd561ac7
[2/8] ASoC: soc-core.c: add index on snd_soc_of_get_dai_name()
      commit: 3c8b5861850c734add65233e538d4a8c2dff95d9
[3/8] ASoC: fsl: use snd_soc_{of_}get_dlc()
      commit: aa560f5e796ce63074942251197c7161db2392d3
[4/8] ASoC: qcom: use snd_soc_{of_}get_dlc()
      commit: 6cf881b7f1608fd5625d916380ed57d45c2879e9
[5/8] ASoC: meson: use snd_soc_{of_}get_dlc()
      commit: 2e1dbea1f8a3584399ff15b1f1773dbbb1f0d10f
[6/8] ASoC: samsung: use snd_soc_{of_}get_dlc()
      commit: 50233f28f9a2c06140a7bf539ef569ba1ad58ff6
[7/8] ASoC: soc-core.c: use snd_soc_{of_}get_dlc()
      commit: 14c9b25f632b561be33af99942833a618811ac3d
[8/8] ASoC: simple-card.c: use snd_soc_{of_}get_dlc()
      commit: 0baa2c3abc525c79c21ce64a1722f4034d042ac9

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

