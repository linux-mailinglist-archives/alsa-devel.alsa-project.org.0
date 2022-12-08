Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AE28647255
	for <lists+alsa-devel@lfdr.de>; Thu,  8 Dec 2022 15:59:20 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BEF7B1921;
	Thu,  8 Dec 2022 15:58:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BEF7B1921
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1670511559;
	bh=7fzoW9PArZbafqHk+N7CJO5hj0tuG7WPhsU1sj5rQKg=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Zwt97wIRZfOt7lkXWl8mbfDZ7n+kubzrqBO6ldpkYT6BBYXutmtZFkyKi853N3xLa
	 t9L7fCi3HgKFjTBYZM+TD4eQe2IYXTsZVfmCGtMUaalGcfDQfmhXLVey9nMfwvRnz/
	 0mlewZvLFxioN+Ns0NGF1oHBOpARQDOsT11/Z7xA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4C17DF800F8;
	Thu,  8 Dec 2022 15:58:22 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 633BFF8020D; Thu,  8 Dec 2022 15:58:21 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=1.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,PRX_BODY_30,RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS,
 URIBL_ZEN_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 19C40F801D8
 for <alsa-devel@alsa-project.org>; Thu,  8 Dec 2022 15:58:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 19C40F801D8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="csTwJpm4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1670511496; x=1702047496;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=7fzoW9PArZbafqHk+N7CJO5hj0tuG7WPhsU1sj5rQKg=;
 b=csTwJpm4jd1jmLBV9pVyk8lzkfIgEIX+bT6v55lEhbnin6/guRqecS35
 ChtaClYjzGwvPuFlNFNrCHyjW36mgpbNCvxjl9Xi7DS7LkQromoXmN3y4
 oGTKTFBGI9F73IT6eeYTKZT+xYMErB+lnRj1r9jkVRzhU3QwDXbr211Id
 phFyt1IFTIAuh6Nqt5FKKINi59+GQgraA4nuWgdSKS427AkBvfsYZpRdq
 QCgvRh6Xul7op9FTFdDc8+dkvT3+aATZHTzJvCccI3HUAMY7l1tkOOCQy
 QkQSFbLAfc01pg3A6NLlr++PTgXKxK2nkls1cZpFYSPyplFjWLi610HrC w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10555"; a="381493350"
X-IronPort-AV: E=Sophos;i="5.96,227,1665471600"; d="scan'208";a="381493350"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2022 06:22:17 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10555"; a="735810678"
X-IronPort-AV: E=Sophos;i="5.96,227,1665471600"; d="scan'208";a="735810678"
Received: from aslawinx-mobl.ger.corp.intel.com (HELO [10.99.249.223])
 ([10.99.249.223])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2022 06:22:12 -0800
Message-ID: <43e7ed60-429e-b828-b2d4-c4a746fe8c84@linux.intel.com>
Date: Thu, 8 Dec 2022 15:22:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH V6 3/5] ASoC: codecs: aw883xx chip control logic, such as
 power on and off
Content-Language: en-US
To: wangweidong.a@awinic.com, broonie@kernel.org, perex@perex.cz,
 alsa-devel@alsa-project.org, tiwai@suse.com, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, ckeepax@opensource.cirrus.com,
 tanureal@opensource.cirrus.com, quic_potturu@quicinc.com,
 pierre-louis.bossart@linux.intel.com, cy_huang@richtek.com
References: <20221208122313.55118-1-wangweidong.a@awinic.com>
 <20221208122313.55118-4-wangweidong.a@awinic.com>
From: =?UTF-8?Q?Amadeusz_S=c5=82awi=c5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
In-Reply-To: <20221208122313.55118-4-wangweidong.a@awinic.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Cc: zhangjianming@awinic.com, duanyibo@awinic.com, yijiangtao@awinic.com,
 zhaolei@awinic.com, liweilei@awinic.com
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

