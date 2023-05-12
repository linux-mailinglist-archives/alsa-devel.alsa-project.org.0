Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ED2A6FFFA5
	for <lists+alsa-devel@lfdr.de>; Fri, 12 May 2023 06:21:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D30DEDF1;
	Fri, 12 May 2023 06:20:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D30DEDF1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1683865270;
	bh=pOZbnJl8r8gHWfa3pqqiUm1S+B7OMakCGn2d4dZvCoU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ZLgZBqbavWzf0WLYpJI2mOtWzyJjA7gtCdRIwa/sX0Ld9Yz/5k7IQ/+SC1Ecjjwgr
	 RITrC5SeRZHjf78Q3rx2DPwdQnnZr8HxhwiP6jL/QipgRwC1ElzwlfkamqnpEABO3b
	 /QTmuDbiwioHftiPkv1H7wRazftil5YrROcbEGHM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B48CBF80552; Fri, 12 May 2023 06:19:31 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 61536F80552;
	Fri, 12 May 2023 06:19:31 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 16DE8F80534; Fri, 12 May 2023 06:19:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D4AD6F8032D
	for <alsa-devel@alsa-project.org>; Fri, 12 May 2023 06:19:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D4AD6F8032D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=pE24LKm/
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 8E6EB61445;
	Fri, 12 May 2023 04:19:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47BF5C433EF;
	Fri, 12 May 2023 04:19:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1683865161;
	bh=pOZbnJl8r8gHWfa3pqqiUm1S+B7OMakCGn2d4dZvCoU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=pE24LKm/33zgEmXHsp5jR2W1CupiN4PRPoY2nWbhJm8qsSrYjFf4h5CSmbHAuzEcw
	 ta098JtkQMfGRHaiHCy4Fp4GfqnrQ46icDTYeEYWdAsLEi1XuSgfZc7T67tNLfpixD
	 YSKejsY0XiAuynBqGMsKfAP5veBsTZOq5RoTtgR7Cz307iXzxDtBOqhMpX9jnkwhfk
	 Yi/pPpy60eaAHb32jcyjyeZoZNNj7i2B9kNTVZEimZ9GzCbtBpPOMWQrJY0qjkAmPY
	 Hz3xXXfgVgvHMteN9NA+mCnZ/9mjYm9dn2jGBrVb8AY5Nd78iH2Ps0IOooVDeLr4PS
	 4ts9s538/cvnw==
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, lgirdwood@gmail.com,
 =?utf-8?q?Pawe=C5=82_Anikiel?= <pan@semihalf.com>
Cc: perex@perex.cz, tiwai@suse.com, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, dinguyen@kernel.org, lars@metafoo.de,
 nuno.sa@analog.com, upstream@semihalf.com, amstan@chromium.org
In-Reply-To: <20230508113037.137627-1-pan@semihalf.com>
References: <20230508113037.137627-1-pan@semihalf.com>
Subject: Re: (subset) [PATCH v2 0/7] Add Chameleon v3 ASoC audio
Message-Id: <168386515687.352974.4085648718798860469.b4-ty@kernel.org>
Date: Fri, 12 May 2023 13:19:16 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.13-dev-bfdf5
Message-ID-Hash: QUQSQKXXV4O72ZJ7PJGEE4M2Y66OPXK4
X-Message-ID-Hash: QUQSQKXXV4O72ZJ7PJGEE4M2Y66OPXK4
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QUQSQKXXV4O72ZJ7PJGEE4M2Y66OPXK4/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, 08 May 2023 13:30:30 +0200, Paweł Anikiel wrote:
> The Google Chameleon v3 is a device made for testing audio and video
> paths of other devices. This patchset adds support for ASoC audio on
> this device. It has two audio sources: HDMI audio from the it68051 chip
> (RX only), and analog audio from the ssm2603 chip (RX and TX).
> 
> The patchset adds the ASoC platform and codec drivers, as well as some
> changes to the existing ssm2602 codec driver.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[7/7] ASoC: ssm2602: Add workaround for playback distortions
      commit: f63550e2b165208a2f382afcaf5551df9569e1d4

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

