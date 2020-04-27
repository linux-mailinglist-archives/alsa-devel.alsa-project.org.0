Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A90B61BA9AA
	for <lists+alsa-devel@lfdr.de>; Mon, 27 Apr 2020 18:02:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 50A40168E;
	Mon, 27 Apr 2020 18:01:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 50A40168E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1588003359;
	bh=7sETuuX7INXfSIofdAjAtKTYbv4L8yRZk5vUkIZ6jIk=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=vt0apx0lkETXJtMRCS9nJ4nOX89NYKDV5fgS+lTXyd6cR/jzLWn8WiaYVOzNnztM7
	 X7mLfVt1Cfu642MGfWSZP1zlvAGYW8jrbDAiwh7ElY7/Npq1kmlk1ZSCSGVQQU0xgs
	 1TxUB6pT39DomTYzTjQjDV30clQIYihGL/BGdlmE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5D555F80232;
	Mon, 27 Apr 2020 18:00:58 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 588C0F8022B; Mon, 27 Apr 2020 18:00:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=PRX_BODY_141,SPF_HELO_NONE,
 SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from zm-mta-out-3.u-ga.fr (zm-mta-out-3.u-ga.fr [152.77.200.56])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DCD85F8010A
 for <alsa-devel@alsa-project.org>; Mon, 27 Apr 2020 18:00:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DCD85F8010A
Received: from zm-mta-out.u-ga.fr (zm-mta-out.u-ga.fr [152.77.200.53])
 by zm-mta-out-3.u-ga.fr (Postfix) with ESMTP id 475FA41181;
 Mon, 27 Apr 2020 18:00:48 +0200 (CEST)
Received: from zm-mbx06.u-ga.fr (zm-mbx06.u-ga.fr [152.77.200.20])
 by zm-mta-out.u-ga.fr (Postfix) with ESMTP id 4202B80693;
 Mon, 27 Apr 2020 18:00:48 +0200 (CEST)
Date: Mon, 27 Apr 2020 18:00:48 +0200 (CEST)
From: =?utf-8?B?RlLDiUTDiVJJQw==?= RECOULES
 <frederic.recoules@univ-grenoble-alpes.fr>
To: tiwai <tiwai@suse.de>
Message-ID: <60757998.6985565.1588003248227.JavaMail.zimbra@univ-grenoble-alpes.fr>
In-Reply-To: <s5hr1w9nesj.wl-tiwai@suse.de>
References: <20200427073604.26662-1-frederic.recoules@univ-grenoble-alpes.fr>
 <s5h1ro9oxbd.wl-tiwai@suse.de>
 <1871992915.6898305.1587998132827.JavaMail.zimbra@univ-grenoble-alpes.fr>
 <s5hr1w9nesj.wl-tiwai@suse.de>
Subject: Re: [PATCH] [inline assembly] fix pcm_dmix_i386.h assembly chunk
 interfaces
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [46.193.2.18]
X-Mailer: Zimbra 8.8.15_GA_3918 (ZimbraWebClient - FF72 (Linux)/8.8.15_GA_3895)
Thread-Topic: fix pcm_dmix_i386.h assembly chunk interfaces
Thread-Index: ZXAsRRhqfN2DeSkWDF/sFaWI0jMJXw==
Cc: alsa-devel <alsa-devel@alsa-project.org>
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

> Actually the mmx support isn't about whether the compiler supports it=20
> or not. With inline asm, the MMX-enabled code is always included in=20
> alsa-lib as well as the code without MMX, then which one to be=20
> executed is dynamically switched at runtime by probing the CPU=20
> capability.=20

Yes and the problem is that if MMX technology is enabled, the=20
compiler could technically choose to store some data in these registers;=20
data that will be overwritten by the chunk.=20
The role of the clobber list is to inform the compiler that these registers=
=20
are used and modified.=20

