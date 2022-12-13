Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 05D9864AD6E
	for <lists+alsa-devel@lfdr.de>; Tue, 13 Dec 2022 03:04:10 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8088E188F;
	Tue, 13 Dec 2022 03:03:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8088E188F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1670897049;
	bh=c73agEUWk1pouFaZcPp83l8YisoJpR4l7U5uIm/CdjM=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=cs+/KAOOY4k/ufHFPLhhOMH9Yt3fCFtVT1tiEkKeR+ZXiqg/yjNmpbxQ9UW0g7ZzI
	 9sirZLCvZ+3VjCVTXG5Vbk1E1jmAAqvDoYdAHTuoTpOn9YEm0xl39zAQpSTAlKfygr
	 4J8Esd/VuXyB26RfcnxPJjdoYJ6KrUiUDD5hFIMc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 05E89F80115;
	Tue, 13 Dec 2022 03:03:12 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1DD0AF8042F; Tue, 13 Dec 2022 03:03:10 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
 RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY
 shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from out29-50.mail.aliyun.com (out29-50.mail.aliyun.com
 [115.124.29.50])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7204EF80115
 for <alsa-devel@alsa-project.org>; Tue, 13 Dec 2022 03:03:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7204EF80115
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.07436261|-1; CH=green;
 DM=|CONTINUE|false|;
 DS=CONTINUE|ham_system_inform|0.0149033-0.000208892-0.984888;
 FP=0|0|0|0|0|-1|-1|-1; HT=ay29a033018047194; MF=wangweidong.a@awinic.com; NM=0;
 PH=DS; RN=18; RT=18; SR=0; TI=SMTPD_---.QUJ64fT_1670896967; 
Received: from ubuntu-VirtualBox..(mailfrom:wangweidong.a@awinic.com
 fp:SMTPD_---.QUJ64fT_1670896967) by smtp.aliyun-inc.com;
 Tue, 13 Dec 2022 10:02:57 +0800
From: wangweidong.a@awinic.com
To: amadeuszx.slawinski@linux.intel.com
Subject: Re: [PATCH V6 1/5] ASoC: codecs: Add i2c and codec registration for
 aw883xx and their associated operation functions
Date: Tue, 13 Dec 2022 10:02:47 +0800
Message-Id: <20221213020247.48077-1-wangweidong.a@awinic.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <90e32983-2269-1fdb-c336-32cfbed65a32@linux.intel.com>
References: <90e32983-2269-1fdb-c336-32cfbed65a32@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: zhaolei@awinic.com, pierre-louis.bossart@linux.intel.com,
 alsa-devel@alsa-project.org, ckeepax@opensource.cirrus.com,
 tanureal@opensource.cirrus.com, quic_potturu@quicinc.com,
 wangweidong.a@awinic.com, tiwai@suse.com, duanyibo@awinic.com,
 robh+dt@kernel.org, liweilei@awinic.com, cy_huang@richtek.com,
 yijiangtao@awinic.com, broonie@kernel.org, zhangjianming@awinic.com,
 krzysztof.kozlowski+dt@linaro.org
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

> Soc -> SoC

I will change it on patch v7

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

> Are all those headers really needed? Just picking few, for example 
> debugfs.h, version.h and vmalloc.h seems unnecessary to me, and I 
> suspect few more can be removed.

I will change it on patch v7

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

> Is it enough to just read register to clear it?

Yes, this is because our chip hardware design,
just need to read, the hardware can automatically clear the register value

> +
> +int aw883xx_dsp_write(struct aw883xx *aw883xx,
> +		unsigned short dsp_addr, unsigned int dsp_data, unsigned char data_type)
> +{
> +	int ret = -1;


> No need to set "-1" value here, as following switch always sets ret and 
> -1 == -EPERM, which may lead to some confusion if something is changed 
> later and ret is returned. If you want to set it to anything, just set 
> it to -EINVAL.

> There is few more places in the patch, where ret is initialized to -1 
> only to be overwritten later, I won't mark them all, but it seems weird 
> to me and should probably be fixed.

I will change it on patch v7

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

> remove double space after '='

I will change it on patch v7

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

> Soc -> SoC

I will change it on patch v7

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

> This header should be unnecessary

I will change it on patch v7

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

> Unnecessary comment

I will change it on patch v7

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

> Also unnecessary comment

I will change it on patch v7

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

Thank you very much for your advice

Best regards,
Weidong Wang
