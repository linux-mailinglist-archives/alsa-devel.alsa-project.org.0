Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 303D042DB06
	for <lists+alsa-devel@lfdr.de>; Thu, 14 Oct 2021 16:01:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BF49D1672;
	Thu, 14 Oct 2021 16:00:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BF49D1672
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1634220107;
	bh=TuKiT5C5v9JW/KuCRoGDvKWAa7CZV5cKrcyhHCJQp/I=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Bhk9I8uGST+0awwuimwgplnoOltBjmLN06szPWoZH2Jj4Amd0cLb6SgNxj1nh4ByD
	 k6BM/znBcmH2JMMPbVM8GKQPM976F6GvQ/OLi2KcE8MSq1K5/44SbjeMU7yTgsNxPL
	 7yJLaVMo15mKDg3CvCl3jOkylPgTdLlepShoNZBA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 32E32F8016C;
	Thu, 14 Oct 2021 16:00:32 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C69ACF80212; Thu, 14 Oct 2021 16:00:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B4534F80088
 for <alsa-devel@alsa-project.org>; Thu, 14 Oct 2021 16:00:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B4534F80088
X-IronPort-AV: E=McAfee;i="6200,9189,10136"; a="214619724"
X-IronPort-AV: E=Sophos;i="5.85,372,1624345200"; d="scan'208";a="214619724"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2021 07:00:14 -0700
X-IronPort-AV: E=Sophos;i="5.85,372,1624345200"; d="scan'208";a="461197202"
Received: from ktrimble-mobl.amr.corp.intel.com (HELO [10.209.188.150])
 ([10.209.188.150])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2021 07:00:12 -0700
Subject: Re: [PATCH 2/2] ASoC: max98520: Add max98520 audio amplifier driver
To: George Song <george.song@maximintegrated.com>, lgirdwood@gmail.com,
 broonie@kernel.org, perex@perex.cz, tiwai@suse.com,
 srinivas.kandagatla@linaro.org, arnd@arndb.de,
 alexandre.belloni@bootlin.com, jack.yu@realtek.com, jiri.prchal@aksignal.cz,
 shumingf@realtek.com, pbrobinson@gmail.com, lars@metafoo.de,
 geert@linux-m68k.org, hdegoede@redhat.com, paul@crapouillou.net,
 linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org
References: <20211013075223.19299-1-george.song@maximintegrated.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <a30d8839-0684-cbf8-8ece-639b69550959@linux.intel.com>
Date: Thu, 14 Oct 2021 09:00:09 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211013075223.19299-1-george.song@maximintegrated.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: George Song <george.song@analog.com>
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

quite a few alignment/style issues and more importantly your
Signed-off-by: tag mixes your two emails addresses.

scripts/checkpatch.pl --strict --codespell
0001-ASoC-max98520-Add-max98520-audio-amplifier-driver.patch
WARNING: Missing commit description - Add an appropriate one

WARNING: please write a paragraph that describes the config symbol fully
#32: FILE: sound/soc/codecs/Kconfig:941:
+config SND_SOC_MAX98520

WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?
#60:
new file mode 100644

