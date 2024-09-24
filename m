Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7108A98424B
	for <lists+alsa-devel@lfdr.de>; Tue, 24 Sep 2024 11:36:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 301AADE5;
	Tue, 24 Sep 2024 11:36:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 301AADE5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1727170618;
	bh=tD815UZyf2z4VrcjTj/EG2Qy9VQU6UxR08+XOBJDC7M=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=DVgVTwD8PXOu087pKWU4J6SzP7LhALJNFb79+dOIJRa98l6Mv7YQmJCg+157MYh08
	 rCEFpv5nu7lBJ8G3XUX32Mr8mDfESsqvrHEW2L2A1ZbQeVcfY1hWmg5mVGCEHCb2Hk
	 u7MRyTrrhjeTQJ4A7PPu3qbT57gC3hViFtAWo5No=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 87B69F805BB; Tue, 24 Sep 2024 11:36:25 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 77CE4F80007;
	Tue, 24 Sep 2024 11:36:24 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 935DCF802DB; Tue, 24 Sep 2024 11:36:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H2,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E916EF8010B
	for <alsa-devel@alsa-project.org>; Tue, 24 Sep 2024 11:36:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E916EF8010B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=TF9gUjLE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727170572; x=1758706572;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=tD815UZyf2z4VrcjTj/EG2Qy9VQU6UxR08+XOBJDC7M=;
  b=TF9gUjLEGYbl4Gd6SjG0yjN3TA8dxmpK+0OPfJulN7hEWGS+/up5m9mK
   5nSQVZUgepYQ20ytGtg+QfjMVR+mFzdKpGaZcFQqLQu82UlsskeqlooP4
   skxp8lcSF0OV+uCVLAGS6M3PMwZujAqXN3Y+6YqAwOXzcvjYGVfaNY+l7
   KO/DZbnSmEFSBbA7rOx7PXFFZ5s+ZJDyqToCtT6TmVQGuhsX5ubyb8JTj
   BP/1d01EgTjAM8y9skF6yGppPIexPgw/LCZ+byqbBbt/L6mNY22eYUiMr
   JQmVaVf6Cc+UkapThFYMpTr4ebwrube1Gs9pVDb5zO0jKQqjzXKH61a+V
   w==;
X-CSE-ConnectionGUID: Coa8bJcmRBOFYxIV91h1bA==
X-CSE-MsgGUID: iVJpdivhSOa7qQmjw2+CTQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11204"; a="25664982"
X-IronPort-AV: E=Sophos;i="6.10,254,1719903600";
   d="scan'208";a="25664982"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2024 02:36:06 -0700
X-CSE-ConnectionGUID: uQUWjuPbSNqsJpXX8FDpPw==
X-CSE-MsgGUID: vXMhP40WQsaw8lcLCts5xA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,254,1719903600";
   d="scan'208";a="75881265"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO [10.245.246.202])
 ([10.245.246.202])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2024 02:36:03 -0700
Message-ID: <65339ec1-ee9d-40cb-acd2-b6cfa0445c7e@linux.intel.com>
Date: Tue, 24 Sep 2024 11:36:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] ASoC: rt721-sdca: Add RT721 SDCA driver
To: Jack Yu <jack.yu@realtek.com>, "broonie@kernel.org" <broonie@kernel.org>,
 "lgirdwood@gmail.com" <lgirdwood@gmail.com>
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "lars@metafoo.de" <lars@metafoo.de>, "Flove(HsinFu)" <flove@realtek.com>,
 Oder Chiou <oder_chiou@realtek.com>, =?UTF-8?B?U2h1bWluZyBb6IyD5pu46YqYXQ==?=
 <shumingf@realtek.com>, =?UTF-8?B?RGVyZWsgW+aWueW+t+e+qV0=?=
 <derek.fang@realtek.com>, Bard Liao <yung-chuan.liao@linux.intel.com>
References: <1538ca2e1df042a7b771cc387b438710@realtek.com>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <1538ca2e1df042a7b771cc387b438710@realtek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: DQMJXHC3O4CROD7BJWMNO7RQWEXYFYPD
X-Message-ID-Hash: DQMJXHC3O4CROD7BJWMNO7RQWEXYFYPD
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/DQMJXHC3O4CROD7BJWMNO7RQWEXYFYPD/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 9/24/24 11:03, Jack Yu wrote:
> This is the initial codec driver for rt721-sdca.

