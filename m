Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D5341FAE7F
	for <lists+alsa-devel@lfdr.de>; Tue, 16 Jun 2020 12:49:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E2241167C;
	Tue, 16 Jun 2020 12:48:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E2241167C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1592304552;
	bh=GJrdCTMxuxqs338LwVoH2e3w4aE7sj+kbFT8XDuUcIY=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Jgv6rcw9uXEarvKwESsgcubhf3VcK4uTH/A5JzsxL7d/P9XUQcghmTwtD5qX03yeh
	 M9e3dwqhE0AD8KWYa3AWbo+5vjnlSzks1YLIbxQzzuH+i0wp8R1oF9VcSdpLc2Ax8U
	 Re8/H8t0OQemd2ZR+ZPATSyYkn0/64BF5vxXXe5Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 01E7BF800EF;
	Tue, 16 Jun 2020 12:47:31 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 28E88F8022B; Tue, 16 Jun 2020 12:47:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 (mail-eopbgr30049.outbound.protection.outlook.com [40.107.3.49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8D9E5F800EF
 for <alsa-devel@alsa-project.org>; Tue, 16 Jun 2020 12:47:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8D9E5F800EF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=dialogsemiconductor.onmicrosoft.com
 header.i=@dialogsemiconductor.onmicrosoft.com header.b="Av0EWfK4"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TjPlOGNqk0xSmHFg1GrP/9OrTAbpfnojw0PKAtTHd78mvuLzQ5gCcbE63RaOyBKxbCqtF1GDIYROlEMZxnETxFOdyzgGbngo2mDYagzzqQgk53vEY8Qu+tabhYVhBdfE221mS1j6NOxzJU9tTIKwt2nRuZbHyZfLOSvZP0lwHTKb9qbzqwmylR/KYpwQltkWS6xP6XgXcm9ZNmGo+f3yI2fJWJeZLuXfudgUYqKmQ0kjyxDjlMpzLP3mJuxQemULmgUi/pyyoyl0zFydbLc7nrRB9fqtFHu5mfrrBM5TdWioQD5xXqQM1QDX0lU1iRoQWx/PkZoajdVrceGj299YFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I4m8+KZthGSajCV7QfDEhiotSlfgdlniD2tGm/yfMhs=;
 b=mLgcJhw7jtBa5tGC6pLWkC/NpeWVueSXw1v22JZVtH7wix02A+9JrgTEq2qHWfwENctHTmUFN2ucBB1FP1f1uiczOaoPkWOYTsZtbMslDXkjd2ANNKYbKoQsWJcdCviTx7RpIJm6Jm0+mvyZqeGOIXxsDcmFW6bYr8NgK0ukzC42vAsx8r095azl9RqWJmSMv9HgBYmG41BQwdToFEigIjxIn2Dgmt7W3v2k+CL5flPiVOIWHYcmq2DRtI4tZ5fSDWiZKWYjhBrh5QBtj2SLocjRvJ7hBRb+gQuwHhufOwELiIqfw9HOgUdOugbgIXmcBIzmqnO+l9JwQcCDMpG9hw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=diasemi.com; dmarc=pass action=none header.from=diasemi.com;
 dkim=pass header.d=diasemi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dialogsemiconductor.onmicrosoft.com;
 s=selector1-dialogsemiconductor-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I4m8+KZthGSajCV7QfDEhiotSlfgdlniD2tGm/yfMhs=;
 b=Av0EWfK4sLZQ8SCi25QH1HJ0PFfiJ69Ouy+KhG4H1Lda47aQhFUragDu33OslU/MtnmsYaSFLjj6cZ8vBdKo5oM6igmxq0VuxHKqoYEBCxpqgrx1tb+kqmm27Laq5GetHiqkGP0+C0LtlptaokKVkPQkyBBKVTobUUVrNxPL5Gs=
Received: from AM6PR10MB2263.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:52::13)
 by AM6PR10MB2693.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:a8::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.21; Tue, 16 Jun
 2020 10:47:18 +0000
Received: from AM6PR10MB2263.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6d54:9ddd:f235:d379]) by AM6PR10MB2263.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6d54:9ddd:f235:d379%5]) with mapi id 15.20.3088.029; Tue, 16 Jun 2020
 10:47:17 +0000
From: Adam Thomson <Adam.Thomson.Opensource@diasemi.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Mark Brown
 <broonie@kernel.org>
Subject: RE: [PATCH 13/16] ASoC: codecs: da*: rename to
 snd_soc_component_read()
Thread-Topic: [PATCH 13/16] ASoC: codecs: da*: rename to
 snd_soc_component_read()
Thread-Index: AQHWQ574xFC3dr7xF0WfXSe841qsD6jbDzzQ
Date: Tue, 16 Jun 2020 10:47:17 +0000
Message-ID: <AM6PR10MB2263EFA9898C6120E8CE5EB0809D0@AM6PR10MB2263.EURPRD10.PROD.OUTLOOK.COM>
References: <87tuzb4mjg.wl-kuninori.morimoto.gx@renesas.com>
 <87bllj4mc8.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87bllj4mc8.wl-kuninori.morimoto.gx@renesas.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: renesas.com; dkim=none (message not signed)
 header.d=none;renesas.com; dmarc=none action=none header.from=diasemi.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [146.199.34.209]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3e810f75-ca00-47a0-1f2e-08d811e2a3b8
