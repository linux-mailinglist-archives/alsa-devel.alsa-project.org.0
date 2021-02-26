Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D7C99325BEF
	for <lists+alsa-devel@lfdr.de>; Fri, 26 Feb 2021 04:27:07 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6D19315F2;
	Fri, 26 Feb 2021 04:26:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6D19315F2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1614310027;
	bh=QFb9xxR7oxhUl//uYHdzy3NAEYZuQyN4xwTIsYtbtfU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XO4VuwyE8z435SKSsthu4L3qzqJDHVYejwGmCIrruCavfPxvmOTf9z2BoPzm5Ao9L
	 uRlUlSotE2nn9etyQqjFeBDbXXJdw/x8RI13OuFeKfHyn0JIo7ApUn5YNnYaNL6aYU
	 X813qeE7JKWYqU/udb4cYseFALMe5D0vhdg/0jaY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6A44BF80159;
	Fri, 26 Feb 2021 04:25:36 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F0708F8016C; Fri, 26 Feb 2021 04:25:30 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-oi1-x230.google.com (mail-oi1-x230.google.com
 [IPv6:2607:f8b0:4864:20::230])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 38331F8012C
 for <alsa-devel@alsa-project.org>; Fri, 26 Feb 2021 04:25:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 38331F8012C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=endlessos.org header.i=@endlessos.org
 header.b="YBEth4sx"
Received: by mail-oi1-x230.google.com with SMTP id l64so8392548oig.9
 for <alsa-devel@alsa-project.org>; Thu, 25 Feb 2021 19:25:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=endlessos.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=W+2l0NNpBq+Qnjv0WpsTeGDz60YASdGJlf+tLVmTgvc=;
 b=YBEth4sxGYqBIiQCyhilVOJ0JbkCO+uF4haEck5ajsPJeO1K653m1fwAJIIUKNnAcw
 GP40tWdbTPXJWPgr2DRhuW6hfpJlnOmZW66tNoO5SmWNJMlFWR0Haz4eKsbEQ5BCE8Dk
 VT5zTXRfng+f6D85XHxT44YinDHOQ1PUNVqSKzI/K1gUEM6qQrDra0ZbOgL1Rokd6Xmh
 Mry/8M2it6irfISUqz7VFA2/1YWDdT/CHJK3+VlpIf67pllwS4yplXlMJD/CZAFvoe5k
 BC7M8A3+32ZCZI+JKBFlGEQQ4cSgCac90CkW3gDRDU0LHIjyDNSNuC7CLFobMgJxA1+H
 jtyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=W+2l0NNpBq+Qnjv0WpsTeGDz60YASdGJlf+tLVmTgvc=;
 b=gDgDN+FsOv7nBYFLDij1zCZIqmJ675sIdSCzCHK+1X9TIFrEodDJUVkRWHYlecn8Vf
 EV0/hqCqzrbzA25HSdMVGYC0KjB2pzJuxZLSC1AhPFLX872yiUn/1GmNaHqH2EmGWK3N
 B01X4RbjzJP5VVdkgs+nCJ2W3xw3z30/aIPUzVbvXPOJx20wNPqH26q0voTkKVDOqmNS
 v6sbhMmOhNTb4fFWYxj3HZi1EfLcCmZwVXZMi2deAVniUoKmOVoqMonh+doYbYtbOuMM
 dWQV0Suh1x7EA6HLoso7MHZX3acfRLNhzYnEK5jpw5XN4KnzzMFYrpgzdFekK3Vbk+qB
 caWg==
X-Gm-Message-State: AOAM530IKwcfiqKMZ771nBKssPipoMU8HXK/4BkoHX+WcIjrIi/EAjj5
 rnvu0bhtBgJ49QWuK9Xvn2SNxlxMGSjDdlazLpa1bg==
X-Google-Smtp-Source: ABdhPJzyPtTIygEci9voqgMTRuN7aTKS/Y81Rz0yzBJA8+Ro1Vcge868eFGrYey0gANcDwkMZ7o8GGM0OFL4UwhMXQo=
X-Received: by 2002:aca:6289:: with SMTP id w131mr668302oib.69.1614309922143; 
 Thu, 25 Feb 2021 19:25:22 -0800 (PST)
MIME-Version: 1.0
References: <20210226010440.8474-1-chris.chiu@canonical.com>
 <CAPpJ_ed1VqLQxcfdNobqWSkgtE7xrWKu8jK0U6jxWF1m3THdaA@mail.gmail.com>
In-Reply-To: <CAPpJ_ed1VqLQxcfdNobqWSkgtE7xrWKu8jK0U6jxWF1m3THdaA@mail.gmail.com>
From: Jian-Hong Pan <jhp@endlessos.org>
Date: Fri, 26 Feb 2021 11:24:21 +0800
Message-ID: <CAPpJ_ee4SNWJ3Zh6kEe_aMYLL_8tbApfMK4pvs2m2GfmhJmZgA@mail.gmail.com>
Subject: Re: [PATCH v2] ALSA: hda/realtek: Enable headset mic of Acer SWIFT
 with ALC256
To: chris.chiu@canonical.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Cc: alsa-devel@alsa-project.org, Kailang Yang <kailang@realtek.com>,
 Takashi Iwai <tiwai@suse.com>, Linux Kernel <linux-kernel@vger.kernel.org>,
 Hui Wang <hui.wang@canonical.com>, Kai-Heng Feng <kai.heng.feng@canonical.com>
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

