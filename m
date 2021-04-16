Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 43908361734
	for <lists+alsa-devel@lfdr.de>; Fri, 16 Apr 2021 03:31:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C70E8168C;
	Fri, 16 Apr 2021 03:30:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C70E8168C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1618536670;
	bh=BladdyGIWFjNqr6Dls8eqd0x59o2Fq0B3nep8E0f0KI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ojlbanPvOqMFNhY1TaL77mAR4O6gq5cV4MmAGpvctK/6W/ZW37KHs5jSo8I2/M8on
	 s7G03oA/0Ep8/b67K+sg+AydG2ACH+KKa3MkRt0QQpmLT6ykiYO1fzzcjB3N9NTWFe
	 3izij3VgOUvjWB66RutgWs76yz6hFBloT79dNd14=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 66370F8025B;
	Fri, 16 Apr 2021 03:29:43 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D06A9F8025B; Fri, 16 Apr 2021 03:29:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,GB_GOOGLE_OBFUR,HTML_MESSAGE,SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9F566F80128
 for <alsa-devel@alsa-project.org>; Fri, 16 Apr 2021 03:28:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9F566F80128
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="V55XUHYb"
Received: by mail-ej1-x62c.google.com with SMTP id x12so18923726ejc.1
 for <alsa-devel@alsa-project.org>; Thu, 15 Apr 2021 18:28:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=grlEaofSHk/otGVWt8zlu4OaNphXv5a4HONYdZg7gIk=;
 b=V55XUHYbkoxeBJy6badIm1PLHKDoefZXOMax5uLUyDoO+oUPXUvLJTNV+mOzrlSeCQ
 teNXk92wptlR7qCaJBaRwde0IEspmbdWosQl2ooOFbFechEWmLqAYOysNDBNVdV17wrn
 fonzW98VtQM5ZukaBkfjBtPOgalPLvllGhChnmtN8S1auSCP5yLXMKvr0BT1Mmxr+dBj
 LE5HOwRHy4GEErOHqZortZNFUcaxGAh/OgoCOmwri36aISVsrdigScCWl+SUwynPSVI6
 kI2E8aLAEM0GSzjlsvPtuGdc8/cg7QbT90A8lgRHclNaOddNBTWXoQ2WFF+XzJg50itc
 blZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=grlEaofSHk/otGVWt8zlu4OaNphXv5a4HONYdZg7gIk=;
 b=mrtEOpFo4CMc+ava9gmul2XoWffT4/HZOD30Zfx3iVUbjwttGHJ/gm4BHGgVgq13Ac
 MbG7oM9obxUG8m/dyp5g/enPFAa+3QtYfMJyCRkHHKUXP0FlTSPDnzssS4p62/P4u+Vs
 oBOE9irEnkNEy3p7FlA+XlFGLL6Mm+SizxqzoEtJ7c+Kq2hVrYwck8OFGe9IiaIBgIMZ
 1MobBivCAkJOcieKdadmM7DsdFy9euAVriVfEI6cL9wgn2OqgecrsNo84rCN//s+ufsT
 n71M8Nv1gNds1352VnD9OjsRBM66qcqcOZNvTrGo+Lu6+UlwSs24GFgaA+9dNlZJfKIM
 7uAQ==
X-Gm-Message-State: AOAM530cvc3RG1ekSFw1NIhDODN6AsoeIcI2HmaZNGVCc4OxhNMSl5xo
 3VP7zfMSAKqVZtdkhCldi6Khe5LEEI6OgjIcS8O56gaZJAo=
X-Google-Smtp-Source: ABdhPJxlak/WKC6oJQt1oMA/YPeEhD/CEVUYaw6duoxMYEy9EGzk+KvkA5a//GiIFmBjP2ex6V9jaHj+HG95n3kOmTI=
X-Received: by 2002:a17:907:20f0:: with SMTP id
 rh16mr6453086ejb.320.1618536534003; 
 Thu, 15 Apr 2021 18:28:54 -0700 (PDT)
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
 <CAOsVg8qptM0bYLczunL-8fF+CiXHYJxSgJWObvXQXsL5Mux=rw@mail.gmail.com>
In-Reply-To: <CAOsVg8qptM0bYLczunL-8fF+CiXHYJxSgJWObvXQXsL5Mux=rw@mail.gmail.com>
From: Lucas <jaffa225man@gmail.com>
Date: Thu, 15 Apr 2021 20:28:40 -0500
Message-ID: <CAOsVg8pEjJvm7cHeOivQursVUiOs+oCz6oWTt+8R6Sx+2TiHJw@mail.gmail.com>
Subject: Re: Implicit feedback on BOSS GT-1, the saga continues...
To: alsa-devel@alsa-project.org
Content-Type: multipart/mixed; boundary="0000000000002a70b705c00ce737"
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

