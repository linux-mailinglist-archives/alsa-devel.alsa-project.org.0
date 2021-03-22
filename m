Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FCD2343DCB
	for <lists+alsa-devel@lfdr.de>; Mon, 22 Mar 2021 11:28:20 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E901D1669;
	Mon, 22 Mar 2021 11:27:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E901D1669
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1616408899;
	bh=B1jOjns0Q8AbWJ2sTf78HwDPt4h7nEOnQCAq9FyqoO0=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=TTcZ79DE/b2ifHw5Ls7y7DwHe7qBGhkN03pocZFjKoSWKi3wR8SCAmX/ErWs+VtuH
	 4yBgsLyB3QqvNbHyEqqCuc+h3enPtTcivb7C7MDfwghKw2A68M7FHsvWhqQ2Rjy0jH
	 NiQDfJGiBOufFSVPxrCQ9ipq3bx7R9cgS4d/9XYU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 84A50F80240;
	Mon, 22 Mar 2021 11:27:24 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7538DF801EC; Mon, 22 Mar 2021 11:27:22 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C5714F80156
 for <alsa-devel@alsa-project.org>; Mon, 22 Mar 2021 11:27:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C5714F80156
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="AbJ6ubnO"
Received: by mail-wr1-x42f.google.com with SMTP id b9so16065717wrt.8
 for <alsa-devel@alsa-project.org>; Mon, 22 Mar 2021 03:27:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=g9iFBkquz99eLCoepZRGNrwSd+ZcsZ+/GLZN8Jn7qGw=;
 b=AbJ6ubnOlhJNoCLRwPI4jmh+Tfw9poS2B8zQdu1j3iQhNHeG1gdkoU4QwU79EnKFHU
 YnCxO/ydRjO98gcpMDykqEezO71D44zFqB5ujQkV5aWE3ebmTR8BRr9JzQDVaF2bsGXO
 377hsd7TmfcUY3MQ8QqTpAvA10S0JmV/lAUzRtqeTJAywrRFSrIsxg0KRZEq86Iq/rET
 jUJRcg3UNTjQCZ/Av6tpBsPW0BJpWgiW/34Qgkm1sPJrZBkb+4/Bx8nhy6nGN331FoeM
 Bs9cYBzMQPbSAbQHH2kbhwC6faPP7oFg8ySQ9TGRIIV2gtQ1VkETB9eSL9ixSMofw6F/
 jqIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=g9iFBkquz99eLCoepZRGNrwSd+ZcsZ+/GLZN8Jn7qGw=;
 b=eEG5CLTNQptt9fM5187UL16pa4UJf2/wy3b00mBAchVQEkCAClKD9cAfSc/nVwmEmY
 86OdO7C0FA9UVSuRQDryJ388amqeCIcI5cJgg0MEwTo8/FXyI1rMBAiiS0GrkMGdtrQs
 OneHhLUFaKiHgmveqIeEuiZB2fRqNwAKY8KFCiD2Y1JspVCYXwa/9io3kGhjLRhkP/sD
 g4uTWr57QGmvvF8rKSAMGExv8pAkulUe+sAXldSAFNZSlbrYV1508SAM9bCZfgPu4AeE
 5UFi9t0XedjR7skI914pj5UxOhxl7bYxe8gCeUZUnua+jM7KQC2PrPDdebPcRMOSHfU5
 KgxA==
X-Gm-Message-State: AOAM530yrIK21KrBgTBPcL4cHEztCXDHDV2MEteSES86LEp1rOM+G3pb
 qqKdBHwL0IDpNp2b6TUZ1FGONiVlNZntzg==
X-Google-Smtp-Source: ABdhPJzkvdr3wzQJbXCpC+91cSKScguFbsdPBw+BUilhqlDT2aHc9n9PpgXH4WEH34k2UBijXITlaQ==
X-Received: by 2002:a5d:4743:: with SMTP id o3mr17622820wrs.108.1616408838302; 
 Mon, 22 Mar 2021 03:27:18 -0700 (PDT)
Received: from [192.168.86.34]
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.googlemail.com with ESMTPSA id j123sm16116262wmb.1.2021.03.22.03.27.17
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 22 Mar 2021 03:27:17 -0700 (PDT)
Subject: Re: [PATCH v3 3/7] ASoC: codecs: wcd938x: add basic driver
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 broonie@kernel.org
References: <20210319092919.21218-1-srinivas.kandagatla@linaro.org>
 <20210319092919.21218-4-srinivas.kandagatla@linaro.org>
 <00c2f3cf-ef72-0fdc-3c7a-9ccb6d075191@linux.intel.com>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <96b2cccc-6b71-e70f-ba2c-38554c65e2c5@linaro.org>
Date: Mon, 22 Mar 2021 10:27:17 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <00c2f3cf-ef72-0fdc-3c7a-9ccb6d075191@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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



