Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D8F1E90B804
	for <lists+alsa-devel@lfdr.de>; Mon, 17 Jun 2024 19:27:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1A0E3B65;
	Mon, 17 Jun 2024 19:27:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1A0E3B65
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1718645262;
	bh=lbQQyO5vacxgq4sOv7pgdPWOI2mMc1Vfu1EHa2O0VnQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=MtT9z4onFzZEsH7j0NYjDFqd5OXnU2OY1ezIgVSMM2q4Xhjtp9mRRmnnBOXpSZO0e
	 nb0FupozFjB07X6WTGCFdb/oom7jCm/E8wBo2e5fdgpU0yZHGd7+99nKbXRhz3dntx
	 sqZxFQBZfOn7KzupL4aT7tiQs7QhwFLE+mUn2JCM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B79CAF805E3; Mon, 17 Jun 2024 19:27:06 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3CF4CF805DF;
	Mon, 17 Jun 2024 19:27:06 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B5981F805A0; Mon, 17 Jun 2024 19:27:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 07903F801EB
	for <alsa-devel@alsa-project.org>; Mon, 17 Jun 2024 19:26:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 07903F801EB
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=huMX/FN7
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 1E61CCE12E8;
	Mon, 17 Jun 2024 17:26:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7489C4AF48;
	Mon, 17 Jun 2024 17:26:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718645213;
	bh=lbQQyO5vacxgq4sOv7pgdPWOI2mMc1Vfu1EHa2O0VnQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=huMX/FN7YMPnJrZeaaa7pzONYuhbsjayBcdB1LWDhxO9MoYzl/YQ71fYb93vPvyWx
	 VHojbrQx/fpIvSmQGihA8Weh6D9eD/x5h0g4A5VG/b+xlUMLkcLp5omic4jPtrbI4T
	 NiCCZEs4CeTzfa4wEfyDU0ocz1jqF0Sa+XkLRdIFUbB+d6f5oBbSLIGOaDaTqqp2eO
	 GeD8pwQohFo6+UcSz1gumV9k6GH/5wrBdlvIb8mvDc35vQW1HG/ULwtY3XsgNL4Vt6
	 MmUjN27O4zouVMrLMvRbSdRtFmGvTaRbIGJrcwudFwEHdRLBYiWkFcFCm3McKWJpmv
	 pqfarv3Am5oKw==
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Linux-ALSA <alsa-devel@alsa-project.org>
In-Reply-To: <878qz4ry81.wl-kuninori.morimoto.gx@renesas.com>
References: <878qz4ry81.wl-kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH] ASoC: audio-graph-card2: add support for aux devices
Message-Id: <171864521231.209755.15258335066297090042.b4-ty@kernel.org>
Date: Mon, 17 Jun 2024 18:26:52 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14-dev-d4707
Message-ID-Hash: TQJ4VIZ776CASQSFU3OICHT73CBLOQSK
X-Message-ID-Hash: TQJ4VIZ776CASQSFU3OICHT73CBLOQSK
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/TQJ4VIZ776CASQSFU3OICHT73CBLOQSK/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, 17 Jun 2024 04:26:38 +0000, Kuninori Morimoto wrote:
> Add device tree property to define auxiliary devices to be added to
> Audio Graph Card which is already supported on Simle Card.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: audio-graph-card2: add support for aux devices
      commit: 195815c2755d70df92f46e6d737cd677db7adeef

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

