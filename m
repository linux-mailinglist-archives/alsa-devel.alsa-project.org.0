Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 174712B97BD
	for <lists+alsa-devel@lfdr.de>; Thu, 19 Nov 2020 17:24:45 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 52CBF1720;
	Thu, 19 Nov 2020 17:23:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 52CBF1720
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1605803084;
	bh=bS0qzUjM1H6wIT94SR8QTlx4YXd8oxB6wsHYfxpqnc8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Hl69gy6qLvnXjaR7sdxn6wsUWGN60AHX0ZOSp7XNBAQU1e2SE3OldXtkfhuU4Z8+k
	 DjuKx1X6IAcgPN5exR97nbvQzuV2UzD743mZ8dQhwM26sHL80MIz2hztykxOSSlWzh
	 GDjju/gQEJMETfVL83HVHwbhzWDOUCeSlIQAL39M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 05228F804C1;
	Thu, 19 Nov 2020 17:23:04 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5F2AAF801F9; Thu, 19 Nov 2020 17:23:02 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 33873F801F9
 for <alsa-devel@alsa-project.org>; Thu, 19 Nov 2020 17:22:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 33873F801F9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="XgdVReSd"
Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com
 [209.85.210.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id B3B1622261
 for <alsa-devel@alsa-project.org>; Thu, 19 Nov 2020 16:22:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1605802968;
 bh=bS0qzUjM1H6wIT94SR8QTlx4YXd8oxB6wsHYfxpqnc8=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=XgdVReSdJ3jRMbmJIdoZJeiQFGP40Ow6P/PQuzwCXCagwUSemIME1sFLaEiMxBXRK
 Z+Kn9OXu/HFMHn6uDg7wz6n+XrWThw5Sx2Kn3HhMbY37NtPcLkb8XyxTPI2SUhsIf6
 cLeXZ9EnYXCljFLtBaTBFqLg6AnLx4T7cXv3W0hk=
Received: by mail-ot1-f43.google.com with SMTP id h16so5803626otq.9
 for <alsa-devel@alsa-project.org>; Thu, 19 Nov 2020 08:22:48 -0800 (PST)
X-Gm-Message-State: AOAM530aDOJPodt2L8M78maMpPuXFnCagKXlQv83HhssY+lGupVEfsK2
 iBGQlvQzdfC0XHlj2JStJWx6Hvl3+r0v2p05CqY=
X-Google-Smtp-Source: ABdhPJxe14qa9ET78RDEvJPyPuc5zOrgkvxgZBTpYMYuAHlamwN2dRJXiIke9P3+XrMB/P0WqR21F8wpPDxh/ZqgrvE=
X-Received: by 2002:a05:6830:22d2:: with SMTP id
 q18mr9659872otc.305.1605802967944; 
 Thu, 19 Nov 2020 08:22:47 -0800 (PST)
MIME-Version: 1.0
References: <20201119125318.4066097-1-geert+renesas@glider.be>
 <CAK8P3a0mHYgOYLBO1MHw1CUVgdnOQk4aRf5XTBj+jR-yEtzcoA@mail.gmail.com>
 <CAMuHMdXmHOo+6TgYOsAuSC7-iHEyBnLvqX=MCN3qYybUi5M-hw@mail.gmail.com>
In-Reply-To: <CAMuHMdXmHOo+6TgYOsAuSC7-iHEyBnLvqX=MCN3qYybUi5M-hw@mail.gmail.com>
From: Arnd Bergmann <arnd@kernel.org>
Date: Thu, 19 Nov 2020 17:22:32 +0100
X-Gmail-Original-Message-ID: <CAK8P3a17rA4N7TyiwrTdS_=4AAyDXrAi7W8k45BPuTLL1xU4Gg@mail.gmail.com>
Message-ID: <CAK8P3a17rA4N7TyiwrTdS_=4AAyDXrAi7W8k45BPuTLL1xU4Gg@mail.gmail.com>
Subject: Re: [PATCH] ASoC: fsi: Stop using __raw_*() I/O accessors
To: Geert Uytterhoeven <geert@linux-m68k.org>
Content-Type: text/plain; charset="UTF-8"
Cc: ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Mark Brown <broonie@kernel.org>
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

On Thu, Nov 19, 2020 at 5:13 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> On Thu, Nov 19, 2020 at 4:54 PM Arnd Bergmann <arnd@kernel.org> wrote:
> > On Thu, Nov 19, 2020 at 1:53 PM Geert Uytterhoeven
> > <geert+renesas@glider.be> wrote:
> >
> > I'm also not sure whether changing this breaks big-endian SuperH,
> > which defines the accessors differently from Arm and most other
> > architectures.
>
> On SH, this driver is only used on SH7724 systems.
> Compiling an ecovec24_defconfig kernel with CONFIG_CPU_BIG_ENDIAN=y
> shows that the same code (native 32-bit access) is generated for
> big-endian as for little-endian, which means that it indeed must be
> broken for one of them. But this is not changed by my patch.

Not necessarily: I think superh is more like the old 'BE32' variant of Arm
big-endian, in that on-chip registers are accessed in CPU-endian byte order,
while access to external RAM is byte-swapped.

> > Maybe better just mark the driver as 'depends on SH || !CPU_BIG_ENDIAN'
> > as it is clearly broken on big-endian Arm.
>
> "depends on !CPU_BIG_ENDIAN"?

I think I'd just leave it as it is. Unless someone wants to try out this
board in both big-endian and little-endian configurations and also
listen to the audio output, it's impossible to know whether it is actually
broken. sound/soc/sh/dma-sh7760.c does have a comment from 2007
saying "// FIXME: little-endian only for now".

      Arnd
