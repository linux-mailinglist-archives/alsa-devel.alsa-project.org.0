Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 075744554EA
	for <lists+alsa-devel@lfdr.de>; Thu, 18 Nov 2021 07:52:27 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8800218AD;
	Thu, 18 Nov 2021 07:51:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8800218AD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1637218346;
	bh=vXU1PQ80nAgAOCHyUEXJNbSkp77ba35D44eiJtwXCYc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=VXWuOTc4MsOoVulKVB2Iny329ziqYG4YpYar3hij/k3gm0xUbafWTOhBbkrkt84aF
	 5cVHMVK8r1ULeYk+1bsnAE3O5PEvXUHEgRbrs+7IvwdhcgZx6W/zJI/sWomPcw5bZv
	 L2QlcwcG3SuxBH0JOYhKHj021NPb/seSDadjC2pQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id ED27FF8010B;
	Thu, 18 Nov 2021 07:51:07 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1CF1BF80272; Thu, 18 Nov 2021 07:51:05 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.13])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6509FF8010B
 for <alsa-devel@alsa-project.org>; Thu, 18 Nov 2021 07:50:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6509FF8010B
Received: from mail-wm1-f54.google.com ([209.85.128.54]) by
 mrelayeu.kundenserver.de (mreue108 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1MVvGt-1nCVyW04t3-00Rssb for <alsa-devel@alsa-project.org>; Thu, 18 Nov
 2021 07:50:57 +0100
Received: by mail-wm1-f54.google.com with SMTP id
 z1-20020a05600c220100b00337f97d2464so5098301wml.1
 for <alsa-devel@alsa-project.org>; Wed, 17 Nov 2021 22:50:56 -0800 (PST)
X-Gm-Message-State: AOAM530cdvliw17WG94BdIwAKX5tWd8IOAv+EwapfSqGnZg8UdKoHiX6
 ug2dQhrB54cBLzVnmCneboPkTAF0R6O/2kDZB9c=
X-Google-Smtp-Source: ABdhPJyHvxob/UuoSUzAd4c5/hOqO7PUFiJTJfkYO0PtcEpImuf2l7+kFCPvNXXbbQ5QdTISxt9uzKaFtJ1GvZoteGU=
X-Received: by 2002:a7b:c050:: with SMTP id u16mr7168120wmc.82.1637218256583; 
 Wed, 17 Nov 2021 22:50:56 -0800 (PST)
MIME-Version: 1.0
References: <20211118062146.11850-1-rdunlap@infradead.org>
In-Reply-To: <20211118062146.11850-1-rdunlap@infradead.org>
From: Arnd Bergmann <arnd@arndb.de>
Date: Thu, 18 Nov 2021 07:50:40 +0100
X-Gmail-Original-Message-ID: <CAK8P3a1s_toN_J=M8gxcVrtEazZ+Mu9UYbKMVkG3MzDLSCEOfQ@mail.gmail.com>
Message-ID: <CAK8P3a1s_toN_J=M8gxcVrtEazZ+Mu9UYbKMVkG3MzDLSCEOfQ@mail.gmail.com>
Subject: Re: [PATCH] sound/oss/dmasound: fix build when some drivers are =m
 and others are =y
To: Randy Dunlap <rdunlap@infradead.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:OfcrCWVVbbDLi0jWR13Akwg0vTIRH+XMKlV8ZHlEeZzEPvhSGPm
 ixTByzu2WLHoc5CmL3oT+MlfBaj3U8jmwfyYS+AAskixP60fRAOyYWI5fcyLdgR71j7FdpL
 IW7p4/BahIz8VP7Kc3t7lGVyKVelnnLK4ViRbyxSjYyWGwLi9CRdI/fKM32ZdH+2Gg9mGsl
 zMEHva0hsV/u1M+edVjqw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:Ed8qrQOmsrg=:TNZflNm7gMt9vIU3aLn5Wp
 IYLxrPvV/ys5J+PXV9LytGdLVPgFQPaQOleA8c2j9DFvWvyVRQIm2Zzfli3qmGhDT+dCvr+j2
 Abnj92gWeWT9exLqXNDxDLdPKrhYj6TFH66GwTVLwxG5XJYYb3xdc4/qhXtnBIgj3umcjXV0O
 KDAf/ArxutW5n+e3WnYnofYveJt6VnC1rT9ziuC4xQJzgWzVi+2ZwaNW3NvvA+At4zp5R3wTy
 mC0fj1SSwsY03PeGleUYfJjEHUWBrxhYGWErwiyWrrn/5FZqRE3uOJ8TNeAqzpLIkGaYEcY7S
 kGnOmcFfKSPcp2AqlBchc0eKmuwcQTH6OuizvFoDfpjqihMO0G9f7/6ccyUt3eIUNjkq4rlix
 4Pz1S1WQHIJ/87SWZp3nN6hiaUO0DS2aCV+yTNDvtZHvBhkIKN/XrDo2EXTUPC/o2cu+8TqtP
 PKJTFirrIL/5Lj7bttVnr4h9wWMMaCTV79R2JP8uyg/iEcYPjXTjv0mZhFq+tTF1OVn2vtzIa
 nt+YQqJu2Wl1TnyXDwsxmciyYGE799y5xHeDz4S+nsa9Ic5ihTOl54wNADsWXXAAnKC1pAA+B
 88/qwfuONNFei96NJRxr4Yh/RSMbvlxsuNPzS4mgL80ml1opF79VLuEd+sv+VulOUXyYVAEmt
 icDMCD3FJgVg1gyfpv7s0oBbtSLrMjbWCJ+Tdp5P5OJbGeCbN+ZCZEOeNaLCuco7k2aTXP52q
 uN/CUlrEZXfShG/Q61DjtOTbo19frI4NJJApu0FsJqRx5OII+p+0FAMp10FX/Z56m7+aOg/HB
 otpWtYK5CxeM5t9vlBzS3oeS5Beey7QJHeK2F5/z8GA06+gg8k=
Cc: ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 kernel test robot <lkp@intel.com>, Arnd Bergmann <arnd@arndb.de>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Geert Uytterhoeven <geert@linux-m68k.org>
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

On Thu, Nov 18, 2021 at 7:21 AM Randy Dunlap <rdunlap@infradead.org> wrote:
>
> When CONFIG_DMASOUND_ATARI=y and CONFIG_DMASOUND_Q40=m,
> dmasound_atari.o is built first (listed first in the Makefile),
> so dmasound_core.o is built as builtin, not for use by loadable
> modules. Then dmasound_q40.o is built and linked with the
> already-built dmasound_core.o, but the latter does not support
> use by loadable modules. This causes the missing symbol to be
> undefined.
>
> Fixes this build error:
> ERROR: modpost: "dmasound_deinit" [sound/oss/dmasound/dmasound_q40.ko] undefined!

I suspect your patch now breaks the case where multiple drivers are
built-in, because that puts the same global symbols into vmlinux more
than once.

> -EXPORT_SYMBOL(dmasound);
> -EXPORT_SYMBOL(dmasound_init);
> -#ifdef MODULE
> -EXPORT_SYMBOL(dmasound_deinit);
> -#endif

From a very brief look, I would think that removing this #ifdef and
unconditionally defining dmasound_deinit is the correct solution
here, to solve the case of the core driver being built-in but called
from a loadable module, the Makefile logic is otherwise correct.

         Arnd
