Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CF5E498927
	for <lists+alsa-devel@lfdr.de>; Mon, 24 Jan 2022 19:53:19 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7E42E281D;
	Mon, 24 Jan 2022 19:52:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7E42E281D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1643050398;
	bh=BdrNG2MZ50LS1ZAEoEpl5Y4dNokdg8pw0MnhVj/IVuM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=aWSsMGqAoEISUyIn1i0dOOxpb7pY1lKPolDQAXrleCIUGn9Y1yhTFCW7R2HXoXcB6
	 ujIFUXG95rX5dRMVejXU15NspY9qB5tE25L6l0lG8niQGn4Vhuaz3PgFMRUzMi4qTV
	 e11aZcqDWxiYnuNsnELPtzxoaGtuDxvaFLOv20zM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DC489F802BE;
	Mon, 24 Jan 2022 19:52:12 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 00BC9F8027C; Mon, 24 Jan 2022 19:52:10 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,PRX_BODY_135,SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mail-ot1-x331.google.com (mail-ot1-x331.google.com
 [IPv6:2607:f8b0:4864:20::331])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AEFCFF80083
 for <alsa-devel@alsa-project.org>; Mon, 24 Jan 2022 19:52:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AEFCFF80083
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="e0jdHKVO"
Received: by mail-ot1-x331.google.com with SMTP id
 o9-20020a9d7189000000b0059ee49b4f0fso6400335otj.2
 for <alsa-devel@alsa-project.org>; Mon, 24 Jan 2022 10:52:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=r9ORcgxwPP4ycG1Uxe8mTwFvOudbcps3q5Aj2rRnpck=;
 b=e0jdHKVOQgUpteOMfqGIsKj6bppWqqtxb5ZahWfm3lk77uMULiAbyRMiAKafk9wKhT
 obaUU1owPGL5j6q0WlyHQe9AZXD63iBfKn5yQBktSaUkSZYotefpB1vQhY2MmOd20UBa
 fdBk/sNOEbcRNXpK/Co7No3CejVyF+9fEZtBPov/vxP85W1L74LxnkeMRUb11+lGqngi
 KbyoW40hJ9R+ETAV8kSKkfrsiXWCw57UPUGDO88HRIlqTpbTn5NCBbuFoyhnfHe2+k+i
 GhAQO4/ddpnm1G0bgPsxgqM79TPbDXHjC18GDBxasAnV+4V0d2cXD4/AM/CNIFipJ34V
 Fudw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=r9ORcgxwPP4ycG1Uxe8mTwFvOudbcps3q5Aj2rRnpck=;
 b=Ztb7wbOr8ESrGm2ZkrFUMcd7I/SjWMLt5N+0U2CSqUTKIE6XDdfyw5jJYulKE5ZDdQ
 VuvVtNFTDB+rzk8R46TsCpoHSJd/M/9KA+3i/0HJu2XPKG42jgiN3IITQ+8qX2xZ/ojB
 DPKKx0kf9f+UDUIGM6DgNp862KGhi7CwxiiQEXQEtOIXo6HvSth9GeKz56ZCGTkRMicV
 7hm3Mif0UjbMPNePUyNmRT41m1FEyaSlyaBOth3xfmR5i5pdloa/FVrFZldzxacqU75J
 9O/GuAkhmpNE6uaAwFNtaYl3jpaTSD6SEhdn1NMO8e6yC4+bg/Hh0bzu5gMYTQB7vLvP
 KWIA==
X-Gm-Message-State: AOAM531t1PUZ+o0nOjEquT1/gezRERBMUBwHHwT0b1niYbYcWCj1OoaZ
 U1XySSxi4IN1HEhSeSNdClrIrf41JcG6Ibk/gKk=
X-Google-Smtp-Source: ABdhPJz1Khf3SO0+bH9fYxpAMD7XCc9wWdnY55JgNJ7kmV9RJ/cvxr18HoDYHDiBJbnuymI0c1uy0F3r7GxxZrlfypU=
X-Received: by 2002:a9d:601a:: with SMTP id h26mr3092033otj.357.1643050319496; 
 Mon, 24 Jan 2022 10:51:59 -0800 (PST)