On 12/8/2022 1:23 PM, wangweidong.a@awinic.com wrote:
> From: Weidong Wang <wangweidong.a@awinic.com>
> 
> The Awinic AW883XX is an I2S/TDM input, high efficiency
> digital Smart K audio amplifier with an integrated 10.25V
> smart boost convert
> 
> Signed-off-by: Nick Li <liweilei@awinic.com>
> Signed-off-by: Bruce zhao <zhaolei@awinic.com>
> Signed-off-by: Weidong Wang <wangweidong.a@awinic.com>
> ---
>   sound/soc/codecs/aw883xx/aw883xx_device.c | 1613 +++++++++++++++++++++
>   sound/soc/codecs/aw883xx/aw883xx_device.h |  537 +++++++
>   2 files changed, 2150 insertions(+)
>   create mode 100644 sound/soc/codecs/aw883xx/aw883xx_device.c
>   create mode 100644 sound/soc/codecs/aw883xx/aw883xx_device.h
> 
> diff --git a/sound/soc/codecs/aw883xx/aw883xx_device.c b/sound/soc/codecs/aw883xx/aw883xx_device.c
> new file mode 100644
> index 000000000000..f4419e1a2fed
> --- /dev/null
> +++ b/sound/soc/codecs/aw883xx/aw883xx_device.c
> @@ -0,0 +1,1613 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * aw883xx.c --  ALSA Soc AW883XX codec support

Soc -> SoC

> + *
> + * Copyright (c) 2022 AWINIC Technology CO., LTD
> + *
> + * Author: Bruce zhao <zhaolei@awinic.com>
> + */
> +
> +#include <linux/delay.h>
> +#include <linux/device.h>
> +#include <linux/debugfs.h>
> +#include <linux/firmware.h>
> +#include <linux/i2c.h>
> +#include <linux/module.h>
> +#include <linux/of_gpio.h>
> +#include <linux/syscalls.h>
> +#include <linux/version.h>
> +#include <linux/uaccess.h>
> +#include <linux/workqueue.h>

Again, there seem to be unnecessary headers included.

