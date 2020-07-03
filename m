Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B64AD2134B3
	for <lists+alsa-devel@lfdr.de>; Fri,  3 Jul 2020 09:11:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1B6D116C0;
	Fri,  3 Jul 2020 09:10:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1B6D116C0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1593760305;
	bh=tX7iSpxZSYRyOjZjKDAQd9VRve/6jCVqGe4t5dZMPec=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QHq79rKweKQ8wl6rN0w0eBZ/HG6TT9XGhVtFbMNq+J498YznjUQPKGsMhRMWRfUQD
	 aFfKod19Mm4biqDf772dtwbRkZOHZpUjEEnrwfob7o/JXbZBDoqGuzl1zqUeBdyGyd
	 yBynOJoTAim11VBqtnb6G3kqCt2Z6cdJGlh1bliY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F380BF80217;
	Fri,  3 Jul 2020 09:10:03 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D6B31F8021D; Fri,  3 Jul 2020 09:09:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2763CF800E0
 for <alsa-devel@alsa-project.org>; Fri,  3 Jul 2020 09:09:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2763CF800E0
Authenticated-By: 
X-SpamFilter-By: ArmorX SpamTrap 5.69 with qID 06379jJC2032263,
 This message is accepted by code: ctloc85258
Received: from mail.realtek.com (rtexmb06.realtek.com.tw[172.21.6.99])
 by rtits2.realtek.com.tw (8.15.2/2.66/5.86) with ESMTPS id 06379jJC2032263
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Fri, 3 Jul 2020 15:09:45 +0800
Received: from RTEXMB04.realtek.com.tw (172.21.6.97) by
 RTEXMB06.realtek.com.tw (172.21.6.99) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1779.2; Fri, 3 Jul 2020 15:09:45 +0800
Received: from RTEXMB01.realtek.com.tw (172.21.6.94) by
 RTEXMB04.realtek.com.tw (172.21.6.97) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1779.2; Fri, 3 Jul 2020 15:09:44 +0800
Received: from RTEXMB01.realtek.com.tw ([fe80::d53a:d9a5:318:7cd8]) by
 RTEXMB01.realtek.com.tw ([fe80::d53a:d9a5:318:7cd8%5]) with mapi id
 15.01.1779.005; Fri, 3 Jul 2020 15:09:44 +0800
From: Kailang <kailang@realtek.com>
To: Jian-Hong Pan <jian-hong@endlessm.com>, Takashi Iwai <tiwai@suse.com>
Subject: RE: [PATCH 2/3] ALSA: hda/realtek: Enable headset mic of Acer C20-820
 with ALC269VC
Thread-Topic: [PATCH 2/3] ALSA: hda/realtek: Enable headset mic of Acer
 C20-820 with ALC269VC
Thread-Index: AQHWUQiCbJr6/HdOAk2ka1fKSuRSn6j1b4Ig
Date: Fri, 3 Jul 2020 07:09:44 +0000
Message-ID: <5f49308c3090463791abddb12e12258b@realtek.com>
References: <20200703070512.174394-1-jian-hong@endlessm.com>
 <20200703070512.174394-2-jian-hong@endlessm.com>
In-Reply-To: <20200703070512.174394-2-jian-hong@endlessm.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.22.102.211]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "linux@endlessm.com" <linux@endlessm.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Daniel Drake <drake@endlessm.com>
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

Please also link model ALC269_FIXUP_HEADSET_MODE on this.

> -----Original Message-----
> From: Jian-Hong Pan <jian-hong@endlessm.com>
> Sent: Friday, July 3, 2020 3:05 PM
> To: Takashi Iwai <tiwai@suse.com>
> Cc: Kailang <kailang@realtek.com>; alsa-devel@alsa-project.org;
> linux-kernel@vger.kernel.org; linux@endlessm.com; Jian-Hong Pan
> <jian-hong@endlessm.com>; Daniel Drake <drake@endlessm.com>
> Subject: [PATCH 2/3] ALSA: hda/realtek: Enable headset mic of Acer C20-82=
0
> with ALC269VC
>=20
> The Acer Aspire C20-820 AIO's audio (1025:1065) with ALC269VC can't detec=
t
> the headset microphone until ALC269VC_FIXUP_ACER_HEADSET_MIC quirk
> maps the NID 0x18 as the headset mic pin.
>=20
> Signed-off-by: Jian-Hong Pan <jian-hong@endlessm.com>
> Signed-off-by: Daniel Drake <drake@endlessm.com>
> ---
>  sound/pci/hda/patch_realtek.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>=20
> diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.=
c
> index dfb4bca07d3f..3255da8b3849 100644
> --- a/sound/pci/hda/patch_realtek.c
> +++ b/sound/pci/hda/patch_realtek.c
> @@ -6150,6 +6150,7 @@ enum {
>  	ALC298_FIXUP_SAMSUNG_HEADPHONE_VERY_QUIET,
>  	ALC295_FIXUP_ASUS_MIC_NO_PRESENCE,
>  	ALC269VC_FIXUP_ACER_VCOPPERBOX_PINS,
> +	ALC269VC_FIXUP_ACER_HEADSET_MIC,
>  };
>=20
>  static const struct hda_fixup alc269_fixups[] =3D { @@ -7339,6 +7340,15 =
@@
> static const struct hda_fixup alc269_fixups[] =3D {
>  		.chained =3D true,
>  		.chain_id =3D ALC269_FIXUP_HEADSET_MODE
>  	},
> +	[ALC269VC_FIXUP_ACER_HEADSET_MIC] =3D {
> +		.type =3D HDA_FIXUP_PINS,
> +		.v.pins =3D (const struct hda_pintbl[]) {
> +			{ 0x18, 0x02a11030 }, /* use as headset mic */
> +			{ }
> +		},
> +		.chained =3D true,
> +		.chain_id =3D ALC269_FIXUP_HEADSET_MODE_NO_HP_MIC
> +	},
>  };
>=20
>  static const struct snd_pci_quirk alc269_fixup_tbl[] =3D { @@ -7354,6 +7=
364,7
> @@ static const struct snd_pci_quirk alc269_fixup_tbl[] =3D {
>  	SND_PCI_QUIRK(0x1025, 0x0775, "Acer Aspire E1-572",
> ALC271_FIXUP_HP_GATE_MIC_JACK_E1_572),
>  	SND_PCI_QUIRK(0x1025, 0x079b, "Acer Aspire V5-573G",
> ALC282_FIXUP_ASPIRE_V5_PINS),
>  	SND_PCI_QUIRK(0x1025, 0x102b, "Acer Aspire C24-860",
> ALC286_FIXUP_ACER_AIO_MIC_NO_PRESENCE),
> +	SND_PCI_QUIRK(0x1025, 0x1065, "Acer Aspire C20-820",
> +ALC269VC_FIXUP_ACER_HEADSET_MIC),
>  	SND_PCI_QUIRK(0x1025, 0x106d, "Acer Cloudbook 14",
> ALC283_FIXUP_CHROME_BOOK),
>  	SND_PCI_QUIRK(0x1025, 0x1099, "Acer Aspire E5-523G",
> ALC255_FIXUP_ACER_MIC_NO_PRESENCE),
>  	SND_PCI_QUIRK(0x1025, 0x110e, "Acer Aspire ES1-432",
> ALC255_FIXUP_ACER_MIC_NO_PRESENCE),
> --
> 2.27.0

