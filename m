Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 31EFE50E53F
	for <lists+alsa-devel@lfdr.de>; Mon, 25 Apr 2022 18:11:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B004917A7;
	Mon, 25 Apr 2022 18:10:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B004917A7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1650903060;
	bh=H5bBB5Z3PROA3t6gqr4Z7eBSl3Wn5tIJOZLRFf1FfK0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Orc3qz4PRcLSAPC4ng9VATL8AjoBpdQ98KK+ZWGKPOsTZgXC859OT4m+8Satf4Kwm
	 HC98KjYtfPWOqcF2IowZpQMJBpv+ws/dx1rWDCEbP/8ZY6H0jxFINg22bEtmrjlKKb
	 v5vjRZFxtO6iyVNsJTlTAF3byI8rN3djacaMqHEI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 578D4F80152;
	Mon, 25 Apr 2022 18:10:02 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CC4C5F8016A; Mon, 25 Apr 2022 18:09:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,PRX_BODY_135,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-yw1-x1133.google.com (mail-yw1-x1133.google.com
 [IPv6:2607:f8b0:4864:20::1133])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C626CF8014B
 for <alsa-devel@alsa-project.org>; Mon, 25 Apr 2022 18:09:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C626CF8014B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="UOw5xEgr"
Received: by mail-yw1-x1133.google.com with SMTP id
 00721157ae682-2f7c57ee6feso58939417b3.2
 for <alsa-devel@alsa-project.org>; Mon, 25 Apr 2022 09:09:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=T+YGyyvxmVQsjoghQqTNW1wKDQoME3+KpFRO6Pk4ojM=;
 b=UOw5xEgrezVMySsWbd7cQD1CpEjNyLxCCoI6oPAr8GLZz1AK7woJPeLzkysiCJ/fCH
 jg5VdERY072dJgMScLn/8Wyu9cpQKldbZJIRfucUcyZB+jXaf67NiAstomWuMxemFa6a
 pmkVOpohdd5uXCGYNPB4kGih9e6VNKbEe0KwlStq6nsqlelDF+AIox9Zq+cqv0T4Dlg8
 Hkghu0N6XX90phMspeEOuMWq6PA+/upYOZb1m3PNQsMckH0Ueyvxg/R1Gs/0fIwUpFbK
 XuTVWiE5a5yjSrA0k9SyLSoYFSzYX4W+fehemBKMukB8elacGxIjjVkmrvwCjrc0rxK0
 y7SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=T+YGyyvxmVQsjoghQqTNW1wKDQoME3+KpFRO6Pk4ojM=;
 b=5Z45oY+WK6EO/460PMPMcup257t0t2UmewlXBbEbAbifB3TfyVaN08EUGfgD9zIGlo
 5lJxpgH0D4NnMjMspSe21unmNaXFv3oCHq6hUksNgPZXv7tUtOS2Ycj0GZHOaPrKoBzI
 QOmm0NY24AWSFfHvmXkMy2BWhzR1rAeVlhy2rJOgoZCZ8XrroQNj8XLlCQeES8lRGV6E
 VMrACCrLOcGhActCevAEn5czZcqFtOuJj+lyhY0duBi1sHmSYl/f9psDx2V1Zr1IbUj5
 r6VOX6xNxG0DHLjSt0eKWBnRxQ5caa3Kfi2frWwvB+i3tFgb74iItyBkokYfADrI369d
 UYZg==
X-Gm-Message-State: AOAM532L4ZQiOKeb9QA+989n0NfoyX0aDI4V0JhoQJtKmTlY045vn5s0
 spDP9CcHCwMAbN1OxhMSEvXRmtaC1ulG0mKnqEs=
X-Google-Smtp-Source: ABdhPJwSk+XEHjpr8/LhP/EKsZTQ6fi7CuJfqMiakpJg7HM+CpmMFudO8mcVoBL6s1KoWOeKBCr8MKF+xn9qMETzjn8=
X-Received: by 2002:a81:9210:0:b0:2f4:d8f7:98e9 with SMTP id
 j16-20020a819210000000b002f4d8f798e9mr17613086ywg.265.1650902989991; Mon, 25
 Apr 2022 09:09:49 -0700 (PDT)
MIME-Version: 1.0
References: <20220421203555.29011-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20220421203555.29011-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <CAMuHMdX4_PKsGGRj6yGhDGfaRD-6PqiJeCnKq0yUicfMutOP4g@mail.gmail.com>
In-Reply-To: <CAMuHMdX4_PKsGGRj6yGhDGfaRD-6PqiJeCnKq0yUicfMutOP4g@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Mon, 25 Apr 2022 17:09:23 +0100
Message-ID: <CA+V-a8uJM0etygB-v+rs0+EKY6_tz90wH_ZOVH8Zbc8dQPmQGw@mail.gmail.com>
Subject: Re: [PATCH 1/3] ASoC: sh: rz-ssi: Drop unused macros
To: Geert Uytterhoeven <geert@linux-m68k.org>
Content-Type: text/plain; charset="UTF-8"
Cc: ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Pavel Machek <pavel@denx.de>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Takashi Iwai <tiwai@suse.com>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Mark Brown <broonie@kernel.org>, Biju Das <biju.das.jz@bp.renesas.com>,
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

Hi Geert,

Thank you for the review.

On Mon, Apr 25, 2022 at 1:49 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>
> Hi Prabhakar,
>
> On Fri, Apr 22, 2022 at 7:32 PM Lad Prabhakar
> <prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
> > Drop unused macros SSIFSR_TDC and SSIFSR_RDC.
> >
> > Reported-by: Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Thanks for your patch!
>
> What does this fix?
> Is the real issue that there are 32 FIFO entries, and the TDC and RDC
> fields are 6 bits wide, while the mask uses 0x1f instead of 0x3f?
>
I was in two minds here as you have already spotted the masks are
incorrect, instead of fixing the masks I choose to drop the macros
itself as they were not used. Let me know what are your thoughts on
this.

Cheers,
Prabhakar

> > --- a/sound/soc/sh/rz-ssi.c
> > +++ b/sound/soc/sh/rz-ssi.c
> > @@ -59,9 +59,7 @@
> >  #define SSIFSR_RDC_MASK                0x3f
> >  #define SSIFSR_RDC_SHIFT       8
> >
> > -#define SSIFSR_TDC(x)          (((x) & 0x1f) << 24)
> >  #define SSIFSR_TDE             BIT(16)
> > -#define SSIFSR_RDC(x)          (((x) & 0x1f) << 8)
> >  #define SSIFSR_RDF             BIT(0)
> >
> >  #define SSIOFR_LRCONT          BIT(8)
>
> Gr{oetje,eeting}s,
>
>                         Geert
>
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
>
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                 -- Linus Torvalds
