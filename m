Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 23F708FD957
	for <lists+alsa-devel@lfdr.de>; Wed,  5 Jun 2024 23:44:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 656AF846;
	Wed,  5 Jun 2024 23:44:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 656AF846
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1717623888;
	bh=TCvAx/XM79I+r42mKUlMSvUzDjqwLUgg2X9peC5/Qoo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=VqcUiUn0p2gQ40U2msocZc8SzUcTPXMzXD5tu7GVhB9mY+Sierf1cCl1d7E2o7Kzy
	 FE7e13irh8sFUbpIXGeLNkTQFkLK/HrT5ReLJpzQbBAt9MmYtY/5lHY/gyWdauUc6R
	 r2yb1tb0wh0RIiu/G42tw0XBUCk1j+mlqsF6Dc0I=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 068E3F804FF; Wed,  5 Jun 2024 23:44:15 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 801FDF8059F;
	Wed,  5 Jun 2024 23:44:13 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D9FBDF804E5; Wed,  5 Jun 2024 23:40:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 60C95F8003A
	for <alsa-devel@alsa-project.org>; Wed,  5 Jun 2024 23:38:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 60C95F8003A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=rxgN1+VY
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id C34B2CE19AC;
	Wed,  5 Jun 2024 21:38:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0131C4AF07;
	Wed,  5 Jun 2024 21:38:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717623496;
	bh=TCvAx/XM79I+r42mKUlMSvUzDjqwLUgg2X9peC5/Qoo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=rxgN1+VYaZZfdNXyEQ68EukPeA4+iRn7ZZOKgY4xZ/ee+q9NUSObMkP+RrWfHViej
	 FCpo3pecGhogkBGQC9M+djI4Z0OUdOQBxYOKbk/5M2Q5FqwQePeCfTeDyjFKyVp1Jm
	 AOauq9cDJ86N+10qn6SZWb4QPKPsCHtcKFF369wH+l72q7VZZWj6YDE8H7M/3iWUp4
	 pBW5cV+dvv5LJM9jXV2i5GLii0iYXCLmtNlyrqrXEy2AQS1A1RfpYgMqJOaf3I3jvb
	 W4x0+Cl+HhICmB5Pm7738RXSCE6tflelAz8phmdPTAAwbnrXYZ8osNStiB4vhKmqJe
	 P3MBcAcmPWaMw==
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Linux-ALSA <alsa-devel@alsa-project.org>
In-Reply-To: <87bk4qh6h8.wl-kuninori.morimoto.gx@renesas.com>
References: <87bk4qh6h8.wl-kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH 00/11] ASoC: simple-card: sync support
Message-Id: <171762349538.565712.3175877075532659931.b4-ty@kernel.org>
Date: Wed, 05 Jun 2024 22:38:15 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14-dev-d4707
Message-ID-Hash: AIQKIGCGDGAQXMAINESZ5EXKCXJP6FC4
X-Message-ID-Hash: AIQKIGCGDGAQXMAINESZ5EXKCXJP6FC4
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/AIQKIGCGDGAQXMAINESZ5EXKCXJP6FC4/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, 28 May 2024 05:04:58 +0000, Kuninori Morimoto wrote:
> We have simle-card / audio-graph / audio-graph2, basically these supports
> same feature but is using different DT style.
> 
> Because we are using 3 drivers, some feature was added to one driver,
> but other drivers doesn't have it. This patch set try to sync it on these
> 3 drivers.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[01/11] ASoC: simple-card-utils: remove both playback/capture_only check
        commit: 45919c28134519080a85a5fb66d0f65955ef7572
[02/11] ASoC: audio-graph-card2: add ep_to_port() / port_to_ports()
        commit: 72999a1b6663f1ff604e79aea54f168f78e2441a
[03/11] ASoC: audio-graph-card2: remove ports node name check
        commit: 33ae57277ce08b83c65c18a09bf09499de613c01
[04/11] ASoC: audio-graph-card2: expand dai_link property part
        commit: 844de7eebe97a1c277f8a408457712086c957195
[05/11] ASoC: audio-graph-card2: merge graph_parse_mclk_fs() into graph_link_init()
        commit: f2d7e85962baf410b1bbbb4cf23a1ca59261ef76
[06/11] ASoC: audio-graph-card: add ep_to_port() / port_to_ports()
        commit: df23fcd56bb75ab522350bd8cb52bde9067aea45
[07/11] ASoC: audio-graph-card: remove ports node name check
        commit: 84c9601a92b755f869ac811607402e5b2162c225
[08/11] ASoC: audio-graph-card: enable playback/capture_only property
        commit: f23bac6e6913eed9eb831b4893255ea862d40ea5
[09/11] ASoC: audio-graph-card: merge graph_parse_mclk_fs() into graph_link_init()
        commit: a0174c88386b48bea7c35bc5a927f7057cb45d38
[10/11] ASoC: simple-audio-card: enable playback/capture_only property
        commit: 42d37e8de8f2d121481a65e6a3e10f6387c0ad4c
[11/11] ASoC: simple-audio-card: merge simple_parse_mclk_fs() into simple_link_init()
        commit: c4cfe1136d6edf8970ccdd944b7f86f7aa3edb77

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

