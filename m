Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 69A49332871
	for <lists+alsa-devel@lfdr.de>; Tue,  9 Mar 2021 15:22:49 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 06D9E182B;
	Tue,  9 Mar 2021 15:21:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 06D9E182B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1615299769;
	bh=KP9vZ7oz3KtgCIvlKBgkPgHeCnOyvjFnVyVPU2Fha6k=;
	h=From:To:References:In-Reply-To:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=odwKExGvzc6vb9a8zp32B8wqo6N1hjqiMbFoRKMp4Fc7aaQVzyBTXVFEiTxpmRf6L
	 qx6M+HIk5TVwCI9AIeOP6s5rZtaDkjMEkeWMMje1e+RJcqqEL3mhaB/w0dLQ8C+gwa
	 98+7AuPrI5hGHsDpVT/WJP1Tb1pWLMHl7P7sUbW4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6B71DF80256;
	Tue,  9 Mar 2021 15:21:18 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E1E1BF80227; Tue,  9 Mar 2021 15:21:14 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 PDS_BAD_THREAD_QP_64,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3DBE0F80166
 for <alsa-devel@alsa-project.org>; Tue,  9 Mar 2021 15:21:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3DBE0F80166
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="purC4JXm"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 129EL56Q010888; Tue, 9 Mar 2021 08:21:05 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 references : in-reply-to : subject : date : message-id : mime-version :
 content-type : content-transfer-encoding; s=PODMain02222019;
 bh=NcFKGJr3amGy52ceieCxLUEGF82G2C/NAccEBTQwE5Y=;
 b=purC4JXmsp2wbIRqlPddGWvXKbhLC1qQAkUR/pVYHyAvcDDSR+nv+CC9yAiVpalzi/fe
 Rucybd8i/oWbECiQZxo0mGi4RsH/s2jWu41Otr3ZlDMgofaOypxETaBDf2BOy6jHjH9Z
 eTs9KCPAK6bZJYR/9Qs+VT+nHKL2xV3PqL4Eu36Fp3j1oFOki7a8JWROk7hehb4iApkD
 47g997WqlgaIx2f9YTCaE8eXIT3kzAkbFlstg+/cvHg7ouk+kXj5ttONqgvNV312VLb3
 gY5yQqepGYs8lC6SYiLs6e1eeU8dkr7KX0RX8514rv5Mo6G9bYd/8Iv7a0PV5/5aOzuk 4A== 
Received: from ediex02.ad.cirrus.com ([87.246.76.36])
 by mx0a-001ae601.pphosted.com with ESMTP id 374819bg7e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Tue, 09 Mar 2021 08:21:04 -0600
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2; Tue, 9 Mar 2021
 14:21:02 +0000
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2176.2 via Frontend
 Transport; Tue, 9 Mar 2021 14:21:02 +0000
Received: from LONN2DGDQ73 (unknown [198.90.238.85])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 7632211D7;
 Tue,  9 Mar 2021 14:21:02 +0000 (UTC)
From: Gerrit <sbinding@opensource.cirrus.com>
To: 'Pierre-Louis Bossart' <pierre-louis.bossart@linux.intel.com>, 'Vitaly
 Rodionov' <vitalyr@opensource.cirrus.com>, 'Jaroslav Kysela'
 <perex@perex.cz>, 'Takashi Iwai' <tiwai@suse.com>
References: <20210306111934.4832-1-vitalyr@opensource.cirrus.com>
 <20210306111934.4832-5-vitalyr@opensource.cirrus.com>
 <d22424a1-f5c3-42ec-aa54-8c8081a119e2@linux.intel.com>
In-Reply-To: <d22424a1-f5c3-42ec-aa54-8c8081a119e2@linux.intel.com>
Subject: RE: [PATCH v3 4/4] ALSA: hda/cirrus: Add Headphone and Headset MIC
 Volume Control
Date: Tue, 9 Mar 2021 14:21:02 +0000
Message-ID: <003c01d714ef$6f432690$4dc973b0$@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AQIPQI/HeQQInfQOo/hdd38vvxvEwgIbQDxAAqtoa+Cp5SblAA==
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 lowpriorityscore=0 suspectscore=0
 phishscore=0 malwarescore=0 bulkscore=0 priorityscore=1501 impostorscore=0
 mlxscore=0 adultscore=0 spamscore=0 mlxlogscore=999 clxscore=1011
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2103090073
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
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

