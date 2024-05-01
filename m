Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 331878B8B71
	for <lists+alsa-devel@lfdr.de>; Wed,  1 May 2024 15:44:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D1C06E7D;
	Wed,  1 May 2024 15:44:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D1C06E7D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1714571097;
	bh=O6VvEOG1FYYxiSATtFdjPAV7d0igftAeyhbDcL2/oH0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=muBN4llsvkQ02aFdH0m2iLQz7U1TPMBxaRHPADk7j1OR7bfyjYlECOSD5WTDKhlYw
	 KVzgLS/aSZLWRijG+I4FwJwofoPdOMtnfcTu4TRdXSSjqUlOm6ljp6uWo4JM5due++
	 yc35FOojRsgY9V4BVezpy+loli3eKZ+j/ydnTSpA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 40E56F80611; Wed,  1 May 2024 15:44:01 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 62894F805EF;
	Wed,  1 May 2024 15:44:01 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5A57EF80580; Wed,  1 May 2024 15:43:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8D33DF8003A
	for <alsa-devel@alsa-project.org>; Wed,  1 May 2024 15:43:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8D33DF8003A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=qh8W1fcN
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id BE264CE12FD;
	Wed,  1 May 2024 13:43:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C60D4C113CC;
	Wed,  1 May 2024 13:43:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714571002;
	bh=O6VvEOG1FYYxiSATtFdjPAV7d0igftAeyhbDcL2/oH0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=qh8W1fcNhbalI3y+nG4MQoEDqYZzv56KKCouGMwdNtQQ6ImtLhumgFcinolCuOUJ3
	 dcwtvnQW4NvKJ0UwzADP0Z+EjWW0JZG1qkdgE8wsDY4ZxesO6g5ilAgOaCXBLjRCx7
	 x8XY6qza8LaQndjO8KrQVKvVMaYWi+StgB6Lwb/HZoM4UNDclvuOoM8f3SJM3Yryhe
	 i6FWm4V1uYMTgTsn9jgg8JkZuZg8qcf7Y9NwtUaUAvlDbAiUC60Bxx0xPRad7Wy4gn
	 MLEk2n+A5XwxvsRgivZVy4OMGldX2CCvQ7usaj0zPkPRDBal6g1ZLWgVSp6yV7sG6/
	 S1byDemKE4IKw==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>,
 Jerome Brunet <jbrunet@baylibre.com>
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org
In-Reply-To: <20240426152946.3078805-1-jbrunet@baylibre.com>
References: <20240426152946.3078805-1-jbrunet@baylibre.com>
Subject: Re: [PATCH 0/4] ASoC: meson: tdm fixes
Message-Id: <171457100123.1888704.3713341677013104535.b4-ty@kernel.org>
Date: Wed, 01 May 2024 22:43:21 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14-dev
Message-ID-Hash: 6I5GTIVFIQQWIEY5OBFXOZNRXNPB4BGU
X-Message-ID-Hash: 6I5GTIVFIQQWIEY5OBFXOZNRXNPB4BGU
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6I5GTIVFIQQWIEY5OBFXOZNRXNPB4BGU/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, 26 Apr 2024 17:29:37 +0200, Jerome Brunet wrote:
> This patchset fixes 2 problems on TDM which both find a solution
> by properly implementing the .trigger() callback for the TDM backend.
> 
> ATM, enabling the TDM formatters is done by the .prepare() callback
> because handling the formatter is slow due to necessary calls to CCF.
> 
> The first problem affects the TDMIN. Because .prepare() is called on DPCM
> backend first, the formatter are started before the FIFOs and this may
> cause a random channel shifts if the TDMIN use multiple lanes with more
> than 2 slots per lanes. Using trigger() allows to set the FE/BE order,
> solving the problem.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/4] ASoC: meson: axg-fifo: use threaded irq to check periods
      commit: b11d26660dff8d7430892008616452dc8e5fb0f3
[2/4] ASoC: meson: axg-card: make links nonatomic
      commit: dcba52ace7d4c12e2c8c273eff55ea03a84c8baf
[3/4] ASoC: meson: axg-tdm-interface: manage formatters in trigger
      commit: f949ed458ad15a00d41b37c745ebadaef171aaae
[4/4] ASoC: meson: axg-tdm: add continuous clock support
      commit: a5a89037d080e0870d7517c61f8b2123d58ab33b

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

