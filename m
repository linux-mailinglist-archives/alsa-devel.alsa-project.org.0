Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C71BD4F16A4
	for <lists+alsa-devel@lfdr.de>; Mon,  4 Apr 2022 15:58:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6399616CA;
	Mon,  4 Apr 2022 15:58:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6399616CA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1649080737;
	bh=HyEQWxdGR2ZgP/ErykllsbEDEwioL0bja82aVJIN1GE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=vVow4ZlqP7ydzoRj3W6FaTKQ1E9Fk+bmk5TLmNUnHqwGSBTZHeKHcJ+wv/Lw/anZk
	 GFYdbQK/8KlXfLXuxSgvTpotX3e2D/ZVJuYM1bRU9+/0M+zDRogRO/8TFikIt149ZO
	 4VxPxzZCiszUV0IIvE0uXycjV2mXuiHfTZwWBeiQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CAD39F801F7;
	Mon,  4 Apr 2022 15:57:58 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 72612F80162; Mon,  4 Apr 2022 15:57:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
 FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,PRX_BODY_135,SPF_HELO_NONE,
 SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com
 [209.85.222.182])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4702CF800D1
 for <alsa-devel@alsa-project.org>; Mon,  4 Apr 2022 15:57:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4702CF800D1
Received: by mail-qk1-f182.google.com with SMTP id h196so7623061qke.12
 for <alsa-devel@alsa-project.org>; Mon, 04 Apr 2022 06:57:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=D3y+W+WKQd7hPp6d6usVi59eLjz9RE6hzmPFo/q5LYE=;
 b=HTnMntZ9HrR30KED3GyQAYYRowFOoVowO57mC03wlAe7BJDwT2Av017XUjIcTsBntw
 VcSJnSTDksZ3CHgM7Pwdh0Qm+UquTyRw4jylk68YRPZXPkJ7yiziQWAkzpQVjiCcyHbB
 BBKozyhgfyhumzAST7/wUMeKOBlp+E7kp+Jf+L/iBBcDyw3QHcQc38BGqKePRYsLw6pQ
 uX8c/+mzysNPoiKuTk67phaOOAP0QAmBNOm3dQ8gzwEgawvVIEV1ny9GESQ00iV75+Wt
 TxMzvXcBsVpd4aH0d4snOUdZHBRc7zqQzlAUNcB9wUWI1VWhs/7kWH4dqCTP3KmJSEan
 D6sA==
X-Gm-Message-State: AOAM532MdVHjHuxvE7KM0DLKjA+yLT15l1gsfxY8Kcqrka70xHiph+05
 xoozYFH5UIINu47+ZhyO/T0mMyv5leBuag==
X-Google-Smtp-Source: ABdhPJy2ywUJB284wAAkl5OoaWzVyJb5/5XyoGK2wFmAvFOLupq2C7sg5sEzuSny8dlF4uRay4yM6w==
X-Received: by 2002:a05:620a:44d4:b0:67d:ba87:e4ee with SMTP id
 y20-20020a05620a44d400b0067dba87e4eemr14129434qkp.734.1649080667932; 
 Mon, 04 Apr 2022 06:57:47 -0700 (PDT)
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com.
 [209.85.219.181]) by smtp.gmail.com with ESMTPSA id
 c11-20020a05620a134b00b006809a92a94fsm6108486qkl.79.2022.04.04.06.57.47
 for <alsa-devel@alsa-project.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Apr 2022 06:57:47 -0700 (PDT)
Received: by mail-yb1-f181.google.com with SMTP id o62so2722938ybo.2
 for <alsa-devel@alsa-project.org>; Mon, 04 Apr 2022 06:57:47 -0700 (PDT)
X-Received: by 2002:a5b:24e:0:b0:63d:cba0:3d55 with SMTP id
 g14-20020a5b024e000000b0063dcba03d55mr4760604ybp.613.1649080667232; Mon, 04
 Apr 2022 06:57:47 -0700 (PDT)
