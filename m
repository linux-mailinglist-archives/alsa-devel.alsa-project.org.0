Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EF5D064708D
	for <lists+alsa-devel@lfdr.de>; Thu,  8 Dec 2022 14:13:06 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 80ACE1699;
	Thu,  8 Dec 2022 14:12:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 80ACE1699
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1670505186;
	bh=lWhIuYdmNKOn6V3NgKqjp4u15u+V2VpznJPF6wNdPas=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=my2y4PfxmKjzQ+/im+IXb3at81ZYVlv7uBPL6kKfq02cCkfzvr2Exw0pazxef+2/D
	 P9/cLIJQiAmSyZQL4qA4m6vdF12WLzJZmYIf+hsa6LzWg6UCikZyXPGbCfKbAF9NHn
	 oAn4YU1T1k2SjuzraL3DI+SrdxewPI+CtJkR7iiw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0C7F0F8024C;
	Thu,  8 Dec 2022 14:12:09 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2BF5FF8020D; Thu,  8 Dec 2022 14:12:07 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=1.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,PRX_BODY_30,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BBBBDF80121
 for <alsa-devel@alsa-project.org>; Thu,  8 Dec 2022 14:12:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BBBBDF80121
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="eFILzYzH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1670505122; x=1702041122;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=lWhIuYdmNKOn6V3NgKqjp4u15u+V2VpznJPF6wNdPas=;
 b=eFILzYzH9sLhNYbeRuC48m6Ex95QQe0+31PM+A840FZekYIzkvWlbfcv
 HPmj+L5Lbo0+XhEbttk/kwQ6IMPyqI8iPWLZjw21Tkh+BPWiK/qiMlOmP
 K1zChnkGJogSaezChBo1X4ZRCaaPbnf+3lAYcIAs9neVEdfC33xZ1xzwP
 uM2a/EnTf4n6ypzR7jDIU/e8JG3cGzbKkg1l5yozhDxpbOXQlL/NjELOg
 lSM9y+D0iE1p7Vz+iBcdGGoso5tR6cqjo0aaMSFe/XyQkWqmE3+V7A63o
 w3TC7iYA/YKhZ7MQgRe6gWrmWUcziOJBVchW+Ltx78aueq9Fd7c+BQHdM g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10554"; a="300578021"
X-IronPort-AV: E=Sophos;i="5.96,227,1665471600"; d="scan'208";a="300578021"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2022 05:11:47 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10554"; a="753554191"
X-IronPort-AV: E=Sophos;i="5.96,227,1665471600"; d="scan'208";a="753554191"
Received: from aslawinx-mobl.ger.corp.intel.com (HELO [10.99.249.223])
 ([10.99.249.223])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2022 05:11:42 -0800
Message-ID: <90e32983-2269-1fdb-c336-32cfbed65a32@linux.intel.com>
Date: Thu, 8 Dec 2022 14:11:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH V6 1/5] ASoC: codecs: Add i2c and codec registration for
 aw883xx and their associated operation functions
Content-Language: en-US
To: wangweidong.a@awinic.com, broonie@kernel.org, perex@perex.cz,
 alsa-devel@alsa-project.org, tiwai@suse.com, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, ckeepax@opensource.cirrus.com,
 tanureal@opensource.cirrus.com, quic_potturu@quicinc.com,
 pierre-louis.bossart@linux.intel.com, cy_huang@richtek.com
References: <20221208122313.55118-1-wangweidong.a@awinic.com>
 <20221208122313.55118-2-wangweidong.a@awinic.com>
From: =?UTF-8?Q?Amadeusz_S=c5=82awi=c5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
In-Reply-To: <20221208122313.55118-2-wangweidong.a@awinic.com>
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
>   sound/soc/codecs/aw883xx/aw883xx.c | 909 +++++++++++++++++++++++++++++
>   sound/soc/codecs/aw883xx/aw883xx.h |  81 +++
>   2 files changed, 990 insertions(+)
>   create mode 100644 sound/soc/codecs/aw883xx/aw883xx.c
>   create mode 100644 sound/soc/codecs/aw883xx/aw883xx.h
> 
> diff --git a/sound/soc/codecs/aw883xx/aw883xx.c b/sound/soc/codecs/aw883xx/aw883xx.c
> new file mode 100644
> index 000000000000..f82e6d8c71a7
> --- /dev/null
> +++ b/sound/soc/codecs/aw883xx/aw883xx.c
> @@ -0,0 +1,909 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * aw883xx.c --  ALSA Soc AW883XX codec support

Soc -> SoC

