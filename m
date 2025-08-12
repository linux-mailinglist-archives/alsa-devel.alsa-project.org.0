Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 49BBCB22609
	for <lists+alsa-devel@lfdr.de>; Tue, 12 Aug 2025 13:39:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C929860234;
	Tue, 12 Aug 2025 13:39:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C929860234
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1754998755;
	bh=y7erQ3IAw1iUWYsP0Q9aCki5HxC9ifKlP2/UH2PB8bU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=alcyBExnWHOnFfe+SdTjXfnw6GGFEteDc7M8+GecJ8x0OQcSEbhawq1RdMY4N3aYZ
	 4g0RpLrW4iuzewN2C6voDzgXeT4w7gFaobiR+vbeHzFGxnYLe9qn1FtA9VSArXUARz
	 ARRJZ3xtlmkyHoBixC3Ir0arMzC9Q2VlXHGx/R0I=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 56069F805C5; Tue, 12 Aug 2025 13:38:42 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1A417F805CA;
	Tue, 12 Aug 2025 13:38:42 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DFD42F8042F; Tue, 12 Aug 2025 13:38:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_NONE,SPF_PASS shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 689ECF8021D
	for <alsa-devel@alsa-project.org>; Tue, 12 Aug 2025 13:38:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 689ECF8021D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=MM5Tzz96
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 358BE419CB;
	Tue, 12 Aug 2025 11:38:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93D49C4CEF0;
	Tue, 12 Aug 2025 11:38:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754998707;
	bh=y7erQ3IAw1iUWYsP0Q9aCki5HxC9ifKlP2/UH2PB8bU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=MM5Tzz96cavgM54oTgvcg6IM8LKmDyeW6xejAHxWq+tdgdOxRMTobzmgH6sc5klea
	 816EDT+T6aaI5fXRjfmPG5FRqdPpMiHzFn4JASXLqPoM9OzaBlngyiZMFnI4mESMT8
	 jU/o9V4xYNfXCuMxZ+86muYkDqP3ZZ0A+boMPZdeRwnKI0rl24dneACesiHI10WgPz
	 vSkXQUjEXAX9DDqcU+6E6JXJ3iin+gXuL8O7ngUCHxnXhMWOZieChcBPt27UE2eibo
	 3e815bx7o7p7nbGCdSQL3wkpooLJ1dmBAe7L5oq7sHZnkqRKJHn+bK3SywVU4wn21s
	 rD/W/eNvY6K6w==
From: Mark Brown <broonie@kernel.org>
To: Shenghao Ding <shenghao-ding@ti.com>
Cc: andriy.shevchenko@linux.intel.com, tiwai@suse.de, 13916275206@139.com,
 13564923607@139.com, alsa-devel@alsa-project.org, baojun.xu@ti.com,
 jesse-ji@ti.com
In-Reply-To: <20250812022408.490-1-shenghao-ding@ti.com>
References: <20250812022408.490-1-shenghao-ding@ti.com>
Subject: Re: [RESEND PATCH v1] ASoC: tas2781: Add keyword "init" in profile
 section
Message-Id: <175499870533.35258.3065536146253087908.b4-ty@kernel.org>
Date: Tue, 12 Aug 2025 12:38:25 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-cff91
Message-ID-Hash: IGAFARYDTPIPT4TK3MRLFPSUDKHPZUF6
X-Message-ID-Hash: IGAFARYDTPIPT4TK3MRLFPSUDKHPZUF6
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/IGAFARYDTPIPT4TK3MRLFPSUDKHPZUF6/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, 12 Aug 2025 10:24:08 +0800, Shenghao Ding wrote:
> Since version 0x105, the keyword 'init' was introduced into the profile,
> which is used for chip initialization, particularly to store common
> settings for other non-initialization profiles.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: tas2781: Add keyword "init" in profile section
      commit: e83dcd139e776ebb86d5e88e13282580407278e4

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

