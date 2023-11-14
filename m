Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 68F9F7EB90A
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Nov 2023 22:57:41 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 897BB74C;
	Tue, 14 Nov 2023 22:56:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 897BB74C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1699999060;
	bh=8xS18Ma/+3T2V2LYZQQLK15YfxKiDnZfkN8DH27iGdk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=vY7GkYk5LOxUSkuGRYZcm3Ygshgf8WAMGo0al1+t4jm34zARgnoUqOhARz7fyCN3U
	 xoHDOHlZJG/+X7iHgNpeN19ont1HJObx+slMLufiurWnCn4yWfGABB5FjcNzKL2WgS
	 7PZZ4zLFQYu/oZ11BQLi9rnnKH9rdlt1FreVmIP0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BD4F8F80551; Tue, 14 Nov 2023 22:56:49 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3F1A2F80093;
	Tue, 14 Nov 2023 22:56:49 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BF4E2F801D5; Tue, 14 Nov 2023 22:56:43 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 21857F80166
	for <alsa-devel@alsa-project.org>; Tue, 14 Nov 2023 22:56:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 21857F80166
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=hpHXE/h4
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id E7A92B8166D;
	Tue, 14 Nov 2023 21:56:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B48A9C433C8;
	Tue, 14 Nov 2023 21:56:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699998994;
	bh=8xS18Ma/+3T2V2LYZQQLK15YfxKiDnZfkN8DH27iGdk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=hpHXE/h4JUfJV13izlNpDfYTskIs+Ks1Ks80yucxJ7f5vobrOA+ycNb9TGphgNRz8
	 r/JA08+33OR40GszEcI0EYsa2UuQtDhPSycVZyKsmWBSYzkFOUAxII9lyz9FAVTpaD
	 Gub9fBpXCoqbG8wsFGs2yM7rnxP5BpwDpccUbCg0tS92DETjDYi5vJFJYnCmyQ/NQT
	 kJ2gf/hzTyKnQxnl4KiEbozNWqxDVoJV92GlT6Os76iYUCaV69Zng8VUrzGRKtYcLH
	 S8/brx8gydWXLeKH9XZXB8s44MMWH0TC+WbQP3LrVeC5tLQO4EmGlgeYc4Z2cS8d4O
	 lA2JjpO4uqUBg==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, Jack Yu <jack.yu@realtek.com>
Cc: alsa-devel@alsa-project.org, lars@metafoo.de,
 "Flove(HsinFu)" <flove@realtek.com>, Oder Chiou <oder_chiou@realtek.com>,
 =?utf-8?q?Shuming_=5B=E8=8C=83=E6=9B=B8=E9=8A=98=5D?= <shumingf@realtek.com>,
 =?utf-8?q?Derek_=5B=E6=96=B9=E5=BE=B7=E7=BE=A9=5D?= <derek.fang@realtek.com>
In-Reply-To: <62cad4e51c044108bad872ab349e36f8@realtek.com>
References: <62cad4e51c044108bad872ab349e36f8@realtek.com>
Subject: Re: [PATCH v2] ASoC: rt5682s: Add LDO output selection for dacref
Message-Id: <169999899245.141821.11994247889425687867.b4-ty@kernel.org>
Date: Tue, 14 Nov 2023 21:56:32 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-0438c
Message-ID-Hash: EYRFZWKTRXZA6QGOEYULJHWDDBRXUEC6
X-Message-ID-Hash: EYRFZWKTRXZA6QGOEYULJHWDDBRXUEC6
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/EYRFZWKTRXZA6QGOEYULJHWDDBRXUEC6/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, 13 Nov 2023 10:37:15 +0000, Jack Yu wrote:
> Add LDO output selection for dacref.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: rt5682s: Add LDO output selection for dacref
      commit: 577d71544871b075a25a09e4c5aa31008850c0a8

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

