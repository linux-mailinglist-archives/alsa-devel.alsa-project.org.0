Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 46B331BF457
	for <lists+alsa-devel@lfdr.de>; Thu, 30 Apr 2020 11:43:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DFA5A1689;
	Thu, 30 Apr 2020 11:43:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DFA5A1689
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1588239831;
	bh=zWjoXtNrZTPiSjxEO6QpTxg2JoXjQWxv1Esfc5Ha67k=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fTQ8OrPWNnkYkJb4kzC8K+zbdkyDhvuEKL2zipPrVT10oOS7l2q4ltDr2ezZPqblf
	 w8IrYrUSlkzy+pC7ZIDqKFnQJpsIEQmfFOsOT1IrnaIJky/+jNM+tgjEdybPlF3j00
	 Wrllqvel5UKY4hUy1P3INoeA1F6jCEx2jwIKP3X4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F4192F80123;
	Thu, 30 Apr 2020 11:42:09 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C25CBF801DB; Thu, 30 Apr 2020 11:42:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=HTML_MESSAGE,SPF_HELO_NONE,
 SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from zm-mta-out-3.u-ga.fr (zm-mta-out-3.u-ga.fr [152.77.200.56])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7795EF80123
 for <alsa-devel@alsa-project.org>; Thu, 30 Apr 2020 11:41:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7795EF80123
Received: from zm-mta-out.u-ga.fr (zm-mta-out.u-ga.fr [152.77.200.53])
 by zm-mta-out-3.u-ga.fr (Postfix) with ESMTP id EA9D14110A;
 Thu, 30 Apr 2020 11:41:56 +0200 (CEST)
Received: from zm-mbx06.u-ga.fr (zm-mbx06.u-ga.fr [152.77.200.20])
 by zm-mta-out.u-ga.fr (Postfix) with ESMTP id E154A805AE;
 Thu, 30 Apr 2020 11:41:56 +0200 (CEST)
Date: Thu, 30 Apr 2020 11:41:56 +0200 (CEST)
From: =?utf-8?B?RlLDiUTDiVJJQw==?= RECOULES
 <frederic.recoules@univ-grenoble-alpes.fr>
To: tiwai <tiwai@suse.de>
Message-ID: <640422029.9300033.1588239716857.JavaMail.zimbra@univ-grenoble-alpes.fr>
In-Reply-To: <s5h4kt2ln5s.wl-tiwai@suse.de>
References: <20200427165707.17570-1-frederic.recoules@univ-grenoble-alpes.fr>
 <s5h4kt2ln5s.wl-tiwai@suse.de>
Subject: Re: [PATCH] [inline assembly] fix pcm_dmix_i386.h assembly chunk
 interfaces
MIME-Version: 1.0
X-Originating-IP: [46.193.2.18]
X-Mailer: Zimbra 8.8.15_GA_3918 (ZimbraWebClient - FF72 (Linux)/8.8.15_GA_3895)
Thread-Topic: fix pcm_dmix_i386.h assembly chunk interfaces
Thread-Index: iRxVPlWUtR+B1zXl/N4BLXpgotCvVA==
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Cc: alsa-devel <alsa-devel@alsa-project.org>,
 frederic recoules <frederic.recoules@orange.fr>
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

Hi Takashi,=20

I resubmitted the patch (V2) with some modifications:=20
- I split the changes so you will not have to apply all of them;=20
- the 4 first patches are the ones for safety, and barely produce the same =
binary output some I am highly confident in the fact they do not need testi=
ng;=20
- the 2 last patches are small changes that can help the compiler producing=
 a better/smaller code. They have not been tested yet. Have you any ready t=
o go benchmark to test with?=20
- the patches work both on 32- and 64bit version.=20

To compare the binary output, I used objdump and diff on libpcm.a. I compar=
ed the master with each patch with both 32 and 64 versions.=20

Hope it will help.=20
Regards,=20
Fr=C3=A9d=C3=A9ric=20


De: "tiwai" <tiwai@suse.de>=20
=C3=80: "frederic recoules" <frederic.recoules@univ-grenoble-alpes.fr>=20
Cc: "alsa-devel" <alsa-devel@alsa-project.org>, "frederic recoules" <freder=
ic.recoules@orange.fr>=20
Envoy=C3=A9: Mercredi 29 Avril 2020 10:19:11=20
Objet: Re: [PATCH] [inline assembly] fix pcm_dmix_i386.h assembly chunk int=
erfaces=20