Jian-Hong Pan <jhp@endlessos.org> =E6=96=BC 2021=E5=B9=B42=E6=9C=8826=E6=97=
=A5 =E9=80=B1=E4=BA=94 =E4=B8=8A=E5=8D=8810:05=E5=AF=AB=E9=81=93=EF=BC=9A
>
> <chris.chiu@canonical.com> =E6=96=BC 2021=E5=B9=B42=E6=9C=8826=E6=97=A5 =
=E9=80=B1=E4=BA=94 =E4=B8=8A=E5=8D=889:04=E5=AF=AB=E9=81=93=EF=BC=9A
> >
> > From: Chris Chiu <chris.chiu@canonical.com>
> >
> > The Acer SWIFT Swift SF314-54/55 laptops with ALC256 cannot detect
> > both the headset mic and the internal mic. Introduce new fixup
> > to enable the jack sense and the headset mic. However, the internal
> > mic actually connects to Intel SST audio. It still needs Intel SST
> > support to make internal mic capture work.
> >
> > Signed-off-by: Chris Chiu <chris.chiu@canonical.com>
> > ---
> >   v1 -> v2: remove unnecessary aamix fixup
> >
> >  sound/pci/hda/patch_realtek.c | 13 +++++++++++++
> >  1 file changed, 13 insertions(+)
> >
> > diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realte=
k.c
> > index 1927605f0f7e..4871507cd4bf 100644
> > --- a/sound/pci/hda/patch_realtek.c
> > +++ b/sound/pci/hda/patch_realtek.c
> > @@ -6406,6 +6406,7 @@ enum {
> >         ALC236_FIXUP_DELL_AIO_HEADSET_MIC,
> >         ALC282_FIXUP_ACER_DISABLE_LINEOUT,
> >         ALC255_FIXUP_ACER_LIMIT_INT_MIC_BOOST,
> > +       ALC256_FIXUP_ACER_HEADSET_MIC,
> >  };
> >
> >  static const struct hda_fixup alc269_fixups[] =3D {
> > @@ -7853,6 +7854,16 @@ static const struct hda_fixup alc269_fixups[] =
=3D {
> >                 .chained =3D true,
> >                 .chain_id =3D ALC255_FIXUP_ACER_MIC_NO_PRESENCE,
> >         },
> > +       [ALC256_FIXUP_ACER_HEADSET_MIC] =3D {
> > +               .type =3D HDA_FIXUP_PINS,
> > +               .v.pins =3D (const struct hda_pintbl[]) {
> > +                       { 0x19, 0x02a1113c }, /* use as headset mic, wi=
thout its own jack detect */
> > +                       { 0x1a, 0x90a1092f }, /* use as internal mic */
>
> Since NID 0x1a is an internal DMIC, should this connection type be 0h?
> Or, even the quirk of the internal DMIC is not needed for this case.
> Because, it is Intel SST DMIC that does not connect to Realtek HDA
> CODEC.  (Not sure for this one)
>
> The quirk of NID 0x19 is okay for me.

After more discussion and test with Chris, found the NID 0x1a quirk is
still needed.  Otherwise, the headset MIC 0x19 will not work any more.

So, I ack the version 2 patch.

Acked-by: Jian-Hong Pan <jhp@endlessos.org>

> > +                       { }
> > +               },
> > +               .chained =3D true,
> > +               .chain_id =3D ALC269_FIXUP_HEADSET_MODE_NO_HP_MIC
> > +       },
> >  };
> >
> >  static const struct snd_pci_quirk alc269_fixup_tbl[] =3D {
> > @@ -7879,9 +7890,11 @@ static const struct snd_pci_quirk alc269_fixup_t=
bl[] =3D {
> >         SND_PCI_QUIRK(0x1025, 0x1246, "Acer Predator Helios 500", ALC29=
9_FIXUP_PREDATOR_SPK),
> >         SND_PCI_QUIRK(0x1025, 0x1247, "Acer vCopperbox", ALC269VC_FIXUP=
_ACER_VCOPPERBOX_PINS),
> >         SND_PCI_QUIRK(0x1025, 0x1248, "Acer Veriton N4660G", ALC269VC_F=
IXUP_ACER_MIC_NO_PRESENCE),
> > +       SND_PCI_QUIRK(0x1025, 0x1269, "Acer SWIFT SF314-54", ALC256_FIX=
UP_ACER_HEADSET_MIC),
> >         SND_PCI_QUIRK(0x1025, 0x128f, "Acer Veriton Z6860G", ALC286_FIX=
UP_ACER_AIO_HEADSET_MIC),
> >         SND_PCI_QUIRK(0x1025, 0x1290, "Acer Veriton Z4860G", ALC286_FIX=
UP_ACER_AIO_HEADSET_MIC),
> >         SND_PCI_QUIRK(0x1025, 0x1291, "Acer Veriton Z4660G", ALC286_FIX=
UP_ACER_AIO_HEADSET_MIC),
> > +       SND_PCI_QUIRK(0x1025, 0x129c, "Acer SWIFT SF314-55", ALC256_FIX=
UP_ACER_HEADSET_MIC),
> >         SND_PCI_QUIRK(0x1025, 0x1308, "Acer Aspire Z24-890", ALC286_FIX=
UP_ACER_AIO_HEADSET_MIC),
> >         SND_PCI_QUIRK(0x1025, 0x132a, "Acer TravelMate B114-21", ALC233=
_FIXUP_ACER_HEADSET_MIC),
> >         SND_PCI_QUIRK(0x1025, 0x1330, "Acer TravelMate X514-51T", ALC25=
5_FIXUP_ACER_HEADSET_MIC),
> > --
> > 2.20.1
> >
