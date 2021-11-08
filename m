Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 50A22449882
	for <lists+alsa-devel@lfdr.de>; Mon,  8 Nov 2021 16:34:59 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AC11A1688;
	Mon,  8 Nov 2021 16:34:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AC11A1688
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1636385698;
	bh=Zn7us5XDMLNikCoeCEk+uJ3hKowimgj11DwNAXV4ob0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NBKqIp8HYkOC0A0JwMaGmJieJJJQ0S9PPjmleIY+wklE3NUunqxaSEIzRonzcpL3F
	 0VqibDEve9zWo3FBDywOrrUktZ1Swz2tOc4OE0hZEO1Zr5JGHfdEVvShtJq9JflGkp
	 7/i18S24QrV6BXKFvM+iG2o29AM2sYEajpWxIMQ8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A042BF80520;
	Mon,  8 Nov 2021 16:30:37 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 54E9FF8049E; Mon,  8 Nov 2021 16:26:08 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
 FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,PRX_BODY_135,SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com
 [209.85.222.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 884AFF8007E
 for <alsa-devel@alsa-project.org>; Mon,  8 Nov 2021 16:26:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 884AFF8007E
Received: by mail-ua1-f46.google.com with SMTP id p37so31077993uae.8
 for <alsa-devel@alsa-project.org>; Mon, 08 Nov 2021 07:26:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=x4ykPITI22sSh/L6reU4seHVLFfVjdO/v+W3/SN8DUg=;
 b=rO6e9u2C7clNuUBopVj+bfU92nBlmM/jGlQLU5yDvnaQB+kt0pU9knmx8UML4p7hgf
 8NVMyb1ckEzvjSuBxd9/3ZJsnSBu7A8EI0noWyZWyaCZWewxfvy1VZfLrqU6PzlWQH+h
 hjEkB1APcjxC5TBRgyGejdopPSr7SDIs6H8NSe1zs9OIVzgIHwAVk7ulrUTen2JO0A2w
 bhzOn2eugPhdb7rPXb2vfOzfgTkW4HRJYp4NuVJ6eL8Gr85Xnb4uoe2kcFllGuFsoLDL
 jGHBSYNPjYMw24ZUp8BZKftxjdiqcENV9JiBaWC1WKjoesdzI++wH3qyA+hrgU7c4v1U
 8HMQ==
X-Gm-Message-State: AOAM530XuQapdmbweYhzXuvVQnL6YWvOGJZ9LORscK36OMMeaoKHeQ7R
 fX0df0+lAIGvFhr42UaZV6Krpnr12XGTJ/2l
X-Google-Smtp-Source: ABdhPJx5ClM4WvtNMMHa/AgBtq589RfA2ZLps3OMfUetEmfEouqd5zj2u+ySgUXJN1YPXMLytDLTKA==
X-Received: by 2002:ab0:6354:: with SMTP id f20mr803370uap.116.1636385159662; 
 Mon, 08 Nov 2021 07:25:59 -0800 (PST)
Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com.
 [209.85.222.51])
 by smtp.gmail.com with ESMTPSA id j15sm782987vsp.8.2021.11.08.07.25.58
 for <alsa-devel@alsa-project.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Nov 2021 07:25:58 -0800 (PST)
Received: by mail-ua1-f51.google.com with SMTP id i6so32173308uae.6
 for <alsa-devel@alsa-project.org>; Mon, 08 Nov 2021 07:25:58 -0800 (PST)
X-Received: by 2002:a9f:2c98:: with SMTP id w24mr725068uaj.89.1636385158322;
 Mon, 08 Nov 2021 07:25:58 -0800 (PST)
MIME-Version: 1.0
References: <20211108101157.15189-1-bp@alien8.de>
 <20211108101157.15189-43-bp@alien8.de>
 <CAMuHMdWH+txiSP_d7Jc4f_bU8Lf9iWpT4E3o5o7BJr-YdA6-VA@mail.gmail.com>
 <YYkyUEqcsOwQMb1S@zn.tnic>
