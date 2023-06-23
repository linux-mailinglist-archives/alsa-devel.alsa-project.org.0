Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 18B0873ADF5
	for <lists+alsa-devel@lfdr.de>; Fri, 23 Jun 2023 02:51:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 505FE83E;
	Fri, 23 Jun 2023 02:50:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 505FE83E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1687481490;
	bh=xHVsOvDcJ7TWRYXIiS14k4BVT+QaKFcnlRdo8j+cqz4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=EXUGNDr8MQrQ/KYRB3rIQ22DlVttPmJFgJB6nZgAs22TQeW5fNVypdoQfreemUJr5
	 iTPzOEDK/xv6jftNDdI7vRgcfAZUu+su6jBrBxWQdCV2jrLQFnBaZ1afXxkrXLMoGu
	 AlFD30Jb8HKMCSrSOBIjTKlvfAzhS6JxCxsxah9w=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DCFB4F80558; Fri, 23 Jun 2023 02:49:50 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4BD96F80548;
	Fri, 23 Jun 2023 02:49:50 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 04162F80163; Fri, 23 Jun 2023 02:49:46 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id E08C1F80132
	for <alsa-devel@alsa-project.org>; Fri, 23 Jun 2023 02:49:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E08C1F80132
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=BYvlQ2U1
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 81B1361938;
	Fri, 23 Jun 2023 00:49:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DABB2C433CA;
	Fri, 23 Jun 2023 00:49:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1687481377;
	bh=xHVsOvDcJ7TWRYXIiS14k4BVT+QaKFcnlRdo8j+cqz4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=BYvlQ2U1KcBC3BCorPnk5fQ25INYnUpgWF6OMdaSAxfxy8OgYg1WBDKcEfuoLA5KM
	 6pjRvZIwPJStJ0QKOm4pxlfNLR0YDiA6W5hVYyAlZycBnfLfPn28/oWmvYGjyo9gWU
	 W5wagk9d6ORlWDHrAmVneBseTQFPKZvwSdaHEevmKNZHhVTDTPrIIExvD+D7JUoeCf
	 2zR2uYQwFlm3b+ga/ziszAjgwR7YgAzmTu8MH8NON7CBXHcyHlwkmNayz3Fh+IPJGx
	 yRILcVnKPH90WZgxShkAm+wMKGB/hZ9THN7IZZ8tGDALVfjuRYPOfh+2slo0K+XZSy
	 dI3M3KJ8uSbzA==
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org, Maxim Kochetkov <fido_max@inbox.ru>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Adrien Grassein <adrien.grassein@gmail.com>,
 Corey Minyard <cminyard@mvista.com>,
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Jeremy Kerr <jk@codeconstruct.com.au>,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 Claudiu Beznea <claudiu.beznea@microchip.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 linux-kernel@vger.kernel.org
In-Reply-To: <20230622142038.63388-1-fido_max@inbox.ru>
References: <20230622142038.63388-1-fido_max@inbox.ru>
Subject: Re: [PATCH v2 1/1] ASoC: codecs: max98090: Allow dsp_a mode
Message-Id: <168748137353.337790.13687281921652772654.b4-ty@kernel.org>
Date: Fri, 23 Jun 2023 01:49:33 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-c6835
Message-ID-Hash: ZS4QFE3KUAODL6G4RLTQHQINF3MBYL6Z
X-Message-ID-Hash: ZS4QFE3KUAODL6G4RLTQHQINF3MBYL6Z
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZS4QFE3KUAODL6G4RLTQHQINF3MBYL6Z/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, 22 Jun 2023 17:20:36 +0300, Maxim Kochetkov wrote:
> TDM mode for max98090 is dsp_a compatible with such limitations:
> 1) Up to four timeslots supported.
> 2) Only 16 bits timeslots supported.
> 3) Only 2 active timeslots (L/R) supported.
> 
> We want to setup TDM mode only when dsp_a mode is selected. So move
> M98090_REG_TDM_FORMAT/M98090_REG_TDM_CONTROL registers setup from
> max98090_set_tdm_slot() to the max98090_dai_set_fmt(). Also extend
> max98090_set_tdm_slot() with all TDM limitations check.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: codecs: max98090: Allow dsp_a mode
      commit: fb180283c00b435019bd9500ae027872da9faa3b

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

