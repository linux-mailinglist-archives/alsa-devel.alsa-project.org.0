Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ECA984CD04
	for <lists+alsa-devel@lfdr.de>; Wed,  7 Feb 2024 15:41:46 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A1CBE84C;
	Wed,  7 Feb 2024 15:41:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A1CBE84C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1707316905;
	bh=jpQMKikXRFTP5gQGlKg5x/X3bPGQ1hHiDiklvQdwK5U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=IgW+I5dsxVIriBn51KOG2X4NnjhRecLwnjkIlM7l0E9V6SfZD1FDBaibAb5zIiWFF
	 rKAP3+vJpiqBxi3QdcPuHszUcNSaSV2t1QnVnjNjRG0jelETJSAjtSMUIoKDUe5HHw
	 cf0wneMzq+zKJDGFKdJElN4XmKd64153PvKkOBEY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DDB80F805A1; Wed,  7 Feb 2024 15:41:13 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 78FABF805A1;
	Wed,  7 Feb 2024 15:41:13 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 90F48F801EB; Wed,  7 Feb 2024 15:41:07 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E6FEAF8016E
	for <alsa-devel@alsa-project.org>; Wed,  7 Feb 2024 15:40:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E6FEAF8016E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=Gx7LCXQK
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707316853; x=1738852853;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=jpQMKikXRFTP5gQGlKg5x/X3bPGQ1hHiDiklvQdwK5U=;
  b=Gx7LCXQKSXjm+XYcQ5THg0MD3gK3So58h0NL54JNVriuN1ijQdvOeMgo
   sc3GFxgv+hL/pSmCGeNb3IDV2qil2/InI6yEjLWdAA7p7n3RUHm0yfjXB
   nQSJ0pJT9p4WpGxO1sz+ibyx60jp50k/WCkai3wLa0y+yoABcVwxYFOer
   IueKSQtEFe/l9NwL7zA9tUtw8CurUxxm3Qat3I8BhU7Q4tiKlhp8tIfqy
   FAJZxWPNH4T/ZWO/4kTq6ePG3Qp1ZfB9awDsPANk4z1C1d8c52nzkKyFe
   U5vaEVXU6U2LnMvP2FI6Gej81IEyfZ6WUWlkQC/eM/yHqX+R2qIWvRdEg
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10976"; a="4865348"
X-IronPort-AV: E=Sophos;i="6.05,251,1701158400";
   d="scan'208";a="4865348"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2024 06:40:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10976"; a="910008652"
X-IronPort-AV: E=Sophos;i="6.05,251,1701158400";
   d="scan'208";a="910008652"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2024 06:40:42 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1rXj6N-00000002d9v-02Uz;
	Wed, 07 Feb 2024 16:40:39 +0200
Date: Wed, 7 Feb 2024 16:40:38 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Shenghao Ding <shenghao-ding@ti.com>
Cc: broonie@kernel.org, lgirdwood@gmail.com, perex@perex.cz,
	pierre-louis.bossart@linux.intel.com, 13916275206@139.com,
	alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
	liam.r.girdwood@intel.com, bard.liao@intel.com,
	mengdong.lin@intel.com, yung-chuan.liao@linux.intel.com,
	baojun.xu@ti.com, kevin-lu@ti.com, navada@ti.com, tiwai@suse.de,
	soyer@irl.hu
Subject: Re: [PATCH v7] ASoc: tas2783: Add tas2783 codec driver
Message-ID: <ZcOWZlXu1fL_haFU@smile.fi.intel.com>
References: <20240207054743.1504-1-shenghao-ding@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240207054743.1504-1-shenghao-ding@ti.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Message-ID-Hash: 5PF3P2WGH6NFRSRUACGBIQSPGRXJ6PVL
X-Message-ID-Hash: 5PF3P2WGH6NFRSRUACGBIQSPGRXJ6PVL
X-MailFrom: andriy.shevchenko@linux.intel.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/5PF3P2WGH6NFRSRUACGBIQSPGRXJ6PVL/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, Feb 07, 2024 at 01:47:42PM +0800, Shenghao Ding wrote:
> The tas2783 is a smart audio amplifier with integrated MIPI SoundWire
> interface (Version 1.2.1 compliant), I2C, and I2S/TDM interfaces designed
> for portable applications. An on-chip DSP supports Texas Instruments
> SmartAmp speaker protection algorithm. The integrated speaker voltage and
> current sense provides for real-time monitoring of lodspeakers.
> 
> The ASoC component provides the majority of the functionality of the
> device, all the audio functions.

...

> +#include <linux/crc32.h>
> +#include <linux/efi.h>
> +#include <linux/err.h>
> +#include <linux/firmware.h>
> +#include <linux/init.h>
> +#include <linux/module.h>

> +#include <linux/of.h>

