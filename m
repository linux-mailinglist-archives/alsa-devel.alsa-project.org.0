Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8433979B77A
	for <lists+alsa-devel@lfdr.de>; Tue, 12 Sep 2023 02:07:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 95ECB14A9;
	Tue, 12 Sep 2023 02:06:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 95ECB14A9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694477218;
	bh=FzUo6kz4vSnqAuUZNi1uZ04H7l9XwNQaj5HRYzYXW5A=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=dij4rnMmt+fzJhYiWv0jYMp0bxf+w9JQ7uykgF38lJmzpnLHk8f/WPNUxX9zORiHn
	 +Si2i8CL1ytAu/o0F1i8ZGdDjsZVPB1q7yj1VciF5Jm542YZbPtdsHgNzCqogzC0TP
	 YkU9ZapRFgK3XmPqusSCpeBHmJVs/GBqg8RU90mo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9F96CF80689; Tue, 12 Sep 2023 01:58:10 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A06C2F80637;
	Tue, 12 Sep 2023 01:58:09 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DCDDCF8062F; Tue, 12 Sep 2023 01:57:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7BD9DF805B2
	for <alsa-devel@alsa-project.org>; Tue, 12 Sep 2023 01:57:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7BD9DF805B2
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=KPLGGK3L
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id C4D33614A4;
	Mon, 11 Sep 2023 23:57:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61F1DC32778;
	Mon, 11 Sep 2023 23:57:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694476660;
	bh=FzUo6kz4vSnqAuUZNi1uZ04H7l9XwNQaj5HRYzYXW5A=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=KPLGGK3Lp6EnbFpvRQP+pxHv1KLQwuwzB/D3+MImSvicANXXvq5YKKY06dPvMyhpQ
	 Ta3I4vtrrYIkzKtiq3U8OXjKKlapPQTXLtVqd1n/YsPjkPKUNfG3hBJZ5GVu+E27OZ
	 9y59TohCZywhKHhnR++iMANSkfZR5gNlrIA2373H8bsuNEYyhUCeuj539wwCd3mmzl
	 lVTz/PaphUEqr9cLM96HHsdlNutd6nbtpte2QlL7x1kpqpQoAsWoQ8N5ouSYIsd1HJ
	 k2OV5Vi6iwYBw+NWTETWff7l6tJfLzj0kVcUq1ZTxXk+1MQZd0mkUc30sbmVBww21h
	 DEBkjH9BKNT1A==
From: Mark Brown <broonie@kernel.org>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Biju Das <biju.das.jz@bp.renesas.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
In-Reply-To: <20230831204734.104954-1-biju.das.jz@bp.renesas.com>
References: <20230831204734.104954-1-biju.das.jz@bp.renesas.com>
Subject: Re: [PATCH v3 0/2] Match data improvements for ak4642 driver
Message-Id: <169447665810.2387538.3521988123719858959.b4-ty@kernel.org>
Date: Tue, 12 Sep 2023 00:57:38 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-099c9
Message-ID-Hash: U24Q64N7KE4VKYJWG5XNDTWUEBPAED6W
X-Message-ID-Hash: U24Q64N7KE4VKYJWG5XNDTWUEBPAED6W
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/U24Q64N7KE4VKYJWG5XNDTWUEBPAED6W/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, 31 Aug 2023 21:47:32 +0100, Biju Das wrote:
> This patch series aims to add match data improvements for ak4642 driver.
> 
> This patch series is only compile tested.
> 
> v2->v3:
>  * Patch#1 for cleanups and patch#2 for simplifying probe()
>  * Replace local variable np with dev_fwnode()
>  * Replace dev_err()->dev_err_probe().
>  * Remove comma in the terminator entry for OF table.
>  * Drop a space in the terminator entry for ID table.
> v1->v2:
>  * Removed forward declaration ak4642_of_match and ak4642_i2c_id.
>  * Restored error EINVAL.
>  * Used dev_fwnode() and replaced dev->of_node.
>  * Removed comma in the terminator entry.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: ak4642: Minor cleanups in probe()
      commit: a157d07d029be5b72ee3bce3ac44dab7b967bc9b
[2/2] ASoC: ak4642: Simplify probe()
      commit: d9e6a80a2c7bea4cc2edc87fa43b876a64b13074

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

