Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D462950987
	for <lists+alsa-devel@lfdr.de>; Tue, 13 Aug 2024 17:55:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9D79923E0;
	Tue, 13 Aug 2024 17:55:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9D79923E0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1723564512;
	bh=SCILEbD9383LEVKt7wlG2zqcA2/nxq5Pc5x9g0ZN3xo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=eNOl2Car5bUzFKfBJxg96SgtQVZC3WBhcw6V5jtlzm9k43n0ZXb7Lf93wy7a25mUj
	 WvlH0d1sM3go4GAtKWOnb8C3qq1Mxq5yvIrGfsOBwrinOtdr9Rz6iL7cseKG5zH3K/
	 qXaBAND5NUeWWUCtlfuJvPb+sKEi6bcgXtZGZNJs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A2121F805F0; Tue, 13 Aug 2024 17:54:25 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B77E5F805F4;
	Tue, 13 Aug 2024 17:54:24 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C3A5EF80423; Tue, 13 Aug 2024 17:44:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from galois.linutronix.de (galois.linutronix.de
 [IPv6:2a0a:51c0:0:12e:550::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 05BF3F800BF
	for <alsa-devel@alsa-project.org>; Tue, 13 Aug 2024 17:44:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 05BF3F800BF
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linutronix.de header.i=@linutronix.de
 header.a=rsa-sha256 header.s=2020 header.b=VJTBe3qh;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de
 header.a=ed25519-sha256 header.s=2020e header.b=AyjWMK10
Date: Tue, 13 Aug 2024 17:22:43 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1723562564;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=b5/E7ZJ4wGcPnowXOcotLGIaNe6xlDkthLXxOfxn/IM=;
	b=VJTBe3qhTwmSyv+Ep8Zivpuql5YfALl0d/U7P1AMY7WCPIA5MnJ+zsEXrNlS7fHI16EGoF
	r9S7Qu/+dQXBUAEIQWwoiepOvs18fbWedjqFtEoaIkfpz2pubpdm41RHztQPWFzWpiI02S
	c2WylEwIkJLwB7nOezbEjnl+UX9DZ6jkydFdWl5it12EHofrb88wvdwCI2nJzGhdLwDcPq
	LYO1Srf5SU+SCqTG0zO08c8BVHfeKsj0l0tLKQF0tPPhsHk0aLWu6kAC2ss5oe1uUxmpD5
	/rwXbRmAf+FyeJH/cCxnBs+l8WenvM0sZMRTwwUH2V5vc0m/uC5C1cKbiPosXQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1723562564;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=b5/E7ZJ4wGcPnowXOcotLGIaNe6xlDkthLXxOfxn/IM=;
	b=AyjWMK10XA1oBwhboOrf9Z46wxNRgkQKjVvE2863FVPVuOPdvctQMbo1SBvhbdxtkkzAg4
	8gFC0gzk/LbN4NCw==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	linux-amlogic@lists.infradead.org, alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org,
	Arseniy Krasnov <avkrasnov@salutedevices.com>
Subject: Re: [PATCH] ASoC: meson: axg-fifo: fix irq scheduling issue with
 PREEMPT_RT
Message-ID: <20240813152243.2H3-mnx5@linutronix.de>
References: <20240806102707.3825703-1-jbrunet@baylibre.com>
 <172356023429.57695.4053614993109219592.b4-ty@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <172356023429.57695.4053614993109219592.b4-ty@kernel.org>
Message-ID-Hash: KQFJPPRRALN72UNYI2YGUZ433WLK73O6
X-Message-ID-Hash: KQFJPPRRALN72UNYI2YGUZ433WLK73O6
X-MailFrom: bigeasy@linutronix.de
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/KQFJPPRRALN72UNYI2YGUZ433WLK73O6/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 2024-08-13 15:43:54 [+0100], Mark Brown wrote:
> On Tue, 06 Aug 2024 12:27:03 +0200, Jerome Brunet wrote:
> > With PREEMPT_RT enabled, spinlocks become preemptible.
> > This is usually not a problem with spinlocks used in IRQ context since
> > IRQ handlers get threaded. However, if IRQF_ONESHOT is set, the upper half
> > of a threaded irq handler won't be threaded and this causes scheduling
> > problems if spinlocks are used in the upper half, like with regmap when
> > '.fast_io' is set.
> > 
> > [...]
> 
> Applied to
> 
>    https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next
> 
> Thanks!
> 
> [1/1] ASoC: meson: axg-fifo: fix irq scheduling issue with PREEMPT_RT
>       commit: 5003d0ce5c7da3a02c0aff771f516f99731e7390

Didn't you already apply v2 of this?

Sebastian
