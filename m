Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BF70A1B4876
	for <lists+alsa-devel@lfdr.de>; Wed, 22 Apr 2020 17:21:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6E8D116A5;
	Wed, 22 Apr 2020 17:20:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6E8D116A5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1587568902;
	bh=p0CaaMl2WVYctMatUhFq3W89esE1VSKoSv7rt1n4iRM=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RflOu6gBXwMkbrnvfk+HNrjPENMkvW0HVR/7cZlUrlKC+yM8hQxM96LR+hjev6tPY
	 i3njSi/2OpjbloDxx5trjWPMQXY9rDpmKkWKJ05Il7RADcrsNhcBVY7xgIVifKad4+
	 tNfKslbGaNaJ34DJDPwNcI/MSLO1yIP8sChJm6cY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 54762F8020C;
	Wed, 22 Apr 2020 17:19:56 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D355EF801D9; Wed, 22 Apr 2020 17:19:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=HTML_MESSAGE,PRX_BODY_125,
 PRX_BODY_64,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from zm-mta-out-3.u-ga.fr (zm-mta-out-3.u-ga.fr [152.77.200.56])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A6D12F800F2
 for <alsa-devel@alsa-project.org>; Wed, 22 Apr 2020 17:19:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A6D12F800F2
Received: from zm-mta-out.u-ga.fr (zm-mta-out.u-ga.fr [152.77.200.53])
 by zm-mta-out-3.u-ga.fr (Postfix) with ESMTP id 5D84B41002;
 Wed, 22 Apr 2020 17:19:27 +0200 (CEST)
Received: from zm-mbx06.u-ga.fr (zm-mbx06.u-ga.fr [152.77.200.20])
 by zm-mta-out.u-ga.fr (Postfix) with ESMTP id 5743480FAC;
 Wed, 22 Apr 2020 17:19:27 +0200 (CEST)
Date: Wed, 22 Apr 2020 17:19:27 +0200 (CEST)
From: =?utf-8?B?RlLDiUTDiVJJQw==?= RECOULES
 <frederic.recoules@univ-grenoble-alpes.fr>
To: alsa-devel <alsa-devel@alsa-project.org>
Message-ID: <453128263.3973705.1587568767322.JavaMail.zimbra@univ-grenoble-alpes.fr>
In-Reply-To: <1251950055.5920131.1586249108652.JavaMail.zimbra@univ-grenoble-alpes.fr>
References: <1251950055.5920131.1586249108652.JavaMail.zimbra@univ-grenoble-alpes.fr>
Subject: Re: [inline assembly compliance] Issues and patches
MIME-Version: 1.0
X-Originating-IP: [46.193.2.18]
X-Mailer: Zimbra 8.8.15_GA_3918 (ZimbraWebClient - FF72 (Linux)/8.8.15_GA_3895)
Thread-Topic: Issues and patches
Thread-Index: Du8r7gxw4hc+FA/CBbUr+pIWv/EZEtdq5d4H
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Cc: Richard Bonichon <richard.bonichon@gmail.com>,
 =?utf-8?Q?S=C3=A9bastien?= Bardin <sebastien.bardin@cea.fr>
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

Dear developpers,=20

We are looking forward to hear news about the patches. Did you have time to=
 take a look?=20

We are trying to keep track of the state of the assembly in projects in whi=
ch we found issues.=20

Please recall that they should be small, very local, easy to review changes=
 and please contact us if you need more information about them.=20

Regards,=20
Fr=C3=A9d=C3=A9ric Recoules=20


De: "FR=C3=89D=C3=89RIC RECOULES" <frederic.recoules@univ-grenoble-alpes.fr=
>=20
=C3=80: "alsa-devel" <alsa-devel@alsa-project.org>=20
Cc: "Richard Bonichon" <richard.bonichon@gmail.com>, "S=C3=A9bastien Bardin=
" <sebastien.bardin@cea.fr>=20
Envoy=C3=A9: Mardi 7 Avril 2020 10:45:08=20
Objet: [inline assembly compliance] Issues and patches=20

Dear developpers,=20



we are academic researchers working in automated program analysis.=20
We are currently interested in checking compliance of inline asm chunks=20
as found in C programs.=20

