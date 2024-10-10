Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EDC03998A45
	for <lists+alsa-devel@lfdr.de>; Thu, 10 Oct 2024 16:50:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 996FF84C;
	Thu, 10 Oct 2024 16:50:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 996FF84C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1728571827;
	bh=i/3TTAmfaXNZdpDtxudno6KZTI74jlAc4l8DHb12tjs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=dP1BbENv6PLr8kJSr3Nl6V7znmHFNO5ACcjV/0W/1pzg2dQFtCADN23ZguWprUrIA
	 t9G3tt88ZXc9JFLAY/32PVomq/KtBodFwgZoeY7MnKOz//JzCuCqcHElUE8JECublt
	 jgc1sco6Ew+toHgeF3wFCBQlILYNgj3WRHmpacOc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EAD8DF805BD; Thu, 10 Oct 2024 16:49:56 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 25346F805A1;
	Thu, 10 Oct 2024 16:49:56 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 80D98F80528; Thu, 10 Oct 2024 16:49:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,RCVD_IN_VALIDITY_SAFE_BLOCKED,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 50133F8001E
	for <alsa-devel@alsa-project.org>; Thu, 10 Oct 2024 16:49:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 50133F8001E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=f8M/RknK
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 6D5DA5C2EB9;
	Thu, 10 Oct 2024 14:49:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16F4AC4CEC5;
	Thu, 10 Oct 2024 14:49:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728571785;
	bh=i/3TTAmfaXNZdpDtxudno6KZTI74jlAc4l8DHb12tjs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=f8M/RknKjt4boiyaR0VU6Dh1PUJTfQg5PoVd4rZWnnMPVL9PbySvAofTKNiNshtbt
	 /E4zCJRrQoxA+lWjrmhU54EH5jFseufu3PF8ar0foz2luuHOI054vUkCcv4oTlg1X6
	 +nzDjadC4+DolhjZCLpr8fpu24Accys5dIYN5WsM6w/hID4DNTQqO76n723TANO60V
	 bi78iTKL2MqH/d+T4Pv5fAEQ1dK9pHsBpyi/VN6+2qKSPxcEJ/L74V2mF7XGdUOGAH
	 JLq9VL6w7zN1R9y5U9JYsO3El3jUDjpaead0IL5C4HgyRQ0UyyFMm1H1UOVnM8fZiu
	 RqgfIf2CSVp6g==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, Jack Yu <jack.yu@realtek.com>
Cc: alsa-devel@alsa-project.org, lars@metafoo.de, bard.liao@intel.com,
 naveen.m@intel.com, "Flove(HsinFu)" <flove@realtek.com>,
 Oder Chiou <oder_chiou@realtek.com>,
 =?utf-8?q?Shuming_=5B=E8=8C=83=E6=9B=B8=E9=8A=98=5D?= <shumingf@realtek.com>,
 =?utf-8?q?Derek_=5B=E6=96=B9=E5=BE=B7=E7=BE=A9=5D?= <derek.fang@realtek.com>
In-Reply-To: <cc2158ad467f45068bb3556ecb5a814d@realtek.com>
References: <cc2158ad467f45068bb3556ecb5a814d@realtek.com>
Subject: Re: [PATCH 1/2] ASoC: Intel: Add rt721-sdca support for PTL
 platform
Message-Id: <172857178278.3727572.17093467784946017577.b4-ty@kernel.org>
Date: Thu, 10 Oct 2024 15:49:42 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-99b12
Message-ID-Hash: F6FUXODS6QZUFE2UNQDP6NCAXCNU5BQW
X-Message-ID-Hash: F6FUXODS6QZUFE2UNQDP6NCAXCNU5BQW
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/F6FUXODS6QZUFE2UNQDP6NCAXCNU5BQW/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, 08 Oct 2024 08:57:30 +0000, Jack Yu wrote:
> Add rt721-sdca support for PTL platform.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: Intel: Add rt721-sdca support for PTL platform
      commit: f8199bbca5c5a6de9b8ca70f90811f2eefe413aa

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

