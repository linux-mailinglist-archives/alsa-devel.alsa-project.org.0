Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E22504F10B1
	for <lists+alsa-devel@lfdr.de>; Mon,  4 Apr 2022 10:17:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6A08516B4;
	Mon,  4 Apr 2022 10:16:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6A08516B4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1649060246;
	bh=CehrHuIXA820ky43PtvVZTOSgnXA1wQCc3PBUGbvvGk=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mKi17Nomv4QbzzkPECsxkUR5aLoUtpPVMYKHJexNgeMSU9eWOfxgTpO3VUQrnVt9r
	 FdvRoVRs7lHkKkWU2kkMGKDBMAd50tV7ajgXsZjqMM6b6ln1UXqBHKE5/vjBQJwYAb
	 IRdXvLmas0KIXJauqjqKAHPXBDGjv+RLL/VUZQQ8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D230FF801F7;
	Mon,  4 Apr 2022 10:16:26 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 71E79F80162; Mon,  4 Apr 2022 10:16:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=PRX_BODY_135,SPF_HELO_NONE,
 SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be
 [IPv6:2a02:1800:120:4::f00:13])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 70D0EF80100
 for <alsa-devel@alsa-project.org>; Mon,  4 Apr 2022 10:16:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 70D0EF80100
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:6d4d:d9ec:3c70:7c2c])
 by baptiste.telenet-ops.be with bizsmtp
 id EYG82700R40M8zK01YG8cT; Mon, 04 Apr 2022 10:16:17 +0200
Received: from geert (helo=localhost)
 by ramsan.of.borg with local-esmtp (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1nbHse-0089Aj-Eu; Mon, 04 Apr 2022 10:16:08 +0200
Date: Mon, 4 Apr 2022 10:16:08 +0200 (CEST)
From: Geert Uytterhoeven <geert@linux-m68k.org>
X-X-Sender: geert@ramsan.of.borg
To: linux-kernel@vger.kernel.org
Subject: Re: Build regressions/improvements in v5.18-rc1
In-Reply-To: <20220404074734.1092959-1-geert@linux-m68k.org>
Message-ID: <alpine.DEB.2.22.394.2204041006230.1941618@ramsan.of.borg>
References: <CAHk-=wg6FWL1xjVyHx7DdjD2dHZETA5_=FqqW17Z19X-WTfWSg@mail.gmail.com>
 <20220404074734.1092959-1-geert@linux-m68k.org>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
Cc: linux-wireless@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-usb@vger.kernel.org, linux-scsi@vger.kernel.org,
 linux-parisc@vger.kernel.org,
 Dennis Dalessandro <dennis.dalessandro@cornelisnetworks.com>,
 linux-rdma@vger.kernel.org, netdev@vger.kernel.org,
 Mike Marciniszyn <mike.marciniszyn@cornelisnetworks.com>,
 linux-um@lists.infradead.org, dri-devel@lists.freedesktop.org,
 linux-xfs@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
 linux-serial@vger.kernel.org, sparclinux@vger.kernel.org,
 linux-s390@vger.kernel.org, linux-media@vger.kernel.org
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

On Mon, 4 Apr 2022, Geert Uytterhoeven wrote:
> Below is the list of build error/warning regressions/improvements in
> v5.18-rc1[1] compared to v5.17[2].
>
> Summarized:
>  - build errors: +36/-15
>  - build warnings: +5/-38
>
> Happy fixing! ;-)
>
> Thanks to the linux-next team for providing the build service.
>
> [1] http://kisskb.ellerman.id.au/kisskb/branch/linus/head/3123109284176b1532874591f7c81f3837bbdc17/ (all 96 configs)
> [2] http://kisskb.ellerman.id.au/kisskb/branch/linus/head/f443e374ae131c168a065ea1748feac6b2e76613/ (all 96 configs)
>
>
> *** ERRORS ***
>
> 36 error regressions:
>  + /kisskb/src/arch/m68k/include/asm/bitops.h: error: array subscript 2 is above array bounds of 'long unsigned int[1]' [-Werror=array-bounds]:  => 329:20

m68k-gcc8/m68k-allmodconfig (assumed gcc8 bug)

