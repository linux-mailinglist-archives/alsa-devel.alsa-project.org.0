Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 36A709BD45E
	for <lists+alsa-devel@lfdr.de>; Tue,  5 Nov 2024 19:16:03 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4D4D7E67;
	Tue,  5 Nov 2024 19:15:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4D4D7E67
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1730830562;
	bh=EELovDxbmI2znY7zCKs3kyU8RqNDC4ntj19F8aVcHeE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=AbLJxiXQAWBKFTAbCTGweM27qPylWZB/9oEFu/jZJdFuy6/QYTSjlc49ynO6CgWUE
	 YfLl1mgL3k0ds6dyyuDRTOAJsqfR52EGYJBMYOCMyYQuITdZTaWRqj0q0HMbSPh3vM
	 e8mMUKxYuSJVyH1/o8F4rWlASd6aWJB3rNMKNuUo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AE4A7F805A0; Tue,  5 Nov 2024 19:15:30 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 36A61F80534;
	Tue,  5 Nov 2024 19:15:30 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F28CAF8013D; Tue,  5 Nov 2024 19:15:25 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 16E1FF800D2
	for <alsa-devel@alsa-project.org>; Tue,  5 Nov 2024 19:15:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 16E1FF800D2
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=pY9qbW2q
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id C26D25C4D71;
	Tue,  5 Nov 2024 18:14:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3791C4CECF;
	Tue,  5 Nov 2024 18:15:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730830521;
	bh=EELovDxbmI2znY7zCKs3kyU8RqNDC4ntj19F8aVcHeE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=pY9qbW2q0ZY5pjoC8NmbpnGeOxigo7if1ZzEMP1qN+8EXnP1KPjAlowoJIg1BGqQB
	 fdiYnDtS0Is7K2SUJe/ljF3891xxwgmk89Ttri9lkgQAqWBQ7PVYwuqAFyPJU6vKhQ
	 ijCPHzECXIVTyISSgwfqnTxf3qepzPxLK4s97hEfju0WwBuDah1srIQSerPwe0FSPN
	 9c250LQJyyBeqhnrNrC31dhpexI7uiDUz2j6S3xlfcLIfyjLfEyJLcN3h3bI7MK38o
	 Wj5ZBkjY635T3z/Q9M0QkL0799lSVDKS/vjdwCjX2AfZtEaH2MXhgdBZ/bBYsuzQNK
	 EItk/7zMrbWmg==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, Jack Yu <jack.yu@realtek.com>
Cc: alsa-devel@alsa-project.org, lars@metafoo.de,
 "Flove(HsinFu)" <flove@realtek.com>, Oder Chiou <oder_chiou@realtek.com>,
 =?utf-8?q?Shuming_=5B=E8=8C=83=E6=9B=B8=E9=8A=98=5D?= <shumingf@realtek.com>,
 =?utf-8?q?Derek_=5B=E6=96=B9=E5=BE=B7=E7=BE=A9=5D?= <derek.fang@realtek.com>
In-Reply-To: <cbc81e324673467a96b70e4e219766b5@realtek.com>
References: <cbc81e324673467a96b70e4e219766b5@realtek.com>
Subject: Re: [PATCH] ASoC: rt721-sdca: change interrupt mask from XU to GE
Message-Id: <173083051846.94172.5717109444948467636.b4-ty@kernel.org>
Date: Tue, 05 Nov 2024 18:15:18 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-9b746
Message-ID-Hash: 2LBSNQ6MFRBYXIZT5TX7ZFAM4UPHRWNB
X-Message-ID-Hash: 2LBSNQ6MFRBYXIZT5TX7ZFAM4UPHRWNB
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2LBSNQ6MFRBYXIZT5TX7ZFAM4UPHRWNB/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, 05 Nov 2024 08:51:32 +0000, Jack Yu wrote:
> Change interrupt mask from XU to GE to fix jack detection
> interrupt issue.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: rt721-sdca: change interrupt mask from XU to GE
      commit: b3cb7f2a3a1732a775861a2279d951e79c0e614c

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

