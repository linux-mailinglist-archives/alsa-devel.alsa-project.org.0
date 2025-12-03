Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F3C2C9F61B
	for <lists+alsa-devel@lfdr.de>; Wed, 03 Dec 2025 15:57:04 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B6C296021F;
	Wed,  3 Dec 2025 15:56:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B6C296021F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1764773811;
	bh=T/mpkoDkRkQznJ4tY5RNjZro2rZBg1u/C0IJ2SPDB+0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ON31yv4kwNUXD7mMyDl7ZRavQX0zzySvbyWvabEvWZ5YjPTOeY4xnPb5c57Gvs1O/
	 6PTRthJVwv1ruC+WBPPJK2fkmUyYhNzYD+DcZx71FFVUPDC6RfC3glXY2X66OogYvw
	 aY15f8hY6rbHaXp3PK1YgS3TmuJaakC0fgcoexak=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 30F98F805F2; Wed,  3 Dec 2025 15:56:16 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D8920F805F3;
	Wed,  3 Dec 2025 15:56:16 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4178EF8051D; Wed,  3 Dec 2025 15:54:24 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 3DF4BF800BA
	for <alsa-devel@alsa-project.org>; Wed,  3 Dec 2025 15:54:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3DF4BF800BA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=Dn6g1MAY
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 035786019D;
	Wed,  3 Dec 2025 14:54:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C87AC116B1;
	Wed,  3 Dec 2025 14:54:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764773656;
	bh=T/mpkoDkRkQznJ4tY5RNjZro2rZBg1u/C0IJ2SPDB+0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Dn6g1MAYfs5NC3bpq41ehLyOzxgWqU66/H1pIM+zKcs8YORIuJPiyZt6cb5ekottE
	 9le65haKP8JA91ZopVYFiKhASiJMg0qcbytVDNhNWtgMxpxOnNvtT4/eEWPVN2ie1t
	 pah10Cip1WFL2nPO+yFOMbKqQgCC0g80MZyahRLXfLVK9THeOattuM4+7Pg999F3xs
	 Q8CbTPe/zKrlYFsuHMl/xJXL5UOCCv2y1TVVRKWG5BJsPOTT7D8y2K99KrX7lhQwCo
	 po+bmTV9dQohroLP19DMvcZEo2K5pgbNP+9AMJtVitq/IMS1uJnkDY64QM4i8gQG73
	 lU9gSGbb5/pOg==
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org,
 Raghavendra Prasad Mallela <raghavendraprasad.mallela@amd.com>
Cc: Vijendar.Mukunda@amd.com, Basavaraj.Hiregoudar@amd.com,
 Sunil-kumar.Dommati@amd.com,
 Hemalatha Pinnamreddy <hemalatha.pinnamreddy2@amd.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>,
 Venkata Prasad Potturu <venkataprasad.potturu@amd.com>,
 Mario Limonciello <mario.limonciello@amd.com>,
 "open list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
 <linux-sound@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>
In-Reply-To: <20251203064650.2554625-1-raghavendraprasad.mallela@amd.com>
References: <20251203064650.2554625-1-raghavendraprasad.mallela@amd.com>
Subject: Re: [PATCH v2] ASoC: amd: acp: Audio is not resuming after s0ix
Message-Id: <176477365389.48347.3477237517341563967.b4-ty@kernel.org>
Date: Wed, 03 Dec 2025 14:54:13 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-88d78
Message-ID-Hash: AQ5JROTZTHWUY44WTBZMENBPFAC7L4UB
X-Message-ID-Hash: AQ5JROTZTHWUY44WTBZMENBPFAC7L4UB
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/AQ5JROTZTHWUY44WTBZMENBPFAC7L4UB/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, 03 Dec 2025 12:16:48 +0530, Raghavendra Prasad Mallela wrote:
> Audio fails to resume after system exits suspend mode
> due to accessing incorrect ring buffer address during
> resume. This patch resolves issue by selecting correct
> address based on the ACP version.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: amd: acp: Audio is not resuming after s0ix
      commit: 3ee257aba1d56c3f0f1028669a8ad0f1a477f05b

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

