Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 500ED79B660
	for <lists+alsa-devel@lfdr.de>; Tue, 12 Sep 2023 02:05:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 902A2EF0;
	Tue, 12 Sep 2023 02:04:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 902A2EF0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694477107;
	bh=Q4qDXEJt6oAid1CrVYNdNibOMv2p5JVtH0VzbtF0oWM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=a0GJ5RcQeU7K7fYqGTaIlL1f7wxwBmqwM6mNPFJJQ7pOCeesUOawakOJ9tULUYZlO
	 XyR1C5r8PuUA4BfulieuoP3GCEMC+oQjc+AccBZ1bKx7/8O8kYldwJTwPpenF9jqAQ
	 oOfnM2Q7dkeEuxWGVOgk2HMygUDWUHR2+CuclSKQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 13562F805EB; Tue, 12 Sep 2023 01:57:41 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 968F6F805FE;
	Tue, 12 Sep 2023 01:57:40 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 05E97F805C7; Tue, 12 Sep 2023 01:57:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3A6D2F80564
	for <alsa-devel@alsa-project.org>; Tue, 12 Sep 2023 01:57:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3A6D2F80564
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=DgiK0kIw
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id D1D09B81A21;
	Mon, 11 Sep 2023 23:57:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF77EC116D6;
	Mon, 11 Sep 2023 23:57:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694476644;
	bh=Q4qDXEJt6oAid1CrVYNdNibOMv2p5JVtH0VzbtF0oWM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=DgiK0kIwu71OJZ+NpAiBPevJiQDNu19qiULN0Yr9pMQzK+HEpcOYfpfXIODNPmkjs
	 Dv2A4miYve0JYXg4MzkZ9YGksvIaKqR/YS2Sq563Vdja4icwDtmg56KdyAKEWWD9Fs
	 X7ABPYVANSHAdlcmNO27xUFUWkmAqhYciWuBxJYoMcznOjDCMNjzVjfm/bsiNZmUVU
	 nC4XTUouOeMJXg2CU8104O/fGt5cV2tgHmbMTvdXAJvjAlgDoQF+lcpje5OHm8MyJV
	 11+owqy/OYHyJY7q6IZXMMM0se95ZjHT6Jz7wJL7TwnIrG1GcsFcqG5xfZtnbsg8vC
	 n4RViAAJWRePA==
From: Mark Brown <broonie@kernel.org>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Biju Das <biju.das.jz@bp.renesas.com>
Cc: Kevin Cernekee <cernekee@chromium.org>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Kamel Bouhara <kamel.bouhara@bootlin.com>,
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 alsa-devel@alsa-project.org, Geert Uytterhoeven <geert+renesas@glider.be>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 linux-renesas-soc@vger.kernel.org
In-Reply-To: <20230827091525.39263-1-biju.das.jz@bp.renesas.com>
References: <20230827091525.39263-1-biju.das.jz@bp.renesas.com>
Subject: Re: [PATCH] ASoC: tas571x: Simplify probe()
Message-Id: <169447664152.2387538.15701808950700785351.b4-ty@kernel.org>
Date: Tue, 12 Sep 2023 00:57:21 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-099c9
Message-ID-Hash: Y32ISZLY3OVX52RMY4F577OIYU4WDOKM
X-Message-ID-Hash: Y32ISZLY3OVX52RMY4F577OIYU4WDOKM
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/Y32ISZLY3OVX52RMY4F577OIYU4WDOKM/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Sun, 27 Aug 2023 10:15:25 +0100, Biju Das wrote:
> Simplify probe() by replacing of_match_device->i2c_get_match_data().
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: tas571x: Simplify probe()
      commit: e17e892dc8d1404a758d38ec870e44299f97d227

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

