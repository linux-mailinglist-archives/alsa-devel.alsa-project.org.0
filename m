Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 634E44979DF
	for <lists+alsa-devel@lfdr.de>; Mon, 24 Jan 2022 08:57:39 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D551128FD;
	Mon, 24 Jan 2022 08:56:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D551128FD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1643011058;
	bh=roh9zstfkfX4fm8nVbb1ad1kA7MVH58byc9ZqTa7HLE=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=cBJOTy8kBkLPmwyexboZOFZwV7BWnaXYbvg5+tVvhgZAOsnE00VTi7bDRfhomzHkQ
	 T7ml/7vQfV3mqQxL2RCCJ9VvICsIiocINexmWN5nL72mGDEfvtkcmN2qR8/n1y0Hu3
	 V8z99WGq9EMcS2UO8qqMYzEY5zvAF8jJ/Ph9Ncso=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4DAF8F802BE;
	Mon, 24 Jan 2022 08:56:33 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4F2D4F8027C; Mon, 24 Jan 2022 08:56:27 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=PRX_BODY_135,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from xavier.telenet-ops.be (xavier.telenet-ops.be
 [IPv6:2a02:1800:120:4::f00:14])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 06317F80083
 for <alsa-devel@alsa-project.org>; Mon, 24 Jan 2022 08:55:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 06317F80083
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:20cc:b383:efc8:c1b8])
 by xavier.telenet-ops.be with bizsmtp
 id mXvh260014688xB01XvhAj; Mon, 24 Jan 2022 08:55:43 +0100
Received: from geert (helo=localhost)
 by ramsan.of.borg with local-esmtp (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1nBuCS-00BDqh-Mn; Mon, 24 Jan 2022 08:55:40 +0100
Date: Mon, 24 Jan 2022 08:55:40 +0100 (CET)
From: Geert Uytterhoeven <geert@linux-m68k.org>
X-X-Sender: geert@ramsan.of.borg
To: linux-kernel@vger.kernel.org
Subject: Re: Build regressions/improvements in v5.17-rc1
In-Reply-To: <20220123125737.2658758-1-geert@linux-m68k.org>
Message-ID: <alpine.DEB.2.22.394.2201240851560.2674757@ramsan.of.borg>
References: <20220123125737.2658758-1-geert@linux-m68k.org>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
Cc: alsa-devel@alsa-project.org, kvm@vger.kernel.org, netdev@vger.kernel.org,
 linux-um@lists.infradead.org, linux-mips@vger.kernel.org,
 amd-gfx@lists.freedesktop.org,
 Lakshmi Sowjanya D <lakshmi.sowjanya.d@intel.com>, sparclinux@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, "Tobin C. Harding" <me@tobin.cc>
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

On Sun, 23 Jan 2022, Geert Uytterhoeven wrote:
> Below is the list of build error/warning regressions/improvements in
> v5.17-rc1[1] compared to v5.16[2].
>
> Summarized:
>  - build errors: +17/-2
>  - build warnings: +23/-25
>
> Note that there may be false regressions, as some logs are incomplete.
> Still, they're build errors/warnings.
>
> Happy fixing! ;-)
>
> Thanks to the linux-next team for providing the build service.
>
> [1] http://kisskb.ellerman.id.au/kisskb/branch/linus/head/e783362eb54cd99b2cac8b3a9aeac942e6f6ac07/ (all 99 configs)
> [2] http://kisskb.ellerman.id.au/kisskb/branch/linus/head/df0cc57e057f18e44dac8e6c18aba47ab53202f9/ (98 out of 99 configs)
>
>
> *** ERRORS ***
>
> 17 error regressions:
>  + /kisskb/src/arch/powerpc/kernel/stacktrace.c: error: implicit declaration of function 'nmi_cpu_backtrace' [-Werror=implicit-function-declaration]:  => 171:2
>  + /kisskb/src/arch/powerpc/kernel/stacktrace.c: error: implicit declaration of function 'nmi_trigger_cpumask_backtrace' [-Werror=implicit-function-declaration]:  => 226:2

powerpc-gcc5/skiroot_defconfig

