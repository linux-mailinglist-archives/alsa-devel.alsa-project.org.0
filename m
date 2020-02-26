Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ADCEF16FD4E
	for <lists+alsa-devel@lfdr.de>; Wed, 26 Feb 2020 12:20:22 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 323AD166F;
	Wed, 26 Feb 2020 12:19:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 323AD166F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1582716022;
	bh=K1FAKOLW1wq4KF6KztY04dRMHK27V37g7sRLFs61MwY=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=EKkF5P70ex086SmN8achY/vFPWO4tPk5Sk8Td88VFh5tWn4QkzMtL1si+3+96vLtW
	 cUmUiyhIQ/tGvqP1h7KbYaaAtHnrVRd1DhsK11YbNH3h5rWRdDMt9w8JOGHPz2kzkf
	 W1K+CbIsyLOpMkKgcD2AeBnbgChdWnttymGcDmms=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 422FAF80089;
	Wed, 26 Feb 2020 12:18:41 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 69EA8F8014E; Wed, 26 Feb 2020 12:18:39 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8C0FBF80089
 for <alsa-devel@alsa-project.org>; Wed, 26 Feb 2020 12:18:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8C0FBF80089
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=axis.com header.i=@axis.com
 header.b="XtTE0RIr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=axis.com; l=3583; q=dns/txt; s=axis-central1;
 t=1582715917; x=1614251917;
 h=date:from:to:cc:subject:in-reply-to:message-id:
 references:mime-version:content-transfer-encoding;
 bh=Hv403MB3fJ/nudFxpKI8mhxgcwJ2vMWrIa/zuMIGGwQ=;
 b=XtTE0RIrG4GRXHtYUPUi96QKZ0ZDMn/2Cg0zeLXOhQN9NjwfPbNC8Qpg
 xozfGwOqYx/5jTb6Wng1NswGT2vKx2qVv/N2oFHwaT5CjdtJjD12Wnz6K
 +Op7Z447CfgnSWAgB7fwdr3TgNY0+VWksHEgxSja3mY7UmIXNqxsbAyXb
 ZkVkxewq6tcWveyHP18fv2bpxM2Ulve8tZRyH2wRlH6laHEgkPcyuAR8n
 1UnMtUbzAn8RBJscbTAtA+jhBm5NGnwlhHaK5NBEo6qi3GMDcNvvEjkhV
 wJ35lIhTDlLYTuKgOJjq1Ssl4oD9wLEC8TA3Ze3TQD2Fg4bfJeCTNvOIB A==;
IronPort-SDR: xNdLtj/Y/Zx3jbKBFF2d3A3R47JOypJ8M83BBv6Q9VLihj3+LMJOEhD/UN9Cj1efQMcpEgvUde
 DuhCA4VfSOoVk4G3yy/SMaEI0kWPvHaSasS+yaCt30UJFACCWfCcYlqscgK1VfTGbnQsyCFqME
 XXmqEqad0PyAqXjmQvzucku77Z7FqdkE3nP404btD1qxtt53E/Mco/Gm+pcCx0CyYxIbtU8xvQ
 IEPUVo8hQY9cRlJvBFi5m9PCaTC8lGnnFMH5QSecqwpukYq8G/MJ85gSEr6MRI3GvjtIjU99zD
 xEg=
X-IronPort-AV: E=Sophos;i="5.70,487,1574118000"; 
   d="scan'208";a="5677792"
Date: Wed, 26 Feb 2020 12:18:29 +0100
From: Ricard Wanderlof <ricardw@axis.com>
X-X-Sender: ricardw@lnxricardw1.se.axis.com
To: Dan Murphy <dmurphy@ti.com>
Subject: Re: [PATCH v3 2/2] ASoC: tlv320adcx140: Add the tlv320adcx140 codec
 driver family
In-Reply-To: <20200219125942.22013-3-dmurphy@ti.com>
Message-ID: <alpine.DEB.2.20.2002261138040.19469@lnxricardw1.se.axis.com>
References: <20200219125942.22013-1-dmurphy@ti.com>
 <20200219125942.22013-3-dmurphy@ti.com>