If the MMX technology is not enabled, the compiler will not use them=20
anyway, so there is no need to put them in clobbers.=20
However (this is the beauty of x86...), they will clobber x87 floating=20
point registers so, I would say:=20
if HAVE_MMX -> "mm0" , "mm1"=20
else -> "st" , "st(1)" , "st(2)" , "st(3)" , "st(4)" , "st(5)" , "st(6)" , =
"st(7)"

Regards,
Fr=C3=A9d=C3=A9ric Recoules

----- Mail original -----
De: "tiwai" <tiwai@suse.de>
=C3=80: "FR=C3=89D=C3=89RIC RECOULES" <frederic.recoules@univ-grenoble-alpe=
s.fr>
Cc: "alsa-devel" <alsa-devel@alsa-project.org>
Envoy=C3=A9: Lundi 27 Avril 2020 17:12:28
Objet: Re: [PATCH] [inline assembly] fix pcm_dmix_i386.h assembly chunk int=
erfaces

Please don't drop Cc to ML.=20

And about the comments:=20

On Mon, 27 Apr 2020 16:35:32 +0200,=20
FR=C3=89D=C3=89RIC RECOULES wrote:=20
>=20
> I wrongly assumed that the option -mmmx was passed when compiling (re)=20
> mix_areas_16_mmx.=20
> I know how to fix it (inspired of ffmpeg):=20
> - the configure test if mmx is supported by the compiler option and set a=
=20
> macro HAVE_MMX accordingly (maybe something already exist?).=20

Actually the mmx support isn't about whether the compiler supports it=20
or not. With inline asm, the MMX-enabled code is always included in=20
alsa-lib as well as the code without MMX, then which one to be=20
executed is dynamically switched at runtime by probing the CPU=20
capability.=20


thanks,=20

Takashi=20