Unused header. Maybe you use it as a "proxy"? Don't do this, include what you
use directly (with some exceptions when we know that one header guarantees to
include another).

> +#include <linux/pm.h>
> +#include <linux/pm_runtime.h>
> +#include <linux/regmap.h>
> +#include <linux/soundwire/sdw.h>
> +#include <linux/soundwire/sdw_registers.h>
> +#include <linux/soundwire/sdw_type.h>
> +#include <sound/pcm_params.h>
> +#include <sound/sdw.h>
> +#include <sound/soc.h>
> +#include <sound/tlv.h>

+ Blank line?

> +#include <sound/tas2781-tlv.h>
> +
> +#include "tas2783.h"

...

> +		/* Only reset register was volatiled.
> +		 * Software reset. Bit is self clearing.
> +		 * 0b = Don't reset
> +		 * 1b = reset
> +		 */

/*
 * The above style of the multi-line comment is used
 * solely by net subsystem. Please, fix all comments
 * in your driver accordingly.
 */

...

> +static const struct regmap_config tasdevice_regmap = {
> +	.reg_bits = 32,
> +	.val_bits = 8,
> +	.readable_reg = tas2783_readable_register,
> +	.volatile_reg = tas2783_volatile_register,

> +	.max_register = 0x44ffffff,

I'm always wondering how this can work in debugfs when one tries to dump all
registers...

> +	.reg_defaults = tas2783_reg_defaults,
> +	.num_reg_defaults = ARRAY_SIZE(tas2783_reg_defaults),
> +	.cache_type = REGCACHE_RBTREE,
> +	.use_single_read = true,
> +	.use_single_write = true,
> +};

...

> +static int tasdevice_clamp(int val, int max, unsigned int invert)
> +{
> +	/* Keep in valid area, out of range value don't care. */
> +	if (val > max)
> +		val = max;
> +	if (invert)
> +		val = max - val;
> +	if (val < 0)
> +		val = 0;
> +	return val;

Can it be as simple as

	val = clamp(val, 0, max);
	if (invert)
		return max - val;
	return val;

?

> +}

...

> +		dev_err(tas_dev->dev, "%s, wrong parameter.\n", __func__);

Usually using __func__ in error messages signals about them being poorly
written.

...

> +		dev_err(tas_dev->dev, "%s, get digital vol error %x.\n",
> +			__func__, ret);

Like here, you repeat __func__ contents in the message itself.

...

> +	mask = (1 << fls(mc->max)) - 1;

Wouldn't roundup_pow_of_two() or roundown_pow_of_two() abe more explicit?

...

> +	mask = (1 << fls(mc->max)) - 1;

Ditto.

...

> +	reg_start = (u8 *)(cali_data + (tas_dev->sdw_peripheral->id.unique_id
> +		- TAS2783_ID_MIN) * sizeof(tas2783_cali_reg));

Strange indentation.

> +	for (int i = 0; i < ARRAY_SIZE(tas2783_cali_reg); i++) {
> +		ret = regmap_bulk_write(map, tas2783_cali_reg[i],
> +			&reg_start[4 * i], 4);

Ditto.

> +		if (ret) {
> +			dev_err(tas_dev->dev, "Cali failed %x:%d\n",
> +				tas2783_cali_reg[i], ret);
> +			break;
> +		}
> +	}

...

> +	if (status != 0) {

if (status)

> +		/* Failed got calibration data from EFI. */
> +		dev_dbg(tas_dev->dev, "No calibration data in UEFI.");
> +		return 0;
> +	}

...

> +		/* Date and time of calibration was done. */
> +		time64_to_tm(tmp_val[20], 0, tm);
> +		dev_dbg(tas_dev->dev, "%4ld-%2d-%2d, %2d:%2d:%2d\n",
> +			tm->tm_year, tm->tm_mon, tm->tm_mday,
> +			tm->tm_hour, tm->tm_min, tm->tm_sec);

Use respective %pt

...

> +	img_sz = le32_to_cpup((__le32 *)&buf[offset]);

Potentially broken alignment. In any case this code is bad.
Use get_unaligned_le32() instead.

...

> +		dev_err(tas_dev->dev, "Size not matching, %d %u",
> +			(int)fmw->size, img_sz);

No castings in printf(). It's rarely when you need one. Here is just an
indication of mistype.

...

> +		if (ret != 0) {

		if (ret)

> +			dev_dbg(tas_dev->dev, "Load FW fail: %d.\n", ret);
> +			goto out;
> +		}
> +		offset += sizeof(unsigned int)*5 + p->length;

Missing spaces around '*'. And why magic number? What is it meaning?

...

> +	value_sdw |= ((tas_dev->sdw_peripheral->dev_num & 1) << 4);