MIME-Version: 1.0
References: <20220123125737.2658758-1-geert@linux-m68k.org>
 <alpine.DEB.2.22.394.2201240851560.2674757@ramsan.of.borg>
In-Reply-To: <alpine.DEB.2.22.394.2201240851560.2674757@ramsan.of.borg>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 24 Jan 2022 13:51:48 -0500
Message-ID: <CADnq5_MUq0fX7wMLJyUUxxa+2xoRinonL-TzD8tUhXALRfY8-A@mail.gmail.com>
Subject: Re: Build regressions/improvements in v5.17-rc1
To: Geert Uytterhoeven <geert@linux-m68k.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Cc: alsa-devel@alsa-project.org, kvm@vger.kernel.org,
 Network Development <netdev@vger.kernel.org>, linux-um@lists.infradead.org,
 LKML <linux-kernel@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, linux-mips@vger.kernel.org,
 Lakshmi Sowjanya D <lakshmi.sowjanya.d@intel.com>, sparclinux@vger.kernel.org,
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

On Mon, Jan 24, 2022 at 5:25 AM Geert Uytterhoeven <geert@linux-m68k.org> w=
rote:
>
> On Sun, 23 Jan 2022, Geert Uytterhoeven wrote:
> > Below is the list of build error/warning regressions/improvements in
> > v5.17-rc1[1] compared to v5.16[2].
> >
> > Summarized:
> >  - build errors: +17/-2
> >  - build warnings: +23/-25
> >
> > Note that there may be false regressions, as some logs are incomplete.
> > Still, they're build errors/warnings.
> >
> > Happy fixing! ;-)
> >
> > Thanks to the linux-next team for providing the build service.
> >
> > [1] http://kisskb.ellerman.id.au/kisskb/branch/linus/head/e783362eb54cd=
99b2cac8b3a9aeac942e6f6ac07/ (all 99 configs)
> > [2] http://kisskb.ellerman.id.au/kisskb/branch/linus/head/df0cc57e057f1=
8e44dac8e6c18aba47ab53202f9/ (98 out of 99 configs)
> >
> >
> > *** ERRORS ***
> >
> > 17 error regressions:
> >  + /kisskb/src/arch/powerpc/kernel/stacktrace.c: error: implicit declar=
ation of function 'nmi_cpu_backtrace' [-Werror=3Dimplicit-function-declarat=
ion]:  =3D> 171:2
> >  + /kisskb/src/arch/powerpc/kernel/stacktrace.c: error: implicit declar=
ation of function 'nmi_trigger_cpumask_backtrace' [-Werror=3Dimplicit-funct=
ion-declaration]:  =3D> 226:2
>
> powerpc-gcc5/skiroot_defconfig
>
> >  + /kisskb/src/arch/sparc/mm/srmmu.c: error: cast between incompatible =
function types from 'void (*)(long unsigned int)' to 'void (*)(long unsigne=
d int,  long unsigned int,  long unsigned int,  long unsigned int,  long un=
signed int)' [-Werror=3Dcast-function-type]:  =3D> 1756:13, 1639:13
> >  + /kisskb/src/arch/sparc/mm/srmmu.c: error: cast between incompatible =
function types from 'void (*)(struct mm_struct *)' to 'void (*)(long unsign=
ed int,  long unsigned int,  long unsigned int,  long unsigned int,  long u=
nsigned int)' [-Werror=3Dcast-function-type]:  =3D> 1674:29, 1662:29
> >  + /kisskb/src/arch/sparc/mm/srmmu.c: error: cast between incompatible =
function types from 'void (*)(struct mm_struct *, long unsigned int)' to 'v=
oid (*)(long unsigned int,  long unsigned int,  long unsigned int,  long un=
signed int,  long unsigned int)' [-Werror=3Dcast-function-type]:  =3D> 1767=
:21
> >  + /kisskb/src/arch/sparc/mm/srmmu.c: error: cast between incompatible =
function types from 'void (*)(struct vm_area_struct *, long unsigned int)' =
to 'void (*)(long unsigned int,  long unsigned int,  long unsigned int,  lo=
ng unsigned int,  long unsigned int)' [-Werror=3Dcast-function-type]:  =3D>=
 1741:29, 1726:29
