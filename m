Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ABEBA36172F
	for <lists+alsa-devel@lfdr.de>; Fri, 16 Apr 2021 03:27:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 03FE7168A;
	Fri, 16 Apr 2021 03:27:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 03FE7168A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1618536472;
	bh=VtG7/mxOczVMyl/HwyF0sXktvedcX9iQSpD2XrTfPRo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=TVtV8xWrsUZObqaAo+eqiOmXVZk3EAiV4JcuwLlkex9Fayh8Lubnq8SvTEW1Fyal/
	 J8+W4zhWYzkb2LvhCeh8w1tgvtpMIEOMPs2hWWwNslNJ6GnZ8Y9JKoGaEuCC5XuCZf
	 gLkYVavnrs5v14qv4ooHpPrjeZJ6nD4L/NkOtuVM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 67131F800B9;
	Fri, 16 Apr 2021 03:26:23 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E0E58F8025B; Fri, 16 Apr 2021 03:26:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,GB_GOOGLE_OBFUR,HTML_MESSAGE,SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 78B22F800B9
 for <alsa-devel@alsa-project.org>; Fri, 16 Apr 2021 03:26:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 78B22F800B9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="G09f8rnJ"
Received: by mail-ed1-x52c.google.com with SMTP id s15so30314479edd.4
 for <alsa-devel@alsa-project.org>; Thu, 15 Apr 2021 18:26:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=mEvqZvRPT7+GaRj8dwljrwc/BDCGAIqgK3p4ThTwyXc=;
 b=G09f8rnJxBI1nZb5x91lMMcwzwUbJiyeLf480NbB7/HRgz7OCFMt7yZdDCYd3dkbbk
 ykMhEqv2ST1Uv7/CYJIjw/KzugMj2bq67fOO6dV67CoxhEdrpCF2nX2qEbguRN3N8pCz
 SlcKUxVammTYj+oYxnQWkoR/YU1zqh9RSlI6n69Fg0WAKlU4XJ+J2EQfHX/Vjdr0zoRg
 BtLhsQ9+EJMBBt5dMicKpTU9JL9qs4CJKRkblozQgzd9ooE2TAO4ZNRzwY5qWEidto3N
 E+XIZrwZwV30skz0FY7S0k5HBo8vQuuarTlTTKuG/R1CmTfTQ6Uv3C1XIqpReGDnjKxf
 pL3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mEvqZvRPT7+GaRj8dwljrwc/BDCGAIqgK3p4ThTwyXc=;
 b=fWEUHd8FIsa4p91kDjMAxnQGduYvoMjLAuhHS6TZ+sG2CoRo7YzYZoRUoPOzoX131b
 0I49M8dYt1J/dKfC0CGDST6MvFDkeugOOzWhLsXSS0REtUOpICbvcLLcbqe8chuN5dXP
 shubdqYWLk2rm5n+UdJgHl2dnPaPU2oZF8jbVBNkxX4E97kcJb/6b+SoIYQ6Bokai7pO
 J/OzS8JXBl3JodxsJ16NHV45RZbA8hyiu4DoOslkuvYPVYAoTYAadYg5MAZxEllCuAXy
 fpE73OA91TpJtZ5wWW4xnHBgT238obLZLMSwKEHNvrdo4tYPZiqTBod36ZucCCf4RUoI
 3w+A==
X-Gm-Message-State: AOAM532eW1lc44+mXBAa6B9mBeyfxVGMnA/2PeM616l1BmruoKWLuWQD
 cSNbN6sJQQfutKMgFyfCSmbgkfTo391cdQ4/12ufueHLg7c=
X-Google-Smtp-Source: ABdhPJyz4AgkM2+Wn+BoIxsYLclJX7Zc5+QEaDal6iNxp3ERv3bXHIXvzq4C4UiyOQ1c/dKMjh73Pg2lqVsHqiKDmSA=
X-Received: by 2002:a50:fd16:: with SMTP id i22mr7311029eds.239.1618536368309; 
 Thu, 15 Apr 2021 18:26:08 -0700 (PDT)