Outer parentheses are not needed, perhaps BIT(0) instead of 1 will
be better to understand?

> +static const struct snd_soc_dapm_widget tasdevice_dapm_widgets[] = {
> +	SND_SOC_DAPM_AIF_IN("ASI", "ASI Playback", 0, SND_SOC_NOPM, 0, 0),
> +	SND_SOC_DAPM_AIF_OUT("ASI OUT", "ASI Capture", 0, SND_SOC_NOPM,
> +		0, 0),
> +	SND_SOC_DAPM_OUTPUT("OUT"),
> +	SND_SOC_DAPM_INPUT("DMIC")

Leave trailing comma as it's not a terminator.

> +};
> +
> +static const struct snd_soc_dapm_route tasdevice_audio_map[] = {
> +	{"OUT", NULL, "ASI"},
> +	{"ASI OUT", NULL, "DMIC"}

Ditto.

> +};

...

> +	dev_dbg(dai->dev, "%s %s", __func__, dai->name);

__func__ in dev_dbg() makes a little sense as we may enable it dynamically
(when Dynamic Debug is on). Generally speaking no debug messages should use
__LINE__, __FILE__, or __func__ in the modern kernel code.

...

> +	scnprintf(tas_dev->rca_binaryname, 64, "tas2783-%d-%x.bin",

sizeof() ?

> +		tas_dev->sdw_peripheral->bus->link_id,
> +		tas_dev->sdw_peripheral->id.unique_id);

...

> +out:

Useless label, you can return directly.

> +	return ret;

...

> +out:
> +	return ret;

Ditto.

...

> +	struct  tasdevice_priv *tas_priv = dev_get_drvdata(&slave->dev);

Too many spaces.

...

> +	tas_dev->regmap = devm_regmap_init_sdw(peripheral,
> +		&tasdevice_regmap);

One line?

> +	if (IS_ERR(tas_dev->regmap)) {
> +		ret = PTR_ERR(tas_dev->regmap);
> +		dev_err(dev, "Failed %d of devm_regmap_init_sdw.", ret);
> +	} else
> +		ret = tasdevice_init(tas_dev);
> +
> +	return ret;

	if (IS_ERR(tas_dev->regmap))
		return dev_err_probe(dev, PTR_ERR(tas_dev->regmap),
				     "Failed devm_regmap_init_sdw.");

	return tasdevice_init(tas_dev);

...


> +static int tasdevice_sdw_remove(struct sdw_slave *peripheral)
> +{
> +	struct tasdevice_priv *tas_dev = dev_get_drvdata(&peripheral->dev);
> +
> +	if (tas_dev->first_hw_init)
> +		pm_runtime_disable(tas_dev->dev);
> +
> +	pm_runtime_put_noidle(tas_dev->dev);
> +	return 0;

Are you sure this is correct order of calls as we have a lot of cleaning up
happening here?

> +}

...

> +static const struct sdw_device_id tasdevice_sdw_id[] = {
> +	SDW_SLAVE_ENTRY(0x0102, 0x0000, 0),
> +	{},

No comma for the terminator line.

> +};

> +

Unneeded blank line.

> +MODULE_DEVICE_TABLE(sdw, tasdevice_sdw_id);

...

> +#define TAS2783_PROBE_TIMEOUT 5000

Missing units suffix (_US? _MS?)

> +static int __maybe_unused tas2783_sdca_dev_resume(struct device *dev)

No new code should use __maybe_unused for PM callbacks. Use pm_ptr() and
respective new PM macros.

...

> +static const struct dev_pm_ops tas2783_sdca_pm = {
> +	SET_SYSTEM_SLEEP_PM_OPS(tas2783_sdca_dev_suspend,
> +		tas2783_sdca_dev_resume)
> +	SET_RUNTIME_PM_OPS(tas2783_sdca_dev_suspend,
> +		tas2783_sdca_dev_resume, NULL)
> +};

Use new PM macros.

> +static struct sdw_driver tasdevice_sdw_driver = {
> +	.driver = {
> +		.name = "slave-tas2783",
> +		.pm = &tas2783_sdca_pm,
> +	},
> +	.probe = tasdevice_sdw_probe,
> +	.remove = tasdevice_sdw_remove,
> +	.ops = &tasdevice_sdw_ops,
> +	.id_table = tasdevice_sdw_id,
> +};

> +

Unneeded blank line.

> +module_sdw_driver(tasdevice_sdw_driver);

...

> +#ifndef __TAS2783_H__
> +#define __TAS2783_H__

+ linux/bits.h
+ linux/time.h
+ linux/types.h

+ sound/pcm.h

and so on, use IWYU (include what you use) principle.

Note, for the pointers you may use forward declarations, like

struct device;
struct regmap;

struct snd_soc_component;

-- 
With Best Regards,
Andy Shevchenko


