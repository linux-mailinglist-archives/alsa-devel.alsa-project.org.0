Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BB07325BF6
	for <lists+alsa-devel@lfdr.de>; Fri, 26 Feb 2021 04:29:55 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A0B9B1655;
	Fri, 26 Feb 2021 04:29:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A0B9B1655
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1614310194;
	bh=anTWgHUvWwmjKnDczXymmT5BjNd8JcSzrvrOEWuZJoE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=f587rG+1bIoWTynUQggy4gPK2qiTF/Um6OvE5DrzbAyQmJl57lPf/qM+dwxAo41BN
	 9R2/0HvDPRefj5QwxADUBuz0t9gMMvtvAGyEATHsrSIRkE1NNXM/SNpd6oU1opdUed
	 ail/XPkpdFVpdGlHYX0QpsQzrJzndTumMVq2FDJk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 19F40F8016C;
	Fri, 26 Feb 2021 04:28:24 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5F117F8016C; Fri, 26 Feb 2021 04:28:18 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 25CD0F80159
 for <alsa-devel@alsa-project.org>; Fri, 26 Feb 2021 04:28:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 25CD0F80159
Received: from mail-ot1-f69.google.com ([209.85.210.69])
 by youngberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <chris.chiu@canonical.com>) id 1lFTlJ-0001Gn-34
 for alsa-devel@alsa-project.org; Fri, 26 Feb 2021 03:25:53 +0000
Received: by mail-ot1-f69.google.com with SMTP id p15so4054663otk.23
 for <alsa-devel@alsa-project.org>; Thu, 25 Feb 2021 19:25:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=5dSe8zF5ysy2b33N95lbtVXHHADDXkQLDsXBhp0dzqg=;
 b=me8raeQ2aptwXUJxZo6ad9JAsKalq1lRyfjxlTFhUeBIb/IyBfim1q04fwpbXMqkzc
 20Lxr5aBWbWXFRhL33c98QQMZHc+yvwFZtGgP3aPW+/CzyBz2Ca88dRtpbgWF2skyg38
 NFuJYAyGhg6jsieXnXrTJ58d/hkuA3UicgDT8iYuXVvsBhRWcK6RS4+ZFMIpEtWJtnRZ
 vZKQxMqzkkAFUm5dQ/KVlpkVHtuDv8tw35K5WmKmZpPutX8p9nNxMO3wQse5RcvR44+N
 gDBsi9J+kXKq1F9RRHusZKdrbcCj86mICqCj0WMtQbfRvZJw25J3861AgJVaALJz4bjG
 lVCA==
X-Gm-Message-State: AOAM530UfQbacRErt1fj2f2fVjMV1D7N/MZrSLBqKrHd1NOETqKFWV9P
 WinENc3Zhd1xENdTabSYnrXdoyLV/kM+PabCC+/ER3RD+AhJAPY7obWFD1Kgdg5gGtWPbRHeeVE
 fbnhlir03cx91b3sOnqi/dbwzMIsLJbekZn3HdgTsYezuT9l1bpxgAksW
X-Received: by 2002:a9d:46e:: with SMTP id 101mr477583otc.303.1614309952109;
 Thu, 25 Feb 2021 19:25:52 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzenB3F1N/0F+4wtl0A9N7+V/VtvrhkANP5nLTJCfWtyooq+b85cQJ/0DGtq5TNWznUHI4k5+Vs6s6E0G9rqOU=
X-Received: by 2002:a9d:46e:: with SMTP id 101mr477564otc.303.1614309951706;
 Thu, 25 Feb 2021 19:25:51 -0800 (PST)
MIME-Version: 1.0
References: <20210226010440.8474-1-chris.chiu@canonical.com>
 <CAPpJ_ed1VqLQxcfdNobqWSkgtE7xrWKu8jK0U6jxWF1m3THdaA@mail.gmail.com>
In-Reply-To: <CAPpJ_ed1VqLQxcfdNobqWSkgtE7xrWKu8jK0U6jxWF1m3THdaA@mail.gmail.com>
From: Chris Chiu <chris.chiu@canonical.com>
Date: Fri, 26 Feb 2021 11:25:40 +0800
Message-ID: <CABTNMG1NDeotEskQaVXPFR7=HtPeOt6a=z49VS8L5QzdAyV4jw@mail.gmail.com>
Subject: Re: [PATCH v2] ALSA: hda/realtek: Enable headset mic of Acer SWIFT
 with ALC256
To: Jian-Hong Pan <jhp@endlessos.org>
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

On Fri, Feb 26, 2021 at 10:06 AM Jian-Hong Pan <jhp@endlessos.org> wrote:
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
>
Actually I tried the existing ALC256_FIXUP_ACER_MIC_NO_PRESENT
which only quirk the 0x19, the jack sense works but the headset mic
is still absent. That's the reason why I still need the 0x1a as the interna=
l
mic. I've verified the headset mic can be detected and work w/o problem.

Chris

> BR,
> Jian-Hong Pan
>
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
