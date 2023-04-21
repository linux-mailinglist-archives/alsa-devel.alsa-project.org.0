Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E6E556EAF15
	for <lists+alsa-devel@lfdr.de>; Fri, 21 Apr 2023 18:29:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DD6C2E92;
	Fri, 21 Apr 2023 18:28:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DD6C2E92
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1682094565;
	bh=RDh3ibkeEX9WJ3z8uDInIzSMLKeBvSvB1PdmOxrb/V8=;
	h=From:To:In-Reply-To:References:Subject:Date:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Q5UFq7tDgHTht7ygRDBkaWPjvrLiSiNklwWOZjBeZlGsVh8VAynvJjJ7JxD8z0mev
	 FqnmRmmbw+/nYYWK4lNIDKGN02muiG3C86U+lO1KWD1uiLddAdTtUidiTPBCT1HeWh
	 oaw3fE0JKkyItW3++7hhMirjGEEaDWXJx5/dl4Wg=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 38D7DF80149;
	Fri, 21 Apr 2023 18:28:35 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A0836F80155; Fri, 21 Apr 2023 18:28:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B50D1F80053
	for <alsa-devel@alsa-project.org>; Fri, 21 Apr 2023 18:28:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B50D1F80053
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=FwAJUAzq
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 0507A61B50;
	Fri, 21 Apr 2023 16:28:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ACE7AC433D2;
	Fri, 21 Apr 2023 16:28:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1682094500;
	bh=RDh3ibkeEX9WJ3z8uDInIzSMLKeBvSvB1PdmOxrb/V8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=FwAJUAzqLT3ASqkQCbFq1BdisobUvmulkuc6yiRaxQsxh8irOjfyE2lC4GqQWa2Ms
	 /Eg0c9tigR/ClDuM9ztwe4M7Jfnjfocq0H1B2eR6Ok2UDDEIleBez5ImZKgU35BCYu
	 8g9JBxHG4qyeD16usNiH+E4fIZsvrgcvLiCrX6UNkQl69putp08us87sOgaAktsy/9
	 u45XuiQa2SHwvG63tMKBXelAO60LLDTAKfjU4jKboBbAjkbwSXFSRuS+D05WBsynaA
	 u/9kdI+h+2vIHv/WbRRLfAGmny4FJj+nzTgl7tfZ8RmmvfYD/KpLLJFWaF/EZB03kb
	 dKtiLznud87jg==
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87cz3yf631.wl-kuninori.morimoto.gx@renesas.com>
References: <87cz3yf631.wl-kuninori.morimoto.gx@renesas.com>
Subject: Re: [RFC][PATCH 0/4] ASoC: fsl: cleanup platform
Message-Id: <168209449839.112331.12194273139778105613.b4-ty@kernel.org>
Date: Fri, 21 Apr 2023 17:28:18 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-00e42
Message-ID-Hash: JA77IUMGQE3PNVVLGQZEAOIMDBUVWW3R
X-Message-ID-Hash: JA77IUMGQE3PNVVLGQZEAOIMDBUVWW3R
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Shengjiu Wang <shengjiu.wang@gmail.com>, Xiubo Li <Xiubo.Lee@gmail.com>,
 Fabio Estevam <festevam@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 alsa-devel@alsa-project.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JA77IUMGQE3PNVVLGQZEAOIMDBUVWW3R/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, 21 Apr 2023 00:10:32 +0000, Kuninori Morimoto wrote:
> Cc Shengjiu
> 
> The driver which is using soc-generic-dmaengine-pcm is a little bit
> difficult to notice about it, because it prepares own Component,
> but shares same component->dev with CPU Component.
> 
> Some fsl driver is using soc-generic-dmaengine-pcm as Platform Component.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/4] ASoC: fsl: imx-es8328: cleanup platform which is using Generic DMA
      commit: d6e28695dcb6f653c7f2adf38021a5e934a6f416
[2/4] ASoC: fsl: imx-spdif: cleanup platform which is using Generic DMA
      commit: 2324bc107b0b3d2de351f35032dc5093cbb61493
[3/4] ASoC: fsl: imx-audmix: cleanup platform which is using Generic DMA
      commit: 3ce08f85133fc93278801aba3efb4548d3ef3ca0
[4/4] ASoC: fsl: imx-audmix: remove dummy dai_link->platform
      commit: dc801ea8ae37d54706e6f1cef140731ac5981c9c

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

