Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A2F3150E0B8
	for <lists+alsa-devel@lfdr.de>; Mon, 25 Apr 2022 14:50:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3D7E41721;
	Mon, 25 Apr 2022 14:49:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3D7E41721
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1650891033;
	bh=ebYFm1guNAABOJu9yjeKh0wO4lMatsMjHyqhVsgncnI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bOpy3bYgXUb+X1zLA+KhxgrGLHJFoQbm3WnzATOa10vOmMKzmISs11fPshDzmSUPT
	 GcecvzhoWjlUdEtHoANSGiIeDXhLOLBJgJ1+9YoYLThwzqCaeRrEbDdB5b3+NAYSoQ
	 yhuxQSHLSEiEvuOux8e3MqYzbAoxqdxbxcog4D+w=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9BA70F8016B;
	Mon, 25 Apr 2022 14:49:34 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 85B1CF8016A; Mon, 25 Apr 2022 14:49:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
 FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,PRX_BODY_135,SPF_HELO_NONE,
 SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com
 [209.85.219.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A6E0EF800CB
 for <alsa-devel@alsa-project.org>; Mon, 25 Apr 2022 14:49:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A6E0EF800CB
Received: by mail-qv1-f51.google.com with SMTP id r8so3746510qvx.10
 for <alsa-devel@alsa-project.org>; Mon, 25 Apr 2022 05:49:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=NPorSfLzynlTTFLcIqwhfwbS6R4JDxHEiU+bfxItonI=;
 b=27d1Ud85OF4BYUzfIVaAcGn75456IRtKnWjqX0W4CZpGJZREdNSCBf7tJCGeOsWkw6
 bm8kgoPOsZR4LH9cMqvGFKDg8Me7enklpXQCyU9Zqrmody2Enr8vGVVivGrTFYVw+POx
 sBZ66rP9ys6Gt7kLxAmbmIT2OzK5uxmOJRgUzJ/gVWPLMSaK6IGK22sq6ibZAXjyesuK
 oF1aeBOjHL9GrnYQBJeZFCvdHk68DK+ea9EvY/gV9TKzcx4XpygnCZIQabCa9aIptvIr
 l0QqGQLhf6t0/174pYahd8fPTBcRk9z4LNEdw1dljSyTi8V9mcYuyhMfuixGQTaTuBIt
 4VFA==
X-Gm-Message-State: AOAM5327yA4+aNd162nDeTJlUrN7rBGqcoGlj1NXbIAQdKvlH2xn4fkg
 HiakW6dOUXckQrkVKOIXKV+q5EPPVNaqKA==
X-Google-Smtp-Source: ABdhPJwDHJVvXkuJtLMhnJA/FR22IpcwqBO5Jzvgld/gH2VzfmS5bWOJdsbQ/ez/KDO+n9MZ8tSfOQ==
X-Received: by 2002:ad4:5ded:0:b0:446:3df5:b10 with SMTP id
 jn13-20020ad45ded000000b004463df50b10mr12220147qvb.102.1650890965394; 
 Mon, 25 Apr 2022 05:49:25 -0700 (PDT)
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com.
 [209.85.219.176]) by smtp.gmail.com with ESMTPSA id
 h1-20020a05620a244100b0069f4fe763aasm2000312qkn.78.2022.04.25.05.49.24
 for <alsa-devel@alsa-project.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Apr 2022 05:49:24 -0700 (PDT)
Received: by mail-yb1-f176.google.com with SMTP id w187so17422115ybe.2
 for <alsa-devel@alsa-project.org>; Mon, 25 Apr 2022 05:49:24 -0700 (PDT)
X-Received: by 2002:a25:8087:0:b0:641:dd06:577d with SMTP id
 n7-20020a258087000000b00641dd06577dmr15589591ybk.207.1650890964362; Mon, 25
 Apr 2022 05:49:24 -0700 (PDT)
MIME-Version: 1.0
References: <20220421203555.29011-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20220421203555.29011-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20220421203555.29011-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 25 Apr 2022 14:49:12 +0200
X-Gmail-Original-Message-ID: <CAMuHMdX4_PKsGGRj6yGhDGfaRD-6PqiJeCnKq0yUicfMutOP4g@mail.gmail.com>
Message-ID: <CAMuHMdX4_PKsGGRj6yGhDGfaRD-6PqiJeCnKq0yUicfMutOP4g@mail.gmail.com>
Subject: Re: [PATCH 1/3] ASoC: sh: rz-ssi: Drop unused macros
To: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Cc: ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 Pavel Machek <pavel@denx.de>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Prabhakar <prabhakar.csengg@gmail.com>, Mark Brown <broonie@kernel.org>,
 Biju Das <biju.das.jz@bp.renesas.com>,
 Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
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

Hi Prabhakar,

On Fri, Apr 22, 2022 at 7:32 PM Lad Prabhakar
<prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
> Drop unused macros SSIFSR_TDC and SSIFSR_RDC.
>
> Reported-by: Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Thanks for your patch!

What does this fix?
Is the real issue that there are 32 FIFO entries, and the TDC and RDC
fields are 6 bits wide, while the mask uses 0x1f instead of 0x3f?

> --- a/sound/soc/sh/rz-ssi.c
> +++ b/sound/soc/sh/rz-ssi.c
> @@ -59,9 +59,7 @@
>  #define SSIFSR_RDC_MASK                0x3f
>  #define SSIFSR_RDC_SHIFT       8
>
> -#define SSIFSR_TDC(x)          (((x) & 0x1f) << 24)
>  #define SSIFSR_TDE             BIT(16)
> -#define SSIFSR_RDC(x)          (((x) & 0x1f) << 8)
>  #define SSIFSR_RDF             BIT(0)
>
>  #define SSIOFR_LRCONT          BIT(8)

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
