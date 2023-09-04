Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E3392791A25
	for <lists+alsa-devel@lfdr.de>; Mon,  4 Sep 2023 16:57:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B3A0E3E8;
	Mon,  4 Sep 2023 16:56:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B3A0E3E8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1693839439;
	bh=6ta1H1SO5AL7wZ6YLXn2VSihZbdu5lIUUcM8Iy6JTnE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=KQWQmqQ+4WT0vMOGA80J5AZUK4eZzFcfk7JQt9w8tcMd53VRuLlxWjhTINRHlOlcu
	 5Nf4PJJK5bPYc8IjZ1KSDqzjBqssP/4NwkSaJiypZIM1o80QQgWYAknudMUBv/6gwb
	 Ut8Xw3xF4t9fCvuFC9qe0Z1MeelX3nqfoq5Nsf74=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 663B3F80527; Mon,  4 Sep 2023 16:56:29 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E96F9F8047D;
	Mon,  4 Sep 2023 16:56:28 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6A7ABF8055C; Mon,  4 Sep 2023 16:55:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 69C8FF80552
	for <alsa-devel@alsa-project.org>; Mon,  4 Sep 2023 16:55:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 69C8FF80552
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=sHP2SNnD
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 976D9B80DB3;
	Mon,  4 Sep 2023 14:55:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE14AC433C8;
	Mon,  4 Sep 2023 14:55:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1693839318;
	bh=6ta1H1SO5AL7wZ6YLXn2VSihZbdu5lIUUcM8Iy6JTnE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=sHP2SNnDUsBdeagUhh2OVza/4crpSmg8m97YFIa/lCwJWEwe33LAG4Bk98a2q8XYu
	 ZkKNQtYXeprXXpdNjSoAjHAXQteTULJkrkehBtm9GLzu6u+cHRGLeMEuHLfnR+hYw0
	 C38zIrauRj825B+MHA1d89dgFj0U/DnDrbNsLhabiAD8YezOh5c/sr439Z7OlX2/NA
	 iPReXKcIAd45EkFw1Axl1fLowSwStk3tSQPJf1qfBM/KQqpg57GoJjcTLOqirl9YVR
	 Ppcro5/bSd7g0xbAjNUDHsaSi3BV96+U2hWQrxHRknjKKWBVprUhX4ryFTtt6znLmw
	 a/EbMQG1K1lNw==
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org, Brent Lu <brent.lu@intel.com>
Cc: Oder Chiou <oder_chiou@realtek.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, linux-kernel@vger.kernel.org
In-Reply-To: <20230904104046.4150208-1-brent.lu@intel.com>
References: <20230904104046.4150208-1-brent.lu@intel.com>
Subject: Re: [PATCH] ASoC: rt5645: NULL pointer access when removing jack
Message-Id: <169383931669.34217.8836745562314083087.b4-ty@kernel.org>
Date: Mon, 04 Sep 2023 15:55:16 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-034f2
Message-ID-Hash: JLWVEYDNVR3TQWTX6BBPP4UETSCKMWTK
X-Message-ID-Hash: JLWVEYDNVR3TQWTX6BBPP4UETSCKMWTK
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JLWVEYDNVR3TQWTX6BBPP4UETSCKMWTK/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, 04 Sep 2023 18:40:46 +0800, Brent Lu wrote:
> Machine driver calls snd_soc_component_set_jack() function with NULL
> jack and data parameters when removing jack in codec exit function.
> Do not access data when jack is NULL.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: rt5645: NULL pointer access when removing jack
      commit: 5366a64033ef46d7fc36db097d4bde12af22c405

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