> + *
> + * Copyright (c) 2022 AWINIC Technology CO., LTD
> + *
> + * Author: Bruce zhao <zhaolei@awinic.com>
> + */
> +#include <linux/delay.h>
> +#include <linux/device.h>
> +#include <linux/debugfs.h>
> +#include <linux/firmware.h>
> +#include <linux/hrtimer.h>
> +#include <linux/i2c.h>
> +#include <linux/input.h>
> +#include <linux/module.h>
> +#include <linux/of_gpio.h>
> +#include <linux/regmap.h>
> +#include <linux/syscalls.h>
> +#include <linux/timer.h>
> +#include <linux/uaccess.h>
> +#include <linux/version.h>
> +#include <linux/vmalloc.h>
> +#include <linux/workqueue.h>

Are all those headers really needed? Just picking few, for example 
debugfs.h, version.h and vmalloc.h seems unnecessary to me, and I 
suspect few more can be removed.

> +#include <sound/core.h>
> +#include <sound/pcm.h>
> +#include <sound/pcm_params.h>
> +#include <sound/soc.h>
> +#include <sound/tlv.h>
> +#include "aw883xx_pid_2049_reg.h"
> +#include "aw883xx.h"
> +#include "aw883xx_bin_parse.h"
> +#include "aw883xx_device.h"
> +
> +static const struct regmap_config aw883xx_remap_config = {
> +	.val_bits = 16,
> +	.reg_bits = 8,
> +	.max_register = AW_PID_2049_REG_MAX - 1,
> +};
> +
> +/*
> + * aw883xx dsp write/read
> + */
> +static int aw883xx_dsp_write_16bit(struct aw883xx *aw883xx,
> +		unsigned short dsp_addr, unsigned int dsp_data)
> +{
> +	int ret;
> +	struct aw_dsp_mem_desc *desc = &aw883xx->aw_pa->dsp_mem_desc;
> +
> +	ret = regmap_write(aw883xx->regmap, desc->dsp_madd_reg, dsp_addr);
> +	if (ret < 0) {
> +		dev_err(aw883xx->dev, "%s error, ret=%d", __func__, ret);
> +		return ret;
> +	}
> +
> +	ret = regmap_write(aw883xx->regmap, desc->dsp_mdat_reg, (u16)dsp_data);
> +	if (ret < 0) {
> +		dev_err(aw883xx->dev, "%s error, ret=%d", __func__, ret);
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static int aw883xx_dsp_write_32bit(struct aw883xx *aw883xx,
> +		unsigned short dsp_addr, unsigned int dsp_data)
> +{
> +	int ret;
> +	u16 temp_data = 0;
> +	struct aw_dsp_mem_desc *desc = &aw883xx->aw_pa->dsp_mem_desc;
> +
> +	ret = regmap_write(aw883xx->regmap, desc->dsp_madd_reg, dsp_addr);
> +	if (ret < 0) {
> +		dev_err(aw883xx->dev, "%s error, ret=%d", __func__, ret);
> +		return ret;
> +	}
> +
> +	temp_data = dsp_data & AW_DSP_16_DATA_MASK;
> +	ret = regmap_write(aw883xx->regmap, desc->dsp_mdat_reg, temp_data);
> +	if (ret < 0) {
> +		dev_err(aw883xx->dev, "%s error, ret=%d", __func__, ret);
> +		return ret;
> +	}
> +
> +	temp_data = dsp_data >> 16;
> +	ret = regmap_write(aw883xx->regmap, desc->dsp_mdat_reg, temp_data);
> +	if (ret < 0) {
> +		dev_err(aw883xx->dev, "%s error, ret=%d", __func__, ret);
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +/*
> + * aw883xx clear dsp chip select state
> + */
> +static void aw883xx_clear_dsp_sel_st(struct aw883xx *aw883xx)
> +{
> +	unsigned int reg_value;
> +	u8 reg = aw883xx->aw_pa->soft_rst.reg;
> +
> +	regmap_read(aw883xx->regmap, reg, &reg_value);
> +}

Is it enough to just read register to clear it?

> +
> +int aw883xx_dsp_write(struct aw883xx *aw883xx,
> +		unsigned short dsp_addr, unsigned int dsp_data, unsigned char data_type)
> +{
> +	int ret = -1;


No need to set "-1" value here, as following switch always sets ret and 
-1 == -EPERM, which may lead to some confusion if something is changed 
later and ret is returned. If you want to set it to anything, just set 
it to -EINVAL.

There is few more places in the patch, where ret is initialized to -1 
only to be overwritten later, I won't mark them all, but it seems weird 
to me and should probably be fixed.

> +
> +	mutex_lock(&aw883xx->dsp_lock);
> +	switch (data_type) {
> +	case AW_DSP_16_DATA:
> +		ret = aw883xx_dsp_write_16bit(aw883xx, dsp_addr, dsp_data);
> +		if (ret < 0)
> +			dev_err(aw883xx->dev, "write dsp_addr[0x%04x] 16 bit dsp_data[%04x] failed",
> +					(u32)dsp_addr, dsp_data);
> +		break;
> +	case AW_DSP_32_DATA:
> +		ret =  aw883xx_dsp_write_32bit(aw883xx, dsp_addr, dsp_data);

remove double space after '='

> +		if (ret < 0)
> +			dev_err(aw883xx->dev, "write dsp_addr[0x%04x] 32 bit dsp_data[%08x] failed",
> +					(u32)dsp_addr, dsp_data);
> +		break;
> +	default:
> +		dev_err(aw883xx->dev, "data type[%d] unsupported", data_type);
> +		ret = -EINVAL;
> +		break;
> +	}
> +
> +	aw883xx_clear_dsp_sel_st(aw883xx);
> +	mutex_unlock(&aw883xx->dsp_lock);
> +	return ret;
> +}
> +

(...)

> diff --git a/sound/soc/codecs/aw883xx/aw883xx.h b/sound/soc/codecs/aw883xx/aw883xx.h
> new file mode 100644
> index 000000000000..209851cae7ef
> --- /dev/null
> +++ b/sound/soc/codecs/aw883xx/aw883xx.h
> @@ -0,0 +1,81 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * aw883xx.c --  ALSA Soc AW883XX codec support

Soc -> SoC

> + *
> + * Copyright (c) 2022 AWINIC Technology CO., LTD
> + *
> + * Author: Bruce zhao <zhaolei@awinic.com>
> + */
> +
> +#ifndef __AW883XX_H__
> +#define __AW883XX_H__
> +
> +#include <linux/version.h>

This header should be unnecessary

> +#include <sound/control.h>
> +#include <sound/soc.h>
> +#include "aw883xx_data_type.h"
> +
> +#define AW_CHIP_ID_REG			(0x00)
> +#define AW_START_RETRIES			(5)
> +#define AW_START_WORK_DELAY_MS	(0)
> +
> +#define AW_DSP_16_DATA_MASK	(0x0000ffff)
> +
> +#define AW_I2C_NAME "aw883xx_smartpa"
> +
> +#define AW_RATES (SNDRV_PCM_RATE_8000_48000 | \
> +			SNDRV_PCM_RATE_96000)
> +#define AW_FORMATS (SNDRV_PCM_FMTBIT_S16_LE | \
> +			SNDRV_PCM_FMTBIT_S24_LE | \
> +			SNDRV_PCM_FMTBIT_S32_LE)
> +#define AW_REQUEST_FW_RETRIES		5	/* 5 times */

Unnecessary comment

> +#define AW_SYNC_LOAD
> +
> +#define FADE_TIME_MAX 100000
> +#define FADE_TIME_MIN 0
> +
> +#define AW_PROFILE_EXT(xname, profile_info, profile_get, profile_set) \
> +{ \
> +	.iface = SNDRV_CTL_ELEM_IFACE_MIXER, \
> +	.name = xname, \
> +	.info = profile_info, \
> +	.get = profile_get, \
> +	.put = profile_set, \
> +}
> +
> +enum {
> +	AW_SYNC_START = 0,
> +	AW_ASYNC_START,
> +};
> +
> +enum {
> +	AW883XX_STREAM_CLOSE = 0,
> +	AW883XX_STREAM_OPEN,
> +};
> +
> +struct aw883xx {
> +	struct i2c_client *i2c;
> +	struct device *dev;
> +	struct mutex lock;
> +	struct mutex dsp_lock;
> +	struct snd_soc_component *codec;
> +	struct aw_device *aw_pa;
> +	struct gpio_desc *reset_gpio;
> +	unsigned char phase_sync;	/*phase sync*/

Also unnecessary comment

> +	bool allow_pw;
> +	u8 pstream;
> +	struct workqueue_struct *work_queue;
> +	struct delayed_work start_work;
> +	u16 chip_id;
> +	struct regmap *regmap;
> +	struct aw_container *aw_cfg;
> +};
> +
> +int aw883xx_init(struct aw883xx *aw883xx);
> +
> +int aw883xx_dsp_write(struct aw883xx *aw883xx,
> +		unsigned short dsp_addr, unsigned int dsp_data, unsigned char data_type);
> +int aw883xx_dsp_read(struct aw883xx *aw883xx,
> +		unsigned short dsp_addr, unsigned int *dsp_data, unsigned char data_type);
> +
> +#endif

