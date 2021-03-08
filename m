Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DA4B33130D
	for <lists+alsa-devel@lfdr.de>; Mon,  8 Mar 2021 17:12:36 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C745A1903;
	Mon,  8 Mar 2021 17:11:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C745A1903
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1615219955;
	bh=zvOyIgflun98T35+QGDlEFD12CFehDM+igqPHzEfKHE=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hbkPDGFNqvg86Oh+74sb27jx+LW7yDr+89BbI4hrAIpD+guZtQUuGZiJFTzoOEHus
	 +ANJnCGNSBKofHQ/2ZQ9gxaUtNnh3YaaC6VHHtBM2LNU9hZo9pbDPIhhPg8Oo2DDIs
	 akDMfIcdfzkBL8V8OPGyX3haBlNolV9DzlPpwGtI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EA808F804AB;
	Mon,  8 Mar 2021 17:08:50 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BCEDFF804BD; Mon,  8 Mar 2021 17:08:43 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9306FF80139
 for <alsa-devel@alsa-project.org>; Mon,  8 Mar 2021 17:08:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9306FF80139
IronPort-SDR: T4Jy67gjLG7xaHZ6obc9I3wft+eBs3nPfYnWZxIjBUy+lKUV4x2oeG0MDhu48BO5thKBQTxSm7
 sL/XlxuZPoZQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9917"; a="273083293"
X-IronPort-AV: E=Sophos;i="5.81,232,1610438400"; d="scan'208";a="273083293"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2021 08:08:30 -0800
IronPort-SDR: k1kaGFlAtH6RB+xl8YSRur50qn/QgvjfpP5WFOD3rLg1z6xlufAXsaonFhxwOs0azw4rYsy/KE
 H+sddCbXca4Q==
X-IronPort-AV: E=Sophos;i="5.81,232,1610438400"; d="scan'208";a="430418980"
Received: from dbdavenp-mobl1.amr.corp.intel.com (HELO [10.212.234.206])
 ([10.212.234.206])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2021 08:08:29 -0800
Subject: Re: [PATCH v3 2/4] ALSA: hda/cirrus: Add support for CS8409 HDA
 bridge and CS42L42 companion codec.
To: Vitaly Rodionov <vitalyr@opensource.cirrus.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
References: <20210306111934.4832-1-vitalyr@opensource.cirrus.com>
 <20210306111934.4832-3-vitalyr@opensource.cirrus.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <3e1bd870-b0e6-cc30-fcdb-b65c7668b0c3@linux.intel.com>
Date: Mon, 8 Mar 2021 09:33:03 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210306111934.4832-3-vitalyr@opensource.cirrus.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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


