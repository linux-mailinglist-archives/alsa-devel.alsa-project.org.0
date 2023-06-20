Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 951AD736EA3
	for <lists+alsa-devel@lfdr.de>; Tue, 20 Jun 2023 16:27:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CC910A4B;
	Tue, 20 Jun 2023 16:26:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CC910A4B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1687271234;
	bh=7AACjipcxyYbzzXpVvwcOkRc2c/KPnsVgq3GUJOUrLA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=uq8A/EoaYnQuHODRIEma52lUKSGSr2VP1cWUM3R/WnSVUwKvwnMPY6it8PbBlCUYu
	 mgknam+KI2VoO6oTyZ/QyYOUM12AYzKMzZAVOpB4SxNagSd4x6bto2q4jWQc0tTZ7f
	 aiyI/ORj2F+DfqLzagOVCKODumWNNArJfW1BncrY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AE647F8057D; Tue, 20 Jun 2023 16:25:18 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 41CFAF80578;
	Tue, 20 Jun 2023 16:25:18 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4F869F80548; Tue, 20 Jun 2023 16:25:13 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 0122DF80093
	for <alsa-devel@alsa-project.org>; Tue, 20 Jun 2023 16:25:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0122DF80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=QPy9eoBZ
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id A681361224;
	Tue, 20 Jun 2023 14:25:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83DB1C433C0;
	Tue, 20 Jun 2023 14:25:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1687271105;
	bh=7AACjipcxyYbzzXpVvwcOkRc2c/KPnsVgq3GUJOUrLA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=QPy9eoBZO66EZaZR2ci8J4gHW45TNTHBp9HsPHgB9HofUJ1jyYTKhwZHnam7/ln3n
	 Sqoh5Coqew8lnPY+oWoLR64ejPvwJZ1vRqFbpPvngFdl9QjVpCqO/46+xqhid42Gnp
	 Bt6j6IyiDRqfHOsb/MpBxjLJ520uHyikNDnrukQeAmmBX7x8ErBu7AdgMhfLyalqaG
	 oYguBhzyc2Ej/wrY+F+Ncnu5hU/uy5JZOnQ/QWU4PZoQbCLyHxXtIeP2Lsc0Gz9ByL
	 aHJhK6gPKOHWQPqd1HW2q1ykYhzGxikImMFOzfEXUqg+R+L3GyZ5J7fq3ta/Enbc+b
	 E5y0vlji8J29w==
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org, Maxim Kochetkov <fido_max@inbox.ru>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 linux-kernel@vger.kernel.org
In-Reply-To: <20230613191910.725049-1-fido_max@inbox.ru>
References: <20230613191910.725049-1-fido_max@inbox.ru>
Subject: Re: [PATCH 1/1] ASoC: dwc: add DMA handshake control
Message-Id: <168727110325.80037.2686606919165624157.b4-ty@kernel.org>
Date: Tue, 20 Jun 2023 15:25:03 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-c6835
Message-ID-Hash: 6FGVCVRDWQR4KMOJWJNT3WAACDOQBXOK
X-Message-ID-Hash: 6FGVCVRDWQR4KMOJWJNT3WAACDOQBXOK
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6FGVCVRDWQR4KMOJWJNT3WAACDOQBXOK/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, 13 Jun 2023 22:19:08 +0300, Maxim Kochetkov wrote:
> DMA mode uses hardware handshake signals. DMACR register is used to enable
> the DMA Controller interface operation. So add DMA enable/disable to
> i2s_start()/i2s_stop() functions if using DMA mode.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: dwc: add DMA handshake control
      commit: a42e988b6265dcd489feb1adab8551b40c988f43

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

