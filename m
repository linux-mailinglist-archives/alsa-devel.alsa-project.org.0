Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6233379B7C9
	for <lists+alsa-devel@lfdr.de>; Tue, 12 Sep 2023 02:07:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6B5651506;
	Tue, 12 Sep 2023 02:06:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6B5651506
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694477250;
	bh=UTHfskCPxfT0CkxuCk8AMyzTpjekFNSPymhm+op3rqA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=NLgEIdMMChf1ql2Qhtc2JgoeHN628Llqz5CMEKNRHhoDe8S9Wb8Q5xASbzUJk7EdY
	 OoQkKOYqafml/p+XNfkLilFCP+6zI1Bb+yNKep8NmhFOiYKQHrEOswGo7kKZs9oW+t
	 tcyZBKd08SjjAYn2JEgT8OjZYJI88o+u/Brdtlv8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 74455F80697; Tue, 12 Sep 2023 01:58:16 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id BE281F80697;
	Tue, 12 Sep 2023 01:58:15 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BEA2AF80675; Tue, 12 Sep 2023 01:57:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 79CBEF80637
	for <alsa-devel@alsa-project.org>; Tue, 12 Sep 2023 01:57:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 79CBEF80637
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=OuNP3e2N
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id 222ABCE1915;
	Mon, 11 Sep 2023 23:57:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C39B6C3277B;
	Mon, 11 Sep 2023 23:57:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694476668;
	bh=UTHfskCPxfT0CkxuCk8AMyzTpjekFNSPymhm+op3rqA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=OuNP3e2Ngm0xtfKhjqUdTqC1Keeq29pezrRMz7trEeHEZPExjHJC6VNRu3Ir15niD
	 TfFgKaSywSBUbRJ4x9BhkiPiG6ciFIl2Q4mWfWsvQXcZXVN2bc42cx1q1VWtppcJ8+
	 e7gEPBKCAqFs4EFly89/+FCC5NARjjNFl69T8ogBNlhhwQFO2wPtBUubnMR6whMkfb
	 opi6GgkzHDDtA8vRYhL2lALutTBJuQE69b7c9/dW3rmFFq2A/odFhgBOpWRZxHlbkh
	 UKAezSTZDd1a+fGyfuQJLyEy6b7q3zA3OkhI+GiDDU850y9AdBPxywaDYbuzDlrhgp
	 7U91uODV8sanQ==
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>
In-Reply-To: <20230904111524.1740930-1-andriy.shevchenko@linux.intel.com>
References: <20230904111524.1740930-1-andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v1 1/1] ASoC: soc.h: replace custom COUNT_ARGS() &
 CONCATENATE() implementations
Message-Id: <169447666642.2387538.16208384121056477598.b4-ty@kernel.org>
Date: Tue, 12 Sep 2023 00:57:46 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-099c9
Message-ID-Hash: V6DEFUH2O7LVPRQFZDBBZTLWV6WGCSJ4
X-Message-ID-Hash: V6DEFUH2O7LVPRQFZDBBZTLWV6WGCSJ4
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/V6DEFUH2O7LVPRQFZDBBZTLWV6WGCSJ4/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, 04 Sep 2023 14:15:24 +0300, Andy Shevchenko wrote:
> Replace custom implementation of the macros from args.h.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: soc.h: replace custom COUNT_ARGS() & CONCATENATE() implementations
      commit: 428cc4106a430781020eedc68e8d0511380eb0ef

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

