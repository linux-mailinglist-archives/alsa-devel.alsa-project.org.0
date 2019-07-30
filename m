Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B9227ACCC
	for <lists+alsa-devel@lfdr.de>; Tue, 30 Jul 2019 17:51:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C2CAF17B7;
	Tue, 30 Jul 2019 17:50:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C2CAF17B7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1564501904;
	bh=07vd4dXxphRG5OCCcpmY9fgXCVn2k+kbTe7P8gP+0fI=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=E23C/VvvTbmuH33UoXN8YaKzeOaDbc1ndIkB8XfphIqyLzn2LpjOg1AKtxaUfY7l7
	 ohkgKRIyPk4ubqIr2eHY2s/GDHRz3ZDysu1TGHAMTMiWbFl8lOCmMsB6EryJpBesug
	 57XM7nqRw2XIAiCvWitbDJ+LcqNMjPRhSu8Hv3jM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4585FF80482;
	Tue, 30 Jul 2019 17:50:00 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0CEABF804CA; Tue, 30 Jul 2019 17:49:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_PASS,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from imap1.codethink.co.uk (imap1.codethink.co.uk [176.9.8.82])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 97283F80214
 for <alsa-devel@alsa-project.org>; Tue, 30 Jul 2019 17:49:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 97283F80214
Received: from [167.98.27.226] (helo=[10.35.6.253])
 by imap1.codethink.co.uk with esmtpsa (Exim 4.84_2 #1 (Debian))
 id 1hsUNZ-0001X8-C3; Tue, 30 Jul 2019 16:49:33 +0100
To: Charles Keepax <ckeepax@opensource.cirrus.com>
References: <20190730120937.16271-1-thomas.preston@codethink.co.uk>
 <20190730120937.16271-3-thomas.preston@codethink.co.uk>
 <20190730123825.GG54126@ediswmail.ad.cirrus.com>
From: Thomas Preston <thomas.preston@codethink.co.uk>
Message-ID: <4285701d-ae61-208b-8f38-ac44e77ad9b5@codethink.co.uk>
Date: Tue, 30 Jul 2019 16:49:32 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190730123825.GG54126@ediswmail.ad.cirrus.com>
Content-Language: en-US
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, Patrick Glaser <pglaser@tesla.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Kirill Marinushkin <kmarinushkin@birdec.tech>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Marco Felsch <m.felsch@pengutronix.de>,
 Annaliese McDermond <nh6z@nh6z.net>, linux-kernel@vger.kernel.org,
 Paul Cercueil <paul@crapouillou.net>, Vinod Koul <vkoul@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Rob Duncan <rduncan@tesla.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Nate Case <ncase@tesla.com>, Cheng-Yi Chiang <cychiang@chromium.org>
Subject: Re: [alsa-devel] [PATCH v2 2/3] ASoC: Add codec driver for ST
	TDA7802
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On 30/07/2019 13:38, Charles Keepax wrote:
> On Tue, Jul 30, 2019 at 01:09:36PM +0100, Thomas Preston wrote:
>> Add an I2C based codec driver for ST TDA7802 amplifier. The amplifier
>> supports 4 audio channels but can support up to 16 with multiple
>> devices.
>>
>> Signed-off-by: Thomas Preston <thomas.preston@codethink.co.uk>
>> Cc: Patrick Glaser <pglaser@tesla.com>
>> Cc: Rob Duncan <rduncan@tesla.com>
>> Cc: Nate Case <ncase@tesla.com>
>> ---
>> Changes since v1:
>> - Use ALSA kcontrol interface to expose device controls to userland
>> 	- Gain
>> 	- Channel diagnostic mode
>> 	- Impedance efficiency optimiser. I decided against setting this
>> 	  as a DT property since it seems like something that can be
>> 	  changed on the fly.
>> - Add regmap default values
>> 	- Channel unmute by default is added in a downstream patch.
>> 	- I'm not sure if I should keep this since they're all zero,
>> 	  although there are other drivers will all-zero reg_defaults.
>> - I believe the "//" style is used for SPDX headers in normal C source files.
>>   https://lwn.net/Articles/739183/
>> - Drop the "enable" sysfs device attribute.
>> - Don't set TDM format using magic numbers.
>> - Set sample rate using hw_params.
>> - Remove unecessary defines.
>> - Use DAPM to handle AMP_ON.
>> - Cosmetic fixups
>>
>>  sound/soc/codecs/Kconfig   |   6 +
>>  sound/soc/codecs/Makefile  |   2 +
>>  sound/soc/codecs/tda7802.c | 509 +++++++++++++++++++++++++++++++++++++
>>  3 files changed, 517 insertions(+)
>>  create mode 100644 sound/soc/codecs/tda7802.c
>>
>> +++ b/sound/soc/codecs/tda7802.c
>> @@ -0,0 +1,509 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +/*
>> + * tda7802.c  --  codec driver for ST TDA7802
>> + *
>> + * Copyright (C) 2016-2019 Tesla Motors, Inc.
>> + */
> 
> Better to make the whole comment // see something like
> sound/soc/codecs/cs47l35.c for an example.
> 

I will update to "//" style. Is this a new standard? There aren't many
comments like that in 4.14 (my target kernel) - I can see a lot more
in 5.3.

My intention was:

1. Apply the SPDX rules to SPDX bit.     Documentation/process/license-rules.rst
2. Use multi-line comments for the rest. Documentation/process/coding-style.rst

>> +static int tda7802_set_bias_level(struct snd_soc_component *component,
>> +		enum snd_soc_bias_level level)
>> +{
>> +	const struct tda7802_priv *tda7802 =
>> +		snd_soc_component_get_drvdata(component);
>> +	struct snd_soc_dapm_context *dapm_context =
>> +			snd_soc_component_get_dapm(component);
>> +	const enum snd_soc_bias_level oldlevel =
>> +		snd_soc_dapm_get_bias_level(dapm_context);
>> +	int err = 0;
>> +
>> +	dev_dbg(component->dev, "%s level %d\n", __func__, level);
>> +
>> +	switch (level) {
>> +	case SND_SOC_BIAS_ON:
>> +		break;
>> +	case SND_SOC_BIAS_PREPARE:
>> +		break;
>> +	case SND_SOC_BIAS_STANDBY:
>> +		err = regulator_enable(tda7802->enable_reg);
>> +		if (err < 0) {
>> +			dev_err(component->dev, "Could not enable.\n");
>> +			return err;
>> +		}
>> +		dev_dbg(component->dev, "Regulator enabled\n");
>> +		msleep(ENABLE_DELAY_MS);
>> +
>> +		if (oldlevel == SND_SOC_BIAS_OFF) {
>> +			dev_dbg(component->dev, "Syncing regcache\n");
>> +			err = regcache_sync(component->regmap);
>> +			if (err < 0)
>> +				dev_err(component->dev,
>> +					"Could not sync regcache, %d\n", err);
> 
> If your doing a regcache_sync I would probably have expected to
> see calls to regcache_cache_only.
> 
> If the device needs syncing that implies the hardware registers
> have lost state, so there is little point in writing to them
> if they are unavailable/about to loose their state.
> 

Ah, from the comments I thought I only needed to call regcache_mark_dirty...

>> +		}
>> +		break;
>> +	case SND_SOC_BIAS_OFF:
>> +		regcache_mark_dirty(component->regmap);
>> +		err = regulator_disable(tda7802->enable_reg);
>> +		if (err < 0)
>> +			dev_err(component->dev, "Could not disable.\n");
>> +		break;
>> +	}
>> +
>> +	return err;
>> +}

So I think the correct order is:

device_off:
	regcache_cache_only
	power-off (enable)
	regcache_mark_dirty

device_on:
	power-on (enable)
	regcache_sync

I will double-check the register state is actually lost too. Fiddling
with the cache might be completely unnecessary.

Many thanks
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
