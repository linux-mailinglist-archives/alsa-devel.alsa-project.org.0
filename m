Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 197E2708B9B
	for <lists+alsa-devel@lfdr.de>; Fri, 19 May 2023 00:30:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EF3B2200;
	Fri, 19 May 2023 00:29:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EF3B2200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684449039;
	bh=X4217yHyojVpL4UeshSX2E5v3ItNUl3PghDPgbLT3uI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=OVD/pMDgwF0Mx1mJHZFVVeUcnfWA5w9QqiuOpWORH+9WPur1xZ1D9ZhdBFemJstGM
	 SKbVkY7yklHk+X70MmZA3z+FusQOWKYkwtlA8kFB6ZVs1cfYktlrsJTEUkokSxKDSW
	 kTCt7iE7+1Ao5TlYF9QKzc99olJW8D4zQQ9svJrA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5ECF2F80272; Fri, 19 May 2023 00:29:26 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 714A5F8025A;
	Fri, 19 May 2023 00:29:25 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 91F26F802E8; Fri, 19 May 2023 00:29:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id BE046F8016D
	for <alsa-devel@alsa-project.org>; Fri, 19 May 2023 00:29:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BE046F8016D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=GPTFcUQR
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 6D24361599;
	Thu, 18 May 2023 22:29:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0BCCC433D2;
	Thu, 18 May 2023 22:29:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684448951;
	bh=X4217yHyojVpL4UeshSX2E5v3ItNUl3PghDPgbLT3uI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=GPTFcUQRKRhu4NNyZe03+4p5+v16R2dXcU8QNZFtMbzvqYxhbDtzHFjuEnqQHzaRe
	 19rmzAZq0Yw/oZg72KkG00nOFik4XmMK/WoNdEHz2TeksdtEM/OqNehnGNIWFDnIv5
	 ifkJ/s9oDW5kkPrnFrUvZlhB2mYuXKLYrGSdmACE32zRgkkY+ijXzrEZFpRtw8K/t0
	 k8pYtYll5xtPl2pe19R9xhjWJh+xlkt/jSPX4owKgyZPl1rd8hN8LnO1lFMgt93vDp
	 kbjb8wj6ljR3BL7Qs1IpXJW+X7EsjfdqqXGu0bNwUQPa2/dKtf5E8kNrShRDGUzZFJ
	 9SRy5spwM79yA==
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
Message-Id: <168444894844.494451.621381852845902140.b4-ty@kernel.org>
Date: Fri, 19 May 2023 07:29:08 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.13-dev-bfdf5
Message-ID-Hash: P3JQTGXLTRYL2BS2GC7UPYHG3XTTPR65
X-Message-ID-Hash: P3JQTGXLTRYL2BS2GC7UPYHG3XTTPR65
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/P3JQTGXLTRYL2BS2GC7UPYHG3XTTPR65/>
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

[1/7] ASoC: Add Google Chameleon v3 i2s driver
      commit: 702648721db590b3425c31ade294000e18808345
[2/7] ASoC: Add Google Chameleon v3 codec driver
      commit: 61ed303496eb7e18491ee617dec2403f75d5168c
[3/7] ASoC: dt-bindings: Add Google Chameleon v3 i2s device
      commit: 6f2c1e7c2546f9eab0031843fb7346e49ba69102
[4/7] ASoC: dt-bindings: Add Google Chameleon v3 audio codec
      commit: 580bac2a2c6f7d106be6d0ee0f0f310be49368b3

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

