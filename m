Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C6F97847D0
	for <lists+alsa-devel@lfdr.de>; Tue, 22 Aug 2023 18:36:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A0670850;
	Tue, 22 Aug 2023 18:35:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A0670850
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1692722186;
	bh=FUMYuqBet9OUvjdPDUTOWt+J+EvJZ1s8aB7eIyBzt6s=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Ow0EKL9S9l/C/v6trpBbr54xCwDX/MiS/RBdouJV/qG8gfqxNcBFPMwxjLbUICcWg
	 ln1ffGYWqQHqSB0+VtIomk5PbKisi+94w5u1hHMd4G4GzJLbvkMoUew3jsCVKi5XAe
	 b1c1SvRy1KSsklS768A3PRWUjvMDC5Pon/XmzuB0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1336DF805C6; Tue, 22 Aug 2023 18:33:50 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7ACB2F805BD;
	Tue, 22 Aug 2023 18:33:49 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E7A2BF8057B; Tue, 22 Aug 2023 18:33:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6ED7BF8057A
	for <alsa-devel@alsa-project.org>; Tue, 22 Aug 2023 18:33:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6ED7BF8057A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=OE7zjCab
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 2783165CC1;
	Tue, 22 Aug 2023 16:33:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24B41C433C7;
	Tue, 22 Aug 2023 16:33:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692722014;
	bh=FUMYuqBet9OUvjdPDUTOWt+J+EvJZ1s8aB7eIyBzt6s=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=OE7zjCab8l/kB8Q4ik3yag4XPE2VKJpB2hMoR3jXnrLBOTcOncKnAwM1M2/3A2BzY
	 UHt5r13hiHg2VqtbARQ5EIiZ681Y9jB1a+optlFjEIzYuVStXnvWwmqGaDaMC9U9MQ
	 QHNgD8Kc0N0zv11lkoYpVtGhewgDGqmVgjeyIbDTu1eGRNzMYq7SKsSgNQkSzOBT2P
	 bjwWQo/gDMjFgv+tFkRiVnOfPRQrgxhMmmnI+rqWJJD4qcUnd+TFpxhojqS/NvMF1A
	 s4Ab5X5gGI9u70rqUZIrsk5fFN8BvTCQ6A8eG0mE5WYvHKjrH1eqUDmITHkHUZPgE5
	 4f3yq9dmPMpNA==
From: Mark Brown <broonie@kernel.org>
To: =?utf-8?q?Uwe_Kleine-K=C3=83=C2=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>,
 Takashi Iwai <tiwai@suse.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: alsa-devel@alsa-project.org, Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <87a5ujubj0.wl-kuninori.morimoto.gx@renesas.com>
References: <87a5ujubj0.wl-kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH] ASoC: fsl: merge DAI call back functions into ops
Message-Id: <169272201286.71502.4741664639460188431.b4-ty@kernel.org>
Date: Tue, 22 Aug 2023 17:33:32 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-034f2
Message-ID-Hash: A476Z7TQNIMEYUILPL4VOLX7HV6NYNFE
X-Message-ID-Hash: A476Z7TQNIMEYUILPL4VOLX7HV6NYNFE
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/A476Z7TQNIMEYUILPL4VOLX7HV6NYNFE/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, 22 Aug 2023 01:10:59 +0000, Kuninori Morimoto wrote:
> ALSA SoC merges DAI call backs into .ops.
> This patch merge these into one.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: fsl: merge DAI call back functions into ops
      commit: 220adc0fda6bbc274fff5825e2fd7d3dcd719e5c

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

