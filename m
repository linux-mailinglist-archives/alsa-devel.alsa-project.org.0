Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 87BBB3422B1
	for <lists+alsa-devel@lfdr.de>; Fri, 19 Mar 2021 18:00:16 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0E1471697;
	Fri, 19 Mar 2021 17:59:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0E1471697
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1616173216;
	bh=datOlDVpMovoC4w4yuj9dx3f4yDTMCmeaL6ofFUM/CA=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=gAqQ/I+3rrRl0GIJjK+WPaaZCReo2Fx/7RDvEvYFHjQxrZmilq1U0zVx1anerdBRK
	 1lfXWzUrxFGVGQeQzRGjVFDajHmOCvrhhzsHr3gvxiTHPAPCjTRbZtZbbqI2B2khie
	 2XSfqfFhk1+vmhLZj88f3A5z/EUaowM3mS6GhDbA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9159FF800E0;
	Fri, 19 Mar 2021 17:58:36 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C1C4AF80253; Fri, 19 Mar 2021 17:58:31 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EB434F801F7
 for <alsa-devel@alsa-project.org>; Fri, 19 Mar 2021 17:58:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EB434F801F7
IronPort-SDR: wDL/E3xLp89ddZs79y9EyuVSj1CdSEr67vpkBvIFdhj+MIAkgVwr6V6dLHdXoHH7OJyFIJoEQp
 aCWs0FxFhUMA==
X-IronPort-AV: E=McAfee;i="6000,8403,9928"; a="190022209"
X-IronPort-AV: E=Sophos;i="5.81,262,1610438400"; d="scan'208";a="190022209"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Mar 2021 09:58:22 -0700
IronPort-SDR: YYPJ4RXXvB6L5ArVrBuBvIqgIQmcinhurTX9PXeajQDd1M7aiTlG8GggITfc4tSunNKzbV5l97
 UzfQyHrjj2Vg==
X-IronPort-AV: E=Sophos;i="5.81,262,1610438400"; d="scan'208";a="406867310"
Received: from dgerstma-mobl.amr.corp.intel.com (HELO [10.212.157.39])
 ([10.212.157.39])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Mar 2021 09:58:21 -0700
Subject: Re: [PATCH v3 3/7] ASoC: codecs: wcd938x: add basic driver
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, broonie@kernel.org
References: <20210319092919.21218-1-srinivas.kandagatla@linaro.org>
 <20210319092919.21218-4-srinivas.kandagatla@linaro.org>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <00c2f3cf-ef72-0fdc-3c7a-9ccb6d075191@linux.intel.com>
Date: Fri, 19 Mar 2021 10:59:23 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210319092919.21218-4-srinivas.kandagatla@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: robh@kernel.org, alsa-devel@alsa-project.org, lgirdwood@gmail.com,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
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



On 3/19/21 4:29 AM, Srinivas Kandagatla wrote:
> This patch adds basic SoundWire codec driver to support for
> WCD938X TX and RX devices.

It took me a while to figure out that you are adding support for a codec 
that has 2 Slave interfaces internally, one for TX and one for RX dais.

Each of the interfaces will appear as a separate Linux device, even 
though they are physically in the same hardware component.