MIME-Version: 1.0
References: <CAHXb3begced9GYCQ4a6qLOK2PrQR9gHeSvb3HAG29DVpZ+vwiQ@mail.gmail.com>
 <CAEsQvcu5freEXMFwBRH0aQsT9=ngvOY_SkA6dmfs_YVvMYYuJw@mail.gmail.com>
 <CAHXb3bddyVMXrZHxmtz5AM4j7TRwWSbZcLM94JjcbOMfrd4+2g@mail.gmail.com>
 <CAEsQvcs+-O_eGW928eLdbde9EhWiD3qxjCuv2iW477DZDprkBw@mail.gmail.com>
 <CAHXb3beRycUteezmWRqO0u3kZnV8TbCNAqfO3ksjVoJ6WSrdBw@mail.gmail.com>
 <CAEsQvcuBYnY_k1Rd8US5qrDKcJas62Q5kA4P0NSEJODBCcZMuw@mail.gmail.com>
 <CAHXb3bfD_YivP3r4wOeb8bcXmAU+_+eeZwudW6f1pxfYtpnq1g@mail.gmail.com>
 <CAEsQvcsCJUi8eP_t8MGUKf0zSf7Zmqiof8b0fmk-XhZtUScbmg@mail.gmail.com>
 <CAEsQvcspNZFS4gbS=dQ1enkshVnG+-=xvoc8kskmoweTQjQhRw@mail.gmail.com>
 <CAEsQvcurb3s_W47f3N1h1=+oW4rX8tUSfQKv+_zyMMXXqJCBVw@mail.gmail.com>
 <CAHXb3bf4estasrkRhyME9w2hO6UmwUPAY+Vg6e4kvCnZh=R2zA@mail.gmail.com>
 <CAEsQvcs2Ov71mpSCXgefEFV1QQeqND871nu4+BV5KfT3kXtu+Q@mail.gmail.com>
 <CAHXb3bcpUBH9F=K9npwK-xO5sX+H11EV0_Nc7Otw7o93M=DKYQ@mail.gmail.com>
 <CAEsQvcs8HasvcJm0oEr87gNPxB6o2Km_NtAojTq+VkEX9EZd0g@mail.gmail.com>
 <CAHXb3bcMRrtMtfoHOCikNAkXxemnScfTPvJ702N_z6o5xj-G5g@mail.gmail.com>
 <CAEsQvcuo0g9STXn1d-Wux0TOH32mc88=Lw44r0ng+QocztcG3Q@mail.gmail.com>
 <CAOsVg8qWkYnW4sYP5S5A=BWvQWeBY08DrC7JZ9nNF8_nrsNArg@mail.gmail.com>
 <CAEsQvcs7y5Gr9X2vNkMHZU9akJAuBw7hE-XKcYKj9CJdO=GM8w@mail.gmail.com>
 <CAOsVg8rrJMdzADsRpjTOmi7Dk23bfej+KRFQWD77s9pmNW=g5w@mail.gmail.com>
 <CAEsQvcvUJ0p4bPLJhzppJR-uFjoyOiu2_=QtAvMvNwPh9AfAFA@mail.gmail.com>
 <CAOsVg8q_5yWBOR6DROJT7=Xv=R2yVNWSEjt4MUAx0QpQ6Af14g@mail.gmail.com>
 <CAHXb3beJxepHYraSXGCB4n9RBbBnLo05dcG=7nED1b_ZGRrMaw@mail.gmail.com>
 <CAOsVg8r85TsJypOSm5ZRv49uv+v=MZyNONe32AgGZL0fbYNayw@mail.gmail.com>
 <CAOsVg8rD==rjuVU0MR8rkp4VQi_6=UfO16huhsZx4-hM-su1xA@mail.gmail.com>
 <CAEsQvcuJF9D8nxbBXWbYKer5oTr7RbMQw9YiXzqb+Hof=gehCg@mail.gmail.com>
 <CAOsVg8oEqEsDVA67s2OoHbvLgTy5wYjwBOTOJeX+uS29nPf+kw@mail.gmail.com>
 <CAEsQvcsUTchyaDqp+1VOnJuREP9L27JkG90pY9aD3TBLWaAdSg@mail.gmail.com>
In-Reply-To: <CAEsQvcsUTchyaDqp+1VOnJuREP9L27JkG90pY9aD3TBLWaAdSg@mail.gmail.com>
From: Lucas <jaffa225man@gmail.com>
Date: Thu, 15 Apr 2021 20:25:56 -0500
Message-ID: <CAOsVg8qptM0bYLczunL-8fF+CiXHYJxSgJWObvXQXsL5Mux=rw@mail.gmail.com>
Subject: Re: Implicit feedback on BOSS GT-1, the saga continues...
To: alsa-devel@alsa-project.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Cc: tiwai@suse.de, Mike Oliphant <oliphant@nostatic.org>,
 Geraldo Nascimento <geraldogabriel@gmail.com>
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

