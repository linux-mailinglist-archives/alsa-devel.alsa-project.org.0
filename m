Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3985C89DA0B
	for <lists+alsa-devel@lfdr.de>; Tue,  9 Apr 2024 15:22:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6E1862BCB;
	Tue,  9 Apr 2024 15:22:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6E1862BCB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1712668941;
	bh=masoxDhlXgLCo1KXGygaq1QCZyxhfrMjwYq4hc53AlE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=q+weSQSDNUDQ+4eQyuKtmgFMv+4pKQ5X7d7xIaGjR84Atmzoyf8lFE5DgWFnXPUF8
	 8oyReEwLVEGDO9P/Fo647kXTdbjKXg8+Ln3b5+BZ/YitX7p/3lsE5nXj3rvitkCeW2
	 6/kwjsaGCGj3K+NSI1DlcwKHEL+X3Zungl0wfSrE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0C74BF80587; Tue,  9 Apr 2024 15:21:49 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 324C9F805A0;
	Tue,  9 Apr 2024 15:21:49 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C335BF8026D; Tue,  9 Apr 2024 15:21:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.6 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 568AEF800C9
	for <alsa-devel@alsa-project.org>; Tue,  9 Apr 2024 15:21:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 568AEF800C9
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=ccpQ63R+
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712668899; x=1744204899;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=masoxDhlXgLCo1KXGygaq1QCZyxhfrMjwYq4hc53AlE=;
  b=ccpQ63R+2vOzYRG8X7TtrA4uOpxwtRJ8ix8JcGI5sH4aTaS4RkOjYfI5
   J7jpwbDq0zY9w/ND0tN1U0oVmq2Rv/3FIg6t5BM+tSVoc6ygYwhv493Uo
   nhn16OZ1sZ+RHn1Nr02p6mmoWa07S4ngrfz8ssxQVNUFQnvbPxtAVftCk
   HZPHUYzuog1GTZ1Tyc0ShrqkXccTipdiU+vcLtx7bYZEE3YhqZLoKEb3F
   hTc+fF9ABgs1xYJY/UYChU/eczviSbYRwyW01nb9I6gkyFcF4QPrZQZvD
   kzn25ecYG3Q32mOYDqBMuXbqrlg4vXPOx3jaIgQ5CLJp0Hctn1YoOhzv9
   Q==;
X-CSE-ConnectionGUID: JZlCJEbKSeqCQ4di9hHZ5w==
X-CSE-MsgGUID: O7ExyFsiQl6um3o1vZA1CA==
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="11775834"
X-IronPort-AV: E=Sophos;i="6.07,189,1708416000";
   d="scan'208";a="11775834"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2024 06:21:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="915399687"
X-IronPort-AV: E=Sophos;i="6.07,189,1708416000";
   d="scan'208";a="915399687"
Received: from smile.fi.intel.com (HELO smile) ([10.237.72.54])
  by fmsmga002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2024 06:21:31 -0700
Received: from andy by smile with local (Exim 4.97)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1ruBPk-00000002oTH-0zVa;
	Tue, 09 Apr 2024 16:21:28 +0300
Date: Tue, 9 Apr 2024 16:21:27 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Baojun Xu <baojun.xu@ti.com>
Cc: tiwai@suse.de, robh+dt@kernel.org, lgirdwood@gmail.com, perex@perex.cz,
	pierre-louis.bossart@linux.intel.com, kevin-lu@ti.com,
	shenghao-ding@ti.com, navada@ti.com, alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org, liam.r.girdwood@intel.com,
	yung-chuan.liao@linux.intel.com, broonie@kernel.org, soyer@irl.hu
Subject: Re: [PATCH v2 2/3] ALSA: hda/tas2781: Main code of tas2781 driver
 for SPI
Message-ID: <ZhVA1_HTET4Q4T9d@smile.fi.intel.com>
References: <20240409024816.1180-1-baojun.xu@ti.com>
 <20240409024816.1180-3-baojun.xu@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240409024816.1180-3-baojun.xu@ti.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Message-ID-Hash: XGQO5KB4O7AB7OOCQZQVLJJ4MSNCG7FT
