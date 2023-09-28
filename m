Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 25CEB7B17ED
	for <lists+alsa-devel@lfdr.de>; Thu, 28 Sep 2023 11:55:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0A1DADF0;
	Thu, 28 Sep 2023 11:54:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0A1DADF0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1695894946;
	bh=IYjJZKUJ+zHXfSWnMyLQcswrV7O9EUMponFcf4s0rhg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=CEVrDcXGMFwpZRdioxivdjTje3P90iaWoJLHBLb08Fg0sm90d8dF1kJMGcw2ZkpMa
	 iGYBce2zB2AiV/l7vCWKv4Mz9laSbr3Yz8N6NLOQHS+GDG/D9PordaxYepDBXpDA3p
	 OgWgKI7ZOpOIZyMl8SgIO1TKbWZSn9ejkxd1/FDs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E7C00F80551; Thu, 28 Sep 2023 11:54:54 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3F37BF8016A;
	Thu, 28 Sep 2023 11:54:54 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 21E9DF801D5; Thu, 28 Sep 2023 11:54:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3DA41F800AE
	for <alsa-devel@alsa-project.org>; Thu, 28 Sep 2023 11:54:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3DA41F800AE
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=jdZYAT/B
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 37721CE1C09;
	Thu, 28 Sep 2023 09:54:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7DA1C433C8;
	Thu, 28 Sep 2023 09:54:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695894880;
	bh=IYjJZKUJ+zHXfSWnMyLQcswrV7O9EUMponFcf4s0rhg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=jdZYAT/BeiEm7XROL8smi+im3m2vSe01NO6jdXvcsxgUAweGAOO59ReaEWXyH4Djk
	 KgawwGoSUuWrjmUMmg3YWxPn8zDcJ16yOzozjjPsdSNJ43IqoM1LXAGJlH0mULQXJ7
	 k1ZYV4g5bHd0Wz7e3FgYHDgdsNkss+0n5uKojRvbQflPIvup2z0qIngzsKGm5LCqza
	 CORnHFxYZ1soDBPQ4UntTXzcfFY7hbuKlaC8CVnmjzKytIyKR3lvdOB7TupYBwkqEB
	 RTFxKzDdatlEwwReHiTafDvDlLwU9FArJQuJw83XEfJwknyDwBUWd7+XpUs6Kqffpj
	 ugruxaUmvFvrQ==
From: Mark Brown <broonie@kernel.org>
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Linux-ALSA <alsa-devel@alsa-project.org>
In-Reply-To: <87ttrfgo3j.wl-kuninori.morimoto.gx@renesas.com>
References: <87ttrfgo3j.wl-kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH] sh: boards: Fix Sound Simple-Card struct name
Message-Id: <169589488061.2727490.7697757504875605113.b4-ty@kernel.org>
Date: Thu, 28 Sep 2023 11:54:40 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-099c9
Message-ID-Hash: V6P6IWSO57MXZQT5V6QNURG2MEPFF3V3
X-Message-ID-Hash: V6P6IWSO57MXZQT5V6QNURG2MEPFF3V3
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/V6P6IWSO57MXZQT5V6QNURG2MEPFF3V3/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, 28 Sep 2023 00:04:16 +0000, Kuninori Morimoto wrote:
> "asoc_simple_card_info" was renamed to "simple_util_info" by
> commit ad484cc98f2 ("ASoC: remove asoc_xxx() compatible macro").
> This patch fixup it For SH7724 boards.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] sh: boards: Fix Sound Simple-Card struct name
      commit: 6d925797304e345e397bc24e62a334b41503fb1d

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