That perfectly legit from a SoundWire standpoint, but I wonder how you 
are going to handle pm_runtime and regmap access if the two parts are 
joined at the hip for imp-def register access (described in the cover 
letter as "Even though this device has two SoundWire devices, only tx 
device has access to main codec Control/Status Registers!").

I was clearly unable to figure out how regmap/gpios/regulator were 
handled between the two TX and TX parts.

See more below.

> diff --git a/sound/soc/codecs/wcd938x-sdw.c b/sound/soc/codecs/wcd938x-sdw.c
> new file mode 100644
> index 000000000000..ca29793b0972
> --- /dev/null
> +++ b/sound/soc/codecs/wcd938x-sdw.c
> @@ -0,0 +1,291 @@
> +// SPDX-License-Identifier: GPL-2.0

GPL-2.0-only for consistency with the other additions below?


> +static int wcd9380_probe(struct sdw_slave *pdev,
> +			 const struct sdw_device_id *id)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct wcd938x_sdw_priv *wcd;
> +	const char *dir = "rx";
> +	int ret;
> +
> +	wcd = devm_kzalloc(dev, sizeof(*wcd), GFP_KERNEL);
> +	if (!wcd)
> +		return -ENOMEM;
> +
> +	of_property_read_string(dev->of_node, "direction", &dir);
> +	if (!strcmp(dir, "tx"))
> +		wcd->is_tx = true;
> +	else
> +		wcd->is_tx = false;
> +
> +

extra line

> +	ret = of_property_read_variable_u32_array(dev->of_node, "qcom,port-mapping",
> +						  wcd->port_map,
> +						  WCD938X_MAX_TX_SWR_PORTS,
> +						  WCD938X_MAX_SWR_PORTS);
> +	if (ret)
> +		dev_info(dev, "Static Port mapping not specified\n");
> +
> +	wcd->sdev = pdev;
> +	dev_set_drvdata(dev, wcd);
> +	ret = wcd938x_init(wcd);
> +	if (ret)
> +		return ret;
> +
> +	pdev->prop.scp_int1_mask = SDW_SCP_INT1_IMPL_DEF |
> +					SDW_SCP_INT1_BUS_CLASH |
> +					SDW_SCP_INT1_PARITY;
> +	pdev->prop.lane_control_support = true;
> +	if (wcd->is_tx) {
> +		pdev->prop.source_ports = GENMASK(WCD938X_MAX_SWR_PORTS, 0);
> +		pdev->prop.src_dpn_prop = wcd938x_dpn_prop;
> +		wcd->ch_info = &wcd938x_sdw_tx_ch_info[0];
> +		pdev->prop.wake_capable = true;
> +	} else {
> +		pdev->prop.sink_ports = GENMASK(WCD938X_MAX_SWR_PORTS, 0);
> +		pdev->prop.sink_dpn_prop = wcd938x_dpn_prop;
> +		wcd->ch_info = &wcd938x_sdw_rx_ch_info[0];
> +	}
> +
> +	if (wcd->is_tx)
> +		return wcd938x_register_component(wcd, dev, &wcd938x_tx_dai);
> +	else
> +		return wcd938x_register_component(wcd, dev, &wcd938x_rx_dai);
> +
> +}
> +
> +static const struct sdw_device_id wcd9380_slave_id[] = {
> +	SDW_SLAVE_ENTRY(0x0217, 0x10d, 0),

does this mean you cannot determine the functionality of the device by 
looking at the devId registers?

I would have expected each interface to have a different part ID to show 
that they are different...such tricks would not work in the ACPI world 
at the moment, the expectation was really that different part numbers 
are unique enough to know what to expect.


> +	{},
> +};
> +MODULE_DEVICE_TABLE(sdw, wcd9380_slave_id);
> +
> +static struct sdw_driver wcd9380_codec_driver = {
> +	.probe	= wcd9380_probe,
> +	.ops = &wcd9380_slave_ops,
> +	.id_table = wcd9380_slave_id,
> +	.driver = {
> +		.name	= "wcd9380-codec",
> +	}
> +};
> +module_sdw_driver(wcd9380_codec_driver);

[...]

> +static bool wcd938x_readable_register(struct device *dev, unsigned int reg)
> +{
> +	bool ret;
> +
> +	ret = wcd938x_readonly_register(dev, reg);
> +	if (!ret)
> +		return wcd938x_rdwr_register(dev, reg);
> +
> +	return ret;
> +}
> +
> +static bool wcd938x_writeable_register(struct device *dev, unsigned int reg)
> +{
> +	return wcd938x_rdwr_register(dev, reg);
> +}
> +
> +static bool wcd938x_volatile_register(struct device *dev, unsigned int reg)
> +{
> +	if (reg <= WCD938X_BASE_ADDRESS)
> +		return 0;
> +
> +	if (reg == WCD938X_DIGITAL_SWR_TX_CLK_RATE)
> +		return true;
> +
> +	if (wcd938x_readonly_register(dev, reg))
> +		return true;
> +
> +	return false;
> +}

