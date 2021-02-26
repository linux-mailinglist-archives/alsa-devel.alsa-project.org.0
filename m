Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 95ECE325B70
	for <lists+alsa-devel@lfdr.de>; Fri, 26 Feb 2021 03:07:28 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 996E1166D;
	Fri, 26 Feb 2021 03:06:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 996E1166D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1614305247;
	bh=NZUOPTwdXWTQQwM0ZYsyAsW8pTQOXPOWVHps+KzIcc8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=SvzVY/JX8quOCiiGQvkRr8SE9f2I33ikbmXCs2imspFm5yt+w+e3TlB+H0LSPtQVm
	 eExkI60KNq78j5pNvSp9RfieWtyP2+OnifSryMPEQXwmncOrmvgPlWR0jZyruuHdT7
	 D4vHdfHW0sX3goz3cbxpvJe7CqDi4CCcpCa95b5w=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 31A91F8026C;
	Fri, 26 Feb 2021 03:06:11 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 474A4F80245; Fri, 26 Feb 2021 03:06:09 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-oi1-x231.google.com (mail-oi1-x231.google.com
 [IPv6:2607:f8b0:4864:20::231])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D30CAF800E4
 for <alsa-devel@alsa-project.org>; Fri, 26 Feb 2021 03:06:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D30CAF800E4
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=endlessos.org header.i=@endlessos.org
 header.b="hROQH+eH"
Received: by mail-oi1-x231.google.com with SMTP id o3so8227322oic.8
 for <alsa-devel@alsa-project.org>; Thu, 25 Feb 2021 18:06:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=endlessos.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=TEurnvnOY0UmTThAshzFygi7pp659PSVZrpUu3wFGLI=;
 b=hROQH+eH59ynw+jEXUoBS0nUrg2rlQn1mDsc21mT6SdgqHwCZ8nkfIH1gSD9P5zl5N
 r5Fv7JHPDEiGIWRF5ZoAXuW3Zwba1oQ6CU5A85a8kK9j2S0T7mBWJqsUyeryI+qGJASp
 eN4V/WX+nSc0ROtexYEksc8y58dZgp2LKBJ4iSNuItO60HpGked6tt1HuzLdyYd+p89s
 gScgX+CRPW7nsc/Zv93TbMt/TptyXcxmqQ59pGK/bBxC5J+dOuHv9knzVH/g7CRHOojl
 yzxGRv9c6RlrY2bvjbP/FyFR2gWZJrFxVATpMfweVuUziXUAxfWPIc9Aix2tUdXs17Ae
 HLDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=TEurnvnOY0UmTThAshzFygi7pp659PSVZrpUu3wFGLI=;
 b=dLcaXqMnEMmxRPGg8m+c3wi1zMzy/jbYnrpLe5b0RJnoNcYV6mp2l28X8TwSNw0lY5
 vulcRaaLy1EzmN95ZWiEIm0hXS8jVxnjY9Tlj3O6nW4Q/ipns6wpDJkmQpBkNVX0LiG3
 WpaXj5c5zqW8MBcAPU0nfDW7zKy0/tvoe8r5GbTFw/70RpJ+CnPp4h8zhgIINH6vvTOk
 JtGKM0+CRObVxAu7qdm4qUFWMrJlVwcTXijiiFOEvupSea9vqlNQ6cV1LnNrPIZ0+UqN
 TVZ2Gbpd6JV8jIzB4KpR4YK7+SKURSaFwsDZA9FJ2vNoAh1Nyr97s4OsgQVqJxeUvcvg
 zyTw==
X-Gm-Message-State: AOAM530CryMW4kh8FzU1s1uqhP0J+AhdCdfCEYD/H+uP2frldeUc9upI
 PVDsq+Xu/AG0QGmk32NRwg0AYan6ptYxBOAK50rWew==
X-Google-Smtp-Source: ABdhPJwLbdjjSEpA9tPDJIp0UgD57ayyTMBSweHYSzyH1GU8UUElIgexqisJ4ZVko/j3oM0sqm+3BBahbvZXbhoIN+U=
X-Received: by 2002:a05:6808:1290:: with SMTP id
 a16mr541518oiw.161.1614305160603; 
 Thu, 25 Feb 2021 18:06:00 -0800 (PST)
MIME-Version: 1.0
References: <20210226010440.8474-1-chris.chiu@canonical.com>
In-Reply-To: <20210226010440.8474-1-chris.chiu@canonical.com>
From: Jian-Hong Pan <jhp@endlessos.org>
Date: Fri, 26 Feb 2021 10:05:00 +0800
Message-ID: <CAPpJ_ed1VqLQxcfdNobqWSkgtE7xrWKu8jK0U6jxWF1m3THdaA@mail.gmail.com>
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