MIME-Version: 1.0
References: <20220403222510.12670-1-rdunlap@infradead.org>
In-Reply-To: <20220403222510.12670-1-rdunlap@infradead.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 4 Apr 2022 15:57:35 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUCdGKE04U4yMqv7TPUztwfih7aLwoTfEP5vcATW=CCxw@mail.gmail.com>
Message-ID: <CAMuHMdUCdGKE04U4yMqv7TPUztwfih7aLwoTfEP5vcATW=CCxw@mail.gmail.com>
Subject: Re: [PATCH v2] sound/oss/dmasound: fix build when drivers are mixed
 =y/=m
To: Randy Dunlap <rdunlap@infradead.org>
Content-Type: text/plain; charset="UTF-8"
Cc: ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 kernel test robot <lkp@intel.com>, Arnd Bergmann <arnd@arndb.de>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Takashi Iwai <tiwai@suse.com>
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
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Hi Randy,

On Mon, Apr 4, 2022 at 12:25 AM Randy Dunlap <rdunlap@infradead.org> wrote:
> When CONFIG_DMASOUND_ATARI=m and CONFIG_DMASOUND_Q40=y (or vice versa),
> dmasound_core.o can be built without dmasound_deinit() being defined,
> causing a build error:
>
> ERROR: modpost: "dmasound_deinit" [sound/oss/dmasound/dmasound_atari.ko] undefined!
>
> Modify dmasound_core.c so that dmasound_deinit() is always available.
>
> Suggested-by: Arnd Bergmann <arnd@arndb.de>
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>

Thanks for spending more time on this ;-)

> --- linux-next-20220401.orig/sound/oss/dmasound/dmasound_core.c
> +++ linux-next-20220401/sound/oss/dmasound/dmasound_core.c
> @@ -1424,27 +1424,29 @@ int dmasound_init(void)
>         return 0;
>  }
>
> -#ifdef MODULE
> -
>  void dmasound_deinit(void)
>  {
> +#ifdef MODULE

I think this #ifdef must not be added: if the modular subdriver
calls dmasound_deinit(), the resources should be freed, else a subsequent
reload of the subdriver will not work.  This does mean all variables
protected by "#ifdef MODULE" must exist unconditionally.

Alternatively, the test can be replaced by "#ifdef CONFIG_MODULES".

One big caveat below...

>         if (irq_installed) {
>                 sound_silence();
>                 dmasound.mach.irqcleanup();
>                 irq_installed = 0;
>         }
> +#endif
>
>         write_sq_release_buffers();
>
> +#ifdef MODULE

Likewise.

>         if (mixer_unit >= 0)
>                 unregister_sound_mixer(mixer_unit);
>         if (state_unit >= 0)
>                 unregister_sound_special(state_unit);
>         if (sq_unit >= 0)
>                 unregister_sound_dsp(sq_unit);
> +#endif
>  }
>
> -#else /* !MODULE */
> +#ifndef MODULE
>
>  static int dmasound_setup(char *str)
>  {

> --- linux-next-20220401.orig/sound/oss/dmasound/dmasound.h
> +++ linux-next-20220401/sound/oss/dmasound/dmasound.h
> @@ -88,11 +88,7 @@ static inline int ioctl_return(int __use
>       */
>
>  extern int dmasound_init(void);
> -#ifdef MODULE
>  extern void dmasound_deinit(void);
> -#else
> -#define dmasound_deinit()      do { } while (0)
> -#endif
>
>  /* description of the set-up applies to either hard or soft settings */

... Below, there is:

    typedef struct {
        [...]
    #ifdef MODULE
        void (*irqcleanup)(void);
    #endif
        [...]
    } MACHINE;

This means the MACHINE struct is not compatible between builtin
and modular code :-(  Hence the "#ifdef MODULE" should be removed,
or replaced by "#ifdef CONFIG_MODULES", too.

P.S. I think the younger myself is responsible for this mess.
     Please accept my apologies, after +25 years...

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
