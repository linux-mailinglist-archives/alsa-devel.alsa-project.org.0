Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D9511A0980
	for <lists+alsa-devel@lfdr.de>; Tue,  7 Apr 2020 10:47:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 38BC51671;
	Tue,  7 Apr 2020 10:46:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 38BC51671
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1586249253;
	bh=s0zJVWi2IEfFN108u+M/VjTiB1n/SWtdx/HXNBybmbo=;
	h=Date:From:To:Subject:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=O9W34gIdJfnOtwSEfxInIA5lSysdFN6RFsKCRLx4S+W0Wst3dLRlALbPzwLzevWMl
	 b/mgNBtUqEr0z5wrCZimgYTew2FYKydWKDldVy3+SGarNjAYIfrI5kET9up1eUEFAp
	 sJVcFtt0FFxJ5wGsmWv2ib6LbUMOA42C9kXkUCB0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 82370F80121;
	Tue,  7 Apr 2020 10:45:21 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2FB28F8028A; Tue,  7 Apr 2020 10:45:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=PRX_BODY_64,SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.0
Received: from zm-mta-out-3.u-ga.fr (zm-mta-out-3.u-ga.fr [152.77.200.56])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E2AD8F80121
 for <alsa-devel@alsa-project.org>; Tue,  7 Apr 2020 10:45:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E2AD8F80121
Received: from zm-mta-out.u-ga.fr (zm-mta-out.u-ga.fr [152.77.200.53])
 by zm-mta-out-3.u-ga.fr (Postfix) with ESMTP id AC5BD41132;
 Tue,  7 Apr 2020 10:45:08 +0200 (CEST)
Received: from zm-mbx06.u-ga.fr (zm-mbx06.u-ga.fr [152.77.200.20])
 by zm-mta-out.u-ga.fr (Postfix) with ESMTP id A67A18048A;
 Tue,  7 Apr 2020 10:45:08 +0200 (CEST)
Date: Tue, 7 Apr 2020 10:45:08 +0200 (CEST)
From: =?utf-8?B?RlLDiUTDiVJJQw==?= RECOULES
 <frederic.recoules@univ-grenoble-alpes.fr>
To: alsa-devel@alsa-project.org
Message-ID: <1251950055.5920131.1586249108652.JavaMail.zimbra@univ-grenoble-alpes.fr>
Subject: [inline assembly compliance] Issues and patches
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [46.193.2.18]
X-Mailer: Zimbra 8.8.15_GA_3918 (ZimbraWebClient - FF72 (Linux)/8.8.15_GA_3895)
Thread-Index: Du8r7gxw4hc+FA/CBbUr+pIWv/EZEg==
Thread-Topic: Issues and patches
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

Dear developpers,



we are academic researchers working in automated program analysis.
We are currently interested in checking compliance of inline asm chunks
as found in C programs.

While benchmarking our tool and technique, we found 5 significant issues in
ALSA. We report them to you, as well as adequate patches with explanations.

* All these bugs are related to compliance between the block of asm and its
surrounding "contract" (in gcc-style notation). They are akin to undefined =
or
implementation-defined behaviours  in C: they currently do not manifest
themselves in your program, but at some point in time with compiler
optimizations becoming more and more aggressive or changes in undocumented
compiler choices regarding asm chunks, they can suddenly trigger a
(hard-to-find) bug.

* The typical problems come from the compiler missing dataflow information
and performing undue optimizations on this wrong basis, or the compiler
allocating an already used register. Actually, we demonstrate "in lab" prob=
lems
with all these categories of bugs in case of inlining
(especially with LTO enabler) or code refactoring.

* Some of those issues may seems benign or irrealistic but it cost nothing
to patch so, why not do it?



We would be very interested to hear your opinion on these matters.
Are you interested in such errors and patches?
Also, besides the patches, we are currently working on a code analyzer
prototype designed to check asm compliance and to propose patches when the
chunk is not compliant. This is still work in progress and we are finalizin=
g it.
The errors and patches I reported to you came from my prototype.
In case such a prototype would be made available, would you consider using =
it?