x-ms-traffictypediagnostic: AM6PR10MB2693:
x-ms-exchange-sharedmailbox-routingagent-processed: True
x-microsoft-antispam-prvs: <AM6PR10MB2693E1F00612DC5D8400CF50A79D0@AM6PR10MB2693.EURPRD10.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:72;
x-forefront-prvs: 04362AC73B
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: f7R9rmJhOjkUMWKJJlWjPZl+mB+Ecz0McdfY7dd6WXxqxTLFN3HWpx/Guyzm2MyGoKZVP2wqBMeNrmKIyNLPDibo0Wmp4jAAtlFaK/FYNcuhgqarHiK6KdDV821AGO2Cn0YEkmIhoE0zTyj5DPvQq1bpnihKe6LF0brElJNTNUvt1BjoZfBijmGzQJXJrpkVOH4myCf2//0v0PD5piLB3eo4Cu0ZRsYY2EUyx6Pcg1qqGkio7kgn+3UmAMTYcH4gn/3xa+NG2QmZgT7l+6tKo3ufhQCML1rFTJUoipHoYA9D4nLZWQwK4TQVk0skbo9hmQ2PKOs/yUlbFOHPWeeeng==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM6PR10MB2263.EURPRD10.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(136003)(39860400002)(396003)(366004)(376002)(346002)(8676002)(33656002)(8936002)(2906002)(5660300002)(478600001)(4326008)(52536014)(9686003)(55016002)(71200400001)(66946007)(64756008)(66446008)(66556008)(26005)(186003)(83380400001)(30864003)(66476007)(7696005)(6506007)(86362001)(316002)(53546011)(76116006)(110136005)(559001)(579004);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: /mZIC/cf53fIlL1RNGDL2bw0UB/NIf6fdVKqr1rlsLRs7QwII9rw3gYqP2yXKz1153dBUJagZ4uF27zrbm5f27RSn5DQ8qZvuIWXy5ZcVn4v7enJDyk1sJtw2kXo0MVF80uTojBBDWqdzQUr2K+dTMvnRR5gJ/VoKpD8/bpVIAk25NeyAv8IDTX5qt2wD3zDGDT5/o4QckJUugiZHz2X+i390vJAjhUQg2N7Zj4Je7AuqpZB2uDFXtOU92WVrhbCtqjVC6yJzWsFhB+jZH67ff04F5bAV15hls9x4xRPzg2G1gqwt2qCGfJKp+fJsEji/KJJcUy7C+z5Ggq7d+v4HV/gR7aM79ueurvVSd9jp08xlZuBy3+YkxE82bxaYWSXq/X9IoLsWdbJKzuW6dX/Bb6sHds6fdO5JwOhvhikcJoUjVv0eSJe69L0BL1UfbDQO+ghbt0zkCE3O00Zr7QrbPFAqA04cRrOZFlXYAB0AwLYTi6GnhRJs7ZdY+eoAb/E
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: diasemi.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e810f75-ca00-47a0-1f2e-08d811e2a3b8
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jun 2020 10:47:17.9279 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 511e3c0e-ee96-486e-a2ec-e272ffa37b7c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: F6RCG5BnT2PIXUc3JjvrNH+9TEwLIYv2Dfui+37EybiTk2JfQfn18eO3bfL67kcdvSAlFonejQQ9JAFOJ1SVdVTByD9QeD1/nLcDu0xuCrQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR10MB2693
Cc: Linux-ALSA <alsa-devel@alsa-project.org>
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

On 16 June 2020 06:22, Kuninori Morimoto wrote:

> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
>=20
> We need to use snd_soc_component_read()
> instead of     snd_soc_component_read32()
>=20
> This patch renames _read32() to _read()
>=20
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Acked-by: Adam Thomson <Adam.Thomson.Opensource@diasemi.com>

