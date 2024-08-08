Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A2DDC94C6BE
	for <lists+alsa-devel@lfdr.de>; Fri,  9 Aug 2024 00:08:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 00E05852;
	Fri,  9 Aug 2024 00:07:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 00E05852
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1723154881;
	bh=U55zr8nmJOAbnMqspv1F23aPrgO2gDK8goya8/ZMJb8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=M0fooyuXSYx/9k1a4HqEGibkDMtLMrzFqsKulsDMLByaBFWJLuGyla4TJpqPl4Im+
	 OPN6KWF21GisUcwHzm8DcmywKZmr0XKw1k3Is+3jP9mBJgKZNGZJvbawJWkFczvReu
	 PpU+clNsr7QBGDufApnsrBZubjJgZkePS1heGdzc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9C89EF80604; Fri,  9 Aug 2024 00:06:51 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C564AF8061A;
	Fri,  9 Aug 2024 00:06:50 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6C5C9F8049C; Thu,  8 Aug 2024 23:53:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=unavailable autolearn_force=no
	version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 265E1F802DB
	for <alsa-devel@alsa-project.org>; Thu,  8 Aug 2024 23:47:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 265E1F802DB
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=KGm1kxPN
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 0436B60659;
	Thu,  8 Aug 2024 21:47:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB115C4AF12;
	Thu,  8 Aug 2024 21:47:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723153626;
	bh=U55zr8nmJOAbnMqspv1F23aPrgO2gDK8goya8/ZMJb8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=KGm1kxPNo9FWiD+NdC9BHLIxg3omvTRrbd5okPmbZyrqZKpxgtKS9DuFOjKkus7sq
	 eTCmr5Vd2pdquUsV6/N+BZwDd01ac3jp9fXy3xf7WKVn52y25Algdz58SH/qSG6w9W
	 Mn/OGN86xhD3laejbCwPjG2B5K/x9v+EkDGYVG3NSoRl7M6PuGOJpbWlySLF3nHWzr
	 ndxbEoMDRKf7Ppr34bhxznfcV23yr8ToT0FVPiKQqNBnmlocoTI6VialKiyBVtG0xW
	 OAP8B5QzrBLMgDI+t6dnYJuaBIjfUA5VXqvvMbppBuibK2dwxWOvUOGurPJV1X9ELB
	 mWYWszTXEDGPA==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>,
 Jerome Brunet <jbrunet@baylibre.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 linux-amlogic@lists.infradead.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, Arseniy Krasnov <avkrasnov@salutedevices.com>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>
In-Reply-To: <20240807162705.4024136-1-jbrunet@baylibre.com>
References: <20240807162705.4024136-1-jbrunet@baylibre.com>
Subject: Re: [PATCH v2] ASoC: meson: axg-fifo: fix irq scheduling issue
 with PREEMPT_RT
Message-Id: <172315362437.480667.7263502304351371986.b4-ty@kernel.org>
Date: Thu, 08 Aug 2024 22:47:04 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-37811
Message-ID-Hash: ZEYKIKOV4R5VDCZ3ACBR5BO3TSWQ5YWA
X-Message-ID-Hash: ZEYKIKOV4R5VDCZ3ACBR5BO3TSWQ5YWA
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZEYKIKOV4R5VDCZ3ACBR5BO3TSWQ5YWA/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, 07 Aug 2024 18:27:03 +0200, Jerome Brunet wrote:
> With PREEMPT_RT enabled a spinlock_t becomes a sleeping lock.
> 
> This is usually not a problem with spinlocks used in IRQ context since
> IRQ handlers get threaded. However, if IRQF_ONESHOT is set, the primary
> handler won't be force-threaded and runs always in hardirq context. This is
> a problem because spinlock_t requires a preemptible context on PREEMPT_RT.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: meson: axg-fifo: fix irq scheduling issue with PREEMPT_RT
      commit: 5003d0ce5c7da3a02c0aff771f516f99731e7390

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