this part is quite confusing, you mentioned that only the TX interface 
has access to registers, but here you seem to expose regmap registers 
for both TX and RX?

> +
> +static struct regmap_config wcd938x_regmap_config = {
> +	.name = "wcd938x_csr",
> +	.reg_bits = 32,
> +	.val_bits = 8,
> +	.cache_type = REGCACHE_RBTREE,
> +	.reg_defaults = wcd938x_defaults,
> +	.num_reg_defaults = ARRAY_SIZE(wcd938x_defaults),
> +	.max_register = WCD938X_MAX_REGISTER,
> +	.readable_reg = wcd938x_readable_register,
> +	.writeable_reg = wcd938x_writeable_register,
> +	.volatile_reg = wcd938x_volatile_register,
> +	.can_multi_write = true,
> +};
> +
> +static const struct regmap_irq wcd938x_irqs[WCD938X_NUM_IRQS] = {
> +	REGMAP_IRQ_REG(WCD938X_IRQ_MBHC_BUTTON_PRESS_DET, 0, 0x01),
> +	REGMAP_IRQ_REG(WCD938X_IRQ_MBHC_BUTTON_RELEASE_DET, 0, 0x02),
> +	REGMAP_IRQ_REG(WCD938X_IRQ_MBHC_ELECT_INS_REM_DET, 0, 0x04),
> +	REGMAP_IRQ_REG(WCD938X_IRQ_MBHC_ELECT_INS_REM_LEG_DET, 0, 0x08),
> +	REGMAP_IRQ_REG(WCD938X_IRQ_MBHC_SW_DET, 0, 0x10),
> +	REGMAP_IRQ_REG(WCD938X_IRQ_HPHR_OCP_INT, 0, 0x20),
> +	REGMAP_IRQ_REG(WCD938X_IRQ_HPHR_CNP_INT, 0, 0x40),
> +	REGMAP_IRQ_REG(WCD938X_IRQ_HPHL_OCP_INT, 0, 0x80),
> +	REGMAP_IRQ_REG(WCD938X_IRQ_HPHL_CNP_INT, 1, 0x01),
> +	REGMAP_IRQ_REG(WCD938X_IRQ_EAR_CNP_INT, 1, 0x02),
> +	REGMAP_IRQ_REG(WCD938X_IRQ_EAR_SCD_INT, 1, 0x04),
> +	REGMAP_IRQ_REG(WCD938X_IRQ_AUX_CNP_INT, 1, 0x08),
> +	REGMAP_IRQ_REG(WCD938X_IRQ_AUX_SCD_INT, 1, 0x10),
> +	REGMAP_IRQ_REG(WCD938X_IRQ_HPHL_PDM_WD_INT, 1, 0x20),
> +	REGMAP_IRQ_REG(WCD938X_IRQ_HPHR_PDM_WD_INT, 1, 0x40),
> +	REGMAP_IRQ_REG(WCD938X_IRQ_AUX_PDM_WD_INT, 1, 0x80),
> +	REGMAP_IRQ_REG(WCD938X_IRQ_LDORT_SCD_INT, 2, 0x01),
> +	REGMAP_IRQ_REG(WCD938X_IRQ_MBHC_MOISTURE_INT, 2, 0x02),
> +	REGMAP_IRQ_REG(WCD938X_IRQ_HPHL_SURGE_DET_INT, 2, 0x04),
> +	REGMAP_IRQ_REG(WCD938X_IRQ_HPHR_SURGE_DET_INT, 2, 0x08),
> +};
> +
> +static struct regmap_irq_chip wcd938x_regmap_irq_chip = {
> +	.name = "wcd938x",
> +	.irqs = wcd938x_irqs,
> +	.num_irqs = ARRAY_SIZE(wcd938x_irqs),
> +	.num_regs = 3,
> +	.status_base = WCD938X_DIGITAL_INTR_STATUS_0,
> +	.mask_base = WCD938X_DIGITAL_INTR_MASK_0,
> +	.type_base = WCD938X_DIGITAL_INTR_LEVEL_0,
> +	.ack_base = WCD938X_DIGITAL_INTR_CLEAR_0,
> +	.use_ack = 1,
> +	.runtime_pm = true,
> +	.irq_drv_data = NULL,
> +};
> +
> +int wcd938x_io_init(struct wcd938x_sdw_priv *wcd)
> +{
> +	struct regmap *rm = wcd->wcd938x->regmap;
> +
> +	if (!wcd->is_tx)
> +		return 0;

and here you only initialize the registers for the tx case, so what 
happens you you dump the rx registers or try to set them with 
/sys/kernel/debug/regmap?

> +
> +	regmap_update_bits(rm, WCD938X_SLEEP_CTL, 0x0E, 0x0E);
> +	regmap_update_bits(rm, WCD938X_SLEEP_CTL, 0x80, 0x80);
> +	/* 1 msec delay as per HW requirement */
> +	usleep_range(1000, 1010);
> +	regmap_update_bits(rm, WCD938X_SLEEP_CTL, 0x40, 0x40);
> +	/* 1 msec delay as per HW requirement */
> +	usleep_range(1000, 1010);
> +	regmap_update_bits(rm, WCD938X_LDORXTX_CONFIG, 0x10, 0x00);
> +	regmap_update_bits(rm, WCD938X_BIAS_VBG_FINE_ADJ,
> +								0xF0, 0x80);
> +	regmap_update_bits(rm, WCD938X_ANA_BIAS, 0x80, 0x80);
> +	regmap_update_bits(rm, WCD938X_ANA_BIAS, 0x40, 0x40);
> +	/* 10 msec delay as per HW requirement */
> +	usleep_range(10000, 10010);
> +
> +	regmap_update_bits(rm, WCD938X_ANA_BIAS, 0x40, 0x00);
> +	regmap_update_bits(rm, WCD938X_HPH_NEW_INT_RDAC_GAIN_CTL,
> +				      0xF0, 0x00);
> +	regmap_update_bits(rm, WCD938X_HPH_NEW_INT_RDAC_HD2_CTL_L_NEW,
> +				      0x1F, 0x15);
> +	regmap_update_bits(rm, WCD938X_HPH_NEW_INT_RDAC_HD2_CTL_R_NEW,
> +				      0x1F, 0x15);
> +	regmap_update_bits(rm, WCD938X_HPH_REFBUFF_UHQA_CTL,
> +				      0xC0, 0x80);
> +	regmap_update_bits(rm, WCD938X_DIGITAL_CDC_DMIC_CTL,
> +				      0x02, 0x02);
> +
> +	regmap_update_bits(rm, WCD938X_TX_COM_NEW_INT_TXFE_ICTRL_STG2CASC_ULP,
> +			   0xFF, 0x14);
> +	regmap_update_bits(rm, WCD938X_TX_COM_NEW_INT_TXFE_ICTRL_STG2MAIN_ULP,
> +			   0x1F, 0x08);
> +
> +	regmap_update_bits(rm, WCD938X_DIGITAL_TX_REQ_FB_CTL_0, 0xFF, 0x55);
> +	regmap_update_bits(rm, WCD938X_DIGITAL_TX_REQ_FB_CTL_1, 0xFF, 0x44);
> +	regmap_update_bits(rm, WCD938X_DIGITAL_TX_REQ_FB_CTL_2, 0xFF, 0x11);
> +	regmap_update_bits(rm, WCD938X_DIGITAL_TX_REQ_FB_CTL_3, 0xFF, 0x00);
> +	regmap_update_bits(rm, WCD938X_DIGITAL_TX_REQ_FB_CTL_4, 0xFF, 0x00);
> +
> +	/* Set Noise Filter Resistor value */
> +	regmap_update_bits(rm, WCD938X_MICB1_TEST_CTL_1, 0xE0, 0xE0);
> +	regmap_update_bits(rm, WCD938X_MICB2_TEST_CTL_1, 0xE0, 0xE0);
> +	regmap_update_bits(rm, WCD938X_MICB3_TEST_CTL_1, 0xE0, 0xE0);
> +	regmap_update_bits(rm, WCD938X_MICB4_TEST_CTL_1, 0xE0, 0xE0);
> +
> +	regmap_update_bits(rm, WCD938X_TX_3_4_TEST_BLK_EN2, 0x01, 0x00);
> +	regmap_update_bits(rm, WCD938X_HPH_SURGE_HPHLR_SURGE_EN, 0xC0, 0xC0);
> +
> +	return 0;
> +
> +}
> +
> +static int wcd938x_get_micb_vout_ctl_val(u32 micb_mv)
> +{
> +	/* min micbias voltage is 1V and maximum is 2.85V */
> +	if (micb_mv < 1000 || micb_mv > 2850)
> +		return -EINVAL;
> +
> +	return (micb_mv - 1000) / 50;
> +}
> +
> +static int wcd938x_set_micbias_data(struct wcd938x_priv *wcd938x)
> +{
> +	int vout_ctl_1, vout_ctl_2, vout_ctl_3, vout_ctl_4;
> +
> +	/* set micbias voltage */
> +	vout_ctl_1 = wcd938x_get_micb_vout_ctl_val(wcd938x->micb1_mv);
> +	vout_ctl_2 = wcd938x_get_micb_vout_ctl_val(wcd938x->micb2_mv);
> +	vout_ctl_3 = wcd938x_get_micb_vout_ctl_val(wcd938x->micb3_mv);
> +	vout_ctl_4 = wcd938x_get_micb_vout_ctl_val(wcd938x->micb4_mv);
> +	if (vout_ctl_1 < 0 || vout_ctl_2 < 0 || vout_ctl_3 < 0 || vout_ctl_4 < 0)
> +		return -EINVAL;
> +
> +	regmap_update_bits(wcd938x->regmap, WCD938X_ANA_MICB1,
> +			   WCD938X_MICB_VOUT_MASK, vout_ctl_1);
> +	regmap_update_bits(wcd938x->regmap, WCD938X_ANA_MICB2,
> +			   WCD938X_MICB_VOUT_MASK, vout_ctl_2);
> +	regmap_update_bits(wcd938x->regmap, WCD938X_ANA_MICB3,
> +			   WCD938X_MICB_VOUT_MASK, vout_ctl_3);
> +	regmap_update_bits(wcd938x->regmap, WCD938X_ANA_MICB4,
> +			   WCD938X_MICB_VOUT_MASK, vout_ctl_4);
> +
> +	return 0;
> +}
> +
> +static int wcd938x_soc_codec_rx_probe(struct snd_soc_component *component)
> +{
> +	struct wcd938x_sdw_priv *wcd = snd_soc_component_get_drvdata(component);
> +	struct wcd938x_priv *wcd938x = wcd->wcd938x;
> +
> +	snd_soc_component_init_regmap(component, wcd938x->regmap);
> +
> +	wcd938x->clsh_info = wcd_clsh_ctrl_alloc(component, WCD938X);
> +
> +	return 0;
> +}
> +
> +static irqreturn_t wcd938x_wd_handle_irq(int irq, void *data)
> +{
> +	return IRQ_HANDLED;
> +}
> +
> +static struct irq_chip wcd_irq_chip = {
> +	.name = "WCD938x",
> +};
> +
> +static int wcd_irq_chip_map(struct irq_domain *irqd, unsigned int virq,
> +			irq_hw_number_t hw)
> +{
> +	irq_set_chip_and_handler(virq, &wcd_irq_chip, handle_simple_irq);
> +	irq_set_nested_thread(virq, 1);
> +	irq_set_noprobe(virq);
> +
> +	return 0;
> +}
> +
> +static const struct irq_domain_ops wcd_domain_ops = {
> +	.map = wcd_irq_chip_map,
> +};
> +
> +static int wcd938x_irq_init(struct wcd938x_sdw_priv *data, struct device *dev)
> +{
> +	struct wcd938x_priv *wcd = data->wcd938x;
> +
> +	wcd->virq = irq_domain_add_linear(NULL, 1, &wcd_domain_ops, NULL);
> +	if (!(wcd->virq)) {
> +		dev_err(dev, "%s: Failed to add IRQ domain\n", __func__);
> +		return -EINVAL;
> +	}
> +
> +	return devm_regmap_add_irq_chip(dev, wcd->regmap,
> +					irq_create_mapping(wcd->virq, 0),
> +					IRQF_ONESHOT, 0, &wcd938x_regmap_irq_chip,
> +					&wcd->irq_chip);
> +}
> +
> +static int wcd938x_soc_codec_probe(struct snd_soc_component *component)