CHECK: Alignment should match open parenthesis
#157: FILE: sound/soc/codecs/max98520.c:93:
+	regmap_update_bits(max98520->regmap,
+						MAX98520_R2041_PCM_CLK_SETUP,

CHECK: Alignment should match open parenthesis
#180: FILE: sound/soc/codecs/max98520.c:116:
+	regmap_update_bits(max98520->regmap,
+						MAX98520_R2040_PCM_MODE_CFG,

CHECK: Alignment should match open parenthesis
#204: FILE: sound/soc/codecs/max98520.c:140:
+static int max98520_set_clock(struct snd_soc_component *component,
+	struct snd_pcm_hw_params *params)

CHECK: Alignment should match open parenthesis
#222: FILE: sound/soc/codecs/max98520.c:158:
+		regmap_update_bits(max98520->regmap,
+							MAX98520_R2041_PCM_CLK_SETUP,

CHECK: Alignment should match open parenthesis
#231: FILE: sound/soc/codecs/max98520.c:167:
+static int max98520_dai_hw_params(struct snd_pcm_substream *substream,
+	struct snd_pcm_hw_params *params,

CHECK: Alignment should match open parenthesis
#260: FILE: sound/soc/codecs/max98520.c:196:
+	regmap_update_bits(max98520->regmap,
+						MAX98520_R2040_PCM_MODE_CFG,

CHECK: Alignment should match open parenthesis
#317: FILE: sound/soc/codecs/max98520.c:253:
+	regmap_update_bits(max98520->regmap,
+						MAX98520_R2042_PCM_SR_SETUP,

CHECK: Alignment should match open parenthesis
#328: FILE: sound/soc/codecs/max98520.c:264:
+static int max98520_dai_tdm_slot(struct snd_soc_dai *dai,
+	unsigned int tx_mask, unsigned int rx_mask,

CHECK: Alignment should match open parenthesis
#351: FILE: sound/soc/codecs/max98520.c:287:
+	regmap_update_bits(max98520->regmap,
+						MAX98520_R2041_PCM_CLK_SETUP,

CHECK: Alignment should match open parenthesis
#373: FILE: sound/soc/codecs/max98520.c:309:
+	regmap_update_bits(max98520->regmap,
+						MAX98520_R2040_PCM_MODE_CFG,

CHECK: Alignment should match open parenthesis
#378: FILE: sound/soc/codecs/max98520.c:314:
+	regmap_update_bits(max98520->regmap,
+						MAX98520_R2044_PCM_RX_SRC2,

CHECK: Alignment should match open parenthesis
#382: FILE: sound/soc/codecs/max98520.c:318:
+	regmap_update_bits(max98520->regmap,
+						MAX98520_R2044_PCM_RX_SRC2,

CHECK: Alignment should match open parenthesis
#401: FILE: sound/soc/codecs/max98520.c:337:
+static int max98520_dac_event(struct snd_soc_dapm_widget *w,
+	struct snd_kcontrol *kcontrol, int event)

CHECK: Please don't use multiple blank lines
#408: FILE: sound/soc/codecs/max98520.c:344:
+
+

CHECK: Alignment should match open parenthesis
#434: FILE: sound/soc/codecs/max98520.c:370:
+	SOC_ENUM_SINGLE(MAX98520_R2043_PCM_RX_SRC1,
+		0, 3, max98520_switch_text);

CHECK: Alignment should match open parenthesis
#441: FILE: sound/soc/codecs/max98520.c:377:
+	SND_SOC_DAPM_DAC_E("Amp Enable", "HiFi Playback",
+	MAX98520_R209F_AMP_EN, 0, 0, max98520_dac_event,

CHECK: Alignment should match open parenthesis
#539: FILE: sound/soc/codecs/max98520.c:475:
+SOC_SINGLE_TLV("Digital Volume", MAX98520_R2090_AMP_VOL_CTRL,
+	0, 0x7F, 1, max98520_digital_tlv),

CHECK: Alignment should match open parenthesis
#541: FILE: sound/soc/codecs/max98520.c:477:
+SOC_SINGLE_TLV("Speaker Volume", MAX98520_R2091_AMP_PATH_GAIN,
+	0, 0x5, 0, max98520_spk_tlv),

CHECK: Alignment should match open parenthesis
#544: FILE: sound/soc/codecs/max98520.c:480:
+SOC_SINGLE("Ramp Up Switch", MAX98520_R2092_AMP_DSP_CFG,
+	MAX98520_DSP_SPK_VOL_RMPUP_SHIFT, 1, 0),

CHECK: Alignment should match open parenthesis
#546: FILE: sound/soc/codecs/max98520.c:482:
+SOC_SINGLE("Ramp Down Switch", MAX98520_R2092_AMP_DSP_CFG,
+	MAX98520_DSP_SPK_VOL_RMPDN_SHIFT, 1, 0),

CHECK: Alignment should match open parenthesis
#574: FILE: sound/soc/codecs/max98520.c:510:
+SOC_SINGLE("DHT Limiter Mode", MAX98520_R20D2_LIMITER_CFG2,
+	MAX98520_DHT_LIMITER_MODE_SHIFT, 1, 0),

CHECK: Alignment should match open parenthesis
#576: FILE: sound/soc/codecs/max98520.c:512:
+SOC_SINGLE("DHT Hysteresis Switch", MAX98520_R20D6_DHT_HYSTERESIS_CFG,
+	MAX98520_DHT_HYSTERESIS_SWITCH_SHIFT, 1, 0),

CHECK: Alignment should match open parenthesis
#578: FILE: sound/soc/codecs/max98520.c:514:
+SOC_SINGLE_TLV("DHT Rot Pnt", MAX98520_R20D0_DHT_CFG1,
+	MAX98520_DHT_VROT_PNT_SHIFT, 10, 1, max98520_dht_rotation_point_tlv),

CHECK: Alignment should match open parenthesis
#580: FILE: sound/soc/codecs/max98520.c:516:
+SOC_SINGLE_TLV("DHT Supply Headroom", MAX98520_R20D1_LIMITER_CFG1,
+	MAX98520_DHT_SUPPLY_HR_SHIFT, 16, 0, max98520_dht_supply_hr_tlv),

CHECK: Alignment should match open parenthesis
#582: FILE: sound/soc/codecs/max98520.c:518:
+SOC_SINGLE_TLV("DHT Limiter Threshold", MAX98520_R20D2_LIMITER_CFG2,
+	MAX98520_DHT_LIMITER_THRESHOLD_SHIFT, 0xF, 1,
max98520_dht_lim_thresh_tlv),

CHECK: Alignment should match open parenthesis
#584: FILE: sound/soc/codecs/max98520.c:520:
+SOC_SINGLE_TLV("DHT Max Attenuation", MAX98520_R20D3_DHT_CFG2,
+	MAX98520_DHT_MAX_ATTEN_SHIFT, 20, 1, max98520_dht_max_atten_tlv),

CHECK: Alignment should match open parenthesis
#586: FILE: sound/soc/codecs/max98520.c:522:
+SOC_SINGLE_TLV("DHT Hysteresis", MAX98520_R20D6_DHT_HYSTERESIS_CFG,
+	MAX98520_DHT_HYSTERESIS_SHIFT, 0x7, 0, max98520_dht_hysteresis_tlv),

CHECK: Alignment should match open parenthesis
#592: FILE: sound/soc/codecs/max98520.c:528:
+SOC_SINGLE("ADC PVDD FLT Switch", MAX98520_R20B2_ADC_PVDD0_CFG,
+	MAX98520_FLT_EN_SHIFT, 1, 0),

CHECK: Alignment should match open parenthesis
#594: FILE: sound/soc/codecs/max98520.c:530:
+SOC_SINGLE("ADC TEMP FLT Switch", MAX98520_R20B3_ADC_THERMAL_CFG,
+	MAX98520_FLT_EN_SHIFT, 1, 0),

WARNING: line length of 106 exceeds 100 columns
#664: FILE: sound/soc/codecs/max98520.c:600:
+						MAX98520_R2092_AMP_DSP_CFG, MAX98520_SPK_SAFE_EN_MASK, 0);

CHECK: Alignment should match open parenthesis
#664: FILE: sound/soc/codecs/max98520.c:600:
+	regmap_update_bits(max98520->regmap,
+						MAX98520_R2092_AMP_DSP_CFG, MAX98520_SPK_SAFE_EN_MASK, 0);

CHECK: Alignment should match open parenthesis
#676: FILE: sound/soc/codecs/max98520.c:612:
+	regmap_update_bits(max98520->regmap,
+						MAX98520_R204F_PCM_RX_EN,

CHECK: Please use a blank line after function/struct/union/enum declarations
#691: FILE: sound/soc/codecs/max98520.c:627:
+}
+static int max98520_resume(struct device *dev)

CHECK: Alignment should match open parenthesis
#732: FILE: sound/soc/codecs/max98520.c:668:
+static int max98520_i2c_probe(struct i2c_client *i2c,
+	const struct i2c_device_id *id)

CHECK: Blank lines aren't necessary after an open brace '{'
#734: FILE: sound/soc/codecs/max98520.c:670:
+{
+

CHECK: Alignment should match open parenthesis
#741: FILE: sound/soc/codecs/max98520.c:677:
+	ret = i2c_check_functionality(adapter,
+		I2C_FUNC_SMBUS_BYTE

CHECK: Assignment operator '=' should be on the previous line
#758: FILE: sound/soc/codecs/max98520.c:694:
+	max98520->regmap
+		= devm_regmap_init_i2c(i2c, &max98520_regmap);

CHECK: Alignment should match open parenthesis
#783: FILE: sound/soc/codecs/max98520.c:719:
+	ret = regmap_read(max98520->regmap,
+		MAX98520_R21FF_REVISION_ID, &reg);

WARNING: DT compatible string "maxim,max98520" appears un-documented --
check ./Documentation/devicetree/bindings/
#810: FILE: sound/soc/codecs/max98520.c:746:
+	{ .compatible = "maxim,max98520", },

WARNING: From:/Signed-off-by: email address mismatch: 'From: George Song
<george.song@maximintegrated.com>' != 'Signed-off-by: George Song
<george.song@analog.com>'

total: 0 errors, 6 warnings, 37 checks, 967 lines checked

NOTE: For some of the reported defects, checkpatch may be able to
      mechanically convert to the typical style using --fix or
--fix-inplace.

0001-ASoC-max98520-Add-max98520-audio-amplifier-driver.patch has style
problems, please review.

NOTE: If any of the errors are false positives, please report
      them to the maintainer, see CHECKPATCH in MAINTAINERS.

On 10/13/21 2:52 AM, George Song wrote:
