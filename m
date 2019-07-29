Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DB2E78F7A
	for <lists+alsa-devel@lfdr.de>; Mon, 29 Jul 2019 17:37:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CEB181822;
	Mon, 29 Jul 2019 17:36:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CEB181822
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1564414639;
	bh=eUc098Lgj/taXq+Dboi4Y1TBXvtp99JbwwObqHs/cwI=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=uM0VVZ3o5ba2BW5e668lr1ipZamBPZPzSG/Mtba1zCf/HOYM1+qkke7Gf13sqnWLJ
	 RQdIWROGWLbJhErG9HPWQC246UZagRGYjFUXrjv3+A8H7+WSEYFZzWPBUfX6aBj1nx
	 jXln2Db4nPqKUc5uY7JeGwTyVmNjtT4XEWpDxAR8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E2005F8048E;
	Mon, 29 Jul 2019 17:35:35 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7F576F8048D; Mon, 29 Jul 2019 17:35:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
 FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,PRX_BODY_135,RCVD_IN_MSPIKE_H2,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
 [209.85.128.67])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8B719F800E4
 for <alsa-devel@alsa-project.org>; Mon, 29 Jul 2019 17:35:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8B719F800E4
Received: by mail-wm1-f67.google.com with SMTP id v19so53906199wmj.5
 for <alsa-devel@alsa-project.org>; Mon, 29 Jul 2019 08:35:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=URFGNdCuc17w2MBn3hDVUpGm+HQA2LH5HoY9qPXf7MA=;
 b=hgB+AqfMbDTlZ3AKOGRBcQ8ywrhJ666rHVwyC62JM7bv82v2iCLpc0WqHU802+G8sO
 DMvMUzNLm7qekk2K7gD3FE4PuXCByTGEtH4XMMzI/I5uHuWpB7QrAbhG3VVeGX/9wDap
 IuIRpW8XKiThgEKur+IMzvZMprovJ35l6kl6cSe4cNnVXjxgGcpovSD7uNxB2tktb7Y3
 PP2eWnaP/KyjD+TpA71hUKFS+12eJE628x9Mv/Y23aHoH/BVBaTjpVPtZ9YjtPzECW4n
 3Rps5QedyTRb5bf3uLtGslzYinfyFPRnk/u46D6o1TTx4b3lwY5gnCstIdqMEdCDLQc4
 QqWQ==
X-Gm-Message-State: APjAAAULQ8dNsYsNAjpC8y41MJAu0HYmFkp/Jp6/3MVIqYxQCk0oDbFS
 eIRLyyV/VJzn6XrY1M+PHzx34Mm03poiUDL44E4n0Oyx
X-Google-Smtp-Source: APXvYqw7qmwWisTaRdLSAWkSTuob8FAbalj1bCbmoQk6YVPW+oWh9x4EXQXccBLfkn/tUQWVE662tyJJHi/aThNuUV8=
X-Received: by 2002:a1c:a7c6:: with SMTP id
 q189mr101660403wme.146.1564414528469; 
 Mon, 29 Jul 2019 08:35:28 -0700 (PDT)
MIME-Version: 1.0
References: <20190729143320.GA8212@embeddedor>
In-Reply-To: <20190729143320.GA8212@embeddedor>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 29 Jul 2019 17:35:16 +0200
Message-ID: <CAMuHMdWAboq1YxVVJUop0woJTcantfpftVoR8T5qm3KsAMyCPg@mail.gmail.com>
To: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Cc: ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 Kees Cook <keescook@chromium.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Takashi Iwai <tiwai@suse.com>, linux-m68k <linux-m68k@lists.linux-m68k.org>
Subject: Re: [alsa-devel] [PATCH] sound: dmasound_atari: Mark expected
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

Hi Gustavo,

Thanks for your patch!

On Mon, Jul 29, 2019 at 4:33 PM Gustavo A. R. Silva
<gustavo@embeddedor.com> wrote:
> Mark switch cases where we are expecting to fall through.
>
> This patch fixes the following warning:
>
> sound/oss/dmasound/dmasound_atari.c: warning: this statement may fall
> through [-Wimplicit-fallthrough=]:  => 1449:24
>
> Notice that, in this particular case, the code comment is
> modified in accordance with what GCC is expecting to find.

Have you compile-tested this?

This doesn't work with gcc version 8.2.0 (Ubuntu 8.2.0-1ubuntu2~18.04).
Turns out the warning only goes away when converting the indentation
of the switch() statement to match kernel style... Silly gcc...

> Reported-by: Geert Uytterhoeven <geert@linux-m68k.org>
> Signed-off-by: Gustavo A. R. Silva <gustavo@embeddedor.com>
> ---
>  sound/oss/dmasound/dmasound_atari.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/sound/oss/dmasound/dmasound_atari.c b/sound/oss/dmasound/dmasound_atari.c
> index 83653683fd68..b5845e904ba1 100644
> --- a/sound/oss/dmasound/dmasound_atari.c
> +++ b/sound/oss/dmasound/dmasound_atari.c
> @@ -1449,7 +1449,7 @@ static int FalconMixerIoctl(u_int cmd, u_long arg)
>                 tt_dmasnd.input_gain =
>                         RECLEVEL_VOXWARE_TO_GAIN(data & 0xff) << 4 |
>                         RECLEVEL_VOXWARE_TO_GAIN(data >> 8 & 0xff);
> -               /* fall thru, return set value */
> +               /* fall through - return set value */
>             case SOUND_MIXER_READ_MIC:
>                 return IOCTL_OUT(arg,
>                         RECLEVEL_GAIN_TO_VOXWARE(tt_dmasnd.input_gain >> 4 & 0xf) |

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