> >  + /kisskb/src/arch/sparc/mm/srmmu.c: error: cast between incompatible =
function types from 'void (*)(struct vm_area_struct *, long unsigned int,  =
long unsigned int)' to 'void (*)(long unsigned int,  long unsigned int,  lo=
ng unsigned int,  long unsigned int,  long unsigned int)' [-Werror=3Dcast-f=
unction-type]:  =3D> 1694:29, 1711:29
>
> sparc64-gcc11/sparc-allmodconfig
>
> >  + /kisskb/src/arch/um/include/asm/processor-generic.h: error: called o=
bject is not a function or function pointer:  =3D> 103:18
> >  + /kisskb/src/drivers/vfio/pci/vfio_pci_rdwr.c: error: assignment make=
s pointer from integer without a cast [-Werror=3Dint-conversion]:  =3D> 324=
:9, 317:9
> >  + /kisskb/src/drivers/vfio/pci/vfio_pci_rdwr.c: error: implicit declar=
ation of function 'ioport_map' [-Werror=3Dimplicit-function-declaration]:  =
=3D> 317:11
> >  + /kisskb/src/drivers/vfio/pci/vfio_pci_rdwr.c: error: implicit declar=
ation of function 'ioport_unmap' [-Werror=3Dimplicit-function-declaration]:=
  =3D> 338:15
>
> um-x86_64/um-allyesconfig
>
> >  + /kisskb/src/drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_topology.c: err=
or: control reaches end of non-void function [-Werror=3Dreturn-type]:  =3D>=
 1560:1

I don't really see what's going on here:

#ifdef CONFIG_X86_64
return cpu_data(first_cpu_of_numa_node).apicid;
#else
return first_cpu_of_numa_node;
#endif

Alex

>
> um-x86_64/um-all{mod,yes}config
>
> >  + /kisskb/src/drivers/net/ethernet/freescale/fec_mpc52xx.c: error: pas=
sing argument 2 of 'mpc52xx_fec_set_paddr' discards 'const' qualifier from =
pointer target type [-Werror=3Ddiscarded-qualifiers]:  =3D> 659:29
>
> powerpc-gcc5/ppc32_allmodconfig
>
> >  + /kisskb/src/drivers/pinctrl/pinctrl-thunderbay.c: error: assignment =
discards 'const' qualifier from pointer target type [-Werror=3Ddiscarded-qu=
alifiers]:  =3D> 815:8, 815:29
>
> arm64-gcc5.4/arm64-allmodconfig
> arm64-gcc8/arm64-allmodconfig
>
> >  + /kisskb/src/lib/test_printf.c: error: "PTR" redefined [-Werror]:  =
=3D> 247:0, 247
> >  + /kisskb/src/sound/pci/ca0106/ca0106.h: error: "PTR" redefined [-Werr=
or]:  =3D> 62, 62:0
>
> mips-gcc8/mips-allmodconfig
> mipsel/mips-allmodconfig
>
> >  + error: arch/powerpc/kvm/book3s_64_entry.o: relocation truncated to f=
it: R_PPC64_REL14 (stub) against symbol `machine_check_common' defined in .=
text section in arch/powerpc/kernel/head_64.o:  =3D> (.text+0x3e4)
>
> powerpc-gcc5/powerpc-allyesconfig
>
> Gr{oetje,eeting}s,
>
>                                                 Geert
>
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m6=
8k.org
>
> In personal conversations with technical people, I call myself a hacker. =
But
> when I'm talking to journalists I just say "programmer" or something like=
 that.
>                                                             -- Linus Torv=
alds
