Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AEC5184CF3F
	for <lists+alsa-devel@lfdr.de>; Wed,  7 Feb 2024 17:48:32 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 372A5A4A;
	Wed,  7 Feb 2024 17:48:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 372A5A4A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1707324512;
	bh=O8TFoIddkKyvAT0AdWOOk8Cu0gey2ydHbGJH/Xhc9Jg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=pABJfsGAizs+cC/EybOwrXC8JgCEOlBnE3CkqeMYliPdV8R2uAy4WEkpv26l6AgEC
	 E3ibPAYN+bKUDGinDTSgjmJJ3IeVBR3kVFWKIrN/zMenoM1SU5J/0z9SDKOJGQTTSv
	 vfpJ49Cz9H13Yd+uJv7J9HjvXimvAqrZ8HHT3nZk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5B856F80579; Wed,  7 Feb 2024 17:47:59 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B4DFBF805A8;
	Wed,  7 Feb 2024 17:47:59 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D48EEF801EB; Wed,  7 Feb 2024 17:47:55 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3A8F9F800EE
	for <alsa-devel@alsa-project.org>; Wed,  7 Feb 2024 17:47:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3A8F9F800EE
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=gqxqYIru
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707324468; x=1738860468;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=O8TFoIddkKyvAT0AdWOOk8Cu0gey2ydHbGJH/Xhc9Jg=;
  b=gqxqYIrutVttozT+7K72buxhHTRaZl8vYHNHK5lV1DOe/7rMYyr4fs20
   WkyV2CbeR8MtB41dLVHOn+MyqHSoKrlA7AhWpHVVChsu6NWgOo6Gq1BCy
   cMFPtXnMJeWPq+9aUNPPtFabTQtvKJ6wSW0sdqU3TsQSBO6Zrtnn28SZe
   MmHXwBqy2k48CiZ5FgsFlJCuvOroQ7G6a1pTRkK1XCu+jzPS+OB7ESEE/
   2/qXU9W6YjROj8nPlk1OshabJEbt6YY+xjBrEPCqqrfPlmsuHaNeMSzyN
   3vSG5eoeLYmfN51NzoBFsWnkosEUN1UFdX0CpXcqR+vVG2Axy51+EwUJT
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10977"; a="1172953"
X-IronPort-AV: E=Sophos;i="6.05,251,1701158400";
   d="scan'208";a="1172953"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2024 08:47:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,251,1701158400";
   d="scan'208";a="32457830"
Received: from ndarceda-mobl1.amr.corp.intel.com (HELO [10.212.81.33])
 ([10.212.81.33])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2024 08:47:37 -0800
Message-ID: <b864e6d7-1e37-4901-b934-1e074d3c0b6c@linux.intel.com>
Date: Wed, 7 Feb 2024 10:45:51 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7] ASoc: tas2783: Add tas2783 codec driver
Content-Language: en-US
To: Shenghao Ding <shenghao-ding@ti.com>, broonie@kernel.org
Cc: andriy.shevchenko@linux.intel.com, lgirdwood@gmail.com, perex@perex.cz,
 13916275206@139.com, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, liam.r.girdwood@intel.com,
 bard.liao@intel.com, mengdong.lin@intel.com,
 yung-chuan.liao@linux.intel.com, baojun.xu@ti.com, kevin-lu@ti.com,
 navada@ti.com, tiwai@suse.de, soyer@irl.hu
References: <20240207054743.1504-1-shenghao-ding@ti.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20240207054743.1504-1-shenghao-ding@ti.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: BPDUHC5EQBCW6YWMV4BWGTF7AF22ML3P
X-Message-ID-Hash: BPDUHC5EQBCW6YWMV4BWGTF7AF22ML3P
X-MailFrom: pierre-louis.bossart@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/BPDUHC5EQBCW6YWMV4BWGTF7AF22ML3P/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Much better than previous versions but still questions on pm_runtime and
a big undocumented part on the unique_id use. see comments below
-Pierre


> +config SND_SOC_TAS2783
> +	tristate "Texas Instruments TAS2783 speaker amplifier (sdw)"
> +	depends on SOUNDWIRE
> +	depends on EFI
> +	select REGMAP
> +	select REGMAP_SOUNDWIRE

nit-pick: should have 'select CRC32'...

> +	select CRC32_SARWATE

before selecting the CRC32 implementation. It's also not clear if this
is needed, the help says

 "Only choose this option if you know what you are doing."

> +static void tas2783_apply_calib(struct tasdevice_priv *tas_dev,
> +	unsigned int *cali_data)
> +{
> +	struct regmap *map = tas_dev->regmap;
> +	u8 *reg_start;
> +	int ret;
> +
> +	if (!tas_dev->sdw_peripheral) {
> +		dev_err(tas_dev->dev, "%s, slaver doesn't exist.\n",

"peripheral does not exist"

> +			__func__);
> +		return;
> +	}
> +	if ((tas_dev->sdw_peripheral->id.unique_id < TAS2783_ID_MIN) ||
> +		(tas_dev->sdw_peripheral->id.unique_id > TAS2783_ID_MAX)) {

Where does this unique_id requirement come from?

I see this in the header files, and that means only half of the bits are
supported?

+/* Unique id start */
+#define TAS2783_ID_MIN			0x08
+/* Unique id end */
+#define TAS2783_ID_MAX			0x0f

the unique_id is only meant to allow identical devices to work
concurrently on the same link, specifically it enables the enumeration
of identical devices with the hardware arbitration. The device with the
highest unique_id is enumerated first in case of conflicts.

The unique_id is usually set at the board level. I don't know how the
codec driver can enforce a specific value.

This needs more explanations....

> +		dev_err(tas_dev->dev, "%s, error unique_id.\n",
> +			__func__);
> +		return;
> +	}
> +
> +	reg_start = (u8 *)(cali_data + (tas_dev->sdw_peripheral->id.unique_id
> +		- TAS2783_ID_MIN) * sizeof(tas2783_cali_reg));
> +	for (int i = 0; i < ARRAY_SIZE(tas2783_cali_reg); i++) {
> +		ret = regmap_bulk_write(map, tas2783_cali_reg[i],
> +			&reg_start[4 * i], 4);
> +		if (ret) {
> +			dev_err(tas_dev->dev, "Cali failed %x:%d\n",
> +				tas2783_cali_reg[i], ret);
> +			break;
> +		}
> +	}
> +}

> +static void tasdevice_rca_ready(const struct firmware *fmw,
> +	void *context)
> +{
> +	struct tasdevice_priv *tas_dev =
> +		(struct tasdevice_priv *) context;
> +	struct tas2783_firmware_node *p;
> +	struct regmap *map = tas_dev->regmap;
> +	unsigned char *buf = NULL;
> +	int offset = 0, img_sz;
> +	int ret, value_sdw;
> +
> +	if (!fmw || !fmw->data) {
> +		/* No firmware binary, devices will work in ROM mode. */
> +		dev_err(tas_dev->dev,
> +			"Failed to read %s, no side-effect on driver\n",
> +			tas_dev->rca_binaryname);
> +		ret = -EINVAL;

If this is not an error, it should be dev_info or dev_warn?

> +		goto out;
> +	}
> +	buf = (unsigned char *)fmw->data;
> +
> +	img_sz = le32_to_cpup((__le32 *)&buf[offset]);
> +	offset  += sizeof(img_sz);
> +	if (img_sz != fmw->size) {
> +		dev_err(tas_dev->dev, "Size not matching, %d %u",
> +			(int)fmw->size, img_sz);
> +		ret = -EINVAL;
> +		goto out;
> +	}
> +
> +	while (offset < img_sz) {
> +		p = (struct tas2783_firmware_node *)(buf + offset);
> +		if (p->length > 1) {
> +			ret = regmap_bulk_write(map, p->download_addr,
> +			buf + offset + sizeof(unsigned int)*5, p->length);
> +		} else
> +			ret = regmap_write(map, p->download_addr,
> +				*(buf + offset + sizeof(unsigned int) * 5));
> +
> +		if (ret != 0) {
> +			dev_dbg(tas_dev->dev, "Load FW fail: %d.\n", ret);
> +			goto out;
> +		}
> +		offset += sizeof(unsigned int)*5 + p->length;
> +	}
> +	/* Select left/right channel based on unique id. */
> +	value_sdw = 0x1a;
> +	value_sdw |= ((tas_dev->sdw_peripheral->dev_num & 1) << 4);

This is a very odd sequence, please add commments on what those bits
mean. It looks like this is confusing unique id and device number. Not
the same thing at all! The unique_id is set at the board level and used
during enumeration only, the dev_num is used as a logical value for
command/control. The dev_num is assigned in drivers/soundwire/bus.c and
depends on multiple things (order of attachment, allocation policy on
this host, etc). The codec driver cannot assume any specific value for
dev_num.

> +	dev_dbg(tas_dev->dev, "%s dev_num = %u", __func__,
> +		tas_dev->sdw_peripheral->dev_num);
> +	regmap_write(map, TAS2783_REG_TDM_RX_CFG, value_sdw);
> +
> +	tas2783_calibration(tas_dev);
> +
> +out:
> +	if (fmw)
> +		release_firmware(fmw);
> +}

