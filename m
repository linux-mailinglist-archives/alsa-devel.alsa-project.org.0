Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D877E498988
	for <lists+alsa-devel@lfdr.de>; Mon, 24 Jan 2022 19:57:02 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6DB00285F;
	Mon, 24 Jan 2022 19:56:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6DB00285F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1643050622;
	bh=qsjeNabxZfMGWF5rR1TDanVRU7ifkkYwiYs6PXhVGfY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Izp0uD3mpXx4QGnrkTvMXCe/C+ntlVk1446GFyHRHBZkm7zqfYTWOdApRkS/upTEB
	 2AB76OuH2J9X5GGxdt26tIEdTjCQ3r+HKsIOKnglq3RYzJeXswf2hbv0JDioWlQ0Ki
	 r35cBGp0PeCxIXHPhV7jCCb9B1tXZSykpBz3FETU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DE332F80083;
	Mon, 24 Jan 2022 19:55:56 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2E013F80083; Mon, 24 Jan 2022 19:55:54 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
 FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,PRX_BODY_135,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com
 [209.85.222.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 04C7DF80083
 for <alsa-devel@alsa-project.org>; Mon, 24 Jan 2022 19:55:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 04C7DF80083
Received: by mail-ua1-f53.google.com with SMTP id f24so32743796uab.11
 for <alsa-devel@alsa-project.org>; Mon, 24 Jan 2022 10:55:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ME4XZXZ5PNYvzDH4OmBox2BIuMK+Mc5MwbGfrqjcLBM=;
 b=BJxtj3bG4fEPN9vztDj6UaZO+wkhv9dXCgbyJozLUv3lfzhpX+yjoWqqmr/WqQ++gf
 GHPa5l0tytG8BzdVCYZf55btnvf7gf4XHTJ3Ix3B2mC5UgGhz3kHXINJtjVBg2ObZT7z
 EcXcpM26V2xUxFO36IfRUMaXSENM0I3VAQ3Ucui5GeB0Bh2qA6gOubaDl/prexjEhkrT
 mkJCfHOza3TO/1Gb8tWrOuttrJOcATwuwXXnCXWEOa4rtnZCKrAsYyw9p1gZabVTIX/+
 xYVWUXhecNk1gkeIT01k5xbY2nDKfhyZWuqNFsP9sLgNLAEAVU9l9nyQ4iX0SQd/HiZ6
 8zSw==
X-Gm-Message-State: AOAM5325KR/BJYd4YyYtDrnyDg+hBQd3xLaWCdsTrJDWg5p9g69tudO6
 Dp0jz0al8yqTk47njy+8oQfFrna5q6QpTQ==
X-Google-Smtp-Source: ABdhPJxgZ7S6vZhXeWMoXctnpCYnpeGY8B/QVgFF4SDy8bDWsimeXmZnQHYp/KYCpfDr4iXUCHc2sg==
X-Received: by 2002:a67:1081:: with SMTP id 123mr5808626vsq.69.1643050544568; 
 Mon, 24 Jan 2022 10:55:44 -0800 (PST)
Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com.
 [209.85.222.51])
 by smtp.gmail.com with ESMTPSA id q4sm1199308vke.15.2022.01.24.10.55.43
 for <alsa-devel@alsa-project.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Jan 2022 10:55:43 -0800 (PST)
Received: by mail-ua1-f51.google.com with SMTP id r15so32868156uao.3
 for <alsa-devel@alsa-project.org>; Mon, 24 Jan 2022 10:55:43 -0800 (PST)
X-Received: by 2002:a9f:2070:: with SMTP id 103mr2821729uam.122.1643050543058; 
 Mon, 24 Jan 2022 10:55:43 -0800 (PST)
MIME-Version: 1.0
References: <20220123125737.2658758-1-geert@linux-m68k.org>
 <alpine.DEB.2.22.394.2201240851560.2674757@ramsan.of.borg>
 <CADnq5_MUq0fX7wMLJyUUxxa+2xoRinonL-TzD8tUhXALRfY8-A@mail.gmail.com>
In-Reply-To: <CADnq5_MUq0fX7wMLJyUUxxa+2xoRinonL-TzD8tUhXALRfY8-A@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 24 Jan 2022 19:55:32 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWUWqHYbbavtMT-XAD_sarDPC5xnc3c0pX1ZAh3Wuzuzg@mail.gmail.com>
Message-ID: <CAMuHMdWUWqHYbbavtMT-XAD_sarDPC5xnc3c0pX1ZAh3Wuzuzg@mail.gmail.com>
Subject: Re: Build regressions/improvements in v5.17-rc1
To: Alex Deucher <alexdeucher@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Cc: ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 KVM list <kvm@vger.kernel.org>, Network Development <netdev@vger.kernel.org>,
 linux-um <linux-um@lists.infradead.org>, LKML <linux-kernel@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
 Lakshmi Sowjanya D <lakshmi.sowjanya.d@intel.com>,
 sparclinux <sparclinux@vger.kernel.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, "Tobin C. Harding" <me@tobin.cc>
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

Hi Alex,

On Mon, Jan 24, 2022 at 7:52 PM Alex Deucher <alexdeucher@gmail.com> wrote:
> On Mon, Jan 24, 2022 at 5:25 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > On Sun, 23 Jan 2022, Geert Uytterhoeven wrote:
> > >  + /kisskb/src/drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_topology.c: error: control reaches end of non-void function [-Werror=return-type]:  => 1560:1
>
> I don't really see what's going on here:
>
> #ifdef CONFIG_X86_64
> return cpu_data(first_cpu_of_numa_node).apicid;
> #else
> return first_cpu_of_numa_node;
> #endif

Ah, the actual failure causing this was not included:

In file included from /kisskb/src/arch/x86/um/asm/processor.h:41:0,
                 from /kisskb/src/include/linux/mutex.h:19,
                 from /kisskb/src/include/linux/kernfs.h:11,
                 from /kisskb/src/include/linux/sysfs.h:16,
                 from /kisskb/src/include/linux/kobject.h:20,
                 from /kisskb/src/include/linux/pci.h:35,
                 from
/kisskb/src/drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_topology.c:25:
/kisskb/src/drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_topology.c: In
function 'kfd_cpumask_to_apic_id':
/kisskb/src/arch/um/include/asm/processor-generic.h:103:18: error:
called object is not a function or function pointer
 #define cpu_data (&boot_cpu_data)
                  ^
/kisskb/src/drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_topology.c:1556:9:
note: in expansion of macro 'cpu_data'
  return cpu_data(first_cpu_of_numa_node).apicid;
         ^
/kisskb/src/drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_topology.c:1560:1:
error: control reaches end of non-void function [-Werror=return-type]
 }
 ^

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
