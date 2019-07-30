Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C59C7A8CF
	for <lists+alsa-devel@lfdr.de>; Tue, 30 Jul 2019 14:40:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C368D17E3;
	Tue, 30 Jul 2019 14:39:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C368D17E3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1564490425;
	bh=2jjzIMF6j4ak/XD0YKpiTRMOvEZhXthS6CbgiS+cOzk=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fjfN4Ww9yz5/gAJ/tT4hNYRTDryP1UopoOTX/NKLr9RhGAKIWA8d9y9Q3XNXTDsmj
	 l1e6eJRrM37glehmzwK/TQPmwxtsDO6lj0imFedwvD8wuynv7FpaURPB+WgnBwkQWW
	 Otv+wGg+A3yTLP9y4K1BPNVL1JcG5uKOUyQesQ18=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 045A1F804CB;
	Tue, 30 Jul 2019 14:38:41 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 74C65F804CA; Tue, 30 Jul 2019 14:38:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B323AF80214
 for <alsa-devel@alsa-project.org>; Tue, 30 Jul 2019 14:38:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B323AF80214
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="fqB7AJK2"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 x6UCXjXq021707; Tue, 30 Jul 2019 07:38:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=PODMain02222019;
 bh=6HCkdIwaoyyCwQknwT42TOpVmmhCKXspp52zKlcFeyo=;
 b=fqB7AJK2Us/yKa/m8XKIw+52gadnVyb7wkhGgZXZ7B7AtnaZ9G/IZieauUPQrSJIFunq
 AVcakZwFCfHMgrFZ2RGeUTwk6pYHPudLaO+4zgRBe2PrKUBUQlnvEYCna7j1Rka6S5aH
 WFtQmNDnSn5f9NbdnGelbYXAPzzjtxiKyMxgKecCnFzOwf9lng5uZbnf/r3IJzM1XZgH
 FJBk5wko7bplEmNTgYs5FqwZX6dDZweqQKIaaNy8RyT99epPf7l+OuKRIavO3NTIPO+L
 KK1RUHmNHWBgthQ7AnA/tJdtpZd0fSJAGRIVQHKSTC+uBmnG7d+FFJAxAqTZ+TXnBY2o cA== 
Authentication-Results: ppops.net;
 spf=fail smtp.mailfrom=ckeepax@opensource.cirrus.com
Received: from ediex01.ad.cirrus.com ([87.246.76.36])
 by mx0a-001ae601.pphosted.com with ESMTP id 2u0mapmtdu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Tue, 30 Jul 2019 07:38:28 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1591.10; Tue, 30 Jul
 2019 13:38:25 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.1591.10 via
 Frontend Transport; Tue, 30 Jul 2019 13:38:25 +0100
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com [198.61.86.93])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 06F0745;
 Tue, 30 Jul 2019 13:38:25 +0100 (BST)
Date: Tue, 30 Jul 2019 13:38:25 +0100
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Thomas Preston <thomas.preston@codethink.co.uk>
Message-ID: <20190730123825.GG54126@ediswmail.ad.cirrus.com>
References: <20190730120937.16271-1-thomas.preston@codethink.co.uk>
 <20190730120937.16271-3-thomas.preston@codethink.co.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190730120937.16271-3-thomas.preston@codethink.co.uk>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-SPF-Result: fail
X-Proofpoint-SPF-Record: v=spf1 include:spf-001ae601.pphosted.com
 include:spf.protection.outlook.com -all
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 bulkscore=0 phishscore=0
 impostorscore=0 clxscore=1015 suspectscore=0 spamscore=0
 lowpriorityscore=0 mlxlogscore=999 priorityscore=1501 mlxscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1906280000 definitions=main-1907300132
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, Marco Felsch <m.felsch@pengutronix.de>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Kirill Marinushkin <kmarinushkin@birdec.tech>,
 Cheng-Yi Chiang <cychiang@chromium.org>, linux-kernel@vger.kernel.org,
 Nate Case <ncase@tesla.com>, Takashi Iwai <tiwai@suse.com>,
 Rob Herring <robh+dt@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Paul Cercueil <paul@crapouillou.net>, Vinod Koul <vkoul@kernel.org>,
 Mark Brown <broonie@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Annaliese McDermond <nh6z@nh6z.net>, Rob Duncan <rduncan@tesla.com>,
 Patrick Glaser <pglaser@tesla.com>, Jerome Brunet <jbrunet@baylibre.com>
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

