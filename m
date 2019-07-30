Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F3C3B7A19C
	for <lists+alsa-devel@lfdr.de>; Tue, 30 Jul 2019 09:07:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7E7AF176E;
	Tue, 30 Jul 2019 09:06:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7E7AF176E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1564470431;
	bh=qvufo7HvMjEqB/hpdpm8mddycTaiHEdqyg8T4NogtUg=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=t1VEeKwNwNpjsrKTlF9zdaknIDWUB4pGHV2Ipb2cDLoBY/Bfm+7ddxl31LrPB9cgx
	 gT6E/LrYgP4ZYrOAzDC3jf3OWsTkWv2JQHo5pxeYu9Ol5bCmsas/u+1VDd4Ezvtr2b
	 6XOSOfMvMoAjQhDSKy3KH2XogeWy7e6iJNxQjQ6Q=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 69985F804CC;
	Tue, 30 Jul 2019 09:05:27 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 364CCF804CA; Tue, 30 Jul 2019 09:05:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.6 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
 FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,PRX_BODY_135,
 RCVD_IN_DNSWL_BLOCKED, SPF_HELO_NONE, SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
 [209.85.221.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D0931F80214
 for <alsa-devel@alsa-project.org>; Tue, 30 Jul 2019 09:05:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D0931F80214
Received: by mail-wr1-f65.google.com with SMTP id p13so64442024wru.10
 for <alsa-devel@alsa-project.org>; Tue, 30 Jul 2019 00:05:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=iWB4kphKN7udeRXcBiB5uX9NupkEYoNs++i9LuElms0=;
 b=ifWfSgjBxu6g01jF3N5Kru4mLmbXPrZdEiIJzh+3VvkR1iU6/y8BgGh2tM+PSW3QwG
 4tmX5zk1YMS5ABelmdzGXa8mnQz5BPDLO/jCFlsuwysjIsciwv9g1hMjLJxY8sIEDP0M
 wkwYOy0/N/w405G8SHBlQ0LCPFzkbCRiC00s3Hde3LeAm4dN4k65N73UBkrbgXOVbit9
 aHryhr9pzqioRaWVgb/KVpQwn7PRN6n8R8A7Tfllm2IfkRdCZebb+/0mLwmc6OqP5Hqf
 TYf+lAIlBt4u4hUHCT819oLxRipqS6BPHSK6zAnCemiXGoMUbMqFtlvDYagW1o5YlpRO
 D1Rg==
X-Gm-Message-State: APjAAAWQ/3gt2TR3ALxUiYW6NBOy8BLB94/6Ajk6OVU06SMdYzuoth4t
 9S/MrLi/6l61sfrW43JHjU9NmFx6OfrasShQtPw=
X-Google-Smtp-Source: APXvYqxA4UA7p0prw4c6NzYin/F7bh8MqYAWlv4qSe05+PF4h1IO2PnD8upJ/jsqgAtF4FdeJ6+W7tNqg3vH/w5+Hbs=
X-Received: by 2002:adf:ab51:: with SMTP id r17mr99183914wrc.95.1564470321909; 
 Tue, 30 Jul 2019 00:05:21 -0700 (PDT)
MIME-Version: 1.0
References: <20190729205454.GA5084@embeddedor>
In-Reply-To: <20190729205454.GA5084@embeddedor>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 30 Jul 2019 09:05:10 +0200
Message-ID: <CAMuHMdVuf7O3yRJ7EgjqQ=HdZSg8Qv4yVKmWM9b0McSYhX9MyA@mail.gmail.com>
To: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 Takashi Iwai <tiwai@suse.com>, Kees Cook <keescook@chromium.org>
Subject: Re: [alsa-devel] [PATCH v2] sound: dmasound_atari: Mark expected
	switch fall-through
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Mon, Jul 29, 2019 at 10:55 PM Gustavo A. R. Silva
<gustavo@embeddedor.com> wrote:
> Mark switch cases where we are expecting to fall through.
>
> This patch fixes the following warning (Building: m68k):
>
> sound/oss/dmasound/dmasound_atari.c: warning: this statement may fall
> through [-Wimplicit-fallthrough=]:  => 1449:24
>
> Notice that, in this particular case, the code comment is
> modified in accordance with what GCC is expecting to find.
>
> Reported-by: Geert Uytterhoeven <geert@linux-m68k.org>
> Signed-off-by: Gustavo A. R. Silva <gustavo@embeddedor.com>
> ---
> Changes in v2:
>  - Update code so switch and case statements are at the same indent.

Thanks, this time it works as expected.
Tested-by: Geert Uytterhoeven <geert@linux-m68k.org>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
