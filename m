Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 65FF23971D0
	for <lists+alsa-devel@lfdr.de>; Tue,  1 Jun 2021 12:50:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EAEE1169A;
	Tue,  1 Jun 2021 12:49:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EAEE1169A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1622544625;
	bh=jyIoFvZ2/hY7g6Z2Qczlp5Q6QH/2JyHtUHp938nZ6i8=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=CvIPN9iI8w0dtuUB960jHpa1VgnaS5DX3CL7Q0ioRgAmYcmCdrDonu4t5ck9kKVxJ
	 0b3O8/mx4KpjUsNd/gDDM/588qtXZsch75xzM9MjegeG1BWsQf9IoiIaYBXfkJ7jJA
	 LCk6wsxX+lmOgjZtwEcqz5DIlIE52lJjkOxlOtaA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 56BCBF801DB;
	Tue,  1 Jun 2021 12:48:56 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6960EF80254; Tue,  1 Jun 2021 12:48:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6008FF80141
 for <alsa-devel@alsa-project.org>; Tue,  1 Jun 2021 12:48:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6008FF80141
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="ell3H6KK"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 151AfwZl031077; Tue, 1 Jun 2021 05:48:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=PODMain02222019;
 bh=hEgeoO+81taurZTMP4Zr+gkHN5FUBFAs5CEU7riD9q8=;
 b=ell3H6KKWpj5m57gojrZcxYifuWAKJtN6t2buSBWmCfaQKnfRdbMUej4l2l9v9siOZcP
 IhrCBwD4w8RLpLQvAkULmcT5HHzy6YS5vvyG+2r1TYE2FwdhVm0mq1GjsfGVfxidjiE+
 A8QwzxGKldLYEwBQqs/7LhhaPG1zq94kXyAbfMWFVHMUI1EtuayL6lIOXbRex8dfsyPr
 z1bCG4Tnt+QaxnxzRMYTxI5wF3h1w9nPhdE9tiOzLQDdMH3UOghVab/7ipBuR7uiyrdP
 fCzIVRpXlvqmIlUQ8U6LXNzJrnvdTXM+698oO26+KWI0Gj1JKvg0vd+TP/Qwq2f82FIU JA== 
Received: from ediex02.ad.cirrus.com ([87.246.76.36])
 by mx0b-001ae601.pphosted.com with ESMTP id 38vv1ns4pm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Tue, 01 Jun 2021 05:48:38 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Tue, 1 Jun 2021
 11:48:37 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2242.4 via Frontend
 Transport; Tue, 1 Jun 2021 11:48:37 +0100
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com [198.61.86.93])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 32DE3464;
 Tue,  1 Jun 2021 10:48:37 +0000 (UTC)
Date: Tue, 1 Jun 2021 10:48:37 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: David Rhodes <drhodes@opensource.cirrus.com>
Subject: Re: [PATCH 1/2] ASoC: cs35l41: CS35L41 Boosted Smart Amplifier
Message-ID: <20210601104837.GB9223@ediswmail.ad.cirrus.com>
References: <20210601013731.2744163-1-drhodes@opensource.cirrus.com>
 <20210601013731.2744163-2-drhodes@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20210601013731.2744163-2-drhodes@opensource.cirrus.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-ORIG-GUID: NuzzveZd_5q3PfsMq38NwYuXW-W92k2z
X-Proofpoint-GUID: NuzzveZd_5q3PfsMq38NwYuXW-W92k2z
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 mlxscore=0 suspectscore=0
 clxscore=1015 priorityscore=1501 mlxlogscore=999 impostorscore=0
 bulkscore=0 phishscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2106010072
Cc: patches@opensource.cirrus.com, brian.austin@cirrus.com, broonie@kernel.org,
 alsa-devel@alsa-project.org, david.rhodes@cirrus.com
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