Here's the patch proposed to be included in the next kernel release.
Thanks for the support from all of you!
I removed the Rubix22, Rubix24, and Rubix44 from it, since I found a blog
post about the Rubix44 working with Linux already:
https://www.google.com/url?sa=3Dt&rct=3Dj&q=3D&esrc=3Ds&source=3Dweb&cd=3D&=
cad=3Drja&uact=3D8&ved=3D2ahUKEwiY1_zzxYHwAhUJTawKHU7wAyMQ7gEwBnoECAIQBw&ur=
l=3Dhttps%3A%2F%2Ftranslate.google.com%2Ftranslate%3Fhl%3Den%26sl%3Dcs%26u%=
3Dhttps%3A%2F%2Fblog.frantovo.cz%2Fc%2F365%2FRoland%252520Rubix44%252520%25=
25E2%252580%252593%252520extern%2525C3%2525AD%252520zvukov%2525C3%2525A1%25=
2520karta%26prev%3Dsearch%26pto%3Daue&usg=3DAOvVaw2H_Kumf2nAZW6pojLLtyZY

I also took Takashi Iwai's suggestion that a "Synch Type" of "Asynchronous"
for both the "In" and the "Out" Endpoints probably means we should use
IMPLICIT_FB_BOTH_DEV (and IMPLICIT_FB_FIXED_DEV otherwise) and edited it
again with the help of "lsusb -v" results around the Internet.  Here are
the conclusions I came to with what I could find through google, but the
unavailable (unlisted) others, I'm leaving IMPLICIT_FB_FIXED_DEV to be
safe.  These should all be certain (so are my devices but I didn't relist
them here):

0582:0109 both
0582:0111 both
0582:0114 fixed
0582:0127 both
0582:012b fixed
0582:012f both
0582:0137 fixed
0582:0138 both
0582:014d both
0582:0159 fixed
0582:017c both
0582:01b5 both
0582:01fd both

Hopefully, after this is in the kernel, people will notice if they have
noise through playback, because it takes headphones for me.  Of course
anybody showing "lsusb -v" for their device should be able to discern the
need for IMPLICIT_FB_BOTH_DEV too.

Thanks Takashi!
Here's the patch for inclusion in mainline 5.13:
diff -Nurp linux-5.11.9.orig-2021-04-13/sound/usb/implicit.c
linux-5.11.9.roland1/sound/usb/implicit.c
--- linux-5.11.9.orig-2021-04-13/sound/usb/implicit.c 2021-04-13
14:23:34.743782890 -0500
+++ linux-5.11.9.roland1/sound/usb/implicit.c 2021-04-15 19:35:20.053444538
-0500
@@ -79,13 +79,72 @@ static const struct snd_usb_implicit_fb_

 /* Implicit feedback quirk table for capture: only FIXED type */
 static const struct snd_usb_implicit_fb_match capture_implicit_fb_quirks[]
