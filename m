Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 99F6C7DC04D
	for <lists+alsa-devel@lfdr.de>; Mon, 30 Oct 2023 20:21:34 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7ADEC93A;
	Mon, 30 Oct 2023 20:20:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7ADEC93A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1698693692;
	bh=2/AkVrexR/JZ05pQV2i1gYvGNuV3Dwqm9KVT5lmWsow=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=g4ZTyewoL4NI6NvuwihIUoXEMMyWdoMLpWWgJO4zV41CsogRBi6gDT4Hc1bHHG8yF
	 aqHFvUEHB3aM7OFERaJqDQJsz9Acd4gleKeKmjVmKmo/GMQRIZdetnG8ZAQKLViTMa
	 VMFAQVa/TmhABh4O4bSRfqKwiWOitilB47Fl5xyw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C6E35F8055A; Mon, 30 Oct 2023 20:20:41 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 939D5F8016D;
	Mon, 30 Oct 2023 20:20:41 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3AF4DF8020D; Mon, 30 Oct 2023 20:20:38 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5ABC9F8014B
	for <alsa-devel@alsa-project.org>; Mon, 30 Oct 2023 20:20:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5ABC9F8014B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=MECrVJea
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 4341DCE0B26;
	Mon, 30 Oct 2023 19:20:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D07C3C433C8;
	Mon, 30 Oct 2023 19:20:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698693625;
	bh=2/AkVrexR/JZ05pQV2i1gYvGNuV3Dwqm9KVT5lmWsow=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=MECrVJeaJQC/0R+9DGzfSEbAPTwEj13FUBlJTrbfoq03rmpvluF9xyOpYxTFIQFmf
	 eZ5R7l+BSqM+t0G/yW+R0PJbCbQV2sNHt9/hcaBwol1aYQJVBNfvIE4Fu69TE1/Rtv
	 p0SgLcOqBmHTxfd1HHb6LS4p8kx/hwgFjZ4wUhxZXUzaWg/F/L2kV673C8CUEIgaZa
	 3mwkUHVGXmWMlymc0FimQKyXBm1hYPvM+9cn/So0hYbyttNGTwsKTgLfkORrxWbRB1
	 TJ5BwSLYVSgjF8M66mGnETfIi5iHzmv8zlr9EwuHKuwtFj4fl544bwH2CkfFWyElyN
	 4LB1xzx2Hr2vA==
From: Mark Brown <broonie@kernel.org>
To: Peter Ujfalusi <peter.ujfalusi@gmail.com>,
 Jarkko Nikula <jarkko.nikula@bitmer.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Tony Lindgren <tony@atomide.com>
Cc: Andreas Kemnade <andreas@kemnade.info>, alsa-devel@alsa-project.org,
 linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20231030052340.13415-1-tony@atomide.com>
References: <20231030052340.13415-1-tony@atomide.com>
Subject: Re: [PATCH] ASoC: ti: omap-mcbsp: Fix runtime PM underflow
 warnings
Message-Id: <169869362256.44249.15039737144512154634.b4-ty@kernel.org>
Date: Mon, 30 Oct 2023 19:20:22 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-0438c
Message-ID-Hash: NGTHFIC75P5L6UAREJNJEYMCI3CHMIRJ
X-Message-ID-Hash: NGTHFIC75P5L6UAREJNJEYMCI3CHMIRJ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/NGTHFIC75P5L6UAREJNJEYMCI3CHMIRJ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, 30 Oct 2023 07:23:38 +0200, Tony Lindgren wrote:
> We need to check for an active device as otherwise we get warnings
> for some mcbsp instances for "Runtime PM usage count underflow!".
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: ti: omap-mcbsp: Fix runtime PM underflow warnings
      commit: fbb74e56378d8306f214658e3d525a8b3f000c5a

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

