Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 58B2A331314
	for <lists+alsa-devel@lfdr.de>; Mon,  8 Mar 2021 17:14:07 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E803B18CD;
	Mon,  8 Mar 2021 17:13:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E803B18CD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1615220047;
	bh=WLTgWVVNim+A/O/siXI9zT9uPPWA1BBCh3bGeTaQ+js=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Bh7y+bsygS05uwezrPJjcDLF53JWnuam5AOlfCQFxWD7G1ggrHtFWwSv5PJsW2obM
	 hPVaIiuBKSjrVHnLPuk4vgsZVOm4b268av3YUMVRsvI21FFViyZqlVtKUrGLF4HP3i
	 ANNced28ndswOT2O6rj/VP2QKhFMvBLQrXv5sKP8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B663BF804FD;
	Mon,  8 Mar 2021 17:08:58 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A4C4DF804E7; Mon,  8 Mar 2021 17:08:50 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 90535F804AB
 for <alsa-devel@alsa-project.org>; Mon,  8 Mar 2021 17:08:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 90535F804AB
IronPort-SDR: mW2JYfQsF6twRpYb1eHxIo15lEPMyv8d4uQuZPaJens9KiWECajZe7Vx+vmdWQOR3/qj4MKlWg
 /UZXvwG0PsMw==
X-IronPort-AV: E=McAfee;i="6000,8403,9917"; a="273083306"
X-IronPort-AV: E=Sophos;i="5.81,232,1610438400"; d="scan'208";a="273083306"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2021 08:08:35 -0800
IronPort-SDR: VOpAN7wL+ksUZsM2/bjwfiFbm/OhowCD41PGo6mnUyfgQU7+pCx+RwblYt9dXWyYaLy1ItHS31
 8cIJmkwkqBFg==
X-IronPort-AV: E=Sophos;i="5.81,232,1610438400"; d="scan'208";a="430419009"
Received: from dbdavenp-mobl1.amr.corp.intel.com (HELO [10.212.234.206])
 ([10.212.234.206])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2021 08:08:34 -0800
Subject: Re: [PATCH v3 4/4] ALSA: hda/cirrus: Add Headphone and Headset MIC
 Volume Control
To: Vitaly Rodionov <vitalyr@opensource.cirrus.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
References: <20210306111934.4832-1-vitalyr@opensource.cirrus.com>
 <20210306111934.4832-5-vitalyr@opensource.cirrus.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <d22424a1-f5c3-42ec-aa54-8c8081a119e2@linux.intel.com>
Date: Mon, 8 Mar 2021 09:40:08 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210306111934.4832-5-vitalyr@opensource.cirrus.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, Stefan Binding <sbinding@opensource.cirrus.com>
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



On 3/6/21 5:19 AM, Vitaly Rodionov wrote:
> From: Stefan Binding <sbinding@opensource.cirrus.com>
> 
> CS8409 does not support Volume Control for NIDs 0x24 (the Headphones),
> or 0x34 (The Headset Mic).
> However, CS42L42 codec does support gain control for both.

Volume Control for both

