Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E69DF7E9E23
	for <lists+alsa-devel@lfdr.de>; Mon, 13 Nov 2023 15:07:33 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 50E4184D;
	Mon, 13 Nov 2023 15:06:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 50E4184D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1699884452;
	bh=YQBSCiuVG1G3ja5F8I/phUL/rwuMuLhVTQF0gNoNEp8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=q7yx+SNX7I/YHdEIkQk4XVWMBzMgY8sYnVQQBHny1Iw+mhwXqvYabNVVcl3d84L9/
	 sABCDi+8XmBgNVU68ndqfVq3uGAV9/fUnhRkwUP+/8kAnTk11cNHJMf9CwHOyNfUvp
	 dphAjEcfXZGQTNrKnCs2f9yh9Z1SaU85wB3LXdlc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EB837F8055C; Mon, 13 Nov 2023 15:05:51 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6B87AF80549;
	Mon, 13 Nov 2023 15:05:51 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 28BBAF802E8; Mon, 13 Nov 2023 15:05:47 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2DAC2F80093
	for <alsa-devel@alsa-project.org>; Mon, 13 Nov 2023 15:05:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2DAC2F80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=ZDwjV/Rr
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 1FDC2B80D71;
	Mon, 13 Nov 2023 14:05:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D701CC433C9;
	Mon, 13 Nov 2023 14:05:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699884320;
	bh=YQBSCiuVG1G3ja5F8I/phUL/rwuMuLhVTQF0gNoNEp8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=ZDwjV/RrWNJ96dUNTh5ogzEl26dd/RehrQ05sq1zF0hwrmc9J5uAMOv7hjyO6fAZA
	 veO4b+u8bS3IzIs0ESl0VzX7iLcb69cY2MXRIXlL605zMvumOgby8LvRi2GfRywaZi
	 AaDNWSKvwVtFMLwg0FLEqy59SYXovPTz/lH3hZRtN5p/PgM4Q88SWKwcqziynUZAyH
	 i5rElHjVGoWGihhguQnd9CRpDJ2BhVwYq8ypdogRD8W583wI5Q6zgVXFqd9x2gbcLI
	 PmXHOOuMoJQmfbjSmU1n2k5go6LGhIUcSgeHED17D79UzPMrOdWAFrAlDx5ouKzp2W
	 Ryr+lPOGcZkSQ==
From: Mark Brown <broonie@kernel.org>
To: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Keguang Zhang <keguang.zhang@gmail.com>
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
In-Reply-To: <20231106-sti-uniperf-v1-1-b2d8749cfa2e@gmail.com>
References: <20231106-sti-uniperf-v1-1-b2d8749cfa2e@gmail.com>
Subject: Re: [PATCH] ASoC: sti-uniperf: Use default pcm_config instead
Message-Id: <169988431826.3280890.10728149969647169185.b4-ty@kernel.org>
Date: Mon, 13 Nov 2023 14:05:18 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-0438c
Message-ID-Hash: B2FQ5HQWGROBGDGU3IW3Y2LMQ3BEDZW2
X-Message-ID-Hash: B2FQ5HQWGROBGDGU3IW3Y2LMQ3BEDZW2
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/B2FQ5HQWGROBGDGU3IW3Y2LMQ3BEDZW2/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, 06 Nov 2023 20:51:03 +0800, Keguang Zhang wrote:
> The sti-uniperf pcm_config is the same as the default pcm_config.
> 
> Since commit 43556516fffe ("ASoC: soc-generic-dmaengine-pcm:
> Use default config when none is given"), passing a NULL pointer
> could let this driver use the default config.
> 
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: sti-uniperf: Use default pcm_config instead
      commit: bb341f75a05238ccd35b1ec1eb1849a3955eebb3

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

