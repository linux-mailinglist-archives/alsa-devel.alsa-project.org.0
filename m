Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D53386B2A75
	for <lists+alsa-devel@lfdr.de>; Thu,  9 Mar 2023 17:10:54 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8E2C01743;
	Thu,  9 Mar 2023 17:10:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8E2C01743
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678378253;
	bh=Vs5yR73fwenbspC7Hc7MZqjQddF+NqnLXNP8Zyl3t5I=;
	h=From:To:In-Reply-To:References:Subject:Date:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=j5/WAGrvKCUWyYTKeN5APS1yqJuscD5hUOtLUZSC7ovmw3Dg2l5HpOGEjgHXcP+Ad
	 N4UdlC6dyruJcgssNJiL2cOVwTx8uW0lfBblWkE2xF4jhMpR7QY44c0Q4OGxVewLr3
	 RRyCwTtvVW21wj87gt07rhggNmrZGVBPEWcdpwPs=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9DF43F80236;
	Thu,  9 Mar 2023 17:10:02 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AED29F80431; Thu,  9 Mar 2023 17:09:57 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id CE7DEF8007E
	for <alsa-devel@alsa-project.org>; Thu,  9 Mar 2023 17:09:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CE7DEF8007E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=alKJkV+T
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id DF253B81F63;
	Thu,  9 Mar 2023 16:09:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5104C4339B;
	Thu,  9 Mar 2023 16:09:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1678378188;
	bh=Vs5yR73fwenbspC7Hc7MZqjQddF+NqnLXNP8Zyl3t5I=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=alKJkV+TfvLPRdueZ1xcZnxDkXUBPNyJmhNvaOyn3Yko+Z8MknKt40SxrToOw1lmT
	 NMcYCCb/dLiF1ZAZghf5v/Zi+KW1vcCojkX9dmPVsDAmSpeEIdFMzetdk5YTk4WtyZ
	 XPrDwHV5LsZqIZiS30nYkAMsQ3G2/jQPJhpOyyUccduBTRWAKtSkgcHaqgJnIJ2dO+
	 bP42RdWk5zO+VNLw9uU2V5iPJDhjZX5T0qpsDnHuRRE6t110JuPu+wDvuzDehAgCA3
	 tGmCWZax8mMqz8v3XzNOZDrZisMXFA7KegDEBmyWWRGSNYqJyABTqEfWdlvDY9ygFr
	 C7r8+LxONRvxw==
From: Mark Brown <broonie@kernel.org>
To: Li Yang <leoyang.li@nxp.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Qiang Zhao <qiang.zhao@nxp.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Shengjiu Wang <shengjiu.wang@gmail.com>,
 Xiubo Li <Xiubo.Lee@gmail.com>, Fabio Estevam <festevam@gmail.com>,
 Nicolin Chen <nicoleotsuka@gmail.com>,
 Herve Codina <herve.codina@bootlin.com>
In-Reply-To: <20230307141503.159766-1-herve.codina@bootlin.com>
References: <20230307141503.159766-1-herve.codina@bootlin.com>
Subject: Re: [PATCH 0/3] Fix the PowerQUICC audio support using the QMC
Message-Id: <167837818442.37742.7557223272230360155.b4-ty@kernel.org>
Date: Thu, 09 Mar 2023 16:09:44 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-bd1bf
Message-ID-Hash: ONFJQEZOUUWFZRVLWUIZELLJA76BVJAD
X-Message-ID-Hash: ONFJQEZOUUWFZRVLWUIZELLJA76BVJAD
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ONFJQEZOUUWFZRVLWUIZELLJA76BVJAD/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, 07 Mar 2023 15:15:00 +0100, Herve Codina wrote:
> A previous series added the PowerQUICC audio support using the QMC.
> The v6 version of this previous series was applied but some feedbacks
> lead to a v7 version.
> 
> The v6 can be found here:
>  https://lore.kernel.org/linux-kernel/20230217145645.1768659-1-herve.codina@bootlin.com/
> and the v7, here:
>  https://lore.kernel.org/linux-kernel/20230306161754.89146-1-herve.codina@bootlin.com/
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/3] dt-bindings: soc: fsl: cpm_qe: cpm1-scc-qmc: Remove unneeded property
      commit: 33a33005b2db0966c00d4f58dd2a36e5a44217db
[2/3] dt-bindings: soc: fsl: cpm_qe: cpm1-tsa: Remove unneeded property
      commit: 0fb6f518cb46cf8bac7c30c29171050e355cd738
[3/3] soc: fsl: cpm1: qmc: Fix assigned timeslot masks
      commit: f37acbde076d8dbf5e4c694f29760e608fdffe11

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

