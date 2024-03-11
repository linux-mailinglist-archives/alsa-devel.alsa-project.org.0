Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ED0A878383
	for <lists+alsa-devel@lfdr.de>; Mon, 11 Mar 2024 16:28:11 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 82C2EB70;
	Mon, 11 Mar 2024 16:28:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 82C2EB70
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1710170890;
	bh=z4m2mdAW+4t979hNRetfiN0r2sRlcX+HmjBvZVh9Ceg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=PObEbvxZ0YaM28D9YOz1oYXP/mtDhRdFnIf9QY4EMnCxom7tTTGSQXAEXwuMHE/oP
	 Gc9GsChziY9jRv6Mvw1owbfXq2kmTy2WMWvqLl89zAoKJHXCxdPyeHD61hIngibLxO
	 LYFfa7+LTrtdwQXcYqTenuMeFVyPgndv/qHxNWFY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1A686F804B0; Mon, 11 Mar 2024 16:27:31 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4384FF805A1;
	Mon, 11 Mar 2024 16:27:30 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8FA45F8028D; Mon, 11 Mar 2024 16:27:26 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 17174F8014B
	for <alsa-devel@alsa-project.org>; Mon, 11 Mar 2024 16:27:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 17174F8014B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=LjsU6RgL
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 47B2CCE1129;
	Mon, 11 Mar 2024 15:27:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 536C8C433F1;
	Mon, 11 Mar 2024 15:27:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1710170830;
	bh=z4m2mdAW+4t979hNRetfiN0r2sRlcX+HmjBvZVh9Ceg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=LjsU6RgLyq/y/0t0yeVDVtpFwa67Wl0+iahIdEi0XO6cIY9dHmpqWmiaYay6E60dy
	 UOb9CU3tRlf2qYWbwi4PdzRvb0Eb2etX0/KU1MTnU+W8N2xwBUfkK7jObdWluCh21m
	 03WAZQC7A6Xdtn5sOgPJrTlHhaM/e/Se8dqbrsA7aQSaLapaJ8VLdzUQKyuNIOz3OC
	 HJlNMgHcO4IZJ1h8+61r/BwnSRqyBifkzSMtmjfkGYpaiAAb1EtY9LX+gJTGKLpVCA
	 MckYE8cYx8+gKdRosCFN6VG8DUVZpQlYyeUiL7BD0SmFFwi/Dl306wU7eznYsacTNL
	 ZX3vhHrSW8E0g==
From: Mark Brown <broonie@kernel.org>
To: Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
 Baojun Xu <baojun.xu@ti.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc: alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
 linux-kbuild@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>,
 kernel@pengutronix.de
In-Reply-To: <20240310143852.397212-2-u.kleine-koenig@pengutronix.de>
References: <20240310143852.397212-2-u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH] ASoC: tlv320adc3xxx: Don't strip remove function when
 driver is builtin
Message-Id: <171017082806.34160.5012089436149425102.b4-ty@kernel.org>
Date: Mon, 11 Mar 2024 15:27:08 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.13-dev-a684c
Message-ID-Hash: NVNPESUKYZ72DL6TWV45XWJUHC3UBWYU
X-Message-ID-Hash: NVNPESUKYZ72DL6TWV45XWJUHC3UBWYU
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/NVNPESUKYZ72DL6TWV45XWJUHC3UBWYU/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Sun, 10 Mar 2024 15:38:51 +0100, Uwe Kleine-König wrote:
> Using __exit for the remove function results in the remove callback
> being discarded with SND_SOC_TLV320ADC3XXX=y. When such a device gets
> unbound (e.g. using sysfs or hotplug), the driver is just removed
> without the cleanup being performed. This results in resource leaks. Fix
> it by compiling in the remove callback unconditionally.
> 
> This also fixes a W=1 modpost warning:
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: tlv320adc3xxx: Don't strip remove function when driver is builtin
      commit: f31e0d0c2cad23e0cc48731634f85bb2d8707790

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

