Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 17D5593F77E
	for <lists+alsa-devel@lfdr.de>; Mon, 29 Jul 2024 16:21:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 601B8B71;
	Mon, 29 Jul 2024 16:21:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 601B8B71
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1722262909;
	bh=D1ZYFHP/38LgdR0JBD7XaxbjYHhm3ApdP7ZKB5nxgew=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=OfDDgFPo8xOHJbm5NTlV7g0+1YxnxNI3Poy7PvsZG2Aq/8feZ7WxzE/a/wK3XWWHK
	 rwkjSZjgNpUy/eMJc17GgTuVtdqQ1Nmo7z31YQA7KCFLo5YTcVfcE3jJVVrc1nJF4o
	 cO682WFMzulB57oCfBdNyGILhRRt4k15CU7o6DSI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5D9E5F805AD; Mon, 29 Jul 2024 16:21:18 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7E326F805AF;
	Mon, 29 Jul 2024 16:21:17 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 29C5EF802DB; Mon, 29 Jul 2024 16:18:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E2050F80269
	for <alsa-devel@alsa-project.org>; Mon, 29 Jul 2024 16:15:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E2050F80269
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=baylibre-com.20230601.gappssmtp.com
 header.i=@baylibre-com.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=g6nPZhVT
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-3685a564bafso1452707f8f.3
        for <alsa-devel@alsa-project.org>;
 Mon, 29 Jul 2024 07:15:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1722262533;
 x=1722867333; darn=alsa-project.org;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=PEE5YCygicDy/XBXKqh7m+z9CwXQT4fXt6CN+8nkicI=;
        b=g6nPZhVTrqnyN9+vDAlz/ynmPHm3uvxzaIdkW1ptYf3QBdpemZqultaQC3k279j945
         u5r+5acJwsrjOijb+MUFrbC8lhSJruWEgwpICueQJkOmakpknw8sq+18Z7HXpie6aquR
         xOfERQDgl9EZKzDLpf3z8pF7tx5vyYgOdDktWQBrzJ4slEb/Ye2Seli0A/v/exlRdbBb
         EPgBOExNnls/6oDK5314I+LXzaG35OqkqVVYhFfDnxBms8dllHZRkFTflIyKU73YkAUk
         Rkl6Nyi5dp1O354fTR6wSwG78vZ6M8zNnL0Q/VwGAKwEKETJKU9wmhi3t1CDVhkbNkhX
         HWzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722262533; x=1722867333;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PEE5YCygicDy/XBXKqh7m+z9CwXQT4fXt6CN+8nkicI=;
        b=bXkuNGJJEH1BMG5QkCYUtKxDdPz35RRea5prFVF53qiDabHlb9YbV7Qet5icAwheh3
         9aPmZHw+M0NLfJxaXTIU45wJRZ8vMPxGVULfwiWvwspxunCPBmaBNfSFnTABZIIMmHYv
         4tCViE3/99JV5qP3EQe6TPlL218wlFZIkXuD4lPWWUw2cJTxNCR3aDyzYXpLEOQQoUNg
         xdQGrXVw6gaH/h8qvguzfoQConaKcfNRyvvwzMHIZDjCLas3ZrSrMf4auDPgxF2ZDgjt
         nZijiB72IcXwzcc/sH1SWunzTrays6EkE/H27QQII3MN/8g1pyXz1OqaRdbCFw6/JheG
         itXQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCV0PbMNk1CB98IK5Wmu7rBgdDYgCuoU+9O7VGoLHlq7AP/UY+Sn0bQBs5MpU19QsqVtzAD4mup2tnCiXm0W3F4Y67I/0GAshgXQYeM=
X-Gm-Message-State: AOJu0YwjTFjH4uBzVzGznQyuPaMUQQE4aImGkM2UUCEi4EjJajf9WIa1
	rHqq2hBhQLa4xHjbrBjhZwCE1MT0J3x3Lcn6nAh3FuwAqbDtX/dK3ypMG37vIXM=
X-Google-Smtp-Source: 
 AGHT+IGvhW6W5lhj8wCPR9kGfAvnftNlZn/nJWbDUFlhvd5DqspfoHe3v4BYeRLrWpFDIhKz3FbMyw==
X-Received: by 2002:a5d:5184:0:b0:368:6596:c60c with SMTP id
 ffacd0b85a97d-36b5cefdef5mr5201083f8f.30.1722262532993;
        Mon, 29 Jul 2024 07:15:32 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:abd3:cdc8:2363:54ef])
        by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-36b367fc8a7sm12284340f8f.59.2024.07.29.07.15.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jul 2024 07:15:32 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Arseniy Krasnov <avkrasnov@salutedevices.com>, Mark Brown
 <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,  Jaroslav Kysela <perex@perex.cz>,
  Takashi Iwai <tiwai@suse.com>,  Neil Armstrong
 <neil.armstrong@linaro.org>,  Kevin Hilman <khilman@baylibre.com>,  Martin
 Blumenstingl <martin.blumenstingl@googlemail.com>,
  <alsa-devel@alsa-project.org>,  <linux-sound@vger.kernel.org>,
  <linux-arm-kernel@lists.infradead.org>,
  <linux-amlogic@lists.infradead.org>,  <linux-kernel@vger.kernel.org>,
  <kernel@sberdevices.ru>,  <oxffffaa@gmail.com>