>  + /kisskb/src/arch/sparc/mm/srmmu.c: error: cast between incompatible function types from 'void (*)(long unsigned int)' to 'void (*)(long unsigned int,  long unsigned int,  long unsigned int,  long unsigned int,  long unsigned int)' [-Werror=cast-function-type]:  => 1756:13, 1639:13
>  + /kisskb/src/arch/sparc/mm/srmmu.c: error: cast between incompatible function types from 'void (*)(struct mm_struct *)' to 'void (*)(long unsigned int,  long unsigned int,  long unsigned int,  long unsigned int,  long unsigned int)' [-Werror=cast-function-type]:  => 1674:29, 1662:29
>  + /kisskb/src/arch/sparc/mm/srmmu.c: error: cast between incompatible function types from 'void (*)(struct mm_struct *, long unsigned int)' to 'void (*)(long unsigned int,  long unsigned int,  long unsigned int,  long unsigned int,  long unsigned int)' [-Werror=cast-function-type]:  => 1767:21
>  + /kisskb/src/arch/sparc/mm/srmmu.c: error: cast between incompatible function types from 'void (*)(struct vm_area_struct *, long unsigned int)' to 'void (*)(long unsigned int,  long unsigned int,  long unsigned int,  long unsigned int,  long unsigned int)' [-Werror=cast-function-type]:  => 1741:29, 1726:29
>  + /kisskb/src/arch/sparc/mm/srmmu.c: error: cast between incompatible function types from 'void (*)(struct vm_area_struct *, long unsigned int,  long unsigned int)' to 'void (*)(long unsigned int,  long unsigned int,  long unsigned int,  long unsigned int,  long unsigned int)' [-Werror=cast-function-type]:  => 1694:29, 1711:29

sparc64-gcc11/sparc-allmodconfig

>  + /kisskb/src/arch/um/include/asm/processor-generic.h: error: called object is not a function or function pointer:  => 103:18
>  + /kisskb/src/drivers/vfio/pci/vfio_pci_rdwr.c: error: assignment makes pointer from integer without a cast [-Werror=int-conversion]:  => 324:9, 317:9
>  + /kisskb/src/drivers/vfio/pci/vfio_pci_rdwr.c: error: implicit declaration of function 'ioport_map' [-Werror=implicit-function-declaration]:  => 317:11
>  + /kisskb/src/drivers/vfio/pci/vfio_pci_rdwr.c: error: implicit declaration of function 'ioport_unmap' [-Werror=implicit-function-declaration]:  => 338:15

um-x86_64/um-allyesconfig

>  + /kisskb/src/drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_topology.c: error: control reaches end of non-void function [-Werror=return-type]:  => 1560:1

um-x86_64/um-all{mod,yes}config

>  + /kisskb/src/drivers/net/ethernet/freescale/fec_mpc52xx.c: error: passing argument 2 of 'mpc52xx_fec_set_paddr' discards 'const' qualifier from pointer target type [-Werror=discarded-qualifiers]:  => 659:29

powerpc-gcc5/ppc32_allmodconfig

>  + /kisskb/src/drivers/pinctrl/pinctrl-thunderbay.c: error: assignment discards 'const' qualifier from pointer target type [-Werror=discarded-qualifiers]:  => 815:8, 815:29

arm64-gcc5.4/arm64-allmodconfig
arm64-gcc8/arm64-allmodconfig

>  + /kisskb/src/lib/test_printf.c: error: "PTR" redefined [-Werror]:  => 247:0, 247
>  + /kisskb/src/sound/pci/ca0106/ca0106.h: error: "PTR" redefined [-Werror]:  => 62, 62:0

mips-gcc8/mips-allmodconfig
mipsel/mips-allmodconfig

>  + error: arch/powerpc/kvm/book3s_64_entry.o: relocation truncated to fit: R_PPC64_REL14 (stub) against symbol `machine_check_common' defined in .text section in arch/powerpc/kernel/head_64.o:  => (.text+0x3e4)

powerpc-gcc5/powerpc-allyesconfig

Gr{oetje,eeting}s,

 						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
 							    -- Linus Torvalds