=3D {
+ IMPLICIT_FB_FIXED_DEV(0x0582, 0x00a6, 0x0d, 0x01), /* Roland JUNO-G */
+ IMPLICIT_FB_FIXED_DEV(0x0582, 0x00a9, 0x0d, 0x01), /* Roland MC-808 */
+ IMPLICIT_FB_FIXED_DEV(0x0582, 0x00ad, 0x0d, 0x01), /* Roland SH-201 */
+ IMPLICIT_FB_FIXED_DEV(0x0582, 0x00b2, 0x0d, 0x01), /* Roland VG-99 */
+ IMPLICIT_FB_FIXED_DEV(0x0582, 0x00b3, 0x0d, 0x01), /* Roland VG-99 */
+ IMPLICIT_FB_FIXED_DEV(0x0582, 0x00c2, 0x0d, 0x01), /* Roland SonicCell */
+ IMPLICIT_FB_FIXED_DEV(0x0582, 0x00c4, 0x0d, 0x01), /* Edirol M-16DX */
+ IMPLICIT_FB_FIXED_DEV(0x0582, 0x00c5, 0x0d, 0x01), /* Roland SP-555 */
+ IMPLICIT_FB_FIXED_DEV(0x0582, 0x00c7, 0x0d, 0x01), /* Roland V-Synth GT *=
/
+ IMPLICIT_FB_FIXED_DEV(0x0582, 0x00d1, 0x0d, 0x01), /* Roland Music
Atelier */
+ IMPLICIT_FB_FIXED_DEV(0x0582, 0x00da, 0x0d, 0x01), /* BOSS GT-10 */
+ IMPLICIT_FB_FIXED_DEV(0x0582, 0x00db, 0x0d, 0x01), /* BOSS GT-10 Guitar
Effects Processor */
+ IMPLICIT_FB_FIXED_DEV(0x0582, 0x00dc, 0x0d, 0x01), /* BOSS GT-10B */
+ IMPLICIT_FB_FIXED_DEV(0x0582, 0x00de, 0x0d, 0x01), /* Roland Fantom-G */
+ IMPLICIT_FB_FIXED_DEV(0x0582, 0x00eb, 0x0d, 0x01), /* Roland VS-100 */
+ IMPLICIT_FB_FIXED_DEV(0x0582, 0x00f8, 0x0d, 0x01), /* Roland JUNO Series
*/
+ IMPLICIT_FB_FIXED_DEV(0x0582, 0x00fc, 0x0d, 0x01), /* Roland VS-700C */
+ IMPLICIT_FB_FIXED_DEV(0x0582, 0x00fd, 0x0d, 0x01), /* Roland VS-700 */
+ IMPLICIT_FB_FIXED_DEV(0x0582, 0x00fe, 0x0d, 0x01), /* Roland VS-700 M1 */
+ IMPLICIT_FB_FIXED_DEV(0x0582, 0x00ff, 0x0d, 0x01), /* Roland VS-700 M2 */
+ IMPLICIT_FB_FIXED_DEV(0x0582, 0x0100, 0x0d, 0x01), /* Roland VS-700 */
+ IMPLICIT_FB_FIXED_DEV(0x0582, 0x0101, 0x0d, 0x01), /* Roland VS-700 M2 */
+ IMPLICIT_FB_FIXED_DEV(0x0582, 0x0102, 0x0d, 0x01), /* Roland VB-99 */
+ IMPLICIT_FB_BOTH_DEV(0x0582, 0x0109, 0x0d, 0x01), /* BOSS eBand JS-8 */
+ IMPLICIT_FB_BOTH_DEV(0x0582, 0x0111, 0x0d, 0x01), /* Roland GAIA SH-01 */
+ IMPLICIT_FB_FIXED_DEV(0x0582, 0x0113, 0x0d, 0x01), /* BOSS ME-25 */
+ IMPLICIT_FB_FIXED_DEV(0x0582, 0x0114, 0x0d, 0x01), /* Roland SD-50 */
+ IMPLICIT_FB_FIXED_DEV(0x0582, 0x0117, 0x0d, 0x01), /* Roland VS-20 */
+ IMPLICIT_FB_FIXED_DEV(0x0582, 0x0119, 0x0d, 0x01), /* Roland OCTAPAD
SPD-30 */
+ IMPLICIT_FB_FIXED_DEV(0x0582, 0x011c, 0x0d, 0x01), /* Roland Lucina AX-09
*/
+ IMPLICIT_FB_FIXED_DEV(0x0582, 0x011e, 0x0d, 0x01), /* BOSS BR-800 */
+ IMPLICIT_FB_FIXED_DEV(0x0582, 0x0120, 0x0d, 0x01), /* Roland OCTA-CAPTURE
*/
+ IMPLICIT_FB_FIXED_DEV(0x0582, 0x0121, 0x0d, 0x01), /* Roland OCTA-CAPTURE
*/
+ IMPLICIT_FB_FIXED_DEV(0x0582, 0x0123, 0x0d, 0x01), /* Roland JUNO-Gi */
+ IMPLICIT_FB_FIXED_DEV(0x0582, 0x0124, 0x0d, 0x01), /* Roland M-300 */
+ IMPLICIT_FB_BOTH_DEV(0x0582, 0x0127, 0x0d, 0x01), /* Roland GR-55 */
+ IMPLICIT_FB_FIXED_DEV(0x0582, 0x012b, 0x0d, 0x01), /* Roland DUO-CAPTURE
*/
+ IMPLICIT_FB_BOTH_DEV(0x0582, 0x012f, 0x0d, 0x01), /* Roland QUAD-CAPTURE
*/
  IMPLICIT_FB_BOTH_DEV(0x0582, 0x0130, 0x0d, 0x01), /* BOSS BR-80 */
+ IMPLICIT_FB_FIXED_DEV(0x0582, 0x0132, 0x0d, 0x01), /* Roland TRI-CAPTURE
*/
+ IMPLICIT_FB_FIXED_DEV(0x0582, 0x0134, 0x0d, 0x01), /* Roland V-Mixer */
+ IMPLICIT_FB_FIXED_DEV(0x0582, 0x0137, 0x0d, 0x01), /* Roland DUO-CAPTURE
Advanced Mode*/
+ IMPLICIT_FB_BOTH_DEV(0x0582, 0x0138, 0x0d, 0x01), /* BOSS RC-300 */
+ IMPLICIT_FB_FIXED_DEV(0x0582, 0x013a, 0x0d, 0x01), /* Roland JUPITER-80 *=
/
+ IMPLICIT_FB_BOTH_DEV(0x0582, 0x013e, 0x0d, 0x01), /* Roland R-26 */
+ IMPLICIT_FB_FIXED_DEV(0x0582, 0x0145, 0x0d, 0x01), /* Roland SPD-SX */
+ IMPLICIT_FB_FIXED_DEV(0x0582, 0x014b, 0x0d, 0x01), /* BOSS eBand JS-10 */
+ IMPLICIT_FB_BOTH_DEV(0x0582, 0x014d, 0x0d, 0x01), /* BOSS GT-100 */
+ IMPLICIT_FB_FIXED_DEV(0x0582, 0x0150, 0x0d, 0x01), /* Roland TD-15 */
+ IMPLICIT_FB_FIXED_DEV(0x0582, 0x0151, 0x0d, 0x01), /* Roland TD-11 */
+ IMPLICIT_FB_FIXED_DEV(0x0582, 0x0154, 0x0d, 0x01), /* Roland JUPITER-50 *=
/
+ IMPLICIT_FB_FIXED_DEV(0x0582, 0x0158, 0x0d, 0x01), /* Roland TD-30 */
+ IMPLICIT_FB_FIXED_DEV(0x0582, 0x0159, 0x0d, 0x01), /* Roland DUO-CAPTURE
EX */
+ IMPLICIT_FB_BOTH_DEV(0x0582, 0x015b, 0x0d, 0x01), /* Roland INTEGRA-7 */
+ IMPLICIT_FB_FIXED_DEV(0x0582, 0x015d, 0x0d, 0x01), /* Roland R-88 */
  IMPLICIT_FB_BOTH_DEV(0x0582, 0x0171, 0x0d, 0x01), /* BOSS RC-505 */
+ IMPLICIT_FB_FIXED_DEV(0x0582, 0x017a, 0x0d, 0x01), /* Roland VT-3 */
+ IMPLICIT_FB_BOTH_DEV(0x0582, 0x017c, 0x0d, 0x01), /* Roland TR-8 */
  IMPLICIT_FB_BOTH_DEV(0x0582, 0x0185, 0x0d, 0x01), /* BOSS GP-10 */
  IMPLICIT_FB_BOTH_DEV(0x0582, 0x0189, 0x0d, 0x01), /* BOSS GT-100v2 */
+ IMPLICIT_FB_BOTH_DEV(0x0582, 0x01b5, 0x0d, 0x01), /* Roland Boutique
JP-08 */
  IMPLICIT_FB_BOTH_DEV(0x0582, 0x01d6, 0x0d, 0x01), /* BOSS GT-1 */
  IMPLICIT_FB_BOTH_DEV(0x0582, 0x01d8, 0x0d, 0x01), /* BOSS Katana */
  IMPLICIT_FB_BOTH_DEV(0x0582, 0x01e5, 0x0d, 0x01), /* BOSS GT-001 */
+ IMPLICIT_FB_BOTH_DEV(0x0582, 0x01fd, 0x0d, 0x01), /* Roland Boutique
SH-01A */
+ IMPLICIT_FB_BOTH_DEV(0x0582, 0x01ff, 0x0d, 0x01), /* Roland Boutique D-05
*/
  IMPLICIT_FB_BOTH_DEV(0x0582, 0x0203, 0x0d, 0x01), /* BOSS AD-10 */

  {} /* terminator */