Subject: Re: [PATCH v1] ASoC: meson: axg-fifo: set option to use raw spinlock
In-Reply-To: <20240729131652.3012327-1-avkrasnov@salutedevices.com> (Arseniy
	Krasnov's message of "Mon, 29 Jul 2024 16:16:52 +0300")
References: <20240729131652.3012327-1-avkrasnov@salutedevices.com>
Date: Mon, 29 Jul 2024 16:15:31 +0200
Message-ID: <1ja5i0wags.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
Message-ID-Hash: W4NLAMEDZOQNI7LBJPVD4APV54KAX32Y
X-Message-ID-Hash: W4NLAMEDZOQNI7LBJPVD4APV54KAX32Y
X-MailFrom: jbrunet@baylibre.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/W4NLAMEDZOQNI7LBJPVD4APV54KAX32Y/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon 29 Jul 2024 at 16:16, Arseniy Krasnov <avkrasnov@salutedevices.com> wrote:

> Raw spinlock is needed here, because with enabled PREEMPT_RT,
> spinlock_t become preemptible, but this regmap lock could be
> acquired in IRQ handler. Found by lockdep:

Assuming I understand the problem correctly, any driver with an IRQ and
using mmio regmaps would be subject to this problem, isn't it ?

That does not seems particularily specific to this driver, so changing
just this one like that does not make a lot of sense to me.

Maybe mmio regmap should '.use_raw_spinlock = true' by default when
'.fast_io' is set ?

Mark, what is your opinion on this ? I guess it is not the first time
this occurs ?

>
> [ ] =============================
> [ ] [ BUG: Invalid wait context ]
> [ ] 6.9.9-sdkernel #1 Tainted: G O
> [ ] -----------------------------
> [ ] aplay/413 is trying to lock:
> [ ] ffff000003930018 (axg_fifo:356:(&axg_fifo_regmap_cfg)->lock){....}-{3:3},c
> [ ] other info that might help us debug this:
> [ ] context-{2:2}
> [ ] no locks held by aplay/413.
> [ ] stack backtrace:
> [ ] CPU: 0 PID: 413 Comm: aplay Tainted: G           O       6.9.9-kernel #1
> [ ] Hardware name: SberDevices SberBoom Mini (DT)
> [ ] Call trace:
> [ ]  dump_backtrace+0x98/0xf0
> [ ]  show_stack+0x18/0x24
> [ ]  dump_stack_lvl+0x90/0xd0
> [ ]  dump_stack+0x18/0x24
> [ ]  __lock_acquire+0x9dc/0x1f10
> [ ]  lock_acquire.part.0+0xe8/0x228
> [ ]  lock_acquire+0x68/0x84
> [ ]  _raw_spin_lock_irqsave+0x60/0x88
> [ ]  regmap_lock_spinlock+0x18/0x2c
> [ ]  regmap_read+0x3c/0x78
> [ ]  axg_fifo_pcm_irq_block+0x4c/0xc8
> [ ]  __handle_irq_event_percpu+0xa4/0x2f8
> [ ]  handle_irq_event+0x4c/0xbc
> [ ]  handle_fasteoi_irq+0xa4/0x23c
> [ ]  generic_handle_domain_irq+0x2c/0x44
> [ ]  gic_handle_irq+0x40/0xc4
> [ ]  call_on_irq_stack+0x24/0x4c
> [ ]  do_interrupt_handler+0x80/0x84
> [ ]  el0_interrupt+0x5c/0x124
> [ ]  __el0_irq_handler_common+0x18/0x24
> [ ]  el0t_32_irq_handler+0x10/0x1c
> [ ]  el0t_32_irq+0x194/0x198
>
> Signed-off-by: Arseniy Krasnov <avkrasnov@salutedevices.com>
> ---
>  sound/soc/meson/axg-fifo.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/sound/soc/meson/axg-fifo.c b/sound/soc/meson/axg-fifo.c
> index ecb3eb7a9723d..a22298f74b35a 100644
> --- a/sound/soc/meson/axg-fifo.c
> +++ b/sound/soc/meson/axg-fifo.c
> @@ -328,6 +328,7 @@ static const struct regmap_config axg_fifo_regmap_cfg = {
>  	.val_bits	= 32,
>  	.reg_stride	= 4,
>  	.max_register	= FIFO_CTRL2,
> +	.use_raw_spinlock = true,
>  };
>  
>  int axg_fifo_probe(struct platform_device *pdev)

-- 
Jerome