> +static int tasdevice_init(struct tasdevice_priv *tas_dev)
> +{
> +	int ret;
> +
> +	dev_set_drvdata(tas_dev->dev, tas_dev);
> +
> +	ret = devm_snd_soc_register_component(tas_dev->dev,
> +		&soc_codec_driver_tasdevice,
> +		tasdevice_dai_driver, ARRAY_SIZE(tasdevice_dai_driver));
> +	if (ret) {
> +		dev_err(tas_dev->dev, "%s: codec register error:%d.\n",
> +			__func__, ret);
> +		goto out;
> +	}
> +
> +	/* tas2783-link_id[0,1,...,N]-unique_id[8,9,...,f].bin stores the dsp
> +	 * firmware including speaker protection algorithm, audio acoustic
> +	 * algorithm, speaker characters and algorithm params, it must be
> +	 * copied into firmware folder. Each tas2783 has its own bin file.
> +	 */
> +	scnprintf(tas_dev->rca_binaryname, 64, "tas2783-%d-%x.bin",
> +		tas_dev->sdw_peripheral->bus->link_id,
> +		tas_dev->sdw_peripheral->id.unique_id);

Goodness, again this unique_id usage.

This is really problematic, how would this work for a Linux
distribution? Fetching the firmware ONLY on the basis of a unique_id
means possible collisions between platformA from OEM_X and platformB
from OEM_Y.

> +
> +	ret = request_firmware_nowait(THIS_MODULE, FW_ACTION_UEVENT,
> +		tas_dev->rca_binaryname, tas_dev->dev, GFP_KERNEL,
> +		tas_dev, tasdevice_rca_ready);
> +	if (ret) {
> +		dev_err(tas_dev->dev,
> +			"%s: request_firmware %x open status: %d.\n",
> +			__func__, tas_dev->sdw_peripheral->id.unique_id, ret);
> +		goto out;
> +	}
> +
> +	/* set autosuspend parameters */
> +	pm_runtime_set_autosuspend_delay(tas_dev->dev, 3000);
> +	pm_runtime_use_autosuspend(tas_dev->dev);
> +
> +	/* make sure the device does not suspend immediately */
> +	pm_runtime_mark_last_busy(tas_dev->dev);
> +	pm_runtime_get_noresume(tas_dev->dev);

why are you increasing the refcount here? No other SoundWire codec
driver does this.

> +	pm_runtime_enable(tas_dev->dev);
> +
> +out:
> +	return ret;
> +}

> +static int tasdevice_sdw_remove(struct sdw_slave *peripheral)
> +{
> +	struct tasdevice_priv *tas_dev = dev_get_drvdata(&peripheral->dev);
> +
> +	if (tas_dev->first_hw_init)
> +		pm_runtime_disable(tas_dev->dev);
> +
> +	pm_runtime_put_noidle(tas_dev->dev);

that should be removed as well, this and the previous get_no_resume()
guarantee that pm_runtime suspend *NEVER* happens...

> +	return 0;
> +}

> +/* Unique id start */
> +#define TAS2783_ID_MIN			0x08
> +/* Unique id end */
> +#define TAS2783_ID_MAX			0x0f

this needs a lot more documentation, there's really nothing in the
SoundWire spec that allows for the unique_id to be restricted...