On 19/03/2021 15:59, Pierre-Louis Bossart wrote:
> 
> 
> On 3/19/21 4:29 AM, Srinivas Kandagatla wrote:
>> This patch adds basic SoundWire codec driver to support for
>> WCD938X TX and RX devices.
> 
> It took me a while to figure out that you are adding support for a codec 
> that has 2 Slave interfaces internally, one for TX and one for RX dais.
> 
> Each of the interfaces will appear as a separate Linux device, even 
> though they are physically in the same hardware component.
> 
> That perfectly legit from a SoundWire standpoint, but I wonder how you 
> are going to handle pm_runtime and regmap access if the two parts are 
> joined at the hip for imp-def register access (described in the cover 
> letter as "Even though this device has two SoundWire devices, only tx 
> device has access to main codec Control/Status Registers!").
> 
> I was clearly unable to figure out how regmap/gpios/regulator were 
> handled between the two TX and TX parts.
> 

tx regmap is shared between both the devices.
Regulators are also handled in common code for tx and rx device.

I added more detailed reply in cover letter reply.



> See more below.
> 
>> diff --git a/sound/soc/codecs/wcd938x-sdw.c 
>> b/sound/soc/codecs/wcd938x-sdw.c
>> new file mode 100644
>> index 000000000000..ca29793b0972
>> --- /dev/null
>> +++ b/sound/soc/codecs/wcd938x-sdw.c
>> @@ -0,0 +1,291 @@
>> +// SPDX-License-Identifier: GPL-2.0
> 
> GPL-2.0-only for consistency with the other additions below?
> 
> 
Sure will fix that!

>> +static int wcd9380_probe(struct sdw_slave *pdev,
>> +             const struct sdw_device_id *id)
>> +{
>> +    struct device *dev = &pdev->dev;
>> +    struct wcd938x_sdw_priv *wcd;
>> +    const char *dir = "rx";
>> +    int ret;
>> +
>> +    wcd = devm_kzalloc(dev, sizeof(*wcd), GFP_KERNEL);
>> +    if (!wcd)
>> +        return -ENOMEM;
>> +
>> +    of_property_read_string(dev->of_node, "direction", &dir);
>> +    if (!strcmp(dir, "tx"))
>> +        wcd->is_tx = true;
>> +    else
>> +        wcd->is_tx = false;
>> +
>> +
> 
> extra line
> 
>> +    ret = of_property_read_variable_u32_array(dev->of_node, 
>> "qcom,port-mapping",
>> +                          wcd->port_map,
>> +                          WCD938X_MAX_TX_SWR_PORTS,
>> +                          WCD938X_MAX_SWR_PORTS);
>> +    if (ret)
>> +        dev_info(dev, "Static Port mapping not specified\n");
>> +
>> +    wcd->sdev = pdev;
>> +    dev_set_drvdata(dev, wcd);
>> +    ret = wcd938x_init(wcd);
>> +    if (ret)
>> +        return ret;
>> +
>> +    pdev->prop.scp_int1_mask = SDW_SCP_INT1_IMPL_DEF |
>> +                    SDW_SCP_INT1_BUS_CLASH |
>> +                    SDW_SCP_INT1_PARITY;
>> +    pdev->prop.lane_control_support = true;
>> +    if (wcd->is_tx) {
>> +        pdev->prop.source_ports = GENMASK(WCD938X_MAX_SWR_PORTS, 0);
>> +        pdev->prop.src_dpn_prop = wcd938x_dpn_prop;
>> +        wcd->ch_info = &wcd938x_sdw_tx_ch_info[0];
>> +        pdev->prop.wake_capable = true;
>> +    } else {
>> +        pdev->prop.sink_ports = GENMASK(WCD938X_MAX_SWR_PORTS, 0);
>> +        pdev->prop.sink_dpn_prop = wcd938x_dpn_prop;
>> +        wcd->ch_info = &wcd938x_sdw_rx_ch_info[0];
>> +    }
>> +
>> +    if (wcd->is_tx)
>> +        return wcd938x_register_component(wcd, dev, &wcd938x_tx_dai);
>> +    else
>> +        return wcd938x_register_component(wcd, dev, &wcd938x_rx_dai);
>> +
>> +}
>> +
>> +static const struct sdw_device_id wcd9380_slave_id[] = {
>> +    SDW_SLAVE_ENTRY(0x0217, 0x10d, 0),
> 
> does this mean you cannot determine the functionality of the device by 
> looking at the devId registers?
> 
No, we can not, they have same device id.

> I would have expected each interface to have a different part ID to show 
> that they are different...such tricks would not work in the ACPI world 
> at the moment, the expectation was really that different part numbers 
> are unique enough to know what to expect.
> 
> 
>> +    {},
>> +};
>> +MODULE_DEVICE_TABLE(sdw, wcd9380_slave_id);
>> +
>> +static struct sdw_driver wcd9380_codec_driver = {
>> +    .probe    = wcd9380_probe,
>> +    .ops = &wcd9380_slave_ops,
>> +    .id_table = wcd9380_slave_id,
>> +    .driver = {
>> +        .name    = "wcd9380-codec",
>> +    }
>> +};
>> +module_sdw_driver(wcd9380_codec_driver);
> 
> [...]
> 
>> +static bool wcd938x_readable_register(struct device *dev, unsigned 
>> int reg)
>> +{
>> +    bool ret;
>> +
>> +    ret = wcd938x_readonly_register(dev, reg);
>> +    if (!ret)
>> +        return wcd938x_rdwr_register(dev, reg);
>> +
>> +    return ret;
>> +}
>> +
>> +static bool wcd938x_writeable_register(struct device *dev, unsigned 
>> int reg)
>> +{
>> +    return wcd938x_rdwr_register(dev, reg);
>> +}
>> +
>> +static bool wcd938x_volatile_register(struct device *dev, unsigned 
>> int reg)
>> +{
>> +    if (reg <= WCD938X_BASE_ADDRESS)
>> +        return 0;
>> +
>> +    if (reg == WCD938X_DIGITAL_SWR_TX_CLK_RATE)
>> +        return true;
>> +
>> +    if (wcd938x_readonly_register(dev, reg))
>> +        return true;
>> +
>> +    return false;
>> +}
> 
> this part is quite confusing, you mentioned that only the TX interface 
> has access to registers, but here you seem to expose regmap registers 
> for both TX and RX?

No, this regmap is only for tx.

Am happy to prefix them with tx if it helps.

>> +
>> +static struct regmap_config wcd938x_regmap_config = {
>> +    .name = "wcd938x_csr",
>> +    .reg_bits = 32,
>> +    .val_bits = 8,
>> +    .cache_type = REGCACHE_RBTREE,
>> +    .reg_defaults = wcd938x_defaults,
>> +    .num_reg_defaults = ARRAY_SIZE(wcd938x_defaults),
>> +    .max_register = WCD938X_MAX_REGISTER,
>> +    .readable_reg = wcd938x_readable_register,
>> +    .writeable_reg = wcd938x_writeable_register,
>> +    .volatile_reg = wcd938x_volatile_register,
>> +    .can_multi_write = true,
>> +};
>> +
>> +static const struct regmap_irq wcd938x_irqs[WCD938X_NUM_IRQS] = {
>> +    REGMAP_IRQ_REG(WCD938X_IRQ_MBHC_BUTTON_PRESS_DET, 0, 0x01),
>> +    REGMAP_IRQ_REG(WCD938X_IRQ_MBHC_BUTTON_RELEASE_DET, 0, 0x02),
>> +    REGMAP_IRQ_REG(WCD938X_IRQ_MBHC_ELECT_INS_REM_DET, 0, 0x04),
>> +    REGMAP_IRQ_REG(WCD938X_IRQ_MBHC_ELECT_INS_REM_LEG_DET, 0, 0x08),
>> +    REGMAP_IRQ_REG(WCD938X_IRQ_MBHC_SW_DET, 0, 0x10),
>> +    REGMAP_IRQ_REG(WCD938X_IRQ_HPHR_OCP_INT, 0, 0x20),
>> +    REGMAP_IRQ_REG(WCD938X_IRQ_HPHR_CNP_INT, 0, 0x40),
>> +    REGMAP_IRQ_REG(WCD938X_IRQ_HPHL_OCP_INT, 0, 0x80),
>> +    REGMAP_IRQ_REG(WCD938X_IRQ_HPHL_CNP_INT, 1, 0x01),
>> +    REGMAP_IRQ_REG(WCD938X_IRQ_EAR_CNP_INT, 1, 0x02),
>> +    REGMAP_IRQ_REG(WCD938X_IRQ_EAR_SCD_INT, 1, 0x04),
>> +    REGMAP_IRQ_REG(WCD938X_IRQ_AUX_CNP_INT, 1, 0x08),
>> +    REGMAP_IRQ_REG(WCD938X_IRQ_AUX_SCD_INT, 1, 0x10),
>> +    REGMAP_IRQ_REG(WCD938X_IRQ_HPHL_PDM_WD_INT, 1, 0x20),
>> +    REGMAP_IRQ_REG(WCD938X_IRQ_HPHR_PDM_WD_INT, 1, 0x40),
>> +    REGMAP_IRQ_REG(WCD938X_IRQ_AUX_PDM_WD_INT, 1, 0x80),
>> +    REGMAP_IRQ_REG(WCD938X_IRQ_LDORT_SCD_INT, 2, 0x01),
>> +    REGMAP_IRQ_REG(WCD938X_IRQ_MBHC_MOISTURE_INT, 2, 0x02),
>> +    REGMAP_IRQ_REG(WCD938X_IRQ_HPHL_SURGE_DET_INT, 2, 0x04),
>> +    REGMAP_IRQ_REG(WCD938X_IRQ_HPHR_SURGE_DET_INT, 2, 0x08),
>> +};
>> +
>> +static struct regmap_irq_chip wcd938x_regmap_irq_chip = {
>> +    .name = "wcd938x",
>> +    .irqs = wcd938x_irqs,
>> +    .num_irqs = ARRAY_SIZE(wcd938x_irqs),
>> +    .num_regs = 3,
>> +    .status_base = WCD938X_DIGITAL_INTR_STATUS_0,
>> +    .mask_base = WCD938X_DIGITAL_INTR_MASK_0,
>> +    .type_base = WCD938X_DIGITAL_INTR_LEVEL_0,
>> +    .ack_base = WCD938X_DIGITAL_INTR_CLEAR_0,
>> +    .use_ack = 1,
>> +    .runtime_pm = true,
>> +    .irq_drv_data = NULL,
>> +};
>> +
>> +int wcd938x_io_init(struct wcd938x_sdw_priv *wcd)
>> +{
>> +    struct regmap *rm = wcd->wcd938x->regmap;
>> +
>> +    if (!wcd->is_tx)
>> +        return 0;
> 
> and here you only initialize the registers for the tx case, so what 
> happens you you dump the rx registers or try to set them with 
> /sys/kernel/debug/regmap?

wcd->wcd938x->regmap is regmap for tx device.
There should be no regmap for rx device at all!

There will be only one entry for wcd938x in /sys/kernel/debug/regmap 
which is

/sys/kernel/debug/regmap/sdw:0:217:10d:0:3-wcd938x_csr


> 
>> +
>> +    regmap_update_bits(rm, WCD938X_SLEEP_CTL, 0x0E, 0x0E);
>> +    regmap_update_bits(rm, WCD938X_SLEEP_CTL, 0x80, 0x80);
>> +    /* 1 msec delay as per HW requirement */
>> +    usleep_range(1000, 1010);
>> +    regmap_update_bits(rm, WCD938X_SLEEP_CTL, 0x40, 0x40);
>> +    /* 1 msec delay as per HW requirement */
>> +    usleep_range(1000, 1010);
>> +    regmap_update_bits(rm, WCD938X_LDORXTX_CONFIG, 0x10, 0x00);
>> +    regmap_update_bits(rm, WCD938X_BIAS_VBG_FINE_ADJ,
>> +                                0xF0, 0x80);
>> +    regmap_update_bits(rm, WCD938X_ANA_BIAS, 0x80, 0x80);
>> +    regmap_update_bits(rm, WCD938X_ANA_BIAS, 0x40, 0x40);
>> +    /* 10 msec delay as per HW requirement */
>> +    usleep_range(10000, 10010);
>> +
>> +    regmap_update_bits(rm, WCD938X_ANA_BIAS, 0x40, 0x00);
>> +    regmap_update_bits(rm, WCD938X_HPH_NEW_INT_RDAC_GAIN_CTL,
>> +                      0xF0, 0x00);
>> +    regmap_update_bits(rm, WCD938X_HPH_NEW_INT_RDAC_HD2_CTL_L_NEW,
>> +                      0x1F, 0x15);
>> +    regmap_update_bits(rm, WCD938X_HPH_NEW_INT_RDAC_HD2_CTL_R_NEW,
>> +                      0x1F, 0x15);
>> +    regmap_update_bits(rm, WCD938X_HPH_REFBUFF_UHQA_CTL,
>> +                      0xC0, 0x80);
>> +    regmap_update_bits(rm, WCD938X_DIGITAL_CDC_DMIC_CTL,
>> +                      0x02, 0x02);
>> +
>> +    regmap_update_bits(rm, 
>> WCD938X_TX_COM_NEW_INT_TXFE_ICTRL_STG2CASC_ULP,
>> +               0xFF, 0x14);
>> +    regmap_update_bits(rm, 
>> WCD938X_TX_COM_NEW_INT_TXFE_ICTRL_STG2MAIN_ULP,
>> +               0x1F, 0x08);
>> +
>> +    regmap_update_bits(rm, WCD938X_DIGITAL_TX_REQ_FB_CTL_0, 0xFF, 0x55);
>> +    regmap_update_bits(rm, WCD938X_DIGITAL_TX_REQ_FB_CTL_1, 0xFF, 0x44);
>> +    regmap_update_bits(rm, WCD938X_DIGITAL_TX_REQ_FB_CTL_2, 0xFF, 0x11);
>> +    regmap_update_bits(rm, WCD938X_DIGITAL_TX_REQ_FB_CTL_3, 0xFF, 0x00);
>> +    regmap_update_bits(rm, WCD938X_DIGITAL_TX_REQ_FB_CTL_4, 0xFF, 0x00);
>> +
>> +    /* Set Noise Filter Resistor value */
>> +    regmap_update_bits(rm, WCD938X_MICB1_TEST_CTL_1, 0xE0, 0xE0);
>> +    regmap_update_bits(rm, WCD938X_MICB2_TEST_CTL_1, 0xE0, 0xE0);
>> +    regmap_update_bits(rm, WCD938X_MICB3_TEST_CTL_1, 0xE0, 0xE0);
>> +    regmap_update_bits(rm, WCD938X_MICB4_TEST_CTL_1, 0xE0, 0xE0);
>> +
>> +    regmap_update_bits(rm, WCD938X_TX_3_4_TEST_BLK_EN2, 0x01, 0x00);
>> +    regmap_update_bits(rm, WCD938X_HPH_SURGE_HPHLR_SURGE_EN, 0xC0, 
>> 0xC0);
>> +
>> +    return 0;
>> +
>> +}
>> +
>> +static int wcd938x_get_micb_vout_ctl_val(u32 micb_mv)
>> +{
>> +    /* min micbias voltage is 1V and maximum is 2.85V */
>> +    if (micb_mv < 1000 || micb_mv > 2850)
>> +        return -EINVAL;
>> +
>> +    return (micb_mv - 1000) / 50;
>> +}
>> +
>> +static int wcd938x_set_micbias_data(struct wcd938x_priv *wcd938x)
>> +{
>> +    int vout_ctl_1, vout_ctl_2, vout_ctl_3, vout_ctl_4;
>> +
>> +    /* set micbias voltage */
>> +    vout_ctl_1 = wcd938x_get_micb_vout_ctl_val(wcd938x->micb1_mv);
>> +    vout_ctl_2 = wcd938x_get_micb_vout_ctl_val(wcd938x->micb2_mv);
>> +    vout_ctl_3 = wcd938x_get_micb_vout_ctl_val(wcd938x->micb3_mv);
>> +    vout_ctl_4 = wcd938x_get_micb_vout_ctl_val(wcd938x->micb4_mv);
>> +    if (vout_ctl_1 < 0 || vout_ctl_2 < 0 || vout_ctl_3 < 0 || 
>> vout_ctl_4 < 0)
>> +        return -EINVAL;
>> +
>> +    regmap_update_bits(wcd938x->regmap, WCD938X_ANA_MICB1,
>> +               WCD938X_MICB_VOUT_MASK, vout_ctl_1);
>> +    regmap_update_bits(wcd938x->regmap, WCD938X_ANA_MICB2,
>> +               WCD938X_MICB_VOUT_MASK, vout_ctl_2);
>> +    regmap_update_bits(wcd938x->regmap, WCD938X_ANA_MICB3,
>> +               WCD938X_MICB_VOUT_MASK, vout_ctl_3);
>> +    regmap_update_bits(wcd938x->regmap, WCD938X_ANA_MICB4,
>> +               WCD938X_MICB_VOUT_MASK, vout_ctl_4);
>> +
>> +    return 0;
>> +}
>> +
>> +static int wcd938x_soc_codec_rx_probe(struct snd_soc_component 
>> *component)
>> +{
>> +    struct wcd938x_sdw_priv *wcd = 
>> snd_soc_component_get_drvdata(component);
>> +    struct wcd938x_priv *wcd938x = wcd->wcd938x;
>> +
>> +    snd_soc_component_init_regmap(component, wcd938x->regmap);
>> +
>> +    wcd938x->clsh_info = wcd_clsh_ctrl_alloc(component, WCD938X);
>> +
>> +    return 0;
>> +}
>> +
>> +static irqreturn_t wcd938x_wd_handle_irq(int irq, void *data)
>> +{
>> +    return IRQ_HANDLED;
>> +}
>> +
>> +static struct irq_chip wcd_irq_chip = {
>> +    .name = "WCD938x",
>> +};
>> +
>> +static int wcd_irq_chip_map(struct irq_domain *irqd, unsigned int virq,
>> +            irq_hw_number_t hw)
>> +{
>> +    irq_set_chip_and_handler(virq, &wcd_irq_chip, handle_simple_irq);
>> +    irq_set_nested_thread(virq, 1);
>> +    irq_set_noprobe(virq);
>> +
>> +    return 0;
>> +}
>> +
>> +static const struct irq_domain_ops wcd_domain_ops = {
>> +    .map = wcd_irq_chip_map,
>> +};
>> +
>> +static int wcd938x_irq_init(struct wcd938x_sdw_priv *data, struct 
>> device *dev)
>> +{
>> +    struct wcd938x_priv *wcd = data->wcd938x;
>> +
>> +    wcd->virq = irq_domain_add_linear(NULL, 1, &wcd_domain_ops, NULL);
>> +    if (!(wcd->virq)) {
>> +        dev_err(dev, "%s: Failed to add IRQ domain\n", __func__);
>> +        return -EINVAL;
>> +    }
>> +
>> +    return devm_regmap_add_irq_chip(dev, wcd->regmap,
>> +                    irq_create_mapping(wcd->virq, 0),
>> +                    IRQF_ONESHOT, 0, &wcd938x_regmap_irq_chip,
>> +                    &wcd->irq_chip);
>> +}
>> +
>> +static int wcd938x_soc_codec_probe(struct snd_soc_component *component)
> 
> is this supposed to be soc_tx_codec_probe()?
> 

Yes, I will rename such fuctions explictly in next version to avoid 
confusion.


>> +{
>> +    struct wcd938x_sdw_priv *wcd = 
>> snd_soc_component_get_drvdata(component);
>> +    struct wcd938x_priv *wcd938x = wcd->wcd938x;
>> +    struct device *dev = component->dev;
>> +    int ret, i;
>> +
>> +    wait_for_completion_timeout(&wcd->sdev->initialization_complete,
>> +                    msecs_to_jiffies(3000));
>> +
>> +    snd_soc_component_init_regmap(component, wcd938x->regmap);
>> +
>> +    wcd938x->variant = snd_soc_component_read_field(component,
>> +                         WCD938X_DIGITAL_EFUSE_REG_0,
>> +                         WCD938X_ID_MASK);
>> +
>> +    /* Set all interrupts as edge triggered */
>> +    for (i = 0; i < wcd938x_regmap_irq_chip.num_regs; i++) {
>> +        regmap_write(wcd938x->regmap,
>> +                 (WCD938X_DIGITAL_INTR_LEVEL_0 + i), 0);
>> +    }
>> +
>> +    ret = wcd938x_irq_init(wcd, component->dev);
>> +    if (ret) {
>> +        dev_err(component->dev, "%s: IRQ init failed: %d\n",
>> +            __func__, ret);
>> +        return ret;
>> +    }
>> +
>> +    wcd938x->hphr_pdm_wd_int = regmap_irq_get_virq(wcd938x->irq_chip,
>> +                               WCD938X_IRQ_HPHR_PDM_WD_INT);
>> +    wcd938x->hphl_pdm_wd_int = regmap_irq_get_virq(wcd938x->irq_chip,
>> +                               WCD938X_IRQ_HPHL_PDM_WD_INT);
>> +    wcd938x->aux_pdm_wd_int = regmap_irq_get_virq(wcd938x->irq_chip,
>> +                               WCD938X_IRQ_AUX_PDM_WD_INT);
>> +
>> +    /* Request for watchdog interrupt */
>> +    ret = request_threaded_irq(wcd938x->hphr_pdm_wd_int, NULL, 
>> wcd938x_wd_handle_irq,
>> +                   IRQF_ONESHOT | IRQF_TRIGGER_RISING,
>> +                   "HPHR PDM WD INT", wcd938x);
>> +    if (ret)
>> +        dev_err(dev, "Failed to request HPHR WD interrupt (%d)\n", ret);
>> +
>> +    ret = request_threaded_irq(wcd938x->hphl_pdm_wd_int, NULL, 
>> wcd938x_wd_handle_irq,
>> +                   IRQF_ONESHOT | IRQF_TRIGGER_RISING,
>> +                   "HPHL PDM WD INT", wcd938x);
>> +    if (ret)
>> +        dev_err(dev, "Failed to request HPHL WD interrupt (%d)\n", ret);
>> +
>> +    ret = request_threaded_irq(wcd938x->aux_pdm_wd_int, NULL, 
>> wcd938x_wd_handle_irq,
>> +                   IRQF_ONESHOT | IRQF_TRIGGER_RISING,
>> +                   "AUX PDM WD INT", wcd938x);
>> +    if (ret)
>> +        dev_err(dev, "Failed to request Aux WD interrupt (%d)\n", ret);
>> +
>> +    /* Disable watchdog interrupt for HPH and AUX */
>> +    disable_irq_nosync(wcd938x->hphr_pdm_wd_int);
>> +    disable_irq_nosync(wcd938x->hphl_pdm_wd_int);
>> +    disable_irq_nosync(wcd938x->aux_pdm_wd_int);
>> +
>> +    return ret;
>> +}
>> +
>> +static const struct snd_soc_component_driver 
>> soc_codec_dev_wcd938x_sdw_rx = {
>> +    .name = "wcd938x_codec_rx",
>> +    .probe = wcd938x_soc_codec_rx_probe,
>> +};
>> +
>> +static const struct snd_soc_component_driver 
>> soc_codec_dev_wcd938x_sdw_tx = {
>> +    .name = "wcd938x_codec_tx",
>> +    .probe = wcd938x_soc_codec_probe,
>> +};
>> +
>> +static void wcd938x_dt_parse_micbias_info(struct device *dev, struct 
>> wcd938x_priv *wcd)
>> +{
>> +    struct device_node *np = dev->of_node;
>> +    u32 prop_val = 0;
>> +    int rc = 0;
>> +
>> +    rc = of_property_read_u32(np, "qcom,micbias1-microvolt",  
>> &prop_val);
>> +    if (!rc)
>> +        wcd->micb1_mv = prop_val/1000;
>> +    else
>> +        dev_info(dev, "%s: Micbias1 DT property not found\n", __func__);
>> +
>> +    rc = of_property_read_u32(np, "qcom,micbias2-microvolt",  
>> &prop_val);
>> +    if (!rc)
>> +        wcd->micb2_mv = prop_val/1000;
>> +    else
>> +        dev_info(dev, "%s: Micbias2 DT property not found\n", __func__);
>> +
>> +    rc = of_property_read_u32(np, "qcom,micbias3-microvolt", &prop_val);
>> +    if (!rc)
>> +        wcd->micb3_mv = prop_val/1000;
>> +    else
>> +        dev_info(dev, "%s: Micbias3 DT property not found\n", __func__);
>> +
>> +    rc = of_property_read_u32(np, "qcom,micbias4-microvolt",  
>> &prop_val);
>> +    if (!rc)
>> +        wcd->micb4_mv = prop_val/1000;
>> +    else
>> +        dev_info(dev, "%s: Micbias4 DT property not found\n", __func__);
>> +}
>> +
>> +static int wcd938x_populate_dt_data(struct wcd938x_sdw_priv *wcd, 
>> struct device *dev)
>> +{
>> +    struct wcd938x_priv *wcd938x = wcd->wcd938x;
>> +    int ret;
>> +
>> +
> 
> extra lines
> 
>> +    wcd938x->reset_gpio = of_get_named_gpio(dev->of_node, 
>> "reset-gpios", 0);
>> +    if (wcd938x->reset_gpio < 0) {
>> +        dev_err(dev, "Failed to get reset gpio: err = %d\n",
>> +            wcd938x->reset_gpio);
>> +        return wcd938x->reset_gpio;
>> +    }
>> +
>> +    wcd938x->supplies[0].supply = "vdd-rxtx";
>> +    wcd938x->supplies[1].supply = "vdd-io";
>> +    wcd938x->supplies[2].supply = "vdd-buck";
>> +    wcd938x->supplies[3].supply = "vdd-mic-bias";
>> +
>> +    ret = regulator_bulk_get(dev, WCD938X_MAX_SUPPLY, 
>> wcd938x->supplies);
>> +    if (ret) {
>> +        dev_err(dev, "Failed to get supplies: err = %d\n", ret);
>> +        return ret;
>> +    }
>> +
>> +    ret = regulator_bulk_enable(WCD938X_MAX_SUPPLY, wcd938x->supplies);
>> +    if (ret) {
>> +        dev_err(dev, "Failed to enable supplies: err = %d\n", ret);
>> +        return ret;
>> +    }
>> +
>> +    wcd938x_dt_parse_micbias_info(dev, wcd938x);
>> +    return 0;
>> +}
>> +
>> +static int wcd938x_reset(struct wcd938x_sdw_priv *wcd, struct device 
>> *dev)
>> +{
>> +    struct wcd938x_priv *wcd938x = wcd->wcd938x;
>> +
>> +    gpio_direction_output(wcd938x->reset_gpio, 0);
>> +    /* 20us sleep required after pulling the reset gpio to LOW */
>> +    usleep_range(20, 30);
>> +    gpio_set_value(wcd938x->reset_gpio, 1);
>> +    /* 20us sleep required after pulling the reset gpio to HIGH */
>> +    usleep_range(20, 30);
> 
> so each Slave device has its own GPIOs and regulators?
> 

unfortunately No, reset gpio and regulators are common for the whole codec.


>> +
>> +    return 0;
>> +}
>> +
>> +static int __wcd938x_init(struct wcd938x_sdw_priv *wcd, struct device 
>> *dev)
>> +{
>> +    int ret;
>> +    struct wcd938x_priv *wcd938x = wcd->wcd938x;
>> +
>> +    wcd938x_reset(wcd, dev);
>> +
>> +    wcd938x->regmap = devm_regmap_init_sdw(wcd->sdev, 
>> &wcd938x_regmap_config);
>> +    if (IS_ERR(wcd938x->regmap)) {
>> +        dev_err(dev, "%s: Regmap init failed\n", __func__);
>> +        return PTR_ERR(wcd938x->regmap);
>> +    }
>> +
>> +    ret = wcd938x_set_micbias_data(wcd938x);
>> +    if (ret < 0) {
>> +        dev_err(dev, "%s: bad micbias data\n", __func__);
>> +        return ret;
>> +    }
>> +
>> +    return 0;
>> +}
>> +
>> +int wcd938x_register_component(struct wcd938x_sdw_priv *wcd, struct 
>> device *dev,
>> +                   struct snd_soc_dai_driver *dai_driver)
>> +{
>> +    if (wcd->is_tx)
>> +        return snd_soc_register_component(dev,
>> +                          &soc_codec_dev_wcd938x_sdw_tx,
>> +                          dai_driver, 1);
>> +    else
>> +        return snd_soc_register_component(dev,
>> +                          &soc_codec_dev_wcd938x_sdw_rx,
>> +                          dai_driver, 1);
>> +}
>> +
>> +int wcd938x_handle_sdw_irq(struct wcd938x_sdw_priv *wcd)
>> +{
>> +    struct wcd938x_priv *wcd938x = wcd->wcd938x;
>> +    struct irq_domain *slave_irq = wcd938x->virq;
>> +    u32 sts1, sts2, sts3;
>> +
>> +    do {
>> +        handle_nested_irq(irq_find_mapping(slave_irq, 0));
>> +        regmap_read(wcd938x->regmap, WCD938X_DIGITAL_INTR_STATUS_0, 
>> &sts1);
>> +        regmap_read(wcd938x->regmap, WCD938X_DIGITAL_INTR_STATUS_1, 
>> &sts2);
>> +        regmap_read(wcd938x->regmap, WCD938X_DIGITAL_INTR_STATUS_2, 
>> &sts3);
>> +
>> +    } while (sts1 || sts2 || sts3);
> i
> no timeout in case the hardware is stuck?
> 
Even if you timeout here that means the interrupt source is not cleared 
yet, so we can potentially re-enter to this function subsequently.
But I agree with you on the timeout for hardware stuck case, I will try 
to add that in next version.


>> +
>> +    return IRQ_HANDLED;
>> +}
>> +
>> +int wcd938x_init(struct wcd938x_sdw_priv *data)
>> +{
>> +    struct wcd938x_priv *wcd938x = NULL;
> 
> initialization doesn't seem needed
> 
Ack!

>> +    struct device *dev = &data->sdev->dev;
>> +    bool is_tx = data->is_tx;
>> +    int ret;
>> +
>> +    if (!is_tx) {
>> +        if (g_wcd938x) {
>> +            data->wcd938x = g_wcd938x;
>> +            return 0;
>> +        } else {
>> +            return -EPROBE_DEFER;
>> +        }
>> +    }
>> +
>> +    wcd938x = devm_kzalloc(dev, sizeof(struct wcd938x_priv),
>> +                GFP_KERNEL);
>> +    if (!wcd938x)
>> +        return -ENOMEM;
>> +
>> +    data->wcd938x = wcd938x;
>> +    g_wcd938x = wcd938x;
>> +    wcd938x->dev = dev;
>> +    ret = wcd938x_populate_dt_data(data, dev);
>> +    if (ret) {
>> +        dev_err(dev, "%s: Fail to obtain platform data\n", __func__);
>> +        return -EINVAL;
>> +    }
>> +
>> +    ret = __wcd938x_init(data, dev);
>> +    if (ret) {
>> +        dev_err(dev, "%s: Fail to init\n", __func__);
>> +        return ret;
>> +    }
>> +
>> +    return 0;
>> +}
>> +
>> +int wcd938x_deinit(struct wcd938x_sdw_priv *wcd)
>> +{
>> +    struct wcd938x_priv *wcd938x = wcd->wcd938x;
>> +
>> +    if (!wcd->is_tx)
>> +        wcd_clsh_ctrl_free(wcd938x->clsh_info);
>> +
>> +    g_wcd938x = NULL;
>> +
>> +    return 0;
>> +}
>> diff --git a/sound/soc/codecs/wcd938x.h b/sound/soc/codecs/wcd938x.h
>> new file mode 100644
>> index 000000000000..c373850f209e
>> --- /dev/null
>> +++ b/sound/soc/codecs/wcd938x.h
>> @@ -0,0 +1,676 @@
>> +/* SPDX-License-Identifier: GPL-2.0 */
> 
> GPL-2.0-only
> 
>> +#define WCD938X_MAX_SWR_CH_IDS    15
> 
> what is this value? SoundWire supports up to 8 channels.

This is the virtual channel IDs given to group of channels on a port for 
a particular function. ex:

Channel ID WCD938X_HPH_L is for Channel 0 on port WCD938X_HPH_PORT
Channel ID WCD938X_HPH_R is for Channel 1 on port WCD938X_HPH_PORT

These IDs are internally used by the codec for mixer settings.

they do not exactly reflect number of channels, they are just enums for 
internal use.

--srini