> +/* Enable I2C clocks */
> +static void cs8409_enable_i2c_clock(struct hda_codec *codec, unsigned int flag)
> +{
> +	unsigned int retval = 0;
> +	unsigned int newval = 0;

initializations not needed

> +	retval = cs_vendor_coef_get(codec, 0x0);
> +	newval = (flag) ? (retval | 0x8) : (retval & 0xfffffff7);
> +	cs_vendor_coef_set(codec, 0x0, newval);
> +}
> +
> +/* Wait I2C transaction  */
> +static int cs8409_i2c_wait_complete(struct hda_codec *codec)
> +{
> +	int repeat = 5;
> +	unsigned int retval = 0;

initialization not needed.

> +
> +	do {
> +		retval = cs_vendor_coef_get(codec, CIR_I2C_STATUS);
> +		if ((retval & 0x18) != 0x18) {
> +			usleep_range(2000, 4000);
> +			--repeat;
> +		} else
> +			break;
> +
> +	} while (repeat);
> +
> +	return repeat > 0 ? 0 : -1;

can we simplify by returning !!repeat ?

> +}
> +
> +/* CS8409 slave i2cRead */
> +static unsigned int cs8409_i2c_read(struct hda_codec *codec,
> +		unsigned int i2c_address,
> +		unsigned int i2c_reg,
> +		unsigned int paged)
> +{
> +	unsigned int i2c_reg_data;
> +	unsigned int retval = 0;
> +
> +	cs8409_enable_i2c_clock(codec, 1);
> +	cs_vendor_coef_set(codec, CIR_I2C_ADDR, i2c_address);
> +
> +	if (paged) {
> +		cs_vendor_coef_set(codec, CIR_I2C_QWRITE, i2c_reg >> 8);
> +		if (cs8409_i2c_wait_complete(codec) == -1) {
> +			codec_err(codec,
> +				"%s() Paged Transaction Failed 0x%02x : 0x%04x = 0x%02x\n",
> +				__func__, i2c_address, i2c_reg, retval);

return an error?

> +		}
> +	}
> +
> +	i2c_reg_data = (i2c_reg << 8) & 0x0ffff;
> +	cs_vendor_coef_set(codec, CIR_I2C_QREAD, i2c_reg_data);
> +	if (cs8409_i2c_wait_complete(codec) == -1) {
> +		codec_err(codec, "%s() Transaction Failed 0x%02x : 0x%04x = 0x%02x\n",
> +			__func__, i2c_address, i2c_reg, retval);

return and error?

> +	}
> +
> +	/* Register in bits 15-8 and the data in 7-0 */
> +	retval = cs_vendor_coef_get(codec, CIR_I2C_QREAD);
> +	retval &= 0x0ff;
> +
> +	cs8409_enable_i2c_clock(codec, 0);
> +
> +	return retval;
> +}
> +
> +/* CS8409 slave i2cWrite */
> +static unsigned int cs8409_i2c_write(struct hda_codec *codec,
> +		unsigned int i2c_address, unsigned int i2c_reg,
> +		unsigned int i2c_data,
> +		unsigned int paged)
> +{
> +	unsigned int retval = 0;
> +	unsigned int i2c_reg_data = 0;
> +
> +	cs8409_enable_i2c_clock(codec, 1);
> +	cs_vendor_coef_set(codec, CIR_I2C_ADDR, i2c_address);
> +
> +	if (paged) {
> +		cs_vendor_coef_set(codec, CIR_I2C_QWRITE, i2c_reg >> 8);
> +		if (cs8409_i2c_wait_complete(codec) == -1) {
> +			codec_err(codec,
> +				"%s() Paged Transaction Failed 0x%02x : 0x%04x = 0x%02x\n",
> +				__func__, i2c_address, i2c_reg, retval);

return error?

> +		}
> +	}
> +
> +	i2c_reg_data = ((i2c_reg << 8) & 0x0ff00) | (i2c_data & 0x0ff);
> +	cs_vendor_coef_set(codec, CIR_I2C_QWRITE, i2c_reg_data);
> +
> +	if (cs8409_i2c_wait_complete(codec) == -1) {
> +		codec_err(codec, "%s() Transaction Failed 0x%02x : 0x%04x = 0x%02x\n",
> +			__func__, i2c_address, i2c_reg, retval);

return error?

> +	}
> +
> +	cs8409_enable_i2c_clock(codec, 0);
> +
> +	return retval;
> +}
> +
> +/* Assert/release RTS# line to CS42L42 */
> +static void cs8409_cs42l42_reset(struct hda_codec *codec)
> +{
> +	/* Assert RTS# line */
> +	snd_hda_codec_write(codec,
> +			codec->core.afg, 0, AC_VERB_SET_GPIO_DATA, 0);
> +	/* wait ~10ms */
> +	usleep_range(10000, 15000);
> +	/* Release RTS# line */
> +	snd_hda_codec_write(codec,
> +			codec->core.afg, 0, AC_VERB_SET_GPIO_DATA, GPIO5_INT);
> +	/* wait ~10ms */
> +	usleep_range(10000, 15000);
> +
> +	/* Clear interrupts status */
> +	cs8409_i2c_read(codec, CS42L42_I2C_ADDR, 0x1308, 1);
> +	cs8409_i2c_read(codec, CS42L42_I2C_ADDR, 0x1309, 1);
> +	cs8409_i2c_read(codec, CS42L42_I2C_ADDR, 0x130A, 1);
> +	cs8409_i2c_read(codec, CS42L42_I2C_ADDR, 0x130F, 1);

clear on read?


> +static int cs8409_cs42l42_fixup(struct hda_codec *codec)
> +{
> +	int err = 0;

useless init

> +	struct cs_spec *spec = codec->spec;
> +	unsigned int pincap = 0;
> +
> +	/* Basic initial sequence for specific hw configuration */
> +	snd_hda_sequence_write(codec, cs8409_cs42l42_init_verbs);
> +
> +	/* CS8409 is simple HDA bridge and intended to be used with a remote
> +	 * companion codec. Most of input/output PIN(s) have only basic
> +	 * capabilities. NID(s) 0x24 and 0x34 have only OUTC and INC
> +	 * capabilities and no presence detect capable (PDC) and call to
> +	 * snd_hda_gen_build_controls() will mark them as non detectable
> +	 * phantom jacks. However, in this configuration companion codec
> +	 * CS42L42 is connected to these pins and it has jack detect
> +	 * capabilities. We have to override pin capabilities,
> +	 * otherwise they will not be created as input devices.
> +	 */
> +	_snd_hdac_read_parm(&codec->core,
> +			CS8409_CS42L42_HP_PIN_NID, AC_PAR_PIN_CAP, &pincap);
> +
> +	snd_hdac_override_parm(&codec->core,
> +			CS8409_CS42L42_HP_PIN_NID, AC_PAR_PIN_CAP,
> +			(pincap | (AC_PINCAP_IMP_SENSE | AC_PINCAP_PRES_DETECT)));
> +
> +	_snd_hdac_read_parm(&codec->core, CS8409_CS42L42_AMIC_PIN_NID,
> +			AC_PAR_PIN_CAP, &pincap);
> +
> +	snd_hdac_override_parm(&codec->core,
> +			CS8409_CS42L42_AMIC_PIN_NID, AC_PAR_PIN_CAP,
> +			(pincap | (AC_PINCAP_IMP_SENSE | AC_PINCAP_PRES_DETECT)));
> +
> +	snd_hda_override_wcaps(codec, CS8409_CS42L42_HP_PIN_NID,
> +			(get_wcaps(codec, CS8409_CS42L42_HP_PIN_NID) | AC_WCAP_UNSOL_CAP));
> +
> +	snd_hda_override_wcaps(codec, CS8409_CS42L42_AMIC_PIN_NID,
> +			(get_wcaps(codec, CS8409_CS42L42_AMIC_PIN_NID) | AC_WCAP_UNSOL_CAP));
> +
> +	snd_hda_apply_fixup(codec, HDA_FIXUP_ACT_PRE_PROBE);
> +
> +	err = snd_hda_parse_pin_defcfg(codec, &spec->gen.autocfg, 0, 0);
> +	if (err < 0)
> +		return err;
> +
> +	err = snd_hda_gen_parse_auto_config(codec, &spec->gen.autocfg);
> +	if (err < 0)
> +		return err;
> +
> +	snd_hda_apply_fixup(codec, HDA_FIXUP_ACT_PROBE);
> +
> +	return err;
> +}
> +
> +static int patch_cs8409(struct hda_codec *codec)
> +{
> +	struct cs_spec *spec;
> +	int err = -EINVAL;
> +
> +	spec = cs_alloc_spec(codec, CS8409_VENDOR_NID);
> +	if (!spec)
> +		return -ENOMEM;
> +
> +	snd_hda_pick_fixup(codec,
> +			cs8409_models, cs8409_fixup_tbl, cs8409_fixups);
> +
> +	codec_dbg(codec, "Picked ID=%d, VID=%08x, DEV=%08x\n",
> +			codec->fixup_id,
> +			codec->bus->pci->subsystem_vendor,
> +			codec->bus->pci->subsystem_device);
> +
> +	switch (codec->fixup_id) {
> +	/* Dell platforms with CS42L42 companion codec */
> +	case CS8409_BULLSEYE:
> +	case CS8409_WARLOCK:
> +	case CS8409_CYBORG:
> +
> +		snd_hda_add_verbs(codec, cs8409_cs42l42_add_verbs);
> +
> +		codec->patch_ops = cs8409_cs42l42_patch_ops;
> +
> +		spec->gen.suppress_auto_mute = 1;
> +		spec->gen.no_primary_hp = 1;
> +		/* GPIO 5 out, 3,4 in */
> +		spec->gpio_dir = GPIO5_INT;
> +		spec->gpio_data = 0;
> +		spec->gpio_mask = 0x03f;
> +
> +		err = cs8409_cs42l42_fixup(codec);
> +
> +		if (err > 0)

better keep the convention that errors are negative and zero is success.

> +			err = cs8409_cs42l42_hw_init(codec);
> +		break;
> +
> +	default:
> +		codec_err(codec, "VID=%08x, DEV=%08x not supported\n",
> +				codec->bus->pci->subsystem_vendor,
> +				codec->bus->pci->subsystem_device);
> +		break;
> +	}
> +	if (err < 0)
> +		cs_free(codec);
> +	else
> +		snd_hda_codec_set_name(codec, "CS8409/CS42L42");
> +
> +	return err;
> +}
>   
>   /*
>    * patch entries
> @@ -1229,6 +1804,7 @@ static const struct hda_device_id snd_hda_id_cirrus[] = {
>   	HDA_CODEC_ENTRY(0x10134208, "CS4208", patch_cs4208),
>   	HDA_CODEC_ENTRY(0x10134210, "CS4210", patch_cs4210),
>   	HDA_CODEC_ENTRY(0x10134213, "CS4213", patch_cs4213),
> +	HDA_CODEC_ENTRY(0x10138409, "CS8409", patch_cs8409),
>   	{} /* terminator */
>   };
>   MODULE_DEVICE_TABLE(hdaudio, snd_hda_id_cirrus);
> 