<chris.chiu@canonical.com> =E6=96=BC 2021=E5=B9=B42=E6=9C=8826=E6=97=A5 =E9=
=80=B1=E4=BA=94 =E4=B8=8A=E5=8D=889:04=E5=AF=AB=E9=81=93=EF=BC=9A
>
> From: Chris Chiu <chris.chiu@canonical.com>
>
> The Acer SWIFT Swift SF314-54/55 laptops with ALC256 cannot detect
> both the headset mic and the internal mic. Introduce new fixup
> to enable the jack sense and the headset mic. However, the internal
> mic actually connects to Intel SST audio. It still needs Intel SST
> support to make internal mic capture work.
>
> Signed-off-by: Chris Chiu <chris.chiu@canonical.com>
> ---
>   v1 -> v2: remove unnecessary aamix fixup
>
>  sound/pci/hda/patch_realtek.c | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
>
> diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.=
c
> index 1927605f0f7e..4871507cd4bf 100644
> --- a/sound/pci/hda/patch_realtek.c
> +++ b/sound/pci/hda/patch_realtek.c
> @@ -6406,6 +6406,7 @@ enum {
>         ALC236_FIXUP_DELL_AIO_HEADSET_MIC,
>         ALC282_FIXUP_ACER_DISABLE_LINEOUT,
>         ALC255_FIXUP_ACER_LIMIT_INT_MIC_BOOST,
> +       ALC256_FIXUP_ACER_HEADSET_MIC,
>  };
>
>  static const struct hda_fixup alc269_fixups[] =3D {
> @@ -7853,6 +7854,16 @@ static const struct hda_fixup alc269_fixups[] =3D =
{
>                 .chained =3D true,
>                 .chain_id =3D ALC255_FIXUP_ACER_MIC_NO_PRESENCE,
>         },
> +       [ALC256_FIXUP_ACER_HEADSET_MIC] =3D {
> +               .type =3D HDA_FIXUP_PINS,
> +               .v.pins =3D (const struct hda_pintbl[]) {
> +                       { 0x19, 0x02a1113c }, /* use as headset mic, with=
out its own jack detect */
> +                       { 0x1a, 0x90a1092f }, /* use as internal mic */

Since NID 0x1a is an internal DMIC, should this connection type be 0h?
Or, even the quirk of the internal DMIC is not needed for this case.
Because, it is Intel SST DMIC that does not connect to Realtek HDA
CODEC.  (Not sure for this one)

The quirk of NID 0x19 is okay for me.

BR,
Jian-Hong Pan

> +                       { }
> +               },
> +               .chained =3D true,
> +               .chain_id =3D ALC269_FIXUP_HEADSET_MODE_NO_HP_MIC
> +       },
>  };
>
>  static const struct snd_pci_quirk alc269_fixup_tbl[] =3D {
> @@ -7879,9 +7890,11 @@ static const struct snd_pci_quirk alc269_fixup_tbl=
[] =3D {
>         SND_PCI_QUIRK(0x1025, 0x1246, "Acer Predator Helios 500", ALC299_=
FIXUP_PREDATOR_SPK),
>         SND_PCI_QUIRK(0x1025, 0x1247, "Acer vCopperbox", ALC269VC_FIXUP_A=
CER_VCOPPERBOX_PINS),
>         SND_PCI_QUIRK(0x1025, 0x1248, "Acer Veriton N4660G", ALC269VC_FIX=
UP_ACER_MIC_NO_PRESENCE),
> +       SND_PCI_QUIRK(0x1025, 0x1269, "Acer SWIFT SF314-54", ALC256_FIXUP=
_ACER_HEADSET_MIC),
>         SND_PCI_QUIRK(0x1025, 0x128f, "Acer Veriton Z6860G", ALC286_FIXUP=
_ACER_AIO_HEADSET_MIC),
>         SND_PCI_QUIRK(0x1025, 0x1290, "Acer Veriton Z4860G", ALC286_FIXUP=
_ACER_AIO_HEADSET_MIC),
>         SND_PCI_QUIRK(0x1025, 0x1291, "Acer Veriton Z4660G", ALC286_FIXUP=
_ACER_AIO_HEADSET_MIC),
> +       SND_PCI_QUIRK(0x1025, 0x129c, "Acer SWIFT SF314-55", ALC256_FIXUP=
_ACER_HEADSET_MIC),
>         SND_PCI_QUIRK(0x1025, 0x1308, "Acer Aspire Z24-890", ALC286_FIXUP=
_ACER_AIO_HEADSET_MIC),
>         SND_PCI_QUIRK(0x1025, 0x132a, "Acer TravelMate B114-21", ALC233_F=
IXUP_ACER_HEADSET_MIC),
>         SND_PCI_QUIRK(0x1025, 0x1330, "Acer TravelMate X514-51T", ALC255_=
FIXUP_ACER_HEADSET_MIC),
> --
> 2.20.1
>
