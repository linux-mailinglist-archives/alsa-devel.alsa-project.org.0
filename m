Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CF7AD70276
	for <lists+alsa-devel@lfdr.de>; Mon, 22 Jul 2019 16:38:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 345651775;
	Mon, 22 Jul 2019 16:37:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 345651775
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1563806323;
	bh=OBYBCNZi4REYZp/FQZaPJ3Yi/AezS/oCRamlD+E+/ps=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=f5SnYAjwzmfEs9H+QeJVW1JMvw0PYSloSV7qwkV6DRhPQf8PdSueSmVplfdX2Clai
	 WZe+KcoF/aCdk9OZsvmOs+nATe5uOenMjGCgN+GhNrWwe0706PRVtqFoLMwrLpElEl
	 DAwU6sIFlIwf4xdmi2jJLHapuAHme9C4xJ6upyxY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7B3C9F803D7;
	Mon, 22 Jul 2019 16:36:58 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2CE1BF803D1; Mon, 22 Jul 2019 16:36:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=2.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 PRX_BODY_30,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_SOFTFAIL,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from conssluserg-02.nifty.com (conssluserg-02.nifty.com
 [210.131.2.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C0711F800F5
 for <alsa-devel@alsa-project.org>; Mon, 22 Jul 2019 16:36:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C0711F800F5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=nifty.com header.i=@nifty.com
 header.b="K64SEYcl"
Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com
 [209.85.217.42]) (authenticated)
 by conssluserg-02.nifty.com with ESMTP id x6MEaUAx026363
 for <alsa-devel@alsa-project.org>; Mon, 22 Jul 2019 23:36:31 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-02.nifty.com x6MEaUAx026363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
 s=dec2015msa; t=1563806191;
 bh=97xkgWS+1emOr9o4Y+tbx8rUVVkeFCfWt/pH2eQTRwY=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=K64SEYclpAkwxjkXxXgCfY4/t/xjClYY37/tL4YdsmsM74m7r5YaMU8rM+c7Z5lA7
 6DvXrxYQAmxDII+tlzNl4f7F3AgAvz+jKud0lLA/jqWoXMouKRN+EEypIC2vQ653Bo
 pOZSrNQ0yu1dbsvpA6PrkvVi3OTOsaWN9VnDuaKQtU/k9RViDEAzUlnbMy7lTB4Gp9
 thvBPg3175J362C/9ckxVtCLgu6nyws/yw2zx3wPXk3ILqmF9jxVqQPeD5pFHtdxuW
 Q6//I5c8MC0gStLL3FG7n/aNg950wzGBOkpDy2frOzAsr9BnsXg1IrCzJbWoE3He9D
 s6GIxg28Mq8Wg==
X-Nifty-SrcIP: [209.85.217.42]
Received: by mail-vs1-f42.google.com with SMTP id 190so26237334vsf.9
 for <alsa-devel@alsa-project.org>; Mon, 22 Jul 2019 07:36:31 -0700 (PDT)
X-Gm-Message-State: APjAAAU/9WfPUs3nyO+HMz4QSr+eqEBxOtOKMceDYsWD5ApxuKQ/yd2A
 c60a7Q5y+OTAdtkM8ArZ3dIgV8cJM9vmhg8alo4=
X-Google-Smtp-Source: APXvYqyAnMeozdA27fgOHdSsZiQ81FCIIL8bkY8/1xNO//qimbuzyBzmbPcQGvwOpaXgOQDbcMrVdz2BRZZSK6Fup0Y=
X-Received: by 2002:a67:cd1a:: with SMTP id u26mr42296834vsl.155.1563806190088; 
 Mon, 22 Jul 2019 07:36:30 -0700 (PDT)
MIME-Version: 1.0
References: <20190721142308.30306-1-yamada.masahiro@socionext.com>
 <CAK8P3a01MzCTJnk_fuMgWsRBa3u_CEZegZqH37G7qLiquHWncA@mail.gmail.com>
In-Reply-To: <CAK8P3a01MzCTJnk_fuMgWsRBa3u_CEZegZqH37G7qLiquHWncA@mail.gmail.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Mon, 22 Jul 2019 23:35:53 +0900
X-Gmail-Original-Message-ID: <CAK7LNATSrD-toRZFmQw8cO4D2mRomc=Xw=topA1Ry-0yM=ackg@mail.gmail.com>
Message-ID: <CAK7LNATSrD-toRZFmQw8cO4D2mRomc=Xw=topA1Ry-0yM=ackg@mail.gmail.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Takashi Iwai <tiwai@suse.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Mark Brown <broonie@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [alsa-devel] [PATCH] ASoC: SOF: use __u32 instead of uint32_t
	in uapi headers
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

On Mon, Jul 22, 2019 at 10:40 PM Arnd Bergmann <arnd@arndb.de> wrote:
>
> On Sun, Jul 21, 2019 at 4:25 PM Masahiro Yamada
> <yamada.masahiro@socionext.com> wrote:
> >
> >  struct snd_sof_blk_hdr {
> >         enum snd_sof_fw_blk_type type;
> > -       uint32_t size;          /* bytes minus this header */
> > -       uint32_t offset;        /* offset from base */
> > +       __u32 size;             /* bytes minus this header */
> > +       __u32 offset;           /* offset from base */
> >  } __packed;
> >
>
> On a related note: Using an 'enum' in an ABI structure is not portable
> across architectures. This is probably fine in a UAPI as long as user
> and kernel space agree on the size of an enum, but if the same
> structure is used to talk to the firmware, it won't work on architectures
> that have a different size for the first field.

Both comments from Arnd make sense.

If this header does not need to be in uapi/,
moving it out is fine.

But, looks like Mark has already picked up this.
(His review is so quick)




--
Best Regards
Masahiro Yamada
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