I wouldn't hurt to provide a short description. 722 has 3 functions,
what about 721?


> +	case SDW_SDCA_CTL(FUNC_NUM_JACK_CODEC, RT721_SDCA_ENT_USER_FU05, RT721_SDCA_CTL_FU_VOLUME,
> +			CH_L):
> +	case SDW_SDCA_CTL(FUNC_NUM_JACK_CODEC, RT721_SDCA_ENT_USER_FU05, RT721_SDCA_CTL_FU_VOLUME,
> +			CH_R):
> +	case SDW_SDCA_CTL(FUNC_NUM_JACK_CODEC, RT721_SDCA_ENT_USER_FU0F, RT721_SDCA_CTL_FU_VOLUME,
> +			CH_L):
> +	case SDW_SDCA_CTL(FUNC_NUM_JACK_CODEC, RT721_SDCA_ENT_USER_FU0F, RT721_SDCA_CTL_FU_VOLUME,
> +			CH_R):
> +	case SDW_SDCA_CTL(FUNC_NUM_JACK_CODEC, RT721_SDCA_ENT_PLATFORM_FU44,
> +			RT721_SDCA_CTL_FU_CH_GAIN, CH_L):
> +	case SDW_SDCA_CTL(FUNC_NUM_JACK_CODEC, RT721_SDCA_ENT_PLATFORM_FU44,
> +			RT721_SDCA_CTL_FU_CH_GAIN, CH_R):
> +	case SDW_SDCA_CTL(FUNC_NUM_MIC_ARRAY, RT721_SDCA_ENT_USER_FU1E, RT721_SDCA_CTL_FU_VOLUME,
> +			CH_01):
> +	case SDW_SDCA_CTL(FUNC_NUM_MIC_ARRAY, RT721_SDCA_ENT_USER_FU1E, RT721_SDCA_CTL_FU_VOLUME,
> +			CH_02):
> +	case SDW_SDCA_CTL(FUNC_NUM_MIC_ARRAY, RT721_SDCA_ENT_USER_FU1E, RT721_SDCA_CTL_FU_VOLUME,
> +			CH_03):
> +	case SDW_SDCA_CTL(FUNC_NUM_MIC_ARRAY, RT721_SDCA_ENT_USER_FU1E, RT721_SDCA_CTL_FU_VOLUME,
> +			CH_04):
> +	case SDW_SDCA_CTL(FUNC_NUM_AMP, RT721_SDCA_ENT_USER_FU06, RT721_SDCA_CTL_FU_VOLUME, CH_L):
> +	case SDW_SDCA_CTL(FUNC_NUM_AMP, RT721_SDCA_ENT_USER_FU06, RT721_SDCA_CTL_FU_VOLUME, CH_R):
> +		return true;

That tells us it has 3 functions (jack, mic, amp), so what's different
to RT722? could we have a single driver for both parts? A lot of this
driver seems copy-pasted-renamed.