> +#include <sound/core.h>
> +#include <sound/control.h>
> +#include <sound/pcm.h>
> +#include <sound/pcm_params.h>
> +#include <sound/soc.h>
> +#include "aw883xx_data_type.h"
> +#include "aw883xx_device.h"
> +#include "aw883xx_bin_parse.h"
> +
> +int aw883xx_dev_set_volume(struct aw_device *aw_dev, unsigned short set_vol)
> +{
> +	u16 hw_vol = 0;
> +	int ret = -1;

As mentioned in previous patchset this mey lead to returning "-1" 
somewhere which maps to -EPERM, just set it to -EINVAL if you want to 
set it to something... same for the rest of the patchset (won't be 
commenting each occurence in file.)

> +	struct aw_volume_desc *vol_desc = &aw_dev->volume_desc;
> +
> +	hw_vol = set_vol + vol_desc->init_volume;
> +
> +	ret = aw_dev->ops.aw_set_hw_volume(aw_dev, hw_vol);
> +	if (ret < 0) {
> +		dev_err(aw_dev->dev, "set volume failed");
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +int aw883xx_dev_get_volume(struct aw_device *aw_dev, unsigned short *get_vol)
> +{
> +	int ret = -1;
> +	u16 hw_vol = 0;
> +	struct aw_volume_desc *vol_desc = &aw_dev->volume_desc;
> +
> +	ret = aw_dev->ops.aw_get_hw_volume(aw_dev, &hw_vol);
> +	if (ret < 0) {
> +		dev_err(aw_dev->dev, "read volume failed");
> +		return ret;
> +	}
> +
> +	if (hw_vol > vol_desc->init_volume)
> +		*get_vol = hw_vol - vol_desc->init_volume;
> +
> +	return 0;
> +}
> +
> +static void aw_dev_fade_in(struct aw_device *aw_dev)
> +{
> +	int i = 0;
> +	struct aw_volume_desc *desc = &aw_dev->volume_desc;
> +	int fade_step = aw_dev->fade_step;
> +	u16 fade_in_vol = desc->ctl_volume;
> +
> +	if (!aw_dev->fade_en)
> +		return;
> +
> +	if (fade_step == 0 || aw_dev->fade_in_time == 0) {
> +		aw883xx_dev_set_volume(aw_dev, fade_in_vol);
> +		return;
> +	}
> +	/*volume up*/
> +	for (i = desc->mute_volume; i >= fade_in_vol; i -= fade_step) {
> +		aw883xx_dev_set_volume(aw_dev, i);
> +		usleep_range(aw_dev->fade_in_time, aw_dev->fade_in_time + 10);
> +	}
> +	if (i != fade_in_vol)
> +		aw883xx_dev_set_volume(aw_dev, fade_in_vol);
> +
> +}
> +
> +static void aw_dev_fade_out(struct aw_device *aw_dev)
> +{
> +	int i = 0;
> +	struct aw_volume_desc *desc = &aw_dev->volume_desc;
> +	int fade_step = aw_dev->fade_step;
> +
> +	if (!aw_dev->fade_en)
> +		return;
> +
> +	if (fade_step == 0 || aw_dev->fade_out_time == 0) {
> +		aw883xx_dev_set_volume(aw_dev, desc->mute_volume);
> +		return;
> +	}
> +
> +	for (i = desc->ctl_volume; i <= desc->mute_volume; i += fade_step) {
> +		aw883xx_dev_set_volume(aw_dev, i);
> +		usleep_range(aw_dev->fade_out_time, aw_dev->fade_out_time + 10);
> +	}
> +	if (i != desc->mute_volume) {
> +		aw883xx_dev_set_volume(aw_dev, desc->mute_volume);
> +		usleep_range(aw_dev->fade_out_time, aw_dev->fade_out_time + 10);
> +	}
> +}
> +
> +static uint64_t aw_dev_dsp_crc32_reflect(uint64_t ref, unsigned char ch)
> +{
> +	int i;
> +	uint64_t value = 0;
> +
> +	for (i = 1; i < (ch + 1); i++) {
> +		if (ref & 1)
> +			value |= 1 << (ch - i);
> +
> +		ref >>= 1;
> +	}
> +
> +	return value;
> +}
> +
> +static unsigned int aw_dev_calc_dsp_cfg_crc32(unsigned char *buf, unsigned int len)
> +{
> +	u8 i;
> +	u32 crc = 0xffffffff;
> +
> +	while (len--) {
> +		for (i = 1; i != 0; i <<= 1) {
> +			if ((crc & 0x80000000) != 0) {
> +				crc <<= 1;
> +				crc ^= 0x1EDC6F41;
> +			} else {
> +				crc <<= 1;
> +			}
> +
> +			if ((*buf & i) != 0)
> +				crc ^= 0x1EDC6F41;
> +		}
> +		buf++;
> +	}
> +
> +	return (aw_dev_dsp_crc32_reflect(crc, 32)^0xffffffff);
> +}
> +
> +static int aw_dev_set_dsp_crc32(struct aw_device *aw_dev)
> +{
> +	u32 crc_value = 0;
> +	u32 crc_data_len = 0;
> +	int ret = -1;
> +	struct aw_sec_data_desc *crc_dsp_cfg = &aw_dev->crc_dsp_cfg;
> +	struct aw_dsp_crc_desc *desc = &aw_dev->dsp_crc_desc;
> +
> +	/*get crc data len*/
> +	crc_data_len = (desc->dsp_reg - aw_dev->dsp_mem_desc.dsp_cfg_base_addr) * 2;
> +	if (crc_data_len > crc_dsp_cfg->len) {
> +		dev_err(aw_dev->dev, "crc data len :%d > cfg_data len:%d",
> +			crc_data_len, crc_dsp_cfg->len);
> +		return -EINVAL;
> +	}
> +
> +	if (crc_data_len % 4 != 0) {
> +		dev_err(aw_dev->dev, "The crc data len :%d unsupport", crc_data_len);
> +		return -EINVAL;
> +	}
> +
> +	crc_value = aw_dev_calc_dsp_cfg_crc32(crc_dsp_cfg->data, crc_data_len);
> +
> +	dev_dbg(aw_dev->dev, "crc_value:0x%x", crc_value);
> +	ret = aw_dev->ops.aw_dsp_write(aw_dev, desc->dsp_reg, crc_value,
> +						desc->data_type);
> +	if (ret < 0) {
> +		dev_err(aw_dev->dev, "set dsp crc value failed");
> +		return ret;
> +	}
> +
> +	return 0;
> +}


Similarly to crc8, Linux implements crc32
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/include/linux/crc32.h
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/lib/crc32.c
no need to implement your own.

> +
> +static void aw_dev_dsp_crc_check_enable(struct aw_device *aw_dev, bool flag)
> +{
> +	struct aw_dsp_crc_desc *dsp_crc_desc = &aw_dev->dsp_crc_desc;
> +	struct aw883xx *aw883xx = aw_dev->private_data;
> +	int ret;
> +
> +	if (flag) {
> +		ret = aw_dev->ops.aw_reg_write_bits(aw883xx->regmap, dsp_crc_desc->ctl_reg,
> +				~dsp_crc_desc->ctl_mask, dsp_crc_desc->ctl_enable);
> +		if (ret < 0) {
> +			dev_err(aw_dev->dev, "enable dsp crc failed");
> +			return;
> +		}
> +	} else {
> +		ret = aw_dev->ops.aw_reg_write_bits(aw883xx->regmap, dsp_crc_desc->ctl_reg,
> +				~dsp_crc_desc->ctl_mask, dsp_crc_desc->ctl_disable);
> +		if (ret < 0) {
> +			dev_err(aw_dev->dev, "close dsp crc failed");
> +			return;
> +		}
> +	}
> +}
> +

(...)

> +
> +void aw883xx_dev_memclk_select(struct aw_device *aw_dev, unsigned char flag)
> +{
> +	struct aw_memclk_desc *desc = &aw_dev->memclk_desc;
> +	struct aw883xx *aw883xx = aw_dev->private_data;
> +	int ret = -1;
> +
> +	switch (flag) {
> +	case AW_DEV_MEMCLK_PLL:
> +		ret = aw_dev->ops.aw_reg_write_bits(aw883xx->regmap, desc->reg,
> +					~desc->mask, desc->mcu_hclk);
> +		if (ret < 0)
> +			dev_err(aw_dev->dev, "memclk select pll failed");
> +		break;
> +	case AW_DEV_MEMCLK_OSC:
> +		ret = aw_dev->ops.aw_reg_write_bits(aw883xx->regmap, desc->reg,
> +					~desc->mask, desc->osc_clk);
> +		if (ret < 0)
> +			dev_err(aw_dev->dev, "memclk select OSC failed");
> +		break;
> +	default:
> +		dev_err(aw_dev->dev, "unknown memclk config, flag=0x%x", flag);
> +		break;
> +	}
> +}
> +
> +int aw883xx_dev_get_dsp_status(struct aw_device *aw_dev)
> +{
> +	int ret = -1;
> +	unsigned int reg_val = 0;
> +	struct aw_watch_dog_desc *desc = &aw_dev->watch_dog_desc;
> +	struct aw883xx *aw883xx = aw_dev->private_data;
> +
> +	aw_dev->ops.aw_reg_read(aw883xx->regmap, desc->reg, &reg_val);
> +	if (reg_val & (~desc->mask))
> +		ret = 0;
> +
> +	return ret;

Here is example of what I'm talking about, when talking about setting 
"ret = -1" you can return -1 here, and in call stack it gets mixed with 
kernel return values, like -EINVAL so it can be potentially interpreted 
as -EPERM somewhere.

> +}
> +
> +static int aw_dev_get_vmax(struct aw_device *aw_dev, unsigned int *vmax)
> +{
> +	int ret = -1;
> +	struct aw_vmax_desc *desc = &aw_dev->vmax_desc;
> +
> +	ret = aw_dev->ops.aw_dsp_read(aw_dev, desc->dsp_reg, vmax, desc->data_type);
> +	if (ret < 0) {
> +		dev_err(aw_dev->dev, "get vmax failed");
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +

(...)

> +
> +static int aw_dev_dsp_fw_update(struct aw_device *aw_dev,
> +			unsigned char *data, unsigned int len)
> +{
> +	struct aw_dsp_mem_desc *dsp_mem_desc = &aw_dev->dsp_mem_desc;
> +
> +	dev_dbg(aw_dev->dev, "dsp firmware len:%d", len);
> +
> +	if (len && (data != NULL)) {
> +		aw_dev_dsp_container_update(aw_dev,
> +			data, len, dsp_mem_desc->dsp_fw_base_addr);
> +		aw_dev->dsp_fw_len = len;
> +	} else {
> +		dev_err(aw_dev->dev, "dsp firmware data is null or len is 0");
> +		return -EPERM;
> +	}
> +
> +	return 0;
> +}
> +
> +static int aw_dev_copy_to_crc_dsp_cfg(struct aw_device *aw_dev,
> +			unsigned char *data, unsigned int size)
> +{
> +	struct aw_sec_data_desc *crc_dsp_cfg = &aw_dev->crc_dsp_cfg;
> +	int ret;
> +
> +	if (!crc_dsp_cfg->data) {
> +		crc_dsp_cfg->data = devm_kzalloc(aw_dev->dev, size, GFP_KERNEL);
> +		if (!crc_dsp_cfg->data)
> +			return -ENOMEM;
> +		crc_dsp_cfg->len = size;
> +	} else if (crc_dsp_cfg->len < size) {
> +		devm_kfree(aw_dev->dev, crc_dsp_cfg->data);
> +		crc_dsp_cfg->data = NULL;
> +		crc_dsp_cfg->data = devm_kzalloc(aw_dev->dev, size, GFP_KERNEL);

No need for NULL assignment above, the variable gets set one line later 
anyway.

> +		if (!crc_dsp_cfg->data) {
> +			dev_err(aw_dev->dev, "error allocating memory");
> +			return -ENOMEM;
> +		}
> +		crc_dsp_cfg->len = size;
> +	}
> +	memcpy(crc_dsp_cfg->data, data, size);
> +	ret = aw883xx_dev_dsp_data_order(aw_dev, crc_dsp_cfg->data, size);
> +	if (ret < 0)
> +		return ret;
> +
> +	return 0;
> +}
> +

(...)

> diff --git a/sound/soc/codecs/aw883xx/aw883xx_device.h b/sound/soc/codecs/aw883xx/aw883xx_device.h
> new file mode 100644
> index 000000000000..505cef1fd3e6
> --- /dev/null
> +++ b/sound/soc/codecs/aw883xx/aw883xx_device.h
> @@ -0,0 +1,537 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * aw883xx.c --  ALSA Soc AW883XX codec support
> + *
> + * Copyright (c) 2022 AWINIC Technology CO., LTD
> + *
> + * Author: Bruce zhao <zhaolei@awinic.com>
> + */
> +
> +#ifndef __AW883XX_DEVICE_FILE_H__
> +#define __AW883XX_DEVICE_FILE_H__
> +
> +#include "aw883xx_data_type.h"
> +#include "aw883xx.h"
> +
> +
> +#define AW_DEV_DEFAULT_CH		(0)
> +#define AW_DEV_DSP_CHECK_MAX	(5)
> +
> +/*
> + * DSP I2C WRITES
> + */
> +#define AW_DSP_I2C_WRITES
> +#define AW_MAX_RAM_WRITE_BYTE_SIZE	(128)
> +#define AW_DSP_ODD_NUM_BIT_TEST		(0x5555)
> +#define AW_DSP_EVEN_NUM_BIT_TEST	(0xAAAA)
> +#define AW_DSP_ST_CHECK_MAX		(2)
> +#define AW_FADE_IN_OUT_DEFAULT		(0)
> +#define AW_CALI_DELAY_CACL(value) ((value * 32) / 48)
> +#define AW_CALI_RE_MAX (15000)
> +#define AW_CALI_RE_MIN (4000)
> +
> +#define AW_GET_MIN_VALUE(value1, value2) \
> +	((value1) > (value2) ? (value2) : (value1))
> +
> +#define AW_GET_MAX_VALUE(value1, value2) \
> +	((value1) > (value2) ? (value1) : (value2))

Linux already has min and max macros?


(...)

