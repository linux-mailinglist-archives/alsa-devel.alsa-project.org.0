Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B60417A95BB
	for <lists+alsa-devel@lfdr.de>; Thu, 21 Sep 2023 18:31:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B974FDF9;
	Thu, 21 Sep 2023 18:31:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B974FDF9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1695313910;
	bh=nZpjoR0hCOsQnQVg/vaX8/PozCdrpRYnHa+VvQhCQ7Y=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=CSeKJusiWL6J9Iwg+7ktol0HoPAwKfSqhZMqcI+8hlQ11n5TZlJzlhGstI/cJGr82
	 PVsJ4xWRM+8tBt58kiecewg1GZW/y/Gv59jxmRrNPaZUZiEOYnu4nAJmz92xtKFGSh
	 AfXPCAgPUsEha5AfEJUjjftZK4PadDQR76AJ8a7M=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CFBFAF80551; Thu, 21 Sep 2023 18:30:23 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 245AFF80551;
	Thu, 21 Sep 2023 18:30:23 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E650EF80552; Thu, 21 Sep 2023 18:30:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 29312F80494
	for <alsa-devel@alsa-project.org>; Thu, 21 Sep 2023 18:30:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 29312F80494
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=aYCw1cHe
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id EAFF9B82159;
	Thu, 21 Sep 2023 16:30:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C02DC611A6;
	Thu, 21 Sep 2023 16:30:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695313811;
	bh=nZpjoR0hCOsQnQVg/vaX8/PozCdrpRYnHa+VvQhCQ7Y=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=aYCw1cHeNbldZ28iLJjIx+7DeAtUZ9kk+Qw9CLsJAbceuf1LnoYX3qwxA56hMR2Dn
	 Bfp/FXnD0Okg3qiNtq4LlMIhn+xa9bu+/tuO+Equwd+bZT7HdYaxG4t1+R3hwUXjay
	 XLyN+qPkPomCUh3sRLE5r0Kb4+WTZnmzvI7GPVi5aGOC3WkR882eUpGrJVY7mu1iuq
	 Jmp6mRmw3+/QDRva6s3NrFzi4QVSoanKwke2kbc7OMI1l1ErX7vKlQgCKRTp1IySzs
	 H+yWV6TP1IdF1rnfQ4hKzHZb6ff4w2ApkZDn9/Jr24IqwCu2J3sW03pYquq89MLP4Y
	 OKKDAAj0nDRow==
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Linux-ALSA <alsa-devel@alsa-project.org>,
 Dan Carpenter <dan.carpenter@linaro.org>,
 Robert Hancock <robert.hancock@calian.com>
In-Reply-To: <87v8c76jnz.wl-kuninori.morimoto.gx@renesas.com>
References: <87v8c76jnz.wl-kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH v2] ASoC: simple-card-utils: fixup
 simple_util_startup() error handling
Message-Id: <169531381002.61074.15608456084087041714.b4-ty@kernel.org>
Date: Thu, 21 Sep 2023 17:30:10 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-034f2
Message-ID-Hash: VG32R3C2FDEXOIOEJB5GMNQWC745INC2
X-Message-ID-Hash: VG32R3C2FDEXOIOEJB5GMNQWC745INC2
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VG32R3C2FDEXOIOEJB5GMNQWC745INC2/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, 19 Sep 2023 01:22:57 +0000, Kuninori Morimoto wrote:
> It should use "goto" instead of "return"
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: simple-card-utils: fixup simple_util_startup() error handling
      commit: 69cf63b6560205a390a736b88d112374655adb28

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