> We can add support for Volume Controls, by writing the the CS42L42
> regmap via i2c commands, using custom info, get and put volume
> functions, saved in the control.
> 
> Tested on DELL Inspiron-3500, DELL Inspiron-3501, DELL Inspiron-3500
> 
> Signed-off-by: Stefan Binding <sbinding@opensource.cirrus.com>
> Signed-off-by: Vitaly Rodionov <vitalyr@opensource.cirrus.com>
> ---
> 
> Changes in v3:
> - Added restore volumes after resume
> - Removed redundant debug logging after testing
> 
> 
>   sound/pci/hda/patch_cirrus.c | 200 +++++++++++++++++++++++++++++++++++
>   1 file changed, 200 insertions(+)
> 
> diff --git a/sound/pci/hda/patch_cirrus.c b/sound/pci/hda/patch_cirrus.c
> index 1d2f6a1224e6..6a9e5c803977 100644
> --- a/sound/pci/hda/patch_cirrus.c
> +++ b/sound/pci/hda/patch_cirrus.c
> @@ -21,6 +21,9 @@
>   /*
>    */
>   
> +#define CS42L42_HP_CH     (2U)
> +#define CS42L42_HS_MIC_CH (1U)
> +
>   struct cs_spec {
>   	struct hda_gen_spec gen;
>   
> @@ -42,6 +45,9 @@ struct cs_spec {
>   
>   	unsigned int cs42l42_hp_jack_in:1;
>   	unsigned int cs42l42_mic_jack_in:1;
> +	unsigned int cs42l42_volume_init:1;

can you describe what this field is? it looks like it's only tracking a 
one-time initialization?

> +	char cs42l42_hp_volume[CS42L42_HP_CH];
> +	char cs42l42_hs_mic_volume[CS42L42_HS_MIC_CH];
>   
>   	struct mutex cs8409_i2c_mux;
>   
> @@ -1260,6 +1266,14 @@ static int patch_cs4213(struct hda_codec *codec)
>   #define CIR_I2C_QWRITE	0x005D
>   #define CIR_I2C_QREAD	0x005E
>   
> +#define CS8409_CS42L42_HP_VOL_REAL_MIN   (-63)
> +#define CS8409_CS42L42_HP_VOL_REAL_MAX   (0)
> +#define CS8409_CS42L42_AMIC_VOL_REAL_MIN (-97)
> +#define CS8409_CS42L42_AMIC_VOL_REAL_MAX (12)
> +#define CS8409_CS42L42_REG_HS_VOLUME_CHA (0x2301)
> +#define CS8409_CS42L42_REG_HS_VOLUME_CHB (0x2303)
> +#define CS8409_CS42L42_REG_AMIC_VOLUME   (0x1D03)
> +
>   struct cs8409_i2c_param {
>   	unsigned int addr;
>   	unsigned int reg;
> @@ -1580,6 +1594,165 @@ static unsigned int cs8409_i2c_write(struct hda_codec *codec,
>   	return retval;
>   }
>   
> +static int cs8409_cs42l42_volume_info(struct snd_kcontrol *kcontrol,
> +				  struct snd_ctl_elem_info *uinfo)
> +{
> +	struct hda_codec *codec = snd_kcontrol_chip(kcontrol);
> +	u16 nid = get_amp_nid(kcontrol);
> +	u8 chs = get_amp_channels(kcontrol);
> +
> +	codec_dbg(codec, "%s() nid: %d\n", __func__, nid);
> +	switch (nid) {
> +	case CS8409_CS42L42_HP_PIN_NID:
> +		uinfo->type = SNDRV_CTL_ELEM_TYPE_INTEGER;
> +		uinfo->count = chs == 3 ? 2 : 1;
> +		uinfo->value.integer.min = CS8409_CS42L42_HP_VOL_REAL_MIN;
> +		uinfo->value.integer.max = CS8409_CS42L42_HP_VOL_REAL_MAX;
> +		break;
> +	case CS8409_CS42L42_AMIC_PIN_NID:
> +		uinfo->type = SNDRV_CTL_ELEM_TYPE_INTEGER;
> +		uinfo->count = chs == 3 ? 2 : 1;
> +		uinfo->value.integer.min = CS8409_CS42L42_AMIC_VOL_REAL_MIN;
> +		uinfo->value.integer.max = CS8409_CS42L42_AMIC_VOL_REAL_MAX;
> +		break;
> +	default:
> +		break;
> +	}
> +	return 0;
> +}
> +
> +static void cs8409_cs42l42_update_volume(struct hda_codec *codec)
> +{
> +	struct cs_spec *spec = codec->spec;
> +
> +	mutex_lock(&spec->cs8409_i2c_mux);
> +	spec->cs42l42_hp_volume[0] = -(cs8409_i2c_read(codec, CS42L42_I2C_ADDR,
> +				CS8409_CS42L42_REG_HS_VOLUME_CHA, 1));
> +	spec->cs42l42_hp_volume[1] = -(cs8409_i2c_read(codec, CS42L42_I2C_ADDR,
> +				CS8409_CS42L42_REG_HS_VOLUME_CHB, 1));
> +	spec->cs42l42_hs_mic_volume[0] = -(cs8409_i2c_read(codec, CS42L42_I2C_ADDR,
> +				CS8409_CS42L42_REG_AMIC_VOLUME, 1));
> +	mutex_unlock(&spec->cs8409_i2c_mux);
> +	spec->cs42l42_volume_init = 1;
> +}
> +
> +static int cs8409_cs42l42_volume_get(struct snd_kcontrol *kcontrol,
> +				 struct snd_ctl_elem_value *ucontrol)
> +{
> +	struct hda_codec *codec = snd_kcontrol_chip(kcontrol);
> +	struct cs_spec *spec = codec->spec;
> +	hda_nid_t nid = get_amp_nid(kcontrol);
> +	int chs = get_amp_channels(kcontrol);
> +	long *valp = ucontrol->value.integer.value;
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

> +			*valp++ = spec->cs42l42_hp_volume[0];
> +		if (chs & 2)

BIT(1)?

> +			*valp++ = spec->cs42l42_hp_volume[1];
> +		break;
