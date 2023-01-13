Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 526586691E8
	for <lists+alsa-devel@lfdr.de>; Fri, 13 Jan 2023 09:55:04 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 448A5A549;
	Fri, 13 Jan 2023 09:54:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 448A5A549
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1673600103;
	bh=OIFt1Z2spvVreKCzrmblTTGK6ZAj5WV2ytjw9N0OX0M=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=q8f8rQMdAbLhQSsox4PoqbUSTgHeTjDCdhxiR0URdEFjWDAQqkRGJahxFp/wSKwjf
	 8uI7rfS2b6CcGALLr/YhTg/Y1pCuWCfx/+iSgUb8yefoOcNVVKjveiMQgC+dhL3EVb
	 kdnJ4upgQc+2BmUj9ZF94RwJOOgMLP6cRsgdyT1c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CE059F8019B;
	Fri, 13 Jan 2023 09:54:11 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 54AAFF80425; Fri, 13 Jan 2023 09:54:10 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
 FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,
 RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=no
 autolearn_force=no version=3.4.6
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com
 [209.85.219.41])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BA129F8019B
 for <alsa-devel@alsa-project.org>; Fri, 13 Jan 2023 09:54:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BA129F8019B
Received: by mail-qv1-f41.google.com with SMTP id p96so2335514qvp.13
 for <alsa-devel@alsa-project.org>; Fri, 13 Jan 2023 00:54:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=iHH87Wz4eqdDYk3yPRdInSdOf4/Qu/uaLfX4LZwjHtY=;
 b=tT7hSr+2o9Nsz5+mWMj1uUZDZvTmC3rwgekofHASkyvE3fZyWvQlIiUH1J9pEyf3nb
 vNZ8lOj59iWiwU+TO/A2AlkvDmnE2JpeziwvBYcK/h5mSO7Kdnhaw3nCFxNREHvMJ+UU
 y2+l6bfoy+jP7wesoOqAoTQqM5NdQp9KaAj3DbNgQQiq2wyCI9NtKrzBnymyGdwNK3ML
 dOHpeKO6YiK/aU2uGArx3JXiPEFzGRIWaxOaYEvt7RUfT0eftWq/zK0SdHi/gciV+CYZ
 lfjtN8xqZNiwpsqbnaIa/ol9wlivcOQc+JdHQiBY78xu8++XjuZd6SgcL8GIiZjNnTiA
 qVHA==
X-Gm-Message-State: AFqh2kr4n1HOXYpWTCjz6fDYr9wRJyiE1gM3DMuK80y+JNqyW/+9U6Jy
 RuN5wM7JrGNTF1TwWma7vATg7LP8d4CqFQ==
X-Google-Smtp-Source: AMrXdXvjwUWaH23UMmTxNuMbspXTRTgOtAo6RtPkosHrbzz1iK1puhr70krjJMjOPd4rX9WyGiM3qQ==
X-Received: by 2002:a0c:c388:0:b0:531:9d43:d8e0 with SMTP id
 o8-20020a0cc388000000b005319d43d8e0mr59751388qvi.31.1673600046817; 
 Fri, 13 Jan 2023 00:54:06 -0800 (PST)
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com.
 [209.85.219.169]) by smtp.gmail.com with ESMTPSA id
 64-20020a370c43000000b006cfc1d827cbsm12127037qkm.9.2023.01.13.00.54.05
 for <alsa-devel@alsa-project.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 Jan 2023 00:54:06 -0800 (PST)
Received: by mail-yb1-f169.google.com with SMTP id p188so21635460yba.5
 for <alsa-devel@alsa-project.org>; Fri, 13 Jan 2023 00:54:05 -0800 (PST)
X-Received: by 2002:a25:d095:0:b0:7b6:daae:ad50 with SMTP id
 h143-20020a25d095000000b007b6daaead50mr3261996ybg.89.1673600045570; Fri, 13
 Jan 2023 00:54:05 -0800 (PST)
MIME-Version: 1.0
References: <20230113062339.1909087-1-hch@lst.de>
 <20230113062339.1909087-20-hch@lst.de>
In-Reply-To: <20230113062339.1909087-20-hch@lst.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 13 Jan 2023 09:53:54 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWLZF3uF8+Bs8FL__x=MyZPPBUqX-Q6XVQS3B08re-vZw@mail.gmail.com>
Message-ID: <CAMuHMdWLZF3uF8+Bs8FL__x=MyZPPBUqX-Q6XVQS3B08re-vZw@mail.gmail.com>
Subject: Re: [PATCH 19/22] fbdev: remove sh7760fb
To: Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Cc: linux-fbdev@vger.kernel.org, Rich Felker <dalias@libc.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>, linux-sh@vger.kernel.org,
 alsa-devel@alsa-project.org, dri-devel@lists.freedesktop.org,
 linux-mtd@lists.infradead.org, linux-i2c@vger.kernel.org,
 linux-arch@vger.kernel.org, Yoshinori Sato <ysato@users.sourceforge.jp>,
 linux-serial@vger.kernel.org, linux-input@vger.kernel.org,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-watchdog@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
 linux-gpio@vger.kernel.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-spi@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 netdev@vger.kernel.org, dmaengine@vger.kernel.org, linux-rtc@vger.kernel.org
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Hi Christoph,

On Fri, Jan 13, 2023 at 7:25 AM Christoph Hellwig <hch@lst.de> wrote:
> Now that arch/sh is removed this driver is dead code.
>
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Thanks for your patch!

> --- a/drivers/video/fbdev/Kconfig
> +++ b/drivers/video/fbdev/Kconfig
> @@ -1861,7 +1861,7 @@ config FB_W100
>  config FB_SH_MOBILE_LCDC
>         tristate "SuperH Mobile LCDC framebuffer support"
>         depends on FB && HAVE_CLK && HAS_IOMEM
> -       depends on SUPERH || ARCH_RENESAS || COMPILE_TEST
> +       depends on ARCH_RENESAS || COMPILE_TEST

Nit: this part should be a separate patch.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
