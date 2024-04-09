Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F11089E5A4
	for <lists+alsa-devel@lfdr.de>; Wed, 10 Apr 2024 00:26:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5E66C2BAD;
	Wed, 10 Apr 2024 00:26:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5E66C2BAD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1712701603;
	bh=JRiZLmsx7hhNHxoVfxIwti14+zTEneZtVwD0uvJjdM0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=f7fteKVWp6i3vI/bowdkAQI6Nag76XyNL1axlK4p0absjy/Kdl2CqU4LEdk4slNn0
	 1OzS6vydBQeaC4F067t+Cz3v/5tAEFdo0LzEwQBRUlI2TwF7kRkegdgWZdXywo59bI
	 nNZMgEOqTsvhEbQQ5IRl5tVWvfpXCxVP4L0szbTY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A128EF8056F; Wed, 10 Apr 2024 00:26:11 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D8CC7F80570;
	Wed, 10 Apr 2024 00:26:10 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9F04FF8026D; Wed, 10 Apr 2024 00:26:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.7 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0D843F8013D
	for <alsa-devel@alsa-project.org>; Wed, 10 Apr 2024 00:26:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0D843F8013D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=ix+Wl3Zk
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A5EF0618FA;
	Tue,  9 Apr 2024 22:25:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8526C433F1;
	Tue,  9 Apr 2024 22:25:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712701558;
	bh=JRiZLmsx7hhNHxoVfxIwti14+zTEneZtVwD0uvJjdM0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=ix+Wl3ZkM7yYlsmewtEP2ZhWvvQWZgaE3lpc+3ysm+h+l3ySFsq0tGwOt8eud+qRF
	 /ZmoXItCGNwGDBkRAhFDn/xAsRSVlj0h89Pk50cYXEJaeHUGEMktcAG3Zeu6N049Gf
	 Q2QN7eD/h3qMvSYJBZ5pALX9sHCL3tC+4X4k+92FdLSzcdfWkBbOQ8XTNK8s5ew1Sk
	 ZK5lAtb87ymUsURdwTfU9F1+p+LbGAhXE62fkMZla6KLqJsmevgAqxCrjgd/fjiFed
	 8L14pgjWy4RHPh3tXm6HqvTA0voYBNMHm2KqfepKv1S4epdumwWvG2fzOTzXePO9k+
	 7lebgs4T+AS3w==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, Jack Yu <jack.yu@realtek.com>
Cc: alsa-devel@alsa-project.org, lars@metafoo.de,
 "Flove(HsinFu)" <flove@realtek.com>, Oder Chiou <oder_chiou@realtek.com>,
 =?utf-8?q?Shuming_=5B=E8=8C=83=E6=9B=B8=E9=8A=98=5D?= <shumingf@realtek.com>,
 =?utf-8?q?Derek_=5B=E6=96=B9=E5=BE=B7=E7=BE=A9=5D?= <derek.fang@realtek.com>
In-Reply-To: <727219ed45d3485ba8f4646700aaa8a8@realtek.com>
References: <727219ed45d3485ba8f4646700aaa8a8@realtek.com>
Subject: Re: [PATCH 1/2] ASoC: rt722-sdca: add headset microphone vrefo
 setting
Message-Id: <171270155645.193711.12508810933772905850.b4-ty@kernel.org>
Date: Tue, 09 Apr 2024 23:25:56 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14-dev
Message-ID-Hash: 7GL5WHY5FMJ3QM4ZMJA5TKAL67HEUWJC
X-Message-ID-Hash: 7GL5WHY5FMJ3QM4ZMJA5TKAL67HEUWJC
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7GL5WHY5FMJ3QM4ZMJA5TKAL67HEUWJC/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, 09 Apr 2024 06:47:34 +0000, Jack Yu wrote:
> Add vrefo settings to fix jd and headset mic recording issue.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: rt722-sdca: add headset microphone vrefo setting
      commit: 140e0762ca055d1aa84b17847cde5d9e47f56f76

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