On Tue, Jul 30, 2019 at 01:09:36PM +0100, Thomas Preston wrote:
> Add an I2C based codec driver for ST TDA7802 amplifier. The amplifier
> supports 4 audio channels but can support up to 16 with multiple
> devices.
> 
> Signed-off-by: Thomas Preston <thomas.preston@codethink.co.uk>
> Cc: Patrick Glaser <pglaser@tesla.com>
> Cc: Rob Duncan <rduncan@tesla.com>
> Cc: Nate Case <ncase@tesla.com>
> ---
> Changes since v1:
> - Use ALSA kcontrol interface to expose device controls to userland
> 	- Gain
> 	- Channel diagnostic mode
> 	- Impedance efficiency optimiser. I decided against setting this
> 	  as a DT property since it seems like something that can be
> 	  changed on the fly.
> - Add regmap default values
> 	- Channel unmute by default is added in a downstream patch.
> 	- I'm not sure if I should keep this since they're all zero,
> 	  although there are other drivers will all-zero reg_defaults.
> - I believe the "//" style is used for SPDX headers in normal C source files.
>   https://lwn.net/Articles/739183/
> - Drop the "enable" sysfs device attribute.
> - Don't set TDM format using magic numbers.
> - Set sample rate using hw_params.
> - Remove unecessary defines.
> - Use DAPM to handle AMP_ON.
> - Cosmetic fixups
> 
>  sound/soc/codecs/Kconfig   |   6 +
>  sound/soc/codecs/Makefile  |   2 +
>  sound/soc/codecs/tda7802.c | 509 +++++++++++++++++++++++++++++++++++++
>  3 files changed, 517 insertions(+)
>  create mode 100644 sound/soc/codecs/tda7802.c
> 
> +++ b/sound/soc/codecs/tda7802.c
> @@ -0,0 +1,509 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * tda7802.c  --  codec driver for ST TDA7802
> + *
> + * Copyright (C) 2016-2019 Tesla Motors, Inc.
> + */

Better to make the whole comment // see something like
sound/soc/codecs/cs47l35.c for an example.

> +static int tda7802_set_bias_level(struct snd_soc_component *component,
> +		enum snd_soc_bias_level level)
> +{
> +	const struct tda7802_priv *tda7802 =
> +		snd_soc_component_get_drvdata(component);
> +	struct snd_soc_dapm_context *dapm_context =
> +			snd_soc_component_get_dapm(component);
> +	const enum snd_soc_bias_level oldlevel =
> +		snd_soc_dapm_get_bias_level(dapm_context);
> +	int err = 0;
> +
> +	dev_dbg(component->dev, "%s level %d\n", __func__, level);
> +
> +	switch (level) {
> +	case SND_SOC_BIAS_ON:
> +		break;
> +	case SND_SOC_BIAS_PREPARE:
> +		break;
> +	case SND_SOC_BIAS_STANDBY:
> +		err = regulator_enable(tda7802->enable_reg);
> +		if (err < 0) {
> +			dev_err(component->dev, "Could not enable.\n");
> +			return err;
> +		}
> +		dev_dbg(component->dev, "Regulator enabled\n");
> +		msleep(ENABLE_DELAY_MS);
> +
> +		if (oldlevel == SND_SOC_BIAS_OFF) {
> +			dev_dbg(component->dev, "Syncing regcache\n");
> +			err = regcache_sync(component->regmap);
> +			if (err < 0)
> +				dev_err(component->dev,
> +					"Could not sync regcache, %d\n", err);

If your doing a regcache_sync I would probably have expected to
see calls to regcache_cache_only.

If the device needs syncing that implies the hardware registers
have lost state, so there is little point in writing to them
if they are unavailable/about to loose their state.

> +		}
> +		break;
> +	case SND_SOC_BIAS_OFF:
> +		regcache_mark_dirty(component->regmap);
> +		err = regulator_disable(tda7802->enable_reg);
> +		if (err < 0)
> +			dev_err(component->dev, "Could not disable.\n");
> +		break;
> +	}
> +
> +	return err;
> +}

Thanks,
Charles
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
