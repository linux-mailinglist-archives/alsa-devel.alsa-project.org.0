Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BA3A8C5A4F
	for <lists+alsa-devel@lfdr.de>; Tue, 14 May 2024 19:30:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E93C9A4A;
	Tue, 14 May 2024 19:30:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E93C9A4A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1715707820;
	bh=F2hF5WrNOQ4dV0yMKXRcrqI9SXfSwANL5rdUYGg+uTs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=OoSwRqey6IlVjuGo13eKyaVOSpZ5GCzHPZA1XqSmqDkyLYXm8berzyK6LJtxdiy4l
	 EH1fbTit0s+KTpF2li/hA0TIedP7/5wanb10vVUQoWMJhntwhxFo9DPwhHCHAGVQSD
	 UF7+Od05avLVd2PfG4Y4dupUn6aH099HUMV/JLI8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CFD7EF805AA; Tue, 14 May 2024 19:29:47 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 603EAF805A1;
	Tue, 14 May 2024 19:29:47 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E7B88F8024C; Tue, 14 May 2024 19:29:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E8DDAF800F5
	for <alsa-devel@alsa-project.org>; Tue, 14 May 2024 19:29:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E8DDAF800F5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=I7i+Q3Mb
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 98F2E6123F;
	Tue, 14 May 2024 17:29:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1AC6C2BD11;
	Tue, 14 May 2024 17:29:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715707772;
	bh=F2hF5WrNOQ4dV0yMKXRcrqI9SXfSwANL5rdUYGg+uTs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=I7i+Q3MbLkuq4i3luX5LrUY90/B1xlBOVn179ajAySlTuVeGMqq9kYEqyariK3TQP
	 1JlxbniTfdzMFrpYEEs8JP5sfrE8ItlsaVEW5k6Nqf60VrR7mgSfqoqeeLzwmbQEWX
	 KxFcGs9woCW07wE08NxWXczm9GGyT0EPPe15q2T6b8g9ATXu1napw0fd6nDIkPNcGC
	 S3ng/gBN8IIKvzkly1KeKhbe4AUZwXpV+5Yh19r9opVJJD8ACFZglVH/ieZqvhAqOa
	 zHzg09yeeNzvLOupK8VM7J3vrMsS5TM+kKJqZGAvSL0uDhYEyu2DKeVTu8DAEn0tqs
	 Q6F/Q2ILg3zRg==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, Jack Yu <jack.yu@realtek.com>
Cc: alsa-devel@alsa-project.org, lars@metafoo.de,
 "Flove(HsinFu)" <flove@realtek.com>, Oder Chiou <oder_chiou@realtek.com>,
 =?utf-8?q?Shuming_=5B=E8=8C=83=E6=9B=B8=E9=8A=98=5D?= <shumingf@realtek.com>,
 =?utf-8?q?Derek_=5B=E6=96=B9=E5=BE=B7=E7=BE=A9=5D?= <derek.fang@realtek.com>
In-Reply-To: <b7614d9e38054aa6ad8efa620edb4162@realtek.com>
References: <b7614d9e38054aa6ad8efa620edb4162@realtek.com>
Subject: Re: [PATCH] ASoC: rt5645: mic-in detection threshold modification
Message-Id: <171570777044.50952.13951229662953019520.b4-ty@kernel.org>
Date: Tue, 14 May 2024 18:29:30 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14-dev
Message-ID-Hash: 3UQIX7RDAPTJAM6ATV7M2KBUKRTCGFEH
X-Message-ID-Hash: 3UQIX7RDAPTJAM6ATV7M2KBUKRTCGFEH
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3UQIX7RDAPTJAM6ATV7M2KBUKRTCGFEH/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, 14 May 2024 02:31:22 +0000, Jack Yu wrote:
> Modify mic-in detection threshold for better performance.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: rt5645: mic-in detection threshold modification
      commit: 1f900475314ef258af1a4c11bc9096fe2ffe263f

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