> ---
>  sound/soc/codecs/da7210.c     | 24 ++++++++++++------------
>  sound/soc/codecs/da7213.c     | 24 ++++++++++++------------
>  sound/soc/codecs/da7218.c     | 34 +++++++++++++++++-----------------
>  sound/soc/codecs/da7219-aad.c | 16 ++++++++--------
>  sound/soc/codecs/da7219.c     | 20 ++++++++++----------
>  sound/soc/codecs/da732x.c     | 18 +++++++++---------
>  sound/soc/codecs/da9055.c     | 14 +++++++-------
>  7 files changed, 75 insertions(+), 75 deletions(-)
>=20
> diff --git a/sound/soc/codecs/da7210.c b/sound/soc/codecs/da7210.c
> index e172913d04a4..0c99dcf242e4 100644
> --- a/sound/soc/codecs/da7210.c
> +++ b/sound/soc/codecs/da7210.c
> @@ -330,7 +330,7 @@ static int da7210_put_alc_sw(struct snd_kcontrol
> *kcontrol,
>=20
>  	if (ucontrol->value.integer.value[0]) {
>  		/* Check if noise suppression is enabled */
> -		if (snd_soc_component_read32(component, DA7210_CONTROL)
> & DA7210_NOISE_SUP_EN) {
> +		if (snd_soc_component_read(component, DA7210_CONTROL) &
> DA7210_NOISE_SUP_EN) {
>  			dev_dbg(component->dev,
>  				"Disable noise suppression to enable ALC\n");
>  			return -EINVAL;
> @@ -354,27 +354,27 @@ static int da7210_put_noise_sup_sw(struct
> snd_kcontrol *kcontrol,
>=20
>  	if (ucontrol->value.integer.value[0]) {
>  		/* Check if ALC is enabled */
> -		if (snd_soc_component_read32(component, DA7210_ADC) &
> DA7210_ADC_ALC_EN)
> +		if (snd_soc_component_read(component, DA7210_ADC) &
> DA7210_ADC_ALC_EN)
>  			goto err;
>=20
>  		/* Check ZC for HP and AUX1 PGA */
> -		if ((snd_soc_component_read32(component,
> DA7210_ZERO_CROSS) &
> +		if ((snd_soc_component_read(component,
> DA7210_ZERO_CROSS) &
>  			(DA7210_AUX1_L_ZC | DA7210_AUX1_R_ZC |
> DA7210_HP_L_ZC |
>  			DA7210_HP_R_ZC)) !=3D (DA7210_AUX1_L_ZC |
>  			DA7210_AUX1_R_ZC | DA7210_HP_L_ZC |
> DA7210_HP_R_ZC))
>  			goto err;
>=20
>  		/* Check INPGA_L_VOL and INPGA_R_VOL */
> -		val =3D snd_soc_component_read32(component,
> DA7210_IN_GAIN);
> +		val =3D snd_soc_component_read(component, DA7210_IN_GAIN);
>  		if (((val & DA7210_INPGA_L_VOL) <
> DA7210_INPGA_MIN_VOL_NS) ||
>  			(((val & DA7210_INPGA_R_VOL) >> 4) <
>  			DA7210_INPGA_MIN_VOL_NS))
>  			goto err;
>=20
>  		/* Check AUX1_L_VOL and AUX1_R_VOL */
> -		if (((snd_soc_component_read32(component, DA7210_AUX1_L)
> & DA7210_AUX1_L_VOL) <
> +		if (((snd_soc_component_read(component, DA7210_AUX1_L) &
> DA7210_AUX1_L_VOL) <
>  		    DA7210_AUX1_MIN_VOL_NS) ||
> -		    ((snd_soc_component_read32(component, DA7210_AUX1_R)
> & DA7210_AUX1_R_VOL) <
> +		    ((snd_soc_component_read(component, DA7210_AUX1_R) &
> DA7210_AUX1_R_VOL) <
>  		    DA7210_AUX1_MIN_VOL_NS))
>  			goto err;
>  	}
> @@ -767,7 +767,7 @@ static int da7210_hw_params(struct snd_pcm_substream
> *substream,
>  	/* Enable DAI */
>  	snd_soc_component_write(component, DA7210_DAI_CFG3,
> DA7210_DAI_OE | DA7210_DAI_EN);
>=20
> -	dai_cfg1 =3D 0xFC & snd_soc_component_read32(component,
> DA7210_DAI_CFG1);
> +	dai_cfg1 =3D 0xFC & snd_soc_component_read(component,
> DA7210_DAI_CFG1);
>=20
>  	switch (params_width(params)) {
>  	case 16:
> @@ -874,11 +874,11 @@ static int da7210_set_dai_fmt(struct snd_soc_dai
> *codec_dai, u32 fmt)
>  	u32 dai_cfg1;
>  	u32 dai_cfg3;
>=20
> -	dai_cfg1 =3D 0x7f & snd_soc_component_read32(component,
> DA7210_DAI_CFG1);
> -	dai_cfg3 =3D 0xfc & snd_soc_component_read32(component,
> DA7210_DAI_CFG3);
> +	dai_cfg1 =3D 0x7f & snd_soc_component_read(component,
> DA7210_DAI_CFG1);
> +	dai_cfg3 =3D 0xfc & snd_soc_component_read(component,
> DA7210_DAI_CFG3);
>=20
> -	if ((snd_soc_component_read32(component, DA7210_PLL) &
> DA7210_PLL_EN) &&
> -		(!(snd_soc_component_read32(component, DA7210_PLL_DIV3)
> & DA7210_PLL_BYP)))
> +	if ((snd_soc_component_read(component, DA7210_PLL) &
> DA7210_PLL_EN) &&
> +		(!(snd_soc_component_read(component, DA7210_PLL_DIV3) &
> DA7210_PLL_BYP)))
>  		return -EINVAL;
>=20
>  	switch (fmt & SND_SOC_DAIFMT_MASTER_MASK) {
> @@ -927,7 +927,7 @@ static int da7210_set_dai_fmt(struct snd_soc_dai
> *codec_dai, u32 fmt)
>  static int da7210_mute(struct snd_soc_dai *dai, int mute)
>  {
>  	struct snd_soc_component *component =3D dai->component;
> -	u8 mute_reg =3D snd_soc_component_read32(component,
> DA7210_DAC_HPF) & 0xFB;
> +	u8 mute_reg =3D snd_soc_component_read(component,
> DA7210_DAC_HPF) & 0xFB;
>=20
>  	if (mute)
>  		snd_soc_component_write(component, DA7210_DAC_HPF,
> mute_reg | 0x4);
> diff --git a/sound/soc/codecs/da7213.c b/sound/soc/codecs/da7213.c
> index 3e6ad996741b..cc4ae7b311b4 100644
> --- a/sound/soc/codecs/da7213.c
> +++ b/sound/soc/codecs/da7213.c
> @@ -205,12 +205,12 @@ static int da7213_get_alc_data(struct
> snd_soc_component *component, u8 reg_val)
>  		/* Select middle 8 bits for read back from data register */
>  		snd_soc_component_write(component,
> DA7213_ALC_CIC_OP_LVL_CTRL,
>  			      reg_val | DA7213_ALC_DATA_MIDDLE);
> -		mid_data =3D snd_soc_component_read32(component,
> DA7213_ALC_CIC_OP_LVL_DATA);
> +		mid_data =3D snd_soc_component_read(component,
> DA7213_ALC_CIC_OP_LVL_DATA);
>=20
>  		/* Select top 8 bits for read back from data register */
>  		snd_soc_component_write(component,
> DA7213_ALC_CIC_OP_LVL_CTRL,
>  			      reg_val | DA7213_ALC_DATA_TOP);
> -		top_data =3D snd_soc_component_read32(component,
> DA7213_ALC_CIC_OP_LVL_DATA);
> +		top_data =3D snd_soc_component_read(component,
> DA7213_ALC_CIC_OP_LVL_DATA);
>=20
>  		sum +=3D ((mid_data << 8) | (top_data << 16));
>  	}
> @@ -259,7 +259,7 @@ static void da7213_alc_calib_auto(struct
> snd_soc_component *component)
>  	snd_soc_component_update_bits(component, DA7213_ALC_CTRL1,
> DA7213_ALC_AUTO_CALIB_EN,
>  			    DA7213_ALC_AUTO_CALIB_EN);
>  	do {
> -		alc_ctrl1 =3D snd_soc_component_read32(component,
> DA7213_ALC_CTRL1);
> +		alc_ctrl1 =3D snd_soc_component_read(component,
> DA7213_ALC_CTRL1);
>  	} while (alc_ctrl1 & DA7213_ALC_AUTO_CALIB_EN);
>=20
>  	/* If auto calibration fails, fall back to digital gain only mode */
> @@ -286,16 +286,16 @@ static void da7213_alc_calib(struct snd_soc_compone=
nt
> *component)
>  	u8 mic_1_ctrl, mic_2_ctrl;
>=20
>  	/* Save current values from ADC control registers */
> -	adc_l_ctrl =3D snd_soc_component_read32(component,
> DA7213_ADC_L_CTRL);
> -	adc_r_ctrl =3D snd_soc_component_read32(component,
> DA7213_ADC_R_CTRL);
> +	adc_l_ctrl =3D snd_soc_component_read(component,
> DA7213_ADC_L_CTRL);
> +	adc_r_ctrl =3D snd_soc_component_read(component,
> DA7213_ADC_R_CTRL);
>=20
>  	/* Save current values from MIXIN_L/R_SELECT registers */
> -	mixin_l_sel =3D snd_soc_component_read32(component,
> DA7213_MIXIN_L_SELECT);
> -	mixin_r_sel =3D snd_soc_component_read32(component,
> DA7213_MIXIN_R_SELECT);
> +	mixin_l_sel =3D snd_soc_component_read(component,
> DA7213_MIXIN_L_SELECT);
> +	mixin_r_sel =3D snd_soc_component_read(component,
> DA7213_MIXIN_R_SELECT);
>=20
>  	/* Save current values from MIC control registers */
> -	mic_1_ctrl =3D snd_soc_component_read32(component,
> DA7213_MIC_1_CTRL);
> -	mic_2_ctrl =3D snd_soc_component_read32(component,
> DA7213_MIC_2_CTRL);
> +	mic_1_ctrl =3D snd_soc_component_read(component,
> DA7213_MIC_1_CTRL);
> +	mic_2_ctrl =3D snd_soc_component_read(component,
> DA7213_MIC_2_CTRL);
>=20
>  	/* Enable ADC Left and Right */
>  	snd_soc_component_update_bits(component, DA7213_ADC_L_CTRL,
> DA7213_ADC_EN,
> @@ -751,7 +751,7 @@ static int da7213_dai_event(struct snd_soc_dapm_widge=
t
> *w,
>  				    DA7213_PC_FREERUN_MASK, 0);
>=20
>  		/* If SRM not enabled then nothing more to do */
> -		pll_ctrl =3D snd_soc_component_read32(component,
> DA7213_PLL_CTRL);
> +		pll_ctrl =3D snd_soc_component_read(component,
> DA7213_PLL_CTRL);
>  		if (!(pll_ctrl & DA7213_PLL_SRM_EN))
>  			return 0;
>=20
> @@ -764,7 +764,7 @@ static int da7213_dai_event(struct snd_soc_dapm_widge=
t
> *w,
>=20
>  		/* Check SRM has locked */
>  		do {
> -			pll_status =3D snd_soc_component_read32(component,
> DA7213_PLL_STATUS);
> +			pll_status =3D snd_soc_component_read(component,
> DA7213_PLL_STATUS);
>  			if (pll_status & DA7219_PLL_SRM_LOCK) {
>  				srm_lock =3D true;
>  			} else {
> @@ -779,7 +779,7 @@ static int da7213_dai_event(struct snd_soc_dapm_widge=
t
> *w,
>  		return 0;
>  	case SND_SOC_DAPM_POST_PMD:
>  		/* Revert 32KHz PLL lock udpates if applied previously */
> -		pll_ctrl =3D snd_soc_component_read32(component,
> DA7213_PLL_CTRL);
> +		pll_ctrl =3D snd_soc_component_read(component,
> DA7213_PLL_CTRL);
>  		if (pll_ctrl & DA7213_PLL_32K_MODE) {
>  			snd_soc_component_write(component, 0xF0, 0x8B);
>  			snd_soc_component_write(component, 0xF2, 0x01);
> diff --git a/sound/soc/codecs/da7218.c b/sound/soc/codecs/da7218.c
> index a3003f299868..6d78bccb55c3 100644
> --- a/sound/soc/codecs/da7218.c
> +++ b/sound/soc/codecs/da7218.c
> @@ -298,22 +298,22 @@ static void da7218_alc_calib(struct snd_soc_compone=
nt
> *component)
>  	bool calibrated =3D false;
>=20
>  	/* Save current state of MIC control registers */
> -	mic_1_ctrl =3D snd_soc_component_read32(component,
> DA7218_MIC_1_CTRL);
> -	mic_2_ctrl =3D snd_soc_component_read32(component,
> DA7218_MIC_2_CTRL);
> +	mic_1_ctrl =3D snd_soc_component_read(component,
> DA7218_MIC_1_CTRL);
> +	mic_2_ctrl =3D snd_soc_component_read(component,
> DA7218_MIC_2_CTRL);
>=20
>  	/* Save current state of input mixer control registers */
> -	mixin_1_ctrl =3D snd_soc_component_read32(component,
> DA7218_MIXIN_1_CTRL);
> -	mixin_2_ctrl =3D snd_soc_component_read32(component,
> DA7218_MIXIN_2_CTRL);
> +	mixin_1_ctrl =3D snd_soc_component_read(component,
> DA7218_MIXIN_1_CTRL);
> +	mixin_2_ctrl =3D snd_soc_component_read(component,
> DA7218_MIXIN_2_CTRL);
>=20
>  	/* Save current state of input filter control registers */
> -	in_1l_filt_ctrl =3D snd_soc_component_read32(component,
> DA7218_IN_1L_FILTER_CTRL);
> -	in_1r_filt_ctrl =3D snd_soc_component_read32(component,
> DA7218_IN_1R_FILTER_CTRL);
> -	in_2l_filt_ctrl =3D snd_soc_component_read32(component,
> DA7218_IN_2L_FILTER_CTRL);
> -	in_2r_filt_ctrl =3D snd_soc_component_read32(component,
> DA7218_IN_2R_FILTER_CTRL);
> +	in_1l_filt_ctrl =3D snd_soc_component_read(component,
> DA7218_IN_1L_FILTER_CTRL);
> +	in_1r_filt_ctrl =3D snd_soc_component_read(component,
> DA7218_IN_1R_FILTER_CTRL);
> +	in_2l_filt_ctrl =3D snd_soc_component_read(component,
> DA7218_IN_2L_FILTER_CTRL);
> +	in_2r_filt_ctrl =3D snd_soc_component_read(component,
> DA7218_IN_2R_FILTER_CTRL);
>=20
>  	/* Save current state of input HPF control registers */
> -	in_1_hpf_ctrl =3D snd_soc_component_read32(component,
> DA7218_IN_1_HPF_FILTER_CTRL);
> -	in_2_hpf_ctrl =3D snd_soc_component_read32(component,
> DA7218_IN_2_HPF_FILTER_CTRL);
> +	in_1_hpf_ctrl =3D snd_soc_component_read(component,
> DA7218_IN_1_HPF_FILTER_CTRL);
> +	in_2_hpf_ctrl =3D snd_soc_component_read(component,
> DA7218_IN_2_HPF_FILTER_CTRL);
>=20
>  	/* Enable then Mute MIC PGAs */
>  	snd_soc_component_update_bits(component, DA7218_MIC_1_CTRL,
> DA7218_MIC_1_AMP_EN_MASK,
> @@ -369,7 +369,7 @@ static void da7218_alc_calib(struct snd_soc_component
> *component)
>  	snd_soc_component_update_bits(component, DA7218_CALIB_CTRL,
> DA7218_CALIB_AUTO_EN_MASK,
>  			    DA7218_CALIB_AUTO_EN_MASK);
>  	do {
> -		calib_ctrl =3D snd_soc_component_read32(component,
> DA7218_CALIB_CTRL);
> +		calib_ctrl =3D snd_soc_component_read(component,
> DA7218_CALIB_CTRL);
>  		if (calib_ctrl & DA7218_CALIB_AUTO_EN_MASK) {
>  			++i;
>  			usleep_range(DA7218_ALC_CALIB_DELAY_MIN,
> @@ -613,7 +613,7 @@ static int da7218_biquad_coeff_put(struct snd_kcontro=
l
> *kcontrol,
>  	}
>=20
>  	/* Make sure at least out filter1 enabled to allow programming */
> -	out_filt1l =3D snd_soc_component_read32(component,
> DA7218_OUT_1L_FILTER_CTRL);
> +	out_filt1l =3D snd_soc_component_read(component,
> DA7218_OUT_1L_FILTER_CTRL);
>  	snd_soc_component_write(component, DA7218_OUT_1L_FILTER_CTRL,
>  		      out_filt1l | DA7218_OUT_1L_FILTER_EN_MASK);
>=20
> @@ -1419,7 +1419,7 @@ static int da7218_dai_event(struct
> snd_soc_dapm_widget *w,
>  		i =3D 0;
>  		success =3D false;
>  		do {
> -			refosc_cal =3D snd_soc_component_read32(component,
> DA7218_PLL_REFOSC_CAL);
> +			refosc_cal =3D snd_soc_component_read(component,
> DA7218_PLL_REFOSC_CAL);
>  			if (!(refosc_cal &
> DA7218_PLL_REFOSC_CAL_START_MASK)) {
>  				success =3D true;
>  			} else {
> @@ -1438,7 +1438,7 @@ static int da7218_dai_event(struct
> snd_soc_dapm_widget *w,
>  			      DA7218_PC_RESYNC_AUTO_MASK);
>=20
>  		/* If SRM not enabled, we don't need to check status */
> -		pll_ctrl =3D snd_soc_component_read32(component,
> DA7218_PLL_CTRL);
> +		pll_ctrl =3D snd_soc_component_read(component,
> DA7218_PLL_CTRL);
>  		if ((pll_ctrl & DA7218_PLL_MODE_MASK) !=3D
> DA7218_PLL_MODE_SRM)
>  			return 0;
>=20
> @@ -1446,7 +1446,7 @@ static int da7218_dai_event(struct
> snd_soc_dapm_widget *w,
>  		i =3D 0;
>  		success =3D false;
>  		do {
> -			pll_status =3D snd_soc_component_read32(component,
> DA7218_PLL_STATUS);
> +			pll_status =3D snd_soc_component_read(component,
> DA7218_PLL_STATUS);
>  			if (pll_status & DA7218_PLL_SRM_STATUS_SRM_LOCK) {
>  				success =3D true;
>  			} else {
> @@ -2236,7 +2236,7 @@ static void da7218_hpldet_irq(struct
> snd_soc_component *component)
>  	u8 jack_status;
>  	int report;
>=20
> -	jack_status =3D snd_soc_component_read32(component,
> DA7218_EVENT_STATUS);
> +	jack_status =3D snd_soc_component_read(component,
> DA7218_EVENT_STATUS);
>=20
>  	if (jack_status & DA7218_HPLDET_JACK_STS_MASK)
>  		report =3D SND_JACK_HEADPHONE;
> @@ -2256,7 +2256,7 @@ static irqreturn_t da7218_irq_thread(int irq, void =
*data)
>  	u8 status;
>=20
>  	/* Read IRQ status reg */
> -	status =3D snd_soc_component_read32(component, DA7218_EVENT);
> +	status =3D snd_soc_component_read(component, DA7218_EVENT);
>  	if (!status)
>  		return IRQ_NONE;
>=20
> diff --git a/sound/soc/codecs/da7219-aad.c b/sound/soc/codecs/da7219-aad.=
c
> index 4f2a96e9fd45..b1dfd91609f7 100644
> --- a/sound/soc/codecs/da7219-aad.c
> +++ b/sound/soc/codecs/da7219-aad.c
> @@ -73,7 +73,7 @@ static void da7219_aad_btn_det_work(struct work_struct
> *work)
>  	snd_soc_dapm_sync(dapm);
>=20
>  	do {
> -		statusa =3D snd_soc_component_read32(component,
> DA7219_ACCDET_STATUS_A);
> +		statusa =3D snd_soc_component_read(component,
> DA7219_ACCDET_STATUS_A);
>  		if (statusa & DA7219_MICBIAS_UP_STS_MASK)
>  			micbias_up =3D true;
>  		else if (retries++ < DA7219_AAD_MICBIAS_CHK_RETRIES)
> @@ -91,7 +91,7 @@ static void da7219_aad_btn_det_work(struct work_struct
> *work)
>  	 */
>  	if (da7219_aad->micbias_pulse_lvl && da7219_aad->micbias_pulse_time)
> {
>  		/* Pulse higher level voltage */
> -		micbias_ctrl =3D snd_soc_component_read32(component,
> DA7219_MICBIAS_CTRL);
> +		micbias_ctrl =3D snd_soc_component_read(component,
> DA7219_MICBIAS_CTRL);
>  		snd_soc_component_update_bits(component,
> DA7219_MICBIAS_CTRL,
>  				    DA7219_MICBIAS1_LEVEL_MASK,
>  				    da7219_aad->micbias_pulse_lvl);
> @@ -141,11 +141,11 @@ static void da7219_aad_hptest_work(struct work_stru=
ct
> *work)
>  	 * If MCLK is present, but PLL is not enabled then we enable it here to
>  	 * ensure a consistent detection procedure.
>  	 */
> -	pll_srm_sts =3D snd_soc_component_read32(component,
> DA7219_PLL_SRM_STS);
> +	pll_srm_sts =3D snd_soc_component_read(component,
> DA7219_PLL_SRM_STS);
>  	if (pll_srm_sts & DA7219_PLL_SRM_STS_MCLK) {
>  		tonegen_freq_hptest =3D
> cpu_to_le16(DA7219_AAD_HPTEST_RAMP_FREQ);
>=20
> -		pll_ctrl =3D snd_soc_component_read32(component,
> DA7219_PLL_CTRL);
> +		pll_ctrl =3D snd_soc_component_read(component,
> DA7219_PLL_CTRL);
>  		if ((pll_ctrl & DA7219_PLL_MODE_MASK) =3D=3D
> DA7219_PLL_MODE_BYPASS)
>  			da7219_set_pll(component, DA7219_SYSCLK_PLL,
>  				       DA7219_PLL_FREQ_OUT_98304);
> @@ -154,7 +154,7 @@ static void da7219_aad_hptest_work(struct work_struct
> *work)
>  	}
>=20
>  	/* Ensure gain ramping at fastest rate */
> -	gain_ramp_ctrl =3D snd_soc_component_read32(component,
> DA7219_GAIN_RAMP_CTRL);
> +	gain_ramp_ctrl =3D snd_soc_component_read(component,
> DA7219_GAIN_RAMP_CTRL);
>  	snd_soc_component_write(component, DA7219_GAIN_RAMP_CTRL,
> DA7219_GAIN_RAMP_RATE_X8);
>=20
>  	/* Bypass cache so it saves current settings */
> @@ -248,7 +248,7 @@ static void da7219_aad_hptest_work(struct work_struct
> *work)
>  	msleep(DA7219_AAD_HPTEST_PERIOD);
>=20
>  	/* Grab comparator reading */
> -	accdet_cfg8 =3D snd_soc_component_read32(component,
> DA7219_ACCDET_CONFIG_8);
> +	accdet_cfg8 =3D snd_soc_component_read(component,
> DA7219_ACCDET_CONFIG_8);
>  	if (accdet_cfg8 & DA7219_HPTEST_COMP_MASK)
>  		report |=3D SND_JACK_HEADPHONE;
>  	else
> @@ -357,7 +357,7 @@ static irqreturn_t da7219_aad_irq_thread(int irq, voi=
d
> *data)
>  		return IRQ_NONE;
>=20
>  	/* Read status register for jack insertion & type status */
> -	statusa =3D snd_soc_component_read32(component,
> DA7219_ACCDET_STATUS_A);
> +	statusa =3D snd_soc_component_read(component,
> DA7219_ACCDET_STATUS_A);
>=20
>  	/* Clear events */
>  	regmap_bulk_write(da7219->regmap, DA7219_ACCDET_IRQ_EVENT_A,
> @@ -847,7 +847,7 @@ void da7219_aad_suspend(struct snd_soc_component
> *component)
>  		 * suspend then this will be dealt with through the IRQ handler.
>  		 */
>  		if (da7219_aad->jack_inserted) {
> -			micbias_ctrl =3D snd_soc_component_read32(component,
> DA7219_MICBIAS_CTRL);
> +			micbias_ctrl =3D snd_soc_component_read(component,
> DA7219_MICBIAS_CTRL);
>  			if (micbias_ctrl & DA7219_MICBIAS1_EN_MASK) {
>  				snd_soc_dapm_disable_pin(dapm, "Mic Bias");
>  				snd_soc_dapm_sync(dapm);
> diff --git a/sound/soc/codecs/da7219.c b/sound/soc/codecs/da7219.c
> index f83a6eaba12c..f2520a6c7875 100644
> --- a/sound/soc/codecs/da7219.c
> +++ b/sound/soc/codecs/da7219.c
> @@ -313,13 +313,13 @@ static void da7219_alc_calib(struct snd_soc_compone=
nt
> *component)
>  	u8 mic_ctrl, mixin_ctrl, adc_ctrl, calib_ctrl;
>=20
>  	/* Save current state of mic control register */
> -	mic_ctrl =3D snd_soc_component_read32(component,
> DA7219_MIC_1_CTRL);
> +	mic_ctrl =3D snd_soc_component_read(component,
> DA7219_MIC_1_CTRL);
>=20
>  	/* Save current state of input mixer control register */
> -	mixin_ctrl =3D snd_soc_component_read32(component,
> DA7219_MIXIN_L_CTRL);
> +	mixin_ctrl =3D snd_soc_component_read(component,
> DA7219_MIXIN_L_CTRL);
>=20
>  	/* Save current state of input ADC control register */
> -	adc_ctrl =3D snd_soc_component_read32(component,
> DA7219_ADC_L_CTRL);
> +	adc_ctrl =3D snd_soc_component_read(component,
> DA7219_ADC_L_CTRL);
>=20
>  	/* Enable then Mute MIC PGAs */
>  	snd_soc_component_update_bits(component, DA7219_MIC_1_CTRL,
> DA7219_MIC_1_AMP_EN_MASK,
> @@ -344,7 +344,7 @@ static void da7219_alc_calib(struct snd_soc_component
> *component)
>  			    DA7219_ALC_AUTO_CALIB_EN_MASK,
>  			    DA7219_ALC_AUTO_CALIB_EN_MASK);
>  	do {
> -		calib_ctrl =3D snd_soc_component_read32(component,
> DA7219_ALC_CTRL1);
> +		calib_ctrl =3D snd_soc_component_read(component,
> DA7219_ALC_CTRL1);
>  	} while (calib_ctrl & DA7219_ALC_AUTO_CALIB_EN_MASK);
>=20
>  	/* If auto calibration fails, disable DC offset, hybrid ALC */
> @@ -822,13 +822,13 @@ static int da7219_dai_event(struct
> snd_soc_dapm_widget *w,
>  				    DA7219_PC_FREERUN_MASK, 0);
>=20
>  		/* Slave mode, if SRM not enabled no need for status checks */
> -		pll_ctrl =3D snd_soc_component_read32(component,
> DA7219_PLL_CTRL);
> +		pll_ctrl =3D snd_soc_component_read(component,
> DA7219_PLL_CTRL);
>  		if ((pll_ctrl & DA7219_PLL_MODE_MASK) !=3D
> DA7219_PLL_MODE_SRM)
>  			return 0;
>=20
>  		/* Check SRM has locked */
>  		do {
> -			pll_status =3D snd_soc_component_read32(component,
> DA7219_PLL_SRM_STS);
> +			pll_status =3D snd_soc_component_read(component,
> DA7219_PLL_SRM_STS);
>  			if (pll_status & DA7219_PLL_SRM_STS_SRM_LOCK) {
>  				srm_lock =3D true;
>  			} else {
> @@ -928,7 +928,7 @@ static int da7219_gain_ramp_event(struct
> snd_soc_dapm_widget *w,
>  	case SND_SOC_DAPM_PRE_PMD:
>  		/* Ensure nominal gain ramping for DAPM sequence */
>  		da7219->gain_ramp_ctrl =3D
> -			snd_soc_component_read32(component,
> DA7219_GAIN_RAMP_CTRL);
> +			snd_soc_component_read(component,
> DA7219_GAIN_RAMP_CTRL);
>  		snd_soc_component_write(component,
> DA7219_GAIN_RAMP_CTRL,
>  			      DA7219_GAIN_RAMP_RATE_NOMINAL);
>  		break;
> @@ -1930,7 +1930,7 @@ static int da7219_wclk_is_prepared(struct clk_hw *h=
w)
>  	if (!da7219->master)
>  		return -EINVAL;
>=20
> -	clk_reg =3D snd_soc_component_read32(component,
> DA7219_DAI_CLK_MODE);
> +	clk_reg =3D snd_soc_component_read(component,
> DA7219_DAI_CLK_MODE);
>=20
>  	return !!(clk_reg & DA7219_DAI_CLK_EN_MASK);
>  }
> @@ -1942,7 +1942,7 @@ static unsigned long da7219_wclk_recalc_rate(struct
> clk_hw *hw,
>  		container_of(hw, struct da7219_priv,
>  			     dai_clks_hw[DA7219_DAI_WCLK_IDX]);
>  	struct snd_soc_component *component =3D da7219->component;
> -	u8 fs =3D snd_soc_component_read32(component, DA7219_SR);
> +	u8 fs =3D snd_soc_component_read(component, DA7219_SR);
>=20
>  	switch (fs & DA7219_SR_MASK) {
>  	case DA7219_SR_8000:
> @@ -2027,7 +2027,7 @@ static unsigned long da7219_bclk_recalc_rate(struct
> clk_hw *hw,
>  		container_of(hw, struct da7219_priv,
>  			     dai_clks_hw[DA7219_DAI_BCLK_IDX]);
>  	struct snd_soc_component *component =3D da7219->component;
> -	u8 bclks_per_wclk =3D snd_soc_component_read32(component,
> +	u8 bclks_per_wclk =3D snd_soc_component_read(component,
>  						     DA7219_DAI_CLK_MODE);
>=20
>  	switch (bclks_per_wclk & DA7219_DAI_BCLKS_PER_WCLK_MASK) {
> diff --git a/sound/soc/codecs/da732x.c b/sound/soc/codecs/da732x.c
> index 3f60c45e1e6d..d43ee7159ae0 100644
> --- a/sound/soc/codecs/da732x.c
> +++ b/sound/soc/codecs/da732x.c
> @@ -361,7 +361,7 @@ static int da732x_hpf_get(struct snd_kcontrol *kcontr=
ol,
>  	unsigned int reg =3D enum_ctrl->reg;
>  	int val;
>=20
> -	val =3D snd_soc_component_read32(component, reg) &
> DA732X_HPF_MASK;
> +	val =3D snd_soc_component_read(component, reg) & DA732X_HPF_MASK;
>=20
>  	switch (val) {
>  	case DA732X_HPF_VOICE_EN:
> @@ -1287,9 +1287,9 @@ static void da732x_dac_offset_adjust(struct
> snd_soc_component *component)
>  	msleep(DA732X_WAIT_FOR_STABILIZATION);
>=20
>  	/* Check DAC offset sign */
> -	sign[DA732X_HPL_DAC] =3D (snd_soc_component_read32(component,
> DA732X_REG_HPL_DAC_OFF_CNTL) &
> +	sign[DA732X_HPL_DAC] =3D (snd_soc_component_read(component,
> DA732X_REG_HPL_DAC_OFF_CNTL) &
>  				DA732X_HP_DAC_OFF_CNTL_COMPO);
> -	sign[DA732X_HPR_DAC] =3D (snd_soc_component_read32(component,
> DA732X_REG_HPR_DAC_OFF_CNTL) &
> +	sign[DA732X_HPR_DAC] =3D (snd_soc_component_read(component,
> DA732X_REG_HPR_DAC_OFF_CNTL) &
>  				DA732X_HP_DAC_OFF_CNTL_COMPO);
>=20
>  	/* Binary search DAC offset values (both channels at once) */
> @@ -1306,10 +1306,10 @@ static void da732x_dac_offset_adjust(struct
> snd_soc_component *component)
>=20
>  		msleep(DA732X_WAIT_FOR_STABILIZATION);
>=20
> -		if ((snd_soc_component_read32(component,
> DA732X_REG_HPL_DAC_OFF_CNTL) &
> +		if ((snd_soc_component_read(component,
> DA732X_REG_HPL_DAC_OFF_CNTL) &
>  		     DA732X_HP_DAC_OFF_CNTL_COMPO) ^
> sign[DA732X_HPL_DAC])
>  			offset[DA732X_HPL_DAC] &=3D ~step;
> -		if ((snd_soc_component_read32(component,
> DA732X_REG_HPR_DAC_OFF_CNTL) &
> +		if ((snd_soc_component_read(component,
> DA732X_REG_HPR_DAC_OFF_CNTL) &
>  		     DA732X_HP_DAC_OFF_CNTL_COMPO) ^
> sign[DA732X_HPR_DAC])
>  			offset[DA732X_HPR_DAC] &=3D ~step;
>=20
> @@ -1350,9 +1350,9 @@ static void da732x_output_offset_adjust(struct
> snd_soc_component *component)
>  	msleep(DA732X_WAIT_FOR_STABILIZATION);
>=20
>  	/* Check output offset sign */
> -	sign[DA732X_HPL_AMP] =3D snd_soc_component_read32(component,
> DA732X_REG_HPL) &
> +	sign[DA732X_HPL_AMP] =3D snd_soc_component_read(component,
> DA732X_REG_HPL) &
>  			       DA732X_HP_OUT_COMPO;
> -	sign[DA732X_HPR_AMP] =3D snd_soc_component_read32(component,
> DA732X_REG_HPR) &
> +	sign[DA732X_HPR_AMP] =3D snd_soc_component_read(component,
> DA732X_REG_HPR) &
>  			       DA732X_HP_OUT_COMPO;
>=20
>  	snd_soc_component_write(component, DA732X_REG_HPL,
> DA732X_HP_OUT_COMP |
> @@ -1373,10 +1373,10 @@ static void da732x_output_offset_adjust(struct
> snd_soc_component *component)
>=20
>  		msleep(DA732X_WAIT_FOR_STABILIZATION);
>=20
> -		if ((snd_soc_component_read32(component, DA732X_REG_HPL)
> &
> +		if ((snd_soc_component_read(component, DA732X_REG_HPL) &
>  		     DA732X_HP_OUT_COMPO) ^ sign[DA732X_HPL_AMP])
>  			offset[DA732X_HPL_AMP] &=3D ~step;
> -		if ((snd_soc_component_read32(component,
> DA732X_REG_HPR) &
> +		if ((snd_soc_component_read(component, DA732X_REG_HPR) &
>  		     DA732X_HP_OUT_COMPO) ^ sign[DA732X_HPR_AMP])
>  			offset[DA732X_HPR_AMP] &=3D ~step;
>=20
> diff --git a/sound/soc/codecs/da9055.c b/sound/soc/codecs/da9055.c
> index 94800f522d3e..e93436ccb674 100644
> --- a/sound/soc/codecs/da9055.c
> +++ b/sound/soc/codecs/da9055.c
> @@ -461,12 +461,12 @@ static int da9055_get_alc_data(struct
> snd_soc_component *component, u8 reg_val)
>  		/* Select middle 8 bits for read back from data register */
>  		snd_soc_component_write(component,
> DA9055_ALC_CIC_OP_LVL_CTRL,
>  			      reg_val | DA9055_ALC_DATA_MIDDLE);
> -		mid_data =3D snd_soc_component_read32(component,
> DA9055_ALC_CIC_OP_LVL_DATA);
> +		mid_data =3D snd_soc_component_read(component,
> DA9055_ALC_CIC_OP_LVL_DATA);
>=20
>  		/* Select top 8 bits for read back from data register */
>  		snd_soc_component_write(component,
> DA9055_ALC_CIC_OP_LVL_CTRL,
>  			      reg_val | DA9055_ALC_DATA_TOP);
> -		top_data =3D snd_soc_component_read32(component,
> DA9055_ALC_CIC_OP_LVL_DATA);
> +		top_data =3D snd_soc_component_read(component,
> DA9055_ALC_CIC_OP_LVL_DATA);
>=20
>  		sum +=3D ((mid_data << 8) | (top_data << 16));
>  	}
> @@ -488,8 +488,8 @@ static int da9055_put_alc_sw(struct snd_kcontrol
> *kcontrol,
>  		 */
>=20
>  		/* Save current values from Mic control registers */
> -		mic_left =3D snd_soc_component_read32(component,
> DA9055_MIC_L_CTRL);
> -		mic_right =3D snd_soc_component_read32(component,
> DA9055_MIC_R_CTRL);
> +		mic_left =3D snd_soc_component_read(component,
> DA9055_MIC_L_CTRL);
> +		mic_right =3D snd_soc_component_read(component,
> DA9055_MIC_R_CTRL);
>=20
>  		/* Mute Mic PGA Left and Right */
>  		snd_soc_component_update_bits(component,
> DA9055_MIC_L_CTRL,
> @@ -498,8 +498,8 @@ static int da9055_put_alc_sw(struct snd_kcontrol
> *kcontrol,
>  				    DA9055_MIC_R_MUTE_EN,
> DA9055_MIC_R_MUTE_EN);
>=20
>  		/* Save current values from ADC control registers */
> -		adc_left =3D snd_soc_component_read32(component,
> DA9055_ADC_L_CTRL);
> -		adc_right =3D snd_soc_component_read32(component,
> DA9055_ADC_R_CTRL);
> +		adc_left =3D snd_soc_component_read(component,
> DA9055_ADC_L_CTRL);
> +		adc_right =3D snd_soc_component_read(component,
> DA9055_ADC_R_CTRL);
>=20
>  		/* Enable ADC Left and Right */
>  		snd_soc_component_update_bits(component,
> DA9055_ADC_L_CTRL,
> @@ -1176,7 +1176,7 @@ static int da9055_set_dai_fmt(struct snd_soc_dai
> *codec_dai, unsigned int fmt)
>  	}
>=20
>  	/* Don't allow change of mode if PLL is enabled */
> -	if ((snd_soc_component_read32(component, DA9055_PLL_CTRL) &
> DA9055_PLL_EN) &&
> +	if ((snd_soc_component_read(component, DA9055_PLL_CTRL) &
> DA9055_PLL_EN) &&
>  	    (da9055->master !=3D mode))
>  		return -EINVAL;
>=20
> --
> 2.25.1