User-Agent: Alpine 2.20 (DEB 67 2015-01-07)
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-15"
Content-Transfer-Encoding: 8BIT
X-Originating-IP: [10.0.5.60]
X-ClientProxiedBy: XBOX02.axis.com (10.0.5.16) To XBOX03.axis.com (10.0.5.17)
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "tiwai@suse.com" <tiwai@suse.com>, "broonie@kernel.org" <broonie@kernel.org>
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


On Wed, 19 Feb 2020, Dan Murphy wrote:

> Add the tlv320adcx140 codec driver family.
>

...

> +
> +static int adcx140_set_dai_fmt(struct snd_soc_dai *codec_dai,
> +                              unsigned int fmt)
> +{
> +       struct snd_soc_component *component = codec_dai->component;
> +       struct adcx140_priv *adcx140 =
> snd_soc_component_get_drvdata(component);
> +       u8 iface_reg1 = 0;
> +       u8 iface_reg2 = 0;
> +
> +       /* set master/slave audio interface */
> +       switch (fmt & SND_SOC_DAIFMT_MASTER_MASK) {
> +       case SND_SOC_DAIFMT_CBM_CFM:
> +               iface_reg2 |= ADCX140_BCLK_FSYNC_MASTER;

Although this sets up the codec to be I2S master, there doesn't seem to be 
a way of actually configuring the master clock frequency in master mode, 
as there is no .set_sysclk member in adcx140_dai_ops (and the 
corresponding register field appears never to be touched by the driver).

> +               break;
> +       case SND_SOC_DAIFMT_CBS_CFS:
> +               break;
> +       case SND_SOC_DAIFMT_CBS_CFM:
> +       case SND_SOC_DAIFMT_CBM_CFS:
> +       default:
> +               dev_err(component->dev, "Invalid DAI master/slave interface\n");
> +               return -EINVAL;
> +       }

...

> +
> +static int adcx140_codec_probe(struct snd_soc_component *component)
> +{
> +       struct adcx140_priv *adcx140 =
> snd_soc_component_get_drvdata(component);
> +       int sleep_cfg_val = ADCX140_WAKE_DEV;
> +       u8 bias_source;
> +       u8 vref_source;
> +       int ret;
> +
> +       ret = device_property_read_u8(adcx140->dev, "ti,mic-bias-source",
> +                                     &bias_source);
> +       if (ret)
> +               bias_source = ADCX140_MIC_BIAS_VAL_VREF;
> +
> +       if (bias_source != ADCX140_MIC_BIAS_VAL_VREF &&
> +           bias_source != ADCX140_MIC_BIAS_VAL_VREF_1096 &&
> +           bias_source != ADCX140_MIC_BIAS_VAL_AVDD) {
> +               dev_err(adcx140->dev, "Mic Bias source value is invalid\n");
> +               return -EINVAL;
> +       }
> +
> +       ret = device_property_read_u8(adcx140->dev, "ti,vref-source",
> +                                     &vref_source);
> +       if (ret)
> +               vref_source = ADCX140_MIC_BIAS_VREF_275V;
> +
> +       if (vref_source != ADCX140_MIC_BIAS_VREF_275V &&
> +           vref_source != ADCX140_MIC_BIAS_VREF_25V &&
> +           vref_source != ADCX140_MIC_BIAS_VREF_1375V) {

According to the data sheet, this setting controls the ADC full scale 
setting and has nothing to do with the mic bias voltage, hence using 
MIC_BIAS as part of the macro name is misleaading.

> +               dev_err(adcx140->dev, "Mic Bias source value is invalid\n");

Error text does not reflect the actual error, suggest "VREF value is 
invalid".

> +               return -EINVAL;
> +       }
> +
> +       bias_source |= vref_source;
> +
> +       ret = adcx140_reset(adcx140);
> +       if (ret)
> +               goto out;
> +
> +       if(adcx140->supply_areg == NULL)
> +               sleep_cfg_val |= ADCX140_AREG_INTERNAL;
> +
> +       ret = regmap_write(adcx140->regmap, ADCX140_SLEEP_CFG,
> sleep_cfg_val);
> +       if (ret) {
> +               dev_err(adcx140->dev, "setting sleep config failed %d\n",
> ret);
> +               goto out;
> +       }
> --
> 2.25.0
> 
> 
> 

/Ricard
-- 
Ricard Wolf Wanderlof                           ricardw(at)axis.com
Axis Communications AB, Lund, Sweden            www.axis.com
Phone +46 46 272 2016                           Fax +46 46 13 61 30