On Mon, 27 Apr 2020 18:57:07 +0200,=20
frederic.recoules@univ-grenoble-alpes.fr wrote:=20
>=20
> From: Fr=C3=A9d=C3=A9ric Recoules <frederic.recoules@orange.fr>=20
>=20
> Enabler change:=20
> - set HAVE_MMX in configure if the compiler is aware of MMX technology=20
>=20
> Main changes are:=20
> - move 'size' and 'old_ebx' to the output list since they are clobbered=
=20
> - add the "memory" keyword since input pointers are dereferenced=20
> - add mmx registers in the clobber list and add an initialization for mm1=
=20
> - add ebx in clobbers via a set of macro when GCC is newer than 5.0=20
> (it will work for other compilers or non-PIC mode too)=20
>=20
> Minor changes are:=20
> - keep consistent the token numbering in the template=20
> - remove the manual save/restore ebx when it is in the clobber list=20
> - allows 'dst_step', 'src_step' and 'sum_step' to be given by immediates=
=20
> - allows 'size' to be given by register (e.g. ebp)=20
> - add "cc" keyword since the eflag register is clobbered=20
>=20
> Signed-off-by: Fr=C3=A9d=C3=A9ric Recoules <frederic.recoules@orange.fr>=
=20

Thanks. Now I confirmed that the build test passed.=20

But before merging the patch: have you actually tested the code on=20
your machine and confirmed that it keeps working? If you've tested,=20
it'd be helpful to mention about the test coverage, it's a good=20
measure for judgment. Since it handles different compile flavors=20
(with and without MMX support), I'd like to know whether it's actually=20
tested.=20

BTW, when you resubmit a patch with the correction, please put "v2" or=20
whatever the revision in the subject to tell from the earlier=20
patches. Also, it'd be appreciated to list up summaries of changes=20
between v1 and v2 in the patch description or after the separator line=20
("---") if you don't need to include that in the git commit log.=20


thanks,=20

Takashi=20

> ---=20
> configure.ac | 7 ++=20
> src/pcm/pcm_dmix_i386.h | 174 +++++++++++++++++++++++-----------------=20
> 2 files changed, 106 insertions(+), 75 deletions(-)=20
>=20
> diff --git a/configure.ac b/configure.ac=20
> index 4b5ab662..1838e50b 100644=20
> --- a/configure.ac=20
> +++ b/configure.ac=20
> @@ -516,6 +516,13 @@ if test -z "$gcc_have_atomics"; then=20
> fi=20
> AC_MSG_RESULT($gcc_have_atomics)=20
>=20
> +dnl check mmx register for pcm_dmix_i386=20
> +=20
> +AC_TRY_LINK([],=20
> + [__asm__ volatile ("" : : : "mm0");],=20
> + [AC_DEFINE([HAVE_MMX], "1", [MMX technology is enabled])],=20
> + [])=20
> +=20
> PCM_PLUGIN_LIST=3D"copy linear route mulaw alaw adpcm rate plug multi shm=
 file null empty share meter hooks lfloat ladspa dmix dshare dsnoop asym ie=