On Mon, May 31, 2021 at 08:37:30PM -0500, David Rhodes wrote:
> SoC Audio driver for the Cirrus Logic CS35L41 amplifier
> 
> Signed-off-by: David Rhodes <drhodes@opensource.cirrus.com>
> ---
> +static void cs35l41_spi_otp_setup(struct cs35l41_private *cs35l41,
> +					bool is_pre_setup, unsigned int *freq)
> +{
> +	struct spi_device *spi = NULL;
> +	u32 orig_spi_freq;
> +
> +	spi = to_spi_device(cs35l41->dev);
> +
> +	if (!spi)
> +		return;
> +
> +	if (is_pre_setup) {
> +		orig_spi_freq = spi->max_speed_hz;
> +		spi->max_speed_hz = CS35L41_SPI_MAX_FREQ_OTP;

We probably need special handling for the case spi->max_speed_hz
is smaller than CS35L41_SPI_MAX_FREQ_OTP here, in that case this
code would increase the SPI speed. If the max speed was set lower
that is probably because something other than the amp in the
system limits it. Track length or the host or something.

> +		spi_setup(spi);
> +		*freq = orig_spi_freq;
> +	} else {
> +		spi->max_speed_hz = *freq;
> +		spi_setup(spi);
> +	}
> +}
...
> +const struct reg_default cs35l41_reg[CS35L41_MAX_CACHE_REG] = {
> +	{CS35L41_TEST_KEY_CTL,			0x00000000},
> +	{CS35L41_USER_KEY_CTL,			0x00000000},
> +	{CS35L41_OTP_CTRL0,			0x00006418},
> +	{CS35L41_OTP_CTRL1,			0x00000000},
> +	{CS35L41_OTP_CTRL3,			0x00000000},
> +	{CS35L41_OTP_CTRL4,			0x00000000},
> +	{CS35L41_OTP_CTRL5,			0x00000030},
> +	{CS35L41_OTP_CTRL6,			0x00000000},
> +	{CS35L41_OTP_CTRL7,			0x00000000},
> +	{CS35L41_OTP_CTRL8,			0x00000000},
> +	{CS35L41_PWR_CTRL1,			0x00000000},
> +	{CS35L41_PWR_CTRL3,			0x01000010},
> +	{CS35L41_CTRL_OVRRIDE,			0x00000002},
> +	{CS35L41_AMP_OUT_MUTE,			0x00000000},
> +	{CS35L41_PROTECT_REL_ERR_IGN,		0x00000000},
> +	{CS35L41_GPIO_PAD_CONTROL,		0x00000000},
> +	{CS35L41_JTAG_CONTROL,			0x00000000},
> +	{CS35L41_PLL_CLK_CTRL,			0x00000010},
> +	{CS35L41_DSP_CLK_CTRL,			0x00000003},
> +	{CS35L41_GLOBAL_CLK_CTRL,		0x00000003},
> +	{CS35L41_DATA_FS_SEL,			0x00000000},
> +	{CS35L41_MDSYNC_EN,			0x00000200},
> +	{CS35L41_MDSYNC_TX_ID,			0x00000000},
> +	{CS35L41_MDSYNC_PWR_CTRL,		0x00000002},
> +	{CS35L41_MDSYNC_DATA_TX,		0x00000000},
> +	{CS35L41_MDSYNC_TX_STATUS,		0x00000002},
> +	{CS35L41_MDSYNC_DATA_RX,		0x00000000},
> +	{CS35L41_MDSYNC_RX_STATUS,		0x00000002},
> +	{CS35L41_MDSYNC_ERR_STATUS,		0x00000000},
> +	{CS35L41_MDSYNC_SYNC_PTE2,		0x00000000},
> +	{CS35L41_MDSYNC_SYNC_PTE3,		0x00000000},
> +	{CS35L41_MDSYNC_SYNC_MSM_STATUS,	0x00000000},
> +	{CS35L41_BSTCVRT_VCTRL1,		0x00000000},
> +	{CS35L41_BSTCVRT_VCTRL2,		0x00000001},
> +	{CS35L41_BSTCVRT_PEAK_CUR,		0x0000004A},
> +	{CS35L41_BSTCVRT_SFT_RAMP,		0x00000003},
> +	{CS35L41_BSTCVRT_COEFF,			0x00002424},
> +	{CS35L41_BSTCVRT_SLOPE_LBST,		0x00007500},
> +	{CS35L41_BSTCVRT_SW_FREQ,		0x01008000},
> +	{CS35L41_BSTCVRT_DCM_CTRL,		0x00002001},

The default needs to be updated to match the register patch here.
regmap_register_patch does a bypassed write so the default should
be set to the patched value.

> +	{CS35L41_BSTCVRT_DCM_MODE_FORCE,	0x00000000},
> +	{CS35L41_BSTCVRT_OVERVOLT_CTRL,		0x00000130},
> +	{CS35L41_VI_VOL_POL,			0x08000800},
> +	{CS35L41_DTEMP_WARN_THLD,		0x00000002},
> +	{CS35L41_DTEMP_EN,			0x00000000},
> +	{CS35L41_VPVBST_FS_SEL,			0x00000001},

ditto.

> +	{CS35L41_SP_ENABLES,			0x00000000},
> +	{CS35L41_SP_RATE_CTRL,			0x00000028},
> +	{CS35L41_SP_FORMAT,			0x18180200},
> +	{CS35L41_SP_HIZ_CTRL,			0x00000002},
> +	{CS35L41_SP_FRAME_TX_SLOT,		0x03020100},
> +	{CS35L41_SP_FRAME_RX_SLOT,		0x00000100},
> +	{CS35L41_SP_TX_WL,			0x00000018},
> +	{CS35L41_SP_RX_WL,			0x00000018},
> +	{CS35L41_DAC_PCM1_SRC,			0x00000008},
> +	{CS35L41_ASP_TX1_SRC,			0x00000018},
> +	{CS35L41_ASP_TX2_SRC,			0x00000019},
> +	{CS35L41_ASP_TX3_SRC,			0x00000020},
> +	{CS35L41_ASP_TX4_SRC,			0x00000021},
> +	{CS35L41_DSP1_RX1_SRC,			0x00000008},
> +	{CS35L41_DSP1_RX2_SRC,			0x00000009},
> +	{CS35L41_DSP1_RX3_SRC,			0x00000018},
> +	{CS35L41_DSP1_RX4_SRC,			0x00000019},
> +	{CS35L41_DSP1_RX5_SRC,			0x00000020},
> +	{CS35L41_DSP1_RX6_SRC,			0x00000021},
> +	{CS35L41_DSP1_RX7_SRC,			0x0000003A},
> +	{CS35L41_DSP1_RX8_SRC,			0x00000001},
> +	{CS35L41_NGATE1_SRC,			0x00000008},
> +	{CS35L41_NGATE2_SRC,			0x00000009},
> +	{CS35L41_AMP_DIG_VOL_CTRL,		0x00008000},
> +	{CS35L41_VPBR_CFG,			0x02AA1905},
> +	{CS35L41_VBBR_CFG,			0x02AA1905},
> +	{CS35L41_VPBR_STATUS,			0x00000000},
> +	{CS35L41_VBBR_STATUS,			0x00000000},
> +	{CS35L41_OVERTEMP_CFG,			0x00000001},
> +	{CS35L41_AMP_ERR_VOL,			0x00000000},
> +	{CS35L41_VOL_STATUS_TO_DSP,		0x00000000},
> +	{CS35L41_CLASSH_CFG,			0x000B0405},
> +	{CS35L41_WKFET_CFG,			0x00000111},
> +	{CS35L41_NG_CFG,			0x00000033},
> +	{CS35L41_AMP_GAIN_CTRL,			0x00000273},
> +	{CS35L41_DAC_MSM_CFG,			0x00580000},
> +	{CS35L41_GPIO1_CTRL1,			0xE1000001},
> +	{CS35L41_GPIO2_CTRL1,			0xE1000001},
> +	{CS35L41_MIXER_NGATE_CFG,		0x00000000},
> +	{CS35L41_MIXER_NGATE_CH1_CFG,		0x00000303},
> +	{CS35L41_MIXER_NGATE_CH2_CFG,		0x00000303},
> +	{CS35L41_CLOCK_DETECT_1,		0x00000000},
> +	{CS35L41_TIMER1_CONTROL,		0x00000000},
> +	{CS35L41_TIMER1_COUNT_PRESET,		0x00000000},
> +	{CS35L41_TIMER1_START_STOP,		0x00000000},
> +	{CS35L41_TIMER1_STATUS,			0x00000000},
> +	{CS35L41_TIMER1_COUNT_READBACK,		0x00000000},
> +	{CS35L41_TIMER1_DSP_CLK_CFG,		0x00000000},
> +	{CS35L41_TIMER1_DSP_CLK_STATUS,		0x00000000},
> +	{CS35L41_TIMER2_CONTROL,		0x00000000},
> +	{CS35L41_TIMER2_COUNT_PRESET,		0x00000000},
> +	{CS35L41_TIMER2_START_STOP,		0x00000000},
> +	{CS35L41_TIMER2_STATUS,			0x00000000},
> +	{CS35L41_TIMER2_COUNT_READBACK,		0x00000000},
> +	{CS35L41_TIMER2_DSP_CLK_CFG,		0x00000000},
> +	{CS35L41_TIMER2_DSP_CLK_STATUS,		0x00000000},
> +	{CS35L41_DFT_JTAG_CONTROL,		0x00000000},
> +	{CS35L41_DIE_STS1,			0x00000000},
> +	{CS35L41_DIE_STS2,			0x00000000},
> +	{CS35L41_TEMP_CAL1,			0x00000000},
> +	{CS35L41_TEMP_CAL2,			0x00000000},
> +};