Best regards

Fr=C3=A9d=C3=A9ric Recoules


-----------------------------------Details---------------------------------=
---------


The issues are the sames for the five macro-functions defined in
pcm/pcm_dmix_i386.h.

1. "memory" clobber is missing
------------------------------

The memory is read from src and written from dst and sum.
For instance, the compiler may believe that the memory pointed by src has
never been read and decide to get rid of its initialization
(dead store elimination).

Patched by adding "memory" to the clobbers

2. the read-only input size is clobbered
----------------------------------------

The compiler may assume the old value of size is still present at the
location and may misuse the new value (i.e. 0).

Patched by moving size from read-only input to read-write output.

3. ebx is not declared in clobbers
----------------------------------

We know that prior to the version 5.0, GCC refused to give ebx as clobber.
It is no longer true and may become risky as it can be used to compute the
address of one of the others memory inputs.

Patched by creating a switch to add ebx in clobber
(and removing the manual save/restore) if GCC is newer than 5.0 or other
compiler is used.


The following issue concern the MIX_AREAS_16_MMX macro-function.

4. mm0 is clobbered, mm1 is used uninitialized
----------------------------------------------

Patched by adding mm0 and mm1 to clobbers and adding a pxor instruction for=
 mm1.


Then here are some minor improvements:
- add "cc" to the clobbers even if it is, for now, redundant;
- allow to use a register (i.e. ebp) for size
- allow to pass dst_step, src_step and sum_step through immediates


-----------------------------------Patches---------------------------------=
---------


diff --git a/src/pcm/pcm_dmix_i386.h b/src/pcm/pcm_dmix_i386.h
index 2778cb1d..af2f4630 100644
--- a/src/pcm/pcm_dmix_i386.h
+++ b/src/pcm/pcm_dmix_i386.h
@@ -26,6 +26,13 @@
  *
  */
=20
+#define COMMA ,
+#if __GNUC__ < 5 && defined(__PIC__)
+#  define GCC_PIC_SWITCH(before,after) before
+#else
+#  define GCC_PIC_SWITCH(before,after) after
+#endif
+
 /*
  *  for plain i386
  */