is this supposed to be soc_tx_codec_probe()?

> +{
> +	struct wcd938x_sdw_priv *wcd = snd_soc_component_get_drvdata(component);
> +	struct wcd938x_priv *wcd938x = wcd->wcd938x;
> +	struct device *dev = component->dev;
> +	int ret, i;
> +
> +	wait_for_completion_timeout(&wcd->sdev->initialization_complete,
> +				    msecs_to_jiffies(3000));
> +
> +	snd_soc_component_init_regmap(component, wcd938x->regmap);
> +
> +	wcd938x->variant = snd_soc_component_read_field(component,
> +						 WCD938X_DIGITAL_EFUSE_REG_0,
> +						 WCD938X_ID_MASK);
> +
> +	/* Set all interrupts as edge triggered */
> +	for (i = 0; i < wcd938x_regmap_irq_chip.num_regs; i++) {
> +		regmap_write(wcd938x->regmap,
> +			     (WCD938X_DIGITAL_INTR_LEVEL_0 + i), 0);
> +	}
> +
> +	ret = wcd938x_irq_init(wcd, component->dev);
> +	if (ret) {
> +		dev_err(component->dev, "%s: IRQ init failed: %d\n",
> +			__func__, ret);
> +		return ret;
> +	}
> +
> +	wcd938x->hphr_pdm_wd_int = regmap_irq_get_virq(wcd938x->irq_chip,
> +						       WCD938X_IRQ_HPHR_PDM_WD_INT);
> +	wcd938x->hphl_pdm_wd_int = regmap_irq_get_virq(wcd938x->irq_chip,
> +						       WCD938X_IRQ_HPHL_PDM_WD_INT);
> +	wcd938x->aux_pdm_wd_int = regmap_irq_get_virq(wcd938x->irq_chip,
> +						       WCD938X_IRQ_AUX_PDM_WD_INT);
> +
> +	/* Request for watchdog interrupt */
> +	ret = request_threaded_irq(wcd938x->hphr_pdm_wd_int, NULL, wcd938x_wd_handle_irq,
> +				   IRQF_ONESHOT | IRQF_TRIGGER_RISING,
> +				   "HPHR PDM WD INT", wcd938x);
> +	if (ret)
> +		dev_err(dev, "Failed to request HPHR WD interrupt (%d)\n", ret);
> +
> +	ret = request_threaded_irq(wcd938x->hphl_pdm_wd_int, NULL, wcd938x_wd_handle_irq,
> +				   IRQF_ONESHOT | IRQF_TRIGGER_RISING,
> +				   "HPHL PDM WD INT", wcd938x);
> +	if (ret)
> +		dev_err(dev, "Failed to request HPHL WD interrupt (%d)\n", ret);
> +
> +	ret = request_threaded_irq(wcd938x->aux_pdm_wd_int, NULL, wcd938x_wd_handle_irq,
> +				   IRQF_ONESHOT | IRQF_TRIGGER_RISING,
> +				   "AUX PDM WD INT", wcd938x);
> +	if (ret)
> +		dev_err(dev, "Failed to request Aux WD interrupt (%d)\n", ret);
> +
> +	/* Disable watchdog interrupt for HPH and AUX */
> +	disable_irq_nosync(wcd938x->hphr_pdm_wd_int);
> +	disable_irq_nosync(wcd938x->hphl_pdm_wd_int);
> +	disable_irq_nosync(wcd938x->aux_pdm_wd_int);
> +
> +	return ret;
> +}
> +
> +static const struct snd_soc_component_driver soc_codec_dev_wcd938x_sdw_rx = {
> +	.name = "wcd938x_codec_rx",
> +	.probe = wcd938x_soc_codec_rx_probe,
> +};
> +
> +static const struct snd_soc_component_driver soc_codec_dev_wcd938x_sdw_tx = {
> +	.name = "wcd938x_codec_tx",
> +	.probe = wcd938x_soc_codec_probe,
> +};
> +
> +static void wcd938x_dt_parse_micbias_info(struct device *dev, struct wcd938x_priv *wcd)
> +{
> +	struct device_node *np = dev->of_node;
> +	u32 prop_val = 0;
> +	int rc = 0;
> +
> +	rc = of_property_read_u32(np, "qcom,micbias1-microvolt",  &prop_val);
> +	if (!rc)
> +		wcd->micb1_mv = prop_val/1000;
> +	else
> +		dev_info(dev, "%s: Micbias1 DT property not found\n", __func__);
> +
> +	rc = of_property_read_u32(np, "qcom,micbias2-microvolt",  &prop_val);
> +	if (!rc)
> +		wcd->micb2_mv = prop_val/1000;
> +	else
> +		dev_info(dev, "%s: Micbias2 DT property not found\n", __func__);
> +
> +	rc = of_property_read_u32(np, "qcom,micbias3-microvolt", &prop_val);
> +	if (!rc)
> +		wcd->micb3_mv = prop_val/1000;
> +	else
> +		dev_info(dev, "%s: Micbias3 DT property not found\n", __func__);
> +
> +	rc = of_property_read_u32(np, "qcom,micbias4-microvolt",  &prop_val);
> +	if (!rc)
> +		wcd->micb4_mv = prop_val/1000;
> +	else
> +		dev_info(dev, "%s: Micbias4 DT property not found\n", __func__);
> +}
> +
> +static int wcd938x_populate_dt_data(struct wcd938x_sdw_priv *wcd, struct device *dev)
> +{
> +	struct wcd938x_priv *wcd938x = wcd->wcd938x;
> +	int ret;
> +
> +

extra lines

> +	wcd938x->reset_gpio = of_get_named_gpio(dev->of_node, "reset-gpios", 0);
> +	if (wcd938x->reset_gpio < 0) {
> +		dev_err(dev, "Failed to get reset gpio: err = %d\n",
> +			wcd938x->reset_gpio);
> +		return wcd938x->reset_gpio;
> +	}
> +
> +	wcd938x->supplies[0].supply = "vdd-rxtx";
> +	wcd938x->supplies[1].supply = "vdd-io";
> +	wcd938x->supplies[2].supply = "vdd-buck";
> +	wcd938x->supplies[3].supply = "vdd-mic-bias";
> +
> +	ret = regulator_bulk_get(dev, WCD938X_MAX_SUPPLY, wcd938x->supplies);
> +	if (ret) {
> +		dev_err(dev, "Failed to get supplies: err = %d\n", ret);
> +		return ret;
> +	}
> +
> +	ret = regulator_bulk_enable(WCD938X_MAX_SUPPLY, wcd938x->supplies);
> +	if (ret) {
> +		dev_err(dev, "Failed to enable supplies: err = %d\n", ret);
> +		return ret;
> +	}
> +
> +	wcd938x_dt_parse_micbias_info(dev, wcd938x);
> +	return 0;
> +}
> +
> +static int wcd938x_reset(struct wcd938x_sdw_priv *wcd, struct device *dev)
> +{
> +	struct wcd938x_priv *wcd938x = wcd->wcd938x;
> +
> +	gpio_direction_output(wcd938x->reset_gpio, 0);
> +	/* 20us sleep required after pulling the reset gpio to LOW */
> +	usleep_range(20, 30);
> +	gpio_set_value(wcd938x->reset_gpio, 1);
> +	/* 20us sleep required after pulling the reset gpio to HIGH */
> +	usleep_range(20, 30);

so each Slave device has its own GPIOs and regulators?

> +
> +	return 0;
> +}
> +
> +static int __wcd938x_init(struct wcd938x_sdw_priv *wcd, struct device *dev)
> +{
> +	int ret;
> +	struct wcd938x_priv *wcd938x = wcd->wcd938x;
> +
> +	wcd938x_reset(wcd, dev);
> +
> +	wcd938x->regmap = devm_regmap_init_sdw(wcd->sdev, &wcd938x_regmap_config);
> +	if (IS_ERR(wcd938x->regmap)) {
> +		dev_err(dev, "%s: Regmap init failed\n", __func__);
> +		return PTR_ERR(wcd938x->regmap);
> +	}
> +
> +	ret = wcd938x_set_micbias_data(wcd938x);
> +	if (ret < 0) {
> +		dev_err(dev, "%s: bad micbias data\n", __func__);
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +int wcd938x_register_component(struct wcd938x_sdw_priv *wcd, struct device *dev,
> +			       struct snd_soc_dai_driver *dai_driver)
> +{
> +	if (wcd->is_tx)
> +		return snd_soc_register_component(dev,
> +						  &soc_codec_dev_wcd938x_sdw_tx,
> +						  dai_driver, 1);
> +	else
> +		return snd_soc_register_component(dev,
> +						  &soc_codec_dev_wcd938x_sdw_rx,
> +						  dai_driver, 1);
> +}
> +
> +int wcd938x_handle_sdw_irq(struct wcd938x_sdw_priv *wcd)
> +{
> +	struct wcd938x_priv *wcd938x = wcd->wcd938x;
> +	struct irq_domain *slave_irq = wcd938x->virq;
> +	u32 sts1, sts2, sts3;
> +
> +	do {
> +		handle_nested_irq(irq_find_mapping(slave_irq, 0));
> +		regmap_read(wcd938x->regmap, WCD938X_DIGITAL_INTR_STATUS_0, &sts1);
> +		regmap_read(wcd938x->regmap, WCD938X_DIGITAL_INTR_STATUS_1, &sts2);
> +		regmap_read(wcd938x->regmap, WCD938X_DIGITAL_INTR_STATUS_2, &sts3);
> +
> +	} while (sts1 || sts2 || sts3);

no timeout in case the hardware is stuck?

> +
> +	return IRQ_HANDLED;
> +}
> +
> +int wcd938x_init(struct wcd938x_sdw_priv *data)
> +{
> +	struct wcd938x_priv *wcd938x = NULL;

initialization doesn't seem needed

> +	struct device *dev = &data->sdev->dev;
> +	bool is_tx = data->is_tx;
> +	int ret;
> +
> +	if (!is_tx) {
> +		if (g_wcd938x) {
> +			data->wcd938x = g_wcd938x;
> +			return 0;
> +		} else {
> +			return -EPROBE_DEFER;
> +		}
> +	}
> +
> +	wcd938x = devm_kzalloc(dev, sizeof(struct wcd938x_priv),
> +				GFP_KERNEL);
> +	if (!wcd938x)
> +		return -ENOMEM;
> +
> +	data->wcd938x = wcd938x;
> +	g_wcd938x = wcd938x;
> +	wcd938x->dev = dev;
> +	ret = wcd938x_populate_dt_data(data, dev);
> +	if (ret) {
> +		dev_err(dev, "%s: Fail to obtain platform data\n", __func__);
> +		return -EINVAL;
> +	}
> +
> +	ret = __wcd938x_init(data, dev);
> +	if (ret) {
> +		dev_err(dev, "%s: Fail to init\n", __func__);
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +int wcd938x_deinit(struct wcd938x_sdw_priv *wcd)
> +{
> +	struct wcd938x_priv *wcd938x = wcd->wcd938x;
> +
> +	if (!wcd->is_tx)
> +		wcd_clsh_ctrl_free(wcd938x->clsh_info);
> +
> +	g_wcd938x = NULL;
> +
> +	return 0;
> +}
> diff --git a/sound/soc/codecs/wcd938x.h b/sound/soc/codecs/wcd938x.h
> new file mode 100644
> index 000000000000..c373850f209e
> --- /dev/null
> +++ b/sound/soc/codecs/wcd938x.h
> @@ -0,0 +1,676 @@
> +/* SPDX-License-Identifier: GPL-2.0 */

GPL-2.0-only

> +#define WCD938X_MAX_SWR_CH_IDS	15

what is this value? SoundWire supports up to 8 channels.
