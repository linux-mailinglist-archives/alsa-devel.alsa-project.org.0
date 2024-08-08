Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 788BA94B706
	for <lists+alsa-devel@lfdr.de>; Thu,  8 Aug 2024 09:00:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C28A2843;
	Thu,  8 Aug 2024 09:00:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C28A2843
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1723100451;
	bh=F1GfsLtw3XII5FmnMgQ8kSFwottDn8Xd2rABzSEFXmA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=e8hZHGQ6LO81qi0i8Bj4WbZJxcAW3oxPvLSqgDAzK/U06hrKq15SekBBbqk1qFbW3
	 3WeRWToUB8OVugJGgEkHKzdjLzWrU0CzixezjQWbODUKBRqfriNSLpkHtcu9wuxlVh
	 vUAC26ncBGwscRxIZzE50NsUphz4r1D7X7w3qLCw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2ACD1F805A1; Thu,  8 Aug 2024 09:00:20 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B56A9F805AE;
	Thu,  8 Aug 2024 09:00:15 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 13712F80236; Thu,  8 Aug 2024 08:52:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_FAIL,SPF_HELO_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=unavailable autolearn_force=no
	version=3.4.6
Received: from galois.linutronix.de (galois.linutronix.de
 [IPv6:2a0a:51c0:0:12e:550::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3F14AF80236
	for <alsa-devel@alsa-project.org>; Thu,  8 Aug 2024 08:46:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3F14AF80236
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linutronix.de header.i=@linutronix.de
 header.a=rsa-sha256 header.s=2020 header.b=Si76o8jX;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de
 header.a=ed25519-sha256 header.s=2020e header.b=oKkJproI
Date: Thu, 8 Aug 2024 08:46:40 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1723099601;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=bvNh43nfSO4d+UD/c8WTug/9ZdIpYcc6hAsJkEvDjdM=;
	b=Si76o8jXOQPnoEKdHE8e+UndNId1Pf6tz3u+ArpvSRpnP4loGQXnRQDp1XrNDaLFQkrse0
	FuKQtJsFYDWBGcnV27A4t/VvxJskqA5r3tIbiHbrXXJN/CXg9XZ7SJtQijrLoKQ9wHWh1C
	prlF+ME+LHYgS3ENiWwm2r+dTq6JK1/9BvVlxpS80ASjePnw/DGLo1A5pYseopa13wwqG7
	jWSyvWy0MCAnvhDQPvoJLkYSSdYPFC0HsZjeRxBHho+Ccz4WWLoG1PXXUnv9S5MXpR98uN
	iesbFdD5kKegVDRzmode/8Ku8KGC515x+sf7hkc+PFNlXY8IpOg3OXaHuSZA8A==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1723099601;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=bvNh43nfSO4d+UD/c8WTug/9ZdIpYcc6hAsJkEvDjdM=;
	b=oKkJproIdztfQMIkb/RIwu+VvJMo85xqKUJsCSYhOVOhY2q7JdtZxHvBItv8qAbRhhAkxD
	PEV+PlHo0KG62YAg==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	linux-amlogic@lists.infradead.org, alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org,
	Arseniy Krasnov <avkrasnov@salutedevices.com>
Subject: Re: [PATCH v2] ASoC: meson: axg-fifo: fix irq scheduling issue with
 PREEMPT_RT
Message-ID: <20240808064640.8-BmbtlX@linutronix.de>
References: <20240807162705.4024136-1-jbrunet@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240807162705.4024136-1-jbrunet@baylibre.com>
Message-ID-Hash: U2UTBTKRO2M4MCRROMI5S33N3QWJHIC7
X-Message-ID-Hash: U2UTBTKRO2M4MCRROMI5S33N3QWJHIC7
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/U2UTBTKRO2M4MCRROMI5S33N3QWJHIC7/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 2024-08-07 18:27:03 [+0200], Jerome Brunet wrote:
> With PREEMPT_RT enabled a spinlock_t becomes a sleeping lock.
> 
> This is usually not a problem with spinlocks used in IRQ context since
> IRQ handlers get threaded. However, if IRQF_ONESHOT is set, the primary
> handler won't be force-threaded and runs always in hardirq context. This is
> a problem because spinlock_t requires a preemptible context on PREEMPT_RT.
> 
> In this particular instance, regmap mmio uses spinlock_t to protect the
> register access and IRQF_ONESHOT is set on the IRQ. In this case, it is
> actually better to do everything in threaded handler and it solves the
> problem with PREEMPT_RT.
> 
> Reported-by: Arseniy Krasnov <avkrasnov@salutedevices.com>
> Closes: https://lore.kernel.org/linux-amlogic/20240729131652.3012327-1-avkrasnov@salutedevices.com
> Suggested-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
> Fixes: b11d26660dff ("ASoC: meson: axg-fifo: use threaded irq to check periods")
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>

Reviewed-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>

Sebastian