Hi Pierre-Louis,

Thank you for your comments. It looks like this patch set has been =
merged, so we will look to address your comments in a future patch.

-----Original Message-----
From: Alsa-devel <alsa-devel-bounces@alsa-project.org> On Behalf Of =
Pierre-Louis Bossart
Sent: 08 March 2021 15:40
To: Vitaly Rodionov <vitalyr@opensource.cirrus.com>; Jaroslav Kysela =
<perex@perex.cz>; Takashi Iwai <tiwai@suse.com>
Cc: patches@opensource.cirrus.com; alsa-devel@alsa-project.org; =
linux-kernel@vger.kernel.org; Stefan Binding =
<sbinding@opensource.cirrus.com>
Subject: Re: [PATCH v3 4/4] ALSA: hda/cirrus: Add Headphone and Headset =
MIC Volume Control



On 3/6/21 5:19 AM, Vitaly Rodionov wrote:
> From: Stefan Binding <sbinding@opensource.cirrus.com>
>=20
> CS8409 does not support Volume Control for NIDs 0x24 (the Headphones), =

> or 0x34 (The Headset Mic).
> However, CS42L42 codec does support gain control for both.

Volume Control for both

> We can add support for Volume Controls, by writing the the CS42L42=20
> regmap via i2c commands, using custom info, get and put volume=20
> functions, saved in the control.
>=20
> Tested on DELL Inspiron-3500, DELL Inspiron-3501, DELL Inspiron-3500
>=20
> Signed-off-by: Stefan Binding <sbinding@opensource.cirrus.com>
> Signed-off-by: Vitaly Rodionov <vitalyr@opensource.cirrus.com>
> ---
>=20
> Changes in v3:
> - Added restore volumes after resume
> - Removed redundant debug logging after testing
>=20
>=20
>   sound/pci/hda/patch_cirrus.c | 200 =
+++++++++++++++++++++++++++++++++++
>   1 file changed, 200 insertions(+)
>=20
> diff --git a/sound/pci/hda/patch_cirrus.c=20
> b/sound/pci/hda/patch_cirrus.c index 1d2f6a1224e6..6a9e5c803977 100644
> --- a/sound/pci/hda/patch_cirrus.c
> +++ b/sound/pci/hda/patch_cirrus.c
> @@ -21,6 +21,9 @@
>   /*
>    */
>  =20
> +#define CS42L42_HP_CH     (2U)
> +#define CS42L42_HS_MIC_CH (1U)
> +
>   struct cs_spec {
>   	struct hda_gen_spec gen;
>  =20
> @@ -42,6 +45,9 @@ struct cs_spec {
>  =20
>   	unsigned int cs42l42_hp_jack_in:1;
>   	unsigned int cs42l42_mic_jack_in:1;
> +	unsigned int cs42l42_volume_init:1;

can you describe what this field is? it looks like it's only tracking a =
one-time initialization?
Yes, this field is used to track one-time initialization.
Since the CS42L42 codec needs to be reset on init, the volume values =
need to be restored afterwards.
This flag allows us to check whether we have previously cached the =
volume values, so they can be restored.

> +	char cs42l42_hp_volume[CS42L42_HP_CH];
> +	char cs42l42_hs_mic_volume[CS42L42_HS_MIC_CH];
>  =20
>   	struct mutex cs8409_i2c_mux;
>  =20
> @@ -1260,6 +1266,14 @@ static int patch_cs4213(struct hda_codec =
*codec)
>   #define CIR_I2C_QWRITE	0x005D
>   #define CIR_I2C_QREAD	0x005E
>  =20
> +#define CS8409_CS42L42_HP_VOL_REAL_MIN   (-63)
> +#define CS8409_CS42L42_HP_VOL_REAL_MAX   (0)
> +#define CS8409_CS42L42_AMIC_VOL_REAL_MIN (-97) #define=20
> +CS8409_CS42L42_AMIC_VOL_REAL_MAX (12) #define=20
> +CS8409_CS42L42_REG_HS_VOLUME_CHA (0x2301) #define=20
> +CS8409_CS42L42_REG_HS_VOLUME_CHB (0x2303)
> +#define CS8409_CS42L42_REG_AMIC_VOLUME   (0x1D03)
> +
>   struct cs8409_i2c_param {
>   	unsigned int addr;
>   	unsigned int reg;
> @@ -1580,6 +1594,165 @@ static unsigned int cs8409_i2c_write(struct =
hda_codec *codec,
>   	return retval;
>   }
>  =20
> +static int cs8409_cs42l42_volume_info(struct snd_kcontrol *kcontrol,
> +				  struct snd_ctl_elem_info *uinfo) {
> +	struct hda_codec *codec =3D snd_kcontrol_chip(kcontrol);
> +	u16 nid =3D get_amp_nid(kcontrol);
> +	u8 chs =3D get_amp_channels(kcontrol);
> +
> +	codec_dbg(codec, "%s() nid: %d\n", __func__, nid);
> +	switch (nid) {
> +	case CS8409_CS42L42_HP_PIN_NID:
> +		uinfo->type =3D SNDRV_CTL_ELEM_TYPE_INTEGER;
> +		uinfo->count =3D chs =3D=3D 3 ? 2 : 1;
> +		uinfo->value.integer.min =3D CS8409_CS42L42_HP_VOL_REAL_MIN;
> +		uinfo->value.integer.max =3D CS8409_CS42L42_HP_VOL_REAL_MAX;
> +		break;
> +	case CS8409_CS42L42_AMIC_PIN_NID:
> +		uinfo->type =3D SNDRV_CTL_ELEM_TYPE_INTEGER;
> +		uinfo->count =3D chs =3D=3D 3 ? 2 : 1;
> +		uinfo->value.integer.min =3D CS8409_CS42L42_AMIC_VOL_REAL_MIN;
> +		uinfo->value.integer.max =3D CS8409_CS42L42_AMIC_VOL_REAL_MAX;
> +		break;
> +	default:
> +		break;
> +	}
> +	return 0;
> +}
> +
> +static void cs8409_cs42l42_update_volume(struct hda_codec *codec) {
> +	struct cs_spec *spec =3D codec->spec;
> +
> +	mutex_lock(&spec->cs8409_i2c_mux);
> +	spec->cs42l42_hp_volume[0] =3D -(cs8409_i2c_read(codec, =
CS42L42_I2C_ADDR,
> +				CS8409_CS42L42_REG_HS_VOLUME_CHA, 1));
> +	spec->cs42l42_hp_volume[1] =3D -(cs8409_i2c_read(codec, =
CS42L42_I2C_ADDR,
> +				CS8409_CS42L42_REG_HS_VOLUME_CHB, 1));
> +	spec->cs42l42_hs_mic_volume[0] =3D -(cs8409_i2c_read(codec, =
CS42L42_I2C_ADDR,
> +				CS8409_CS42L42_REG_AMIC_VOLUME, 1));
> +	mutex_unlock(&spec->cs8409_i2c_mux);
> +	spec->cs42l42_volume_init =3D 1;
> +}
> +
> +static int cs8409_cs42l42_volume_get(struct snd_kcontrol *kcontrol,
> +				 struct snd_ctl_elem_value *ucontrol) {
> +	struct hda_codec *codec =3D snd_kcontrol_chip(kcontrol);
> +	struct cs_spec *spec =3D codec->spec;
> +	hda_nid_t nid =3D get_amp_nid(kcontrol);
> +	int chs =3D get_amp_channels(kcontrol);
> +	long *valp =3D ucontrol->value.integer.value;
> +
> +	if (!spec->cs42l42_volume_init) {
> +		snd_hda_power_up(codec);
> +		cs8409_cs42l42_update_volume(codec);
> +		snd_hda_power_down(codec);
> +	}
> +	switch (nid) {
> +	case CS8409_CS42L42_HP_PIN_NID:
> +		if (chs & 1)

BIT(0)?
Will fix that.

> +			*valp++ =3D spec->cs42l42_hp_volume[0];
> +		if (chs & 2)

BIT(1)?
Will fix that.

> +			*valp++ =3D spec->cs42l42_hp_volume[1];
> +		break;