--0000000000002a70b705c00ce737
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Just in case you'd rather an attachment, here it is that way.

On Thu, Apr 15, 2021 at 8:25 PM Lucas <jaffa225man@gmail.com> wrote:

> Here's the patch proposed to be included in the next kernel release.
> Thanks for the support from all of you!
> I removed the Rubix22, Rubix24, and Rubix44 from it, since I found a blog
> post about the Rubix44 working with Linux already:
> https://www.google.com/url?sa=3Dt&rct=3Dj&q=3D&esrc=3Ds&source=3Dweb&cd=
=3D&cad=3Drja&uact=3D8&ved=3D2ahUKEwiY1_zzxYHwAhUJTawKHU7wAyMQ7gEwBnoECAIQB=
w&url=3Dhttps%3A%2F%2Ftranslate.google.com%2Ftranslate%3Fhl%3Den%26sl%3Dcs%=
26u%3Dhttps%3A%2F%2Fblog.frantovo.cz%2Fc%2F365%2FRoland%252520Rubix44%25252=
0%2525E2%252580%252593%252520extern%2525C3%2525AD%252520zvukov%2525C3%2525A=
1%252520karta%26prev%3Dsearch%26pto%3Daue&usg=3DAOvVaw2H_Kumf2nAZW6pojLLtyZ=
Y
>
> I also took Takashi Iwai's suggestion that a "Synch Type" of
> "Asynchronous" for both the "In" and the "Out" Endpoints probably means w=
e
> should use IMPLICIT_FB_BOTH_DEV (and IMPLICIT_FB_FIXED_DEV otherwise) and
> edited it again with the help of "lsusb -v" results around the Internet.
> Here are the conclusions I came to with what I could find through google,
> but the unavailable (unlisted) others, I'm leaving IMPLICIT_FB_FIXED_DEV =
to
> be safe.  These should all be certain (so are my devices but I didn't
> relist them here):
>
> 0582:0109 both
> 0582:0111 both
> 0582:0114 fixed
> 0582:0127 both
> 0582:012b fixed
> 0582:012f both
> 0582:0137 fixed
> 0582:0138 both
> 0582:014d both
> 0582:0159 fixed
> 0582:017c both
> 0582:01b5 both
> 0582:01fd both
>
> Hopefully, after this is in the kernel, people will notice if they have
> noise through playback, because it takes headphones for me.  Of course
> anybody showing "lsusb -v" for their device should be able to discern the
> need for IMPLICIT_FB_BOTH_DEV too.
>
> Thanks Takashi!
> Here's the patch for inclusion in mainline 5.13:
> diff -Nurp linux-5.11.9.orig-2021-04-13/sound/usb/implicit.c
> linux-5.11.9.roland1/sound/usb/implicit.c
> --- linux-5.11.9.orig-2021-04-13/sound/usb/implicit.c 2021-04-13
> 14:23:34.743782890 -0500
> +++ linux-5.11.9.roland1/sound/usb/implicit.c 2021-04-15
> 19:35:20.053444538 -0500
> @@ -79,13 +79,72 @@ static const struct snd_usb_implicit_fb_
>
>  /* Implicit feedback quirk table for capture: only FIXED type */
>  static const struct snd_usb_implicit_fb_match
> capture_implicit_fb_quirks[] =3D {
> + IMPLICIT_FB_FIXED_DEV(0x0582, 0x00a6, 0x0d, 0x01), /* Roland JUNO-G */
> + IMPLICIT_FB_FIXED_DEV(0x0582, 0x00a9, 0x0d, 0x01), /* Roland MC-808 */
> + IMPLICIT_FB_FIXED_DEV(0x0582, 0x00ad, 0x0d, 0x01), /* Roland SH-201 */
> + IMPLICIT_FB_FIXED_DEV(0x0582, 0x00b2, 0x0d, 0x01), /* Roland VG-99 */
> + IMPLICIT_FB_FIXED_DEV(0x0582, 0x00b3, 0x0d, 0x01), /* Roland VG-99 */
> + IMPLICIT_FB_FIXED_DEV(0x0582, 0x00c2, 0x0d, 0x01), /* Roland SonicCell =
*/
> + IMPLICIT_FB_FIXED_DEV(0x0582, 0x00c4, 0x0d, 0x01), /* Edirol M-16DX */
> + IMPLICIT_FB_FIXED_DEV(0x0582, 0x00c5, 0x0d, 0x01), /* Roland SP-555 */
> + IMPLICIT_FB_FIXED_DEV(0x0582, 0x00c7, 0x0d, 0x01), /* Roland V-Synth GT
> */
> + IMPLICIT_FB_FIXED_DEV(0x0582, 0x00d1, 0x0d, 0x01), /* Roland Music
> Atelier */
> + IMPLICIT_FB_FIXED_DEV(0x0582, 0x00da, 0x0d, 0x01), /* BOSS GT-10 */
> + IMPLICIT_FB_FIXED_DEV(0x0582, 0x00db, 0x0d, 0x01), /* BOSS GT-10 Guitar
> Effects Processor */
> + IMPLICIT_FB_FIXED_DEV(0x0582, 0x00dc, 0x0d, 0x01), /* BOSS GT-10B */
> + IMPLICIT_FB_FIXED_DEV(0x0582, 0x00de, 0x0d, 0x01), /* Roland Fantom-G *=
/
> + IMPLICIT_FB_FIXED_DEV(0x0582, 0x00eb, 0x0d, 0x01), /* Roland VS-100 */
> + IMPLICIT_FB_FIXED_DEV(0x0582, 0x00f8, 0x0d, 0x01), /* Roland JUNO Serie=
s
> */
> + IMPLICIT_FB_FIXED_DEV(0x0582, 0x00fc, 0x0d, 0x01), /* Roland VS-700C */
> + IMPLICIT_FB_FIXED_DEV(0x0582, 0x00fd, 0x0d, 0x01), /* Roland VS-700 */
> + IMPLICIT_FB_FIXED_DEV(0x0582, 0x00fe, 0x0d, 0x01), /* Roland VS-700 M1 =
*/
> + IMPLICIT_FB_FIXED_DEV(0x0582, 0x00ff, 0x0d, 0x01), /* Roland VS-700 M2 =
*/
> + IMPLICIT_FB_FIXED_DEV(0x0582, 0x0100, 0x0d, 0x01), /* Roland VS-700 */
> + IMPLICIT_FB_FIXED_DEV(0x0582, 0x0101, 0x0d, 0x01), /* Roland VS-700 M2 =
*/
> + IMPLICIT_FB_FIXED_DEV(0x0582, 0x0102, 0x0d, 0x01), /* Roland VB-99 */
> + IMPLICIT_FB_BOTH_DEV(0x0582, 0x0109, 0x0d, 0x01), /* BOSS eBand JS-8 */
> + IMPLICIT_FB_BOTH_DEV(0x0582, 0x0111, 0x0d, 0x01), /* Roland GAIA SH-01 =
*/
> + IMPLICIT_FB_FIXED_DEV(0x0582, 0x0113, 0x0d, 0x01), /* BOSS ME-25 */
> + IMPLICIT_FB_FIXED_DEV(0x0582, 0x0114, 0x0d, 0x01), /* Roland SD-50 */
> + IMPLICIT_FB_FIXED_DEV(0x0582, 0x0117, 0x0d, 0x01), /* Roland VS-20 */
> + IMPLICIT_FB_FIXED_DEV(0x0582, 0x0119, 0x0d, 0x01), /* Roland OCTAPAD
> SPD-30 */
> + IMPLICIT_FB_FIXED_DEV(0x0582, 0x011c, 0x0d, 0x01), /* Roland Lucina
> AX-09 */
> + IMPLICIT_FB_FIXED_DEV(0x0582, 0x011e, 0x0d, 0x01), /* BOSS BR-800 */
> + IMPLICIT_FB_FIXED_DEV(0x0582, 0x0120, 0x0d, 0x01), /* Roland
> OCTA-CAPTURE */
> + IMPLICIT_FB_FIXED_DEV(0x0582, 0x0121, 0x0d, 0x01), /* Roland
> OCTA-CAPTURE */
> + IMPLICIT_FB_FIXED_DEV(0x0582, 0x0123, 0x0d, 0x01), /* Roland JUNO-Gi */
> + IMPLICIT_FB_FIXED_DEV(0x0582, 0x0124, 0x0d, 0x01), /* Roland M-300 */
> + IMPLICIT_FB_BOTH_DEV(0x0582, 0x0127, 0x0d, 0x01), /* Roland GR-55 */
> + IMPLICIT_FB_FIXED_DEV(0x0582, 0x012b, 0x0d, 0x01), /* Roland DUO-CAPTUR=
E
> */
> + IMPLICIT_FB_BOTH_DEV(0x0582, 0x012f, 0x0d, 0x01), /* Roland QUAD-CAPTUR=
E
> */
>   IMPLICIT_FB_BOTH_DEV(0x0582, 0x0130, 0x0d, 0x01), /* BOSS BR-80 */
> + IMPLICIT_FB_FIXED_DEV(0x0582, 0x0132, 0x0d, 0x01), /* Roland TRI-CAPTUR=
E
> */
> + IMPLICIT_FB_FIXED_DEV(0x0582, 0x0134, 0x0d, 0x01), /* Roland V-Mixer */
> + IMPLICIT_FB_FIXED_DEV(0x0582, 0x0137, 0x0d, 0x01), /* Roland DUO-CAPTUR=
E
> Advanced Mode*/
> + IMPLICIT_FB_BOTH_DEV(0x0582, 0x0138, 0x0d, 0x01), /* BOSS RC-300 */
> + IMPLICIT_FB_FIXED_DEV(0x0582, 0x013a, 0x0d, 0x01), /* Roland JUPITER-80
> */
> + IMPLICIT_FB_BOTH_DEV(0x0582, 0x013e, 0x0d, 0x01), /* Roland R-26 */
> + IMPLICIT_FB_FIXED_DEV(0x0582, 0x0145, 0x0d, 0x01), /* Roland SPD-SX */
> + IMPLICIT_FB_FIXED_DEV(0x0582, 0x014b, 0x0d, 0x01), /* BOSS eBand JS-10 =
*/
> + IMPLICIT_FB_BOTH_DEV(0x0582, 0x014d, 0x0d, 0x01), /* BOSS GT-100 */
> + IMPLICIT_FB_FIXED_DEV(0x0582, 0x0150, 0x0d, 0x01), /* Roland TD-15 */
> + IMPLICIT_FB_FIXED_DEV(0x0582, 0x0151, 0x0d, 0x01), /* Roland TD-11 */
> + IMPLICIT_FB_FIXED_DEV(0x0582, 0x0154, 0x0d, 0x01), /* Roland JUPITER-50
> */
> + IMPLICIT_FB_FIXED_DEV(0x0582, 0x0158, 0x0d, 0x01), /* Roland TD-30 */
> + IMPLICIT_FB_FIXED_DEV(0x0582, 0x0159, 0x0d, 0x01), /* Roland DUO-CAPTUR=
E
> EX */
> + IMPLICIT_FB_BOTH_DEV(0x0582, 0x015b, 0x0d, 0x01), /* Roland INTEGRA-7 *=
/
> + IMPLICIT_FB_FIXED_DEV(0x0582, 0x015d, 0x0d, 0x01), /* Roland R-88 */
>   IMPLICIT_FB_BOTH_DEV(0x0582, 0x0171, 0x0d, 0x01), /* BOSS RC-505 */
> + IMPLICIT_FB_FIXED_DEV(0x0582, 0x017a, 0x0d, 0x01), /* Roland VT-3 */
> + IMPLICIT_FB_BOTH_DEV(0x0582, 0x017c, 0x0d, 0x01), /* Roland TR-8 */
>   IMPLICIT_FB_BOTH_DEV(0x0582, 0x0185, 0x0d, 0x01), /* BOSS GP-10 */
>   IMPLICIT_FB_BOTH_DEV(0x0582, 0x0189, 0x0d, 0x01), /* BOSS GT-100v2 */
> + IMPLICIT_FB_BOTH_DEV(0x0582, 0x01b5, 0x0d, 0x01), /* Roland Boutique
> JP-08 */
>   IMPLICIT_FB_BOTH_DEV(0x0582, 0x01d6, 0x0d, 0x01), /* BOSS GT-1 */
>   IMPLICIT_FB_BOTH_DEV(0x0582, 0x01d8, 0x0d, 0x01), /* BOSS Katana */
>   IMPLICIT_FB_BOTH_DEV(0x0582, 0x01e5, 0x0d, 0x01), /* BOSS GT-001 */
> + IMPLICIT_FB_BOTH_DEV(0x0582, 0x01fd, 0x0d, 0x01), /* Roland Boutique
> SH-01A */
> + IMPLICIT_FB_BOTH_DEV(0x0582, 0x01ff, 0x0d, 0x01), /* Roland Boutique
> D-05 */
>   IMPLICIT_FB_BOTH_DEV(0x0582, 0x0203, 0x0d, 0x01), /* BOSS AD-10 */
>
>   {} /* terminator */
>


--=20
Protect your digital freedom and privacy, eliminate DRM, learn more at
http://www.defectivebydesign.org/what_is_drm
On a related note, also see https://www.fsf.org/campaigns/surveillance

--0000000000002a70b705c00ce737
Content-Type: text/x-patch; charset="US-ASCII"; name="linux-5.11.9-roland1.patch"
Content-Disposition: attachment; filename="linux-5.11.9-roland1.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_knjmujmo0>
X-Attachment-Id: f_knjmujmo0

ZGlmZiAtTnVycCBsaW51eC01LjExLjkub3JpZy0yMDIxLTA0LTEzL3NvdW5kL3VzYi9pbXBsaWNp
dC5jIGxpbnV4LTUuMTEuOS5yb2xhbmQxL3NvdW5kL3VzYi9pbXBsaWNpdC5jCi0tLSBsaW51eC01
LjExLjkub3JpZy0yMDIxLTA0LTEzL3NvdW5kL3VzYi9pbXBsaWNpdC5jCTIwMjEtMDQtMTMgMTQ6
MjM6MzQuNzQzNzgyODkwIC0wNTAwCisrKyBsaW51eC01LjExLjkucm9sYW5kMS9zb3VuZC91c2Iv
aW1wbGljaXQuYwkyMDIxLTA0LTE1IDE5OjM1OjIwLjA1MzQ0NDUzOCAtMDUwMApAQCAtNzksMTMg
Kzc5LDcyIEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3Qgc25kX3VzYl9pbXBsaWNpdF9mYl8KIAogLyog
SW1wbGljaXQgZmVlZGJhY2sgcXVpcmsgdGFibGUgZm9yIGNhcHR1cmU6IG9ubHkgRklYRUQgdHlw
ZSAqLwogc3RhdGljIGNvbnN0IHN0cnVjdCBzbmRfdXNiX2ltcGxpY2l0X2ZiX21hdGNoIGNhcHR1
cmVfaW1wbGljaXRfZmJfcXVpcmtzW10gPSB7CisJSU1QTElDSVRfRkJfRklYRURfREVWKDB4MDU4
MiwgMHgwMGE2LCAweDBkLCAweDAxKSwgLyogUm9sYW5kIEpVTk8tRyAqLworCUlNUExJQ0lUX0ZC
X0ZJWEVEX0RFVigweDA1ODIsIDB4MDBhOSwgMHgwZCwgMHgwMSksIC8qIFJvbGFuZCBNQy04MDgg
Ki8KKwlJTVBMSUNJVF9GQl9GSVhFRF9ERVYoMHgwNTgyLCAweDAwYWQsIDB4MGQsIDB4MDEpLCAv
KiBSb2xhbmQgU0gtMjAxICovCisJSU1QTElDSVRfRkJfRklYRURfREVWKDB4MDU4MiwgMHgwMGIy
LCAweDBkLCAweDAxKSwgLyogUm9sYW5kIFZHLTk5ICovCisJSU1QTElDSVRfRkJfRklYRURfREVW
KDB4MDU4MiwgMHgwMGIzLCAweDBkLCAweDAxKSwgLyogUm9sYW5kIFZHLTk5ICovCisJSU1QTElD
SVRfRkJfRklYRURfREVWKDB4MDU4MiwgMHgwMGMyLCAweDBkLCAweDAxKSwgLyogUm9sYW5kIFNv
bmljQ2VsbCAqLworCUlNUExJQ0lUX0ZCX0ZJWEVEX0RFVigweDA1ODIsIDB4MDBjNCwgMHgwZCwg
MHgwMSksIC8qIEVkaXJvbCBNLTE2RFggKi8KKwlJTVBMSUNJVF9GQl9GSVhFRF9ERVYoMHgwNTgy
LCAweDAwYzUsIDB4MGQsIDB4MDEpLCAvKiBSb2xhbmQgU1AtNTU1ICovCisJSU1QTElDSVRfRkJf
RklYRURfREVWKDB4MDU4MiwgMHgwMGM3LCAweDBkLCAweDAxKSwgLyogUm9sYW5kIFYtU3ludGgg
R1QgKi8KKwlJTVBMSUNJVF9GQl9GSVhFRF9ERVYoMHgwNTgyLCAweDAwZDEsIDB4MGQsIDB4MDEp
LCAvKiBSb2xhbmQgTXVzaWMgQXRlbGllciAqLworCUlNUExJQ0lUX0ZCX0ZJWEVEX0RFVigweDA1
ODIsIDB4MDBkYSwgMHgwZCwgMHgwMSksIC8qIEJPU1MgR1QtMTAgKi8KKwlJTVBMSUNJVF9GQl9G
SVhFRF9ERVYoMHgwNTgyLCAweDAwZGIsIDB4MGQsIDB4MDEpLCAvKiBCT1NTIEdULTEwIEd1aXRh
ciBFZmZlY3RzIFByb2Nlc3NvciAqLworCUlNUExJQ0lUX0ZCX0ZJWEVEX0RFVigweDA1ODIsIDB4
MDBkYywgMHgwZCwgMHgwMSksIC8qIEJPU1MgR1QtMTBCICovCisJSU1QTElDSVRfRkJfRklYRURf
REVWKDB4MDU4MiwgMHgwMGRlLCAweDBkLCAweDAxKSwgLyogUm9sYW5kIEZhbnRvbS1HICovCisJ
SU1QTElDSVRfRkJfRklYRURfREVWKDB4MDU4MiwgMHgwMGViLCAweDBkLCAweDAxKSwgLyogUm9s
YW5kIFZTLTEwMCAqLworCUlNUExJQ0lUX0ZCX0ZJWEVEX0RFVigweDA1ODIsIDB4MDBmOCwgMHgw
ZCwgMHgwMSksIC8qIFJvbGFuZCBKVU5PIFNlcmllcyAqLworCUlNUExJQ0lUX0ZCX0ZJWEVEX0RF
VigweDA1ODIsIDB4MDBmYywgMHgwZCwgMHgwMSksIC8qIFJvbGFuZCBWUy03MDBDICovCisJSU1Q
TElDSVRfRkJfRklYRURfREVWKDB4MDU4MiwgMHgwMGZkLCAweDBkLCAweDAxKSwgLyogUm9sYW5k
IFZTLTcwMCAqLworCUlNUExJQ0lUX0ZCX0ZJWEVEX0RFVigweDA1ODIsIDB4MDBmZSwgMHgwZCwg
MHgwMSksIC8qIFJvbGFuZCBWUy03MDAgTTEgKi8KKwlJTVBMSUNJVF9GQl9GSVhFRF9ERVYoMHgw
NTgyLCAweDAwZmYsIDB4MGQsIDB4MDEpLCAvKiBSb2xhbmQgVlMtNzAwIE0yICovCisJSU1QTElD
SVRfRkJfRklYRURfREVWKDB4MDU4MiwgMHgwMTAwLCAweDBkLCAweDAxKSwgLyogUm9sYW5kIFZT
LTcwMCAqLworCUlNUExJQ0lUX0ZCX0ZJWEVEX0RFVigweDA1ODIsIDB4MDEwMSwgMHgwZCwgMHgw
MSksIC8qIFJvbGFuZCBWUy03MDAgTTIgKi8KKwlJTVBMSUNJVF9GQl9GSVhFRF9ERVYoMHgwNTgy
LCAweDAxMDIsIDB4MGQsIDB4MDEpLCAvKiBSb2xhbmQgVkItOTkgKi8KKwlJTVBMSUNJVF9GQl9C
T1RIX0RFVigweDA1ODIsIDB4MDEwOSwgMHgwZCwgMHgwMSksIC8qIEJPU1MgZUJhbmQgSlMtOCAq
LworCUlNUExJQ0lUX0ZCX0JPVEhfREVWKDB4MDU4MiwgMHgwMTExLCAweDBkLCAweDAxKSwgLyog
Um9sYW5kIEdBSUEgU0gtMDEgKi8KKwlJTVBMSUNJVF9GQl9GSVhFRF9ERVYoMHgwNTgyLCAweDAx
MTMsIDB4MGQsIDB4MDEpLCAvKiBCT1NTIE1FLTI1ICovCisJSU1QTElDSVRfRkJfRklYRURfREVW
KDB4MDU4MiwgMHgwMTE0LCAweDBkLCAweDAxKSwgLyogUm9sYW5kIFNELTUwICovCisJSU1QTElD
SVRfRkJfRklYRURfREVWKDB4MDU4MiwgMHgwMTE3LCAweDBkLCAweDAxKSwgLyogUm9sYW5kIFZT
LTIwICovCisJSU1QTElDSVRfRkJfRklYRURfREVWKDB4MDU4MiwgMHgwMTE5LCAweDBkLCAweDAx
KSwgLyogUm9sYW5kIE9DVEFQQUQgU1BELTMwICovCisJSU1QTElDSVRfRkJfRklYRURfREVWKDB4
MDU4MiwgMHgwMTFjLCAweDBkLCAweDAxKSwgLyogUm9sYW5kIEx1Y2luYSBBWC0wOSAqLworCUlN
UExJQ0lUX0ZCX0ZJWEVEX0RFVigweDA1ODIsIDB4MDExZSwgMHgwZCwgMHgwMSksIC8qIEJPU1Mg
QlItODAwICovCisJSU1QTElDSVRfRkJfRklYRURfREVWKDB4MDU4MiwgMHgwMTIwLCAweDBkLCAw
eDAxKSwgLyogUm9sYW5kIE9DVEEtQ0FQVFVSRSAqLworCUlNUExJQ0lUX0ZCX0ZJWEVEX0RFVigw
eDA1ODIsIDB4MDEyMSwgMHgwZCwgMHgwMSksIC8qIFJvbGFuZCBPQ1RBLUNBUFRVUkUgKi8KKwlJ
TVBMSUNJVF9GQl9GSVhFRF9ERVYoMHgwNTgyLCAweDAxMjMsIDB4MGQsIDB4MDEpLCAvKiBSb2xh
bmQgSlVOTy1HaSAqLworCUlNUExJQ0lUX0ZCX0ZJWEVEX0RFVigweDA1ODIsIDB4MDEyNCwgMHgw
ZCwgMHgwMSksIC8qIFJvbGFuZCBNLTMwMCAqLworCUlNUExJQ0lUX0ZCX0JPVEhfREVWKDB4MDU4
MiwgMHgwMTI3LCAweDBkLCAweDAxKSwgLyogUm9sYW5kIEdSLTU1ICovCisJSU1QTElDSVRfRkJf
RklYRURfREVWKDB4MDU4MiwgMHgwMTJiLCAweDBkLCAweDAxKSwgLyogUm9sYW5kIERVTy1DQVBU
VVJFICovCisJSU1QTElDSVRfRkJfQk9USF9ERVYoMHgwNTgyLCAweDAxMmYsIDB4MGQsIDB4MDEp
LCAvKiBSb2xhbmQgUVVBRC1DQVBUVVJFICovCiAJSU1QTElDSVRfRkJfQk9USF9ERVYoMHgwNTgy
LCAweDAxMzAsIDB4MGQsIDB4MDEpLCAvKiBCT1NTIEJSLTgwICovCisJSU1QTElDSVRfRkJfRklY
RURfREVWKDB4MDU4MiwgMHgwMTMyLCAweDBkLCAweDAxKSwgLyogUm9sYW5kIFRSSS1DQVBUVVJF
ICovCisJSU1QTElDSVRfRkJfRklYRURfREVWKDB4MDU4MiwgMHgwMTM0LCAweDBkLCAweDAxKSwg
LyogUm9sYW5kIFYtTWl4ZXIgKi8KKwlJTVBMSUNJVF9GQl9GSVhFRF9ERVYoMHgwNTgyLCAweDAx
MzcsIDB4MGQsIDB4MDEpLCAvKiBSb2xhbmQgRFVPLUNBUFRVUkUgQWR2YW5jZWQgTW9kZSovCisJ
SU1QTElDSVRfRkJfQk9USF9ERVYoMHgwNTgyLCAweDAxMzgsIDB4MGQsIDB4MDEpLCAvKiBCT1NT
IFJDLTMwMCAqLworCUlNUExJQ0lUX0ZCX0ZJWEVEX0RFVigweDA1ODIsIDB4MDEzYSwgMHgwZCwg
MHgwMSksIC8qIFJvbGFuZCBKVVBJVEVSLTgwICovCisJSU1QTElDSVRfRkJfQk9USF9ERVYoMHgw
NTgyLCAweDAxM2UsIDB4MGQsIDB4MDEpLCAvKiBSb2xhbmQgUi0yNiAqLworCUlNUExJQ0lUX0ZC
X0ZJWEVEX0RFVigweDA1ODIsIDB4MDE0NSwgMHgwZCwgMHgwMSksIC8qIFJvbGFuZCBTUEQtU1gg
Ki8KKwlJTVBMSUNJVF9GQl9GSVhFRF9ERVYoMHgwNTgyLCAweDAxNGIsIDB4MGQsIDB4MDEpLCAv
KiBCT1NTIGVCYW5kIEpTLTEwICovCisJSU1QTElDSVRfRkJfQk9USF9ERVYoMHgwNTgyLCAweDAx
NGQsIDB4MGQsIDB4MDEpLCAvKiBCT1NTIEdULTEwMCAqLworCUlNUExJQ0lUX0ZCX0ZJWEVEX0RF
VigweDA1ODIsIDB4MDE1MCwgMHgwZCwgMHgwMSksIC8qIFJvbGFuZCBURC0xNSAqLworCUlNUExJ
Q0lUX0ZCX0ZJWEVEX0RFVigweDA1ODIsIDB4MDE1MSwgMHgwZCwgMHgwMSksIC8qIFJvbGFuZCBU
RC0xMSAqLworCUlNUExJQ0lUX0ZCX0ZJWEVEX0RFVigweDA1ODIsIDB4MDE1NCwgMHgwZCwgMHgw
MSksIC8qIFJvbGFuZCBKVVBJVEVSLTUwICovCisJSU1QTElDSVRfRkJfRklYRURfREVWKDB4MDU4
MiwgMHgwMTU4LCAweDBkLCAweDAxKSwgLyogUm9sYW5kIFRELTMwICovCisJSU1QTElDSVRfRkJf
RklYRURfREVWKDB4MDU4MiwgMHgwMTU5LCAweDBkLCAweDAxKSwgLyogUm9sYW5kIERVTy1DQVBU
VVJFIEVYICovCisJSU1QTElDSVRfRkJfQk9USF9ERVYoMHgwNTgyLCAweDAxNWIsIDB4MGQsIDB4
MDEpLCAvKiBSb2xhbmQgSU5URUdSQS03ICovCisJSU1QTElDSVRfRkJfRklYRURfREVWKDB4MDU4
MiwgMHgwMTVkLCAweDBkLCAweDAxKSwgLyogUm9sYW5kIFItODggKi8KIAlJTVBMSUNJVF9GQl9C
T1RIX0RFVigweDA1ODIsIDB4MDE3MSwgMHgwZCwgMHgwMSksIC8qIEJPU1MgUkMtNTA1ICovCisJ
SU1QTElDSVRfRkJfRklYRURfREVWKDB4MDU4MiwgMHgwMTdhLCAweDBkLCAweDAxKSwgLyogUm9s
YW5kIFZULTMgKi8KKwlJTVBMSUNJVF9GQl9CT1RIX0RFVigweDA1ODIsIDB4MDE3YywgMHgwZCwg
MHgwMSksIC8qIFJvbGFuZCBUUi04ICovCiAJSU1QTElDSVRfRkJfQk9USF9ERVYoMHgwNTgyLCAw
eDAxODUsIDB4MGQsIDB4MDEpLCAvKiBCT1NTIEdQLTEwICovCiAJSU1QTElDSVRfRkJfQk9USF9E
RVYoMHgwNTgyLCAweDAxODksIDB4MGQsIDB4MDEpLCAvKiBCT1NTIEdULTEwMHYyICovCisJSU1Q
TElDSVRfRkJfQk9USF9ERVYoMHgwNTgyLCAweDAxYjUsIDB4MGQsIDB4MDEpLCAvKiBSb2xhbmQg
Qm91dGlxdWUgSlAtMDggKi8KIAlJTVBMSUNJVF9GQl9CT1RIX0RFVigweDA1ODIsIDB4MDFkNiwg
MHgwZCwgMHgwMSksIC8qIEJPU1MgR1QtMSAqLwogCUlNUExJQ0lUX0ZCX0JPVEhfREVWKDB4MDU4
MiwgMHgwMWQ4LCAweDBkLCAweDAxKSwgLyogQk9TUyBLYXRhbmEgKi8KIAlJTVBMSUNJVF9GQl9C
T1RIX0RFVigweDA1ODIsIDB4MDFlNSwgMHgwZCwgMHgwMSksIC8qIEJPU1MgR1QtMDAxICovCisJ
SU1QTElDSVRfRkJfQk9USF9ERVYoMHgwNTgyLCAweDAxZmQsIDB4MGQsIDB4MDEpLCAvKiBSb2xh
bmQgQm91dGlxdWUgU0gtMDFBICovCisJSU1QTElDSVRfRkJfQk9USF9ERVYoMHgwNTgyLCAweDAx
ZmYsIDB4MGQsIDB4MDEpLCAvKiBSb2xhbmQgQm91dGlxdWUgRC0wNSAqLwogCUlNUExJQ0lUX0ZC
X0JPVEhfREVWKDB4MDU4MiwgMHgwMjAzLCAweDBkLCAweDAxKSwgLyogQk9TUyBBRC0xMCAqLwog
CiAJe30gLyogdGVybWluYXRvciAqLwo=
--0000000000002a70b705c00ce737--