>  + /kisskb/src/arch/parisc/kernel/vdso32/restart_syscall.S: Error: .cfi_endproc without corresponding .cfi_startproc:  => 32
>  + /kisskb/src/arch/parisc/kernel/vdso32/restart_syscall.S: Error: bad or irreducible absolute expression:  => 16
>  + /kisskb/src/arch/parisc/kernel/vdso32/restart_syscall.S: Error: junk at end of line, first unrecognized character is `:':  => 16
>  + /kisskb/src/arch/parisc/kernel/vdso32/restart_syscall.S: Error: no such instruction: `be 0x100(%sr2,%r0)':  => 29
>  + /kisskb/src/arch/parisc/kernel/vdso32/restart_syscall.S: Error: no such instruction: `ldi 0,%r20':  => 30
>  + /kisskb/src/arch/parisc/kernel/vdso32/restart_syscall.S: Error: no such instruction: `ldw 0(%sp),%r31':  => 26
>  + /kisskb/src/arch/parisc/kernel/vdso32/sigtramp.S: Error: no such instruction: `ble 0x100(%sr2,%r0)':  => 51, 46
>  + /kisskb/src/arch/parisc/kernel/vdso32/sigtramp.S: Error: no such instruction: `ldi 0,%r25':  => 44
>  + /kisskb/src/arch/parisc/kernel/vdso32/sigtramp.S: Error: no such instruction: `ldi 1,%r25':  => 49
>  + /kisskb/src/arch/parisc/kernel/vdso32/sigtramp.S: Error: no such instruction: `ldi 173,%r20':  => 45, 50
>  + /kisskb/src/arch/parisc/kernel/vdso32/sigtramp.S: Error: unknown pseudo-op: `.callinfo':  => 40
>  + /kisskb/src/arch/parisc/kernel/vdso32/sigtramp.S: Error: unknown pseudo-op: `.entry':  => 41
>  + /kisskb/src/arch/parisc/kernel/vdso32/sigtramp.S: Error: unknown pseudo-op: `.exit':  => 54
>  + /kisskb/src/arch/parisc/kernel/vdso32/sigtramp.S: Error: unknown pseudo-op: `.proc':  => 39
>  + /kisskb/src/arch/parisc/kernel/vdso32/sigtramp.S: Error: unknown pseudo-op: `.procend':  => 55
>  + /kisskb/src/arch/parisc/kernel/vdso32/sigtramp.S: Error: unknown pseudo-op: `.stringz':  => 76

parisc64-gcc8/generic-64bit_defconfig
parisc-gcc8/generic-32bit_defconfig
parisc-gcc8/parisc-allmodconfig
parisc-gcc8/parisc-allnoconfig

>  + /kisskb/src/arch/sparc/kernel/irq_32.c: error: array subscript [16, 79] is outside array bounds of 'struct tt_entry[1]' [-Werror=array-bounds]:  => 262:14, 261:46, 259:14, 258:14, 263:14

sparc64-gcc11/sparc-allmodconfig

>  + /kisskb/src/drivers/gpu/drm/r128/r128_cce.c: error: case label does not reduce to an integer constant:  => 417:2, 418:2

arm64-gcc5.4/arm64-allmodconfig
mipsel/mips-allmodconfig
powerpc-gcc5/powerpc-allmodconfig
powerpc-gcc5/powerpc-allyesconfig
powerpc-gcc5/ppc32_allmodconfig
powerpc-gcc5/ppc64_book3e_allmodconfig
powerpc-gcc5/ppc64le_allmodconfig

>  + /kisskb/src/drivers/infiniband/hw/qib/qib_wc_x86_64.c: error: 'X86_VENDOR_AMD' undeclared (first use in this function):  => 149:37
>  + /kisskb/src/drivers/infiniband/hw/qib/qib_wc_x86_64.c: error: 'struct cpuinfo_um' has no member named 'x86_vendor':  => 149:22
>  + /kisskb/src/drivers/infiniband/hw/qib/qib_wc_x86_64.c: error: control reaches end of non-void function [-Werror=return-type]:  => 150:1
>  + /kisskb/src/drivers/infiniband/sw/rdmavt/qp.c: error: 'struct cpuinfo_um' has no member named 'x86_cache_size':  => 88:22
>  + /kisskb/src/drivers/infiniband/sw/rdmavt/qp.c: error: control reaches end of non-void function [-Werror=return-type]:  => 89:1
>  + /kisskb/src/drivers/infiniband/sw/rdmavt/qp.c: error: implicit declaration of function '__copy_user_nocache' [-Werror=implicit-function-declaration]:  => 100:2

um-x86_64/um-allmodconfig
um-x86_64/um-allyesconfig

>  + /kisskb/src/drivers/media/platform/nxp/imx-pxp.h: error: initializer element is not constant:  => 582:38

arm64-gcc5.4/arm64-allmodconfig
powerpc-gcc5/powerpc-allmodconfig