While benchmarking our tool and technique, we found 5 significant issues in=
=20
ALSA. We report them to you, as well as adequate patches with explanations.=
=20

* All these bugs are related to compliance between the block of asm and its=
=20
surrounding "contract" (in gcc-style notation). They are akin to undefined =
or=20
implementation-defined behaviours in C: they currently do not manifest=20
themselves in your program, but at some point in time with compiler=20
optimizations becoming more and more aggressive or changes in undocumented=
=20
compiler choices regarding asm chunks, they can suddenly trigger a=20
(hard-to-find) bug.=20

* The typical problems come from the compiler missing dataflow information=
=20
and performing undue optimizations on this wrong basis, or the compiler=20
allocating an already used register. Actually, we demonstrate "in lab" prob=
lems=20
with all these categories of bugs in case of inlining=20
(especially with LTO enabler) or code refactoring.=20

* Some of those issues may seems benign or irrealistic but it cost nothing=
=20
to patch so, why not do it?=20



We would be very interested to hear your opinion on these matters.=20
Are you interested in such errors and patches?=20
Also, besides the patches, we are currently working on a code analyzer=20
prototype designed to check asm compliance and to propose patches when the=
=20
chunk is not compliant. This is still work in progress and we are finalizin=
g it.=20
The errors and patches I reported to you came from my prototype.=20
In case such a prototype would be made available, would you consider using =
it?=20



Best regards=20

Fr=C3=A9d=C3=A9ric Recoules=20


-----------------------------------Details---------------------------------=
---------=20


The issues are the sames for the five macro-functions defined in=20
pcm/pcm_dmix_i386.h.=20

1. "memory" clobber is missing=20
------------------------------=20

The memory is read from src and written from dst and sum.=20
For instance, the compiler may believe that the memory pointed by src has=
=20
never been read and decide to get rid of its initialization=20
(dead store elimination).=20

Patched by adding "memory" to the clobbers=20

2. the read-only input size is clobbered=20
----------------------------------------=20

The compiler may assume the old value of size is still present at the=20
location and may misuse the new value (i.e. 0).=20

Patched by moving size from read-only input to read-write output.=20

3. ebx is not declared in clobbers=20
----------------------------------=20

We know that prior to the version 5.0, GCC refused to give ebx as clobber.=
=20
It is no longer true and may become risky as it can be used to compute the=
=20
address of one of the others memory inputs.=20

Patched by creating a switch to add ebx in clobber=20
(and removing the manual save/restore) if GCC is newer than 5.0 or other=20
compiler is used.=20


The following issue concern the MIX_AREAS_16_MMX macro-function.=20

4. mm0 is clobbered, mm1 is used uninitialized=20
----------------------------------------------=20

Patched by adding mm0 and mm1 to clobbers and adding a pxor instruction for=
 mm1.=20


Then here are some minor improvements:=20
- add "cc" to the clobbers even if it is, for now, redundant;=20
- allow to use a register (i.e. ebp) for size=20
- allow to pass dst_step, src_step and sum_step through immediates=20


-----------------------------------Patches---------------------------------=
---------=20


diff --git a/src/pcm/pcm_dmix_i386.h b/src/pcm/pcm_dmix_i386.h=20
index 2778cb1d..af2f4630 100644=20
--- a/src/pcm/pcm_dmix_i386.h=20
+++ b/src/pcm/pcm_dmix_i386.h=20
@@ -26,6 +26,13 @@=20
*=20
*/=20

