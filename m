Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D27521358C
	for <lists+alsa-devel@lfdr.de>; Fri,  3 Jul 2020 09:53:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9F09516AB;
	Fri,  3 Jul 2020 09:52:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9F09516AB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1593762814;
	bh=aeprMvjAED2+EL3NNrch2JYt4FTQW6pCixysHYOtInA=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hdqVQ8p2DGw333T1o3eAmV1TEmPYMG2CyVa9jjXahIMSzJ+wWFVWBeg6UJaOojd0F
	 PJ0FLPjgabyySHFRBexDn2yZHwSrjB2nOjhN9rXrj34gGnOoCsN3S+kkIzyQU9grXv
	 A1TVVdCk7IvlT1it7+tPG47a2znJB02euLawnkNs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BBA37F800ED;
	Fri,  3 Jul 2020 09:51:53 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F0766F80217; Fri,  3 Jul 2020 09:51:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 SUBJ_BRKN_WORDNUMS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 48554F800E2
 for <alsa-devel@alsa-project.org>; Fri,  3 Jul 2020 09:51:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 48554F800E2
Authenticated-By: 
X-SpamFilter-By: ArmorX SpamTrap 5.69 with qID 0637pe993017804,
 This message is accepted by code: ctloc85258
Received: from mail.realtek.com (rtexmb06.realtek.com.tw[172.21.6.99])
 by rtits2.realtek.com.tw (8.15.2/2.66/5.86) with ESMTPS id 0637pe993017804
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Fri, 3 Jul 2020 15:51:40 +0800
Received: from RTEXMB02.realtek.com.tw (172.21.6.95) by
 RTEXMB06.realtek.com.tw (172.21.6.99) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1779.2; Fri, 3 Jul 2020 15:51:39 +0800
Received: from RTEXMB01.realtek.com.tw (172.21.6.94) by
 RTEXMB02.realtek.com.tw (172.21.6.95) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1779.2; Fri, 3 Jul 2020 15:51:39 +0800
Received: from RTEXMB01.realtek.com.tw ([fe80::d53a:d9a5:318:7cd8]) by
 RTEXMB01.realtek.com.tw ([fe80::d53a:d9a5:318:7cd8%5]) with mapi id
 15.01.1779.005; Fri, 3 Jul 2020 15:51:39 +0800
From: Kailang <kailang@realtek.com>
To: Jian-Hong Pan <jian-hong@endlessm.com>, Takashi Iwai <tiwai@suse.com>
Subject: RE: [PATCH v2 1/3] ALSA: hda/realtek - Enable audio jacks of Acer
 vCopperbox with ALC269VC
Thread-Topic: [PATCH v2 1/3] ALSA: hda/realtek - Enable audio jacks of Acer
 vCopperbox with ALC269VC
Thread-Index: AQHWUQ050FyI+tJN2U+7kMSQrGQS26j1elRg
Date: Fri, 3 Jul 2020 07:51:39 +0000
Message-ID: <aa62a43d4f1f458fb11794c26d373528@realtek.com>
References: <20200703073753.185147-1-jian-hong@endlessm.com>
In-Reply-To: <20200703073753.185147-1-jian-hong@endlessm.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.22.102.211]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: Chris Chiu <chiu@endlessm.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "linux@endlessm.com" <linux@endlessm.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
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

Hi,

Please modify ALC269_FIXUP_HEADSET_MODE to ALC269_FIXUP_HEADSET_MIC for 3 p=
atches.
ALC269_FIXUP_HEADSET_MODE was used for Jack detect codec.

Kailang.

> -----Original Message-----
> From: Jian-Hong Pan <jian-hong@endlessm.com>
> Sent: Friday, July 3, 2020 3:38 PM
> To: Takashi Iwai <tiwai@suse.com>
> Cc: Kailang <kailang@realtek.com>; alsa-devel@alsa-project.org;
> linux-kernel@vger.kernel.org; linux@endlessm.com; Jian-Hong Pan
> <jian-hong@endlessm.com>; Chris Chiu <chiu@endlessm.com>
> Subject: [PATCH v2 1/3] ALSA: hda/realtek - Enable audio jacks of Acer
> vCopperbox with ALC269VC
>=20
> The Acer desktop vCopperbox with ALC269VC cannot detect the MIC of
> headset, the line out and internal speaker until
> ALC269VC_FIXUP_ACER_VCOPPERBOX_PINS quirk applied.
>=20
> Signed-off-by: Jian-Hong Pan <jian-hong@endlessm.com>
> Signed-off-by: Chris Chiu <chiu@endlessm.com>
> ---
>  sound/pci/hda/patch_realtek.c | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
>=20
> diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.=
c
> index 737ef82a75fd..dfb4bca07d3f 100644
> --- a/sound/pci/hda/patch_realtek.c
> +++ b/sound/pci/hda/patch_realtek.c
> @@ -6149,6 +6149,7 @@ enum {
>  	ALC236_FIXUP_HP_MUTE_LED,
>  	ALC298_FIXUP_SAMSUNG_HEADPHONE_VERY_QUIET,
>  	ALC295_FIXUP_ASUS_MIC_NO_PRESENCE,
> +	ALC269VC_FIXUP_ACER_VCOPPERBOX_PINS,
>  };
>=20
>  static const struct hda_fixup alc269_fixups[] =3D { @@ -7327,6 +7328,17 =
@@
> static const struct hda_fixup alc269_fixups[] =3D {
>  		.chained =3D true,
>  		.chain_id =3D ALC269_FIXUP_HEADSET_MODE
>  	},
> +	[ALC269VC_FIXUP_ACER_VCOPPERBOX_PINS] =3D {
> +		.type =3D HDA_FIXUP_PINS,
> +		.v.pins =3D (const struct hda_pintbl[]) {
> +			{ 0x14, 0x90100120 }, /* use as internal speaker */
> +			{ 0x18, 0x02a111f0 }, /* use as headset mic, without its own
> jack detect */
> +			{ 0x1a, 0x01011020 }, /* use as line out */
> +			{ },
> +		},
> +		.chained =3D true,
> +		.chain_id =3D ALC269_FIXUP_HEADSET_MODE
> +	},
>  };
>=20
>  static const struct snd_pci_quirk alc269_fixup_tbl[] =3D { @@ -7346,6 +7=
358,7
> @@ static const struct snd_pci_quirk alc269_fixup_tbl[] =3D {
>  	SND_PCI_QUIRK(0x1025, 0x1099, "Acer Aspire E5-523G",
> ALC255_FIXUP_ACER_MIC_NO_PRESENCE),
>  	SND_PCI_QUIRK(0x1025, 0x110e, "Acer Aspire ES1-432",
> ALC255_FIXUP_ACER_MIC_NO_PRESENCE),
>  	SND_PCI_QUIRK(0x1025, 0x1246, "Acer Predator Helios 500",
> ALC299_FIXUP_PREDATOR_SPK),
> +	SND_PCI_QUIRK(0x1025, 0x1247, "Acer vCopperbox",
> +ALC269VC_FIXUP_ACER_VCOPPERBOX_PINS),
>  	SND_PCI_QUIRK(0x1025, 0x128f, "Acer Veriton Z6860G",
> ALC286_FIXUP_ACER_AIO_HEADSET_MIC),
>  	SND_PCI_QUIRK(0x1025, 0x1290, "Acer Veriton Z4860G",
> ALC286_FIXUP_ACER_AIO_HEADSET_MIC),
>  	SND_PCI_QUIRK(0x1025, 0x1291, "Acer Veriton Z4660G",
> ALC286_FIXUP_ACER_AIO_HEADSET_MIC),
> --
> 2.27.0