>  + /kisskb/src/drivers/misc/habanalabs/common/memory.c: error: cast from pointer to integer of different size [-Werror=pointer-to-int-cast]:  => 153:49, 153:7

mipsel/mips-allmodconfig
mips-gcc8/mips-allmodconfig
sparc64/sparc-allmodconfig
xtensa-gcc11/xtensa-allmodconfig

>  + /kisskb/src/drivers/net/ethernet/broadcom/bnx2x/bnx2x_main.c: error: case label does not reduce to an integer constant:  => 4917:4
>  + /kisskb/src/drivers/net/wireless/broadcom/brcm80211/brcmfmac/sdio.c: error: case label does not reduce to an integer constant:  => 3798:2, 3809:2

arm64-gcc5.4/arm64-allmodconfig
powerpc-gcc5/powerpc-allmodconfig
powerpc-gcc5/ppc64_book3e_allmodconfig

>  + /kisskb/src/drivers/scsi/aacraid/commsup.c: error: case label does not reduce to an integer constant:  => 1983:2

arm64-gcc5.4/arm64-allmodconfig
powerpc-gcc5/powerpc-allmodconfig
powerpc-gcc5/ppc64_book3e_allmodconfig
powerpc-gcc5/ppc64le_allmodconfig

>  + /kisskb/src/drivers/tty/serial/mpc52xx_uart.c: error: initialization from incompatible pointer type [-Werror=incompatible-pointer-types]:  => 1004:12, 1005:12, 1006:14, 970:12, 968:16, 971:14, 969:12, 1002:16, 1003:16, 967:16

powerpc-gcc5/ppc32_allmodconfig

>  + /kisskb/src/drivers/usb/typec/tcpm/tcpm.c: error: case label does not reduce to an integer constant:  => 4724:3

arm64-gcc5.4/arm64-allmodconfig
powerpc-gcc5/powerpc-allmodconfig
powerpc-gcc5/ppc64_book3e_allmodconfig

>  + /kisskb/src/fs/xfs/xfs_buf.h: error: initializer element is not constant:  => 46:23
>  + /kisskb/src/sound/usb/midi.c: error: case label does not reduce to an integer constant:  => 1389:2

arm64-gcc5.4/arm64-allmodconfig
mipsel/mips-allmodconfig
powerpc-gcc5/powerpc-allmodconfig
powerpc-gcc5/powerpc-allyesconfig
powerpc-gcc5/ppc32_allmodconfig
powerpc-gcc5/ppc64_book3e_allmodconfig
powerpc-gcc5/ppc64le_allmodconfig

>  + /kisskb/src/include/linux/compiler_types.h: error: call to '__compiletime_assert_402' declared with attribute error: FIELD_PREP: mask is not constant:  => 352:38
>  + /kisskb/src/include/linux/compiler_types.h: error: call to '__compiletime_assert_404' declared with attribute error: FIELD_PREP: mask is not constant:  => 352:38

powerpc-gcc5/powerpc-allmodconfig


> *** WARNINGS ***
>
> 5 warning regressions:
>  + /kisskb/src/arch/m68k/include/asm/string.h: warning: '__builtin_memset' offset [0, 11] is out of the bounds [0, 0] [-Warray-bounds]:  => 68:25

m68k-gcc11/sun3_defconfig

>  + /kisskb/src/arch/s390/kernel/machine_kexec.c: warning: 'memcpy' offset [0, 511] is out of the bounds [0, 0] [-Warray-bounds]:  => 57:9

s390x-gcc11/s390-defconfig

>  + /kisskb/src/drivers/net/ethernet/i825xx/sun3_82586.c: warning: array subscript 1 is above array bounds of 'volatile struct transmit_cmd_struct *[1]' [-Warray-bounds]:  => 989:108, 989:122

m68k-gcc11/sun3_defconfig
m68k-gcc8/sun3_defconfig

>  + /kisskb/src/drivers/scsi/mpt3sas/mpt3sas_base.c: warning: array subscript 'Mpi2SasIOUnitPage1_t {aka struct _MPI2_CONFIG_PAGE_SASIOUNIT_1}[0]' is partly outside array bounds of 'unsigned char[20]' [-Warray-bounds]:  => 5400:40, 5403:43, 5396:40

powerpc-gcc11/skiroot_defconfig

>  + modpost: WARNING: modpost: EXPORT symbol "_mcount" [vmlinux] version generation failed, symbol will not be versioned.:  => N/A

sparc64-gcc11/sparc64-defconfig
sparc64/sparc64-defconfig

Gr{oetje,eeting}s,

 						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
 							    -- Linus Torvalds
