Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B44DA90673B
	for <lists+alsa-devel@lfdr.de>; Thu, 13 Jun 2024 10:43:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CC969EC0;
	Thu, 13 Jun 2024 10:43:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CC969EC0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1718268202;
	bh=7QmIuu0FaN0bN1zTvR+QZvTGyyI/2TExNVK08dOeDN8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ZhJFo2el9Wup0Xq0s3sPOO4GNdE9wQBV18gyCGAQGfQrPK1QQNHaqDGumvLzhmwOd
	 nmMODaUNV8nkFzXqIz8LVwFRsHmgNvcwWGLy1H+bobv7w1t/xaTURGsbGg+kocMl4o
	 fNFSees0RdI46l5df2A+h7oneY8j5ZX9pVB2NP7c=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 10070F805B3; Thu, 13 Jun 2024 10:42:50 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3C5CDF805B2;
	Thu, 13 Jun 2024 10:42:50 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EE063F800D0; Thu, 13 Jun 2024 10:42:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 45B6AF800D0
	for <alsa-devel@alsa-project.org>; Thu, 13 Jun 2024 10:42:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 45B6AF800D0
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=jcMF/OjT
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 012CDCE2488;
	Thu, 13 Jun 2024 08:42:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B38F6C2BBFC;
	Thu, 13 Jun 2024 08:42:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718268147;
	bh=7QmIuu0FaN0bN1zTvR+QZvTGyyI/2TExNVK08dOeDN8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=jcMF/OjTNkF66n03Y99hAsw53ROiV7aeezz22FjXnDrVHjxri6jcLNN6SgePjf7va
	 lFT7vOgwGOI+3eMZ3N4uO8ljeEiBpsFu4YoPb2wlFWnZtrQ2hGDn5fHJd2EvGTX23Y
	 s5qHq98hjCbXTlegZdqHjDAEErf+hNtpHMalQ5GBiMnczqnVUaa7twb6d4v4Zy/+fD
	 1Nws36UzB3d9J3i3oPpdcbiWJi4fvxnZG5gerSdhPLzxFFvaIHdvJURQnTmgsoOBaF
	 7cslgEKe7x8hak0qHvLvIfyYYJ2ydRTcZGRAp+QlpIeTQkGr3vDRrSz2WU4jU+Xo3O
	 HQ6flxwjltPSA==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, Jack Yu <jack.yu@realtek.com>
Cc: alsa-devel@alsa-project.org, lars@metafoo.de,
 "Flove(HsinFu)" <flove@realtek.com>, Oder Chiou <oder_chiou@realtek.com>,
 =?utf-8?q?Shuming_=5B=E8=8C=83=E6=9B=B8=E9=8A=98=5D?= <shumingf@realtek.com>,
 =?utf-8?q?Derek_=5B=E6=96=B9=E5=BE=B7=E7=BE=A9=5D?= <derek.fang@realtek.com>
In-Reply-To: <7e502e9a9dd94122a1b60deb5ceb60fb@realtek.com>
References: <7e502e9a9dd94122a1b60deb5ceb60fb@realtek.com>
Subject: Re: [PATCH] ASoC: rt722-sdca-sdw: add debounce time for type
 detection
Message-Id: <171826814643.249517.14817476126359716211.b4-ty@kernel.org>
Date: Thu, 13 Jun 2024 09:42:26 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14-dev-4c370
Message-ID-Hash: KBUITW2J4YOZVY3ZRHPMMMMR5A6HIVVQ
X-Message-ID-Hash: KBUITW2J4YOZVY3ZRHPMMMMR5A6HIVVQ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/KBUITW2J4YOZVY3ZRHPMMMMR5A6HIVVQ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, 12 Jun 2024 09:01:07 +0000, Jack Yu wrote:
> Add debounce time in headset type detection for better performance.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: rt722-sdca-sdw: add debounce time for type detection
      commit: f3b198e4788fcc8d03ed0c8bd5e3856c6a5760c5

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

