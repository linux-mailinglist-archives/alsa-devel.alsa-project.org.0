Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 305BB51F7D4
	for <lists+alsa-devel@lfdr.de>; Mon,  9 May 2022 11:22:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A9C3318D2;
	Mon,  9 May 2022 11:21:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A9C3318D2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1652088121;
	bh=34I44iElGDvsO9vc/1qouhwKhN0J+6JwjUlz5LWtXAI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=eLa1pMQdPKqjByosrq1YBig8cGlLwPcBleftG0VtISZuiCjP2ojp2NCQBwxrUNmD1
	 C/jLtod8Nx7V1h9TnfM7X1y/PaT8+Awb3wVYGB6uyGGVjiEskvxlzeXTYReY3IKT1u
	 uDlqi7OoCeYaKz8Kc1cjZOBhpiuXuT7C0PfpC1Sg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1B5BEF80269;
	Mon,  9 May 2022 11:21:03 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 03218F8025D; Mon,  9 May 2022 11:21:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_30,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BD77FF8014C
 for <alsa-devel@alsa-project.org>; Mon,  9 May 2022 11:20:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BD77FF8014C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="eno68cp5"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 79B3F614BD
 for <alsa-devel@alsa-project.org>; Mon,  9 May 2022 09:20:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB2B8C385AB
 for <alsa-devel@alsa-project.org>; Mon,  9 May 2022 09:20:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1652088050;
 bh=34I44iElGDvsO9vc/1qouhwKhN0J+6JwjUlz5LWtXAI=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=eno68cp5BdLmo+JTajkGm38tQmu+Eu/sq4rus3H3PeZDczMGh25dLxlkSQhTCYwgQ
 bRSLqPg8rs4UxHU6e7yF1XLfcomJY4t0M7NMNiC9YtBbODRwVUTlx6SW6lDf0enn7E
 9T9hamdgtefEwrz8+kx7empoAncF4wZJu/I5T1Hjl1mb2ZQEe72n8XmzgBvOAR4FsF
 4QojwyHucRdJFVdQrU9P2vZjh98K5479MIIg8a5HnWmlKqwdDQVV0uS/nEg6JHs7sL
 SWvP2H4iaApf/cjEfM2MMVxMergCCfxcFrfDgR/c+QhRf9pO7X20IS+nIspNDiA9e7
 v1X+v2ctmzR9A==
Received: by mail-yw1-f180.google.com with SMTP id
 00721157ae682-2f7d621d1caso136928567b3.11
 for <alsa-devel@alsa-project.org>; Mon, 09 May 2022 02:20:50 -0700 (PDT)
X-Gm-Message-State: AOAM533PGT/WpStOz26Fgo1qXLU/0UoFbmS1FrhUWTkine+Ys21OKDyI
 wlulrNkH9WcZCanC2yhu7SZW9WpuysG31gNhPns=
X-Google-Smtp-Source: ABdhPJypbDFv1BZy0AnqQqgdzqwp622v39ahPgaEWut11CbwJXiKPfgoUvAUkAv6K8MS2PyK6H3dw0atDtfrf+Gmhno=
X-Received: by 2002:a0d:cd06:0:b0:2f8:f39c:4cfc with SMTP id
 p6-20020a0dcd06000000b002f8f39c4cfcmr11712705ywd.495.1652088049944; Mon, 09
 May 2022 02:20:49 -0700 (PDT)
MIME-Version: 1.0
References: <20220429135108.2781579-1-schnelle@linux.ibm.com>
 <20220429135108.2781579-57-schnelle@linux.ibm.com>
 <s5hczgnm6ia.wl-tiwai@suse.de>
In-Reply-To: <s5hczgnm6ia.wl-tiwai@suse.de>
From: Arnd Bergmann <arnd@kernel.org>
Date: Mon, 9 May 2022 11:20:33 +0200
X-Gmail-Original-Message-ID: <CAK8P3a3_ppFRY7y4TL21kXfthcbFJmjMivfmH2r4Cqy_vAiesA@mail.gmail.com>
Message-ID: <CAK8P3a3_ppFRY7y4TL21kXfthcbFJmjMivfmH2r4Cqy_vAiesA@mail.gmail.com>
Subject: Re: [RFC v2 31/39] sound: add HAS_IOPORT dependencies
To: Takashi Iwai <tiwai@suse.de>
Content-Type: text/plain; charset="UTF-8"
Cc: linux-arch <linux-arch@vger.kernel.org>,
 "moderated list:SOUND" <alsa-devel@alsa-project.org>,
 Arnd Bergmann <arnd@arndb.de>, Niklas Schnelle <schnelle@linux.ibm.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Takashi Iwai <tiwai@suse.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-pci <linux-pci@vger.kernel.org>
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

On Mon, May 9, 2022 at 10:53 AM Takashi Iwai <tiwai@suse.de> wrote:
> On Fri, 29 Apr 2022 15:50:54 +0200, Niklas Schnelle wrote:

> >
> >  config SND_OPL3_LIB
> >       tristate
> > +     depends on HAS_IOPPORT
> >       select SND_TIMER
> >       select SND_HWDEP
> >       select SND_SEQ_DEVICE if SND_SEQUENCER != n
>
> Both of those are the items to be reverse-selected, so cannot fulfill
> the dependency with depends-on.  That is, the items that select those
> should have the dependency on HAS_IOPORT instead.
>
> That is, a change like below:
>
> > --- a/sound/isa/Kconfig
> > +++ b/sound/isa/Kconfig
> > @@ -31,7 +31,7 @@ if SND_ISA
> >
> >  config SND_ADLIB
> >       tristate "AdLib FM card"
> > -     select SND_OPL3_LIB
> > +     depends on SND_OPL3_LIB
>
> ... won't work.  CONFIG_SND_OPL3_LIB is not enabled by itself but only
> to be selected.

Right, I missed that in my review. Not sure if this was a mistake in
my original patch or if it started in a later version.

I think for the ISA drivers, I would still add 'depends on HAS_IOPORT'
to both CONFIG_SND_ISA and CONFIG_SND_OPL3_LIB if only to
make it easier to understand, even though CONFIG_ISA requires
HAS_IOPORT already, and CONFIG_SND_OPL3_LIB cannot be
selected by itself.

For the PCI drivers, I think we need to add the same dependency
on anything that either selects SND_OPL3_LIB or calls inb()/outb()
directly.

       Arnd
