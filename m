Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 86BBDCFABFF
	for <lists+alsa-devel@lfdr.de>; Tue, 06 Jan 2026 20:44:12 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DE4526020E;
	Tue,  6 Jan 2026 20:44:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DE4526020E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1767728650;
	bh=4+qi1T6iHYnj38tCsTiRRCMQUeU6Q+qfiEL8Q+Wtls4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=aeKO7zvR2XE/oZBiSH/wt1Bz9++SIRLFl+fydv0pdhAZCMq3W136uHFHEVy9xTyAP
	 qk1JwRmwGAzhLAFURuiIZKqPoIwFfiUq4MIivNiuivWTxk2ALVjX/YhojCVMlSsXb2
	 yTxKjaDf/bIeucFlgDvcDQdRI1Wurkt7VSGVYPmA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 59EEEF8059F; Tue,  6 Jan 2026 20:43:52 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B9C54F805EB;
	Tue,  6 Jan 2026 20:43:52 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7291CF804F3; Tue,  6 Jan 2026 20:42:32 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,T_SPF_HELO_TEMPERROR,T_SPF_TEMPERROR shortcircuit=no
	autolearn=no autolearn_force=no version=3.4.6
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9C3D1F802DB
	for <alsa-devel@alsa-project.org>; Tue,  6 Jan 2026 20:42:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9C3D1F802DB
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=XSYG3Pzd
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 3A06060007;
	Tue,  6 Jan 2026 19:42:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A82E0C19422;
	Tue,  6 Jan 2026 19:42:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767728547;
	bh=4+qi1T6iHYnj38tCsTiRRCMQUeU6Q+qfiEL8Q+Wtls4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=XSYG3PzdJVxpVm5EAGXUF/MyPbRpaC7LSFpbN7LNPeo/1Sdg61rBG4AT0SV2nNRIt
	 sHVjuh3YUsqmZfVgUPHtkwkISFlUQRsPR1E1zbHpS3zqk1+UDHaVM9qOF4AxpO42Iu
	 Jx/M9XUTVGpnjKWYuM9mrN0wVIkgv7I7MlU1OZnUHt49K+lTlJ8FlcO6KURMIuI3DR
	 fEp3FLEM6Pgr0r2yTmCmODMWc/D3TbKWsw61iX4Cpl8byCYsioPkPO0uy0qJq8Tc6h
	 JN50OzFClbsUnhGtJSYeh0mntcVUOhT+Q8iADOl2Ikgw+jqIc1iIKuZl08hUW1j5iq
	 R2grLe1WsFzEQ==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, Oder Chiou <oder_chiou@realtek.com>
Cc: perex@perex.cz, linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, flove@realtek.com, shumingf@realtek.com,
 jack.yu@realtek.com, derek.fang@realtek.com
In-Reply-To: <20251121084112.743518-1-oder_chiou@realtek.com>
References: <20251121084112.743518-1-oder_chiou@realtek.com>
Subject: Re: [PATCH v7 1/2] ASoC: rt5575: Add the codec driver for the
 ALC5575
Message-Id: <176772854544.328192.17132767077968717258.b4-ty@kernel.org>
Date: Tue, 06 Jan 2026 19:42:25 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-47773
Message-ID-Hash: Z2KE762OVT25UMXB3NOTQRAKTPQ3A5CG
X-Message-ID-Hash: Z2KE762OVT25UMXB3NOTQRAKTPQ3A5CG
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/Z2KE762OVT25UMXB3NOTQRAKTPQ3A5CG/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, 21 Nov 2025 16:41:11 +0800, Oder Chiou wrote:
> The ALC5575 integrates an audio DSP that typically loads its firmware
> from an external flash via its own SPI host interface. In certain
> hardware configurations, the firmware can alternatively be loaded
> through the SPI client interface. The driver provides basic mute and
> volume control functions. When the SPI client interface is enabled,
> firmware loading is handled by the SPI driver.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: rt5575: Add the codec driver for the ALC5575
      commit: c7ac7499ac5bb50ab3e00add121822c5c904bc91
[2/2] ASoC: dt-bindings: realtek,rt5575: add bindings for ALC5575
      (no commit info)

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