> - declare a macro MMX_CLOBBERS(list) that will output the list when HAVE_=
MMX=20
> is true and nothing otherwise.=20
> I will resubmit a patch soon.=20
>=20
> Regards,=20
> Fr=C3=A9d=C3=A9ric Recoules=20
>=20
> -------------------------------------------------------------------------=
-----=20
> De: "tiwai" <tiwai@suse.de>=20
> =C3=80: "frederic recoules" <frederic.recoules@univ-grenoble-alpes.fr>=20
> Cc: "alsa-devel" <alsa-devel@alsa-project.org>, "frederic recoules"=20
> <frederic.recoules@orange.fr>=20
> Envoy=C3=A9: Lundi 27 Avril 2020 15:47:02=20
> Objet: Re: [PATCH] [inline assembly] fix pcm_dmix_i386.h assembly chunk=
=20
> interfaces=20
>=20
> On Mon, 27 Apr 2020 09:36:04 +0200,=20
> frederic.recoules@univ-grenoble-alpes.fr wrote:=20
> >=20
> > From: Fr=C3=A9d=C3=A9ric Recoules <frederic.recoules@orange.fr>=20
> >=20
> > Main changes are:=20
> > - move 'size' and 'old_ebx' to the output list since they are clobbered=
=20
> > - add the "memory" keyword since input pointers are dereferenced=20
> > - add mmx registers in the clobber list and add an initialization for m=
m1=20
> > - add ebx in clobbers via a set of macro when GCC is newer than 5.0=20
> > (it will work for other compilers or non-PIC mode too)=20
> >=20
> > Minor changes are:=20
> > - keep consistent the token numbering in the template=20
> > - remove the manual save/restore ebx when it is in the clobber list=20
> > - allows 'dst_step', 'src_step' and 'sum_step' to be given by immediate=
s=20
> > - allows 'size' to be given by register (e.g. ebp)=20
> > - add "cc" keyword since the eflag register is clobbered=20
> >=20
> > Signed-off-by: Fr=C3=A9d=C3=A9ric Recoules <frederic.recoules@orange.fr=
>=20
>=20
> When I apply this and build for i386 with gcc9, I got the following=20
> error:=20
> pcm_dmix_i386.h: In function 'mix_areas_16_mmx':=20
> pcm_dmix_i386.h:180:2: error: unknown register name 'mm1' in 'asm'=20
> 180 | __asm__ __volatile__ (=20
> | ^~~~~~~=20
> pcm_dmix_i386.h:180:2: error: unknown register name 'mm0' in 'asm'=20
> In file included from pcm_dmix_i386.c:31,=20
> from pcm_dmix.c:144:=20
> pcm_dmix_i386.h: In function 'remix_areas_16_mmx':=20
> pcm_dmix_i386.h:180:2: error: unknown register name 'mm1' in 'asm'=20
> 180 | __asm__ __volatile__ (=20
> | ^~~~~~~=20
> ....=20
>=20
> Could you check those errors?=20
>=20
> thanks,=20
>=20
> Takashi=20
>=20
> > ---=20
> > src/pcm/pcm_dmix_i386.h | 168 ++++++++++++++++++++++------------------=
=20
> > 1 file changed, 93 insertions(+), 75 deletions(-)=20
> >=20
> > diff --git a/src/pcm/pcm_dmix_i386.h b/src/pcm/pcm_dmix_i386.h=20
> > index 2778cb1d..af2f4630 100644=20
> > --- a/src/pcm/pcm_dmix_i386.h=20
> > +++ b/src/pcm/pcm_dmix_i386.h=20
> > @@ -26,6 +26,13 @@=20
> > *=20
> > */=20
> >=20
> > +#define COMMA ,=20
> > +#if __GNUC__ < 5 && defined(__PIC__)=20
> > +# define GCC_PIC_SWITCH(before,after) before=20
> > +#else=20
> > +# define GCC_PIC_SWITCH(before,after) after=20
> > +#endif=20
> > +=20
> > /*=20
> > * for plain i386=20
> > */=20
> > @@ -47,13 +54,14 @@ static void MIX_AREAS_16(unsigned int size,=20
> > __asm__ __volatile__ (=20
> > "\n"=20
> >=20
> > - "\tmovl %%ebx, %7\n" /* ebx is GOT pointer (-fPIC) *=20
> /=20
> > + /* ebx is GOT pointer (-fPIC) */=20
> > + GCC_PIC_SWITCH("\tmovl %%ebx, %1\n",)=20
> > /*=20
> > * initialization, load ESI, EDI, EBX registers=20
> > */=20
> > - "\tmovl %1, %%edi\n"=20
> > - "\tmovl %2, %%esi\n"=20
> > - "\tmovl %3, %%ebx\n"=20
> > + "\tmovl %2, %%edi\n"=20
> > + "\tmovl %3, %%esi\n"=20
> > + "\tmovl %4, %%ebx\n"=20
> > "\tcmpl $0, %0\n"=20
> > "\tjnz 2f\n"=20
> > "\tjmp 7f\n"=20
> > @@ -64,9 +72,9 @@ static void MIX_AREAS_16(unsigned int size,=20
> > */=20
> > "\t.p2align 4,,15\n"=20
> > "1:"=20
> > - "\tadd %4, %%edi\n"=20
> > - "\tadd %5, %%esi\n"=20
> > - "\tadd %6, %%ebx\n"=20
> > + "\tadd %5, %%edi\n"=20
> > + "\tadd %6, %%esi\n"=20
> > + "\tadd %7, %%ebx\n"=20
> >=20
> > /*=20
> > * sample =3D *src;=20
> > @@ -138,15 +146,16 @@ static void MIX_AREAS_16(unsigned int size,=20
> > "\tjnz 4b\n"=20
> > "\tdecl %0\n"=20
> > "\tjnz 1b\n"=20
> > -=20
> > - "7:"=20
> > - "\tmovl %7, %%ebx\n" /* ebx is GOT pointer (-fPIC) *=20
> /=20
> >=20
> > - : /* no output regs */=20
> > - : "m" (size), "m" (dst), "m" (src),=20
> > - "m" (sum), "m" (dst_step), "m" (src_step),=20
> > - "m" (sum_step), "m" (old_ebx)=20
> > - : "esi", "edi", "edx", "ecx", "eax"=20
> > + "7:"=20
> > + /* ebx is GOT pointer (-fPIC) */=20
> > + GCC_PIC_SWITCH("\tmovl %1, %%ebx\n",)=20
> > +=20
> > + : "+&rm" (size), GCC_PIC_SWITCH("=3Dm","=3DX") (old_ebx)=20
> > + : "m" (dst), "m" (src), "m" (sum),=20
> > + "im" (dst_step), "im" (src_step), "im" (sum_step)=20
> > + : "esi", "edi", "edx", "ecx", GCC_PIC_SWITCH(,"ebx"COMMA)=20
> "eax",=20
> > + "memory", "cc"=20
> > );=20
> > }=20
> >=20
> > @@ -171,22 +180,24 @@ static void MIX_AREAS_16_MMX(unsigned int size,=
=20
> > __asm__ __volatile__ (=20
> > "\n"=20
> >=20
> > - "\tmovl %%ebx, %7\n" /* ebx is GOT pointer (-fPIC) *=20
> /=20
> > + /* ebx is GOT pointer (-fPIC) */=20
> > + GCC_PIC_SWITCH("\tmovl %%ebx, %1\n",)=20
> > /*=20
> > - * initialization, load ESI, EDI, EBX registers=20
> > + * initialization, load ESI, EDI, EBX registers, clear MM1=20
> > */=20
> > - "\tmovl %1, %%edi\n"=20
> > - "\tmovl %2, %%esi\n"=20
> > - "\tmovl %3, %%ebx\n"=20
> > + "\tpxor %%mm1, %%mm1\n"=20
> > + "\tmovl %2, %%edi\n"=20
> > + "\tmovl %3, %%esi\n"=20
> > + "\tmovl %4, %%ebx\n"=20
> > "\tcmpl $0, %0\n"=20
> > "\tjnz 2f\n"=20
> > "\tjmp 5f\n"=20
> >=20
> > "\t.p2align 4,,15\n"=20
> > "1:"=20
> > - "\tadd %4, %%edi\n"=20
> > - "\tadd %5, %%esi\n"=20
> > - "\tadd %6, %%ebx\n"=20
> > + "\tadd %5, %%edi\n"=20
> > + "\tadd %6, %%esi\n"=20
> > + "\tadd %7, %%ebx\n"=20
> >=20
> > "2:"=20
> > /*=20
> > @@ -230,13 +241,14 @@ static void MIX_AREAS_16_MMX(unsigned int size,=
=20
> > "\tjnz 1b\n"=20
> > "\temms\n"=20
> > "5:"=20
> > - "\tmovl %7, %%ebx\n" /* ebx is GOT pointer (-fPIC) *=20
> /=20
> > -=20
> > - : /* no output regs */=20
> > - : "m" (size), "m" (dst), "m" (src),=20
> > - "m" (sum), "m" (dst_step), "m" (src_step),=20
> > - "m" (sum_step), "m" (old_ebx)=20
> > - : "esi", "edi", "edx", "ecx", "eax"=20
> > + /* ebx is GOT pointer (-fPIC) */=20
> > + GCC_PIC_SWITCH("\tmovl %1, %%ebx\n",)=20
> > +=20
> > + : "+&rm" (size), GCC_PIC_SWITCH("=3Dm","=3DX") (old_ebx)=20
> > + : "m" (dst), "m" (src), "m" (sum),=20
> > + "im" (dst_step), "im" (src_step), "im" (sum_step)=20
> > + : "esi", "edi", "edx", "ecx", GCC_PIC_SWITCH(,"ebx"COMMA)=20
> "eax",=20
> > + "mm0", "mm1", "memory", "cc"=20
> > );=20
> > }=20
> >=20
> > @@ -261,13 +273,14 @@ static void MIX_AREAS_32(unsigned int size,=20
> > __asm__ __volatile__ (=20
> > "\n"=20
> >=20
> > - "\tmovl %%ebx, %7\n" /* ebx is GOT pointer (-fPIC) *=20
> /=20
> > + /* ebx is GOT pointer (-fPIC) */=20
> > + GCC_PIC_SWITCH("\tmovl %%ebx, %1\n",)=20
> > /*=20
> > * initialization, load ESI, EDI, EBX registers=20
> > */=20
> > - "\tmovl %1, %%edi\n"=20
> > - "\tmovl %2, %%esi\n"=20
> > - "\tmovl %3, %%ebx\n"=20
> > + "\tmovl %2, %%edi\n"=20
> > + "\tmovl %3, %%esi\n"=20
> > + "\tmovl %4, %%ebx\n"=20
> > "\tcmpl $0, %0\n"=20
> > "\tjnz 1f\n"=20
> > "\tjmp 6f\n"=20
> > @@ -337,19 +350,20 @@ static void MIX_AREAS_32(unsigned int size,=20
> > */=20
> > "\tdecl %0\n"=20
> > "\tjz 6f\n"=20
> > - "\tadd %4, %%edi\n"=20
> > - "\tadd %5, %%esi\n"=20
> > - "\tadd %6, %%ebx\n"=20
> > + "\tadd %5, %%edi\n"=20
> > + "\tadd %6, %%esi\n"=20
> > + "\tadd %7, %%ebx\n"=20
> > "\tjmp 1b\n"=20
> > -=20
> > - "6:"=20
> > - "\tmovl %7, %%ebx\n" /* ebx is GOT pointer (-fPIC) *=20
> /=20
> >=20
> > - : /* no output regs */=20
> > - : "m" (size), "m" (dst), "m" (src),=20
> > - "m" (sum), "m" (dst_step), "m" (src_step),=20
> > - "m" (sum_step), "m" (old_ebx)=20
> > - : "esi", "edi", "edx", "ecx", "eax"=20
> > + "6:"=20
> > + /* ebx is GOT pointer (-fPIC) */=20
> > + GCC_PIC_SWITCH("\tmovl %1, %%ebx\n",)=20
> > +=20
> > + : "+&rm" (size), GCC_PIC_SWITCH("=3Dm","=3DX") (old_ebx)=20
> > + : "m" (dst), "m" (src), "m" (sum),=20
> > + "im" (dst_step), "im" (src_step), "im" (sum_step)=20
> > + : "esi", "edi", "edx", "ecx", GCC_PIC_SWITCH(,"ebx"COMMA)=20
> "eax",=20
> > + "memory", "cc"=20
> > );=20
> > }=20
> >=20
> > @@ -374,13 +388,14 @@ static void MIX_AREAS_24(unsigned int size,=20
> > __asm__ __volatile__ (=20
> > "\n"=20
> >=20
> > - "\tmovl %%ebx, %7\n" /* ebx is GOT pointer (-fPIC) *=20
> /=20
> > + /* ebx is GOT pointer (-fPIC) */=20
> > + GCC_PIC_SWITCH("\tmovl %%ebx, %1\n",)=20
> > /*=20
> > * initialization, load ESI, EDI, EBX registers=20
> > */=20
> > - "\tmovl %1, %%edi\n"=20
> > - "\tmovl %2, %%esi\n"=20
> > - "\tmovl %3, %%ebx\n"=20
> > + "\tmovl %2, %%edi\n"=20
> > + "\tmovl %3, %%esi\n"=20
> > + "\tmovl %4, %%ebx\n"=20
> > "\tcmpl $0, %0\n"=20
> > "\tjnz 1f\n"=20
> > "\tjmp 6f\n"=20
> > @@ -443,19 +458,20 @@ static void MIX_AREAS_24(unsigned int size,=20
> > */=20
> > "\tdecl %0\n"=20
> > "\tjz 6f\n"=20
> > - "\tadd %4, %%edi\n"=20
> > - "\tadd %5, %%esi\n"=20
> > - "\tadd %6, %%ebx\n"=20
> > + "\tadd %5, %%edi\n"=20
> > + "\tadd %6, %%esi\n"=20
> > + "\tadd %7, %%ebx\n"=20
> > "\tjmp 1b\n"=20
> > -=20
> > - "6:"=20
> > - "\tmovl %7, %%ebx\n" /* ebx is GOT pointer (-fPIC) *=20
> /=20
> >=20
> > - : /* no output regs */=20
> > - : "m" (size), "m" (dst), "m" (src),=20
> > - "m" (sum), "m" (dst_step), "m" (src_step),=20
> > - "m" (sum_step), "m" (old_ebx)=20
> > - : "esi", "edi", "edx", "ecx", "eax"=20
> > + "6:"=20
> > + /* ebx is GOT pointer (-fPIC) */=20
> > + GCC_PIC_SWITCH("\tmovl %1, %%ebx\n",)=20
> > +=20
> > + : "+&rm" (size), GCC_PIC_SWITCH("=3Dm","=3DX") (old_ebx)=20
> > + : "m" (dst), "m" (src), "m" (sum),=20
> > + "im" (dst_step), "im" (src_step), "im" (sum_step)=20
> > + : "esi", "edi", "edx", "ecx", GCC_PIC_SWITCH(,"ebx"COMMA)=20
> "eax",=20
> > + "memory", "cc"=20
> > );=20
> > }=20
> >=20
> > @@ -480,13 +496,14 @@ static void MIX_AREAS_24_CMOV(unsigned int size,=
=20
> > __asm__ __volatile__ (=20
> > "\n"=20
> >=20
> > - "\tmovl %%ebx, %7\n" /* ebx is GOT pointer (-fPIC) *=20
> /=20
> > + /* ebx is GOT pointer (-fPIC) */=20
> > + GCC_PIC_SWITCH("\tmovl %%ebx, %1\n",)=20
> > /*=20
> > * initialization, load ESI, EDI, EBX registers=20
> > */=20
> > - "\tmovl %1, %%edi\n"=20
> > - "\tmovl %2, %%esi\n"=20
> > - "\tmovl %3, %%ebx\n"=20
> > + "\tmovl %2, %%edi\n"=20
> > + "\tmovl %3, %%esi\n"=20
> > + "\tmovl %4, %%ebx\n"=20
> > "\tcmpl $0, %0\n"=20
> > "\tjz 6f\n"=20
> >=20
> > @@ -541,19 +558,20 @@ static void MIX_AREAS_24_CMOV(unsigned int size,=
=20
> > /*=20
> > * while (size-- > 0)=20
> > */=20
> > - "\tadd %4, %%edi\n"=20
> > - "\tadd %5, %%esi\n"=20
> > - "\tadd %6, %%ebx\n"=20
> > + "\tadd %5, %%edi\n"=20
> > + "\tadd %6, %%esi\n"=20
> > + "\tadd %7, %%ebx\n"=20
> > "\tdecl %0\n"=20
> > "\tjnz 1b\n"=20
> > -=20
> > - "6:"=20
> > - "\tmovl %7, %%ebx\n" /* ebx is GOT pointer (-fPIC) *=20
> /=20
> >=20
> > - : /* no output regs */=20
> > - : "m" (size), "m" (dst), "m" (src),=20
> > - "m" (sum), "m" (dst_step), "m" (src_step),=20
> > - "m" (sum_step), "m" (old_ebx)=20
> > - : "esi", "edi", "edx", "ecx", "eax"=20
> > + "6:"=20
> > + /* ebx is GOT pointer (-fPIC) */=20
> > + GCC_PIC_SWITCH("\tmovl %1, %%ebx\n",)=20
> > +=20
> > + : "+&rm" (size), GCC_PIC_SWITCH("=3Dm","=3DX") (old_ebx)=20
> > + : "m" (dst), "m" (src), "m" (sum),=20
> > + "im" (dst_step), "im" (src_step), "im" (sum_step)=20
> > + : "esi", "edi", "edx", "ecx", GCC_PIC_SWITCH(,"ebx"COMMA)=20
> "eax",=20
> > + "memory", "cc"=20
> > );=20
> > }=20
> > --=20
> > 2.17.1=20
> >=20
>=20
>=20

