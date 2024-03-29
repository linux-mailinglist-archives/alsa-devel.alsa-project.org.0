Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C9400891059
	for <lists+alsa-devel@lfdr.de>; Fri, 29 Mar 2024 02:30:25 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 14F182C96;
	Fri, 29 Mar 2024 02:30:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 14F182C96
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1711675825;
	bh=A8XVNU5tjkFScbnqgLogq2C++BER6iz0Fw152LIGcRU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=thRRRPwoxuyVpkSQaKZC9mkotfPLputrtYCe6Azb7TSMSsf/PHUlChL0MeYnqYUIg
	 lKaslhZWg03KlbbGN3GtOyJJ2XNhBvGZyorIunpkBaQi7DZ4rIyrOAqJp2ChcwlQ6+
	 guNXJB3t8P1bl7uU1fzr8RXisvmxUQ7pcL4HKUg8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6529EF805AA; Fri, 29 Mar 2024 02:29:42 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 71432F805A1;
	Fri, 29 Mar 2024 02:29:41 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 60DB3F801D5; Fri, 29 Mar 2024 02:29:16 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 27314F801D5
	for <alsa-devel@alsa-project.org>; Fri, 29 Mar 2024 02:29:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 27314F801D5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=uarB6bWI
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id C0A40618B3;
	Fri, 29 Mar 2024 01:29:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC0F1C43399;
	Fri, 29 Mar 2024 01:29:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711675743;
	bh=A8XVNU5tjkFScbnqgLogq2C++BER6iz0Fw152LIGcRU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=uarB6bWIX0PrFPujb/dU6GFQ2yHuHWMNnqHzumIvmTvTgCpHVcxrIBoFl+6iL6IlD
	 8+33RhSWTImfuMse+S6CLJ0SNMS5FcdPE+mAr07797alIIM6awPCPnkCAw4KzJM3wS
	 NjiaxJQxn7hd0byKDvSv+t1L8Up3AbnbyJwYb+YmaOc6ghi40E7HT3H8+pY+/1Czcp
	 rhcvIGhcobTwcmMKzsixctn1cDdv2tK1SBy6QviMG1fFMICN3QAO2gQCyRN3Th3Z3+
	 jHQprQ8/6IjzlpvMseTUMrLTp3q9JLBQrbBb0P+SpF3t0Ys33Kblj3gno20hqW/KB4
	 xj/HyDHPtMUcw==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
 Stephen Lee <slee08177@gmail.com>
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 linux-sound@vger.kernel.org, roman.gushchin@linux.dev, dennis@kernel.org
In-Reply-To: <20240326010131.6211-1-slee08177@gmail.com>
References: <20240326010131.6211-1-slee08177@gmail.com>
Subject: Re: [PATCH] ASoC: ops: Fix wraparound for mask in
 snd_soc_get_volsw
Message-Id: <171167574149.187137.12642574967939100311.b4-ty@kernel.org>
Date: Fri, 29 Mar 2024 01:29:01 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14-dev
Message-ID-Hash: HNZYMJUGA5OQKE5HGRGDK3QBUBSEZO2T
X-Message-ID-Hash: HNZYMJUGA5OQKE5HGRGDK3QBUBSEZO2T
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/HNZYMJUGA5OQKE5HGRGDK3QBUBSEZO2T/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, 25 Mar 2024 18:01:31 -0700, Stephen Lee wrote:
> In snd_soc_info_volsw(), mask is generated by figuring out the index of
> the most significant bit set in max and converting the index to a
> bitmask through bit shift 1. Unintended wraparound occurs when max is an
> integer value with msb bit set. Since the bit shift value 1 is treated
> as an integer type, the left shift operation will wraparound and set
> mask to 0 instead of all 1's. In order to fix this, we type cast 1 as
> `1ULL` to prevent the wraparound.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: ops: Fix wraparound for mask in snd_soc_get_volsw
      commit: fc563aa900659a850e2ada4af26b9d7a3de6c591

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