@@ -47,13 +54,14 @@ static void MIX_AREAS_16(unsigned int size,
 =09__asm__ __volatile__ (
 =09=09"\n"
=20
-=09=09"\tmovl %%ebx, %7\n"=09/* ebx is GOT pointer (-fPIC) */
+=09=09/* ebx is GOT pointer (-fPIC) */
+=09=09GCC_PIC_SWITCH("\tmovl %%ebx, %1\n",)
 =09=09/*
 =09=09 *  initialization, load ESI, EDI, EBX registers
 =09=09 */
-=09=09"\tmovl %1, %%edi\n"
-=09=09"\tmovl %2, %%esi\n"
-=09=09"\tmovl %3, %%ebx\n"
+=09=09"\tmovl %2, %%edi\n"
+=09=09"\tmovl %3, %%esi\n"
+=09=09"\tmovl %4, %%ebx\n"
 =09=09"\tcmpl $0, %0\n"
 =09=09"\tjnz 2f\n"
 =09=09"\tjmp 7f\n"
@@ -64,9 +72,9 @@ static void MIX_AREAS_16(unsigned int size,
 =09=09 */
 =09=09"\t.p2align 4,,15\n"
 =09=09"1:"
-=09=09"\tadd %4, %%edi\n"
-=09=09"\tadd %5, %%esi\n"
-=09=09"\tadd %6, %%ebx\n"
+=09=09"\tadd %5, %%edi\n"
+=09=09"\tadd %6, %%esi\n"
+=09=09"\tadd %7, %%ebx\n"
=20
 =09=09/*
 =09=09 *   sample =3D *src;
@@ -138,15 +146,16 @@ static void MIX_AREAS_16(unsigned int size,
 =09=09"\tjnz 4b\n"
 =09=09"\tdecl %0\n"
 =09=09"\tjnz 1b\n"
-=09=09
-=09=09"7:"
-=09=09"\tmovl %7, %%ebx\n"=09/* ebx is GOT pointer (-fPIC) */
=20
-=09=09: /* no output regs */
-=09=09: "m" (size), "m" (dst), "m" (src),
-=09=09  "m" (sum), "m" (dst_step), "m" (src_step),
-=09=09  "m" (sum_step), "m" (old_ebx)
-=09=09: "esi", "edi", "edx", "ecx", "eax"
+=09=09"7:"
+=09=09/* ebx is GOT pointer (-fPIC) */
+=09=09GCC_PIC_SWITCH("\tmovl %1, %%ebx\n",)
+
+=09=09: "+&rm" (size), GCC_PIC_SWITCH("=3Dm","=3DX") (old_ebx)
+=09=09: "m" (dst), "m" (src), "m" (sum),
+=09=09  "im" (dst_step), "im" (src_step), "im" (sum_step)
+=09=09: "esi", "edi", "edx", "ecx", GCC_PIC_SWITCH(,"ebx"COMMA) "eax",
+=09=09  "memory", "cc"
 =09);
 }
=20
@@ -171,22 +180,24 @@ static void MIX_AREAS_16_MMX(unsigned int size,
 =09__asm__ __volatile__ (
 =09=09"\n"
=20
-=09=09"\tmovl %%ebx, %7\n"=09/* ebx is GOT pointer (-fPIC) */
+=09=09/* ebx is GOT pointer (-fPIC) */
+=09=09GCC_PIC_SWITCH("\tmovl %%ebx, %1\n",)
 =09=09/*
-=09=09 *  initialization, load ESI, EDI, EBX registers
+=09=09 *  initialization, load ESI, EDI, EBX registers, clear MM1
 =09=09 */
-=09=09"\tmovl %1, %%edi\n"
-=09=09"\tmovl %2, %%esi\n"
-=09=09"\tmovl %3, %%ebx\n"
+=09=09"\tpxor %%mm1, %%mm1\n"
+=09=09"\tmovl %2, %%edi\n"
+=09=09"\tmovl %3, %%esi\n"
+=09=09"\tmovl %4, %%ebx\n"
 =09=09"\tcmpl $0, %0\n"
 =09=09"\tjnz 2f\n"
 =09=09"\tjmp 5f\n"
=20
 =09=09"\t.p2align 4,,15\n"
 =09=09"1:"
-=09=09"\tadd %4, %%edi\n"
-=09=09"\tadd %5, %%esi\n"
-=09=09"\tadd %6, %%ebx\n"
+=09=09"\tadd %5, %%edi\n"
+=09=09"\tadd %6, %%esi\n"
+=09=09"\tadd %7, %%ebx\n"
=20
 =09=09"2:"
 =09=09/*
@@ -230,13 +241,14 @@ static void MIX_AREAS_16_MMX(unsigned int size,
 =09=09"\tjnz 1b\n"
 =09=09"\temms\n"
                 "5:"
-=09=09"\tmovl %7, %%ebx\n"=09/* ebx is GOT pointer (-fPIC) */
-
-=09=09: /* no output regs */
-=09=09: "m" (size), "m" (dst), "m" (src),
-=09=09  "m" (sum), "m" (dst_step), "m" (src_step),
-=09=09  "m" (sum_step), "m" (old_ebx)
-=09=09: "esi", "edi", "edx", "ecx", "eax"
+=09=09/* ebx is GOT pointer (-fPIC) */
+=09=09GCC_PIC_SWITCH("\tmovl %1, %%ebx\n",)
+
+=09=09: "+&rm" (size), GCC_PIC_SWITCH("=3Dm","=3DX") (old_ebx)
+=09=09: "m" (dst), "m" (src), "m" (sum),
+=09=09  "im" (dst_step), "im" (src_step), "im" (sum_step)
+=09=09: "esi", "edi", "edx", "ecx", GCC_PIC_SWITCH(,"ebx"COMMA) "eax",
+=09=09  "mm0", "mm1", "memory", "cc"
 =09);
 }
=20
@@ -261,13 +273,14 @@ static void MIX_AREAS_32(unsigned int size,
 =09__asm__ __volatile__ (
 =09=09"\n"
=20
-=09=09"\tmovl %%ebx, %7\n"=09/* ebx is GOT pointer (-fPIC) */
+=09=09/* ebx is GOT pointer (-fPIC) */
+=09=09GCC_PIC_SWITCH("\tmovl %%ebx, %1\n",)
 =09=09/*
 =09=09 *  initialization, load ESI, EDI, EBX registers
 =09=09 */
-=09=09"\tmovl %1, %%edi\n"
-=09=09"\tmovl %2, %%esi\n"
-=09=09"\tmovl %3, %%ebx\n"
+=09=09"\tmovl %2, %%edi\n"
+=09=09"\tmovl %3, %%esi\n"
+=09=09"\tmovl %4, %%ebx\n"
 =09=09"\tcmpl $0, %0\n"
 =09=09"\tjnz 1f\n"
 =09=09"\tjmp 6f\n"
@@ -337,19 +350,20 @@ static void MIX_AREAS_32(unsigned int size,
 =09=09 */
 =09=09"\tdecl %0\n"
 =09=09"\tjz 6f\n"
-=09=09"\tadd %4, %%edi\n"
-=09=09"\tadd %5, %%esi\n"
-=09=09"\tadd %6, %%ebx\n"
+=09=09"\tadd %5, %%edi\n"
+=09=09"\tadd %6, %%esi\n"
+=09=09"\tadd %7, %%ebx\n"
 =09=09"\tjmp 1b\n"
-=09=09
-=09=09"6:"
-=09=09"\tmovl %7, %%ebx\n"=09/* ebx is GOT pointer (-fPIC) */
=20
-=09=09: /* no output regs */
-=09=09: "m" (size), "m" (dst), "m" (src),
-=09=09  "m" (sum), "m" (dst_step), "m" (src_step),
-=09=09  "m" (sum_step), "m" (old_ebx)
-=09=09: "esi", "edi", "edx", "ecx", "eax"
+=09=09"6:"
+=09=09/* ebx is GOT pointer (-fPIC) */
+=09=09GCC_PIC_SWITCH("\tmovl %1, %%ebx\n",)
+
+=09=09: "+&rm" (size), GCC_PIC_SWITCH("=3Dm","=3DX") (old_ebx)
+=09=09: "m" (dst), "m" (src), "m" (sum),
+=09=09  "im" (dst_step), "im" (src_step), "im" (sum_step)
+=09=09: "esi", "edi", "edx", "ecx", GCC_PIC_SWITCH(,"ebx"COMMA) "eax",
+=09=09  "memory", "cc"
 =09);
 }
=20
@@ -374,13 +388,14 @@ static void MIX_AREAS_24(unsigned int size,
 =09__asm__ __volatile__ (
 =09=09"\n"
=20
-=09=09"\tmovl %%ebx, %7\n"=09/* ebx is GOT pointer (-fPIC) */
+=09=09/* ebx is GOT pointer (-fPIC) */
+=09=09GCC_PIC_SWITCH("\tmovl %%ebx, %1\n",)
 =09=09/*
 =09=09 *  initialization, load ESI, EDI, EBX registers
 =09=09 */
-=09=09"\tmovl %1, %%edi\n"
-=09=09"\tmovl %2, %%esi\n"
-=09=09"\tmovl %3, %%ebx\n"
+=09=09"\tmovl %2, %%edi\n"
+=09=09"\tmovl %3, %%esi\n"
+=09=09"\tmovl %4, %%ebx\n"
 =09=09"\tcmpl $0, %0\n"
 =09=09"\tjnz 1f\n"
 =09=09"\tjmp 6f\n"
@@ -443,19 +458,20 @@ static void MIX_AREAS_24(unsigned int size,
 =09=09 */
 =09=09"\tdecl %0\n"
 =09=09"\tjz 6f\n"
-=09=09"\tadd %4, %%edi\n"
-=09=09"\tadd %5, %%esi\n"
-=09=09"\tadd %6, %%ebx\n"
+=09=09"\tadd %5, %%edi\n"
+=09=09"\tadd %6, %%esi\n"
+=09=09"\tadd %7, %%ebx\n"
 =09=09"\tjmp 1b\n"
-=09=09
-=09=09"6:"
-=09=09"\tmovl %7, %%ebx\n"=09/* ebx is GOT pointer (-fPIC) */
=20
-=09=09: /* no output regs */
-=09=09: "m" (size), "m" (dst), "m" (src),
-=09=09  "m" (sum), "m" (dst_step), "m" (src_step),
-=09=09  "m" (sum_step), "m" (old_ebx)
-=09=09: "esi", "edi", "edx", "ecx", "eax"
+=09=09"6:"
+=09=09/* ebx is GOT pointer (-fPIC) */
+=09=09GCC_PIC_SWITCH("\tmovl %1, %%ebx\n",)
+
+=09=09: "+&rm" (size), GCC_PIC_SWITCH("=3Dm","=3DX") (old_ebx)
+=09=09: "m" (dst), "m" (src), "m" (sum),
+=09=09  "im" (dst_step), "im" (src_step), "im" (sum_step)
+=09=09: "esi", "edi", "edx", "ecx", GCC_PIC_SWITCH(,"ebx"COMMA) "eax",
+=09=09  "memory", "cc"
 =09);
 }
=20
@@ -480,13 +496,14 @@ static void MIX_AREAS_24_CMOV(unsigned int size,
 =09__asm__ __volatile__ (
 =09=09"\n"
=20
-=09=09"\tmovl %%ebx, %7\n"=09/* ebx is GOT pointer (-fPIC) */
+=09=09/* ebx is GOT pointer (-fPIC) */
+=09=09GCC_PIC_SWITCH("\tmovl %%ebx, %1\n",)
 =09=09/*
 =09=09 *  initialization, load ESI, EDI, EBX registers
 =09=09 */
-=09=09"\tmovl %1, %%edi\n"
-=09=09"\tmovl %2, %%esi\n"
-=09=09"\tmovl %3, %%ebx\n"
+=09=09"\tmovl %2, %%edi\n"
+=09=09"\tmovl %3, %%esi\n"
+=09=09"\tmovl %4, %%ebx\n"
 =09=09"\tcmpl $0, %0\n"
 =09=09"\tjz 6f\n"
=20
@@ -541,19 +558,20 @@ static void MIX_AREAS_24_CMOV(unsigned int size,
 =09=09/*
 =09=09 * while (size-- > 0)
 =09=09 */
-=09=09"\tadd %4, %%edi\n"
-=09=09"\tadd %5, %%esi\n"
-=09=09"\tadd %6, %%ebx\n"
+=09=09"\tadd %5, %%edi\n"
+=09=09"\tadd %6, %%esi\n"
+=09=09"\tadd %7, %%ebx\n"
 =09=09"\tdecl %0\n"
 =09=09"\tjnz 1b\n"
-=09=09
-=09=09"6:"
-=09=09"\tmovl %7, %%ebx\n"=09/* ebx is GOT pointer (-fPIC) */
=20
-=09=09: /* no output regs */
-=09=09: "m" (size), "m" (dst), "m" (src),
-=09=09  "m" (sum), "m" (dst_step), "m" (src_step),
-=09=09  "m" (sum_step), "m" (old_ebx)
-=09=09: "esi", "edi", "edx", "ecx", "eax"
+=09=09"6:"
+=09=09/* ebx is GOT pointer (-fPIC) */
+=09=09GCC_PIC_SWITCH("\tmovl %1, %%ebx\n",)
+
+=09=09: "+&rm" (size), GCC_PIC_SWITCH("=3Dm","=3DX") (old_ebx)
+=09=09: "m" (dst), "m" (src), "m" (sum),
+=09=09  "im" (dst_step), "im" (src_step), "im" (sum_step)
+=09=09: "esi", "edi", "edx", "ecx", GCC_PIC_SWITCH(,"ebx"COMMA) "eax",
+=09=09  "memory", "cc"
 =09);
 }