In-Reply-To: <YYkyUEqcsOwQMb1S@zn.tnic>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 8 Nov 2021 16:25:47 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXiBEQyEXJagSfpH44hxVA2t0sDH7B7YubLGHrb2MJLLA@mail.gmail.com>
Message-ID: <CAMuHMdXiBEQyEXJagSfpH44hxVA2t0sDH7B7YubLGHrb2MJLLA@mail.gmail.com>
Subject: Re: [PATCH v0 42/42] notifier: Return an error when callback is
 already registered
To: Borislav Petkov <bp@alien8.de>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Mon, 08 Nov 2021 16:29:18 +0100
Cc: ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 the arch/x86 maintainers <x86@kernel.org>,
 Linux-sh list <linux-sh@vger.kernel.org>, linux-iio@vger.kernel.org,
 "open list:REMOTE PROCESSOR \(REMOTEPROC\) SUBSYSTEM"
 <linux-remoteproc@vger.kernel.org>, linux-hyperv@vger.kernel.org,
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
 netdev <netdev@vger.kernel.org>, Ayush Sawal <ayush.sawal@chelsio.com>,
 sparclinux <sparclinux@vger.kernel.org>, linux-clk <linux-clk@vger.kernel.org>,
 linux-leds <linux-leds@vger.kernel.org>,
 linux-s390 <linux-s390@vger.kernel.org>, scsi <linux-scsi@vger.kernel.org>,
 Rohit Maheshwari <rohitm@chelsio.com>, linux-staging@lists.linux.dev,
 bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>,
 openipmi-developer@lists.sourceforge.net, xen-devel@lists.xenproject.org,
 "open list:TENSILICA XTENSA PORT \(xtensa\)" <linux-xtensa@linux-xtensa.org>,
 Arnd Bergmann <arnd@arndb.de>, Linux PM list <linux-pm@vger.kernel.org>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Vinay Kumar Yadav <vinay.yadav@chelsio.com>,
 linux-um <linux-um@lists.infradead.org>, Steven Rostedt <rostedt@goodmis.org>,
 rcu@vger.kernel.org,
 Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 linux-tegra <linux-tegra@vger.kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, intel-gvt-dev@lists.freedesktop.org,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, linux-edac@vger.kernel.org,
 Parisc List <linux-parisc@vger.kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 USB list <linux-usb@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
 alpha <linux-alpha@vger.kernel.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
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

Hi Borislav,

On Mon, Nov 8, 2021 at 3:21 PM Borislav Petkov <bp@alien8.de> wrote:
> On Mon, Nov 08, 2021 at 03:07:03PM +0100, Geert Uytterhoeven wrote:
> > I think the addition of __must_check is overkill, leading to the
> > addition of useless error checks and message printing.
>
> See the WARN in notifier_chain_register() - it will already do "message
> printing".

I mean the addition of useless error checks and message printing _to
the callers_.

> > Many callers call this where it cannot fail, and where nothing can
> > be done in the very unlikely event that the call would ever start to
> > fail.
>
> This is an attempt to remove this WARN() hack in
> notifier_chain_register() and have the function return a proper error
> value instead of this "Currently always returns zero." which is bad
> design.
>
> Some of the registration functions around the tree check that retval and
> some don't. So if "it cannot fail" those registration either should not
> return a value or callers should check that return value - what we have
> now doesn't make a whole lot of sense.

With __must_check callers are required to check, even if they know
it cannot fail.

> Oh, and then fixing this should avoid stuff like:
>
> +       if (notifier_registered == false) {
> +               mce_register_decode_chain(&amdgpu_bad_page_nb);
> +               notifier_registered = true;
> +       }
>
> from propagating in the code.

That's unrelated to the addition of __must_check.

I'm not against returning proper errors codes.  I'm against forcing
callers to check things that cannot fail and to add individual error
printing to each and every caller.

Note that in other areas, we are moving in the other
direction, to a centralized printing of error messages,
cfr. e.g. commit 7723f4c5ecdb8d83 ("driver core: platform: Add an
error message to platform_get_irq*()").

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