+#define COMMA ,=20
+#if __GNUC__ < 5 && defined(__PIC__)=20
+# define GCC_PIC_SWITCH(before,after) before=20
+#else=20
+# define GCC_PIC_SWITCH(before,after) after=20
+#endif=20
+=20
/*=20
* for plain i386=20
*/=20
@@ -47,13 +54,14 @@ static void MIX_AREAS_16(unsigned int size,=20
__asm__ __volatile__ (=20
"\n"=20

- "\tmovl %%ebx, %7\n" /* ebx is GOT pointer (-fPIC) */=20
+ /* ebx is GOT pointer (-fPIC) */=20
+ GCC_PIC_SWITCH("\tmovl %%ebx, %1\n",)=20
/*=20
* initialization, load ESI, EDI, EBX registers=20
*/=20
- "\tmovl %1, %%edi\n"=20
- "\tmovl %2, %%esi\n"=20
- "\tmovl %3, %%ebx\n"=20
+ "\tmovl %2, %%edi\n"=20
+ "\tmovl %3, %%esi\n"=20
+ "\tmovl %4, %%ebx\n"=20
"\tcmpl $0, %0\n"=20
"\tjnz 2f\n"=20
"\tjmp 7f\n"=20
@@ -64,9 +72,9 @@ static void MIX_AREAS_16(unsigned int size,=20
*/=20
"\t.p2align 4,,15\n"=20
"1:"=20
- "\tadd %4, %%edi\n"=20
- "\tadd %5, %%esi\n"=20
- "\tadd %6, %%ebx\n"=20
+ "\tadd %5, %%edi\n"=20
+ "\tadd %6, %%esi\n"=20
+ "\tadd %7, %%ebx\n"=20

/*=20
* sample =3D *src;=20
@@ -138,15 +146,16 @@ static void MIX_AREAS_16(unsigned int size,=20
"\tjnz 4b\n"=20
"\tdecl %0\n"=20
"\tjnz 1b\n"=20
-=20
- "7:"=20
- "\tmovl %7, %%ebx\n" /* ebx is GOT pointer (-fPIC) */=20

- : /* no output regs */=20
- : "m" (size), "m" (dst), "m" (src),=20
- "m" (sum), "m" (dst_step), "m" (src_step),=20
- "m" (sum_step), "m" (old_ebx)=20
- : "esi", "edi", "edx", "ecx", "eax"=20
+ "7:"=20
+ /* ebx is GOT pointer (-fPIC) */=20
+ GCC_PIC_SWITCH("\tmovl %1, %%ebx\n",)=20
+=20
+ : "+&rm" (size), GCC_PIC_SWITCH("=3Dm","=3DX") (old_ebx)=20
+ : "m" (dst), "m" (src), "m" (sum),=20
+ "im" (dst_step), "im" (src_step), "im" (sum_step)=20
+ : "esi", "edi", "edx", "ecx", GCC_PIC_SWITCH(,"ebx"COMMA) "eax",=20
+ "memory", "cc"=20
);=20
}=20

@@ -171,22 +180,24 @@ static void MIX_AREAS_16_MMX(unsigned int size,=20
__asm__ __volatile__ (=20
"\n"=20

- "\tmovl %%ebx, %7\n" /* ebx is GOT pointer (-fPIC) */=20
+ /* ebx is GOT pointer (-fPIC) */=20
+ GCC_PIC_SWITCH("\tmovl %%ebx, %1\n",)=20
/*=20
- * initialization, load ESI, EDI, EBX registers=20
+ * initialization, load ESI, EDI, EBX registers, clear MM1=20
*/=20
- "\tmovl %1, %%edi\n"=20
- "\tmovl %2, %%esi\n"=20
- "\tmovl %3, %%ebx\n"=20
+ "\tpxor %%mm1, %%mm1\n"=20
+ "\tmovl %2, %%edi\n"=20
+ "\tmovl %3, %%esi\n"=20
+ "\tmovl %4, %%ebx\n"=20
"\tcmpl $0, %0\n"=20
"\tjnz 2f\n"=20
"\tjmp 5f\n"=20

"\t.p2align 4,,15\n"=20
"1:"=20
- "\tadd %4, %%edi\n"=20
- "\tadd %5, %%esi\n"=20
- "\tadd %6, %%ebx\n"=20
+ "\tadd %5, %%edi\n"=20
+ "\tadd %6, %%esi\n"=20
+ "\tadd %7, %%ebx\n"=20

"2:"=20
/*=20
@@ -230,13 +241,14 @@ static void MIX_AREAS_16_MMX(unsigned int size,=20
"\tjnz 1b\n"=20
"\temms\n"=20
"5:"=20
- "\tmovl %7, %%ebx\n" /* ebx is GOT pointer (-fPIC) */=20
-=20
- : /* no output regs */=20
- : "m" (size), "m" (dst), "m" (src),=20
- "m" (sum), "m" (dst_step), "m" (src_step),=20
- "m" (sum_step), "m" (old_ebx)=20
- : "esi", "edi", "edx", "ecx", "eax"=20
+ /* ebx is GOT pointer (-fPIC) */=20
+ GCC_PIC_SWITCH("\tmovl %1, %%ebx\n",)=20
+=20
+ : "+&rm" (size), GCC_PIC_SWITCH("=3Dm","=3DX") (old_ebx)=20
+ : "m" (dst), "m" (src), "m" (sum),=20
+ "im" (dst_step), "im" (src_step), "im" (sum_step)=20
+ : "esi", "edi", "edx", "ecx", GCC_PIC_SWITCH(,"ebx"COMMA) "eax",=20
+ "mm0", "mm1", "memory", "cc"=20
);=20
}=20

@@ -261,13 +273,14 @@ static void MIX_AREAS_32(unsigned int size,=20
__asm__ __volatile__ (=20
"\n"=20

- "\tmovl %%ebx, %7\n" /* ebx is GOT pointer (-fPIC) */=20
+ /* ebx is GOT pointer (-fPIC) */=20
+ GCC_PIC_SWITCH("\tmovl %%ebx, %1\n",)=20
/*=20
* initialization, load ESI, EDI, EBX registers=20
*/=20
- "\tmovl %1, %%edi\n"=20
- "\tmovl %2, %%esi\n"=20
- "\tmovl %3, %%ebx\n"=20
+ "\tmovl %2, %%edi\n"=20
+ "\tmovl %3, %%esi\n"=20
+ "\tmovl %4, %%ebx\n"=20
"\tcmpl $0, %0\n"=20
"\tjnz 1f\n"=20
"\tjmp 6f\n"=20
@@ -337,19 +350,20 @@ static void MIX_AREAS_32(unsigned int size,=20
*/=20
"\tdecl %0\n"=20
"\tjz 6f\n"=20
- "\tadd %4, %%edi\n"=20
- "\tadd %5, %%esi\n"=20
- "\tadd %6, %%ebx\n"=20
+ "\tadd %5, %%edi\n"=20
+ "\tadd %6, %%esi\n"=20
+ "\tadd %7, %%ebx\n"=20
"\tjmp 1b\n"=20
-=20
- "6:"=20
- "\tmovl %7, %%ebx\n" /* ebx is GOT pointer (-fPIC) */=20

- : /* no output regs */=20
- : "m" (size), "m" (dst), "m" (src),=20
- "m" (sum), "m" (dst_step), "m" (src_step),=20
- "m" (sum_step), "m" (old_ebx)=20
- : "esi", "edi", "edx", "ecx", "eax"=20
+ "6:"=20
+ /* ebx is GOT pointer (-fPIC) */=20
+ GCC_PIC_SWITCH("\tmovl %1, %%ebx\n",)=20
+=20
+ : "+&rm" (size), GCC_PIC_SWITCH("=3Dm","=3DX") (old_ebx)=20
+ : "m" (dst), "m" (src), "m" (sum),=20
+ "im" (dst_step), "im" (src_step), "im" (sum_step)=20
+ : "esi", "edi", "edx", "ecx", GCC_PIC_SWITCH(,"ebx"COMMA) "eax",=20
+ "memory", "cc"=20
);=20
}=20

@@ -374,13 +388,14 @@ static void MIX_AREAS_24(unsigned int size,=20
__asm__ __volatile__ (=20
"\n"=20

- "\tmovl %%ebx, %7\n" /* ebx is GOT pointer (-fPIC) */=20
+ /* ebx is GOT pointer (-fPIC) */=20
+ GCC_PIC_SWITCH("\tmovl %%ebx, %1\n",)=20
/*=20
* initialization, load ESI, EDI, EBX registers=20
*/=20
- "\tmovl %1, %%edi\n"=20
- "\tmovl %2, %%esi\n"=20
- "\tmovl %3, %%ebx\n"=20
+ "\tmovl %2, %%edi\n"=20
+ "\tmovl %3, %%esi\n"=20
+ "\tmovl %4, %%ebx\n"=20
"\tcmpl $0, %0\n"=20
"\tjnz 1f\n"=20
"\tjmp 6f\n"=20
@@ -443,19 +458,20 @@ static void MIX_AREAS_24(unsigned int size,=20
*/=20
"\tdecl %0\n"=20
"\tjz 6f\n"=20
- "\tadd %4, %%edi\n"=20
- "\tadd %5, %%esi\n"=20
- "\tadd %6, %%ebx\n"=20
+ "\tadd %5, %%edi\n"=20
+ "\tadd %6, %%esi\n"=20
+ "\tadd %7, %%ebx\n"=20
"\tjmp 1b\n"=20
-=20
- "6:"=20
- "\tmovl %7, %%ebx\n" /* ebx is GOT pointer (-fPIC) */=20

- : /* no output regs */=20
- : "m" (size), "m" (dst), "m" (src),=20
- "m" (sum), "m" (dst_step), "m" (src_step),=20
- "m" (sum_step), "m" (old_ebx)=20
- : "esi", "edi", "edx", "ecx", "eax"=20
+ "6:"=20
+ /* ebx is GOT pointer (-fPIC) */=20
+ GCC_PIC_SWITCH("\tmovl %1, %%ebx\n",)=20
+=20
+ : "+&rm" (size), GCC_PIC_SWITCH("=3Dm","=3DX") (old_ebx)=20
+ : "m" (dst), "m" (src), "m" (sum),=20
+ "im" (dst_step), "im" (src_step), "im" (sum_step)=20
+ : "esi", "edi", "edx", "ecx", GCC_PIC_SWITCH(,"ebx"COMMA) "eax",=20
+ "memory", "cc"=20
);=20
}=20

@@ -480,13 +496,14 @@ static void MIX_AREAS_24_CMOV(unsigned int size,=20
__asm__ __volatile__ (=20
"\n"=20

- "\tmovl %%ebx, %7\n" /* ebx is GOT pointer (-fPIC) */=20
+ /* ebx is GOT pointer (-fPIC) */=20
+ GCC_PIC_SWITCH("\tmovl %%ebx, %1\n",)=20
/*=20
* initialization, load ESI, EDI, EBX registers=20
*/=20
- "\tmovl %1, %%edi\n"=20
- "\tmovl %2, %%esi\n"=20
- "\tmovl %3, %%ebx\n"=20
+ "\tmovl %2, %%edi\n"=20
+ "\tmovl %3, %%esi\n"=20
+ "\tmovl %4, %%ebx\n"=20
"\tcmpl $0, %0\n"=20
"\tjz 6f\n"=20

@@ -541,19 +558,20 @@ static void MIX_AREAS_24_CMOV(unsigned int size,=20
/*=20
* while (size-- > 0)=20
*/=20
- "\tadd %4, %%edi\n"=20
- "\tadd %5, %%esi\n"=20
- "\tadd %6, %%ebx\n"=20
+ "\tadd %5, %%edi\n"=20
+ "\tadd %6, %%esi\n"=20
+ "\tadd %7, %%ebx\n"=20
"\tdecl %0\n"=20
"\tjnz 1b\n"=20
-=20
- "6:"=20
- "\tmovl %7, %%ebx\n" /* ebx is GOT pointer (-fPIC) */=20

- : /* no output regs */=20
- : "m" (size), "m" (dst), "m" (src),=20
- "m" (sum), "m" (dst_step), "m" (src_step),=20
- "m" (sum_step), "m" (old_ebx)=20
- : "esi", "edi", "edx", "ecx", "eax"=20
+ "6:"=20
+ /* ebx is GOT pointer (-fPIC) */=20
+ GCC_PIC_SWITCH("\tmovl %1, %%ebx\n",)=20
+=20
+ : "+&rm" (size), GCC_PIC_SWITCH("=3Dm","=3DX") (old_ebx)=20
+ : "m" (dst), "m" (src), "m" (sum),=20
+ "im" (dst_step), "im" (src_step), "im" (sum_step)=20
+ : "esi", "edi", "edx", "ecx", GCC_PIC_SWITCH(,"ebx"COMMA) "eax",=20
+ "memory", "cc"=20
);=20
}=20