c958 softvol extplug ioplug mmap_emul"=20
>=20
> build_pcm_plugin=3D"no"=20
> diff --git a/src/pcm/pcm_dmix_i386.h b/src/pcm/pcm_dmix_i386.h=20
> index 2778cb1d..aa1717f6 100644=20
> --- a/src/pcm/pcm_dmix_i386.h=20
> +++ b/src/pcm/pcm_dmix_i386.h=20
> @@ -26,6 +26,13 @@=20
> *=20
> */=20
>=20
> +#define COMMA ,=20
> +#if __GNUC__ < 5 && defined(__PIC__)=20
> +# define GCC_PIC_SWITCH(before,after) before=20
> +#else=20
> +# define GCC_PIC_SWITCH(before,after) after=20
> +#endif=20
> +=20
> /*=20
> * for plain i386=20
> */=20
> @@ -47,13 +54,14 @@ static void MIX_AREAS_16(unsigned int size,=20
> __asm__ __volatile__ (=20
> "\n"=20
>=20
> - "\tmovl %%ebx, %7\n" /* ebx is GOT pointer (-fPIC) */=20
> + /* ebx is GOT pointer (-fPIC) */=20
> + GCC_PIC_SWITCH("\tmovl %%ebx, %1\n",)=20
> /*=20
> * initialization, load ESI, EDI, EBX registers=20
> */=20
> - "\tmovl %1, %%edi\n"=20
> - "\tmovl %2, %%esi\n"=20
> - "\tmovl %3, %%ebx\n"=20
> + "\tmovl %2, %%edi\n"=20
> + "\tmovl %3, %%esi\n"=20
> + "\tmovl %4, %%ebx\n"=20
> "\tcmpl $0, %0\n"=20
> "\tjnz 2f\n"=20
> "\tjmp 7f\n"=20
> @@ -64,9 +72,9 @@ static void MIX_AREAS_16(unsigned int size,=20
> */=20
> "\t.p2align 4,,15\n"=20
> "1:"=20
> - "\tadd %4, %%edi\n"=20
> - "\tadd %5, %%esi\n"=20
> - "\tadd %6, %%ebx\n"=20
> + "\tadd %5, %%edi\n"=20
> + "\tadd %6, %%esi\n"=20
> + "\tadd %7, %%ebx\n"=20
>=20
> /*=20
> * sample =3D *src;=20
> @@ -138,15 +146,16 @@ static void MIX_AREAS_16(unsigned int size,=20
> "\tjnz 4b\n"=20
> "\tdecl %0\n"=20
> "\tjnz 1b\n"=20
> -=20
> - "7:"=20
> - "\tmovl %7, %%ebx\n" /* ebx is GOT pointer (-fPIC) */=20
>=20
> - : /* no output regs */=20
> - : "m" (size), "m" (dst), "m" (src),=20
> - "m" (sum), "m" (dst_step), "m" (src_step),=20
> - "m" (sum_step), "m" (old_ebx)=20
> - : "esi", "edi", "edx", "ecx", "eax"=20
> + "7:"=20
> + /* ebx is GOT pointer (-fPIC) */=20
> + GCC_PIC_SWITCH("\tmovl %1, %%ebx\n",)=20
> +=20
> + : "+&rm" (size), GCC_PIC_SWITCH("=3Dm","=3DX") (old_ebx)=20
> + : "m" (dst), "m" (src), "m" (sum),=20
> + "im" (dst_step), "im" (src_step), "im" (sum_step)=20
> + : "esi", "edi", "edx", "ecx", GCC_PIC_SWITCH(,"ebx"COMMA) "eax",=20
> + "memory", "cc"=20
> );=20
> }=20
>=20
> @@ -171,22 +180,24 @@ static void MIX_AREAS_16_MMX(unsigned int size,=20
> __asm__ __volatile__ (=20
> "\n"=20
>=20
> - "\tmovl %%ebx, %7\n" /* ebx is GOT pointer (-fPIC) */=20
> + /* ebx is GOT pointer (-fPIC) */=20
> + GCC_PIC_SWITCH("\tmovl %%ebx, %1\n",)=20
> /*=20
> - * initialization, load ESI, EDI, EBX registers=20
> + * initialization, load ESI, EDI, EBX registers, clear MM1=20
> */=20
> - "\tmovl %1, %%edi\n"=20
> - "\tmovl %2, %%esi\n"=20
> - "\tmovl %3, %%ebx\n"=20
> + "\tpxor %%mm1, %%mm1\n"=20
> + "\tmovl %2, %%edi\n"=20
> + "\tmovl %3, %%esi\n"=20
> + "\tmovl %4, %%ebx\n"=20
> "\tcmpl $0, %0\n"=20
> "\tjnz 2f\n"=20
> "\tjmp 5f\n"=20
>=20
> "\t.p2align 4,,15\n"=20
> "1:"=20
> - "\tadd %4, %%edi\n"=20
> - "\tadd %5, %%esi\n"=20
> - "\tadd %6, %%ebx\n"=20
> + "\tadd %5, %%edi\n"=20
> + "\tadd %6, %%esi\n"=20
> + "\tadd %7, %%ebx\n"=20
>=20
> "2:"=20
> /*=20
> @@ -230,13 +241,20 @@ static void MIX_AREAS_16_MMX(unsigned int size,=20
> "\tjnz 1b\n"=20
> "\temms\n"=20
> "5:"=20
> - "\tmovl %7, %%ebx\n" /* ebx is GOT pointer (-fPIC) */=20
> -=20
> - : /* no output regs */=20
> - : "m" (size), "m" (dst), "m" (src),=20
> - "m" (sum), "m" (dst_step), "m" (src_step),=20
> - "m" (sum_step), "m" (old_ebx)=20
> - : "esi", "edi", "edx", "ecx", "eax"=20
> + /* ebx is GOT pointer (-fPIC) */=20
> + GCC_PIC_SWITCH("\tmovl %1, %%ebx\n",)=20
> +=20
> + : "+&rm" (size), GCC_PIC_SWITCH("=3Dm","=3DX") (old_ebx)=20
> + : "m" (dst), "m" (src), "m" (sum),=20
> + "im" (dst_step), "im" (src_step), "im" (sum_step)=20
> + : "esi", "edi", "edx", "ecx", GCC_PIC_SWITCH(,"ebx"COMMA) "eax",=20
> + "memory", "cc",=20
> +# ifdef HAVE_MMX=20
> + "mm0", "mm1"=20
> +# else=20
> + "st", "st(1)", "st(2)", "st(3)",=20
> + "st(4)", "st(5)", "st(6)", "st(7)"=20
> +# endif=20
> );=20
> }=20
>=20
> @@ -261,13 +279,14 @@ static void MIX_AREAS_32(unsigned int size,=20
> __asm__ __volatile__ (=20
> "\n"=20
>=20
> - "\tmovl %%ebx, %7\n" /* ebx is GOT pointer (-fPIC) */=20
> + /* ebx is GOT pointer (-fPIC) */=20
> + GCC_PIC_SWITCH("\tmovl %%ebx, %1\n",)=20
> /*=20
> * initialization, load ESI, EDI, EBX registers=20
> */=20
> - "\tmovl %1, %%edi\n"=20
> - "\tmovl %2, %%esi\n"=20
> - "\tmovl %3, %%ebx\n"=20
> + "\tmovl %2, %%edi\n"=20
> + "\tmovl %3, %%esi\n"=20
> + "\tmovl %4, %%ebx\n"=20
> "\tcmpl $0, %0\n"=20
> "\tjnz 1f\n"=20
> "\tjmp 6f\n"=20
> @@ -337,19 +356,20 @@ static void MIX_AREAS_32(unsigned int size,=20
> */=20
> "\tdecl %0\n"=20
> "\tjz 6f\n"=20
> - "\tadd %4, %%edi\n"=20
> - "\tadd %5, %%esi\n"=20
> - "\tadd %6, %%ebx\n"=20
> + "\tadd %5, %%edi\n"=20
> + "\tadd %6, %%esi\n"=20
> + "\tadd %7, %%ebx\n"=20
> "\tjmp 1b\n"=20
> -=20
> - "6:"=20
> - "\tmovl %7, %%ebx\n" /* ebx is GOT pointer (-fPIC) */=20
>=20
> - : /* no output regs */=20
> - : "m" (size), "m" (dst), "m" (src),=20
> - "m" (sum), "m" (dst_step), "m" (src_step),=20
> - "m" (sum_step), "m" (old_ebx)=20
> - : "esi", "edi", "edx", "ecx", "eax"=20
> + "6:"=20
> + /* ebx is GOT pointer (-fPIC) */=20
> + GCC_PIC_SWITCH("\tmovl %1, %%ebx\n",)=20
> +=20
> + : "+&rm" (size), GCC_PIC_SWITCH("=3Dm","=3DX") (old_ebx)=20
> + : "m" (dst), "m" (src), "m" (sum),=20
> + "im" (dst_step), "im" (src_step), "im" (sum_step)=20
> + : "esi", "edi", "edx", "ecx", GCC_PIC_SWITCH(,"ebx"COMMA) "eax",=20
> + "memory", "cc"=20
> );=20
> }=20
>=20
> @@ -374,13 +394,14 @@ static void MIX_AREAS_24(unsigned int size,=20
> __asm__ __volatile__ (=20
> "\n"=20
>=20
> - "\tmovl %%ebx, %7\n" /* ebx is GOT pointer (-fPIC) */=20
> + /* ebx is GOT pointer (-fPIC) */=20
> + GCC_PIC_SWITCH("\tmovl %%ebx, %1\n",)=20
> /*=20
> * initialization, load ESI, EDI, EBX registers=20
> */=20
> - "\tmovl %1, %%edi\n"=20
> - "\tmovl %2, %%esi\n"=20
> - "\tmovl %3, %%ebx\n"=20
> + "\tmovl %2, %%edi\n"=20
> + "\tmovl %3, %%esi\n"=20
> + "\tmovl %4, %%ebx\n"=20
> "\tcmpl $0, %0\n"=20
> "\tjnz 1f\n"=20
> "\tjmp 6f\n"=20
> @@ -443,19 +464,20 @@ static void MIX_AREAS_24(unsigned int size,=20
> */=20
> "\tdecl %0\n"=20
> "\tjz 6f\n"=20
> - "\tadd %4, %%edi\n"=20
> - "\tadd %5, %%esi\n"=20
> - "\tadd %6, %%ebx\n"=20
> + "\tadd %5, %%edi\n"=20
> + "\tadd %6, %%esi\n"=20
> + "\tadd %7, %%ebx\n"=20
> "\tjmp 1b\n"=20
> -=20
> - "6:"=20
> - "\tmovl %7, %%ebx\n" /* ebx is GOT pointer (-fPIC) */=20
>=20
> - : /* no output regs */=20
> - : "m" (size), "m" (dst), "m" (src),=20
> - "m" (sum), "m" (dst_step), "m" (src_step),=20
> - "m" (sum_step), "m" (old_ebx)=20
> - : "esi", "edi", "edx", "ecx", "eax"=20
> + "6:"=20
> + /* ebx is GOT pointer (-fPIC) */=20
> + GCC_PIC_SWITCH("\tmovl %1, %%ebx\n",)=20
> +=20
> + : "+&rm" (size), GCC_PIC_SWITCH("=3Dm","=3DX") (old_ebx)=20
> + : "m" (dst), "m" (src), "m" (sum),=20
> + "im" (dst_step), "im" (src_step), "im" (sum_step)=20
> + : "esi", "edi", "edx", "ecx", GCC_PIC_SWITCH(,"ebx"COMMA) "eax",=20
> + "memory", "cc"=20
> );=20
> }=20
>=20
> @@ -480,13 +502,14 @@ static void MIX_AREAS_24_CMOV(unsigned int size,=20
> __asm__ __volatile__ (=20
> "\n"=20
>=20
> - "\tmovl %%ebx, %7\n" /* ebx is GOT pointer (-fPIC) */=20
> + /* ebx is GOT pointer (-fPIC) */=20
> + GCC_PIC_SWITCH("\tmovl %%ebx, %1\n",)=20
> /*=20
> * initialization, load ESI, EDI, EBX registers=20
> */=20
> - "\tmovl %1, %%edi\n"=20
> - "\tmovl %2, %%esi\n"=20
> - "\tmovl %3, %%ebx\n"=20
> + "\tmovl %2, %%edi\n"=20
> + "\tmovl %3, %%esi\n"=20
> + "\tmovl %4, %%ebx\n"=20
> "\tcmpl $0, %0\n"=20
> "\tjz 6f\n"=20
>=20
> @@ -541,19 +564,20 @@ static void MIX_AREAS_24_CMOV(unsigned int size,=20
> /*=20
> * while (size-- > 0)=20
> */=20
> - "\tadd %4, %%edi\n"=20
> - "\tadd %5, %%esi\n"=20
> - "\tadd %6, %%ebx\n"=20
> + "\tadd %5, %%edi\n"=20
> + "\tadd %6, %%esi\n"=20
> + "\tadd %7, %%ebx\n"=20
> "\tdecl %0\n"=20
> "\tjnz 1b\n"=20
> -=20
> - "6:"=20
> - "\tmovl %7, %%ebx\n" /* ebx is GOT pointer (-fPIC) */=20
>=20
> - : /* no output regs */=20
> - : "m" (size), "m" (dst), "m" (src),=20
> - "m" (sum), "m" (dst_step), "m" (src_step),=20
> - "m" (sum_step), "m" (old_ebx)=20
> - : "esi", "edi", "edx", "ecx", "eax"=20
> + "6:"=20
> + /* ebx is GOT pointer (-fPIC) */=20
> + GCC_PIC_SWITCH("\tmovl %1, %%ebx\n",)=20
> +=20
> + : "+&rm" (size), GCC_PIC_SWITCH("=3Dm","=3DX") (old_ebx)=20
> + : "m" (dst), "m" (src), "m" (sum),=20
> + "im" (dst_step), "im" (src_step), "im" (sum_step)=20
> + : "esi", "edi", "edx", "ecx", GCC_PIC_SWITCH(,"ebx"COMMA) "eax",=20
> + "memory", "cc"=20
> );=20
> }=20
> --=20
> 2.17.1=20
>=20
