Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 651363EE9EE
	for <lists+alsa-devel@lfdr.de>; Tue, 17 Aug 2021 11:32:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F2A2815DC;
	Tue, 17 Aug 2021 11:31:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F2A2815DC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1629192763;
	bh=HLxdEp5Ymxl9RBPCfo3Bg6jsAaPXeSvhhmL/eIo0rx4=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Y+Bj2pDwQfKn4IiI9ZrN2htqZ6ylR+2t+a3ZTsu8xO1djekjN1sGmurAg7r5JGbAt
	 1uGdsaocU07dmso9HaU/7ehmHxWDMoiZ36Fzb5a4+ouDYoGYVDLptAiWyiSUqm0IrM
	 AFYtFdw8O/pdww7g4wsxpYobLdaYNtP5H8lIg1qM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 48928F802C4;
	Tue, 17 Aug 2021 11:31:26 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1CD19F80272; Tue, 17 Aug 2021 11:31:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3029EF80111
 for <alsa-devel@alsa-project.org>; Tue, 17 Aug 2021 11:31:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3029EF80111
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="RlHXwuv1"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 17H6CUxx031408; 
 Tue, 17 Aug 2021 04:31:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=PODMain02222019;
 bh=M/vJalDQHO5kVs2xF642zBPJzfMjHZE8JSxgabNU7Qk=;
 b=RlHXwuv1PUYv3EAbALAzXVA9u1ivLM7xdMRa4hxB/6voyr81mS/81GTNLl6Km8erEuaU
 6DCKrcarOF0my/fo3LCj+ospNoXaCjGwxdaV++LP6iYhAq50DYOoJMhLDe4Ng+lHIk79
 Kjpu3RnMu5qDpfrdc+TjUEd5V6TVstNtWUzg/pCmwJcor6VjsRcnYHr2QqGjsuZzM/yc
 iSTtPG1/lOsUeEGkp8LZso8YLfd1Wg5pfQvxkrrFQwS1k1aJaagbhmG+zDUWyXWPEFsB
 CfJf1kIKUSK4bpcsmYg2Ai1s0dH7v0QbHGBniM0OUd905F2LOyy8SE4B9NosMXrTBtQv QA== 
Received: from ediex02.ad.cirrus.com ([87.246.76.36])
 by mx0b-001ae601.pphosted.com with ESMTP id 3ag0gdrncc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Tue, 17 Aug 2021 04:31:12 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.12; Tue, 17 Aug
 2021 10:31:11 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2242.12 via
 Frontend Transport; Tue, 17 Aug 2021 10:31:11 +0100
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com [198.61.86.93])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 27F7246E;
 Tue, 17 Aug 2021 09:31:10 +0000 (UTC)
Date: Tue, 17 Aug 2021 09:31:10 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: David Rhodes <drhodes@opensource.cirrus.com>
Subject: Re: [PATCH v5 1/2] ASoC: cs35l41: CS35L41 Boosted Smart Amplifier
Message-ID: <20210817093110.GK9223@ediswmail.ad.cirrus.com>
References: <20210816224310.344931-1-drhodes@opensource.cirrus.com>
 <20210816224310.344931-2-drhodes@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20210816224310.344931-2-drhodes@opensource.cirrus.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-GUID: eRtlxwt8W2eHlGDtW1hu9e2dun_v9REA
X-Proofpoint-ORIG-GUID: eRtlxwt8W2eHlGDtW1hu9e2dun_v9REA
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 suspectscore=0
 spamscore=0 clxscore=1011 impostorscore=0 lowpriorityscore=0 phishscore=0
 malwarescore=0 bulkscore=0 mlxscore=0 adultscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2107140000
 definitions=main-2108170059
Cc: robh@kernel.org, brian.austin@cirrus.com, patches@opensource.cirrus.com,
 alsa-devel@alsa-project.org, david.rhodes@cirrus.com, broonie@kernel.org,
 pierre-louis.bossart@linux.intel.com
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

On Mon, Aug 16, 2021 at 05:43:09PM -0500, David Rhodes wrote:
> SoC Audio driver for the Cirrus Logic CS35L41 amplifier
> 
> Signed-off-by: David Rhodes <drhodes@opensource.cirrus.com>
> ---
> +++ b/sound/soc/codecs/cs35l41-i2c.c
> @@ -0,0 +1,115 @@
> +/* SPDX-License-Identifier: GPL-2.0
> + *
> + * cs35l41-i2c.c -- CS35l41 I2C driver
> + *
> + * Copyright 2017-2021 Cirrus Logic, Inc.
> + *
> + * Author: David Rhodes <david.rhodes@cirrus.com>
> + */

SPDX headers in the C files need to be //, it's apparently some
tooling thing somewhere that requires the C and H files to be
different. I believe Mark was suggesting you changed this to look
like:

// SPDX-License-Identifier: GPL-2.0
//
// cs35l41-i2c.c -- CS35l41 I2C driver
//
// Copyright 2017-2021 Cirrus Logic, Inc.
//
// Author: David Rhodes <david.rhodes@cirrus.com>