There are a bunch of registers with status/sts in the name in here with
defaults, normally you wouldn't want a default for a status register,
since it would be a volatile register. Are we sure these are
correct?

> +static const struct snd_kcontrol_new cs35l41_aud_controls[] = {
> +	SOC_SINGLE_SX_TLV("Digital PCM Volume", CS35L41_AMP_DIG_VOL_CTRL,
> +		      3, 0x4CF, 0x391, dig_vol_tlv),
> +	SOC_SINGLE_TLV("AMP PCM Gain", CS35L41_AMP_GAIN_CTRL, 5, 0x14, 0,
> +			amp_gain_tlv),
> +	SOC_SINGLE_RANGE("ASPTX1 Slot Position", CS35L41_SP_FRAME_TX_SLOT, 0,
> +			 0, 7, 0),
> +	SOC_SINGLE_RANGE("ASPTX2 Slot Position", CS35L41_SP_FRAME_TX_SLOT, 8,
> +			 0, 7, 0),
> +	SOC_SINGLE_RANGE("ASPTX3 Slot Position", CS35L41_SP_FRAME_TX_SLOT, 16,
> +			 0, 7, 0),
> +	SOC_SINGLE_RANGE("ASPTX4 Slot Position", CS35L41_SP_FRAME_TX_SLOT, 24,
> +			 0, 7, 0),
> +	SOC_SINGLE_RANGE("ASPRX1 Slot Position", CS35L41_SP_FRAME_RX_SLOT, 0,
> +			 0, 7, 0),
> +	SOC_SINGLE_RANGE("ASPRX2 Slot Position", CS35L41_SP_FRAME_RX_SLOT, 8,
> +			 0, 7, 0),

Probably worth explaining why you want to do this through ALSA
controls rather than set_tdm/set_channel_map.

> +static int cs35l41_component_probe(struct snd_soc_component *component)
> +{
> +	struct cs35l41_private *cs35l41 =
> +		snd_soc_component_get_drvdata(component);
> +
> +	component->regmap = cs35l41->regmap;

Is this necessary I think ASoC handles this internally since the
regmap is already on the CODEC device?

> +
> +	return cs35l41_set_pdata(cs35l41);
> +}

Thanks,
Charles