> +static int rt721_sdca_read_prop(struct sdw_slave *slave)
> +{
> +	struct sdw_slave_prop *prop = &slave->prop;
> +	int nval;
> +	int i, j;
> +	u32 bit;
> +	unsigned long addr;
> +	struct sdw_dpn_prop *dpn;
> +
> +	sdw_slave_read_prop(slave);

I thought we agreed to use a helper to read only the number of lanes
from platform firmware?

Bard, did you share this already?

> +	prop->scp_int1_mask = SDW_SCP_INT1_BUS_CLASH | SDW_SCP_INT1_PARITY;
> +	prop->quirks = SDW_SLAVE_QUIRKS_INVALID_INITIAL_PARITY;
> +
> +	prop->paging_support = true;
> +
> +	/*
> +	 * port = 1 for headphone playback
> +	 * port = 2 for headset-mic capture
> +	 * port = 3 for speaker playback
> +	 * port = 6 for digital-mic capture
> +	 */
> +	prop->source_ports = BIT(6) | BIT(2); /* BITMAP: 01000100 */
> +	prop->sink_ports = BIT(3) | BIT(1); /* BITMAP:  00001010 */
> +
> +	nval = hweight32(prop->source_ports);
> +	prop->src_dpn_prop = devm_kcalloc(&slave->dev, nval,
> +		sizeof(*prop->src_dpn_prop), GFP_KERNEL);
> +	if (!prop->src_dpn_prop)
> +		return -ENOMEM;
> +
> +	i = 0;
> +	dpn = prop->src_dpn_prop;
> +	addr = prop->source_ports;
> +	for_each_set_bit(bit, &addr, 32) {
> +		dpn[i].num = bit;
> +		dpn[i].type = SDW_DPN_FULL;
> +		dpn[i].simple_ch_prep_sm = true;
> +		dpn[i].ch_prep_timeout = 10;
> +		i++;
> +	}
> +
> +	/* do this again for sink now */
> +	nval = hweight32(prop->sink_ports);
> +	prop->sink_dpn_prop = devm_kcalloc(&slave->dev, nval,
> +		sizeof(*prop->sink_dpn_prop), GFP_KERNEL);
> +	if (!prop->sink_dpn_prop)
> +		return -ENOMEM;
> +
> +	j = 0;
> +	dpn = prop->sink_dpn_prop;
> +	addr = prop->sink_ports;
> +	for_each_set_bit(bit, &addr, 32) {
> +		dpn[j].num = bit;
> +		dpn[j].type = SDW_DPN_FULL;
> +		dpn[j].simple_ch_prep_sm = true;
> +		dpn[j].ch_prep_timeout = 10;
> +		j++;
> +	}
> +
> +	/* set the timeout values */
> +	prop->clk_stop_timeout = 200;
> +
> +	/* wake-up event */
> +	prop->wake_capable = 1;
> +
> +	/* Three data lanes are supported by rt721-sdca codec */
> +	prop->lane_control_support = true;

this doesn't seem needed if we already read information on lane support.

> +static void rt721_sdca_dmic_preset(struct rt721_sdca_priv *rt721)
> +{
> +	/* Power down group1/2/3_mic_pdb */
> +	rt721_sdca_index_write(rt721, RT721_VENDOR_ANA_CTL,
> +		RT721_MISC_POWER_CTL31, 0x8000);
> +	/* VREF_HV_EN_AUTO_FAST */
> +	rt721_sdca_index_write(rt721, RT721_ANA_POW_PART,
> +		RT721_VREF1_HV_CTRL1, 0xe000);
> +	/* Power up group1/2/3_mic_pdb */
> +	rt721_sdca_index_write(rt721, RT721_VENDOR_ANA_CTL,
> +		RT721_MISC_POWER_CTL31, 0x8007);
> +	/* Set AD07/08 power entity floating control */
> +	rt721_sdca_index_write(rt721, RT721_HDA_SDCA_FLOAT,
> +		RT721_ENT_FLOAT_CTL9, 0x2a2a);
> +	/* Set AD10 power entity floating control */
> +	rt721_sdca_index_write(rt721, RT721_HDA_SDCA_FLOAT,
> +		RT721_ENT_FLOAT_CTL10, 0x2a00);
> +	/* Set DMIC1/DMIC2 power entity floating control */
> +	rt721_sdca_index_write(rt721, RT721_HDA_SDCA_FLOAT,
> +		RT721_ENT_FLOAT_CTL6, 0x2a2a);
> +	/* Set DMIC1/DMIC2 IT entity floating control */
> +	rt721_sdca_index_write(rt721, RT721_HDA_SDCA_FLOAT,
> +		RT721_ENT_FLOAT_CTL5, 0x2626);
> +	/* Set AD10 FU entity floating control */
> +	rt721_sdca_index_write(rt721, RT721_HDA_SDCA_FLOAT,
> +		RT721_ENT_FLOAT_CTL8, 0x1e00);
> +	/* Set DMIC1/DMIC2 FU input gain floating control */
> +	rt721_sdca_index_write(rt721, RT721_HDA_SDCA_FLOAT,
> +		RT721_ENT_FLOAT_CTL7, 0x1515);
> +	/* Set DMIC2 FU input gain channel floating control */
> +	rt721_sdca_index_write(rt721, RT721_HDA_SDCA_FLOAT,
> +		RT721_CH_FLOAT_CTL3, 0x0304);
> +	/* Set AD10 FU channel floating control */
> +	rt721_sdca_index_write(rt721, RT721_HDA_SDCA_FLOAT,
> +		RT721_CH_FLOAT_CTL4, 0x0304);
> +	/* vf71f_r12_07_06 and vf71f_r13_07_06 = 2’b00 */
> +	rt721_sdca_index_write(rt721, RT721_HDA_SDCA_FLOAT,
> +		RT721_HDA_LEGACY_CTL1, 0x0000);
> +	/* Enable vf707_r12_05/vf707_r13_05 */
> +	regmap_write(rt721->regmap,
> +		SDW_SDCA_CTL(FUNC_NUM_MIC_ARRAY, RT721_SDCA_ENT_IT26,
> +			RT721_SDCA_CTL_VENDOR_DEF, 0), 0x01);
> +	/* Set usd_flag_sel, usd_in_sel */
> +	regmap_write(rt721->mbq_regmap, 0x5910009, 0x2e01);
> +	/* Set RC calibration  */
> +	rt721_sdca_index_write(rt721, RT721_RC_CALIB_CTRL,
> +		RT721_RC_CALIB_CTRL0, 0x0b00);
> +	rt721_sdca_index_write(rt721, RT721_RC_CALIB_CTRL,
> +		RT721_RC_CALIB_CTRL0, 0x0b40);
> +	/* Fine tune PDE2A latency */
> +	regmap_write(rt721->regmap, 0x2f5c, 0x25);
> +}

Humm, isn't all this supposed to be handled with blind writes? It seems
odd to hard-code all this, no?

> +static void rt721_sdca_amp_preset(struct rt721_sdca_priv *rt721)
> +{;
> +	/* Power down group1/2/3_mic_pdb  */
> +	rt721_sdca_index_write(rt721, RT721_VENDOR_ANA_CTL,
> +		RT721_MISC_POWER_CTL31, 0x8000);
> +	/* VREF_HV_EN_AUTO_FAST */
> +	rt721_sdca_index_write(rt721, RT721_ANA_POW_PART,
> +		RT721_VREF1_HV_CTRL1, 0xe000);
> +	/* Power up group1/2/3_mic_pdb */
> +	rt721_sdca_index_write(rt721, RT721_VENDOR_ANA_CTL,
> +		RT721_MISC_POWER_CTL31, 0x8007);
> +	/* Reset dc_cal_top */
> +	regmap_write(rt721->mbq_regmap, 0x5810000, 0x6420);
> +	/* Turn back to normal dc_cal_top */
> +	regmap_write(rt721->mbq_regmap, 0x5810000, 0x6421);
> +	/* W1C Trigger Calibration */
> +	regmap_write(rt721->mbq_regmap, 0x5810000, 0xe421);
> +	/* DAC04 FU entity floating control  */
> +	rt721_sdca_index_write(rt721, RT721_HDA_SDCA_FLOAT,
> +		RT721_CH_FLOAT_CTL6, 0x5561);
> +	/* Set EAPD high */
> +	rt721_sdca_index_write(rt721, RT721_VENDOR_REG,
> +		RT721_GPIO_PAD_CTRL5, 0x8003);
> +	/* Enable vf707_r14 */
> +	regmap_write(rt721->regmap,
> +		SDW_SDCA_CTL(FUNC_NUM_AMP, RT721_SDCA_ENT_OT23,
> +			RT721_SDCA_CTL_VENDOR_DEF, 0), 0x04);
> +	/* FU 23 SPK mute control - L */
> +	regmap_write(rt721->regmap,
> +		SDW_SDCA_CTL(FUNC_NUM_AMP, RT721_SDCA_ENT_PDE23,
> +			RT721_SDCA_CTL_FU_MUTE, CH_01), 0x00);
> +	/* FU 23 SPK mute control - R */
> +	regmap_write(rt721->regmap,
> +		SDW_SDCA_CTL(FUNC_NUM_AMP, RT721_SDCA_ENT_PDE23,
> +			RT721_SDCA_CTL_FU_MUTE, CH_02), 0x00);
> +	/* FU 55 DAC04 mute control - L */
> +	regmap_write(rt721->regmap,
> +		SDW_SDCA_CTL(FUNC_NUM_AMP, RT721_SDCA_ENT_FU55,
> +			RT721_SDCA_CTL_FU_MUTE, CH_01), 0x00);
> +	/* FU 55 DAC04 mute control - R */
> +	regmap_write(rt721->regmap,
> +		SDW_SDCA_CTL(FUNC_NUM_AMP, RT721_SDCA_ENT_FU55,
> +			RT721_SDCA_CTL_FU_MUTE, CH_02), 0x00);
> +}
> +
> +static void rt721_sdca_jack_preset(struct rt721_sdca_priv *rt721)
> +{
> +	/* Power down group1/2/3_mic_pdb  */
> +	rt721_sdca_index_write(rt721, RT721_VENDOR_ANA_CTL,
> +		RT721_MISC_POWER_CTL31, 0x8000);
> +	/* VREF_HV_EN_AUTO_FAST */
> +	rt721_sdca_index_write(rt721, RT721_ANA_POW_PART,
> +		RT721_VREF1_HV_CTRL1, 0xe000);
> +	/* Power up group1/2/3_mic_pdb */
> +	rt721_sdca_index_write(rt721, RT721_VENDOR_ANA_CTL,
> +		RT721_MISC_POWER_CTL31, 0x8007);
> +	/* GE0 mode related control */
> +	rt721_sdca_index_write(rt721, RT721_HDA_SDCA_FLOAT,
> +		RT721_GE_REL_CTRL1, 0x8011);
> +	/* Button A, B, C, D bypass mode */
> +	rt721_sdca_index_write(rt721, RT721_HDA_SDCA_FLOAT,
> +		RT721_UMP_HID_CTRL3, 0xcf00);
> +	/* HID1 slot enable */
> +	rt721_sdca_index_write(rt721, RT721_HDA_SDCA_FLOAT,
> +		RT721_UMP_HID_CTRL4, 0x000f);
> +	/* Report ID for HID1  */
> +	rt721_sdca_index_write(rt721, RT721_HDA_SDCA_FLOAT,
> +		RT721_UMP_HID_CTRL1, 0x1100);
> +	/* OSC/OOC for slot 2, 3 */
> +	rt721_sdca_index_write(rt721, RT721_HDA_SDCA_FLOAT,
> +		RT721_UMP_HID_CTRL5, 0x0c12);
> +	/* Set JD de-bounce clock control */
> +	rt721_sdca_index_write(rt721, RT721_JD_CTRL,
> +		RT721_JD_1PIN_GAT_CTRL2, 0xc002);
> +	/* RC calibration -1 */
> +	rt721_sdca_index_write(rt721, RT721_RC_CALIB_CTRL,
> +		RT721_RC_CALIB_CTRL0, 0x0b00);
> +	/* RC calibration -2 */
> +	rt721_sdca_index_write(rt721, RT721_RC_CALIB_CTRL,
> +		RT721_RC_CALIB_CTRL0, 0x0b40);
> +	/* pow_clk_12p288mhz_dre03 change to register mode */
> +	rt721_sdca_index_write(rt721, RT721_VENDOR_ANA_CTL,
> +		RT721_UAJ_TOP_TCON14, 0x3333);
> +	/* Tune calibration timing control */
> +	regmap_write(rt721->mbq_regmap, 0x5810035, 0x0036);
> +	/* calibration HP amp output select control from Efuse */
> +	regmap_write(rt721->mbq_regmap, 0x5810030, 0xee00);
> +	/* FSM related control */
> +	rt721_sdca_index_write(rt721, RT721_CAP_PORT_CTRL,
> +		RT721_HP_AMP_2CH_CAL1, 0x0140);
> +	/* HP calibration related control */
> +	regmap_write(rt721->mbq_regmap, 0x5810000, 0x0021);
> +	/* W1C HP calibration*/
> +	regmap_write(rt721->mbq_regmap, 0x5810000, 0x8021);
> +	/* reg_sel_cin_hp_0010/0011 */
> +	rt721_sdca_index_write(rt721, RT721_CAP_PORT_CTRL,
> +		RT721_HP_AMP_2CH_CAL18, 0x5522);
> +	regmap_write(rt721->mbq_regmap, 0x5b10007, 0x2000);
> +	/* sel_sensing_lr_hp */
> +	regmap_write(rt721->mbq_regmap, 0x5B10017, 0x1b0f);
> +	/* Release HP-JD */
> +	rt721_sdca_index_write(rt721, RT721_CBJ_CTRL,
> +		RT721_CBJ_A0_GAT_CTRL1, 0x2a02);
> +	/* en_osw gating auto done bit */
> +	rt721_sdca_index_write(rt721, RT721_CAP_PORT_CTRL,
> +		RT721_HP_AMP_2CH_CAL4, 0xa105);
> +	/* pow_clk_en_sw_amp_detect_sel to register mode */
> +	rt721_sdca_index_write(rt721, RT721_VENDOR_ANA_CTL,
> +		RT721_UAJ_TOP_TCON14, 0x3b33);
> +	/* cp_sw_hp to auto mode */
> +	regmap_write(rt721->mbq_regmap, 0x310400, 0x3023);
> +	/* pow_clk_en_sw_amp_detect power up */
> +	rt721_sdca_index_write(rt721, RT721_VENDOR_ANA_CTL,
> +		RT721_UAJ_TOP_TCON14, 0x3f33);
> +	rt721_sdca_index_write(rt721, RT721_VENDOR_ANA_CTL,
> +		RT721_UAJ_TOP_TCON13, 0x6048);
> +	/* switch size detect threshold */
> +	regmap_write(rt721->mbq_regmap, 0x310401, 0x3000);
> +	regmap_write(rt721->mbq_regmap, 0x310402, 0x1b00);
> +	/* en_hp_amp_detect auto mode */
> +	regmap_write(rt721->mbq_regmap, 0x310300, 0x000f);
> +	/* amp detect threshold */
> +	regmap_write(rt721->mbq_regmap, 0x310301, 0x3000);
> +	regmap_write(rt721->mbq_regmap, 0x310302, 0x1b00);
> +	/* gating_sdw_link_rst_n_1_cbj_reg */
> +	rt721_sdca_index_write(rt721, RT721_VENDOR_ANA_CTL,
> +		RT721_UAJ_TOP_TCON17, 0x0008);
> +	/* CKXEN_SDAC chopper function */
> +	rt721_sdca_index_write(rt721, RT721_DAC_CTRL,
> +		RT721_DAC_2CH_CTRL3, 0x55ff);
> +	/* CKXSEL_SDAC chopper frequency */
> +	rt721_sdca_index_write(rt721, RT721_DAC_CTRL,
> +		RT721_DAC_2CH_CTRL4, 0xcc00);
> +	/* Bias current for SDAC */
> +	rt721_sdca_index_write(rt721, RT721_ANA_POW_PART,
> +		RT721_MBIAS_LV_CTRL2, 0x6677);
> +	/* VREF2 level selection */
> +	rt721_sdca_index_write(rt721, RT721_ANA_POW_PART,
> +		RT721_VREF2_LV_CTRL1, 0x7600);
> +	/* ADC09/MIC2 power entity floating control */
> +	rt721_sdca_index_write(rt721, RT721_HDA_SDCA_FLOAT,
> +		RT721_ENT_FLOAT_CTL2, 0x1234);
> +	/* LINE2 power entity floating control */
> +	rt721_sdca_index_write(rt721, RT721_HDA_SDCA_FLOAT,
> +		RT721_ENT_FLOAT_CTL3, 0x3512);
> +	/* DAC03/HP power entity floating control */
> +	rt721_sdca_index_write(rt721, RT721_HDA_SDCA_FLOAT,
> +		RT721_ENT_FLOAT_CTL1, 0x4040);
> +	/* ADC27 power entity floating control */
> +	rt721_sdca_index_write(rt721, RT721_HDA_SDCA_FLOAT,
> +		RT721_ENT_FLOAT_CTL4, 0x1201);
> +	/* Fine tune PDE40 latency */
> +	regmap_write(rt721->regmap, 0x2f58, 0x07);
> +}

same here, shouldn't this come from ACPI/blind write tables?

> +enum rt721_sdca_jd_src {
> +	RT721_JD_NULL,
> +	RT721_JD1,
> +	RT721_JD2,
> +};

is this supported in SDCA? I can't recall seeing this for other drivers.
