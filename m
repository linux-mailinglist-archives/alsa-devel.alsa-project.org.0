Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 618BA50E55C
	for <lists+alsa-devel@lfdr.de>; Mon, 25 Apr 2022 18:15:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D696717B6;
	Mon, 25 Apr 2022 18:14:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D696717B6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1650903321;
	bh=4WH4whkgyS+mu2ATurorvEmhmjnfAXxiGWbNHEoj8rM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bxyO+4jVQB/QWxKmCa/CsnJYe7vsliGDt8LPe+9uoW0Gh2BvFAjFe8SQsPhxZs+0m
	 lpvLCx1GBeuolgXyPgaEEy5mfi8NX121uN/cwqjsMMAgGTt20NSBofN/erZKRib6d0
	 4ewsZWCaf+c2nZ5mcFQn3eyK4Ax1d8wQf15vYPYc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 384CBF800FA;
	Mon, 25 Apr 2022 18:14:23 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BADB5F8016A; Mon, 25 Apr 2022 18:14:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
 FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,PRX_BODY_135,SPF_HELO_NONE,
 SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com
 [209.85.160.176])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C3F78F8014B
 for <alsa-devel@alsa-project.org>; Mon, 25 Apr 2022 18:14:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C3F78F8014B
Received: by mail-qt1-f176.google.com with SMTP id he8so3389286qtb.9
 for <alsa-devel@alsa-project.org>; Mon, 25 Apr 2022 09:14:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=D/eL9GDYjRFCawoptuTGZi10s0YbWkPFKn9Go18nZjU=;
 b=SHWw7ALO2lgxojapGnS+GxCypSo02RerxdG5sG7A4FQBwx/0b8rHVbS+bFd5HvePvB
 9Ht5uoLVcbfb3pyAyUyTZ4YnBwxOfZAFCRBV7mIZc+yVl0b8a0RcwCfm0SB5TVF69ihC
 +CC1GY/qk4vjCIzPNa0cH7VJiNUtuZztJN3zDItfpgE3Y8M2BtKg+7S+UH+ccM3kDtIc
 Rb/iMXZeTFwkJ1+tIkmr0MBSS9Bo/oDTLJJ1TLzIItCn7m1JoYDEByIh45jVJ8k5c6GN
 1y/2WOmDgTbsUrWfn54xPiFZiQxy+7EXh1q6EnMDMraYMPm9IjsnS5sI1XHvocxPMn2B
 T73g==
X-Gm-Message-State: AOAM532Ib+ma+2GmwETm04ufH9c6pHAjW0IVvCI9qQzokAGg2G0HCTV3
 GSsC1gmDebpsKvnsYHNzQmIo9mZNF8zkTA==
X-Google-Smtp-Source: ABdhPJziC3kqOAqVOr6nsHVLX04f58NYJ3hSzVrnPuMmEzXaV5W0tnrL+v3fybRdGSnox7chbLtI1w==
X-Received: by 2002:ac8:5fd0:0:b0:2f3:6495:64c1 with SMTP id
 k16-20020ac85fd0000000b002f3649564c1mr5303481qta.34.1650903249635; 
 Mon, 25 Apr 2022 09:14:09 -0700 (PDT)
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com.
 [209.85.128.177]) by smtp.gmail.com with ESMTPSA id
 b21-20020a05620a271500b0069ed3222674sm4791614qkp.98.2022.04.25.09.14.08
 for <alsa-devel@alsa-project.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Apr 2022 09:14:09 -0700 (PDT)
Received: by mail-yw1-f177.google.com with SMTP id
 00721157ae682-2f7d7e3b5bfso40466597b3.5
 for <alsa-devel@alsa-project.org>; Mon, 25 Apr 2022 09:14:08 -0700 (PDT)
X-Received: by 2002:a81:e10d:0:b0:2f7:bb2a:6529 with SMTP id
 w13-20020a81e10d000000b002f7bb2a6529mr13948153ywh.62.1650903248631; Mon, 25
 Apr 2022 09:14:08 -0700 (PDT)
MIME-Version: 1.0
References: <20220421203555.29011-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20220421203555.29011-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <CAMuHMdX4_PKsGGRj6yGhDGfaRD-6PqiJeCnKq0yUicfMutOP4g@mail.gmail.com>
 <CA+V-a8uJM0etygB-v+rs0+EKY6_tz90wH_ZOVH8Zbc8dQPmQGw@mail.gmail.com>
In-Reply-To: <CA+V-a8uJM0etygB-v+rs0+EKY6_tz90wH_ZOVH8Zbc8dQPmQGw@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 25 Apr 2022 18:13:57 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXHqn5_segVMhn_biEXnOSyaLpPfv4jkFp2uxv-=bfqew@mail.gmail.com>
Message-ID: <CAMuHMdXHqn5_segVMhn_biEXnOSyaLpPfv4jkFp2uxv-=bfqew@mail.gmail.com>
Subject: Re: [PATCH 1/3] ASoC: sh: rz-ssi: Drop unused macros
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
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

Hi Prabhakar,

On Mon, Apr 25, 2022 at 6:09 PM Lad, Prabhakar
<prabhakar.csengg@gmail.com> wrote:
> On Mon, Apr 25, 2022 at 1:49 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > On Fri, Apr 22, 2022 at 7:32 PM Lad Prabhakar
> > <prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
> > > Drop unused macros SSIFSR_TDC and SSIFSR_RDC.
> > >
> > > Reported-by: Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
> > > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Thanks for your patch!
> >
> > What does this fix?
> > Is the real issue that there are 32 FIFO entries, and the TDC and RDC
> > fields are 6 bits wide, while the mask uses 0x1f instead of 0x3f?
> >
> I was in two minds here as you have already spotted the masks are
> incorrect, instead of fixing the masks I choose to drop the macros
> itself as they were not used. Let me know what are your thoughts on
> this.

IC.

I don't have a preference.
So please either remove them, and make it clear they were wrong,
so no one is tempted to just revert the removal to start using the
definitions, or either keep them, and fix the definitions.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