X-Message-ID-Hash: XGQO5KB4O7AB7OOCQZQVLJJ4MSNCG7FT
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/XGQO5KB4O7AB7OOCQZQVLJJ4MSNCG7FT/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, Apr 09, 2024 at 10:48:14AM +0800, Baojun Xu wrote:
> Main source code for tas2781 driver for SPI.

...

> +#ifndef __TAS2781_SPI_H__
> +#define __TAS2781_SPI_H__

+ bits.h
+ mutex.h
+ time.h? (for struct tm)
+ types.h

struct calidata is from?..

> +#include <sound/tas2781-dsp.h>

Not sure how this is being used.

Also some forward declarations:

+ struct device;
+ struct firmware;
+ struct gpio_desc;
+ struct regmap;

(I might missed something)

...

> +#define TASDEVICE_RATES			(SNDRV_PCM_RATE_44100 |\
> +	SNDRV_PCM_RATE_48000 | SNDRV_PCM_RATE_96000 |\
> +	SNDRV_PCM_RATE_88200)

For lines likes this, the formatting can be

#define TASDEVICE_RATES							      \
	(SNDRV_PCM_RATE_44100 | SNDRV_PCM_RATE_48000 | SNDRV_PCM_RATE_96000 | \
	 SNDRV_PCM_RATE_88200)

which from my p.o.v. looks better.

...

> +#define TAS2781_SPI_MAX_FREQ		4000000

4 * HZZ_PER_MHZ ?

...

> +enum device_catlog_id {

Too generic name.

> +	HP = 0,
> +	OTHERS

Ditto. Please, add namespace.

> +};

...

> +#include <linux/acpi.h>
> +#include <linux/crc8.h>
> +#include <linux/crc32.h>
> +#include <linux/efi.h>
> +#include <linux/firmware.h>
> +#include <linux/mod_devicetable.h>
> +#include <linux/module.h>
> +#include <linux/pm_runtime.h>

+ property.h

> +#include <linux/regmap.h>
> +#include <linux/spi/spi.h>
> +#include <sound/hda_codec.h>
> +#include <sound/soc.h>
> +#include <sound/tlv.h>
> +#include <sound/tas2781-tlv.h>

...

> +/* No standard control callbacks for SNDRV_CTL_ELEM_IFACE_CARD
> + * Define two controls, one is Volume control callbacks, the other is
> + * flag setting control callbacks.
> + */

/*
 * Follow the example of the multi-line
 * comments style as in this comment. Apply
 * it to all your comments.
 */

...

> +	.private_value = (unsigned long)&(struct soc_mixer_control) \
> +		{.reg = xreg, .rreg = xreg, .shift = xshift, \
> +		 .rshift = xshift, .min = xmin, .max = xmax, \
> +		 .invert = xinvert} }

It is unreadable.

	.private_value = (unsigned long)&(struct soc_mixer_control) {	      \
		.reg = xreg, .rreg = xreg, .shift = xshift, .rshift = xshift, \
		.min = xmin, .max = xmax, .invert = xinvert,		      \
	},								      \


See the difference?

Please, apply this to all twisted macros:
- logical split
- leaving trailing commas
- better formatting

...

> +		.range_max = 256 * 128,

Perhaps you want to define this as it's used a lot in the C and header files.

...

> +static const struct regmap_config tasdevice_regmap = {
> +	.reg_bits = 8,
> +	.val_bits = 8,
> +	.cache_type = REGCACHE_NONE,
> +	.ranges = tasdevice_ranges,
> +	.num_ranges = ARRAY_SIZE(tasdevice_ranges),
> +	.max_register = 256 * 128,
> +};
> +
> +

One too many blank lines.

> +static void tas2781_spi_reset(struct tasdevice_priv *tas_dev);
> +static int tasdevice_spi_init(struct tasdevice_priv *tas_priv);
> +static int tasdevice_spi_amp_putvol(struct tasdevice_priv *tas_priv,
> +	struct snd_ctl_elem_value *ucontrol, struct soc_mixer_control *mc);
> +static int tasdevice_spi_amp_getvol(struct tasdevice_priv *tas_priv,
> +	struct snd_ctl_elem_value *ucontrol, struct soc_mixer_control *mc);
> +static int tasdevice_spi_digital_putvol(struct tasdevice_priv *tas_priv,
> +	struct snd_ctl_elem_value *ucontrol, struct soc_mixer_control *mc);
> +static int tasdevice_spi_digital_getvol(struct tasdevice_priv *tas_priv,
> +	struct snd_ctl_elem_value *ucontrol, struct soc_mixer_control *mc);