> +bool cs35l41_readable_reg(struct device *dev, unsigned int reg)
> +{
> +	switch (reg) {
<snip>
> +	case CS35L41_TIMER1_CONTROL:
> +	case CS35L41_TIMER1_COUNT_PRESET:
> +	case CS35L41_TIMER1_STATUS:
> +	case CS35L41_TIMER1_COUNT_READBACK:
> +	case CS35L41_TIMER1_DSP_CLK_CFG:
> +	case CS35L41_TIMER1_DSP_CLK_STATUS:
> +	case CS35L41_TIMER2_CONTROL:
> +	case CS35L41_TIMER2_COUNT_PRESET:
> +	case CS35L41_TIMER2_STATUS:
> +	case CS35L41_TIMER2_COUNT_READBACK:
> +	case CS35L41_TIMER2_DSP_CLK_CFG:
> +	case CS35L41_TIMER2_DSP_CLK_STATUS:
> +	case CS35L41_DFT_JTAG_CONTROL:

These should be dropped, these are registers for the firmware
peripherals and will never be used from the driver.

> +static const struct snd_kcontrol_new cs35l41_aud_controls[] = {
> +	SOC_SINGLE_SX_TLV("Digital PCM Volume", CS35L41_AMP_DIG_VOL_CTRL,
> +		      3, 0x4CF, 0x391, dig_vol_tlv),
> +	SOC_SINGLE_TLV("Analog PCM Volume", CS35L41_AMP_GAIN_CTRL, 5, 0x14, 0,
> +			amp_gain_tlv),
> +	SOC_ENUM("PCM Soft Ramp", pcm_sft_ramp),
> +	SOC_SINGLE("Boost Converter Enable", CS35L41_PWR_CTRL2, 4, 3, 0),

Doesn't seem right to have an ALSA control to enable the boost
converter. Controlling high voltages is definitely something that
should be under kernel control.

> +	SOC_SINGLE("Boost Target Voltage", CS35L41_BSTCVRT_VCTRL1, 0, 0xAA, 0),

Ditto here for the boost voltage.

> +	SOC_SINGLE("Weak FET Threshold", CS35L41_WKFET_CFG,
> +				CS35L41_CH_WKFET_THLD_SHIFT, 0xF, 0),
> +	SOC_SINGLE("Weak FET Delay", CS35L41_WKFET_CFG,
> +				CS35L41_CH_WKFET_DLY_SHIFT, 7, 0),

Likewise this weak FET stuff, it looks hardware dependent and
probably shouldn't be in userspace control, the datasheet states:

  The strength of the output drivers is reduced when operating in a
  Weak-FET Drive Mode and must not be used to drive a large load.

Which strongly implies to me this should be in DT/driver control.

> +	SOC_SINGLE("Temp Warn Threshold", CS35L41_DTEMP_WARN_THLD,
> +				0, CS35L41_TEMP_THLD_MASK, 0),

Again temperature warnings don't feel like they should be getting
set through an ALSA control.

> +static int cs35l41_component_probe(struct snd_soc_component *component)
> +{
> +	struct cs35l41_private *cs35l41 =
> +		snd_soc_component_get_drvdata(component);
> +
> +	component->regmap = cs35l41->regmap;

You sure this is necessary? The core should do this for us, its
only necessary if the regmap is on a different struct device to
the CODEC which isn't the case in this driver. Also if this is
necessary it should be using snd_soc_component_init_regmap.

> +static const struct snd_soc_component_driver soc_component_dev_cs35l41 = {
> +	.name = "cs35l41-codec",
> +	.probe = cs35l41_component_probe,
> +
> +	.dapm_widgets = cs35l41_dapm_widgets,
> +	.num_dapm_widgets = ARRAY_SIZE(cs35l41_dapm_widgets),
> +	.dapm_routes = cs35l41_audio_map,
> +	.num_dapm_routes = ARRAY_SIZE(cs35l41_audio_map),
> +
> +	.controls = cs35l41_aud_controls,
> +	.num_controls = ARRAY_SIZE(cs35l41_aud_controls),
> +	.set_sysclk = cs35l41_component_set_sysclk,
> +};
> +
> +
> +

Probably don't need quite so many blank lines here.

> +int cs35l41_probe(struct cs35l41_private *cs35l41,
> +				struct cs35l41_platform_data *pdata)
> +{
> +	u32 regid, reg_revid, i, mtl_revid, int_status, chipid_match;
> +	int irq_pol = 0;
> +	int timeout;
> +	int ret;
> +
> +

Extra blank line.

> +	for (i = 0; i < CS35L41_NUM_SUPPLIES; i++)
> +		cs35l41->supplies[i].supply = cs35l41_supplies[i];
> +
> +	ret = devm_regulator_bulk_get(cs35l41->dev, CS35L41_NUM_SUPPLIES,
> +					cs35l41->supplies);
> +	if (ret != 0) {
> +		dev_err(cs35l41->dev,
> +			"Failed to request core supplies: %d\n",
> +			ret);
> +		return ret;
> +	}
> +
> +	ret = regulator_bulk_enable(CS35L41_NUM_SUPPLIES, cs35l41->supplies);
> +	if (ret != 0) {
> +		dev_err(cs35l41->dev,
> +			"Failed to enable core supplies: %d\n", ret);
> +		return ret;
> +	}
> +
> +	if (pdata) {
> +		cs35l41->pdata = *pdata;
> +	} else {
> +		ret = cs35l41_handle_pdata(cs35l41->dev, &cs35l41->pdata,
> +					     cs35l41);
> +		if (ret != 0) {
> +			ret = -ENODEV;
> +			goto err;
> +		}
> +	}

Any reason to not just parse this before enabling the supplies?
Parsing the pdata shouldn't require the hardware to be enabled
all the settings are being applied through set_pdata later on,
means you can just return on an error as well rather than having
to disable the supplies again. On the topic of errors any reason
this sets all errors to ENODEV, why not return the error that
cs35l41_handle_pdata returned? Seems more helpful.

Thanks,
Charles