Why do you need forward declarations here?

...

> +static int tasdevice_spi_switch_book(struct tasdevice_priv *tas_priv,
> +	int book)

Can be on a single line.

> +{
> +	struct tasdevice *tasdev = &tas_priv->tasdevice;
> +	struct regmap *map = tas_priv->regmap;
> +	int ret = 0;
> +
> +	if (tasdev->cur_book != book) {
> +		/* Change to page 0 before book change. */
> +		ret = regmap_write(map, TASDEVICE_PAGE_SELECT, 0);
> +		if (ret < 0) {
> +			dev_err(tas_priv->dev, "%s, E=%d\n", __func__, ret);
> +			return ret;
> +		}
> +		ret = regmap_write(map, TASDEVICE_BOOKCTL_REG, book);
> +		if (ret < 0)
> +			dev_err(tas_priv->dev, "%s, E=%d\n", __func__, ret);

Non-fatal error?

> +		tasdev->cur_book = book;
> +	}
> +
> +	return ret;
> +}

...

> +int tasdevice_spi_dev_read(struct tasdevice_priv *tas_priv,
> +	unsigned int reg, unsigned int *val)
> +{
> +	struct regmap *map = tas_priv->regmap;
> +	int ret;
> +
> +	ret = tasdevice_spi_switch_book(tas_priv, TASDEVICE_BOOK_ID(reg));
> +	if (ret < 0)
> +		return ret;
> +
> +	/*
> +	 * In our TAS2781 SPI mode, if read from other book (not book 0),
> +	 * or read from page number larger than 1 in book 0, one byte more
> +	 * read is needed, and first byte is a dummy byte, need to be ignored.
> +	 */
> +	if ((TASDEVICE_BOOK_ID(reg) > 0) || (TASDEVICE_PAGE_ID(reg) > 1)) {
> +		unsigned char data[2];
> +
> +		ret = regmap_bulk_read(map, TASDEVICE_PGRG(reg), data, 2);

sizeof(data) ?

> +		*val = data[1];
> +	} else {
> +		ret = regmap_read(map, TASDEVICE_PGRG(reg), val);
> +	}
> +	if (ret < 0)
> +		dev_err(tas_priv->dev, "%s, E=%d\n", __func__, ret);
> +
> +	return ret;
> +}
> +EXPORT_SYMBOL_GPL(tasdevice_spi_dev_read);

No namespace, why?

...

> +	return ret;
> +
> +}

Here and in other places, one too many blank lines.

...

> +	static const unsigned char page_array[CALIB_MAX] = {
> +		0x17, 0x18, 0x18, 0x13, 0x18

Leave trailing comma, can be helpful in the future.

> +	};
> +	static const unsigned char rgno_array[CALIB_MAX] = {
> +		0x74, 0x0c, 0x14, 0x70, 0x7c

Ditto.

> +	};


...

> +	data = tas_priv->cali_data.data +
> +		tas_priv->index * TASDEVICE_SPEAKER_CALIBRATION_SIZE;
> +	for (j = 0; j < CALIB_MAX; j++) {
> +		rc = tasdevice_spi_dev_bulk_write(tas_priv,
> +			TASDEVICE_REG(0, page_array[j], rgno_array[j]),
> +			&(data[4 * j]), 4);
> +		if (rc < 0)
> +			dev_err(tas_priv->dev,
> +				"chn %d calib %d bulk_wr err = %d\n",
> +				tas_priv->index, j, rc);

The indentation here and in some other places is a mess. Please,
take your time to split these in more readable way.

> +	}
> +

Again, too many unneeded blank lines in the code.

> +}

...

I stopped here as there are already enough for next version.

-- 
With Best Regards,
Andy Shevchenko


