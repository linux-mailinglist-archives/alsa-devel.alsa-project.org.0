Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E65185EC171
	for <lists+alsa-devel@lfdr.de>; Tue, 27 Sep 2022 13:33:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2303A1F1;
	Tue, 27 Sep 2022 13:32:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2303A1F1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1664278384;
	bh=kofe5N1siUpuAAkNPGkso83GT8Dimdery9PLUSwQl9g=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Yb7POzo9XmuflMsoC2EAmocV+HNJswhzj+TzzIODlqpAtrNgb51cVPk2haKhXx5nA
	 dIEuypvhLz8t6qcoOEd+zhRiW/UtQLfPWr3rp4Qk1joq1O7nEWajLHzP84OVjlKzc7
	 d92NAo97eL5UL0GYmRRTInJUtEggEoh1f/myp5RQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 27821F80496;
	Tue, 27 Sep 2022 13:32:07 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 172A8F80269; Fri, 23 Sep 2022 14:22:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7670AF801EC
 for <alsa-devel@alsa-project.org>; Fri, 23 Sep 2022 14:22:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7670AF801EC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="CCom1TZW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1663935750; x=1695471750;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=kofe5N1siUpuAAkNPGkso83GT8Dimdery9PLUSwQl9g=;
 b=CCom1TZWoCBXedHOIGHRuTVaif+DkOi2LcJpQ87inemoYMg+NaX+5uCM
 /BrOJoIdwR0Gs/dvxpLQJrWIJ7nR+irVf0lPKxzXXrWf3EUjxmlitU4Te
 psOxSnL8R2MegasTGJthEiwsealWWABpvzJiuovSJCP9SquYV4LOzrNFR
 wLJoJ4Vn51SQsjvRXnyROScAJKh/5G9OP4Tgtcrd0Tw54cqiiCMkfxbo4
 BOO5eAvqPakQvmWHCFLB4xWgFI4sdGgDlwgrZHq8YFdANB3I/lRmcfzPi
 W5YS3EfQIh0ohW6dYkVb9vNsSIpeviz4MkbG/F9glBwNSnudQFi+ptJW3 g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10478"; a="362391349"
X-IronPort-AV: E=Sophos;i="5.93,339,1654585200"; d="scan'208";a="362391349"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2022 05:22:25 -0700
X-IronPort-AV: E=Sophos;i="5.93,339,1654585200"; d="scan'208";a="709282194"
Received: from mrehana-mobl1.ger.corp.intel.com (HELO [10.249.47.181])
 ([10.249.47.181])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2022 05:22:12 -0700
Message-ID: <5f3faf84-5050-cb4b-12d5-cead698e3ca5@linux.intel.com>
Date: Fri, 23 Sep 2022 14:22:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.11.0
Subject: Re: [PATCH V2 1/2] ASoc:codes:Add Awinic AW883XX audio amplifier
 driver
Content-Language: en-US
To: wangweidong.a@awinic.com, broonie@kernel.org, perex@perex.cz,
 tiwai@suse.com, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 ckeepax@opensource.cirrus.com, tanureal@opensource.cirrus.com,
 quic_potturu@quicinc.com, cy_huang@richtek.com,
 ALSA Development Mailing List <alsa-devel@alsa-project.org>
References: <1663931752-24670-1-git-send-email-wangweidong.a@awinic.com>
 <1663931752-24670-2-git-send-email-wangweidong.a@awinic.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <1663931752-24670-2-git-send-email-wangweidong.a@awinic.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 27 Sep 2022 13:32:04 +0200
Cc: yijiangtao@awinic.com, zhaolei@awinic.com, liweilei@awinic.com
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

Please add the alsa-devel mailing list in the To: list in future
submissions.

The commit title should be "ASoC: codecs: Add Awinic AW883XX audio
amplifier driver"

This patch needs a lot of cleanups I am afraid.

On 9/23/22 13:15, wangweidong.a@awinic.com wrote:
> From: Weidong Wang <wangweidong.a@awinic.com>
> 
> The Awinic AW883XX is an I2S/TDM input, high efficiency
> digital Smart K audio amplifier with an integrated 10.25V
> smart boost convert
> 
> Add a simple dirver that allows setting it up in the driver tree

driver.


> diff --git a/sound/soc/codecs/Makefile b/sound/soc/codecs/Makefile
> index 92fd441..4c91102 100644
> --- a/sound/soc/codecs/Makefile
> +++ b/sound/soc/codecs/Makefile
> @@ -352,6 +352,8 @@ snd-soc-tas2780-objs := tas2780.o
>  # Mux
>  snd-soc-simple-mux-objs := simple-mux.o
>  
> +snd_soc_aw883xx-objs := aw883xx/aw883xx.o aw883xx/aw883xx_monitor.o aw883xx/aw883xx_init.o aw883xx/aw883xx_device.o aw883xx/aw883xx_calib.o aw883xx/aw883xx_bin_parse.o aw883xx/aw883xx_spin.o

This split is a bit unusual

> +
>  obj-$(CONFIG_SND_SOC_88PM860X)	+= snd-soc-88pm860x.o
>  obj-$(CONFIG_SND_SOC_AB8500_CODEC)	+= snd-soc-ab8500-codec.o
>  obj-$(CONFIG_SND_SOC_AC97_CODEC)	+= snd-soc-ac97.o
> @@ -709,3 +711,5 @@ obj-$(CONFIG_SND_SOC_LPASS_TX_MACRO)	+= snd-soc-lpass-tx-macro.o
>  
>  # Mux
>  obj-$(CONFIG_SND_SOC_SIMPLE_MUX)	+= snd-soc-simple-mux.o
> +
> +obj-$(CONFIG_SND_SOC_AW883XX) +=snd_soc_aw883xx.o
> diff --git a/sound/soc/codecs/aw883xx/aw883xx.c b/sound/soc/codecs/aw883xx/aw883xx.c
> new file mode 100644
> index 0000000..b64b610
> --- /dev/null
> +++ b/sound/soc/codecs/aw883xx/aw883xx.c
> @@ -0,0 +1,2734 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * aw883xx.c --  ALSA Soc AW883XX codec support
> + *
> + * Copyright (c) 2020 AWINIC Technology CO., LTD

2022?

> + *
> + * Author: Bruce zhao <zhaolei@awinic.com>
> + */
> +
> +#include <linux/module.h>
> +#include <linux/i2c.h>
> +#include <sound/core.h>
> +#include <sound/pcm.h>
> +#include <sound/pcm_params.h>
> +#include <sound/soc.h>
> +#include <linux/of_gpio.h>
> +#include <linux/delay.h>
> +#include <linux/device.h>
> +#include <linux/firmware.h>
> +#include <linux/i2c.h>
> +#include <linux/debugfs.h>
> +#include <linux/version.h>
> +#include <linux/input.h>
> +#include <linux/timer.h>
> +#include <linux/workqueue.h>
> +#include <linux/hrtimer.h>
> +#include <linux/syscalls.h>
> +#include <linux/vmalloc.h>
> +#include <sound/tlv.h>
> +#include <linux/uaccess.h>

it's nicer if this is sorted by alphabetical order.

> +#include "aw883xx_pid_2049_reg.h"
> +#include "aw883xx.h"
> +#include "aw883xx_bin_parse.h"
> +#include "aw883xx_device.h"
> +#include "aw883xx_log.h"
> +#include "aw883xx_spin.h"
> +
> +/*
> + * Marco
> + */
> +#define AW883XX_I2C_NAME "aw883xx_smartpa"
> +
> +#define AW883XX_DRIVER_VERSION "v1.3.0"
> +
> +#define AW883XX_RATES (SNDRV_PCM_RATE_8000_48000 | \
> +			SNDRV_PCM_RATE_96000)

this doesn't include 24kHz

> +#define AW883XX_FORMATS (SNDRV_PCM_FMTBIT_S16_LE | \
> +			SNDRV_PCM_FMTBIT_S24_LE | \
> +			SNDRV_PCM_FMTBIT_S32_LE)
> +
> +
> +#define AW883XX_ACF_FILE	"aw883xx_acf.bin"
> +#define AW_REQUEST_FW_RETRIES		5	/* 5 times */
> +
> +static unsigned int g_aw883xx_dev_cnt;
> +static DEFINE_MUTEX(g_aw883xx_lock);
> +static struct aw_container *g_awinic_cfg;
> +
> +static const char *const aw883xx_switch[] = {"Disable", "Enable"};
> +
> +static int aw883xx_platform_init(struct aw883xx *aw883xx)
> +{
> +#ifdef AW_QCOM_PLATFORM
> +	aw883xx->aw_pa->platform = AW_QCOM;
> +	return 0;
> +#elif defined AW_MTK_PLATFORM
> +	aw883xx->aw_pa->platform = AW_MTK;
> +	return 0;
> +#elif defined AW_SPRD_PLATFORM
> +	aw883xx->aw_pa->platform = AW_SPRD;
> +	return 0;
> +#else
> +	return -EINVAL;
> +#endif

that looks awful. codec drivers are supposed to be relatively common,
and platform-specific configuration are usually done with device-tree
bindings or machine-driver configurations.

> +}
> +
> +int aw883xx_get_version(char *buf, int size)
> +{
> +	if (size > strlen(AW883XX_DRIVER_VERSION)) {
> +		memcpy(buf, AW883XX_DRIVER_VERSION, strlen(AW883XX_DRIVER_VERSION));
> +		return strlen(AW883XX_DRIVER_VERSION);

what would you return the string length? Usually success is 0 and error
a negative number.

> +	} else {
> +		return -ENOMEM;
> +	}
> +}
> +
> +/*
> + * aw883xx append suffix sound channel information
> + */
> +static void *aw883xx_devm_kstrdup(struct device *dev, char *buf)

It's rather odd to re-declare your local function when there's an
existing devm_kstrdup()

https://elixir.bootlin.com/linux/v6.0-rc6/source/include/linux/device.h#L227

> +{
> +	char *str = NULL;
> +
> +	str = devm_kzalloc(dev, strlen(buf) + 1, GFP_KERNEL);
> +	if (!str)
> +		return str;
> +	memcpy(str, buf, strlen(buf));
> +	return str;
> +}
> +
> +static int aw883xx_append_i2c_suffix(char *format,
> +		const char **change_name, struct aw883xx *aw883xx)
> +{
> +	char buf[64] = { 0 };
> +	int i2cbus = aw883xx->i2c->adapter->nr;
> +	int addr = aw883xx->i2c->addr;
> +
> +	snprintf(buf, sizeof(buf), format, *change_name, i2cbus, addr);
> +	*change_name = aw883xx_devm_kstrdup(aw883xx->dev, buf);
> +	if (!(*change_name))
> +		return -ENOMEM;
> +
> +	aw_dev_info(aw883xx->dev, "change name :%s", *change_name);
> +	return 0;
> +}
> +
> +static int aw883xx_append_channel_suffix(char *format,
> +		const char **change_name, struct aw883xx *aw883xx)
> +{
> +	char buf[64] = { 0 };
> +	int channel = aw883xx->aw_pa->channel;
> +
> +	snprintf(buf, sizeof(buf), format, *change_name, channel);
> +	*change_name = aw883xx_devm_kstrdup(aw883xx->dev, buf);
> +	if (!(*change_name))
> +		return -ENOMEM;
> +
> +	aw_dev_info(aw883xx->dev, "change name :%s", *change_name);
> +	return 0;
> +}
> +
> +/*
> + * aw883xx distinguish between codecs and components by version
> + */
> +#ifdef AW_KERNEL_VER_OVER_4_19_1
> +static struct aw_componet_codec_ops aw_componet_codec_ops = {

component

> +	.kcontrol_codec = snd_soc_kcontrol_component,
> +	.codec_get_drvdata = snd_soc_component_get_drvdata,
> +	.add_codec_controls = snd_soc_add_component_controls,
> +	.unregister_codec = snd_soc_unregister_component,
> +	.register_codec = snd_soc_register_component,
> +};
> +#else
> +static struct aw_componet_codec_ops aw_componet_codec_ops = {
> +	.kcontrol_codec = snd_soc_kcontrol_codec,
> +	.codec_get_drvdata = snd_soc_codec_get_drvdata,
> +	.add_codec_controls = snd_soc_add_codec_controls,
> +	.unregister_codec = snd_soc_unregister_codec,
> +	.register_codec = snd_soc_register_codec,
> +};
> +#endif

No, we can't deal with old kernels in upstream contributions. Remove the
old stuff please.

> +
> +static aw_snd_soc_codec_t *aw883xx_get_codec(struct snd_soc_dai *dai)
> +{
> +#ifdef AW_KERNEL_VER_OVER_4_19_1
> +	return dai->component;
> +#else
> +	return dai->codec;
> +#endif
> +}
> +
> +/*
> + * aw883xx reg write/read
> + */
> +
> +int aw883xx_i2c_writes(struct aw883xx *aw883xx,
> +		uint8_t reg_addr, uint8_t *buf, uint16_t len)
> +{
> +	int ret = -1;
> +	uint8_t *data = NULL;
> +
> +	data = kmalloc(len + 1, GFP_KERNEL);
> +	if (data == NULL)
> +		return -ENOMEM;
> +
> +	data[0] = reg_addr;
> +	memcpy(&data[1], buf, len);
> +
> +	ret = i2c_master_send(aw883xx->i2c, data, len + 1);
> +	if (ret < 0) {
> +		aw_dev_err(aw883xx->dev, "i2c master send error");
> +		goto i2c_master_error;
> +	} else if (ret != (len + 1)) {
> +		aw_dev_err(aw883xx->dev, "i2c master send error(size error)");
> +		ret = -ENXIO;
> +		goto i2c_master_error;
> +	}
> +
> +	kfree(data);
> +	data = NULL;
> +	return 0;
> +
> +i2c_master_error:
> +	kfree(data);
> +	data = NULL;
> +	return ret;

isn't there an I2C helper for this and all the data transmission helpers
below?

> +}
> +
> +int aw883xx_i2c_reads(struct aw883xx *aw883xx,
> +			uint8_t reg_addr, uint8_t *data_buf,
> +			uint16_t data_len)
> +{
> +	int ret;
> +	struct i2c_msg msg[] = {
> +		[0] = {
> +				.addr = aw883xx->i2c->addr,
> +				.flags = 0,
> +				.len = sizeof(uint8_t),
> +				.buf = &reg_addr,
> +				},
> +		[1] = {
> +				.addr = aw883xx->i2c->addr,
> +				.flags = I2C_M_RD,
> +				.len = data_len,
> +				.buf = data_buf,
> +				},
> +	};
> +
> +	ret = i2c_transfer(aw883xx->i2c->adapter, msg, ARRAY_SIZE(msg));
> +	if (ret < 0) {
> +		aw_dev_err(aw883xx->dev, "i2c_transfer failed");
> +		return ret;
> +	} else if (ret != AW883XX_READ_MSG_NUM) {
> +		aw_dev_err(aw883xx->dev, "transfer failed(size error)");
> +		return -ENXIO;
> +	}
> +
> +	return 0;
> +}
> +
> +int aw883xx_i2c_write(struct aw883xx *aw883xx,
> +		uint8_t reg_addr, uint16_t reg_data)
> +{
> +	int ret = -1;> +	uint8_t cnt = 0;
> +	uint8_t buf[2] = {0};
> +
> +	buf[0] = (reg_data & 0xff00) >> 8;
> +	buf[1] = (reg_data & 0x00ff) >> 0;
> +
> +	while (cnt < AW_I2C_RETRIES) {
> +		ret = aw883xx_i2c_writes(aw883xx, reg_addr, buf, 2);
> +		if (ret < 0)
> +			aw_dev_err(aw883xx->dev, "i2c_write cnt=%d error=%d",
> +				cnt, ret);
> +		else
> +			break;
> +		cnt++;
> +	}
> +
> +	if (aw883xx->i2c_log_en)
> +		aw_dev_info(aw883xx->dev, "write: reg = 0x%02x, val = 0x%04x",
> +			reg_addr, reg_data);
> +
> +	return ret;
> +}
> +
> +int aw883xx_i2c_read(struct aw883xx *aw883xx,
> +			uint8_t reg_addr, uint16_t *reg_data)
> +{
> +	int ret = -1;
> +	uint8_t cnt = 0;
> +	uint8_t buf[2] = {0};
> +
> +	while (cnt < AW_I2C_RETRIES) {
> +		ret = aw883xx_i2c_reads(aw883xx, reg_addr, buf, 2);
> +		if (ret < 0) {
> +			aw_dev_err(aw883xx->dev, "i2c_read cnt=%d error=%d",
> +				cnt, ret);
> +		} else {
> +			*reg_data = (buf[0] << 8) | (buf[1] << 0);
> +			break;
> +		}
> +		cnt++;
> +	}
> +
> +	if (aw883xx->i2c_log_en)
> +		aw_dev_info(aw883xx->dev, "read: reg = 0x%02x, val = 0x%04x",
> +			reg_addr, *reg_data);
> +
> +	return ret;
> +}
> +
> +int aw883xx_i2c_write_bits(struct aw883xx *aw883xx,
> +				uint8_t reg_addr, uint16_t mask,
> +				uint16_t reg_data)
> +{
> +	int ret = -1;
> +	uint16_t reg_val = 0;
> +
> +	ret = aw883xx_i2c_read(aw883xx, reg_addr, &reg_val);
> +	if (ret < 0) {
> +		aw_dev_err(aw883xx->dev, "i2c read error, ret=%d", ret);
> +		return ret;
> +	}
> +	reg_val &= mask;
> +	reg_val |= reg_data & (~mask);
> +	ret = aw883xx_i2c_write(aw883xx, reg_addr, reg_val);
> +	if (ret < 0) {
> +		aw_dev_err(aw883xx->dev, "i2c read error, ret=%d", ret);
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +int aw883xx_reg_write(struct aw883xx *aw883xx,
> +			uint8_t reg_addr, uint16_t reg_data)
> +{
> +	int ret = -1;
> +
> +	mutex_lock(&aw883xx->i2c_lock);
> +	ret = aw883xx_i2c_write(aw883xx, reg_addr, reg_data);
> +	if (ret < 0)
> +		aw_dev_err(aw883xx->dev,
> +			"write fail, reg = 0x%02x, val = 0x%04x, ret=%d",
> +			reg_addr, reg_data, ret);
> +	mutex_unlock(&aw883xx->i2c_lock);
> +
> +	return ret;
> +}
> +
> +int aw883xx_reg_read(struct aw883xx *aw883xx,
> +			uint8_t reg_addr, uint16_t *reg_data)
> +{
> +	int ret = -1;
> +
> +	mutex_lock(&aw883xx->i2c_lock);
> +	ret = aw883xx_i2c_read(aw883xx, reg_addr, reg_data);
> +	if (ret < 0)
> +		aw_dev_err(aw883xx->dev,
> +			"read fail: reg = 0x%02x, val = 0x%04x, ret=%d",
> +			reg_addr, *reg_data, ret);
> +	mutex_unlock(&aw883xx->i2c_lock);
> +
> +	return ret;
> +}
> +
> +int aw883xx_reg_write_bits(struct aw883xx *aw883xx,
> +			uint8_t reg_addr, uint16_t mask, uint16_t reg_data)
> +{
> +	int ret = -1;
> +
> +	mutex_lock(&aw883xx->i2c_lock);
> +	ret = aw883xx_i2c_write_bits(aw883xx, reg_addr, mask, reg_data);
> +	if (ret < 0)
> +		aw_dev_err(aw883xx->dev,
> +			"%s fail, ret=%d", __func__, ret);
> +	mutex_unlock(&aw883xx->i2c_lock);
> +
> +	return ret;
> +}
> +
> +static int aw883xx_dsp_write_16bit(struct aw883xx *aw883xx,
> +		uint16_t dsp_addr, uint32_t dsp_data)
> +{
> +	int ret;
> +	struct aw_dsp_mem_desc *desc = &aw883xx->aw_pa->dsp_mem_desc;
> +
> +	ret = aw883xx_i2c_write(aw883xx, desc->dsp_madd_reg, dsp_addr);
> +	if (ret < 0) {
> +		aw_dev_err(aw883xx->dev, "i2c write error, ret=%d", ret);
> +		return ret;
> +	}
> +
> +	ret = aw883xx_i2c_write(aw883xx, desc->dsp_mdat_reg, (uint16_t)dsp_data);
> +	if (ret < 0) {
> +		aw_dev_err(aw883xx->dev, "i2c write error, ret=%d", ret);
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static int aw883xx_dsp_write_32bit(struct aw883xx *aw883xx,
> +		uint16_t dsp_addr, uint32_t dsp_data)
> +{
> +	int ret;
> +	uint16_t temp_data = 0;
> +	struct aw_dsp_mem_desc *desc = &aw883xx->aw_pa->dsp_mem_desc;
> +
> +	ret = aw883xx_i2c_write(aw883xx, desc->dsp_madd_reg, dsp_addr);
> +	if (ret < 0) {
> +		aw_dev_err(aw883xx->dev, "i2c write error, ret=%d", ret);
> +		return ret;
> +	}
> +
> +	temp_data = dsp_data & AW883XX_DSP_16_DATA_MASK;
> +	ret = aw883xx_i2c_write(aw883xx, desc->dsp_mdat_reg, temp_data);
> +	if (ret < 0) {
> +		aw_dev_err(aw883xx->dev, "i2c write error, ret=%d", ret);
> +		return ret;
> +	}
> +
> +	temp_data = dsp_data >> 16;
> +	ret = aw883xx_i2c_write(aw883xx, desc->dsp_mdat_reg, temp_data);
> +	if (ret < 0) {
> +		aw_dev_err(aw883xx->dev, "i2c write error, ret=%d", ret);
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
> +	uint16_t reg_value;
> +	uint8_t reg = aw883xx->aw_pa->soft_rst.reg;
> +
> +	aw883xx_i2c_read(aw883xx, reg, &reg_value);
> +}
> +
> +int aw883xx_dsp_write(struct aw883xx *aw883xx,
> +		uint16_t dsp_addr, uint32_t dsp_data, uint8_t data_type)
> +{
> +	int ret = -1;
> +
> +	mutex_lock(&aw883xx->i2c_lock);
> +	if (data_type == AW_DSP_16_DATA) {
> +		ret = aw883xx_dsp_write_16bit(aw883xx, dsp_addr, dsp_data);
> +		if (ret < 0) {
> +			aw_dev_err(aw883xx->dev, "write dsp_addr[0x%04x] 16 bit dsp_data[%04x] failed",
> +					(uint32_t)dsp_addr, dsp_data);
> +			goto exit;
> +		}
> +	} else if (data_type == AW_DSP_32_DATA) {
> +		ret =  aw883xx_dsp_write_32bit(aw883xx, dsp_addr, dsp_data);
> +		if (ret < 0) {
> +			aw_dev_err(aw883xx->dev, "write dsp_addr[0x%04x] 32 bit dsp_data[%08x] failed",
> +					(uint32_t)dsp_addr, dsp_data);
> +			goto exit;
> +		}
> +	} else {
> +		aw_dev_err(aw883xx->dev, "data type[%d] unsupported", data_type);
> +		ret = -EINVAL;
> +		goto exit;
> +	}
> +
> +exit:
> +	aw883xx_clear_dsp_sel_st(aw883xx);
> +	mutex_unlock(&aw883xx->i2c_lock);
> +	return ret;
> +}
> +
> +
> +static int aw883xx_dsp_read_16bit(struct aw883xx *aw883xx,
> +		uint16_t dsp_addr, uint32_t *dsp_data)
> +{
> +	int ret;
> +	uint16_t temp_data = 0;
> +	struct aw_dsp_mem_desc *desc = &aw883xx->aw_pa->dsp_mem_desc;
> +
> +	ret = aw883xx_i2c_write(aw883xx, desc->dsp_madd_reg, dsp_addr);
> +	if (ret < 0) {
> +		aw_dev_err(aw883xx->dev, "i2c write error, ret=%d", ret);
> +		return ret;
> +	}
> +
> +	ret = aw883xx_i2c_read(aw883xx, desc->dsp_mdat_reg, &temp_data);
> +	if (ret < 0) {
> +		aw_dev_err(aw883xx->dev, "i2c write error, ret=%d", ret);
> +		return ret;
> +	}
> +
> +	*dsp_data = temp_data;
> +
> +	return 0;
> +}
> +
> +static int aw883xx_dsp_read_32bit(struct aw883xx *aw883xx,
> +		uint16_t dsp_addr, uint32_t *dsp_data)
> +{
> +	int ret;
> +	uint16_t temp_data = 0;
> +	struct aw_dsp_mem_desc *desc = &aw883xx->aw_pa->dsp_mem_desc;
> +
> +	/*write dsp addr*/
> +	ret = aw883xx_i2c_write(aw883xx, desc->dsp_madd_reg, dsp_addr);
> +	if (ret < 0) {
> +		aw_dev_err(aw883xx->dev, "i2c write error, ret=%d", ret);
> +		return ret;
> +	}
> +
> +	/*get Low 16 bit data*/
> +	ret = aw883xx_i2c_read(aw883xx, desc->dsp_mdat_reg, &temp_data);
> +	if (ret < 0) {
> +		aw_dev_err(aw883xx->dev, "i2c read error, ret=%d", ret);
> +		return ret;
> +	}
> +
> +	*dsp_data = temp_data;
> +
> +	/*get high 16 bit data*/
> +	ret = aw883xx_i2c_read(aw883xx, desc->dsp_mdat_reg, &temp_data);
> +	if (ret < 0) {
> +		aw_dev_err(aw883xx->dev, "i2c read error, ret=%d", ret);
> +		return ret;
> +	}
> +	*dsp_data |= (temp_data << 16);
> +
> +	return 0;
> +}
> +
> +int aw883xx_dsp_read(struct aw883xx *aw883xx,
> +		uint16_t dsp_addr, uint32_t *dsp_data, uint8_t data_type)
> +{
> +	int ret = -1;
> +
> +	mutex_lock(&aw883xx->i2c_lock);
> +	if (data_type == AW_DSP_16_DATA) {
> +		ret = aw883xx_dsp_read_16bit(aw883xx, dsp_addr, dsp_data);
> +		if (ret < 0) {
> +			aw_dev_err(aw883xx->dev, "read dsp_addr[0x%04x] 16 bit dsp_data[%04x] failed",
> +					(uint32_t)dsp_addr, *dsp_data);
> +			goto exit;
> +		}
> +	} else if (data_type == AW_DSP_32_DATA) {
> +		ret = aw883xx_dsp_read_32bit(aw883xx, dsp_addr, dsp_data);
> +		if (ret < 0) {
> +			aw_dev_err(aw883xx->dev, "read dsp_addr[0x%04x] 32 bit dsp_data[%08x] failed",
> +					(uint32_t)dsp_addr, *dsp_data);
> +			goto exit;
> +		}
> +	} else {
> +		aw_dev_err(aw883xx->dev, "data type[%d] unsupported", data_type);
> +		ret = -EINVAL;
> +		goto exit;
> +	}
> +
> +exit:
> +	aw883xx_clear_dsp_sel_st(aw883xx);
> +	mutex_unlock(&aw883xx->i2c_lock);
> +	return ret;
> +}
> +
> +/*
> + * aw883xx get dev num
> + */
> +int aw883xx_get_dev_num(void)
> +{
> +	return g_aw883xx_dev_cnt;
> +}
> +
> +/*
> + * aw883xx interrupt
> + */
> +static void aw883xx_interrupt_work(struct work_struct *work)
> +{
> +	struct aw883xx *aw883xx = container_of(work,
> +				struct aw883xx, interrupt_work.work);
> +	int16_t reg_value = 0;
> +	int ret = -1;
> +
> +	aw_dev_info(aw883xx->dev, "enter");

don't redefine your own dev_info, and that's way to verbose for an
interrupt.

> +
> +	/*read reg value*/
> +	ret = aw883xx_dev_get_int_status(aw883xx->aw_pa, &reg_value);
> +	if (ret < 0)
> +		aw_dev_err(aw883xx->dev, "get init_reg value failed");
> +	else
> +		aw_dev_info(aw883xx->dev, "int value 0x%x", reg_value);
> +
> +	/*clear init reg*/

spaces in comments please

> +	aw883xx_dev_clear_int_status(aw883xx->aw_pa);
> +
> +	/*unmask interrupt*/
> +	aw883xx_dev_set_intmask(aw883xx->aw_pa, true);
> +}
> +
> +/*
> + * Digital Audio Interface
> + */
> +static int aw883xx_startup(struct snd_pcm_substream *substream,
> +			struct snd_soc_dai *dai)
> +{
> +	aw_snd_soc_codec_t *codec = aw883xx_get_codec(dai);
> +	struct aw883xx *aw883xx =
> +		aw_componet_codec_ops.codec_get_drvdata(codec);
> +
> +	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
> +		aw_dev_info(aw883xx->dev, "playback enter");
> +		/*load cali re*/
> +		if (aw883xx->aw_pa->cali_desc.cali_re == AW_ERRO_CALI_RE_VALUE)
> +			aw883xx_cali_get_cali_re(&aw883xx->aw_pa->cali_desc);
> +	} else {
> +		aw_dev_info(aw883xx->dev, "capture enter");

that's really useless, please trim the debug logs.

> +	}
> +
> +	return 0;
> +}
> +
> +static int aw883xx_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
> +{
> +	aw_snd_soc_codec_t *codec = aw883xx_get_codec(dai);
> +
> +	aw_dev_info(codec->dev, "fmt=0x%x", fmt);
> +
> +	return 0;
> +}
> +
> +static int aw883xx_set_dai_sysclk(struct snd_soc_dai *dai,
> +				int clk_id, unsigned int freq, int dir)
> +{
> +	aw_snd_soc_codec_t *codec = aw883xx_get_codec(dai);
> +	struct aw883xx *aw883xx =
> +		aw_componet_codec_ops.codec_get_drvdata(codec);
> +
> +	aw_dev_info(aw883xx->dev, "freq=%d", freq);
> +
> +	aw883xx->sysclk = freq;
> +	return 0;
> +}
> +
> +static int aw883xx_hw_params(struct snd_pcm_substream *substream,
> +				struct snd_pcm_hw_params *params,
> +				struct snd_soc_dai *dai)
> +{
> +	aw_snd_soc_codec_t *codec = aw883xx_get_codec(dai);
> +	struct aw883xx *aw883xx =
> +		aw_componet_codec_ops.codec_get_drvdata(codec);
> +
> +	/* get CAPTURE rate param  bit width*/
> +	if (substream->stream == SNDRV_PCM_STREAM_CAPTURE) {
> +		aw_dev_info(aw883xx->dev,
> +			"STREAM_CAPTURE requested rate: %d, width = %d",
> +			params_rate(params), params_width(params));
> +	}
> +
> +	/* get PLAYBACK rate param  bit width*/
> +	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
> +		aw_dev_info(aw883xx->dev,
> +			"STREAM_PLAYBACK requested rate: %d, width = %d",
> +			params_rate(params), params_width(params));
> +	}
> +
> +	return 0;
> +}
> +
> +static void aw883xx_start_pa(struct aw883xx *aw883xx)
> +{
> +	int ret, i;
> +
> +	aw_dev_info(aw883xx->dev, "enter");
> +
> +	if (aw883xx->allow_pw == false) {
> +		aw_dev_info(aw883xx->dev, "dev can not allow power");
> +		return;
> +	}
> +
> +	if (aw883xx->pstream == AW883XX_STREAM_CLOSE) {
> +		aw_dev_info(aw883xx->dev, "pstream is close");
> +		return;
> +	}
> +
> +	for (i = 0; i < AW_START_RETRIES; i++) {
> +		ret = aw883xx_device_start(aw883xx->aw_pa);
> +		if (ret) {
> +			aw_dev_err(aw883xx->dev, "start failed");
> +			ret = aw883xx_dev_fw_update(aw883xx->aw_pa, AW_DSP_FW_UPDATE_ON, true);
> +			if (ret < 0) {
> +				aw_dev_err(aw883xx->dev, "fw update failed");
> +				continue;
> +			}
> +		} else {
> +			aw_dev_info(aw883xx->dev, "start success");
> +			break;
> +		}
> +	}
> +}
> +
> +static void aw883xx_startup_work(struct work_struct *work)
> +{
> +	struct aw883xx *aw883xx =
> +		container_of(work, struct aw883xx, start_work.work);
> +
> +	mutex_lock(&aw883xx->lock);

do you really need such high-level locks?

> +	aw883xx_start_pa(aw883xx);
> +	mutex_unlock(&aw883xx->lock);
> +}
> +
> +static void aw883xx_start(struct aw883xx *aw883xx, bool sync_start)
> +{
> +	int ret;
> +	int i;
> +
> +	if (aw883xx->aw_pa->fw_status == AW_DEV_FW_OK) {
> +		if (aw883xx->allow_pw == false) {
> +			aw_dev_info(aw883xx->dev, "dev can not allow power");
> +			return;
> +		}
> +
> +		if (aw883xx->aw_pa->status == AW_DEV_PW_ON)
> +			return;
> +
> +		for (i = 0; i < AW_START_RETRIES; i++) {
> +			ret = aw883xx_dev_fw_update(aw883xx->aw_pa, AW_DSP_FW_UPDATE_OFF,
> +						aw883xx->phase_sync);
> +			if (ret < 0) {
> +				aw_dev_err(aw883xx->dev, "fw update failed");
> +				continue;
> +			} else {
> +				/*firmware update success*/
> +				if (sync_start == AW_SYNC_START)
> +					aw883xx_start_pa(aw883xx);
> +				else
> +					queue_delayed_work(aw883xx->work_queue,
> +						&aw883xx->start_work,
> +						AW883XX_START_WORK_DELAY_MS);
> +
> +				return;
> +			}
> +		}
> +	}
> +}
> +
> +static int aw883xx_mute(struct snd_soc_dai *dai, int mute, int stream)
> +{
> +	aw_snd_soc_codec_t *codec = aw883xx_get_codec(dai);
> +	struct aw883xx *aw883xx =
> +		aw_componet_codec_ops.codec_get_drvdata(codec);
> +
> +	aw_dev_info(aw883xx->dev, "mute state=%d", mute);
> +
> +	if (stream != SNDRV_PCM_STREAM_PLAYBACK) {
> +		aw_dev_info(aw883xx->dev, "capture");
> +		return 0;
> +	}
> +
> +	if (mute) {
> +		aw883xx->pstream = AW883XX_STREAM_CLOSE;
> +		cancel_delayed_work_sync(&aw883xx->start_work);
> +		mutex_lock(&aw883xx->lock);
> +		aw883xx_device_stop(aw883xx->aw_pa);
> +		mutex_unlock(&aw883xx->lock);
> +	} else {
> +		aw883xx->pstream = AW883XX_STREAM_OPEN;
> +		mutex_lock(&aw883xx->lock);
> +		aw883xx_start(aw883xx, AW_ASYNC_START);
> +		aw883xx_hold_dsp_spin_st(&aw883xx->aw_pa->spin_desc);
> +		mutex_unlock(&aw883xx->lock);
> +	}
> +
> +	return 0;
> +}
> +
> +static void aw883xx_shutdown(struct snd_pcm_substream *substream,
> +				struct snd_soc_dai *dai)
> +{
> +	aw_snd_soc_codec_t *codec = aw883xx_get_codec(dai);
> +	struct aw883xx *aw883xx =
> +		aw_componet_codec_ops.codec_get_drvdata(codec);
> +
> +	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
> +		aw_dev_info(aw883xx->dev, "stream playback");
> +	else
> +		aw_dev_info(aw883xx->dev, "stream capture");
> +}
> +
> +static const struct snd_soc_dai_ops aw883xx_dai_ops = {
> +	.startup = aw883xx_startup,
> +	.set_fmt = aw883xx_set_fmt,
> +	.set_sysclk = aw883xx_set_dai_sysclk,
> +	.hw_params = aw883xx_hw_params,
> +	.mute_stream = aw883xx_mute,
> +	.shutdown = aw883xx_shutdown,
> +};
> +
> +static struct snd_soc_dai_driver aw883xx_dai[] = {
> +	{
> +	.name = "aw883xx-aif",
> +	.id = 1,
> +	.playback = {
> +		.stream_name = "Speaker_Playback",
> +		.channels_min = 1,
> +		.channels_max = 2,
> +		.rates = AW883XX_RATES,
> +		.formats = AW883XX_FORMATS,
> +		},
> +	.capture = {
> +		.stream_name = "Speaker_Capture",
> +		.channels_min = 1,
> +		.channels_max = 2,
> +		.rates = AW883XX_RATES,
> +		.formats = AW883XX_FORMATS,
> +		},
> +	.ops = &aw883xx_dai_ops,
> +	/*.symmetric_rates = 1,*/
> +	},
> +};
> +
> +static int aw883xx_dai_drv_append_suffix(struct aw883xx *aw883xx,
> +				struct snd_soc_dai_driver *dai_drv,
> +				int num_dai)
> +{
> +	int ret;
> +	int i;
> +
> +	if ((dai_drv != NULL) && (num_dai > 0)) {
> +		for (i = 0; i < num_dai; i++) {
> +			if (aw883xx->rename_flag == AW_RENAME_ENABLE) {
> +				ret = aw883xx_append_channel_suffix("%s-%d",
> +						&dai_drv->name, aw883xx);
> +				if (ret < 0)
> +					return ret;
> +				ret = aw883xx_append_channel_suffix("%s_%d",
> +						&dai_drv->playback.stream_name, aw883xx);
> +				if (ret < 0)
> +					return ret;
> +				ret = aw883xx_append_channel_suffix("%s_%d",
> +						&dai_drv->capture.stream_name, aw883xx);
> +				if (ret < 0)
> +					return ret;
> +				dev_set_name(aw883xx->dev, "%s_%d",
> +					"aw883xx_smartpa", aw883xx->aw_pa->channel);
> +				aw_dev_info(aw883xx->dev, "change dev_name:%s",
> +					dev_name(aw883xx->dev));
> +
> +			} else {
> +				ret = aw883xx_append_i2c_suffix("%s-%d-%x",
> +						&dai_drv->name, aw883xx);
> +				if (ret < 0)
> +					return ret;
> +				ret = aw883xx_append_i2c_suffix("%s_%d_%x",
> +						&dai_drv->playback.stream_name, aw883xx);
> +				if (ret < 0)
> +					return ret;
> +				ret = aw883xx_append_i2c_suffix("%s_%d_%x",
> +						&dai_drv->capture.stream_name, aw883xx);
> +				if (ret < 0)
> +					return ret;
> +
> +			}
> +
> +			aw_dev_info(aw883xx->dev, "dai name [%s]", dai_drv[i].name);
> +			aw_dev_info(aw883xx->dev, "pstream_name [%s]",
> +						dai_drv[i].playback.stream_name);
> +			aw_dev_info(aw883xx->dev, "cstream_name [%s]",
> +						dai_drv[i].capture.stream_name);
> +		}
> +	}
> +
> +	return 0;

not sure what this function is trying to do, but it certainly would be
very hard to use the dai names for any machine driver binding if they
are so dynamic and variable, no?

> +}
> +
> +/*
> + * codec driver
> + */
> +static int aw883xx_get_fade_in_time(struct snd_kcontrol *kcontrol,
> +	struct snd_ctl_elem_value *ucontrol)
> +{
> +	unsigned int time;
> +
> +	aw883xx_dev_get_fade_time(&time, true);
> +	ucontrol->value.integer.value[0] = time;
> +
> +	aw_pr_dbg("step time %ld", ucontrol->value.integer.value[0]);
> +
> +	return 0;
> +
> +}
> +
> +static int aw883xx_set_fade_in_time(struct snd_kcontrol *kcontrol,
> +	struct snd_ctl_elem_value *ucontrol)
> +{
> +	struct soc_mixer_control *mc =
> +		(struct soc_mixer_control *)kcontrol->private_value;
> +
> +	if ((ucontrol->value.integer.value[0] > mc->max) ||
> +		(ucontrol->value.integer.value[0] < mc->min)) {
> +		aw_pr_dbg("set val %ld overflow %d or  less than :%d",
> +			ucontrol->value.integer.value[0], mc->max, mc->min);
> +		return 0;
> +	}
> +	aw883xx_dev_set_fade_time(ucontrol->value.integer.value[0], true);
> +
> +	aw_pr_dbg("step time %ld", ucontrol->value.integer.value[0]);
> +	return 0;
> +}
> +
> +static int aw883xx_get_fade_out_time(struct snd_kcontrol *kcontrol,
> +	struct snd_ctl_elem_value *ucontrol)
> +{
> +	unsigned int time;
> +
> +	aw883xx_dev_get_fade_time(&time, false);
> +	ucontrol->value.integer.value[0] = time;
> +
> +	aw_pr_dbg("step time %ld", ucontrol->value.integer.value[0]);
> +
> +	return 0;
> +}
> +
> +static int aw883xx_set_fade_out_time(struct snd_kcontrol *kcontrol,
> +	struct snd_ctl_elem_value *ucontrol)
> +{
> +	struct soc_mixer_control *mc =
> +		(struct soc_mixer_control *)kcontrol->private_value;
> +
> +	if ((ucontrol->value.integer.value[0] > mc->max) ||
> +		(ucontrol->value.integer.value[0] < mc->min)) {
> +		aw_pr_dbg("set val %ld overflow %d or  less than :%d",
> +			ucontrol->value.integer.value[0], mc->max, mc->min);
> +		return 0;
> +	}
> +
> +	aw883xx_dev_set_fade_time(ucontrol->value.integer.value[0], false);
> +
> +	aw_pr_dbg("step time %ld", ucontrol->value.integer.value[0]);
> +
> +	return 0;
> +}
> +
> +static const struct soc_enum aw883xx_snd_enum[] = {
> +	SOC_ENUM_SINGLE_EXT(ARRAY_SIZE(aw883xx_switch), aw883xx_switch),
> +};
> +
> +static struct snd_kcontrol_new aw883xx_controls[] = {
> +	SOC_SINGLE_EXT("aw883xx_fadein_us", 0, 0, 1000000, 0,
> +		aw883xx_get_fade_in_time, aw883xx_set_fade_in_time),
> +	SOC_SINGLE_EXT("aw883xx_fadeout_us", 0, 0, 1000000, 0,
> +		aw883xx_get_fade_out_time, aw883xx_set_fade_out_time),
> +};
> +
> +
> +static void aw883xx_add_codec_controls(struct aw883xx *aw883xx)
> +{
> +	aw_dev_info(aw883xx->dev, "enter");
> +
> +	if (aw883xx->aw_pa->channel == 0) {
> +		aw_componet_codec_ops.add_codec_controls(aw883xx->codec,
> +				&aw883xx_controls[0], ARRAY_SIZE(aw883xx_controls));
> +		aw883xx_add_spin_controls((void *)aw883xx);
> +	}
> +}
> +
> +static int aw883xx_profile_info(struct snd_kcontrol *kcontrol,
> +			 struct snd_ctl_elem_info *uinfo)
> +{
> +	int count;
> +	char *name = NULL;
> +	const char *prof_name = NULL;
> +	aw_snd_soc_codec_t *codec =
> +		aw_componet_codec_ops.kcontrol_codec(kcontrol);
> +	struct aw883xx *aw883xx =
> +		aw_componet_codec_ops.codec_get_drvdata(codec);

component typo. please fix this in all the file.

> +
> +	uinfo->type = SNDRV_CTL_ELEM_TYPE_ENUMERATED;
> +	uinfo->count = 1;
> +
> +	count = aw883xx_dev_get_profile_count(aw883xx->aw_pa);
> +	if (count <= 0) {
> +		uinfo->value.enumerated.items = 0;
> +		aw_dev_err(aw883xx->dev, "get count[%d] failed", count);
> +		return 0;
> +	}
> +
> +	uinfo->value.enumerated.items = count;
> +
> +	if (uinfo->value.enumerated.item >= count)
> +		uinfo->value.enumerated.item = count - 1;
> +
> +	name = uinfo->value.enumerated.name;
> +	count = uinfo->value.enumerated.item;
> +
> +	prof_name = aw_dev_get_prof_name(aw883xx->aw_pa, count);
> +	if (prof_name == NULL) {
> +		strscpy(uinfo->value.enumerated.name, "null",
> +						strlen("null") + 1);
> +		return 0;
> +	}
> +
> +	strscpy(name, prof_name, sizeof(uinfo->value.enumerated.name));
> +
> +	return 0;
> +}
> +
> +static int aw883xx_profile_get(struct snd_kcontrol *kcontrol,
> +			struct snd_ctl_elem_value *ucontrol)
> +{
> +	aw_snd_soc_codec_t *codec =
> +		aw_componet_codec_ops.kcontrol_codec(kcontrol);
> +	struct aw883xx *aw883xx =
> +		aw_componet_codec_ops.codec_get_drvdata(codec);
> +
> +	ucontrol->value.integer.value[0] = aw883xx_dev_get_profile_index(aw883xx->aw_pa);
> +	aw_dev_dbg(codec->dev, "profile index [%d]",
> +			aw883xx_dev_get_profile_index(aw883xx->aw_pa));
> +	return 0;
> +
> +}
> +
> +static int aw883xx_profile_set(struct snd_kcontrol *kcontrol,
> +		struct snd_ctl_elem_value *ucontrol)
> +{
> +	aw_snd_soc_codec_t *codec =
> +		aw_componet_codec_ops.kcontrol_codec(kcontrol);
> +	struct aw883xx *aw883xx =
> +		aw_componet_codec_ops.codec_get_drvdata(codec);
> +	int ret;
> +	int cur_index;
> +
> +	if (aw883xx->dbg_en_prof == false) {
> +		aw_dev_info(codec->dev, "profile close");
> +		return 0;
> +	}
> +
> +	/* check value valid */
> +	ret = aw883xx_dev_check_profile_index(aw883xx->aw_pa, ucontrol->value.integer.value[0]);
> +	if (ret) {
> +		aw_dev_info(codec->dev, "unsupported index %ld",
> +					ucontrol->value.integer.value[0]);
> +		return 0;
> +	}
> +
> +	/*check cur_index == set value*/
> +	cur_index = aw883xx_dev_get_profile_index(aw883xx->aw_pa);
> +	if (cur_index == ucontrol->value.integer.value[0]) {
> +		aw_dev_info(codec->dev, "index no change");
> +		return 0;
> +	}
> +
> +	/*pa stop or stopping just set profile*/
> +	mutex_lock(&aw883xx->lock);
> +	aw883xx_dev_set_profile_index(aw883xx->aw_pa, ucontrol->value.integer.value[0]);
> +
> +	if (aw883xx->pstream) {
> +		aw883xx_device_stop(aw883xx->aw_pa);
> +		aw883xx_start(aw883xx, AW_SYNC_START);
> +	}
> +
> +	mutex_unlock(&aw883xx->lock);
> +
> +	aw_dev_info(codec->dev, "profile id %ld", ucontrol->value.integer.value[0]);
> +	return 0;
> +}
> +
> +static int aw883xx_switch_info(struct snd_kcontrol *kcontrol,
> +			struct snd_ctl_elem_info *uinfo)
> +{
> +	int count;
> +
> +	uinfo->type = SNDRV_CTL_ELEM_TYPE_ENUMERATED;
> +	uinfo->count = 1;
> +	count = 2;
> +
> +	uinfo->value.enumerated.items = count;
> +
> +	if (uinfo->value.enumerated.item >= count)
> +		uinfo->value.enumerated.item = count - 1;
> +
> +	strscpy(uinfo->value.enumerated.name,
> +		aw883xx_switch[uinfo->value.enumerated.item],
> +		strlen(aw883xx_switch[uinfo->value.enumerated.item]) + 1);
> +
> +	return 0;
> +}
> +
> +static int aw883xx_switch_get(struct snd_kcontrol *kcontrol,
> +			struct snd_ctl_elem_value *ucontrol)
> +{
> +	aw_snd_soc_codec_t *codec =
> +		aw_componet_codec_ops.kcontrol_codec(kcontrol);
> +	struct aw883xx *aw883xx =
> +		aw_componet_codec_ops.codec_get_drvdata(codec);
> +
> +	ucontrol->value.integer.value[0] = aw883xx->allow_pw;
> +
> +	return 0;
> +}
> +
> +static int aw883xx_switch_set(struct snd_kcontrol *kcontrol,
> +		struct snd_ctl_elem_value *ucontrol)
> +{
> +	aw_snd_soc_codec_t *codec =
> +		aw_componet_codec_ops.kcontrol_codec(kcontrol);
> +	struct aw883xx *aw883xx =
> +		aw_componet_codec_ops.codec_get_drvdata(codec);
> +
> +	aw_dev_info(codec->dev, "set value:%ld", ucontrol->value.integer.value[0]);
> +
> +	if (ucontrol->value.integer.value[0] == aw883xx->allow_pw) {
> +		aw_dev_info(aw883xx->dev, "PA switch not change");
> +		return 0;
> +	}
> +
> +	if (aw883xx->pstream) {
> +		if (ucontrol->value.integer.value[0] == 0) {
> +			cancel_delayed_work_sync(&aw883xx->start_work);
> +			mutex_lock(&aw883xx->lock);
> +			aw883xx_device_stop(aw883xx->aw_pa);
> +			aw883xx->allow_pw = false;
> +			mutex_unlock(&aw883xx->lock);
> +		} else {
> +			cancel_delayed_work_sync(&aw883xx->start_work);
> +			mutex_lock(&aw883xx->lock);
> +			aw883xx->allow_pw = true;
> +			aw883xx_start(aw883xx, AW_SYNC_START);
> +			mutex_unlock(&aw883xx->lock);
> +		}
> +	} else {
> +		mutex_lock(&aw883xx->lock);
> +		if (ucontrol->value.integer.value[0])
> +			aw883xx->allow_pw = true;
> +		else
> +			aw883xx->allow_pw = false;
> +		mutex_unlock(&aw883xx->lock);
> +	}
> +
> +	return 0;
> +}
> +
> +static int aw883xx_monitor_switch_info(struct snd_kcontrol *kcontrol,
> +			struct snd_ctl_elem_info *uinfo)
> +{
> +	int count;
> +
> +	uinfo->type = SNDRV_CTL_ELEM_TYPE_ENUMERATED;
> +	uinfo->count = 1;
> +	count = 2;
> +
> +	uinfo->value.enumerated.items = count;
> +
> +	if (uinfo->value.enumerated.item >= count)
> +		uinfo->value.enumerated.item = count - 1;
> +
> +	strscpy(uinfo->value.enumerated.name,
> +		aw883xx_switch[uinfo->value.enumerated.item],
> +		strlen(aw883xx_switch[uinfo->value.enumerated.item]) + 1);
> +
> +	return 0;
> +}
> +
> +static int aw883xx_monitor_switch_get(struct snd_kcontrol *kcontrol,
> +			struct snd_ctl_elem_value *ucontrol)
> +{
> +	aw_snd_soc_codec_t *codec =
> +		aw_componet_codec_ops.kcontrol_codec(kcontrol);
> +	struct aw883xx *aw883xx =
> +		aw_componet_codec_ops.codec_get_drvdata(codec);
> +	struct aw_monitor_desc *monitor_desc = &aw883xx->aw_pa->monitor_desc;
> +
> +	ucontrol->value.integer.value[0] = monitor_desc->monitor_cfg.monitor_switch;
> +
> +	return 0;
> +}
> +
> +static int aw883xx_monitor_switch_set(struct snd_kcontrol *kcontrol,
> +		struct snd_ctl_elem_value *ucontrol)
> +{
> +	aw_snd_soc_codec_t *codec =
> +		aw_componet_codec_ops.kcontrol_codec(kcontrol);
> +	struct aw883xx *aw883xx =
> +		aw_componet_codec_ops.codec_get_drvdata(codec);
> +	struct aw_monitor_desc *monitor_desc = &aw883xx->aw_pa->monitor_desc;
> +	uint32_t enable = 0;
> +
> +	aw_dev_info(codec->dev, "set monitor_switch:%ld", ucontrol->value.integer.value[0]);
> +
> +	enable = (uint32_t)ucontrol->value.integer.value[0];
> +
> +	if (monitor_desc->monitor_cfg.monitor_switch != enable) {
> +		monitor_desc->monitor_cfg.monitor_switch = enable;
> +		if (enable)
> +			aw883xx_monitor_start(monitor_desc);
> +	} else {
> +		aw_dev_info(aw883xx->dev, "monitor_switch not change");
> +		return 0;
> +	}
> +
> +	return 0;
> +}
> +
> +static int aw883xx_volume_info(struct snd_kcontrol *kcontrol,
> +					struct snd_ctl_elem_info *uinfo)
> +{
> +	aw_snd_soc_codec_t *codec =
> +		aw_componet_codec_ops.kcontrol_codec(kcontrol);
> +	struct aw883xx *aw883xx =
> +		aw_componet_codec_ops.codec_get_drvdata(codec);
> +	struct aw_volume_desc *vol_desc = &aw883xx->aw_pa->volume_desc;
> +
> +	/* set kcontrol info */
> +	uinfo->type = SNDRV_CTL_ELEM_TYPE_INTEGER;
> +	uinfo->count = 1;
> +	uinfo->value.integer.min = 0;
> +	uinfo->value.integer.max = vol_desc->mute_volume;
> +
> +	return 0;
> +}
> +
> +static int aw883xx_volume_get(struct snd_kcontrol *kcontrol,
> +				struct snd_ctl_elem_value *ucontrol)
> +{
> +	aw_snd_soc_codec_t *codec =
> +		aw_componet_codec_ops.kcontrol_codec(kcontrol);
> +	struct aw883xx *aw883xx =
> +		aw_componet_codec_ops.codec_get_drvdata(codec);
> +	struct aw_volume_desc *vol_desc = &aw883xx->aw_pa->volume_desc;
> +
> +	ucontrol->value.integer.value[0] = vol_desc->ctl_volume;
> +
> +	aw_dev_info(aw883xx->dev, "ucontrol->value.integer.value[0]=%d",
> +		vol_desc->ctl_volume);
> +
> +	return 0;
> +}
> +
> +static int aw883xx_volume_set(struct snd_kcontrol *kcontrol,
> +				struct snd_ctl_elem_value *ucontrol)
> +{
> +	uint16_t value = 0;
> +	uint16_t compared_vol = 0;
> +	aw_snd_soc_codec_t *codec =
> +		aw_componet_codec_ops.kcontrol_codec(kcontrol);
> +	struct aw883xx *aw883xx =
> +		aw_componet_codec_ops.codec_get_drvdata(codec);
> +	struct aw_volume_desc *vol_desc = &aw883xx->aw_pa->volume_desc;
> +
> +	value = (uint16_t)ucontrol->value.integer.value[0];
> +	if (value > vol_desc->mute_volume) {
> +		aw_dev_err(aw883xx->dev, "value over range\n");
> +		return -EINVAL;
> +	}
> +
> +	aw_dev_info(aw883xx->dev, "ucontrol->value.integer.value[0]=%d", value);
> +
> +	vol_desc->ctl_volume = value;
> +
> +	/*get smaller dB*/
> +	compared_vol = AW_GET_MAX_VALUE(vol_desc->ctl_volume,
> +		vol_desc->monitor_volume);
> +
> +	aw883xx_dev_set_volume(aw883xx->aw_pa, compared_vol);
> +
> +	return 0;
> +}
> +
> +static int aw883xx_dynamic_create_controls(struct aw883xx *aw883xx)
> +{
> +	struct snd_kcontrol_new *aw883xx_dev_control = NULL;
> +	char *kctl_name = NULL;
> +
> +	aw883xx_dev_control = devm_kzalloc(aw883xx->codec->dev,
> +			sizeof(struct snd_kcontrol_new) * AW_KCONTROL_NUM, GFP_KERNEL);
> +	if (aw883xx_dev_control == NULL)
> +		return -ENOMEM;
> +
> +	kctl_name = devm_kzalloc(aw883xx->codec->dev, AW_NAME_BUF_MAX, GFP_KERNEL);
> +	if (kctl_name == NULL)

if (!ptr) in all checks please.

> +		return -ENOMEM;
> +
> +	snprintf(kctl_name, AW_NAME_BUF_MAX, "aw_dev_%u_prof",
> +		aw883xx->aw_pa->channel);
> +
> +	aw883xx_dev_control[0].name = kctl_name;
> +	aw883xx_dev_control[0].iface = SNDRV_CTL_ELEM_IFACE_MIXER;
> +	aw883xx_dev_control[0].info = aw883xx_profile_info;
> +	aw883xx_dev_control[0].get = aw883xx_profile_get;
> +	aw883xx_dev_control[0].put = aw883xx_profile_set;
> +
> +	kctl_name = devm_kzalloc(aw883xx->codec->dev, AW_NAME_BUF_MAX, GFP_KERNEL);
> +	if (!kctl_name)
> +		return -ENOMEM;
> +
> +	snprintf(kctl_name, AW_NAME_BUF_MAX, "aw_dev_%u_switch", aw883xx->aw_pa->channel);
> +
> +	aw883xx_dev_control[1].name = kctl_name;
> +	aw883xx_dev_control[1].iface = SNDRV_CTL_ELEM_IFACE_MIXER;
> +	aw883xx_dev_control[1].info = aw883xx_switch_info;
> +	aw883xx_dev_control[1].get = aw883xx_switch_get;
> +	aw883xx_dev_control[1].put = aw883xx_switch_set;
> +
> +	kctl_name = devm_kzalloc(aw883xx->codec->dev, AW_NAME_BUF_MAX, GFP_KERNEL);
> +	if (!kctl_name)
> +		return -ENOMEM;
> +
> +	snprintf(kctl_name, AW_NAME_BUF_MAX, "aw_dev_%u_monitor_switch", aw883xx->aw_pa->channel);
> +
> +	aw883xx_dev_control[2].name = kctl_name;
> +	aw883xx_dev_control[2].iface = SNDRV_CTL_ELEM_IFACE_MIXER;
> +	aw883xx_dev_control[2].info = aw883xx_monitor_switch_info;
> +	aw883xx_dev_control[2].get = aw883xx_monitor_switch_get;
> +	aw883xx_dev_control[2].put = aw883xx_monitor_switch_set;
> +
> +	kctl_name = devm_kzalloc(aw883xx->codec->dev, AW_NAME_BUF_MAX, GFP_KERNEL);
> +	if (!kctl_name)
> +		return -ENOMEM;
> +
> +	snprintf(kctl_name, AW_NAME_BUF_MAX, "aw_dev_%d_rx_volume", aw883xx->aw_pa->channel);
> +
> +	aw883xx_dev_control[3].name = kctl_name;
> +	aw883xx_dev_control[3].iface = SNDRV_CTL_ELEM_IFACE_MIXER;
> +	aw883xx_dev_control[3].info = aw883xx_volume_info;
> +	aw883xx_dev_control[3].get = aw883xx_volume_get;
> +	aw883xx_dev_control[3].put = aw883xx_volume_set;
> +
> +	aw_componet_codec_ops.add_codec_controls(aw883xx->codec,
> +						aw883xx_dev_control, AW_KCONTROL_NUM);
> +
> +	return 0;
> +}
> +
> +static int aw883xx_request_firmware_file(struct aw883xx *aw883xx)
> +{
> +	const struct firmware *cont = NULL;
> +	struct aw_container *aw_cfg = NULL;
> +	int ret = -1;
> +	int i;
> +
> +	aw883xx->aw_pa->fw_status = AW_DEV_FW_FAILED;
> +
> +	for (i = 0; i < AW_REQUEST_FW_RETRIES; i++) {
> +		ret = request_firmware(&cont, AW883XX_ACF_FILE, aw883xx->dev);
> +		if ((ret < 0) || (!cont)) {
> +			aw883xx->fw_retry_cnt++;
> +			aw_dev_err(aw883xx->dev, "load [%s] try [%d]!",
> +						AW883XX_ACF_FILE, aw883xx->fw_retry_cnt);
> +
> +			if (aw883xx->fw_retry_cnt == AW_REQUEST_FW_RETRIES) {
> +				aw883xx->fw_retry_cnt = 0;
> +				return ret;
> +			}
> +			msleep(1000);
> +		} else {
> +			break;
> +		}

what makes you think that waiting and retrying is a good way to deal
with a missing firmware file?

> +	}
> +
> +	aw_dev_info(aw883xx->dev, "loaded %s - size: %zu",
> +		AW883XX_ACF_FILE, cont ? cont->size : 0);
> +
> +	mutex_lock(&g_aw883xx_lock);
> +	if (g_awinic_cfg == NULL) {
> +		aw_cfg = vzalloc(cont->size + sizeof(int));
> +		if (aw_cfg == NULL) {
> +			release_firmware(cont);
> +			mutex_unlock(&g_aw883xx_lock);
> +			return -ENOMEM;
> +		}
> +		aw_cfg->len = (int)cont->size;
> +		memcpy(aw_cfg->data, cont->data, cont->size);
> +		ret = aw883xx_dev_load_acf_check(aw_cfg);
> +		if (ret < 0) {
> +			aw_dev_err(aw883xx->dev, "Load [%s] failed ....!", AW883XX_ACF_FILE);
> +			vfree(aw_cfg);
> +			aw_cfg = NULL;
> +			release_firmware(cont);
> +			mutex_unlock(&g_aw883xx_lock);
> +			return ret;
> +		}
> +		g_awinic_cfg = aw_cfg;
> +	} else {
> +		aw_cfg = g_awinic_cfg;
> +		aw_dev_info(aw883xx->dev, "[%s] already loaded...", AW883XX_ACF_FILE);
> +	}
> +	release_firmware(cont);
> +	mutex_unlock(&g_aw883xx_lock);
> +
> +	mutex_lock(&aw883xx->lock);
> +	/*aw device init*/
> +	ret = aw883xx_device_init(aw883xx->aw_pa, aw_cfg);
> +	if (ret < 0) {
> +		aw_dev_info(aw883xx->dev, "dev init failed");
> +		mutex_unlock(&aw883xx->lock);
> +		return ret;
> +	}
> +
> +	aw883xx_dynamic_create_controls(aw883xx);
> +
> +	aw883xx_check_spin_mode(&aw883xx->aw_pa->spin_desc);
> +
> +	mutex_unlock(&aw883xx->lock);
> +
> +	return 0;
> +}
> +
> +static void aw883xx_fw_wrok(struct work_struct *work)
> +{
> +	struct aw883xx *aw883xx = container_of(work,
> +				struct aw883xx, acf_work.work);
> +	int ret;
> +
> +	ret = aw883xx_request_firmware_file(aw883xx);
> +	if (ret < 0)
> +		aw_dev_err(aw883xx->dev, "load profile failed");
> +
> +}
> +
> +static void aw883xx_load_fw(struct aw883xx *aw883xx)
> +{
> +#ifdef AW_SYNC_LOAD
> +		/*sync loading*/
> +		aw883xx_request_firmware_file(aw883xx);
> +#else
> +		/*async loading*/
> +		queue_delayed_work(aw883xx->work_queue,
> +				&aw883xx->acf_work,
> +				msecs_to_jiffies(AW883XX_LOAD_FW_DELAY_TIME));
> +#endif
> +}
> +
> +#ifdef AW_MTK_PLATFORM
> +
> +static const struct snd_soc_dapm_widget aw883xx_dapm_widgets[] = {
> +	 /* playback */
> +	SND_SOC_DAPM_AIF_IN("AIF_RX", "Speaker_Playback", 0, SND_SOC_NOPM, 0, 0),
> +	SND_SOC_DAPM_OUTPUT("audio_out"),
> +	/* capture */
> +	SND_SOC_DAPM_AIF_OUT("AIF_TX", "Speaker_Capture", 0, SND_SOC_NOPM, 0, 0),
> +	SND_SOC_DAPM_INPUT("iv_in"),
> +};
> +
> +static const struct snd_soc_dapm_route aw883xx_audio_map[] = {
> +	{"audio_out", NULL, "AIF_RX"},
> +	{"AIF_TX", NULL, "iv_in"},
> +};
> +
> +#if KERNEL_VERSION(4, 2, 0) > LINUX_VERSION_CODE
> +static struct snd_soc_dapm_context *snd_soc_codec_get_dapm(struct snd_soc_codec *codec)
> +{
> +	return &codec->dapm;
> +}
> +#endif
> +
> +static int aw883xx_add_widgets(struct aw883xx *aw883xx)
> +{
> +	int i = 0;
> +	int ret;
> +	struct snd_soc_dapm_widget *aw_widgets = NULL;
> +	struct snd_soc_dapm_route *aw_route = NULL;
> +#ifdef AW_KERNEL_VER_OVER_4_19_1
> +	struct snd_soc_dapm_context *dapm = snd_soc_component_get_dapm(aw883xx->codec);
> +#else
> +	struct snd_soc_dapm_context *dapm = snd_soc_codec_get_dapm(aw883xx->codec);
> +#endif
> +
> +	/*add widgets*/
> +	aw_widgets = devm_kzalloc(aw883xx->dev,
> +				sizeof(struct snd_soc_dapm_widget) *
> +				ARRAY_SIZE(aw883xx_dapm_widgets),
> +				GFP_KERNEL);
> +	if (!aw_widgets)
> +		return -ENOMEM;
> +
> +	memcpy(aw_widgets, aw883xx_dapm_widgets,
> +			sizeof(struct snd_soc_dapm_widget) * ARRAY_SIZE(aw883xx_dapm_widgets));
> +
> +	for (i = 0; i < ARRAY_SIZE(aw883xx_dapm_widgets); i++) {
> +		if (aw883xx->rename_flag == AW_RENAME_ENABLE) {
> +			if (aw_widgets[i].name) {
> +				ret = aw883xx_append_channel_suffix("%s_%d",
> +						&aw_widgets[i].name,
> +						aw883xx);
> +				if (ret < 0) {
> +					aw_dev_err(aw883xx->dev, "aw_widgets.name append channel suffix failed!\n");
> +					return ret;
> +				}
> +			}
> +
> +			if (aw_widgets[i].sname) {
> +				ret = aw883xx_append_channel_suffix("%s_%d",
> +						&aw_widgets[i].sname,
> +						aw883xx);
> +				if (ret < 0) {
> +					aw_dev_err(aw883xx->dev, "aw_widgets.name append channel suffix failed!");
> +					return ret;
> +				}
> +			}
> +		} else {
> +			if (aw_widgets[i].name) {
> +				ret = aw883xx_append_i2c_suffix("%s_%d_%x",
> +						&aw_widgets[i].name,
> +						aw883xx);
> +				if (ret < 0) {
> +					aw_dev_err(aw883xx->dev, "aw_widgets.name append i2c suffix failed!\n");
> +					return ret;
> +				}
> +			}
> +
> +			if (aw_widgets[i].sname) {
> +				ret = aw883xx_append_i2c_suffix("%s_%d_%x",
> +						&aw_widgets[i].sname,
> +						aw883xx);
> +				if (ret < 0) {
> +					aw_dev_err(aw883xx->dev, "aw_widgets.name append i2c suffix failed!");
> +					return ret;
> +				}
> +			}
> +		}
> +
> +	}
> +
> +	snd_soc_dapm_new_controls(dapm, aw_widgets, ARRAY_SIZE(aw883xx_dapm_widgets));
> +
> +	/*add route*/
> +	aw_route = devm_kzalloc(aw883xx->dev,
> +				sizeof(struct snd_soc_dapm_route) * ARRAY_SIZE(aw883xx_audio_map),
> +				GFP_KERNEL);
> +	if (!aw_route)
> +		return -ENOMEM;
> +
> +	memcpy(aw_route, aw883xx_audio_map,
> +		sizeof(struct snd_soc_dapm_route) * ARRAY_SIZE(aw883xx_audio_map));
> +
> +	for (i = 0; i < ARRAY_SIZE(aw883xx_audio_map); i++) {
> +		if (aw883xx->rename_flag == AW_RENAME_ENABLE) {
> +			if (aw_route[i].sink) {
> +				ret = aw883xx_append_channel_suffix("%s_%d",
> +						&aw_route[i].sink,
> +						aw883xx);
> +				if (ret < 0) {
> +					aw_dev_err(aw883xx->dev, "aw_route.sink append channel suffix failed!");
> +					return ret;
> +				}
> +			}
> +			if (aw_route[i].source) {
> +				ret = aw883xx_append_channel_suffix("%s_%d",
> +						&aw_route[i].source,
> +						aw883xx);
> +				if (ret < 0) {
> +					aw_dev_err(aw883xx->dev, "aw_route.source append channel suffix failed!");
> +					return ret;
> +				}
> +			}
> +		} else {
> +			if (aw_route[i].sink) {
> +				ret = aw883xx_append_i2c_suffix("%s_%d_%x",
> +						&aw_route[i].sink,
> +						aw883xx);
> +				if (ret < 0) {
> +					aw_dev_err(aw883xx->dev, "aw_route.sink append i2c suffix failed!");
> +					return ret;
> +				}
> +			}
> +			if (aw_route[i].source) {
> +				ret = aw883xx_append_i2c_suffix("%s_%d_%x",
> +						&aw_route[i].source,
> +						aw883xx);
> +				if (ret < 0) {
> +					aw_dev_err(aw883xx->dev, "aw_route.source append i2c suffix failed!");
> +					return ret;
> +				}
> +			}
> +		}
> +
> +
> +	}
> +	snd_soc_dapm_add_routes(dapm, aw_route, ARRAY_SIZE(aw883xx_audio_map));
> +
> +	return 0;
> +}
> +#endif
> +
> +static int aw883xx_codec_probe(aw_snd_soc_codec_t *aw_codec)
> +{
> +	struct aw883xx *aw883xx =
> +		aw_componet_codec_ops.codec_get_drvdata(aw_codec);
> +
> +	aw_dev_info(aw883xx->dev, "enter");
> +
> +	/*destroy_workqueue(struct workqueue_struct *wq)*/
> +	aw883xx->work_queue = create_singlethread_workqueue("aw883xx");
> +	if (!aw883xx->work_queue) {
> +		aw_dev_err(aw883xx->dev, "create workqueue failed !");
> +		return -EINVAL;
> +	}
> +
> +	INIT_DELAYED_WORK(&aw883xx->interrupt_work, aw883xx_interrupt_work);
> +	INIT_DELAYED_WORK(&aw883xx->start_work, aw883xx_startup_work);
> +	INIT_DELAYED_WORK(&aw883xx->acf_work, aw883xx_fw_wrok);
> +
> +	aw883xx->codec = aw_codec;
> +aw_dev_info(aw883xx->dev, "ex0");
> +	aw883xx_add_codec_controls(aw883xx);
> +	aw_dev_info(aw883xx->dev, "ex1");
> +#ifdef AW_MTK_PLATFORM
> +	aw883xx_add_widgets(aw883xx);
> +#endif
> +aw_dev_info(aw883xx->dev, "ex2");
> +	aw883xx_load_fw(aw883xx);
> +aw_dev_info(aw883xx->dev, "ex3");
> +	return 0;
> +}
> +
> +#ifdef AW_KERNEL_VER_OVER_4_19_1
> +static void aw883xx_codec_remove(aw_snd_soc_codec_t *aw_codec)
> +{
> +	struct aw883xx *aw883xx =
> +		aw_componet_codec_ops.codec_get_drvdata(aw_codec);
> +
> +	aw_dev_info(aw883xx->dev, "enter");
> +	dump_stack();
> +	cancel_delayed_work_sync(&aw883xx->interrupt_work);
> +	cancel_delayed_work_sync(&aw883xx->acf_work);
> +	cancel_delayed_work_sync(&aw883xx->aw_pa->monitor_desc.delay_work);
> +	cancel_delayed_work_sync(&aw883xx->start_work);
> +
> +	if (aw883xx->work_queue)
> +		destroy_workqueue(aw883xx->work_queue);
> +
> +	aw883xx_dev_deinit(aw883xx->aw_pa);
> +}
> +#else
> +static int aw883xx_codec_remove(aw_snd_soc_codec_t *aw_codec)
> +{
> +	struct aw883xx *aw883xx =
> +		aw_componet_codec_ops.codec_get_drvdata(aw_codec);
> +
> +	aw_dev_info(aw883xx->dev, "enter");
> +
> +	cancel_delayed_work_sync(&aw883xx->interrupt_work);
> +	cancel_delayed_work_sync(&aw883xx->acf_work);
> +	cancel_delayed_work_sync(&aw883xx->aw_pa->monitor_desc.delay_work);
> +	cancel_delayed_work_sync(&aw883xx->start_work);
> +
> +	if (aw883xx->work_queue)
> +		destroy_workqueue(aw883xx->work_queue);
> +
> +	aw883xx_dev_deinit(aw883xx->aw_pa);
> +
> +	return 0;
> +}
> +#endif
> +
> +#ifdef AW_KERNEL_VER_OVER_4_19_1
> +static const struct snd_soc_component_driver soc_codec_dev_aw883xx = {
> +	.probe = aw883xx_codec_probe,
> +	.remove = aw883xx_codec_remove,
> +};
> +#else
> +static struct snd_soc_codec_driver soc_codec_dev_aw883xx = {
> +	.probe = aw883xx_codec_probe,
> +	.remove = aw883xx_codec_remove,
> +};
> +#endif
> +
> +static int aw883xx_componet_codec_register(struct aw883xx *aw883xx)
> +{
> +	struct snd_soc_dai_driver *dai_drv = NULL;
> +	int ret;
> +
> +	dai_drv = devm_kzalloc(aw883xx->dev, sizeof(aw883xx_dai), GFP_KERNEL);
> +	if (dai_drv == NULL)
> +		return -ENOMEM;
> +
> +	memcpy(dai_drv, aw883xx_dai, sizeof(aw883xx_dai));
> +
> +	ret = aw883xx_dai_drv_append_suffix(aw883xx, dai_drv, 1);
> +	if (ret < 0)
> +		return ret;
> +
> +	ret = aw883xx->codec_ops->register_codec(aw883xx->dev,
> +			&soc_codec_dev_aw883xx,
> +			dai_drv, ARRAY_SIZE(aw883xx_dai));
> +	if (ret < 0) {
> +		aw_dev_err(aw883xx->dev, "failed to register aw883xx: %d", ret);
> +		return ret;
> +	}
> +
> +	if (aw883xx->rename_flag == AW_RENAME_ENABLE) {
> +		dev_set_name(aw883xx->dev, "%d-00%x",
> +			aw883xx->i2c->adapter->nr, aw883xx->i2c->addr);
> +		aw_dev_info(aw883xx->dev, "reset dev_name:%s",
> +			dev_name(aw883xx->dev));
> +	}
> +
> +	return 0;
> +}
> +
> +
> +static struct aw883xx *aw883xx_malloc_init(struct i2c_client *i2c)
> +{
> +	struct aw883xx *aw883xx = devm_kzalloc(&i2c->dev,
> +			sizeof(struct aw883xx), GFP_KERNEL);
> +	if (aw883xx == NULL)
> +		return NULL;
> +
> +	aw883xx->dev = &i2c->dev;
> +	aw883xx->i2c = i2c;
> +	aw883xx->aw_pa = NULL;
> +	aw883xx->codec = NULL;
> +	aw883xx->codec_ops = &aw_componet_codec_ops;
> +	aw883xx->dbg_en_prof = true;
> +	aw883xx->allow_pw = true;
> +	aw883xx->work_queue = NULL;
> +	aw883xx->i2c_log_en = 0;
> +	mutex_init(&aw883xx->lock);
> +	mutex_init(&aw883xx->i2c_lock);
> +
> +	return aw883xx;
> +}
> +
> +static int aw883xx_gpio_request(struct aw883xx *aw883xx)
> +{
> +	int ret;
> +
> +	if (gpio_is_valid(aw883xx->reset_gpio)) {
> +		ret = devm_gpio_request_one(aw883xx->dev, aw883xx->reset_gpio,
> +			GPIOF_OUT_INIT_LOW, "aw883xx_rst");
> +		if (ret) {
> +			aw_dev_err(aw883xx->dev, "rst request failed");
> +			return ret;
> +		}
> +	}
> +
> +	if (gpio_is_valid(aw883xx->irq_gpio)) {
> +		ret = devm_gpio_request_one(aw883xx->dev, aw883xx->irq_gpio,
> +			GPIOF_DIR_IN, "aw883xx_int");
> +		if (ret) {
> +			aw_dev_err(aw883xx->dev, "int request failed");
> +			return ret;
> +		}
> +	}
> +
> +	return 0;
> +}
> +
> +/*
> + * device tree
> + */
> +static int aw883xx_parse_gpio_dt(struct aw883xx *aw883xx)
> +{
> +	struct device_node *np = aw883xx->dev->of_node;
> +
> +	aw883xx->reset_gpio = of_get_named_gpio(np, "reset-gpio", 0);
> +	if (aw883xx->reset_gpio < 0) {
> +		aw_dev_err(aw883xx->dev, "no reset gpio provided, will not hw reset");
> +		//return -EIO;

remove?

> +	} else {
> +		aw_dev_info(aw883xx->dev, "reset gpio provided ok");
> +	}
> +
> +	aw883xx->irq_gpio = of_get_named_gpio(np, "irq-gpio", 0);
> +	if (aw883xx->irq_gpio < 0)
> +		aw_dev_info(aw883xx->dev, "no irq gpio provided.");
> +	else
> +		aw_dev_info(aw883xx->dev, "irq gpio provided ok.");
> +
> +	return 0;
> +}
> +
> +static void aw883xx_parse_sync_flag_dt(struct aw883xx *aw883xx)
> +{
> +	int ret;
> +	int32_t sync_enable = 0;
> +	struct device_node *np = aw883xx->dev->of_node;
> +
> +	ret = of_property_read_u32(np, "sync-flag", &sync_enable);
> +	if (ret < 0) {
> +		aw_dev_info(aw883xx->dev,
> +			"read sync flag failed,default phase sync off");
> +		sync_enable = false;
> +	} else {
> +		aw_dev_info(aw883xx->dev,
> +			"sync flag is %d", sync_enable);
> +	}
> +
> +	aw883xx->phase_sync = sync_enable;
> +}
> +
> +static void aw883xx_parse_rename_flag_dt(struct aw883xx *aw883xx)
> +{
> +	int ret;
> +	uint32_t rename_enable = 0;
> +	struct device_node *np = aw883xx->dev->of_node;
> +
> +	ret = of_property_read_u32(np, "rename-flag", &rename_enable);
> +	if (ret < 0) {
> +		aw_dev_info(aw883xx->dev,
> +			"read rename flag failed,default rename off");
> +	} else {
> +		aw_dev_info(aw883xx->dev,
> +			"rename flag is %d", rename_enable);
> +	}
> +
> +	aw883xx->rename_flag = rename_enable;
> +}
> +
> +static int aw883xx_parse_dt(struct aw883xx *aw883xx)
> +{
> +	aw883xx_parse_sync_flag_dt(aw883xx);
> +	aw883xx_parse_rename_flag_dt(aw883xx);
> +	return aw883xx_parse_gpio_dt(aw883xx);
> +}
> +
> +static int aw883xx_hw_reset(struct aw883xx *aw883xx)
> +{
> +	aw_dev_info(aw883xx->dev, "enter");
> +
> +	if (gpio_is_valid(aw883xx->reset_gpio)) {
> +		gpio_set_value_cansleep(aw883xx->reset_gpio, 0);
> +		usleep_range(AW_1000_US, AW_1000_US + 10);
> +		gpio_set_value_cansleep(aw883xx->reset_gpio, 1);
> +		usleep_range(AW_1000_US, AW_1000_US + 10);
> +	} else {
> +		aw_dev_err(aw883xx->dev, "failed");
> +	}
> +	return 0;
> +}
> +
> +static int aw883xx_read_chipid(struct aw883xx *aw883xx)
> +{
> +	int ret = -1;
> +	uint16_t reg_val = 0;
> +
> +	ret = aw883xx_reg_read(aw883xx, AW883XX_CHIP_ID_REG, &reg_val);
> +	if (ret < 0) {
> +		aw_dev_err(aw883xx->dev,
> +			"failed to read chip id, ret=%d", ret);
> +		return -EIO;
> +	}
> +
> +	aw883xx->chip_id = reg_val;
> +	aw_dev_info(aw883xx->dev,
> +			"read chip id: 0x%x", reg_val);
> +
> +	return 0;
> +}
> +
> +/*
> + * irq
> + */
> +static irqreturn_t aw883xx_irq(int irq, void *data)
> +{
> +	struct aw883xx *aw883xx = data;
> +
> +	if (aw883xx == NULL) {
> +		aw_pr_err("pointer is NULL");
> +		return -EINVAL;
> +	}
> +
> +	aw_dev_info(aw883xx->dev, "enter");
> +	/*mask all irq*/
> +	aw883xx_dev_set_intmask(aw883xx->aw_pa, false);
> +
> +	/*upload workqueue*/
> +	if (aw883xx->work_queue)
> +		queue_delayed_work(aw883xx->work_queue,
> +				&aw883xx->interrupt_work, 0);
> +
> +	return IRQ_HANDLED;
> +}
> +
> +static int aw883xx_interrupt_init(struct aw883xx *aw883xx)
> +{
> +	int irq_flags;
> +	int ret;
> +
> +	if (gpio_is_valid(aw883xx->irq_gpio)) {
> +		irq_flags = IRQF_TRIGGER_FALLING | IRQF_ONESHOT;
> +		ret = devm_request_threaded_irq(aw883xx->dev,
> +					gpio_to_irq(aw883xx->irq_gpio),
> +					NULL, aw883xx_irq, irq_flags,
> +					"aw883xx", aw883xx);
> +		if (ret) {
> +			aw_dev_err(aw883xx->dev, "Failed to request IRQ %d: %d",
> +					gpio_to_irq(aw883xx->irq_gpio), ret);
> +			return ret;
> +		}
> +	} else {
> +		aw_dev_info(aw883xx->dev, "skipping IRQ registration");
> +	}
> +
> +	return 0;
> +}
> +
> +
> +/*
> + * sys group attribute: reg
> + */
> +static ssize_t aw883xx_reg_show(struct device *dev,
> +				struct device_attribute *attr, char *buf)
> +{
> +	struct aw883xx *aw883xx = dev_get_drvdata(dev);
> +	int reg_num = aw883xx->aw_pa->ops.aw_get_reg_num();
> +	ssize_t len = 0;
> +	uint8_t i = 0;
> +	uint16_t reg_val = 0;
> +
> +	for (i = 0; i < reg_num; i++) {
> +		if (aw883xx->aw_pa->ops.aw_check_rd_access(i)) {
> +			aw883xx_reg_read(aw883xx, i, &reg_val);
> +			len += snprintf(buf + len, PAGE_SIZE - len,
> +					"reg:0x%02x=0x%04x\n", i, reg_val);
> +		}
> +	}
> +
> +	return len;
> +}
> +
> +static ssize_t aw883xx_reg_store(struct device *dev,
> +				struct device_attribute *attr, const char *buf,
> +				size_t count)
> +{
> +	struct aw883xx *aw883xx = dev_get_drvdata(dev);
> +	unsigned int databuf[2] = { 0 };
> +
> +	if (sscanf(buf, "%x %x", &databuf[0], &databuf[1]) == 2)
> +		aw883xx_reg_write(aw883xx, databuf[0], databuf[1]);
> +
> +	return count;
> +}
> +
> +static ssize_t aw883xx_rw_store(struct device *dev,
> +				struct device_attribute *attr, const char *buf,
> +				size_t count)
> +{
> +	struct aw883xx *aw883xx = dev_get_drvdata(dev);
> +	unsigned int databuf[2] = { 0 };
> +
> +	if (sscanf(buf, "%x %x", &databuf[0], &databuf[1]) == 2) {
> +		aw883xx->reg_addr = (uint8_t)databuf[0];
> +		if (aw883xx->aw_pa->ops.aw_check_rd_access(databuf[0]))
> +			aw883xx_reg_write(aw883xx, databuf[0], databuf[1]);
> +	} else if (sscanf(buf, "%x", &databuf[0]) == 1) {
> +		aw883xx->reg_addr = (uint8_t)databuf[0];
> +	}
> +
> +	return count;
> +}
> +
> +static ssize_t aw883xx_rw_show(struct device *dev,
> +				struct device_attribute *attr, char *buf)
> +{
> +	struct aw883xx *aw883xx = dev_get_drvdata(dev);
> +	ssize_t len = 0;
> +	uint16_t reg_val = 0;
> +
> +	if (aw883xx->aw_pa->ops.aw_check_rd_access(aw883xx->reg_addr)) {
> +		aw883xx_reg_read(aw883xx, aw883xx->reg_addr, &reg_val);
> +		len += snprintf(buf + len, PAGE_SIZE - len,
> +				"reg:0x%02x=0x%04x\n", aw883xx->reg_addr,
> +				reg_val);
> +	}
> +
> +	return len;
> +}
> +
> +static ssize_t aw883xx_drv_ver_show(struct device *dev,
> +	struct device_attribute *attr, char *buf)
> +{
> +	ssize_t len = 0;
> +
> +	len += snprintf(buf+len, PAGE_SIZE-len,
> +		"driver_ver: %s\n", AW883XX_DRIVER_VERSION);
> +
> +	return len;
> +}
> +
> +static ssize_t aw883xx_dsp_rw_show(struct device *dev,
> +				struct device_attribute *attr, char *buf)
> +{
> +	struct aw883xx *aw883xx = dev_get_drvdata(dev);
> +	ssize_t len = 0;
> +	uint16_t reg_val = 0;
> +
> +	mutex_lock(&aw883xx->i2c_lock);
> +	aw883xx_i2c_write(aw883xx, aw883xx->aw_pa->dsp_mem_desc.dsp_madd_reg, aw883xx->dsp_addr);
> +	aw883xx_i2c_read(aw883xx, aw883xx->aw_pa->dsp_mem_desc.dsp_mdat_reg, &reg_val);
> +	len += snprintf(buf + len, PAGE_SIZE - len,
> +			"dsp:0x%04x=0x%04x\n", aw883xx->dsp_addr, reg_val);
> +	aw883xx_i2c_read(aw883xx, aw883xx->aw_pa->dsp_mem_desc.dsp_mdat_reg, &reg_val);
> +	len += snprintf(buf + len, PAGE_SIZE - len,
> +			"dsp:0x%04x=0x%04x\n", aw883xx->dsp_addr + 1, reg_val);
> +	aw883xx_clear_dsp_sel_st(aw883xx);
> +	mutex_unlock(&aw883xx->i2c_lock);
> +
> +	return len;
> +}
> +
> +static ssize_t aw883xx_dsp_rw_store(struct device *dev,
> +				struct device_attribute *attr,
> +				const char *buf, size_t count)
> +{
> +	struct aw883xx *aw883xx = dev_get_drvdata(dev);
> +	unsigned int databuf[2] = { 0 };
> +
> +	if (sscanf(buf, "%x %x", &databuf[0], &databuf[1]) == 2) {
> +		aw883xx->dsp_addr = (unsigned int)databuf[0];
> +		aw883xx_dsp_write(aw883xx, databuf[0], databuf[1], AW_DSP_16_DATA);
> +		aw_dev_dbg(aw883xx->dev, "get param: %x %x",
> +			databuf[0], databuf[1]);
> +	} else if (sscanf(buf, "%x", &databuf[0]) == 1) {
> +		aw883xx->dsp_addr = (unsigned int)databuf[0];
> +		aw_dev_dbg(aw883xx->dev, "get param: %x",
> +			databuf[0]);
> +	}
> +	aw883xx_clear_dsp_sel_st(aw883xx);
> +
> +	return count;
> +}
> +
> +static int aw883xx_awrw_write(struct aw883xx *aw883xx, const char *buf, size_t count)
> +{
> +	int  i, ret;
> +	char *data_buf = NULL;
> +	int str_len, data_len, temp_data;
> +	struct aw883xx_i2c_packet *packet = &aw883xx->i2c_packet;
> +	uint32_t dsp_addr_h = 0, dsp_addr_l = 0;
> +
> +	if (buf == NULL) {
> +		aw_dev_err(aw883xx->dev, "awrw buf is NULL");
> +		return -EINVAL;
> +	}
> +
> +	data_len = AWRW_DATA_BYTES * packet->reg_num;
> +
> +	str_len = count - AWRW_HDR_LEN - 1;
> +	if ((data_len * 5 - 1) > str_len) {
> +		aw_dev_err(aw883xx->dev, "data_str_len [%d], requeset len [%d]",
> +					str_len, (data_len * 5 - 1));
> +		return -EINVAL;
> +	}
> +
> +	if (packet->reg_addr == aw883xx->aw_pa->dsp_mem_desc.dsp_madd_reg) {
> +		if (sscanf(buf + AWRW_HDR_LEN + 1,
> +					"0x%02x 0x%02x", &dsp_addr_h,
> +					&dsp_addr_l) == 2) {
> +			packet->dsp_addr = (dsp_addr_h << 8) | dsp_addr_l;
> +			      packet->dsp_status = AWRW_DSP_READY;
> +			aw_dev_dbg(aw883xx->dev, "write:reg_addr[0x%02x], dsp_base_addr:[0x%02x]",
> +							packet->reg_addr, packet->dsp_addr);
> +		} else {
> +			aw_dev_err(aw883xx->dev, "get reg 0x%x data failed", packet->reg_addr);
> +			return -EINVAL;
> +		}
> +		return 0;
> +	}
> +
> +	mutex_lock(&aw883xx->i2c_lock);
> +	if (packet->reg_addr == aw883xx->aw_pa->dsp_mem_desc.dsp_mdat_reg) {
> +		if (packet->dsp_status != AWRW_DSP_READY) {
> +			aw_dev_err(aw883xx->dev, "please write reg[0x40] first");
> +			ret = -EINVAL;
> +			goto exit;
> +		}
> +		aw883xx_i2c_write(aw883xx,
> +			aw883xx->aw_pa->dsp_mem_desc.dsp_madd_reg,
> +			packet->dsp_addr);
> +		packet->dsp_status = AWRW_DSP_ST_NONE;
> +	}
> +
> +	aw_dev_info(aw883xx->dev, "write:reg_addr[0x%02x], reg_num[%d]",
> +			packet->reg_addr, packet->reg_num);
> +
> +	data_buf = devm_kzalloc(aw883xx->dev, data_len, GFP_KERNEL);
> +	if (data_buf == NULL) {
> +		ret = -ENOMEM;
> +		goto exit;
> +	}
> +
> +	for (i = 0; i < data_len; i++) {
> +		if (sscanf(buf + AWRW_HDR_LEN + 1 + i * 5, "0x%02x", &temp_data) == 1)
> +			data_buf[i] = temp_data;
> +		data_buf[i] = temp_data;
> +
> +	}
> +
> +	ret = aw883xx_i2c_writes(aw883xx, packet->reg_addr, data_buf, data_len);
> +	if (ret < 0) {
> +		aw_dev_err(aw883xx->dev, "write failed");
> +		devm_kfree(aw883xx->dev, data_buf);
> +		data_buf = NULL;
> +		goto exit;
> +	}
> +
> +	devm_kfree(aw883xx->dev, data_buf);
> +	data_buf = NULL;
> +	aw_dev_info(aw883xx->dev, "write success");
> +exit:
> +	mutex_unlock(&aw883xx->i2c_lock);
> +	return ret;
> +}
> +
> +static int aw883xx_awrw_data_check(struct aw883xx *aw883xx, int *data)
> +{
> +	if ((data[AWRW_HDR_ADDR_BYTES] != AWRW_ADDR_BYTES) ||
> +			(data[AWRW_HDR_DATA_BYTES] != AWRW_DATA_BYTES)) {
> +		aw_dev_err(aw883xx->dev, "addr_bytes [%d] or data_bytes [%d] unsupport",
> +				data[AWRW_HDR_ADDR_BYTES], data[AWRW_HDR_DATA_BYTES]);
> +		return -EINVAL;
> +	}
> +
> +	return 0;
> +}
> +
> +/* flag addr_bytes data_bytes reg_num reg_addr*/
> +static int aw883xx_awrw_parse_buf(struct aw883xx *aw883xx, const char *buf, size_t count)
> +{
> +	int data[AWRW_HDR_MAX] = { 0 };
> +	struct aw883xx_i2c_packet *packet = &aw883xx->i2c_packet;
> +	int ret;
> +
> +	if (sscanf(buf, "0x%02x 0x%02x 0x%02x 0x%02x 0x%02x",
> +		&data[AWRW_HDR_WR_FLAG], &data[AWRW_HDR_ADDR_BYTES], &data[AWRW_HDR_DATA_BYTES],
> +		&data[AWRW_HDR_REG_NUM], &data[AWRW_HDR_REG_ADDR]) == 5) {
> +
> +		ret = aw883xx_awrw_data_check(aw883xx, data);
> +		if (ret < 0)
> +			return ret;
> +
> +		packet->reg_addr = data[AWRW_HDR_REG_ADDR];
> +		packet->reg_num = data[AWRW_HDR_REG_NUM];
> +
> +		if (data[AWRW_HDR_WR_FLAG] == AWRW_FLAG_WRITE) {
> +			return aw883xx_awrw_write(aw883xx, buf, count);
> +		} else if (data[AWRW_HDR_WR_FLAG] == AWRW_FLAG_READ) {
> +			packet->i2c_status = AWRW_I2C_ST_READ;
> +			aw_dev_info(aw883xx->dev, "read_cmd:reg_addr[0x%02x], reg_num[%d]",
> +					packet->reg_addr, packet->reg_num);
> +
> +		} else {
> +			aw_dev_err(aw883xx->dev,
> +				"please check str format, unsupport flag %d",
> +				data[AWRW_HDR_WR_FLAG]);
> +			return -EINVAL;
> +		}
> +	} else {
> +		aw_dev_err(aw883xx->dev, "can not parse string");
> +		return -EINVAL;
> +	}
> +
> +	return 0;
> +}
> +
> +static ssize_t aw883xx_awrw_store(struct device *dev,
> +	struct device_attribute *attr, const char *buf, size_t count)
> +{
> +	struct aw883xx *aw883xx = dev_get_drvdata(dev);
> +	int ret;
> +
> +	if (count < AWRW_HDR_LEN) {
> +		aw_dev_err(dev, "data count too smaller, please check write format");
> +		aw_dev_err(dev, "string %s", buf);
> +		return -EINVAL;
> +	}
> +
> +	ret = aw883xx_awrw_parse_buf(aw883xx, buf, count);
> +	if (ret)
> +		return -EINVAL;
> +
> +
> +	return count;
> +}
> +
> +static ssize_t aw883xx_awrw_show(struct device *dev,
> +	struct device_attribute *attr, char *buf)
> +{
> +	struct aw883xx *aw883xx = dev_get_drvdata(dev);
> +	struct aw883xx_i2c_packet *packet = &aw883xx->i2c_packet;
> +	int data_len, len = 0;
> +	int ret, i;
> +	char *reg_data = NULL;
> +
> +	if (packet->i2c_status != AWRW_I2C_ST_READ) {
> +		aw_dev_err(aw883xx->dev, "please write read cmd first");
> +		return -EINVAL;
> +	}
> +
> +	mutex_lock(&aw883xx->i2c_lock);
> +	if (packet->reg_addr == aw883xx->aw_pa->dsp_mem_desc.dsp_mdat_reg) {
> +		if (packet->dsp_status != AWRW_DSP_READY) {
> +			aw_dev_err(aw883xx->dev, "please write reg[0x40] first");
> +			mutex_unlock(&aw883xx->i2c_lock);
> +			return -EINVAL;
> +		}
> +		ret = aw883xx_i2c_write(aw883xx,
> +				aw883xx->aw_pa->dsp_mem_desc.dsp_madd_reg,
> +				packet->dsp_addr);
> +		if (ret < 0) {
> +			mutex_unlock(&aw883xx->i2c_lock);
> +			return ret;
> +		}
> +		packet->dsp_status = AWRW_DSP_ST_NONE;
> +	}
> +
> +	data_len = AWRW_DATA_BYTES * packet->reg_num;
> +	reg_data = devm_kzalloc(dev, data_len, GFP_KERNEL);
> +	if (reg_data == NULL) {
> +		aw_dev_err(aw883xx->dev, "memory alloc failed");
> +		ret = -EINVAL;
> +		goto exit;
> +	}
> +
> +	ret = aw883xx_i2c_reads(aw883xx, packet->reg_addr, (char *)reg_data, data_len);
> +	if (ret < 0) {
> +		ret = -EFAULT;
> +		goto exit;
> +	}
> +
> +	aw_dev_info(aw883xx->dev, "reg_addr 0x%02x, reg_num %d",
> +			packet->reg_addr, packet->reg_num);
> +
> +	for (i = 0; i < data_len; i++) {
> +		len += snprintf(buf + len, PAGE_SIZE - len,
> +			"0x%02x,", reg_data[i]);
> +
> +	}
> +	ret = len;
> +
> +exit:
> +	if (reg_data) {
> +		devm_kfree(dev, reg_data);
> +		reg_data = NULL;
> +	}
> +	mutex_unlock(&aw883xx->i2c_lock);
> +	packet->i2c_status = AWRW_I2C_ST_NONE;
> +	return ret;
> +}
> +
> +static ssize_t aw883xx_fade_step_store(struct device *dev,
> +	struct device_attribute *attr, const char *buf, size_t count)
> +{
> +	struct aw883xx *aw883xx = dev_get_drvdata(dev);
> +	unsigned int databuf = 0;
> +	int ret = 0;
> +
> +	ret = kstrtoint(buf, 0, &databuf);
> +	if (ret == 0) {
> +		if (databuf > (aw883xx->aw_pa->volume_desc.mute_volume)) {
> +			aw_dev_info(aw883xx->dev, "step overflow %d Db", databuf);
> +			return count;
> +		}
> +		aw883xx_dev_set_fade_vol_step(aw883xx->aw_pa, databuf);
> +	}
> +
> +	aw_dev_info(aw883xx->dev, "set step %d DB Done", databuf);
> +
> +	return count;
> +}
> +
> +static ssize_t aw883xx_fade_step_show(struct device *dev,
> +	struct device_attribute *attr, char *buf)
> +{
> +	ssize_t len = 0;
> +	struct aw883xx *aw883xx = dev_get_drvdata(dev);
> +
> +	len += snprintf(buf+len, PAGE_SIZE-len,
> +		"step: %d\n", aw883xx_dev_get_fade_vol_step(aw883xx->aw_pa));
> +
> +	return len;
> +}
> +
> +static ssize_t aw883xx_dbg_prof_store(struct device *dev,
> +	struct device_attribute *attr, const char *buf, size_t count)
> +{
> +	struct aw883xx *aw883xx = dev_get_drvdata(dev);
> +	unsigned int databuf = 0;
> +	int ret = 0;
> +
> +	ret = kstrtoint(buf, 0, &databuf);
> +	if (ret == 0) {
> +		if (databuf)
> +			aw883xx->dbg_en_prof = true;
> +		else
> +			aw883xx->dbg_en_prof = false;
> +	}
> +
> +	aw_dev_info(aw883xx->dev, "en_prof %d  Done", databuf);
> +
> +	return count;
> +}
> +
> +static ssize_t aw883xx_dbg_prof_show(struct device *dev,
> +	struct device_attribute *attr, char *buf)
> +{
> +	struct aw883xx *aw883xx = dev_get_drvdata(dev);
> +	ssize_t len = 0;
> +
> +	len += snprintf(buf+len, PAGE_SIZE-len,
> +		" %d\n", aw883xx->dbg_en_prof);
> +
> +	return len;
> +}
> +
> +static ssize_t aw883xx_spk_temp_show(struct device *dev,
> +				struct device_attribute *attr, char *buf)
> +{
> +	struct aw883xx *aw883xx = dev_get_drvdata(dev);
> +	ssize_t len = 0;
> +	int ret;
> +	int32_t te;
> +
> +	ret = aw883xx_cali_svc_get_dev_te(&aw883xx->aw_pa->cali_desc, &te);
> +	if (ret < 0)
> +		return ret;
> +
> +	len += snprintf(buf + len, PAGE_SIZE - len,
> +			"Temp:%d\n", te);
> +
> +	return len;
> +}
> +
> +static ssize_t aw883xx_sync_flag_store(struct device *dev,
> +				struct device_attribute *attr,
> +				const char *buf, size_t count)
> +{
> +	struct aw883xx *aw883xx = dev_get_drvdata(dev);
> +	unsigned int flag = 0;
> +	int ret;
> +
> +	ret = kstrtouint(buf, 0, &flag);
> +	if (ret < 0)
> +		return ret;
> +
> +	flag = ((flag == false) ? false : true);
> +
> +	aw_dev_info(aw883xx->dev, "set phase sync flag : [%d]", flag);
> +
> +	aw883xx->phase_sync = flag;
> +
> +	return count;
> +}
> +
> +static ssize_t aw883xx_sync_flag_show(struct device *dev,
> +				struct device_attribute *attr, char *buf)
> +{
> +	struct aw883xx *aw883xx = dev_get_drvdata(dev);
> +	ssize_t len = 0;
> +
> +	len += snprintf(buf + len, PAGE_SIZE - len,
> +				"sync flag : %d\n", aw883xx->phase_sync);
> +
> +	return len;
> +}
> +
> +static ssize_t aw883xx_fade_enable_store(struct device *dev,
> +	struct device_attribute *attr, const char *buf, size_t count)
> +{
> +	struct aw883xx *aw883xx = dev_get_drvdata(dev);
> +	uint32_t fade_en = 0;
> +	int ret = 0;
> +
> +	ret = kstrtouint(buf, 0, &fade_en);
> +	if (ret == 0)
> +		aw883xx->aw_pa->fade_en = fade_en;
> +
> +	aw_dev_info(aw883xx->dev, "set fade_en %d", aw883xx->aw_pa->fade_en);
> +
> +	return count;
> +}
> +
> +static ssize_t aw883xx_fade_enable_show(struct device *dev,
> +	struct device_attribute *attr, char *buf)
> +{
> +	struct aw883xx *aw883xx = dev_get_drvdata(dev);
> +	ssize_t len = 0;
> +
> +	len += snprintf(buf+len, PAGE_SIZE-len,
> +		"fade_en: %d\n", aw883xx->aw_pa->fade_en);
> +
> +	return len;
> +}
> +
> +static ssize_t aw883xx_dsp_re_show(struct device *dev,
> +	struct device_attribute *attr, char *buf)
> +{
> +	struct aw883xx *aw883xx = dev_get_drvdata(dev);
> +	ssize_t len = 0;
> +	int ret;
> +	uint32_t read_re = 0;
> +
> +	ret = aw883xx_cali_read_cali_re_from_dsp(&aw883xx->aw_pa->cali_desc, &read_re);
> +	if (ret < 0) {
> +		aw_dev_err(aw883xx->dev, "%s:read dsp re fail\n", __func__);
> +		return ret;
> +	}
> +
> +	len += snprintf((char *)(buf + len),
> +		PAGE_SIZE - len,
> +		"dsp_re: %d\n", read_re);
> +
> +	return len;
> +}
> +
> +static ssize_t aw883xx_log_en_show(struct device *dev,
> +	struct device_attribute *attr, char *buf)
> +{
> +	struct aw883xx *aw883xx = dev_get_drvdata(dev);
> +	ssize_t len = 0;
> +
> +	len += snprintf(buf + len, PAGE_SIZE - len, "i2c_log_en: %d\n",
> +		aw883xx->i2c_log_en);
> +
> +	return len;
> +}
> +
> +static ssize_t aw883xx_log_en_store(struct device *dev,
> +	struct device_attribute *attr, const char *buf, size_t count)
> +{
> +	struct aw883xx *aw883xx = dev_get_drvdata(dev);
> +	uint32_t log_en = 0;
> +	int ret = 0;
> +
> +	ret = kstrtouint(buf, 0, &log_en);
> +	if (ret == 0)
> +		aw883xx->i2c_log_en = log_en;
> +
> +	aw_dev_info(aw883xx->dev, "set i2c_log_en: %d",
> +		aw883xx->i2c_log_en);
> +
> +	return count;
> +}
> +
> +static int aw883xx_dsp_log_info(struct aw883xx *aw883xx, unsigned int base_addr,
> +				uint32_t data_len, char *format)
> +{
> +	uint16_t reg_val = 0;
> +	char *dsp_reg_info = NULL;
> +	ssize_t dsp_info_len = 0;
> +	int i;
> +
> +	dsp_reg_info = devm_kzalloc(aw883xx->dev, AW_NAME_BUF_MAX, GFP_KERNEL);
> +	if (dsp_reg_info == NULL)
> +		return -ENOMEM;
> +
> +	mutex_lock(&aw883xx->i2c_lock);
> +	aw883xx_i2c_write(aw883xx, aw883xx->aw_pa->dsp_mem_desc.dsp_madd_reg, base_addr);
> +
> +	for (i = 0; i < data_len; i += 2) {
> +		aw883xx_i2c_read(aw883xx, aw883xx->aw_pa->dsp_mem_desc.dsp_mdat_reg, &reg_val);
> +		dsp_info_len += snprintf(dsp_reg_info + dsp_info_len,
> +			AW_NAME_BUF_MAX - dsp_info_len,
> +			"%02x,%02x,", (reg_val >> 0) & 0xff,
> +			(reg_val >> 8) & 0xff);
> +		if ((i / 2 + 1) % 8 == 0) {
> +			aw_dev_info(aw883xx->dev, "%s: %s", format, dsp_reg_info);
> +			dsp_info_len = 0;
> +			memset(dsp_reg_info, 0, AW_NAME_BUF_MAX);
> +		}
> +
> +		if (((data_len) % 8 != 0) &&
> +			(i == (data_len - 2))) {
> +			aw_dev_info(aw883xx->dev, "%s: %s", format, dsp_reg_info);
> +			dsp_info_len = 0;
> +			memset(dsp_reg_info, 0, AW_NAME_BUF_MAX);
> +		}
> +	}
> +
> +	dsp_info_len = 0;
> +	memset(dsp_reg_info, 0, AW_NAME_BUF_MAX);
> +	devm_kfree(aw883xx->dev, dsp_reg_info);
> +	dsp_reg_info = NULL;
> +	mutex_unlock(&aw883xx->i2c_lock);
> +
> +	return 0;
> +}
> +
> +static ssize_t aw883xx_dsp_show(struct device *dev,
> +	struct device_attribute *attr, char *buf)
> +{
> +	struct aw883xx *aw883xx = dev_get_drvdata(dev);
> +	ssize_t len = 0;
> +	int ret = -1;
> +	uint32_t data_len;
> +
> +	if (aw883xx->aw_pa->dsp_cfg == AW_DEV_DSP_BYPASS) {
> +		len += snprintf((char *)(buf + len), PAGE_SIZE - len,
> +				"%s: dsp bypass\n", __func__);
> +	} else {
> +		len += snprintf((char *)(buf + len), PAGE_SIZE - len,
> +				"%s: dsp working\n", __func__);
> +		ret = aw883xx_dev_get_iis_status(aw883xx->aw_pa);
> +		if (ret < 0) {
> +			len += snprintf((char *)(buf + len),
> +					PAGE_SIZE - len,
> +					"%s: no iis signal\n",
> +					__func__);
> +			aw_dev_err(aw883xx->dev, "no iis signal, dsp show failed");
> +			return len;
> +		}
> +
> +		len += snprintf(buf + len, PAGE_SIZE - len,
> +				"dsp firmware and config info is displayed in the kernel log\n");
> +
> +		aw_dev_info(aw883xx->dev, "dsp_firmware_len:%d", aw883xx->aw_pa->dsp_fw_len);
> +		ret = aw883xx_dsp_log_info(aw883xx, aw883xx->aw_pa->dsp_mem_desc.dsp_fw_base_addr,
> +			aw883xx->aw_pa->dsp_fw_len, "dsp_fw");
> +		if (ret < 0) {
> +			aw_dev_err(aw883xx->dev, "dsp_fw display failed");
> +			return len;
> +		}
> +
> +		aw_dev_info(aw883xx->dev, "dsp_config_len:%d", aw883xx->aw_pa->dsp_cfg_len);
> +		ret = aw883xx_dsp_log_info(aw883xx, aw883xx->aw_pa->dsp_mem_desc.dsp_cfg_base_addr,
> +			aw883xx->aw_pa->dsp_cfg_len, "dsp_config");
> +		if (ret < 0) {
> +			aw_dev_err(aw883xx->dev, "dsp_config display failed");
> +			return len;
> +		}
> +
> +		aw_dev_info(aw883xx->dev, "dsp_config:0x8180-0x83fc");
> +		data_len = 2 * (aw883xx->aw_pa->dsp_st_desc.dsp_reg_e1 -
> +			aw883xx->aw_pa->dsp_st_desc.dsp_reg_s1);
> +		ret = aw883xx_dsp_log_info(aw883xx, aw883xx->aw_pa->dsp_st_desc.dsp_reg_s1,
> +			data_len, "dsp_st");
> +		if (ret < 0) {
> +			aw_dev_err(aw883xx->dev, "dsp_config:0x8180-0x83fc failed");
> +			return len;
> +		}
> +
> +		aw_dev_info(aw883xx->dev, "dsp_config:0x9c00-0x9c5c");
> +		data_len = 2 * (aw883xx->aw_pa->dsp_st_desc.dsp_reg_e2 -
> +			aw883xx->aw_pa->dsp_st_desc.dsp_reg_s2);
> +		ret = aw883xx_dsp_log_info(aw883xx, aw883xx->aw_pa->dsp_st_desc.dsp_reg_s2,
> +			data_len, "dsp_st");
> +		if (ret < 0) {
> +			aw_dev_err(aw883xx->dev, "dsp_config:0x9c00-0x9c5c display failed");
> +			return len;
> +		}
> +	}
> +
> +	return len;
> +}
> +
> +static DEVICE_ATTR(reg, 0644,
> +		aw883xx_reg_show, aw883xx_reg_store);
> +static DEVICE_ATTR(rw, 0644,
> +		aw883xx_rw_show, aw883xx_rw_store);
> +static DEVICE_ATTR(drv_ver, 0444,
> +		aw883xx_drv_ver_show, NULL);
> +static DEVICE_ATTR(dsp_rw, 0644,
> +		aw883xx_dsp_rw_show, aw883xx_dsp_rw_store);
> +static DEVICE_ATTR(awrw, 0644,
> +		aw883xx_awrw_show, aw883xx_awrw_store);
> +static DEVICE_ATTR(fade_step, 0644,
> +		aw883xx_fade_step_show, aw883xx_fade_step_store);
> +static DEVICE_ATTR(dbg_prof, 0644,
> +		aw883xx_dbg_prof_show, aw883xx_dbg_prof_store);
> +static DEVICE_ATTR(spk_temp, 0444,
> +		aw883xx_spk_temp_show, NULL);
> +static DEVICE_ATTR(phase_sync, 0644,
> +		aw883xx_sync_flag_show, aw883xx_sync_flag_store);
> +static DEVICE_ATTR(fade_en, 0644,
> +		aw883xx_fade_enable_show, aw883xx_fade_enable_store);
> +static DEVICE_ATTR(dsp_re, 0444,
> +		aw883xx_dsp_re_show, NULL);
> +static DEVICE_ATTR(i2c_log_en, 0644,
> +		aw883xx_log_en_show, aw883xx_log_en_store);
> +static DEVICE_ATTR(dsp, 0444,
> +		aw883xx_dsp_show, NULL);
> +
> +
> +static struct attribute *aw883xx_attributes[] = {
> +	&dev_attr_reg.attr,
> +	&dev_attr_rw.attr,
> +	&dev_attr_drv_ver.attr,
> +	&dev_attr_dsp_rw.attr,
> +	&dev_attr_awrw.attr,
> +	&dev_attr_fade_step.attr,
> +	&dev_attr_dbg_prof.attr,
> +	&dev_attr_spk_temp.attr,
> +	&dev_attr_phase_sync.attr,
> +	&dev_attr_fade_en.attr,
> +	&dev_attr_dsp_re.attr,
> +	&dev_attr_i2c_log_en.attr,
> +	&dev_attr_dsp.attr,
> +	NULL
> +};
> +
> +static struct attribute_group aw883xx_attribute_group = {
> +	.attrs = aw883xx_attributes
> +};

All this use of sysfs seems questionable. You have all kinds of mixers
already, what applications would use this?

> +
> +
> +
> +/*
> + * i2c driver
> + */
> +static int aw883xx_i2c_probe(struct i2c_client *i2c,
> +				const struct i2c_device_id *id)
> +{
> +	struct aw883xx *aw883xx = NULL;
> +	int ret = -1;
> +
> +	aw_dev_info(&i2c->dev, "enter");
> +
> +	if (!i2c_check_functionality(i2c->adapter, I2C_FUNC_I2C)) {
> +		aw_dev_err(&i2c->dev, "check_functionality failed");
> +		return -EIO;
> +	}
> +
> +	aw883xx = aw883xx_malloc_init(i2c);
> +	if (aw883xx == NULL) {
> +		aw_dev_err(&i2c->dev, "malloc aw883xx failed");
> +		return -ENOMEM;
> +	}
> +	i2c_set_clientdata(i2c, aw883xx);
> +
> +	ret = aw883xx_parse_dt(aw883xx);
> +	if (ret < 0) {
> +		aw_dev_err(&i2c->dev, "parse dts failed");
> +		return ret;
> +	}
> +
> +	/*get gpio resource*/
> +	ret = aw883xx_gpio_request(aw883xx);
> +	if (ret)
> +		return ret;
> +
> +	/* hardware reset */
> +	aw883xx_hw_reset(aw883xx);
> +
> +	/* aw883xx chip id */
> +	ret = aw883xx_read_chipid(aw883xx);
> +	if (ret < 0) {
> +		aw_dev_err(&i2c->dev, "aw883xx_read_chipid failed ret=%d", ret);
> +		return ret;
> +	}
> +
> +	/*aw pa init*/
> +	ret = aw883xx_init(aw883xx);
> +	if (ret < 0)
> +		return ret;
> +
> +	ret = aw883xx_platform_init(aw883xx);
> +	if (ret < 0) {
> +		aw_dev_err(&i2c->dev, "get platform failed");
> +		return ret;
> +	}
> +
> +	ret = aw883xx_interrupt_init(aw883xx);
> +	if (ret < 0)
> +		return ret;
> +
> +	ret = aw883xx_componet_codec_register(aw883xx);

component...

> +	if (ret) {
> +		aw_dev_err(&i2c->dev, "codec register failed");
> +		return ret;
> +	}
> +
> +	ret = sysfs_create_group(&i2c->dev.kobj, &aw883xx_attribute_group);
> +	if (ret < 0) {
> +		aw_dev_info(&i2c->dev, "error creating sysfs attr files");
> +		goto err_sysfs;
> +	}
> +
> +	dev_set_drvdata(&i2c->dev, aw883xx);
> +
> +	/*add device to total list*/
> +	mutex_lock(&g_aw883xx_lock);
> +	g_aw883xx_dev_cnt++;
> +	mutex_unlock(&g_aw883xx_lock);

why do you need to keep track of instances?

> +
> +	aw_dev_info(&i2c->dev, "dev_cnt %d probe completed successfully",
> +		g_aw883xx_dev_cnt);
> +
> +	return 0;
> +
> +
> +err_sysfs:
> +	aw_componet_codec_ops.unregister_codec(&i2c->dev);
> +	return ret;
> +}
> +
> +static int aw883xx_i2c_remove(struct i2c_client *i2c)
> +{
> +	struct aw883xx *aw883xx = i2c_get_clientdata(i2c);
> +
> +	aw_dev_info(aw883xx->dev, "enter");
> +
> +	if (gpio_to_irq(aw883xx->irq_gpio))
> +		devm_free_irq(&i2c->dev,
> +			gpio_to_irq(aw883xx->irq_gpio),
> +			aw883xx);
> +
> +	sysfs_remove_group(&aw883xx->dev->kobj,
> +			&aw883xx_attribute_group);
> +
> +	/*free device resource */
> +	aw883xx_device_remove(aw883xx->aw_pa);
> +
> +	aw_componet_codec_ops.unregister_codec(&i2c->dev);
> +
> +	mutex_lock(&g_aw883xx_lock);
> +	g_aw883xx_dev_cnt--;
> +	if (g_aw883xx_dev_cnt == 0) {
> +		vfree(g_awinic_cfg);
> +		g_awinic_cfg = NULL;
> +	}
> +	mutex_unlock(&g_aw883xx_lock);
> +
> +	return 0;
> +}
> +
> +static const struct i2c_device_id aw883xx_i2c_id[] = {
> +	{AW883XX_I2C_NAME, 0},
> +	{}
> +};
> +
> +MODULE_DEVICE_TABLE(i2c, aw883xx_i2c_id);
> +
> +static const struct of_device_id aw883xx_dt_match[] = {
> +	{.compatible = "awinic,aw883xx_smartpa"},
> +	{},
> +};
> +
> +static struct i2c_driver aw883xx_i2c_driver = {
> +	.driver = {
> +		.name = AW883XX_I2C_NAME,
> +		.owner = THIS_MODULE,
> +		.of_match_table = of_match_ptr(aw883xx_dt_match),
> +	},
> +	.probe = aw883xx_i2c_probe,
> +	.remove = aw883xx_i2c_remove,
> +	.id_table = aw883xx_i2c_id,
> +};
> +
> +static int __init aw883xx_i2c_init(void)
> +{
> +	int ret = -1;
> +
> +	aw_pr_info("aw883xx driver version %s", AW883XX_DRIVER_VERSION);
> +
> +	ret = i2c_add_driver(&aw883xx_i2c_driver);
> +	if (ret)
> +		aw_pr_err("fail to add aw883xx device into i2c");
> +
> +	return ret;
> +}
> +module_init(aw883xx_i2c_init);
> +
> +static void __exit aw883xx_i2c_exit(void)
> +{
> +	i2c_del_driver(&aw883xx_i2c_driver);
> +}
> +module_exit(aw883xx_i2c_exit);

use module_i2c_driver?

> +
> +MODULE_DESCRIPTION("ASoC AW883XX Smart PA Driver");
> +MODULE_LICENSE("GPL v2");

"GPL" is enough

> +
> diff --git a/sound/soc/codecs/aw883xx/aw883xx.h b/sound/soc/codecs/aw883xx/aw883xx.h
> new file mode 100644
> index 0000000..076f7cd
> --- /dev/null
> +++ b/sound/soc/codecs/aw883xx/aw883xx.h
> @@ -0,0 +1,213 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * aw883xx.c --  ALSA Soc AW883XX codec support
> + *
> + * Copyright (c) 2020 AWINIC Technology CO., LTD

2022?

> + *
> + * Author: Bruce zhao <zhaolei@awinic.com>
> + */
> +
> +#ifndef __AW883XX_H__
> +#define __AW883XX_H__
> +
> +#include <linux/version.h>
> +#include <sound/control.h>
> +#include <sound/soc.h>
> +#include "aw883xx_device.h"
> +
> +/*#define AW_QCOM_PLATFORM*/
> +#define AW_MTK_PLATFORM
> +/*#define AW_SPRD_PLATFORM*/
> +
> +/*#define AW_SYNC_LOAD*/
> +
> +#define AW883XX_CHIP_ID_REG	(0x00)
> +
> +#if KERNEL_VERSION(4, 19, 1) <= LINUX_VERSION_CODE
> +#define AW_KERNEL_VER_OVER_4_19_1
> +#endif
> +
> +#if KERNEL_VERSION(5, 4, 0) <= LINUX_VERSION_CODE
> +#define AW_KERNEL_VER_OVER_5_4_0
> +MODULE_IMPORT_NS(VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver);
> +#endif

seriously?

> +
> +/*
> + * i2c transaction on Linux limited to 64k
> + * (See Linux kernel documentation: Documentation/i2c/writing-clients)
> + */
> +#define MAX_I2C_BUFFER_SIZE		(65536)
> +#define AW883XX_READ_MSG_NUM		(2)
> +
> +#define AW_I2C_RETRIES			(5)
> +#define AW_I2C_RETRY_DELAY		(5)/* 5ms */
> +
> +#define AW_READ_CHIPID_RETRY_DELAY	(5)/* 5ms */
> +#define AW_START_RETRIES		(5)
> +
> +#define AW883XX_FLAG_START_ON_MUTE	(1 << 0)
> +#define AW883XX_FLAG_SKIP_INTERRUPTS	(1 << 1)
> +
> +#define AW883XX_I2S_CHECK_MAX		(5)
> +
> +#define AW883XX_SYSST_CHECK_MAX		(10)
> +
> +#define AW883XX_BIN_TYPE_NUM		(3)
> +#define AW883XX_LOAD_FW_DELAY_TIME	(3000)
> +#define AW883XX_START_WORK_DELAY_MS	(0)
> +
> +
> +#define AW883XX_DSP_16_DATA_MASK	(0x0000ffff)
> +
> +#define AW_GET_IV_CNT_MAX		(6)
> +#define AW_KCONTROL_NUM			(4)
> +#define AW_HW_MONITOR_DELAY		(1000)
> +
> +enum {
> +	AWRW_I2C_ST_NONE = 0,
> +	AWRW_I2C_ST_READ,
> +	AWRW_I2C_ST_WRITE,
> +};
> +
> +enum {
> +	AWRW_DSP_ST_NONE = 0,
> +	AWRW_DSP_READY,
> +};
> +
> +enum {
> +	AW_SYNC_START = 0,
> +	AW_ASYNC_START,
> +};
> +
> +
> +#define AWRW_ADDR_BYTES (1)
> +#define AWRW_DATA_BYTES (2)
> +#define AWRW_HDR_LEN (24)
> +
> +enum {
> +	AWRW_FLAG_WRITE = 0,
> +	AWRW_FLAG_READ,
> +};
> +
> +enum {
> +	AWRW_HDR_WR_FLAG = 0,
> +	AWRW_HDR_ADDR_BYTES,
> +	AWRW_HDR_DATA_BYTES,
> +	AWRW_HDR_REG_NUM,
> +	AWRW_HDR_REG_ADDR,
> +	AWRW_HDR_MAX,
> +};
> +
> +struct aw883xx_i2c_packet {
> +	unsigned char i2c_status;
> +	unsigned char dsp_status;
> +	unsigned int reg_num;
> +	unsigned int reg_addr;
> +	unsigned int dsp_addr;
> +	char *reg_data;
> +};
> +
> +
> +
> +enum {
> +	AW883XX_STREAM_CLOSE = 0,
> +	AW883XX_STREAM_OPEN,
> +};
> +
> +enum aw883xx_init {
> +	AW883XX_INIT_ST = 0,
> +	AW883XX_INIT_OK = 1,
> +	AW883XX_INIT_NG = 2,
> +};
> +
> +enum aw_re_range {
> +	AW_RE_MIN = 1000,
> +	AW_RE_MAX = 40000,
> +};
> +
> +enum {
> +	AW_RENAME_DISABLE = 0,
> +	AW_RENAME_ENABLE,
> +};
> +
> +/*
> + * Compatible with codec and component
> + */
> +#ifdef AW_KERNEL_VER_OVER_4_19_1
> +typedef struct snd_soc_component aw_snd_soc_codec_t;
> +typedef struct snd_soc_component_driver aw_snd_soc_codec_driver_t;
> +#else
> +typedef struct snd_soc_codec aw_snd_soc_codec_t;
> +typedef struct snd_soc_codec_driver aw_snd_soc_codec_driver_t;
> +#endif
> +
> +struct aw_componet_codec_ops {
> +	aw_snd_soc_codec_t *(*kcontrol_codec)(struct snd_kcontrol *kcontrol);
> +	void *(*codec_get_drvdata)(aw_snd_soc_codec_t *codec);
> +	int (*add_codec_controls)(aw_snd_soc_codec_t *codec,
> +		const struct snd_kcontrol_new *controls, unsigned int num_controls);
> +	void (*unregister_codec)(struct device *dev);
> +	int (*register_codec)(struct device *dev,
> +			const aw_snd_soc_codec_driver_t *codec_drv,
> +			struct snd_soc_dai_driver *dai_drv,
> +			int num_dai);
> +};
> +
> +struct aw883xx {
> +	struct i2c_client *i2c;
> +	struct device *dev;
> +	struct mutex lock;
> +	struct mutex i2c_lock;
> +	aw_snd_soc_codec_t *codec;
> +	struct aw_componet_codec_ops *codec_ops;
> +	struct aw_device *aw_pa;
> +
> +	int sysclk;
> +	int reset_gpio;
> +	int irq_gpio;
> +
> +	unsigned char phase_sync;	/*phase sync*/
> +	uint32_t allow_pw;
> +	uint32_t rename_flag;
> +	uint8_t pstream;
> +	unsigned char fw_retry_cnt;
> +
> +	uint8_t dbg_en_prof;
> +	uint8_t i2c_log_en;
> +	uint8_t spin_flag;
> +
> +	struct list_head list;
> +
> +	struct workqueue_struct *work_queue;
> +	struct delayed_work start_work;
> +	struct delayed_work monitor_work;
> +	struct delayed_work interrupt_work;
> +	struct delayed_work acf_work;
> +
> +	uint8_t reg_addr;
> +	uint16_t dsp_addr;
> +	uint16_t chip_id;
> +	struct aw883xx_i2c_packet i2c_packet;
> +};
> +
> +int aw883xx_init(struct aw883xx *aw883xx);
> +int aw883xx_i2c_writes(struct aw883xx *aw883xx,
> +		uint8_t reg_addr, uint8_t *buf, uint16_t len);
> +int aw883xx_i2c_write(struct aw883xx *aw883xx,
> +		uint8_t reg_addr, uint16_t reg_data);
> +int aw883xx_reg_write(struct aw883xx *aw883xx,
> +		uint8_t reg_addr, uint16_t reg_data);
> +int aw883xx_i2c_read(struct aw883xx *aw883xx,
> +			uint8_t reg_addr, uint16_t *reg_data);
> +int aw883xx_reg_read(struct aw883xx *aw883xx,
> +		uint8_t reg_addr, uint16_t *reg_data);
> +int aw883xx_reg_write_bits(struct aw883xx *aw883xx,
> +		uint8_t reg_addr, uint16_t mask, uint16_t reg_data);
> +int aw883xx_dsp_write(struct aw883xx *aw883xx,
> +		uint16_t dsp_addr, uint32_t dsp_data, uint8_t data_type);
> +int aw883xx_dsp_read(struct aw883xx *aw883xx,
> +		uint16_t dsp_addr, uint32_t *dsp_data, uint8_t data_type);
> +int aw883xx_get_dev_num(void);
> +int aw883xx_get_version(char *buf, int size);
> +
> +#endif
> diff --git a/sound/soc/codecs/aw883xx/aw883xx_bin_parse.c b/sound/soc/codecs/aw883xx/aw883xx_bin_parse.c
> new file mode 100644
> index 0000000..2338b73
> --- /dev/null
> +++ b/sound/soc/codecs/aw883xx/aw883xx_bin_parse.c
> @@ -0,0 +1,1392 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * aw_bin_parse.c  -- ALSA Soc AW883XX codec support
> + *
> + * Copyright (c) 2020 AWINIC Technology CO., LTD
> + */
> +
> +#include <linux/module.h>
> +#include <linux/kernel.h>
> +#include <linux/i2c.h>
> +#include <linux/of_gpio.h>
> +#include <linux/delay.h>
> +#include <linux/device.h>
> +#include <linux/firmware.h>
> +#include <linux/slab.h>
> +#include <linux/version.h>
> +#include <linux/input.h>
> +#include <linux/interrupt.h>
> +#include <linux/debugfs.h>
> +#include <linux/miscdevice.h>
> +#include <linux/uaccess.h>
> +#include <linux/regmap.h>
> +#include <linux/timer.h>
> +#include <linux/workqueue.h>
> +#include <linux/hrtimer.h>
> +#include <linux/mutex.h>
> +#include <linux/cdev.h>
> +#include <linux/list.h>
> +#include <linux/string.h>
> +#include "aw883xx_bin_parse.h"
> +#include "aw883xx_log.h"
> +
> +/* "code version"-"excel version" */
> +#define AWINIC_CODE_VERSION "V0.0.8-V1.0.4"
> +
> +#define DEBUG_LOG_LEVEL
> +#ifdef DEBUG_LOG_LEVEL
> +#define DBG(fmt, arg...) \
> +		pr_debug("AWINIC_BIN %s,line= %d,"fmt, __func__, __LINE__, ##arg)
> +#define DBG_ERR(fmt, arg...) \
> +		pr_err("AWINIC_BIN_ERR %s,line= %d,"fmt, __func__, __LINE__, ##arg)
> +#else
> +#define DBG(fmt, arg...) do {} while (0)
> +#define DBG_ERR(fmt, arg...) do {} while (0)
> +#endif
> +
> +#define printing_data_code
> +
> +#define BigLittleSwap16(A)	((((uint16_t)(A) & 0xff00) >> 8) | \
> +				 (((uint16_t)(A) & 0x00ff) << 8))
> +
> +#define BigLittleSwap32(A)	((((uint32_t)(A) & 0xff000000) >> 24) | \
> +				(((uint32_t)(A) & 0x00ff0000) >> 8) | \
> +				(((uint32_t)(A) & 0x0000ff00) << 8) | \
> +				(((uint32_t)(A) & 0x000000ff) << 24))
> +
> +static char *profile_name[AW_PROFILE_MAX] = {
> +	"Music", "Voice", "Voip", "Ringtone",
> +	"Ringtone_hs", "Lowpower", "Bypass",
> +	"Mmi", "Fm", "Notification", "Receiver"
> +};
> +
> +static int aw_parse_bin_header_1_0_0(struct aw_bin *bin);
> +
> +/**
> + *
> + * Interface function
> + *
> + * return value:
> + *       value = 0 :success;
> + *       value = -1 :check bin header version
> + *       value = -2 :check bin data type
> + *       value = -3 :check sum or check bin data len error
> + *       value = -4 :check data version
> + *       value = -5 :check register num
> + *       value = -6 :check dsp reg num
> + *       value = -7 :check soc app num
> + *       value = -8 :bin is NULL point
> + *
> + */
> +
> +/*
> + * check sum data
> + */
> +static int aw_check_sum(struct aw_bin *bin, int bin_num)
> +{
> +	unsigned int i = 0;
> +	unsigned int sum_data = 0;
> +	unsigned int check_sum = 0;
> +	char *p_check_sum = NULL;
> +
> +	DBG("enter\n");
> +	p_check_sum = &(bin->info.data[(bin->header_info[bin_num].valid_data_addr -
> +						bin->header_info[bin_num].header_len)]);
> +	DBG("aw_bin_parse p_check_sum = %p\n", p_check_sum);
> +	check_sum = GET_32_DATA(*(p_check_sum + 3), *(p_check_sum + 2),
> +				*(p_check_sum + 1), *(p_check_sum));
> +
> +	for (i = 4; i < bin->header_info[bin_num].bin_data_len +
> +					bin->header_info[bin_num].header_len; i++) {
> +		sum_data += *(p_check_sum + i);
> +	}
> +	DBG("aw_bin_parse bin_num = %d, check_sum = 0x%x, sum_data = 0x%x\n",
> +						bin_num, check_sum, sum_data);
> +	if (sum_data != check_sum) {
> +		p_check_sum = NULL;
> +		DBG_ERR("aw_bin_parse check sum or check bin data len error\n");
> +		DBG_ERR("aw_bin_parse bin_num = %d\n", bin_num);
> +		DBG_ERR("aw_bin_parse check_sum = 0x%x\n", check_sum);
> +		DBG_ERR("aw_bin_parse sum_data = 0x%x\n", sum_data);
> +		return -BIN_DATA_LEN_ERR;
> +	}
> +	p_check_sum = NULL;
> +
> +	return 0;
> +}
> +
> +static int aw_check_data_version(struct aw_bin *bin, int bin_num)
> +{
> +	int i = 0;
> +
> +	DBG("enter\n");
> +	for (i = DATA_VERSION_V1; i < DATA_VERSION_MAX; i++) {
> +		if (bin->header_info[bin_num].bin_data_ver == i)
> +			return 0;
> +	}
> +	DBG_ERR("aw_bin_parse Unrecognized this bin data version\n");
> +	return -DATA_VER_ERR;
> +}
> +
> +static int aw_check_register_num_v1(struct aw_bin *bin, int bin_num)
> +{
> +	unsigned int check_register_num = 0;
> +	unsigned int parse_register_num = 0;
> +	char *p_check_sum = NULL;
> +	struct bin_header_info temp_info;
> +
> +	DBG("enter\n");
> +	temp_info = bin->header_info[bin_num];
> +	p_check_sum = &(bin->info.data[(temp_info.valid_data_addr)]);
> +	DBG("aw_bin_parse p_check_sum = %p\n", p_check_sum);
> +	parse_register_num = GET_32_DATA(*(p_check_sum + 3), *(p_check_sum + 2),
> +					*(p_check_sum + 1), *(p_check_sum));
> +	check_register_num = (bin->header_info[bin_num].bin_data_len - 4) /
> +				(bin->header_info[bin_num].reg_byte_len +
> +				bin->header_info[bin_num].data_byte_len);
> +	DBG("aw_bin_parse bin_num = %d\n", bin_num);
> +	DBG("aw_bin_parse parse_register_num = 0x%x\n", parse_register_num);
> +	DBG("aw_bin_parse check_register_num = 0x%x\n", check_register_num);
> +	if (parse_register_num != check_register_num) {
> +		p_check_sum = NULL;
> +		DBG_ERR("aw_bin_parse check register num error\n");
> +		DBG_ERR("aw_bin_parse bin_num = %d\n", bin_num);
> +		DBG_ERR("aw_bin_parse parse_register_num = 0x%x\n",
> +							parse_register_num);
> +		DBG_ERR("aw_bin_parse check_register_num = 0x%x\n",
> +							check_register_num);
> +		return -REG_NUM_ERR;
> +	}
> +	bin->header_info[bin_num].reg_num = parse_register_num;
> +	bin->header_info[bin_num].valid_data_len = temp_info.bin_data_len - 4;
> +	p_check_sum = NULL;
> +	bin->header_info[bin_num].valid_data_addr = temp_info.valid_data_addr + 4;
> +	return 0;
> +}
> +
> +static int aw_check_dsp_reg_num_v1(struct aw_bin *bin, int bin_num)
> +{
> +	unsigned int check_dsp_reg_num = 0;
> +	unsigned int parse_dsp_reg_num = 0;
> +	char *p_check_sum = NULL;
> +	struct bin_header_info temp_info;
> +
> +	DBG("enter\n");
> +	temp_info = bin->header_info[bin_num];
> +	p_check_sum = &(bin->info.data[(temp_info.valid_data_addr)]);
> +	DBG("aw_bin_parse p_check_sum = %p\n", p_check_sum);
> +	parse_dsp_reg_num = GET_32_DATA(*(p_check_sum + 7), *(p_check_sum + 6),
> +					*(p_check_sum + 5), *(p_check_sum + 4));
> +	bin->header_info[bin_num].reg_data_byte_len =
> +			GET_32_DATA(*(p_check_sum + 11), *(p_check_sum + 10),
> +					*(p_check_sum + 9), *(p_check_sum + 8));
> +	check_dsp_reg_num = (bin->header_info[bin_num].bin_data_len - 12) /
> +				bin->header_info[bin_num].reg_data_byte_len;
> +	DBG("aw_bin_parse bin_num = %d\n", bin_num);
> +	DBG("aw_bin_parse parse_dsp_reg_num = 0x%x\n", parse_dsp_reg_num);
> +	DBG("aw_bin_parse check_dsp_reg_num = 0x%x\n", check_dsp_reg_num);
> +	if (parse_dsp_reg_num != check_dsp_reg_num) {
> +		p_check_sum = NULL;
> +		DBG_ERR("aw_bin_parse check dsp reg num error\n");
> +		DBG_ERR("aw_bin_parse bin_num = %d\n", bin_num);
> +		DBG_ERR("aw_bin_parse parse_dsp_reg_num = 0x%x\n",
> +							parse_dsp_reg_num);
> +		DBG_ERR("aw_bin_parse check_dsp_reg_num = 0x%x\n",
> +							check_dsp_reg_num);
> +		return -DSP_REG_NUM_ERR;
> +	}
> +	bin->header_info[bin_num].download_addr =
> +			GET_32_DATA(*(p_check_sum + 3), *(p_check_sum + 2),
> +					*(p_check_sum + 1), *(p_check_sum));
> +	bin->header_info[bin_num].reg_num = parse_dsp_reg_num;
> +	bin->header_info[bin_num].valid_data_len = temp_info.bin_data_len - 12;
> +	p_check_sum = NULL;
> +	bin->header_info[bin_num].valid_data_addr = temp_info.valid_data_addr + 12;
> +	return 0;
> +}
> +
> +static int aw_check_soc_app_num_v1(struct aw_bin *bin, int bin_num)
> +{
> +	unsigned int check_soc_app_num = 0;
> +	unsigned int parse_soc_app_num = 0;
> +	char *p_check_sum = NULL;
> +	struct bin_header_info temp_info;
> +
> +	DBG("enter\n");
> +	temp_info = bin->header_info[bin_num];
> +	p_check_sum = &(bin->info.data[(temp_info.valid_data_addr)]);
> +	DBG("aw_bin_parse p_check_sum = %p\n", p_check_sum);
> +	bin->header_info[bin_num].app_version = GET_32_DATA(*(p_check_sum + 3),
> +			*(p_check_sum + 2), *(p_check_sum + 1), *(p_check_sum));
> +	parse_soc_app_num = GET_32_DATA(*(p_check_sum + 11),
> +		*(p_check_sum + 10), *(p_check_sum + 9), *(p_check_sum + 8));
> +	check_soc_app_num = bin->header_info[bin_num].bin_data_len - 12;
> +	DBG("aw_bin_parse bin_num = %d\n", bin_num);
> +	DBG("aw_bin_parse parse_soc_app_num = 0x%x\n", parse_soc_app_num);
> +	DBG("aw_bin_parse check_soc_app_num = 0x%x\n", check_soc_app_num);
> +	if (parse_soc_app_num != check_soc_app_num) {
> +		p_check_sum = NULL;
> +		DBG_ERR("aw_bin_parse check soc app num error\n");
> +		DBG_ERR("aw_bin_parse bin_num = %d\n", bin_num);
> +		DBG_ERR("aw_bin_parse parse_soc_app_num = 0x%x\n",
> +							parse_soc_app_num);
> +		DBG_ERR("aw_bin_parse check_soc_app_num = 0x%x\n",
> +							check_soc_app_num);
> +		return -SOC_APP_NUM_ERR;
> +	}
> +	bin->header_info[bin_num].reg_num = parse_soc_app_num;
> +	bin->header_info[bin_num].download_addr =
> +			GET_32_DATA(*(p_check_sum + 7), *(p_check_sum + 6),
> +					*(p_check_sum + 5), *(p_check_sum + 4));
> +	bin->header_info[bin_num].valid_data_len = temp_info.bin_data_len - 12;
> +	p_check_sum = NULL;
> +	bin->header_info[bin_num].valid_data_addr = temp_info.valid_data_addr + 12;
> +	return 0;
> +}
> +/*
> + * bin header 1_0_0
> + */
> +static void aw_get_single_bin_header_1_0_0(struct aw_bin *bin)
> +{
> +	int i;
> +
> +	bin->header_info[bin->all_bin_parse_num].header_len = 60;
> +	bin->header_info[bin->all_bin_parse_num].check_sum =
> +		GET_32_DATA(*(bin->p_addr + 3), *(bin->p_addr + 2),
> +				*(bin->p_addr + 1), *(bin->p_addr));
> +	bin->header_info[bin->all_bin_parse_num].header_ver =
> +		GET_32_DATA(*(bin->p_addr + 7), *(bin->p_addr + 6),
> +				*(bin->p_addr + 5), *(bin->p_addr + 4));
> +	bin->header_info[bin->all_bin_parse_num].bin_data_type =
> +		GET_32_DATA(*(bin->p_addr + 11), *(bin->p_addr + 10),
> +				*(bin->p_addr + 9), *(bin->p_addr + 8));
> +	bin->header_info[bin->all_bin_parse_num].bin_data_ver =
> +		GET_32_DATA(*(bin->p_addr + 15), *(bin->p_addr + 14),
> +				*(bin->p_addr + 13), *(bin->p_addr + 12));
> +	bin->header_info[bin->all_bin_parse_num].bin_data_len =
> +		GET_32_DATA(*(bin->p_addr + 19), *(bin->p_addr + 18),
> +				*(bin->p_addr + 17), *(bin->p_addr + 16));
> +	bin->header_info[bin->all_bin_parse_num].ui_ver =
> +		GET_32_DATA(*(bin->p_addr + 23), *(bin->p_addr + 22),
> +				*(bin->p_addr + 21), *(bin->p_addr + 20));
> +	bin->header_info[bin->all_bin_parse_num].reg_byte_len =
> +		GET_32_DATA(*(bin->p_addr + 35), *(bin->p_addr + 34),
> +				*(bin->p_addr + 33), *(bin->p_addr + 32));
> +	bin->header_info[bin->all_bin_parse_num].data_byte_len =
> +		GET_32_DATA(*(bin->p_addr + 39), *(bin->p_addr + 38),
> +				*(bin->p_addr + 37), *(bin->p_addr + 36));
> +	bin->header_info[bin->all_bin_parse_num].device_addr =
> +		GET_32_DATA(*(bin->p_addr + 43), *(bin->p_addr + 42),
> +			*(bin->p_addr + 41), *(bin->p_addr + 40));
> +	for (i = 0; i < 8; i++) {
> +		bin->header_info[bin->all_bin_parse_num].chip_type[i] =
> +						*(bin->p_addr + 24 + i);
> +	}
> +	bin->header_info[bin->all_bin_parse_num].reg_num = 0x00000000;
> +	bin->header_info[bin->all_bin_parse_num].reg_data_byte_len = 0x00000000;
> +	bin->header_info[bin->all_bin_parse_num].download_addr = 0x00000000;
> +	bin->header_info[bin->all_bin_parse_num].app_version = 0x00000000;
> +	bin->header_info[bin->all_bin_parse_num].valid_data_len = 0x00000000;
> +	bin->all_bin_parse_num += 1;
> +}
> +
> +static int aw_parse_each_of_multi_bins_1_0_0(unsigned int bin_num, int bin_serial_num,
> +				      struct aw_bin *bin)
> +{
> +	int ret = 0;
> +	unsigned int bin_start_addr = 0;
> +	unsigned int valid_data_len = 0;
> +	struct bin_header_info aw_bin_header_info;
> +
> +	DBG("aw_bin_parse enter multi bin branch -- %s\n", __func__);
> +	aw_bin_header_info = bin->header_info[bin->all_bin_parse_num - 1];
> +	if (!bin_serial_num) {
> +		bin_start_addr = GET_32_DATA(*(bin->p_addr + 67), *(bin->p_addr
> +			+ 66), *(bin->p_addr + 65), *(bin->p_addr + 64));
> +		bin->p_addr += (60 + bin_start_addr);
> +		bin->header_info[bin->all_bin_parse_num].valid_data_addr =
> +			aw_bin_header_info.valid_data_addr + 4 + 8 * bin_num + 60;
> +	} else {
> +		valid_data_len = aw_bin_header_info.bin_data_len;
> +		bin->p_addr += (60 + valid_data_len);
> +		bin->header_info[bin->all_bin_parse_num].valid_data_addr =
> +		    aw_bin_header_info.valid_data_addr
> +		    + aw_bin_header_info.bin_data_len
> +		    + 60;
> +	}
> +
> +	ret = aw_parse_bin_header_1_0_0(bin);
> +	return ret;
> +}
> +
> +/* Get the number of bins in multi bins, and set a for loop,
> + * loop processing each bin data
> + */
> +static int aw_get_multi_bin_header_1_0_0(struct aw_bin *bin)
> +{
> +	int i = 0;
> +	int ret = 0;
> +	unsigned int bin_num = 0;
> +
> +	DBG("aw_bin_parse enter multi bin branch -- %s\n", __func__);
> +	bin_num = GET_32_DATA(*(bin->p_addr + 63), *(bin->p_addr + 62),
> +				*(bin->p_addr + 61), *(bin->p_addr + 60));
> +	if (bin->multi_bin_parse_num == 1)
> +		bin->header_info[bin->all_bin_parse_num].valid_data_addr = 60;
> +	aw_get_single_bin_header_1_0_0(bin);
> +
> +	for (i = 0; i < bin_num; i++) {
> +		DBG("aw_bin_parse enter multi bin for is %d\n", i);
> +		ret = aw_parse_each_of_multi_bins_1_0_0(bin_num, i, bin);
> +		if (ret < 0)
> +			return ret;
> +	}
> +	return 0;
> +}
> +
> +/*
> + * If the bin framework header version is 1.0.0,
> + * determine the data type of bin, and then perform different processing
> + * according to the data type
> + * If it is a single bin data type, write the data directly
> + * into the structure array
> + * If it is a multi-bin data type, first obtain the number of bins,
> + * and then recursively call the bin frame header processing function
> + * according to the bin number to process the frame header information
> + * of each bin separately
> + */
> +static int aw_parse_bin_header_1_0_0(struct aw_bin *bin)
> +{
> +	int ret = 0;
> +	unsigned int bin_data_type;
> +
> +	bin_data_type = GET_32_DATA(*(bin->p_addr + 11), *(bin->p_addr + 10),
> +					*(bin->p_addr + 9), *(bin->p_addr + 8));
> +	DBG("aw_bin_parse bin_data_type 0x%x\n", bin_data_type);
> +	switch (bin_data_type) {
> +	case DATA_TYPE_REGISTER:
> +	case DATA_TYPE_DSP_REG:
> +	case DATA_TYPE_SOC_APP:
> +		/* Divided into two processing methods,
> +		 * one is single bin processing,
> +		 * and the other is single bin processing in multi bin
> +		 */
> +		DBG("aw_bin_parse enter single bin branch\n");
> +		bin->single_bin_parse_num += 1;
> +		DBG("%s bin->single_bin_parse_num is %d\n", __func__,
> +						bin->single_bin_parse_num);
> +		if (!bin->multi_bin_parse_num)
> +			bin->header_info[bin->all_bin_parse_num].valid_data_addr = 60;
> +		aw_get_single_bin_header_1_0_0(bin);
> +		break;
> +	case DATA_TYPE_MULTI_BINS:
> +		/* Get the number of times to enter multi bins */
> +		DBG("aw_bin_parse enter multi bin branch\n");
> +		bin->multi_bin_parse_num += 1;
> +		DBG("%s bin->multi_bin_parse_num is %d\n", __func__,
> +						bin->multi_bin_parse_num);
> +		ret = aw_get_multi_bin_header_1_0_0(bin);
> +		if (ret < 0)
> +			return ret;
> +		break;
> +	}
> +	return 0;
> +}
> +
> +/* get the bin's header version */
> +static int aw_check_bin_header_version(struct aw_bin *bin)
> +{
> +	int ret = 0;
> +	unsigned int header_version = 0;
> +
> +	header_version = GET_32_DATA(*(bin->p_addr + 7), *(bin->p_addr + 6),
> +					*(bin->p_addr + 5), *(bin->p_addr + 4));
> +	DBG("aw_bin_parse header_version 0x%x\n", header_version);
> +	/* Write data to the corresponding structure array
> +	 * according to different formats of the bin frame header version
> +	 */
> +	switch (header_version) {
> +	case HEADER_VERSION_1_0_0:
> +		ret = aw_parse_bin_header_1_0_0(bin);
> +		return ret;
> +	default:
> +		DBG_ERR("aw_bin_parse Unrecognized this bin header version\n");
> +		return -BIN_HEADER_VER_ERR;
> +	}
> +}
> +
> +static int aw_parsing_bin_file(struct aw_bin *bin)
> +{
> +	int i = 0;
> +	int ret = 0;
> +
> +	DBG("aw_bin_parse code version:%s\n", AWINIC_CODE_VERSION);
> +	if (!bin) {
> +		DBG_ERR("aw_bin_parse bin is NULL\n");
> +		return -BIN_IS_NULL;
> +	}
> +	bin->p_addr = bin->info.data;
> +	bin->all_bin_parse_num = 0;
> +	bin->multi_bin_parse_num = 0;
> +	bin->single_bin_parse_num = 0;
> +
> +	/* filling bins header info */
> +	ret = aw_check_bin_header_version(bin);
> +	if (ret < 0) {
> +		DBG_ERR("aw_bin_parse check bin header version error\n");
> +		return ret;
> +	}
> +	bin->p_addr = NULL;
> +
> +	/* check bin header info */
> +	for (i = 0; i < bin->all_bin_parse_num; i++) {
> +		/* check sum */
> +		ret = aw_check_sum(bin, i);
> +		if (ret < 0) {
> +			DBG_ERR("aw_bin_parse check sum data error\n");
> +			return ret;
> +		}
> +		/* check bin data version */
> +		ret = aw_check_data_version(bin, i);
> +		if (ret < 0) {
> +			DBG_ERR("aw_bin_parse check data version error\n");
> +			return ret;
> +		}
> +		/* check valid data */
> +		if (bin->header_info[i].bin_data_ver == DATA_VERSION_V1) {
> +			/* check register num */
> +			if (bin->header_info[i].bin_data_type ==
> +							DATA_TYPE_REGISTER) {
> +				ret = aw_check_register_num_v1(bin, i);
> +				if (ret < 0)
> +					return ret;
> +				/* check dsp reg num */
> +			} else if (bin->header_info[i].bin_data_type ==
> +							DATA_TYPE_DSP_REG) {
> +				ret = aw_check_dsp_reg_num_v1(bin, i);
> +				if (ret < 0)
> +					return ret;
> +				/* check soc app num */
> +			} else if (bin->header_info[i].bin_data_type ==
> +							DATA_TYPE_SOC_APP) {
> +				ret = aw_check_soc_app_num_v1(bin, i);
> +				if (ret < 0)
> +					return ret;
> +			} else {
> +				bin->header_info[i].valid_data_len =
> +					bin->header_info[i].bin_data_len;
> +			}
> +		}
> +	}
> +	DBG("aw_bin_parse parsing success\n");
> +
> +	return 0;
> +}
> +
> +int aw883xx_dev_dsp_data_order(struct aw_device *aw_dev,
> +				uint8_t *data, uint32_t data_len)
> +{
> +	int i = 0;
> +	uint8_t tmp_val = 0;
> +
> +	aw_dev_dbg(aw_dev->dev, "enter");
> +
> +	if (data_len % 2 != 0) {
> +		aw_dev_dbg(aw_dev->dev, "data_len:%d unsupported", data_len);
> +		return -EINVAL;
> +	}
> +
> +	for (i = 0; i < data_len; i += 2) {
> +		tmp_val = data[i];
> +		data[i] = data[i + 1];
> +		data[i + 1] = tmp_val;
> +	}
> +
> +	return 0;
> +}
> +
> +static int aw_dev_parse_raw_reg(struct aw_device *aw_dev,
> +		uint8_t *data, uint32_t data_len, struct aw_prof_desc *prof_desc)
> +{
> +	aw_dev_info(aw_dev->dev, "data_size:%d enter", data_len);
> +
> +	prof_desc->sec_desc[AW_DATA_TYPE_REG].data = data;
> +	prof_desc->sec_desc[AW_DATA_TYPE_REG].len = data_len;
> +
> +	prof_desc->prof_st = AW_PROFILE_OK;
> +
> +	return 0;
> +}
> +
> +static int aw_dev_parse_raw_dsp_cfg(struct aw_device *aw_dev,
> +		uint8_t *data, uint32_t data_len, struct aw_prof_desc *prof_desc)
> +{
> +	int ret;
> +
> +	aw_dev_info(aw_dev->dev, "data_size:%d enter", data_len);
> +
> +	ret = aw883xx_dev_dsp_data_order(aw_dev, data, data_len);
> +	if (ret < 0)
> +		return ret;
> +
> +	prof_desc->sec_desc[AW_DATA_TYPE_DSP_CFG].data = data;
> +	prof_desc->sec_desc[AW_DATA_TYPE_DSP_CFG].len = data_len;
> +
> +	prof_desc->prof_st = AW_PROFILE_OK;
> +
> +	return 0;
> +}
> +
> +static int aw_dev_parse_raw_dsp_fw(struct aw_device *aw_dev,
> +		uint8_t *data, uint32_t data_len, struct aw_prof_desc *prof_desc)
> +{
> +	int ret;
> +
> +	aw_dev_info(aw_dev->dev, "data_size:%d enter", data_len);
> +
> +	ret = aw883xx_dev_dsp_data_order(aw_dev, data, data_len);
> +	if (ret < 0)
> +		return ret;
> +
> +	prof_desc->sec_desc[AW_DATA_TYPE_DSP_FW].data = data;
> +	prof_desc->sec_desc[AW_DATA_TYPE_DSP_FW].len = data_len;
> +
> +	prof_desc->prof_st = AW_PROFILE_OK;
> +
> +	return 0;
> +}
> +
> +static int aw_dev_prof_parse_multi_bin(struct aw_device *aw_dev,
> +		uint8_t *data, uint32_t data_len, struct aw_prof_desc *prof_desc)
> +{
> +	struct aw_bin *aw_bin = NULL;
> +	int i;
> +	int ret;
> +
> +	aw_bin = devm_kzalloc(aw_dev->dev, data_len + sizeof(struct aw_bin), GFP_KERNEL);
> +	if (aw_bin == NULL)
> +		return -ENOMEM;
> +
> +	aw_bin->info.len = data_len;
> +	memcpy(aw_bin->info.data, data, data_len);
> +
> +	ret = aw_parsing_bin_file(aw_bin);
> +	if (ret < 0) {
> +		aw_dev_err(aw_dev->dev, "parse bin failed");
> +		goto parse_bin_failed;
> +	}
> +
> +	for (i = 0; i < aw_bin->all_bin_parse_num; i++) {
> +		if (aw_bin->header_info[i].bin_data_type == DATA_TYPE_REGISTER) {
> +			prof_desc->sec_desc[AW_DATA_TYPE_REG].len =
> +				aw_bin->header_info[i].valid_data_len;
> +			prof_desc->sec_desc[AW_DATA_TYPE_REG].data =
> +				data + aw_bin->header_info[i].valid_data_addr;
> +		} else if (aw_bin->header_info[i].bin_data_type == DATA_TYPE_DSP_REG) {
> +			ret = aw883xx_dev_dsp_data_order(aw_dev,
> +					data + aw_bin->header_info[i].valid_data_addr,
> +					aw_bin->header_info[i].valid_data_len);
> +			if (ret < 0)
> +				return ret;
> +
> +			prof_desc->sec_desc[AW_DATA_TYPE_DSP_CFG].len =
> +					aw_bin->header_info[i].valid_data_len;
> +			prof_desc->sec_desc[AW_DATA_TYPE_DSP_CFG].data =
> +					data + aw_bin->header_info[i].valid_data_addr;
> +		} else if (aw_bin->header_info[i].bin_data_type == DATA_TYPE_DSP_FW) {
> +			ret = aw883xx_dev_dsp_data_order(aw_dev,
> +					data + aw_bin->header_info[i].valid_data_addr,
> +					aw_bin->header_info[i].valid_data_len);
> +			if (ret < 0)
> +				return ret;
> +
> +			prof_desc->fw_ver = aw_bin->header_info[i].app_version;
> +			prof_desc->sec_desc[AW_DATA_TYPE_DSP_FW].len =
> +						aw_bin->header_info[i].valid_data_len;
> +			prof_desc->sec_desc[AW_DATA_TYPE_DSP_FW].data =
> +						data + aw_bin->header_info[i].valid_data_addr;
> +		}
> +	}
> +	devm_kfree(aw_dev->dev, aw_bin);
> +	aw_bin = NULL;
> +	prof_desc->prof_st = AW_PROFILE_OK;
> +	return 0;
> +
> +parse_bin_failed:
> +	devm_kfree(aw_dev->dev, aw_bin);
> +	aw_bin = NULL;
> +	return ret;
> +}
> +
> +static int aw_dev_parse_data_by_sec_type(struct aw_device *aw_dev, struct aw_cfg_hdr *cfg_hdr,
> +			struct aw_cfg_dde *cfg_dde, struct aw_prof_desc *scene_prof_desc)
> +{
> +
> +	switch (cfg_dde->data_type) {
> +	case ACF_SEC_TYPE_REG:
> +		return aw_dev_parse_raw_reg(aw_dev,
> +				(uint8_t *)cfg_hdr + cfg_dde->data_offset,
> +				cfg_dde->data_size, scene_prof_desc);
> +	case ACF_SEC_TYPE_DSP_CFG:
> +		return aw_dev_parse_raw_dsp_cfg(aw_dev,
> +				(uint8_t *)cfg_hdr + cfg_dde->data_offset,
> +				cfg_dde->data_size, scene_prof_desc);
> +	case ACF_SEC_TYPE_DSP_FW:
> +		return aw_dev_parse_raw_dsp_fw(aw_dev,
> +				(uint8_t *)cfg_hdr + cfg_dde->data_offset,
> +				cfg_dde->data_size, scene_prof_desc);
> +	case ACF_SEC_TYPE_MUTLBIN:
> +		return aw_dev_prof_parse_multi_bin(aw_dev,
> +				(uint8_t *)cfg_hdr + cfg_dde->data_offset,
> +				cfg_dde->data_size, scene_prof_desc);
> +	}
> +	return 0;
> +}
> +
> +static int aw_dev_parse_dev_type(struct aw_device *aw_dev,
> +		struct aw_cfg_hdr *prof_hdr, struct aw_all_prof_info *all_prof_info)
> +{
> +	int i = 0;
> +	int ret;
> +	int sec_num = 0;
> +	struct aw_cfg_dde *cfg_dde =
> +		(struct aw_cfg_dde *)((char *)prof_hdr + prof_hdr->a_hdr_offset);
> +
> +	aw_dev_info(aw_dev->dev, "enter");
> +
> +	for (i = 0; i < prof_hdr->a_ddt_num; i++) {
> +		if ((aw_dev->i2c->adapter->nr == cfg_dde[i].dev_bus) &&
> +			(aw_dev->i2c->addr == cfg_dde[i].dev_addr) &&
> +			(cfg_dde[i].type == AW_DEV_TYPE_ID)) {
> +			if (cfg_dde[i].data_type == ACF_SEC_TYPE_MONITOR) {
> +				ret = aw883xx_monitor_parse_fw(&aw_dev->monitor_desc,
> +						(uint8_t *)prof_hdr + cfg_dde[i].data_offset,
> +						cfg_dde[i].data_size);
> +				if (ret < 0) {
> +					aw_dev_err(aw_dev->dev, "parse monitor failed");
> +					return ret;
> +					}
> +			} else {
> +				if (cfg_dde[i].dev_profile >= AW_PROFILE_MAX) {
> +					aw_dev_err(aw_dev->dev, "dev_profile [%d] overflow",
> +						cfg_dde[i].dev_profile);
> +					return -EINVAL;
> +				}
> +				ret = aw_dev_parse_data_by_sec_type(aw_dev, prof_hdr, &cfg_dde[i],
> +					&all_prof_info->prof_desc[cfg_dde[i].dev_profile]);
> +				if (ret < 0) {
> +					aw_dev_err(aw_dev->dev, "parse failed");
> +					return ret;
> +				}
> +				sec_num++;
> +			}
> +		}
> +	}
> +
> +	if (sec_num == 0) {
> +		aw_dev_info(aw_dev->dev, "get dev type num is %d, please use default",
> +					sec_num);
> +		return AW_DEV_TYPE_NONE;
> +	}
> +
> +	return AW_DEV_TYPE_OK;
> +}
> +
> +static int aw_dev_parse_dev_default_type(struct aw_device *aw_dev,
> +		struct aw_cfg_hdr *prof_hdr, struct aw_all_prof_info *all_prof_info)
> +{
> +	int i = 0;
> +	int ret;
> +	int sec_num = 0;
> +	struct aw_cfg_dde *cfg_dde =
> +		(struct aw_cfg_dde *)((char *)prof_hdr + prof_hdr->a_hdr_offset);
> +
> +	aw_dev_info(aw_dev->dev, "enter");
> +
> +	for (i = 0; i < prof_hdr->a_ddt_num; i++) {
> +		if ((aw_dev->channel == cfg_dde[i].dev_index) &&
> +			(cfg_dde[i].type == AW_DEV_DEFAULT_TYPE_ID)) {
> +			if (cfg_dde[i].data_type == ACF_SEC_TYPE_MONITOR) {
> +				ret = aw883xx_monitor_parse_fw(&aw_dev->monitor_desc,
> +						(uint8_t *)prof_hdr + cfg_dde[i].data_offset,
> +						cfg_dde[i].data_size);
> +				if (ret < 0) {
> +					aw_dev_err(aw_dev->dev, "parse monitor failed");
> +					return ret;
> +				}
> +			} else {
> +				if (cfg_dde[i].dev_profile >= AW_PROFILE_MAX) {
> +					aw_dev_err(aw_dev->dev, "dev_profile [%d] overflow",
> +						cfg_dde[i].dev_profile);
> +					return -EINVAL;
> +				}
> +				ret = aw_dev_parse_data_by_sec_type(aw_dev, prof_hdr, &cfg_dde[i],
> +					&all_prof_info->prof_desc[cfg_dde[i].dev_profile]);
> +				if (ret < 0) {
> +					aw_dev_err(aw_dev->dev, "parse failed");
> +					return ret;
> +				}
> +				sec_num++;
> +			}
> +		}
> +	}
> +
> +	if (sec_num == 0) {
> +		aw_dev_err(aw_dev->dev, "get dev default type failed, get num[%d]", sec_num);
> +		return -EINVAL;
> +	}
> +
> +	return 0;
> +}
> +
> +static int aw_dev_cfg_get_vaild_prof(struct aw_device *aw_dev,
> +				struct aw_all_prof_info all_prof_info)
> +{
> +	int i;
> +	int num = 0;
> +	struct aw_sec_data_desc *sec_desc = NULL;
> +	struct aw_prof_desc *prof_desc = all_prof_info.prof_desc;
> +	struct aw_prof_info *prof_info = &aw_dev->prof_info;
> +
> +	for (i = 0; i < AW_PROFILE_MAX; i++) {
> +		if (prof_desc[i].prof_st == AW_PROFILE_OK) {
> +			sec_desc = prof_desc[i].sec_desc;
> +			if ((sec_desc[AW_DATA_TYPE_REG].data != NULL) &&
> +				(sec_desc[AW_DATA_TYPE_REG].len != 0) &&
> +				(sec_desc[AW_DATA_TYPE_DSP_CFG].data != NULL) &&
> +				(sec_desc[AW_DATA_TYPE_DSP_CFG].len != 0) &&
> +				(sec_desc[AW_DATA_TYPE_DSP_FW].data != NULL) &&
> +				(sec_desc[AW_DATA_TYPE_DSP_FW].len != 0)) {
> +				prof_info->count++;
> +			}
> +		}
> +	}
> +
> +	aw_dev_info(aw_dev->dev, "get valid profile:%d", aw_dev->prof_info.count);
> +
> +	if (!prof_info->count) {
> +		aw_dev_err(aw_dev->dev, "no profile data");
> +		return -EPERM;
> +	}
> +
> +	prof_info->prof_desc = devm_kzalloc(aw_dev->dev,
> +					prof_info->count * sizeof(struct aw_prof_desc),
> +					GFP_KERNEL);
> +	if (prof_info->prof_desc == NULL) {
> +		aw_dev_err(aw_dev->dev, "prof_desc kzalloc failed");
> +		return -ENOMEM;
> +	}
> +
> +	for (i = 0; i < AW_PROFILE_MAX; i++) {
> +		if (prof_desc[i].prof_st == AW_PROFILE_OK) {
> +			sec_desc = prof_desc[i].sec_desc;
> +			if ((sec_desc[AW_DATA_TYPE_REG].data != NULL) &&
> +				(sec_desc[AW_DATA_TYPE_REG].len != 0) &&
> +				(sec_desc[AW_DATA_TYPE_DSP_CFG].data != NULL) &&
> +				(sec_desc[AW_DATA_TYPE_DSP_CFG].len != 0) &&
> +				(sec_desc[AW_DATA_TYPE_DSP_FW].data != NULL) &&
> +				(sec_desc[AW_DATA_TYPE_DSP_FW].len != 0)) {
> +				if (num >= prof_info->count) {
> +					aw_dev_err(aw_dev->dev, "get scene num[%d] overflow count[%d]",
> +						num, prof_info->count);
> +					return -ENOMEM;
> +				}
> +				prof_info->prof_desc[num] = prof_desc[i];
> +				prof_info->prof_desc[num].id = i;
> +				num++;
> +			}
> +		}
> +	}
> +
> +	return 0;
> +}
> +
> +static int aw_dev_load_cfg_by_hdr(struct aw_device *aw_dev,
> +		struct aw_cfg_hdr *prof_hdr)
> +{
> +	int ret;
> +	struct aw_all_prof_info all_prof_info;
> +
> +	memset(&all_prof_info, 0, sizeof(struct aw_all_prof_info));
> +
> +	ret = aw_dev_parse_dev_type(aw_dev, prof_hdr, &all_prof_info);
> +	if (ret < 0) {
> +		return ret;
> +	} else if (ret == AW_DEV_TYPE_NONE) {
> +		aw_dev_info(aw_dev->dev, "get dev type num is 0, parse default dev");
> +		ret = aw_dev_parse_dev_default_type(aw_dev, prof_hdr, &all_prof_info);
> +		if (ret < 0)
> +			return ret;
> +	}
> +
> +	ret = aw_dev_cfg_get_vaild_prof(aw_dev, all_prof_info);
> +	if (ret < 0)
> +		return ret;
> +
> +	aw_dev->prof_info.prof_name_list = profile_name;
> +
> +	return 0;
> +}
> +
> +static int aw_dev_create_prof_name_list_v_1_0_0_0(struct aw_device *aw_dev)
> +{
> +	struct aw_prof_info *prof_info = &aw_dev->prof_info;
> +	struct aw_prof_desc *prof_desc = prof_info->prof_desc;
> +	int i;
> +
> +	if (prof_desc == NULL) {
> +		aw_dev_err(aw_dev->dev, "prof_desc is NULL");
> +		return -EINVAL;
> +	}
> +
> +	prof_info->prof_name_list = devm_kzalloc(aw_dev->dev,
> +					prof_info->count * PROFILE_STR_MAX,
> +					GFP_KERNEL);
> +	if (prof_info->prof_name_list == NULL) {
> +		aw_dev_err(aw_dev->dev, "prof_name_list devm_kzalloc failed");
> +		return -ENOMEM;
> +	}
> +
> +	for (i = 0; i < prof_info->count; i++) {
> +		prof_desc[i].id = i;
> +		prof_info->prof_name_list[i] = prof_desc[i].prf_str;
> +		aw_dev_info(aw_dev->dev, "prof name is %s", prof_info->prof_name_list[i]);
> +	}
> +
> +	return 0;
> +}
> +
> +static int aw_get_dde_type_info(struct aw_device *aw_dev, struct aw_container *aw_cfg)
> +{
> +	int i;
> +	int dev_num = 0;
> +	int default_num = 0;
> +	struct aw_cfg_hdr *cfg_hdr = (struct aw_cfg_hdr *)aw_cfg->data;
> +	struct aw_cfg_dde_v_1_0_0_0 *cfg_dde =
> +		(struct aw_cfg_dde_v_1_0_0_0 *)(aw_cfg->data + cfg_hdr->a_hdr_offset);
> +
> +	for (i = 0; i < cfg_hdr->a_ddt_num; i++) {
> +		if (cfg_dde[i].type == AW_DEV_TYPE_ID)
> +			dev_num++;
> +
> +		if (cfg_dde[i].type == AW_DEV_DEFAULT_TYPE_ID)
> +			default_num++;
> +	}
> +
> +	if (!(dev_num || default_num)) {
> +		aw_dev_err(aw_dev->dev, "can't find scene");
> +		return -EINVAL;
> +	}
> +
> +	if (dev_num != 0)
> +		aw_dev->prof_info.prof_type = AW_DEV_TYPE_ID;
> +	else if (default_num != 0)
> +		aw_dev->prof_info.prof_type = AW_DEV_DEFAULT_TYPE_ID;
> +
> +	return 0;
> +}
> +
> +static int aw_get_dev_scene_count_v_1_0_0_0(struct aw_device *aw_dev, struct aw_container *aw_cfg,
> +						uint32_t *scene_num)
> +{
> +	int i;
> +	struct aw_cfg_hdr *cfg_hdr = (struct aw_cfg_hdr *)aw_cfg->data;
> +	struct aw_cfg_dde_v_1_0_0_0 *cfg_dde =
> +		(struct aw_cfg_dde_v_1_0_0_0 *)(aw_cfg->data + cfg_hdr->a_hdr_offset);
> +
> +	for (i = 0; i < cfg_hdr->a_ddt_num; ++i) {
> +		if ((cfg_dde[i].data_type == ACF_SEC_TYPE_MUTLBIN) &&
> +			(aw_dev->chip_id == cfg_dde[i].chip_id) &&
> +			((aw_dev->i2c->adapter->nr == cfg_dde[i].dev_bus) &&
> +			(aw_dev->i2c->addr == cfg_dde[i].dev_addr)))
> +			(*scene_num)++;
> +	}
> +
> +	return 0;
> +}
> +
> +static int aw_get_default_scene_count_v_1_0_0_0(struct aw_device *aw_dev,
> +						struct aw_container *aw_cfg,
> +						uint32_t *scene_num)
> +{
> +	int i;
> +	struct aw_cfg_hdr *cfg_hdr = (struct aw_cfg_hdr *)aw_cfg->data;
> +	struct aw_cfg_dde_v_1_0_0_0 *cfg_dde =
> +		(struct aw_cfg_dde_v_1_0_0_0 *)(aw_cfg->data + cfg_hdr->a_hdr_offset);
> +
> +	for (i = 0; i < cfg_hdr->a_ddt_num; ++i) {
> +		if ((cfg_dde[i].data_type == ACF_SEC_TYPE_MUTLBIN) &&
> +			(aw_dev->chip_id == cfg_dde[i].chip_id) &&
> +			(aw_dev->channel == cfg_dde[i].dev_index))
> +			(*scene_num)++;
> +	}
> +
> +	return 0;
> +}
> +
> +static int aw_dev_parse_scene_count_v_1_0_0_0(struct aw_device *aw_dev,
> +							struct aw_container *aw_cfg,
> +							uint32_t *count)
> +{
> +	int ret;
> +
> +	ret = aw_get_dde_type_info(aw_dev, aw_cfg);
> +	if (ret < 0)
> +		return ret;
> +
> +	if (aw_dev->prof_info.prof_type == AW_DEV_TYPE_ID) {
> +		aw_get_dev_scene_count_v_1_0_0_0(aw_dev, aw_cfg, count);
> +	} else if (aw_dev->prof_info.prof_type == AW_DEV_DEFAULT_TYPE_ID) {
> +		aw_get_default_scene_count_v_1_0_0_0(aw_dev, aw_cfg, count);
> +	} else {
> +		aw_dev_err(aw_dev->dev, "unsupported prof_type[%x]",
> +			aw_dev->prof_info.prof_type);
> +		return -EINVAL;
> +	}
> +
> +	aw_dev_info(aw_dev->dev, "scene count is %d", (*count));
> +	return 0;
> +}
> +
> +static int aw_dev_parse_data_by_sec_type_v_1_0_0_0(struct aw_device *aw_dev,
> +							struct aw_cfg_hdr *prof_hdr,
> +							struct aw_cfg_dde_v_1_0_0_0 *cfg_dde,
> +							int *cur_scene_id)
> +{
> +	int ret;
> +	struct aw_prof_info *prof_info = &aw_dev->prof_info;
> +
> +	switch (cfg_dde->data_type) {
> +	case ACF_SEC_TYPE_MUTLBIN:
> +		ret = aw_dev_prof_parse_multi_bin(aw_dev,
> +					(uint8_t *)prof_hdr + cfg_dde->data_offset,
> +					cfg_dde->data_size, &prof_info->prof_desc[*cur_scene_id]);
> +		if (ret < 0) {
> +			aw_dev_err(aw_dev->dev, "parse multi bin failed");
> +			return ret;
> +		}
> +		prof_info->prof_desc[*cur_scene_id].prf_str = cfg_dde->dev_profile_str;
> +		prof_info->prof_desc[*cur_scene_id].id = cfg_dde->dev_profile;
> +		(*cur_scene_id)++;
> +		break;
> +	case ACF_SEC_TYPE_MONITOR:
> +		return aw883xx_monitor_parse_fw(&aw_dev->monitor_desc,
> +						(uint8_t *)prof_hdr + cfg_dde->data_offset,
> +						cfg_dde->data_size);
> +	default:
> +		aw_pr_err("unsupported SEC_TYPE [%d]", cfg_dde->data_type);
> +		return -EINVAL;
> +	}
> +
> +	return 0;
> +}
> +
> +static int aw_dev_parse_dev_type_v_1_0_0_0(struct aw_device *aw_dev,
> +		struct aw_cfg_hdr *prof_hdr)
> +{
> +	int i = 0;
> +	int ret;
> +	int cur_scene_id = 0;
> +	struct aw_cfg_dde_v_1_0_0_0 *cfg_dde =
> +		(struct aw_cfg_dde_v_1_0_0_0 *)((char *)prof_hdr + prof_hdr->a_hdr_offset);
> +
> +	aw_dev_info(aw_dev->dev, "enter");
> +
> +	for (i = 0; i < prof_hdr->a_ddt_num; i++) {
> +		if ((aw_dev->i2c->adapter->nr == cfg_dde[i].dev_bus) &&
> +			(aw_dev->i2c->addr == cfg_dde[i].dev_addr) &&
> +			(aw_dev->chip_id == cfg_dde[i].chip_id)) {
> +			ret = aw_dev_parse_data_by_sec_type_v_1_0_0_0(aw_dev, prof_hdr,
> +							&cfg_dde[i], &cur_scene_id);
> +			if (ret < 0) {
> +				aw_dev_err(aw_dev->dev, "parse failed");
> +				return ret;
> +			}
> +		}
> +	}
> +
> +	if (cur_scene_id == 0) {
> +		aw_dev_info(aw_dev->dev, "get dev type failed, get num [%d]", cur_scene_id);
> +		return -EINVAL;
> +	}
> +
> +	return 0;
> +}
> +
> +static int aw_dev_parse_default_type_v_1_0_0_0(struct aw_device *aw_dev,
> +		struct aw_cfg_hdr *prof_hdr)
> +{
> +	int i = 0;
> +	int ret;
> +	int cur_scene_id = 0;
> +	struct aw_cfg_dde_v_1_0_0_0 *cfg_dde =
> +		(struct aw_cfg_dde_v_1_0_0_0 *)((char *)prof_hdr + prof_hdr->a_hdr_offset);
> +
> +	aw_dev_info(aw_dev->dev, "enter");
> +
> +	for (i = 0; i < prof_hdr->a_ddt_num; i++) {
> +		if ((aw_dev->channel == cfg_dde[i].dev_index) &&
> +			(aw_dev->chip_id == cfg_dde[i].chip_id)) {
> +			ret = aw_dev_parse_data_by_sec_type_v_1_0_0_0(aw_dev, prof_hdr,
> +							&cfg_dde[i], &cur_scene_id);
> +			if (ret < 0) {
> +				aw_dev_err(aw_dev->dev, "parse failed");
> +				return ret;
> +			}
> +		}
> +	}
> +
> +	if (cur_scene_id == 0) {
> +		aw_dev_err(aw_dev->dev, "get dev default type failed, get num[%d]", cur_scene_id);
> +		return -EINVAL;
> +	}
> +
> +	return 0;
> +}
> +
> +static int aw_dev_parse_by_hdr_v_1_0_0_0(struct aw_device *aw_dev,
> +		struct aw_cfg_hdr *cfg_hdr)
> +{
> +	int ret;
> +
> +	if (aw_dev->prof_info.prof_type == AW_DEV_TYPE_ID) {
> +		ret = aw_dev_parse_dev_type_v_1_0_0_0(aw_dev, cfg_hdr);
> +		if (ret < 0)
> +			return ret;
> +	} else if (aw_dev->prof_info.prof_type == AW_DEV_DEFAULT_TYPE_ID) {
> +		ret = aw_dev_parse_default_type_v_1_0_0_0(aw_dev, cfg_hdr);
> +		if (ret < 0)
> +			return ret;
> +	} else {
> +		aw_dev_err(aw_dev->dev, "prof type matched failed, get num[%d]",
> +			aw_dev->prof_info.prof_type);
> +		return -EINVAL;
> +	}
> +
> +	return 0;
> +}
> +
> +static int aw_dev_load_cfg_by_hdr_v_1_0_0_0(struct aw_device *aw_dev, struct aw_container *aw_cfg)
> +{
> +	struct aw_prof_info *prof_info = &aw_dev->prof_info;
> +	struct aw_cfg_hdr *cfg_hdr = (struct aw_cfg_hdr *)aw_cfg->data;
> +	int ret;
> +
> +	ret = aw_dev_parse_scene_count_v_1_0_0_0(aw_dev, aw_cfg, &prof_info->count);
> +	if (ret < 0) {
> +		aw_dev_err(aw_dev->dev, "get scene count failed");
> +		return ret;
> +	}
> +
> +	prof_info->prof_desc = devm_kzalloc(aw_dev->dev,
> +					prof_info->count * sizeof(struct aw_prof_desc),
> +					GFP_KERNEL);
> +	if (prof_info->prof_desc == NULL) {
> +		aw_dev_err(aw_dev->dev, "prof_desc devm_kzalloc failed");
> +		return -ENOMEM;
> +	}
> +
> +	ret = aw_dev_parse_by_hdr_v_1_0_0_0(aw_dev, cfg_hdr);
> +	if (ret < 0) {
> +		aw_dev_err(aw_dev->dev, " failed");
> +		return ret;
> +	}
> +
> +	ret = aw_dev_create_prof_name_list_v_1_0_0_0(aw_dev);
> +	if (ret < 0) {
> +		aw_dev_err(aw_dev->dev, "create prof name list failed");
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +int aw883xx_dev_cfg_load(struct aw_device *aw_dev, struct aw_container *aw_cfg)
> +{
> +	struct aw_cfg_hdr *cfg_hdr = NULL;
> +	int ret;
> +
> +	aw_dev_info(aw_dev->dev, "enter");
> +
> +	cfg_hdr = (struct aw_cfg_hdr *)aw_cfg->data;
> +	switch (cfg_hdr->a_hdr_version) {
> +	case AW_CFG_HDR_VER_0_0_0_1:
> +		ret = aw_dev_load_cfg_by_hdr(aw_dev, cfg_hdr);
> +		if (ret < 0) {
> +			aw_dev_err(aw_dev->dev, "hdr_cersion[0x%x] parse failed",
> +						cfg_hdr->a_hdr_version);
> +			return ret;
> +		}
> +		break;
> +	case AW_CFG_HDR_VER_1_0_0_0:
> +		ret = aw_dev_load_cfg_by_hdr_v_1_0_0_0(aw_dev, aw_cfg);
> +		if (ret < 0) {
> +			aw_dev_err(aw_dev->dev, "hdr_cersion[0x%x] parse failed",
> +						cfg_hdr->a_hdr_version);
> +			return ret;
> +		}
> +		break;
> +	default:
> +		aw_pr_err("unsupported hdr_version [0x%x]", cfg_hdr->a_hdr_version);
> +		return -EINVAL;
> +	}
> +
> +	aw_dev->fw_status = AW_DEV_FW_OK;
> +	aw_dev_info(aw_dev->dev, "parse cfg success");
> +	return 0;
> +}
> +
> +static uint8_t aw_dev_crc8_check(unsigned char *data, uint32_t data_size)
> +{
> +	uint8_t crc_value = 0x00;
> +	uint8_t pdatabuf = 0;
> +	int i;
> +
> +	while (data_size--) {
> +		pdatabuf = *data++;
> +		for (i = 0; i < 8; i++) {
> +			/*if the lowest bit is 1*/
> +			if ((crc_value ^ (pdatabuf)) & 0x01) {
> +				/*Xor multinomial*/
> +				crc_value ^= 0x18;
> +				crc_value >>= 1;
> +				crc_value |= 0x80;
> +			} else {
> +				crc_value >>= 1;
> +			}
> +			pdatabuf >>= 1;
> +		}
> +	}
> +	return crc_value;
> +}
> +
> +static int aw_dev_check_cfg_by_hdr(struct aw_container *aw_cfg)
> +{
> +	struct aw_cfg_hdr *cfg_hdr = NULL;
> +	struct aw_cfg_dde *cfg_dde = NULL;
> +	unsigned int end_data_offset = 0;
> +	unsigned int act_data = 0;
> +	unsigned int hdr_ddt_len = 0;
> +	uint8_t act_crc8 = 0;
> +	int i;
> +
> +	cfg_hdr = (struct aw_cfg_hdr *)aw_cfg->data;
> +
> +	/*check file type id is awinic acf file*/
> +	if (cfg_hdr->a_id != ACF_FILE_ID) {
> +		aw_pr_err("not acf type file");
> +		return -EINVAL;
> +	}
> +
> +	hdr_ddt_len = cfg_hdr->a_hdr_offset + cfg_hdr->a_ddt_size;
> +	if (hdr_ddt_len > aw_cfg->len) {
> +		aw_pr_err("hdrlen with ddt_len [%d] overflow file size[%d]",
> +		cfg_hdr->a_hdr_offset, aw_cfg->len);
> +		return -EINVAL;
> +	}
> +
> +	/*check data size*/
> +	cfg_dde = (struct aw_cfg_dde *)((char *)aw_cfg->data + cfg_hdr->a_hdr_offset);
> +	act_data += hdr_ddt_len;
> +	for (i = 0; i < cfg_hdr->a_ddt_num; i++)
> +		act_data += cfg_dde[i].data_size;
> +
> +	if (act_data != aw_cfg->len) {
> +		aw_pr_err("act_data[%d] not equal to file size[%d]!",
> +			act_data, aw_cfg->len);
> +		return -EINVAL;
> +	}
> +
> +	for (i = 0; i < cfg_hdr->a_ddt_num; i++) {
> +		/* data check */
> +		end_data_offset = cfg_dde[i].data_offset + cfg_dde[i].data_size;
> +		if (end_data_offset > aw_cfg->len) {
> +			aw_pr_err("a_ddt_num[%d] end_data_offset[%d] overflow file size[%d]",
> +				i, end_data_offset, aw_cfg->len);
> +			return -EINVAL;
> +		}
> +
> +		/* crc check */
> +		act_crc8 = aw_dev_crc8_check(aw_cfg->data + cfg_dde[i].data_offset,
> +									cfg_dde[i].data_size);
> +		if (act_crc8 != cfg_dde[i].data_crc) {
> +			aw_pr_err("a_ddt_num[%d] crc8 check failed, act_crc8:0x%x != data_crc 0x%x",
> +				i, (uint32_t)act_crc8, cfg_dde[i].data_crc);
> +			return -EINVAL;
> +		}
> +	}
> +
> +	aw_pr_info("project name [%s]", cfg_hdr->a_project);
> +	aw_pr_info("custom name [%s]", cfg_hdr->a_custom);
> +	aw_pr_info("version name [%d.%d.%d.%d]", cfg_hdr->a_version[3], cfg_hdr->a_version[2],
> +						cfg_hdr->a_version[1], cfg_hdr->a_version[0]);
> +	aw_pr_info("author id %d", cfg_hdr->a_author_id);
> +
> +	return 0;
> +}
> +
> +static int aw_dev_check_acf_by_hdr_v_1_0_0_0(struct aw_container *aw_cfg)
> +{
> +	struct aw_cfg_hdr *cfg_hdr = NULL;
> +	struct aw_cfg_dde_v_1_0_0_0 *cfg_dde = NULL;
> +	unsigned int end_data_offset = 0;
> +	unsigned int act_data = 0;
> +	unsigned int hdr_ddt_len = 0;
> +	uint8_t act_crc8 = 0;
> +	int i;
> +
> +	cfg_hdr = (struct aw_cfg_hdr *)aw_cfg->data;
> +
> +	/*check file type id is awinic acf file*/
> +	if (cfg_hdr->a_id != ACF_FILE_ID) {
> +		aw_pr_err("not acf type file");
> +		return -EINVAL;
> +	}
> +
> +	hdr_ddt_len = cfg_hdr->a_hdr_offset + cfg_hdr->a_ddt_size;
> +	if (hdr_ddt_len > aw_cfg->len) {
> +		aw_pr_err("hdrlen with ddt_len [%d] overflow file size[%d]",
> +		cfg_hdr->a_hdr_offset, aw_cfg->len);
> +		return -EINVAL;
> +	}
> +
> +	/*check data size*/
> +	cfg_dde = (struct aw_cfg_dde_v_1_0_0_0 *)((char *)aw_cfg->data + cfg_hdr->a_hdr_offset);
> +	act_data += hdr_ddt_len;
> +	for (i = 0; i < cfg_hdr->a_ddt_num; i++)
> +		act_data += cfg_dde[i].data_size;
> +
> +	if (act_data != aw_cfg->len) {
> +		aw_pr_err("act_data[%d] not equal to file size[%d]!",
> +			act_data, aw_cfg->len);
> +		return -EINVAL;
> +	}
> +
> +	for (i = 0; i < cfg_hdr->a_ddt_num; i++) {
> +		/* data check */
> +		end_data_offset = cfg_dde[i].data_offset + cfg_dde[i].data_size;
> +		if (end_data_offset > aw_cfg->len) {
> +			aw_pr_err("a_ddt_num[%d] end_data_offset[%d] overflow file size[%d]",
> +				i, end_data_offset, aw_cfg->len);
> +			return -EINVAL;
> +		}
> +
> +		/* crc check */
> +		act_crc8 = aw_dev_crc8_check(aw_cfg->data + cfg_dde[i].data_offset,
> +							cfg_dde[i].data_size);
> +		if (act_crc8 != cfg_dde[i].data_crc) {
> +			aw_pr_err("a_ddt_num[%d] crc8 check failed, act_crc8:0x%x != data_crc 0x%x",
> +				i, (uint32_t)act_crc8, cfg_dde[i].data_crc);
> +			return -EINVAL;
> +		}
> +	}
> +
> +	aw_pr_info("project name [%s]", cfg_hdr->a_project);
> +	aw_pr_info("custom name [%s]", cfg_hdr->a_custom);
> +	aw_pr_info("version name [%d.%d.%d.%d]", cfg_hdr->a_version[3], cfg_hdr->a_version[2],
> +						cfg_hdr->a_version[1], cfg_hdr->a_version[0]);
> +	aw_pr_info("author id %d", cfg_hdr->a_author_id);
> +
> +	return 0;
> +
> +}
> +
> +int aw883xx_dev_load_acf_check(struct aw_container *aw_cfg)
> +{
> +	struct aw_cfg_hdr *cfg_hdr = NULL;
> +
> +	if (aw_cfg == NULL) {
> +		aw_pr_err("aw_prof is NULL");
> +		return -ENOMEM;
> +	}
> +
> +	if (aw_cfg->len < sizeof(struct aw_cfg_hdr)) {
> +		aw_pr_err("cfg hdr size[%d] overflow file size[%d]",
> +			aw_cfg->len, (int)sizeof(struct aw_cfg_hdr));
> +		return -EINVAL;
> +	}
> +
> +	cfg_hdr = (struct aw_cfg_hdr *)aw_cfg->data;
> +	switch (cfg_hdr->a_hdr_version) {
> +	case AW_CFG_HDR_VER_0_0_0_1:
> +		return aw_dev_check_cfg_by_hdr(aw_cfg);
> +	case AW_CFG_HDR_VER_1_0_0_0:
> +		return aw_dev_check_acf_by_hdr_v_1_0_0_0(aw_cfg);
> +	default:
> +		aw_pr_err("unsupported hdr_version [0x%x]", cfg_hdr->a_hdr_version);
> +		return -EINVAL;
> +	}
> +
> +	return 0;
> +}
> +
> +int aw883xx_dev_get_profile_count(struct aw_device *aw_dev)
> +{
> +	if (aw_dev == NULL) {
> +		aw_pr_err("aw_dev is NULL");
> +		return -ENOMEM;
> +	}
> +
> +	return aw_dev->prof_info.count;
> +}
> +
> +int aw883xx_dev_check_profile_index(struct aw_device *aw_dev, int index)
> +{
> +	if ((index >= aw_dev->prof_info.count) || (index < 0))
> +		return -EINVAL;
> +	else
> +		return 0;
> +}
> +
> +int aw883xx_dev_get_profile_index(struct aw_device *aw_dev)
> +{
> +	return aw_dev->set_prof;
> +}
> +
> +int aw883xx_dev_set_profile_index(struct aw_device *aw_dev, int index)
> +{
> +	struct aw_prof_desc *prof_desc = NULL;
> +
> +	if ((index < aw_dev->prof_info.count) && (index >= 0)) {
> +		aw_dev->set_prof = index;
> +		prof_desc = &aw_dev->prof_info.prof_desc[index];
> +
> +		aw_dev_info(aw_dev->dev, "set prof[%s]",
> +			aw_dev->prof_info.prof_name_list[prof_desc->id]);
> +	} else {
> +		return -EINVAL;
> +	}
> +
> +	return 0;
> +}
> +
> +char *aw_dev_get_prof_name(struct aw_device *aw_dev, int index)
> +{
> +	struct aw_prof_desc *prof_desc = NULL;
> +	struct aw_prof_info *prof_info = &aw_dev->prof_info;
> +
> +	if ((index >= aw_dev->prof_info.count) || (index < 0)) {
> +		aw_dev_err(aw_dev->dev, "index[%d] overflow count[%d]",
> +			index, aw_dev->prof_info.count);
> +		return NULL;
> +	}
> +
> +	prof_desc = &aw_dev->prof_info.prof_desc[index];
> +
> +	return prof_info->prof_name_list[prof_desc->id];
> +}
> +
> +int aw883xx_dev_get_prof_data(struct aw_device *aw_dev, int index,
> +			struct aw_prof_desc **prof_desc)
> +{
> +	if ((index >= aw_dev->prof_info.count) || (index < 0)) {
> +		aw_dev_err(aw_dev->dev, "%s: index[%d] overflow count[%d]\n",
> +			__func__, index, aw_dev->prof_info.count);
> +		return -EINVAL;
> +	}
> +
> +	*prof_desc = &aw_dev->prof_info.prof_desc[index];
> +
> +	return 0;
> +}
> +
> diff --git a/sound/soc/codecs/aw883xx/aw883xx_bin_parse.h b/sound/soc/codecs/aw883xx/aw883xx_bin_parse.h
> new file mode 100644
> index 0000000..a961a35
> --- /dev/null
> +++ b/sound/soc/codecs/aw883xx/aw883xx_bin_parse.h
> @@ -0,0 +1,145 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * aw883xx.c --  ALSA Soc AW883XX codec support
> + *
> + * Copyright (c) 2020 AWINIC Technology CO., LTD
> + *
> + * Author: Bruce zhao <zhaolei@awinic.com>
> + */
> +
> +#ifndef __AW883XX_BIN_PARSE_H__
> +#define __AW883XX_BIN_PARSE_H__
> +
> +#include "aw883xx_device.h"
> +
> +#define NULL				((void *)0)
> +#define GET_32_DATA(w, x, y, z) \
> +	((unsigned int)((((uint8_t)w) << 24) | \
> +	(((uint8_t)x) << 16) | (((uint8_t)y) << 8) | \
> +	((uint8_t)z)))
> +#define BIN_NUM_MAX			100
> +#define HEADER_LEN			60
> +/*
> + * header information
> + */
> +enum return_enum {
> +	BIN_HEADER_VER_ERR = 1,
> +	BIN_DATA_TYPE_ERR = 2,
> +	BIN_DATA_LEN_ERR = 3,
> +	DATA_VER_ERR = 4,
> +	REG_NUM_ERR = 5,
> +	DSP_REG_NUM_ERR = 6,
> +	SOC_APP_NUM_ERR = 7,
> +	BIN_IS_NULL = 8,
> +};
> +
> +enum bin_header_version_enum {
> +	HEADER_VERSION_1_0_0 = 0x01000000,
> +};
> +
> +enum data_type_enum {
> +	DATA_TYPE_REGISTER = 0x00000000,
> +	DATA_TYPE_DSP_REG = 0x00000010,
> +	DATA_TYPE_DSP_CFG = 0x00000011,
> +	DATA_TYPE_SOC_REG = 0x00000020,
> +	DATA_TYPE_SOC_APP = 0x00000021,
> +	DATA_TYPE_DSP_FW = DATA_TYPE_SOC_APP,
> +	DATA_TYPE_MULTI_BINS = 0x00002000,
> +};
> +
> +/**
> + * @DATA_VERSION_V1：default little edian
> + */
> +enum data_version_enum {
> +	DATA_VERSION_V1 = 0X00000001,
> +	DATA_VERSION_MAX,
> +};
> +
> +/**
> + * @header_len: Frame header length
> + * @check_sum: Frame header information-Checksum
> + * @header_ver: Frame header information-Frame header version
> + * @bin_data_type: Frame header information-Data type
> + * @bin_data_ver: Frame header information-Data version
> + * @bin_data_len: Frame header information-Data length
> + * @ui_ver: Frame header information-ui version
> + * @chip_type[8]: Frame header information-chip type
> + * @reg_byte_len: Frame header information-reg byte len
> + * @data_byte_len: Frame header information-data byte len
> + * @device_addr: Frame header information-device addr
> + * @valid_data_len: Length of valid data obtained after parsing
> + * @valid_data_addr: The offset address of the valid data obtained
> + *                   after parsing relative to info
> + * @reg_num: The number of registers obtained after parsing
> + * @reg_data_byte_len: The byte length of the register obtained after parsing
> + * @download_addr: The starting address or download address obtained
> + *                 after parsing
> + * @app_version: The software version number obtained after parsing
> + */
> +struct bin_header_info {
> +	unsigned int header_len;
> +	unsigned int check_sum;
> +	unsigned int header_ver;
> +	unsigned int bin_data_type;
> +	unsigned int bin_data_ver;
> +	unsigned int bin_data_len;
> +	unsigned int ui_ver;
> +	unsigned char chip_type[8];
> +	unsigned int reg_byte_len;
> +	unsigned int data_byte_len;
> +	unsigned int device_addr;
> +	unsigned int valid_data_len;
> +	unsigned int valid_data_addr;
> +
> +	unsigned int reg_num;
> +	unsigned int reg_data_byte_len;
> +	unsigned int download_addr;
> +	unsigned int app_version;
> +};
> +
> +/*
> + * function define
> + *
> + */
> +/*
> + * @len: The size of the bin file obtained from the firmware
> + * @data[]: Store the bin file obtained from the firmware
> + */
> +struct bin_container {
> +	unsigned int len;
> +	unsigned char data[];
> +};
> +
> +/**
> + * @p_addr: Offset pointer (backward offset pointer to obtain frame header
> + *          information and important information)
> + * @all_bin_parse_num: The number of all bin files
> + * @multi_bin_parse_num: The number of single bin files
> + * @single_bin_parse_num: The number of multiple bin files
> + * @header_info[BIN_NUM_MAX]: Frame header information and other important data
> + *                            obtained after parsing
> + * @info: Obtained bin file data that needs to be parsed
> + */
> +struct aw_bin {
> +	unsigned char *p_addr;
> +	unsigned int all_bin_parse_num;
> +	unsigned int multi_bin_parse_num;
> +	unsigned int single_bin_parse_num;
> +	struct bin_header_info header_info[BIN_NUM_MAX];
> +	struct bin_container info;
> +};
> +
> +/*******************awinic audio parse acf***********************/
> +int aw883xx_dev_dsp_data_order(struct aw_device *aw_dev,
> +				uint8_t *data, uint32_t data_len);
> +int aw883xx_dev_get_prof_data(struct aw_device *aw_dev, int index,
> +			struct aw_prof_desc **prof_desc);
> +char *aw_dev_get_prof_name(struct aw_device *aw_dev, int index);
> +int aw883xx_dev_set_profile_index(struct aw_device *aw_dev, int index);
> +int aw883xx_dev_get_profile_index(struct aw_device *aw_dev);
> +int aw883xx_dev_check_profile_index(struct aw_device *aw_dev, int index);
> +int aw883xx_dev_get_profile_count(struct aw_device *aw_dev);
> +int aw883xx_dev_cfg_load(struct aw_device *aw_dev, struct aw_container *aw_cfg);
> +int aw883xx_dev_load_acf_check(struct aw_container *aw_cfg);
> +
> +#endif
> diff --git a/sound/soc/codecs/aw883xx/aw883xx_calib.c b/sound/soc/codecs/aw883xx/aw883xx_calib.c
> new file mode 100644
> index 0000000..4d1b90f
> --- /dev/null
> +++ b/sound/soc/codecs/aw883xx/aw883xx_calib.c
> @@ -0,0 +1,2534 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * aw883xx.c --  ALSA Soc AW883XX codec support
> + *
> + * Copyright (c) 2020 AWINIC Technology CO., LTD
> + *
> + * Author: Bruce zhao <zhaolei@awinic.com>
> + */
> +
> +#include <linux/module.h>
> +#include <asm/ioctls.h>
> +#include <linux/uaccess.h>
> +#include <linux/delay.h>
> +#include <linux/slab.h>
> +#include <linux/fs.h>
> +#include <linux/miscdevice.h>
> +#include <linux/device.h>
> +#include <linux/kernel.h>
> +#include <linux/of.h>
> +#include <sound/core.h>
> +#include <sound/pcm.h>
> +#include <sound/pcm_params.h>
> +#include <sound/soc.h>
> +
> +#include "aw883xx_device.h"
> +#include "aw883xx_log.h"
> +#include "aw883xx_calib.h"
> +#include "aw883xx.h"
> +
> +
> +
> +static bool is_single_cali;	/*if mutli_dev cali false, single dev true*/
> +static unsigned int g_cali_re_time = AW_CALI_RE_DEFAULT_TIMER;
> +static unsigned int g_dev_select;
> +static struct miscdevice *g_misc_dev;
> +static unsigned int g_msic_wr_flag = CALI_STR_NONE;
> +static DEFINE_MUTEX(g_cali_lock);
> +static const char *cali_str[CALI_STR_MAX] = {"none", "start_cali", "cali_re",
> +	"cali_f0", "store_re", "show_re", "show_r0", "show_cali_f0", "show_f0",
> +	"show_te", "dev_sel", "get_ver", "get_re_range"
> +};
> +
> +
> +/******************************cali re store example start***********************************/
> +#ifdef AW_CALI_STORE_EXAMPLE
> +/*write cali to persist file example*/
> +#define AWINIC_CALI_FILE  "/mnt/vendor/persist/factory/audio/aw_cali.bin"
> +#define AW_INT_DEC_DIGIT (10)
> +
> +static void aw_fs_read(struct file *file, char *buf, size_t count, loff_t *pos)
> +{
> +#ifdef AW_KERNEL_VER_OVER_5_4_0
> +	kernel_read(file, buf, count, pos);
> +#else
> +	vfs_read(file, buf, count, pos);
> +#endif
> +}
> +
> +static void aw_fs_write(struct file *file, char *buf, size_t count, loff_t *pos)
> +{
> +#ifdef AW_KERNEL_VER_OVER_5_4_0
> +	kernel_write(file, buf, count, pos);
> +#else
> +	vfs_write(file, buf, count, pos);
> +#endif
> +}
> +
> +static int aw_cali_write_cali_re_to_file(int32_t cali_re, int channel)
> +{
> +	struct file *fp = NULL;
> +	char buf[50] = { 0 };
> +	loff_t pos = 0;
> +	//mm_segment_t fs;
> +
> +	fp = filp_open(AWINIC_CALI_FILE, O_RDWR | O_CREAT, 0644);
> +	if (IS_ERR(fp)) {
> +		aw_pr_err("channel:%d open %s failed!",
> +				channel, AWINIC_CALI_FILE);
> +		return -EINVAL;
> +	}
> +
> +	pos = AW_INT_DEC_DIGIT * channel;
> +
> +	snprintf(buf, sizeof(buf), "%10d", cali_re);
> +
> +	//fs = get_fs();
> +	//set_fs(KERNFS_NS);
> +
> +	aw_fs_write(fp, buf, strlen(buf), &pos);
> +
> +	//set_fs(fs);
> +
> +	aw_pr_info("channel:%d buf:%s cali_re:%d",
> +			channel, buf, cali_re);
> +
> +	filp_close(fp, NULL);
> +	return 0;
> +}
> +
> +static int aw_cali_get_cali_re_from_file(int32_t *cali_re, int channel)
> +{
> +	struct file *fp = NULL;
> +	int f_size;
> +	char *buf = NULL;
> +	int32_t int_cali_re = 0;
> +	loff_t pos = 0;
> +	int ret;
> +	//mm_segment_t fs;
> +
> +	fp = filp_open(AWINIC_CALI_FILE, O_RDONLY, 0);
> +	if (IS_ERR(fp)) {
> +		aw_pr_err("channel:%d open %s failed!",
> +				channel, AWINIC_CALI_FILE);
> +		return -EINVAL;
> +	}
> +
> +	pos = AW_INT_DEC_DIGIT * channel;
> +
> +	f_size = AW_INT_DEC_DIGIT;
> +
> +	buf = kzalloc(f_size + 1, GFP_ATOMIC);
> +	if (!buf) {
> +		filp_close(fp, NULL);
> +		return -EINVAL;
> +	}
> +
> +	//fs = get_fs();
> +	//set_fs(KERNFS_NS);
> +
> +	aw_fs_read(fp, buf, f_size, &pos);
> +
> +	//set_fs(fs);
> +	ret = kstrtoint(buf, 0, &int_cali_re);
> +	if (ret < 0)
> +		*cali_re = AW_ERRO_CALI_RE_VALUE;
> +	else
> +		*cali_re = int_cali_re;
> +
> +	aw_pr_info("channel:%d buf:%s int_cali_re: %d",
> +		channel, buf, int_cali_re);
> +
> +	kfree(buf);
> +	buf = NULL;
> +	filp_close(fp, NULL);
> +
> +	return  0;
> +}
> +#endif
> +/********************cali re store example end*****************************/
> +
> +
> +/*custom need add to set/get cali_re form/to nv*/
> +static int aw_cali_write_re_to_nvram(int32_t cali_re, int32_t channel)
> +{
> +#ifdef AW_CALI_STORE_EXAMPLE
> +	return aw_cali_write_cali_re_to_file(cali_re, channel);
> +#else
> +	return 0;
> +#endif
> +}
> +static int aw_cali_read_re_from_nvram(int32_t *cali_re, int32_t channel)
> +{
> +/*custom add, if success return value is 0 , else -1*/
> +#ifdef AW_CALI_STORE_EXAMPLE
> +	return aw_cali_get_cali_re_from_file(cali_re, channel);
> +#else
> +	return 0;
> +#endif
> +}
> +
> +bool aw883xx_cali_check_result(struct aw_cali_desc *cali_desc)
> +{
> +	if (cali_desc->cali_check_st &&
> +		(cali_desc->cali_result == CALI_RESULT_ERROR))
> +		return false;
> +	else
> +		return true;
> +}
> +
> +static void aw_cali_svc_run_mute(struct aw_device *aw_dev, int8_t cali_result)
> +{
> +	aw_dev_dbg(aw_dev->dev, "enter");
> +
> +	if (aw_dev->cali_desc.cali_check_st) {
> +		if (cali_result == CALI_RESULT_ERROR)
> +			aw883xx_dev_mute(aw_dev, true);
> +		else if (cali_result == CALI_RESULT_NORMAL)
> +			aw883xx_dev_mute(aw_dev, false);
> +	} else {
> +		aw_dev_info(aw_dev->dev, "cali check disable");
> +	}
> +
> +	aw_dev_info(aw_dev->dev, "done");
> +}
> +
> +static int aw_cali_svc_get_dev_re_range(struct aw_device *aw_dev,
> +						uint32_t *data_buf)
> +{
> +	data_buf[RE_MIN_FLAG] = aw_dev->re_range.re_min;
> +	data_buf[RE_MAX_FLAG] = aw_dev->re_range.re_max;
> +
> +	return 0;
> +}
> +
> +static int aw_cali_svc_get_devs_re_range(struct aw_device *aw_dev,
> +						uint32_t *data_buf, int num)
> +{
> +	struct list_head *dev_list = NULL;
> +	struct list_head *pos = NULL;
> +	struct aw_device *local_dev = NULL;
> +	int ret, cnt = 0;
> +
> +	/*get dev list*/
> +	ret = aw883xx_dev_get_list_head(&dev_list);
> +	if (ret) {
> +		aw_dev_err(aw_dev->dev, "get dev list failed");
> +		return ret;
> +	}
> +
> +	list_for_each(pos, dev_list) {
> +		local_dev = container_of(pos, struct aw_device, list_node);
> +		if (local_dev->channel < num) {
> +			data_buf[RE_MIN_FLAG + local_dev->channel * 2] =
> +				local_dev->re_range.re_min;
> +			data_buf[RE_MAX_FLAG + local_dev->channel * 2] =
> +				local_dev->re_range.re_max;
> +			cnt++;
> +		} else {
> +			aw_dev_err(local_dev->dev, "channel num[%d] overflow buf num[%d]",
> +						local_dev->channel, num);
> +			return -EINVAL;
> +		}
> +	}
> +
> +	return cnt;
> +}
> +
> +
> +static int aw_cali_store_cali_re(struct aw_device *aw_dev, int32_t re)
> +{
> +	int ret;
> +
> +	if ((re > aw_dev->re_range.re_min) && (re < aw_dev->re_range.re_max)) {
> +		aw_dev->cali_desc.cali_re = re;
> +		ret = aw_cali_write_re_to_nvram(re, aw_dev->channel);
> +		if (ret < 0) {
> +			aw_dev_err(aw_dev->dev, "write re to nvram failed!");
> +			return ret;
> +		}
> +	} else {
> +		aw_dev_err(aw_dev->dev, "invalid cali re %d!", re);
> +		return -EINVAL;
> +	}
> +
> +	return 0;
> +}
> +
> +int aw883xx_cali_get_cali_re(struct aw_cali_desc *cali_desc)
> +{
> +	int ret;
> +	int32_t cali_re = 0;
> +	struct aw_device *aw_dev =
> +		container_of(cali_desc, struct aw_device, cali_desc);
> +
> +	ret = aw_cali_read_re_from_nvram(&cali_re, aw_dev->channel);
> +	if (ret < 0) {
> +		cali_desc->cali_re = AW_ERRO_CALI_RE_VALUE;
> +		cali_desc->cali_result = CALI_RESULT_NONE;
> +		aw_dev_err(aw_dev->dev, "get re failed");
> +		return ret;
> +	}
> +
> +	if (cali_re < aw_dev->re_range.re_min || cali_re > aw_dev->re_range.re_max) {
> +		aw_dev_err(aw_dev->dev,
> +				"out range re value: %d", cali_re);
> +		cali_desc->cali_re = AW_ERRO_CALI_RE_VALUE;
> +		/*cali_result is error when aw-cali-check enable*/
> +		if (aw_dev->cali_desc.cali_check_st)
> +			cali_desc->cali_result = CALI_RESULT_ERROR;
> +		return -EINVAL;
> +	}
> +	cali_desc->cali_re = cali_re;
> +
> +	/*cali_result is normal when aw-cali-check enable*/
> +	if (aw_dev->cali_desc.cali_check_st)
> +		cali_desc->cali_result = CALI_RESULT_NORMAL;
> +
> +	aw_dev_info(aw_dev->dev, "get cali re %d", cali_desc->cali_re);
> +
> +	return 0;
> +}
> +
> +int aw883xx_cali_read_cali_re_from_dsp(struct aw_cali_desc *cali_desc, uint32_t *re)
> +{
> +	struct aw_device *aw_dev =
> +		container_of(cali_desc, struct aw_device, cali_desc);
> +	struct aw_adpz_re_desc *desc = &aw_dev->adpz_re_desc;
> +	int ret;
> +
> +	ret = aw_dev->ops.aw_dsp_read(aw_dev, desc->dsp_reg, re, desc->data_type);
> +	if (ret < 0) {
> +		aw_dev_err(aw_dev->dev, "set cali re error");
> +		return ret;
> +	}
> +
> +	*re = AW_DSP_RE_TO_SHOW_RE(*re, desc->shift);
> +	*re -= aw_dev->cali_desc.ra;
> +
> +	aw_dev_info(aw_dev->dev, "get dsp re:%d", *re);
> +
> +	return 0;
> +}
> +
> +
> +/*************Calibration base function************/
> +int aw883xx_cali_svc_set_cali_re_to_dsp(struct aw_cali_desc *cali_desc)
> +{
> +	struct aw_device *aw_dev =
> +		container_of(cali_desc, struct aw_device, cali_desc);
> +	struct aw_adpz_re_desc *adpz_re_desc = &aw_dev->adpz_re_desc;
> +	uint32_t cali_re = 0;
> +	int ret;
> +
> +	cali_re = AW_SHOW_RE_TO_DSP_RE((aw_dev->cali_desc.cali_re +
> +		aw_dev->cali_desc.ra), adpz_re_desc->shift);
> +
> +	/* set cali re to aw883xx */
> +	ret = aw_dev->ops.aw_dsp_write(aw_dev,
> +			adpz_re_desc->dsp_reg, cali_re, adpz_re_desc->data_type);
> +	if (ret < 0) {
> +		aw_dev_err(aw_dev->dev, "set cali re error");
> +		return ret;
> +	}
> +
> +	ret = aw883xx_dev_modify_dsp_cfg(aw_dev, adpz_re_desc->dsp_reg,
> +				cali_re, adpz_re_desc->data_type);
> +	if (ret < 0) {
> +		aw_dev_err(aw_dev->dev, "modify dsp cfg failed");
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +int aw883xx_cali_svc_get_ra(struct aw_cali_desc *cali_desc)
> +{
> +	int ret;
> +	uint32_t dsp_ra;
> +	struct aw_device *aw_dev =
> +		container_of(cali_desc, struct aw_device, cali_desc);
> +	struct aw_ra_desc *desc = &aw_dev->ra_desc;
> +
> +	ret = aw_dev->ops.aw_dsp_read(aw_dev, desc->dsp_reg,
> +				&dsp_ra, desc->data_type);
> +	if (ret < 0) {
> +		aw_dev_err(aw_dev->dev, "read ra error");
> +		return ret;
> +	}
> +
> +	cali_desc->ra = AW_DSP_RE_TO_SHOW_RE(dsp_ra,
> +					aw_dev->adpz_re_desc.shift);
> +	aw_dev_info(aw_dev->dev, "get ra:%d", cali_desc->ra);
> +	return 0;
> +}
> +
> +static int aw_cali_svc_get_dev_realtime_re(struct aw_device *aw_dev,
> +					uint32_t *re)
> +{
> +	int ret;
> +	struct aw_adpz_re_desc *re_desc = &aw_dev->adpz_re_desc;
> +	struct aw_ra_desc *ra_desc = &aw_dev->ra_desc;
> +	struct aw_adpz_t0_desc *t0_desc = &aw_dev->t0_desc;
> +	uint32_t dsp_re = 0;
> +	uint32_t show_re = 0;
> +	uint32_t re_cacl = 0;
> +	uint32_t ra = 0;
> +	uint32_t t0 = 0;
> +	int32_t te = 0;
> +	int32_t te_cacl = 0;
> +	uint32_t coil_alpha = 0;
> +	uint16_t pst_rpt = 0;
> +
> +	ret = aw_dev->ops.aw_dsp_read(aw_dev, re_desc->dsp_reg, &dsp_re, re_desc->data_type);
> +	if (ret < 0) {
> +		aw_dev_err(aw_dev->dev, "dsp read re error");
> +		return ret;
> +	}
> +
> +	ret = aw_dev->ops.aw_dsp_read(aw_dev, ra_desc->dsp_reg, &ra, ra_desc->data_type);
> +	if (ret < 0) {
> +		aw_dev_err(aw_dev->dev, "dsp read ra error");
> +		return ret;
> +	}
> +
> +	re_cacl = dsp_re - ra;
> +
> +	ret = aw_dev->ops.aw_dsp_read(aw_dev, t0_desc->dsp_reg, &t0, t0_desc->data_type);
> +	if (ret < 0) {
> +		aw_dev_err(aw_dev->dev, "dsp read t0 error");
> +		return ret;
> +	}
> +
> +	ret = aw_dev->ops.aw_dsp_read(aw_dev, t0_desc->coilalpha_reg,
> +								&coil_alpha, t0_desc->coil_type);
> +	if (ret < 0) {
> +		aw_dev_err(aw_dev->dev, "dsp read coil_alpha error");
> +		return ret;
> +	}
> +
> +	ret = aw_dev->ops.aw_reg_read(aw_dev, aw_dev->spkr_temp_desc.reg, &pst_rpt);
> +	if (ret < 0) {
> +		aw_dev_err(aw_dev->dev, "reg read pst_rpt error");
> +		return ret;
> +	}
> +
> +	te = (int32_t)((uint32_t)pst_rpt - t0);
> +
> +	te_cacl = AW_TE_CACL_VALUE(te, (uint16_t)coil_alpha);
> +
> +	show_re = AW_RE_REALTIME_VALUE((int32_t)re_cacl, te_cacl);
> +
> +	*re = AW_DSP_RE_TO_SHOW_RE(show_re, re_desc->shift);
> +	aw_dev_dbg(aw_dev->dev, "real_r0:[%d]", *re);
> +
> +	return 0;
> +}
> +
> +static int aw_cali_svc_get_dev_re(struct aw_device *aw_dev,
> +					uint32_t *re)
> +{
> +	int ret;
> +	struct aw_ste_re_desc *desc = &aw_dev->ste_re_desc;
> +	uint32_t dsp_re = 0;
> +	uint32_t show_re = 0;
> +
> +	ret = aw_dev->ops.aw_dsp_read(aw_dev, desc->dsp_reg, &dsp_re, desc->data_type);
> +	if (ret < 0) {
> +		aw_dev_err(aw_dev->dev, "dsp read re error");
> +		return ret;
> +	}
> +
> +	show_re = AW_DSP_RE_TO_SHOW_RE(dsp_re,
> +				aw_dev->ste_re_desc.shift);
> +
> +	*re = show_re - aw_dev->cali_desc.ra;
> +	aw_dev_dbg(aw_dev->dev, "real_r0:[%d]", *re);
> +
> +	return 0;
> +}
> +
> +static int aw_cali_svc_get_devs_r0(struct aw_device *aw_dev, int32_t *r0_buf, int num)
> +{
> +	struct list_head *dev_list = NULL;
> +	struct list_head *pos = NULL;
> +	struct aw_device *local_dev = NULL;
> +	int ret, cnt = 0;
> +
> +	//get dev list
> +	ret = aw883xx_dev_get_list_head(&dev_list);
> +	if (ret) {
> +		aw_dev_err(aw_dev->dev, "get dev list failed");
> +		return ret;
> +	}
> +
> +	list_for_each(pos, dev_list) {
> +		local_dev = container_of(pos, struct aw_device, list_node);
> +		if (local_dev->channel < num) {
> +			ret = aw_cali_svc_get_dev_realtime_re(local_dev,
> +								&r0_buf[local_dev->channel]);
> +			if (ret) {
> +				aw_dev_err(local_dev->dev, "get r0 failed!");
> +				return ret;
> +			}
> +			cnt++;
> +		} else {
> +			aw_dev_err(aw_dev->dev, "channel num[%d] overflow buf num[%d] ",
> +						 local_dev->channel, num);
> +		}
> +	}
> +	return cnt;
> +}
> +
> +static int aw_cali_svc_get_dev_f0(struct aw_device *aw_dev,
> +					uint32_t *f0)
> +{
> +	struct aw_f0_desc *f0_desc = &aw_dev->f0_desc;
> +	uint32_t dsp_val = 0;
> +	int ret;
> +
> +	ret = aw_dev->ops.aw_dsp_read(aw_dev,
> +				f0_desc->dsp_reg, &dsp_val, f0_desc->data_type);
> +	if (ret < 0) {
> +		aw_dev_err(aw_dev->dev, "read f0 failed");
> +		return ret;
> +	}
> +
> +	*f0 = dsp_val >> f0_desc->shift;
> +	aw_dev_dbg(aw_dev->dev, "real_f0:[%d]", *f0);
> +
> +	return 0;
> +}
> +
> +static int aw_cali_svc_get_devs_f0(struct aw_device *aw_dev, int32_t *f0_buf, int num)
> +{
> +	struct list_head *dev_list = NULL;
> +	struct list_head *pos = NULL;
> +	struct aw_device *local_dev = NULL;
> +	int ret, cnt = 0;
> +
> +	//get dev list
> +	ret = aw883xx_dev_get_list_head(&dev_list);
> +	if (ret) {
> +		aw_dev_err(aw_dev->dev, "get dev list failed");
> +		return ret;
> +	}
> +
> +	list_for_each(pos, dev_list) {
> +		local_dev = container_of(pos, struct aw_device, list_node);
> +		if (local_dev->channel < num) {
> +			ret = aw_cali_svc_get_dev_f0(local_dev, &f0_buf[local_dev->channel]);
> +			if (ret) {
> +				aw_dev_err(local_dev->dev, "get f0 failed!");
> +				return ret;
> +			}
> +			cnt++;
> +		} else {
> +			aw_dev_err(aw_dev->dev, "channel num[%d] overflow buf num[%d] ",
> +						 local_dev->channel, num);
> +		}
> +	}
> +	return cnt;
> +}
> +
> +static int aw_cali_svc_get_dev_q(struct aw_device *aw_dev,
> +					uint32_t *q)
> +{
> +	struct aw_q_desc *q_desc = &aw_dev->q_desc;
> +	uint32_t dsp_val = 0;
> +	int ret;
> +
> +	ret = aw_dev->ops.aw_dsp_read(aw_dev,
> +			q_desc->dsp_reg, &dsp_val, q_desc->data_type);
> +	if (ret < 0) {
> +		aw_dev_err(aw_dev->dev, "read q failed");
> +		return ret;
> +	}
> +
> +	*q = ((dsp_val * 1000) >> q_desc->shift);
> +
> +	return 0;
> +}
> +
> +int aw883xx_cali_svc_get_dev_te(struct aw_cali_desc *cali_desc, int32_t *te)
> +{
> +	struct aw_device *aw_dev =
> +		container_of(cali_desc, struct aw_device, cali_desc);
> +	uint16_t reg_val = 0;
> +	int ret;
> +
> +	ret = aw_dev->ops.aw_reg_read(aw_dev, aw_dev->spkr_temp_desc.reg, &reg_val);
> +	if (ret < 0) {
> +		aw_dev_err(aw_dev->dev, "read temperature failed");
> +		return ret;
> +	}
> +
> +	*te = (int32_t)((int16_t)reg_val);
> +	aw_dev_info(aw_dev->dev, "real_te:[%d]", *te);
> +
> +	return 0;
> +}
> +
> +static int aw_cali_svc_get_devs_te(struct aw_device *aw_dev, int32_t *te_buf, int num)
> +{
> +	struct list_head *dev_list = NULL;
> +	struct list_head *pos = NULL;
> +	struct aw_device *local_dev = NULL;
> +	int ret, cnt = 0;
> +
> +	//get dev list
> +	ret = aw883xx_dev_get_list_head(&dev_list);
> +	if (ret) {
> +		aw_dev_err(aw_dev->dev, "get dev list failed");
> +		return ret;
> +	}
> +
> +	list_for_each(pos, dev_list) {
> +		local_dev = container_of(pos, struct aw_device, list_node);
> +		if (local_dev->channel < num) {
> +			ret = aw883xx_cali_svc_get_dev_te(&local_dev->cali_desc,
> +							&te_buf[local_dev->channel]);
> +			if (ret) {
> +				aw_dev_err(local_dev->dev, "get temperature failed!");
> +				return ret;
> +			}
> +			cnt++;
> +		} else {
> +			aw_dev_err(aw_dev->dev, "channel num[%d] overflow buf num[%d]",
> +						 local_dev->channel, num);
> +		}
> +	}
> +	return cnt;
> +}
> +
> +static void aw_cali_svc_bubble_sort(uint32_t *data, int data_size)
> +{
> +	int loop_num = data_size - 1;
> +	uint16_t temp_store = 0;
> +	int i;
> +	int j;
> +
> +	if (data == NULL) {
> +		aw_pr_err("data is NULL");
> +		return;
> +	}
> +
> +	for (i = 0; i < loop_num; i++) {
> +		for (j = 0; j < loop_num - i; j++) {
> +			if (data[j] > data[j + 1]) {
> +				temp_store = data[j];
> +				data[j] = data[j + 1];
> +				data[j + 1] = temp_store;
> +			}
> +		}
> +	}
> +}
> +
> +static int aw_cali_svc_del_max_min_ave_algo(uint32_t *data, int data_size)
> +{
> +	int sum = 0;
> +	int ave = 0;
> +	int i = 0;
> +
> +	aw_cali_svc_bubble_sort(data, data_size);
> +	for (i = 1; i < data_size - 1; i++)
> +		sum += data[i];
> +
> +	if ((data_size - AW_CALI_DATA_SUM_RM) == 0) {
> +		aw_pr_err("data_size id :%d less than 2", data_size);
> +		return -EINVAL;
> +	}
> +
> +	ave = sum / (data_size - AW_CALI_DATA_SUM_RM);
> +
> +	return ave;
> +}
> +
> +static void aw_cali_svc_set_cali_status(struct aw_device *aw_dev, bool status)
> +{
> +	aw_dev->cali_desc.status = status;
> +
> +	if (status)
> +		aw883xx_monitor_stop(&aw_dev->monitor_desc);
> +	else
> +		aw883xx_monitor_start(&aw_dev->monitor_desc);
> +
> +	aw_dev_info(aw_dev->dev, "cali %s",
> +		(status == 0) ? ("disable") : ("enable"));
> +}
> +
> +bool aw883xx_cali_svc_get_cali_status(struct aw_cali_desc *cali_desc)
> +{
> +	return cali_desc->status;
> +}
> +
> +static int aw_cali_svc_cali_init_check(struct aw_device *aw_dev)
> +{
> +	int ret;
> +
> +	aw_dev_dbg(aw_dev->dev, "enter");
> +
> +	ret = aw883xx_dev_sysst_check(aw_dev);
> +	if (ret < 0) {
> +		aw_dev_err(aw_dev->dev, "syst_check failed");
> +		return ret;
> +	}
> +
> +	ret = aw883xx_dev_get_dsp_status(aw_dev);
> +	if (ret < 0) {
> +		aw_dev_err(aw_dev->dev, "dsp status error");
> +		return ret;
> +	}
> +
> +	ret = aw883xx_dev_get_hmute(aw_dev);
> +	if (ret == 1) {
> +		aw_dev_err(aw_dev->dev, "mute staus");
> +		return -EINVAL;
> +	}
> +
> +	return 0;
> +}
> +
> +static int aw_cali_svc_get_cali_cfg(struct aw_device *aw_dev)
> +{
> +	int ret;
> +	struct aw_cali_cfg_desc *desc = &aw_dev->cali_cfg_desc;
> +	struct cali_cfg *cali_cfg = &aw_dev->cali_desc.cali_cfg;
> +
> +	aw_dev_dbg(aw_dev->dev, "enter");
> +
> +	ret = aw_dev->ops.aw_dsp_read(aw_dev,
> +			desc->actampth_reg, &cali_cfg->data[0], desc->actampth_data_type);
> +	if (ret < 0) {
> +		aw_dev_err(aw_dev->dev, "dsp read reg0x%x error", desc->actampth_reg);
> +		return ret;
> +	}
> +
> +	ret = aw_dev->ops.aw_dsp_read(aw_dev,
> +			desc->noiseampth_reg, &cali_cfg->data[1], desc->noiseampth_data_type);
> +	if (ret < 0) {
> +		aw_dev_err(aw_dev->dev, "dsp read reg0x%x error", desc->noiseampth_reg);
> +		return ret;
> +	}
> +
> +	ret = aw_dev->ops.aw_dsp_read(aw_dev,
> +			desc->ustepn_reg, &cali_cfg->data[2], desc->ustepn_data_type);
> +	if (ret < 0) {
> +		aw_dev_err(aw_dev->dev, "dsp read reg0x%x error", desc->ustepn_reg);
> +		return ret;
> +	}
> +
> +	ret = aw_dev->ops.aw_dsp_read(aw_dev,
> +			desc->alphan_reg, &cali_cfg->data[3], desc->alphan_data_type);
> +	if (ret < 0) {
> +		aw_dev_err(aw_dev->dev, "dsp read reg0x%x error", desc->alphan_reg);
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static int aw_cali_svc_set_cali_cfg(struct aw_device *aw_dev,
> +				struct cali_cfg cali_cfg)
> +{
> +	int ret;
> +	struct aw_cali_cfg_desc *desc = &aw_dev->cali_cfg_desc;
> +
> +	aw_dev_dbg(aw_dev->dev, "enter");
> +
> +	ret = aw_dev->ops.aw_dsp_write(aw_dev,
> +			desc->actampth_reg, cali_cfg.data[0], desc->actampth_data_type);
> +	if (ret < 0) {
> +		aw_dev_err(aw_dev->dev, "dsp write reg0x%x error", desc->actampth_reg);
> +		return ret;
> +	}
> +
> +	ret = aw_dev->ops.aw_dsp_write(aw_dev,
> +			desc->noiseampth_reg, cali_cfg.data[1], desc->noiseampth_data_type);
> +	if (ret < 0) {
> +		aw_dev_err(aw_dev->dev, "dsp write reg0x%x error", desc->noiseampth_reg);
> +		return ret;
> +	}
> +
> +	ret = aw_dev->ops.aw_dsp_write(aw_dev,
> +			desc->ustepn_reg, cali_cfg.data[2], desc->ustepn_data_type);
> +	if (ret < 0) {
> +		aw_dev_err(aw_dev->dev, "dsp write reg0x%x error", desc->ustepn_reg);
> +		return ret;
> +	}
> +
> +	ret = aw_dev->ops.aw_dsp_write(aw_dev,
> +			desc->alphan_reg, cali_cfg.data[3], desc->alphan_data_type);
> +	if (ret < 0) {
> +		aw_dev_err(aw_dev->dev, "dsp write reg0x%x error", desc->alphan_reg);
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static int aw_cali_svc_get_smooth_cali_re(struct aw_device *aw_dev)
> +{
> +	int ret = 0;
> +	int i = 0;
> +	uint32_t re_temp[AW_CALI_READ_CNT_MAX] = { 0 };
> +	uint32_t dsp_re;
> +
> +	aw_dev_dbg(aw_dev->dev, "enter");
> +
> +	for (i = 0; i < AW_CALI_READ_CNT_MAX; i++) {
> +		ret = aw_cali_svc_get_dev_re(aw_dev, &re_temp[i]);
> +		if (ret < 0)
> +			goto cali_re_fail;
> +
> +		msleep(30);/*delay 30 ms*/
> +	}
> +	dsp_re = aw_cali_svc_del_max_min_ave_algo(re_temp,
> +					AW_CALI_READ_CNT_MAX);
> +
> +	if (aw_dev->ops.aw_cali_svc_get_iv_st) {
> +		ret = aw_dev->ops.aw_cali_svc_get_iv_st(aw_dev);
> +		if (ret < 0) {
> +			aw_dev_err(aw_dev->dev,
> +				"get iv data failed");
> +			goto cali_re_fail;
> +		}
> +	}
> +
> +	if (dsp_re < aw_dev->re_range.re_min || dsp_re > aw_dev->re_range.re_max) {
> +		aw_dev_err(aw_dev->dev,
> +			"out range re value: [%d]mohm", dsp_re);
> +		aw_dev->cali_desc.cali_re = dsp_re;
> +		if (aw_dev->cali_desc.cali_check_st) {
> +			aw_dev->cali_desc.cali_result = CALI_RESULT_ERROR;
> +			ret = aw_cali_write_re_to_nvram(dsp_re, aw_dev->channel);
> +			if (ret < 0)
> +				aw_dev_err(aw_dev->dev, "write re failed");
> +		}
> +		aw_cali_svc_run_mute(aw_dev, aw_dev->cali_desc.cali_result);
> +		return 0;
> +	}
> +
> +	ret = aw_cali_write_re_to_nvram(dsp_re, aw_dev->channel);
> +	if (ret < 0) {
> +		aw_dev_err(aw_dev->dev, "write re failed");
> +		goto cali_re_fail;
> +	}
> +
> +	if (aw_dev->cali_desc.cali_check_st)
> +		aw_dev->cali_desc.cali_result = CALI_RESULT_NORMAL;
> +
> +	aw_dev->cali_desc.cali_re = dsp_re;
> +	aw_dev_info(aw_dev->dev, "re[%d]mohm", aw_dev->cali_desc.cali_re);
> +
> +	aw883xx_dev_dsp_enable(aw_dev, false);
> +	aw883xx_cali_svc_set_cali_re_to_dsp(&aw_dev->cali_desc);
> +	aw883xx_dev_dsp_enable(aw_dev, true);
> +
> +	return 0;
> +
> +cali_re_fail:
> +	if (aw_dev->cali_desc.cali_check_st)
> +		aw_dev->cali_desc.cali_result = CALI_RESULT_ERROR;
> +	aw_cali_svc_run_mute(aw_dev, aw_dev->cali_desc.cali_result);
> +	return -EINVAL;
> +}
> +
> +static int aw_cali_svc_cali_en(struct aw_device *aw_dev, bool cali_en)
> +{
> +	int ret = 0;
> +	struct cali_cfg set_cfg;
> +
> +	aw_dev_info(aw_dev->dev, "cali_en:%d", cali_en);
> +
> +	aw883xx_dev_dsp_enable(aw_dev, false);
> +	if (cali_en) {
> +		ret = aw_cali_svc_get_cali_cfg(aw_dev);
> +		if (ret < 0) {
> +			aw_dev_err(aw_dev->dev, "get cali cfg failed");
> +			aw883xx_dev_dsp_enable(aw_dev, true);
> +			return ret;
> +		}
> +		set_cfg.data[0] = 0;
> +		set_cfg.data[1] = 0;
> +		set_cfg.data[2] = -1;
> +		set_cfg.data[3] = 1;
> +
> +		ret = aw_cali_svc_set_cali_cfg(aw_dev, set_cfg);
> +		if (ret < 0) {
> +			aw_dev_err(aw_dev->dev, "set cali cfg failed");
> +			aw_cali_svc_set_cali_cfg(aw_dev, aw_dev->cali_desc.cali_cfg);
> +			aw883xx_dev_dsp_enable(aw_dev, true);
> +			return ret;
> +		}
> +	} else {
> +		aw_cali_svc_set_cali_cfg(aw_dev, aw_dev->cali_desc.cali_cfg);
> +	}
> +	aw883xx_dev_dsp_enable(aw_dev, true);
> +
> +	return 0;
> +}
> +
> +static int aw_cali_svc_cali_run_dsp_vol(struct aw_device *aw_dev,
> +						int type, bool enable)
> +{
> +	int ret;
> +	uint16_t reg_val = 0;
> +	uint16_t set_vol = 0;
> +	struct aw_dsp_vol_desc *desc = &aw_dev->dsp_vol_desc;
> +
> +	aw_dev_info(aw_dev->dev, "type:%d, enable:%d", type, enable);
> +
> +	if (enable) {
> +		/*set dsp vol*/
> +		if (type == CALI_TYPE_RE) {
> +			set_vol = desc->mute_st;
> +		} else if (type == CALI_TYPE_F0) {
> +			set_vol = desc->noise_st;
> +		} else {
> +			aw_dev_err(aw_dev->dev, "type:%d unsupported", type);
> +			return -EINVAL;
> +		}
> +
> +		ret = aw_dev->ops.aw_reg_read(aw_dev,
> +					desc->reg, &reg_val);
> +		if (ret < 0) {
> +			aw_dev_err(aw_dev->dev, "read reg 0x%x failed", desc->reg);
> +			return ret;
> +		}
> +
> +		aw_dev->cali_desc.store_vol = reg_val & (~desc->mask);
> +		reg_val &= desc->mask;
> +		reg_val |= set_vol;
> +
> +		ret = aw_dev->ops.aw_reg_write(aw_dev,
> +					desc->reg, reg_val);
> +		if (ret < 0) {
> +			aw_dev_err(aw_dev->dev, "write reg 0x%x failed", desc->reg);
> +			return ret;
> +		}
> +	} else {
> +		/*reset dsp vol*/
> +		ret = aw_dev->ops.aw_reg_read(aw_dev,
> +						desc->reg, &reg_val);
> +		if (ret < 0) {
> +			aw_dev_err(aw_dev->dev, "read reg 0x%x failed", desc->reg);
> +			return ret;
> +		}
> +
> +		reg_val &= desc->mask;
> +		reg_val |= aw_dev->cali_desc.store_vol;
> +
> +		ret = aw_dev->ops.aw_reg_write(aw_dev,
> +						desc->reg, reg_val);
> +		if (ret < 0) {
> +			aw_dev_err(aw_dev->dev, "write reg 0x%x failed", desc->reg);
> +			return ret;
> +		}
> +	}
> +
> +	return 0;
> +}
> +
> +static int aw_cali_svc_set_white_noise(struct aw_device *aw_dev,
> +					bool noise_enable)
> +{
> +	int ret;
> +	uint32_t reg_val;
> +	struct aw_noise_desc *desc = &aw_dev->noise_desc;
> +
> +	aw_dev_info(aw_dev->dev, "set noise %s",
> +			(noise_enable == 0) ? ("disable") : ("enable"));
> +
> +	ret = aw_dev->ops.aw_dsp_read(aw_dev,
> +			desc->dsp_reg, &reg_val, desc->data_type);
> +	if (ret < 0) {
> +		aw_dev_err(aw_dev->dev, "read dsp reg 0x%x failed", desc->dsp_reg);
> +		return ret;
> +	}
> +
> +	if (noise_enable)
> +		reg_val |= (~desc->mask);
> +	else
> +		reg_val &= desc->mask;
> +
> +
> +	ret = aw_dev->ops.aw_dsp_write(aw_dev,
> +			desc->dsp_reg, reg_val, desc->data_type);
> +	if (ret < 0) {
> +		aw_dev_err(aw_dev->dev, "write dsp reg 0x%x failed", desc->dsp_reg);
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static int aw_cali_svc_cali_f0_en(struct aw_device *aw_dev, bool f0_enable)
> +{
> +	int ret;
> +	struct aw_cali_delay_desc *desc = &aw_dev->cali_delay_desc;
> +
> +	aw_dev_info(aw_dev->dev, "cali f0 %s",
> +			(f0_enable == 0) ? ("disable") : ("enable"));
> +
> +	if (f0_enable) {
> +		ret = aw_cali_svc_cali_run_dsp_vol(aw_dev, CALI_TYPE_F0, true);
> +		if (ret < 0) {
> +			aw_dev_err(aw_dev->dev, "run dsp volume error, ret=%d", ret);
> +			return ret;
> +		}
> +
> +		msleep(desc->delay);
> +
> +		ret = aw_cali_svc_set_white_noise(aw_dev, true);
> +		if (ret < 0) {
> +			aw_dev_err(aw_dev->dev, "write white noise error, ret=%d", ret);
> +			aw_cali_svc_cali_run_dsp_vol(aw_dev, CALI_TYPE_F0, false);
> +			return ret;
> +		}
> +	} else {
> +		aw_cali_svc_set_white_noise(aw_dev, false);
> +		aw_cali_svc_cali_run_dsp_vol(aw_dev, CALI_TYPE_F0, false);
> +	}
> +
> +	return 0;
> +}
> +
> +static int aw_cali_svc_get_cali_f0_q(struct aw_device *aw_dev)
> +{
> +	int ret = -1;
> +	int cnt = 0;
> +	uint32_t f0 = 0;
> +	uint32_t q = 0;
> +	uint32_t f0_sum = 0;
> +	uint32_t q_sum = 0;
> +	struct aw_cali_desc *cali_desc = &aw_dev->cali_desc;
> +
> +	aw_dev_dbg(aw_dev->dev, "enter");
> +
> +	for (cnt = 0; cnt < F0_READ_CNT_MAX; cnt++) {
> +		/*f0*/
> +		ret = aw_cali_svc_get_dev_f0(aw_dev, &f0);
> +		if (ret < 0)
> +			return ret;
> +		f0_sum += f0;
> +
> +		/*q*/
> +		ret = aw_cali_svc_get_dev_q(aw_dev, &q);
> +		if (ret < 0)
> +			return ret;
> +		q_sum += q;
> +		msleep(30);
> +	}
> +
> +	cali_desc->f0 = f0_sum / cnt;
> +	cali_desc->q = q_sum / cnt;
> +
> +	if (aw_dev->ops.aw_cali_svc_get_iv_st) {
> +		ret = aw_dev->ops.aw_cali_svc_get_iv_st(aw_dev);
> +		if (ret < 0) {
> +			aw_dev_err(aw_dev->dev,
> +				"get iv data failed, set default f0: 2600 q: 2600");
> +			cali_desc->f0 = 2600;
> +			cali_desc->q = 2600;
> +		}
> +	}
> +	aw_dev_info(aw_dev->dev, "f0[%d] q[%d]", cali_desc->f0, cali_desc->q);
> +	return 0;
> +}
> +
> +static int aw_cali_svc_cali_mode_enable(struct aw_device *aw_dev,
> +					int type, unsigned int flag, bool is_enable)
> +{
> +	int ret;
> +
> +	aw_dev_info(aw_dev->dev, "type:%d, flag:0x%x, is_enable:%d",
> +				type, flag, is_enable);
> +
> +	if (is_enable) {
> +		ret = aw_cali_svc_cali_init_check(aw_dev);
> +		if (ret < 0) {
> +			aw_dev_err(aw_dev->dev, "init check failed");
> +			return ret;
> +		}
> +
> +		aw_cali_svc_set_cali_status(aw_dev, true);
> +
> +		ret = aw_cali_svc_cali_en(aw_dev, true);
> +		if (ret < 0) {
> +			aw_cali_svc_set_cali_status(aw_dev, false);
> +			return ret;
> +		}
> +
> +		if ((type == CALI_TYPE_RE) && (flag & CALI_OPS_HMUTE)) {
> +			ret = aw_cali_svc_cali_run_dsp_vol(aw_dev, CALI_TYPE_RE, true);
> +			if (ret < 0) {
> +				aw_cali_svc_cali_en(aw_dev, false);
> +				aw_cali_svc_set_cali_status(aw_dev, false);
> +				return ret;
> +			}
> +		} else if ((type == CALI_TYPE_F0) && (flag & CALI_OPS_NOISE)) {
> +			ret = aw_cali_svc_cali_f0_en(aw_dev, true);
> +			if (ret < 0) {
> +				aw_cali_svc_cali_en(aw_dev, false);
> +				aw_cali_svc_set_cali_status(aw_dev, false);
> +				return ret;
> +			}
> +		}
> +	} else {
> +
> +		if ((type == CALI_TYPE_RE) && (flag & CALI_OPS_HMUTE))
> +			aw_cali_svc_cali_run_dsp_vol(aw_dev, CALI_TYPE_RE, false);
> +		else if ((type == CALI_TYPE_F0) && (flag & CALI_OPS_NOISE))
> +			aw_cali_svc_cali_f0_en(aw_dev, false);
> +
> +		aw_cali_svc_cali_en(aw_dev, false);
> +		aw883xx_dev_clear_int_status(aw_dev);
> +		aw_cali_svc_set_cali_status(aw_dev, false);
> +	}
> +
> +	return 0;
> +}
> +
> +static int aw_cali_svc_devs_cali_mode_enable(struct list_head *dev_list,
> +						int type, unsigned int flag,
> +						bool is_enable)
> +{
> +	int ret;
> +	struct list_head *pos = NULL;
> +	struct aw_device *local_dev = NULL;
> +
> +	list_for_each(pos, dev_list) {
> +		local_dev = container_of(pos, struct aw_device, list_node);
> +		if (is_enable)
> +			aw_cali_svc_run_mute(local_dev, CALI_RESULT_NORMAL);
> +		ret = aw_cali_svc_cali_mode_enable(local_dev, type, flag, is_enable);
> +		if (ret < 0)
> +			return ret;
> +		if (!is_enable && (type == CALI_TYPE_F0))
> +			aw_cali_svc_run_mute(local_dev, local_dev->cali_desc.cali_result);
> +	}
> +
> +	return ret;
> +}
> +
> +static int aw_cali_svc_dev_cali_re(struct aw_device *aw_dev, unsigned int flag)
> +{
> +	int ret;
> +
> +	aw_dev_info(aw_dev->dev, "enter");
> +
> +	aw_cali_svc_run_mute(aw_dev, CALI_RESULT_NORMAL);
> +
> +	ret = aw_cali_svc_cali_mode_enable(aw_dev,
> +				CALI_TYPE_RE, flag, true);
> +	if (ret < 0)
> +		return ret;
> +
> +	msleep(g_cali_re_time);
> +
> +	ret = aw_cali_svc_get_smooth_cali_re(aw_dev);
> +	if (ret < 0)
> +		aw_dev_err(aw_dev->dev, "cali re failed");
> +
> +	aw_cali_svc_cali_mode_enable(aw_dev,
> +				CALI_TYPE_RE, flag, false);
> +
> +	return ret;
> +}
> +
> +static int aw_cali_svc_devs_get_cali_re(struct list_head *dev_list)
> +{
> +	int ret;
> +	struct list_head *pos = NULL;
> +	struct aw_device *local_dev = NULL;
> +
> +	list_for_each(pos, dev_list) {
> +		local_dev = container_of(pos, struct aw_device, list_node);
> +		ret = aw_cali_svc_get_smooth_cali_re(local_dev);
> +		if (ret < 0) {
> +			aw_dev_err(local_dev->dev, "get re failed");
> +			return ret;
> +		}
> +	}
> +
> +	return ret;
> +}
> +
> +static int aw_cali_svc_devs_cali_re(struct aw_device *aw_dev, unsigned int flag)
> +{
> +	int ret;
> +	struct list_head *dev_list = NULL;
> +
> +	aw_dev_info(aw_dev->dev, "enter");
> +
> +	ret = aw883xx_dev_get_list_head(&dev_list);
> +	if (ret) {
> +		aw_dev_err(aw_dev->dev, " get dev list failed");
> +		return ret;
> +	}
> +
> +	ret = aw_cali_svc_devs_cali_mode_enable(dev_list, CALI_TYPE_RE, flag, true);
> +	if (ret < 0)
> +		goto error;
> +
> +	msleep(g_cali_re_time);
> +
> +	ret = aw_cali_svc_devs_get_cali_re(dev_list);
> +	if (ret < 0)
> +		goto error;
> +
> +	aw_cali_svc_devs_cali_mode_enable(dev_list, CALI_TYPE_RE, flag, false);
> +
> +	return 0;
> +
> +error:
> +	aw_cali_svc_devs_cali_mode_enable(dev_list, CALI_TYPE_RE, flag, false);
> +	return ret;
> +}
> +
> +static int aw_cali_svc_cali_re(struct aw_device *aw_dev, bool is_single, unsigned int flag)
> +{
> +	if (is_single)
> +		return aw_cali_svc_dev_cali_re(aw_dev, flag);
> +	else
> +		return aw_cali_svc_devs_cali_re(aw_dev, flag);
> +}
> +
> +static int aw_cali_svc_set_devs_re_str(struct aw_device *aw_dev, const char *re_str)
> +{
> +	struct list_head *dev_list = NULL, *pos = NULL;
> +	struct aw_device *local_dev = NULL;
> +	int ret, cnt = 0;
> +	int re_data[AW_DEV_CH_MAX] = { 0 };
> +	char str_data[32] = { 0 };
> +	int i, len = 0;
> +	int dev_num = 0;
> +
> +	/*get dev list*/
> +	ret = aw883xx_dev_get_list_head(&dev_list);
> +	if (ret < 0) {
> +		aw_dev_err(aw_dev->dev, "get dev list failed");
> +		return ret;
> +	}
> +
> +	dev_num = aw_dev->ops.aw_get_dev_num();
> +
> +	for (i = 0 ; i < dev_num; i++) {
> +		memset(str_data, 0, sizeof(str_data));
> +		snprintf(str_data, sizeof(str_data), "dev[%d]:%s ", i, "%d");
> +		ret = sscanf(re_str + len, str_data, &re_data[i]);
> +		if (ret <= 0) {
> +			aw_dev_err(aw_dev->dev, "unsupported str: %s", re_str);
> +			return -EINVAL;
> +		}
> +		len += snprintf(str_data, sizeof(str_data), "dev[%d]:%d ", i, re_data[i]);
> +		if (len > strlen(re_str)) {
> +			aw_dev_err(aw_dev->dev, "%s: unsupported", re_str);
> +			return -EINVAL;
> +		}
> +	}
> +
> +	list_for_each(pos, dev_list) {
> +		local_dev = container_of(pos, struct aw_device, list_node);
> +		if (local_dev->channel < AW_DEV_CH_MAX) {
> +			ret = aw_cali_store_cali_re(local_dev, re_data[local_dev->channel]);
> +			if (ret < 0) {
> +				aw_dev_err(local_dev->dev, "store cali re failed");
> +				return ret;
> +			}
> +			cnt++;
> +		}
> +	}
> +
> +	return cnt;
> +}
> +
> +static int aw_cali_svc_dev_cali_f0_q(struct aw_device *aw_dev, unsigned int flag)
> +{
> +	int ret;
> +
> +	aw_cali_svc_run_mute(aw_dev, CALI_RESULT_NORMAL);
> +
> +	ret = aw_cali_svc_cali_mode_enable(aw_dev, CALI_TYPE_F0, flag, true);
> +	if (ret < 0)
> +		return ret;
> +
> +	msleep(AW_CALI_F0_TIME);
> +
> +	ret = aw_cali_svc_get_cali_f0_q(aw_dev);
> +	if (ret < 0)
> +		aw_dev_err(aw_dev->dev, "get f0 q failed");
> +
> +	aw_cali_svc_cali_mode_enable(aw_dev, CALI_TYPE_F0, flag, false);
> +
> +	aw_cali_svc_run_mute(aw_dev, aw_dev->cali_desc.cali_result);
> +
> +	return ret;
> +}
> +
> +static int aw_cali_svc_devs_get_cali_f0_q(struct list_head *dev_list)
> +{
> +	int ret;
> +	struct list_head *pos = NULL;
> +	struct aw_device *local_dev = NULL;
> +
> +	list_for_each(pos, dev_list) {
> +		local_dev = container_of(pos, struct aw_device, list_node);
> +		ret = aw_cali_svc_get_cali_f0_q(local_dev);
> +		if (ret < 0) {
> +			aw_dev_err(local_dev->dev, "get f0 q failed");
> +			return ret;
> +		}
> +	}
> +
> +	return ret;
> +}
> +
> +static int aw_cali_svc_devs_cali_f0_q(struct aw_device *aw_dev, unsigned int flag)
> +{
> +	int ret;
> +	struct list_head *dev_list = NULL;
> +
> +	ret = aw883xx_dev_get_list_head(&dev_list);
> +	if (ret) {
> +		aw_dev_err(aw_dev->dev, " get dev list failed");
> +		return ret;
> +	}
> +
> +	ret = aw_cali_svc_devs_cali_mode_enable(dev_list, CALI_TYPE_F0, flag, true);
> +	if (ret < 0)
> +		goto error;
> +
> +	msleep(AW_CALI_F0_TIME);
> +
> +	ret = aw_cali_svc_devs_get_cali_f0_q(dev_list);
> +	if (ret < 0)
> +		goto error;
> +
> +	aw_cali_svc_devs_cali_mode_enable(dev_list, CALI_TYPE_F0, flag, false);
> +
> +	return 0;
> +
> +error:
> +	aw_cali_svc_devs_cali_mode_enable(dev_list, CALI_TYPE_F0, flag, false);
> +	return ret;
> +}
> +
> +static int aw_cali_svc_cali_f0_q(struct aw_device *aw_dev, bool is_single, unsigned int flag)
> +{
> +	if (is_single)
> +		return aw_cali_svc_dev_cali_f0_q(aw_dev, flag);
> +	else
> +		return aw_cali_svc_devs_cali_f0_q(aw_dev, flag);
> +}
> +
> +static int aw_cali_svc_get_dev_cali_val(struct aw_device *aw_dev, int type, uint32_t *data_buf)
> +{
> +	switch (type) {
> +	case GET_RE_TYPE:
> +		*data_buf = aw_dev->cali_desc.cali_re;
> +		break;
> +	case GET_F0_TYPE:
> +		*data_buf = aw_dev->cali_desc.f0;
> +		break;
> +	case GET_Q_TYPE:
> +		*data_buf = aw_dev->cali_desc.q;
> +		break;
> +	default:
> +		aw_dev_err(aw_dev->dev, "type:%d not support", type);
> +		return -EINVAL;
> +	}
> +
> +	return 0;
> +}
> +
> +static int aw_cali_svc_get_devs_cali_val(struct aw_device *aw_dev,
> +										int type,
> +										uint32_t *data_buf,
> +										int num)
> +{
> +	struct list_head *dev_list = NULL;
> +	struct list_head *pos = NULL;
> +	struct aw_device *local_dev = NULL;
> +	int ret, cnt = 0;
> +
> +	/*get dev list*/
> +	ret = aw883xx_dev_get_list_head(&dev_list);
> +	if (ret) {
> +		aw_dev_err(aw_dev->dev, "get dev list failed");
> +		return ret;
> +	}
> +
> +	list_for_each(pos, dev_list) {
> +		local_dev = container_of(pos, struct aw_device, list_node);
> +		if (local_dev->channel < num) {
> +			switch (type) {
> +			case GET_RE_TYPE:
> +				data_buf[local_dev->channel] = local_dev->cali_desc.cali_re;
> +				break;
> +			case GET_F0_TYPE:
> +				data_buf[local_dev->channel] = local_dev->cali_desc.f0;
> +				break;
> +			case GET_Q_TYPE:
> +				data_buf[local_dev->channel] = local_dev->cali_desc.q;
> +				break;
> +			default:
> +				aw_dev_err(local_dev->dev, "type:%d not support", type);
> +				return -EINVAL;
> +			}
> +			cnt++;
> +		} else {
> +			aw_dev_err(local_dev->dev, "channel num[%d] overflow buf num[%d]",
> +						local_dev->channel, num);
> +			return -EINVAL;
> +		}
> +	}
> +
> +	return cnt;
> +}
> +
> +static int aw_cali_svc_cali_re_f0_q(struct aw_device *aw_dev, bool is_single, unsigned int flag)
> +{
> +	int ret;
> +
> +	ret = aw_cali_svc_cali_re(aw_dev, is_single, flag);
> +	if (ret < 0)
> +		return ret;
> +
> +	ret = aw_cali_svc_cali_f0_q(aw_dev, is_single, flag);
> +	if (ret < 0)
> +		return ret;
> +
> +	return 0;
> +}
> +
> +static int aw_cali_svc_cali_cmd(struct aw_device *aw_dev,
> +								int cali_cmd,
> +								bool is_single,
> +								unsigned int flag)
> +{
> +	switch (cali_cmd) {
> +	case AW_CALI_CMD_RE: {
> +		return aw_cali_svc_cali_re(aw_dev, is_single, flag);
> +	} break;
> +	case AW_CALI_CMD_F0:
> +	case AW_CALI_CMD_F0_Q: {
> +		return aw_cali_svc_cali_f0_q(aw_dev, is_single, flag);
> +	} break;
> +	case AW_CALI_CMD_RE_F0:
> +	case AW_CALI_CMD_RE_F0_Q: {
> +		return aw_cali_svc_cali_re_f0_q(aw_dev, is_single, flag);
> +	}
> +	default: {
> +		aw_dev_err(aw_dev->dev, "unsupported cmd %d", cali_cmd);
> +		return -EINVAL;
> +	}
> +	}
> +	return 0;
> +}
> +
> +static int aw_cali_svc_get_cmd_form_str(struct aw_device *aw_dev, const char *buf)
> +{
> +	int i;
> +
> +	for (i = 0; i < CALI_STR_MAX; i++) {
> +		if (!strncmp(cali_str[i], buf, strlen(cali_str[i])))
> +			break;
> +	}
> +
> +	if (i == CALI_STR_MAX) {
> +		aw_dev_err(aw_dev->dev, "supported cmd [%s]!", buf);
> +		return -EINVAL;
> +	}
> +
> +	aw_dev_dbg(aw_dev->dev, "find str [%s]", cali_str[i]);
> +	return i;
> +}
> +
> +/*****************************attr cali***************************************************/
> +static ssize_t aw_cali_attr_time_store(struct device *dev,
> +	struct device_attribute *attr, const char *buf, size_t count)
> +{
> +	int ret;
> +	uint32_t time;
> +	struct aw883xx *aw883xx = dev_get_drvdata(dev);
> +	struct aw_device *aw_dev = aw883xx->aw_pa;
> +
> +	ret = kstrtoint(buf, 0, &time);
> +	if (ret < 0) {
> +		aw_dev_err(aw_dev->dev, "read buf %s failed", buf);
> +		return ret;
> +	}
> +
> +	if (time < 1000) {
> +		aw_dev_err(aw_dev->dev, "time:%d is too short, no set", time);
> +		return -EINVAL;
> +	}
> +
> +	g_cali_re_time = time;
> +	aw_dev_dbg(aw_dev->dev, "time:%u", time);
> +
> +	return count;
> +}
> +
> +static ssize_t aw_cali_attr_time_show(struct device *dev,
> +	struct device_attribute *attr, char *buf)
> +{
> +	ssize_t len = 0;
> +
> +	len += snprintf(buf+len, PAGE_SIZE-len,
> +		"time: %u\n", g_cali_re_time);
> +
> +	return len;
> +}
> +
> +static ssize_t aw_cali_attr_re_store(struct device *dev,
> +	struct device_attribute *attr, const char *buf, size_t count)
> +{
> +	struct aw883xx *aw883xx = dev_get_drvdata(dev);
> +	struct aw_device *aw_dev = aw883xx->aw_pa;
> +	int ret;
> +	int re;
> +
> +	if (is_single_cali) {
> +		ret = kstrtoint(buf, 0, &re);
> +		if (ret < 0) {
> +			aw_dev_err(aw_dev->dev, "read buf %s failed", buf);
> +			return ret;
> +		}
> +
> +		ret = aw_cali_store_cali_re(aw_dev, re);
> +		if (ret < 0) {
> +			aw_dev_err(aw_dev->dev, "store cali re failed!");
> +			return ret;
> +		}
> +	} else {
> +		ret = aw_cali_svc_set_devs_re_str(aw_dev, buf);
> +		if (ret <= 0) {
> +			aw_pr_err("set re str %s failed", buf);
> +			return -EPERM;
> +		}
> +	}
> +
> +	return count;
> +}
> +
> +static ssize_t aw_cali_attr_re_show(struct device *dev,
> +	struct device_attribute *attr, char *buf)
> +{
> +	int ret, i;
> +	struct aw883xx *aw883xx = dev_get_drvdata(dev);
> +	struct aw_device *aw_dev = aw883xx->aw_pa;
> +	ssize_t len = 0;
> +	int32_t re[AW_DEV_CH_MAX] = { 0 };
> +
> +	ret = aw_cali_svc_cali_re(aw_dev, is_single_cali, CALI_OPS_HMUTE);
> +	if (ret < 0) {
> +		aw_dev_err(aw_dev->dev, "cali re failed");
> +		return ret;
> +	}
> +
> +	if (is_single_cali) {
> +		len += snprintf(buf+len, PAGE_SIZE-len, "dev[%d]: %umOhms\n",
> +				aw_dev->channel, aw_dev->cali_desc.cali_re);
> +	} else {
> +		ret = aw_cali_svc_get_devs_cali_val(aw_dev, GET_RE_TYPE, re, AW_DEV_CH_MAX);
> +		if (ret <= 0) {
> +			aw_dev_err(aw_dev->dev, "get re failed");
> +		} else {
> +			for (i = 0; i < ret; i++)
> +				len += snprintf(buf+len, PAGE_SIZE-len,
> +							"dev[%d]: %umOhms ", i, re[i]);
> +
> +			len += snprintf(buf+len, PAGE_SIZE-len, "\n");
> +		}
> +	}
> +
> +	return len;
> +}
> +
> +static ssize_t aw_cali_attr_f0_show(struct device *dev,
> +	struct device_attribute *attr, char *buf)
> +{
> +	int ret, i;
> +	struct aw883xx *aw883xx = dev_get_drvdata(dev);
> +	struct aw_device *aw_dev = aw883xx->aw_pa;
> +	ssize_t len = 0;
> +	uint32_t f0[AW_DEV_CH_MAX] = { 0 };
> +
> +	ret = aw_cali_svc_cali_f0_q(aw_dev, is_single_cali, CALI_OPS_NOISE);
> +	if (ret < 0) {
> +		aw_dev_err(aw_dev->dev, "cali f0 failed");
> +		return ret;
> +	}
> +
> +	if (is_single_cali) {
> +		len += snprintf(buf+len, PAGE_SIZE-len, "dev[%d]:%u Hz\n",
> +				aw_dev->channel, aw_dev->cali_desc.f0);
> +	} else {
> +		ret = aw_cali_svc_get_devs_cali_val(aw_dev, GET_F0_TYPE, f0, AW_DEV_CH_MAX);
> +		if (ret <= 0) {
> +			aw_dev_err(aw_dev->dev, "get re failed");
> +		} else {
> +			for (i = 0; i < ret; i++)
> +				len += snprintf(buf+len, PAGE_SIZE-len, "dev[%d]:%u Hz ", i, f0[i]);
> +
> +			len += snprintf(buf+len, PAGE_SIZE-len, "\n");
> +		}
> +	}
> +
> +	return len;
> +}
> +
> +static ssize_t aw_cali_attr_f0_q_show(struct device *dev,
> +	struct device_attribute *attr, char *buf)
> +{
> +	int ret, i;
> +	struct aw883xx *aw883xx = dev_get_drvdata(dev);
> +	struct aw_device *aw_dev = aw883xx->aw_pa;
> +	ssize_t len = 0;
> +	uint32_t f0[AW_DEV_CH_MAX] = { 0 };
> +	uint32_t q[AW_DEV_CH_MAX] = { 0 };
> +
> +	ret = aw_cali_svc_cali_f0_q(aw_dev, is_single_cali, CALI_OPS_NOISE);
> +	if (ret < 0) {
> +		aw_dev_err(aw_dev->dev, "cali f0 q failed");
> +		return ret;
> +	}
> +
> +	if (is_single_cali) {
> +		len += snprintf(buf+len, PAGE_SIZE-len, "dev[%d]f0:%u Hz q:%u\n",
> +				aw_dev->channel, aw_dev->cali_desc.f0, aw_dev->cali_desc.q);
> +	} else {
> +
> +		ret = aw_cali_svc_get_devs_cali_val(aw_dev, GET_F0_TYPE, f0, AW_DEV_CH_MAX);
> +		if (ret <= 0) {
> +			aw_dev_err(aw_dev->dev, "get f0 failed");
> +			return -EINVAL;
> +		}
> +
> +		ret = aw_cali_svc_get_devs_cali_val(aw_dev, GET_Q_TYPE, q, AW_DEV_CH_MAX);
> +		if (ret <= 0) {
> +			aw_dev_err(aw_dev->dev, "get q failed");
> +			return -EINVAL;
> +		}
> +
> +		for (i = 0; i < ret; i++)
> +			len += snprintf(buf+len, PAGE_SIZE-len, "dev[%d]:f0:%u Hz q:%u ",
> +				i, f0[i], q[i]);
> +
> +		len += snprintf(buf+len, PAGE_SIZE-len, "\n");
> +	}
> +
> +	return len;
> +}
> +
> +static ssize_t aw_re_range_show(struct device *dev,
> +	struct device_attribute *attr, char *buf)
> +{
> +	ssize_t len = 0;
> +	struct aw883xx *aw883xx = dev_get_drvdata(dev);
> +	struct aw_device *aw_dev = aw883xx->aw_pa;
> +	uint32_t range_buf[RE_RANGE_NUM] = { 0 };
> +
> +	aw_cali_svc_get_dev_re_range(aw_dev, range_buf);
> +
> +	len += snprintf(buf + len, PAGE_SIZE - len,
> +		"re_min value: [%d]\n", range_buf[RE_MIN_FLAG]);
> +	len += snprintf(buf + len, PAGE_SIZE - len,
> +		"re_max value: [%d]\n", range_buf[RE_MAX_FLAG]);
> +
> +	return len;
> +}
> +
> +static DEVICE_ATTR(cali_time, 0644,
> +			aw_cali_attr_time_show, aw_cali_attr_time_store);
> +static DEVICE_ATTR(cali_re, 0644,
> +			aw_cali_attr_re_show, aw_cali_attr_re_store);
> +static DEVICE_ATTR(cali_f0, 0444,
> +			aw_cali_attr_f0_show, NULL);
> +static DEVICE_ATTR(cali_f0_q, 0444,
> +			aw_cali_attr_f0_q_show, NULL);
> +static DEVICE_ATTR(re_range, 0444,
> +			aw_re_range_show, NULL);
> +
> +static struct attribute *aw_cali_attr[] = {
> +	&dev_attr_cali_time.attr,
> +	&dev_attr_cali_re.attr,
> +	&dev_attr_cali_f0.attr,
> +	&dev_attr_cali_f0_q.attr,
> +	&dev_attr_re_range.attr,
> +	NULL
> +};
> +
> +static struct attribute_group aw_cali_attr_group = {
> +	.attrs = aw_cali_attr,
> +	NULL
> +};
> +
> +static void aw_cali_attr_init(struct aw_device *aw_dev)
> +{
> +	int ret;
> +
> +	ret = sysfs_create_group(&aw_dev->dev->kobj, &aw_cali_attr_group);
> +	if (ret < 0)
> +		aw_dev_info(aw_dev->dev, "error creating sysfs cali attr files");
> +}
> +
> +static void aw_cali_attr_deinit(struct aw_device *aw_dev)
> +{
> +	sysfs_remove_group(&aw_dev->dev->kobj, &aw_cali_attr_group);
> +	aw_dev_info(aw_dev->dev, "attr files deinit");
> +}
> +
> +
> +
> +
> +/*****************************class node******************************************************/
> +static ssize_t aw_cali_class_time_show(struct class *class, struct class_attribute *attr, char *buf)
> +{
> +	ssize_t len = 0;
> +
> +	len += snprintf(buf+len, PAGE_SIZE-len,
> +		"time: %d\n", g_cali_re_time);
> +
> +	return len;
> +}
> +
> +static ssize_t aw_cali_class_time_store(struct class *class,
> +					struct class_attribute *attr, const char *buf, size_t len)
> +{
> +	int ret;
> +	uint32_t time;
> +
> +	ret = kstrtoint(buf, 0, &time);
> +	if (ret < 0) {
> +		aw_pr_err("read buf %s failed", buf);
> +		return ret;
> +	}
> +
> +	if (time < 1000) {
> +		aw_pr_err("time:%d is too short, no set", time);
> +		return -EINVAL;
> +	}
> +
> +	g_cali_re_time = time;
> +	aw_pr_dbg("time:%d", time);
> +
> +	return len;
> +}
> +
> +static ssize_t aw_cali_class_cali_re_show(struct  class *class,
> +					struct class_attribute *attr,
> +					char *buf)
> +{
> +	struct list_head *dev_list;
> +	struct aw_device *local_dev;
> +	int ret, i;
> +	ssize_t len = 0;
> +	uint32_t cali_re[AW_DEV_CH_MAX] = { 0 };
> +
> +	aw_pr_info("enter");
> +
> +	ret = aw883xx_dev_get_list_head(&dev_list);
> +	if (ret) {
> +		aw_pr_err("get dev list failed");
> +		return ret;
> +	}
> +
> +	local_dev = list_first_entry(dev_list, struct aw_device, list_node);
> +
> +	ret = aw_cali_svc_cali_re(local_dev, false, CALI_OPS_HMUTE);
> +	if (ret < 0)
> +		return ret;
> +
> +	ret = aw_cali_svc_get_devs_cali_val(local_dev, GET_RE_TYPE, cali_re, AW_DEV_CH_MAX);
> +	if (ret <= 0) {
> +		aw_dev_err(local_dev->dev, "get re failed");
> +	} else {
> +		for (i = 0; i < ret; i++)
> +			len += snprintf(buf+len, PAGE_SIZE-len, "dev[%d]:%u mOhms ", i, cali_re[i]);
> +
> +		len += snprintf(buf+len, PAGE_SIZE-len, "\n");
> +	}
> +
> +	return len;
> +}
> +
> +static ssize_t aw_cali_class_cali_re_store(struct class *class,
> +					struct class_attribute *attr, const char *buf, size_t len)
> +{
> +	struct list_head *dev_list = NULL;
> +	struct aw_device *local_dev = NULL;
> +	int ret;
> +
> +	ret = aw883xx_dev_get_list_head(&dev_list);
> +	if (ret) {
> +		aw_pr_err("get dev list failed");
> +		return ret;
> +	}
> +
> +	local_dev = list_first_entry(dev_list, struct aw_device, list_node);
> +
> +	ret = aw_cali_svc_set_devs_re_str(local_dev, buf);
> +	if (ret <= 0) {
> +		aw_pr_err("set re str %s failed", buf);
> +		return -EPERM;
> +	}
> +
> +	return len;
> +}
> +
> +static ssize_t aw_cali_class_cali_f0_show(struct  class *class,
> +					struct class_attribute *attr, char *buf)
> +{
> +	struct list_head *dev_list = NULL;
> +	struct aw_device *local_dev = NULL;
> +	int ret = -1;
> +	int i = 0;
> +	ssize_t len = 0;
> +	uint32_t f0[AW_DEV_CH_MAX] = { 0 };
> +
> +	aw_pr_info("enter");
> +
> +	ret = aw883xx_dev_get_list_head(&dev_list);
> +	if (ret < 0) {
> +		aw_pr_err("get dev list failed");
> +		return ret;
> +	}
> +
> +	local_dev = list_first_entry(dev_list, struct aw_device, list_node);
> +
> +	ret = aw_cali_svc_cali_f0_q(local_dev, is_single_cali, CALI_OPS_NOISE);
> +	if (ret < 0) {
> +		aw_pr_err("cali f0 failed");
> +		return ret;
> +	}
> +
> +	ret = aw_cali_svc_get_devs_cali_val(local_dev, GET_F0_TYPE, f0, AW_DEV_CH_MAX);
> +	if (ret <= 0) {
> +		aw_pr_err("get f0 failed");
> +	} else {
> +		for (i = 0; i < ret; i++)
> +			len += snprintf(buf+len, PAGE_SIZE-len, "dev[%d]:%u Hz ",
> +					i, f0[i]);
> +
> +		len += snprintf(buf+len, PAGE_SIZE-len, "\n");
> +	}
> +
> +	return len;
> +}
> +
> +static ssize_t aw_cali_class_cali_f0_q_show(struct  class *class,
> +							struct class_attribute *attr,
> +							char *buf)
> +{
> +	struct list_head *dev_list = NULL;
> +	struct aw_device *local_dev = NULL;
> +	int ret, i;
> +	ssize_t len = 0;
> +	uint32_t f0[AW_DEV_CH_MAX] = { 0 };
> +	uint32_t q[AW_DEV_CH_MAX] = { 0 };
> +
> +	aw_pr_info("enter");
> +
> +	ret = aw883xx_dev_get_list_head(&dev_list);
> +	if (ret < 0) {
> +		aw_pr_err("get dev list failed");
> +		return ret;
> +	}
> +
> +	local_dev = list_first_entry(dev_list, struct aw_device, list_node);
> +
> +	ret = aw_cali_svc_cali_f0_q(local_dev, is_single_cali, CALI_OPS_NOISE);
> +	if (ret < 0) {
> +		aw_dev_err(local_dev->dev, "cali f0 q failed");
> +		return ret;
> +	}
> +
> +	ret = aw_cali_svc_get_devs_cali_val(local_dev, GET_F0_TYPE, f0, AW_DEV_CH_MAX);
> +	if (ret <= 0) {
> +		aw_dev_err(local_dev->dev, "get f0 failed");
> +		return -EINVAL;
> +	}
> +
> +	ret = aw_cali_svc_get_devs_cali_val(local_dev, GET_Q_TYPE, q, AW_DEV_CH_MAX);
> +	if (ret <= 0) {
> +		aw_dev_err(local_dev->dev, "get q failed");
> +		return -EINVAL;
> +	}
> +
> +	for (i = 0; i < ret; i++)
> +		len += snprintf(buf+len, PAGE_SIZE-len, "dev[%d]:f0:%u Hz q:%u ",
> +			i, f0[i], q[i]);
> +
> +	len += snprintf(buf+len, PAGE_SIZE-len, "\n");
> +
> +	return len;
> +}
> +
> +static ssize_t aw_class_re_range_show(struct  class *class, struct class_attribute *attr, char *buf)
> +{
> +	int ret, i;
> +	ssize_t len = 0;
> +	struct list_head *dev_list = NULL;
> +	struct aw_device *local_dev = NULL;
> +	uint32_t re_value[AW_DEV_RE_RANGE] = { 0 };
> +
> +	aw_pr_info("enter");
> +
> +	ret = aw883xx_dev_get_list_head(&dev_list);
> +	if (ret < 0) {
> +		aw_pr_err("get dev list failed");
> +		return ret;
> +	}
> +
> +	local_dev = list_first_entry(dev_list, struct aw_device, list_node);
> +	ret = aw_cali_svc_get_devs_re_range(local_dev, re_value, AW_DEV_CH_MAX);
> +	if (ret <= 0) {
> +		aw_dev_err(local_dev->dev, "get re range failed");
> +		return -EINVAL;
> +	}
> +
> +	for (i = 0; i < ret; i++) {
> +		len += snprintf(buf+len, PAGE_SIZE-len, "dev[%d]:re_min:%d re_max:%d ",
> +			i, re_value[RE_MIN_FLAG + i * RE_RANGE_NUM],
> +			re_value[RE_MAX_FLAG + i * RE_RANGE_NUM]);
> +	}
> +	len += snprintf(buf+len, PAGE_SIZE-len, "\n");
> +
> +	return len;
> +}
> +
> +static struct class_attribute class_attr_cali_time =
> +		__ATTR(cali_time, 0644,
> +		aw_cali_class_time_show, aw_cali_class_time_store);
> +
> +static struct class_attribute class_attr_re25_calib =
> +		__ATTR(re25_calib, 0644,
> +		aw_cali_class_cali_re_show, aw_cali_class_cali_re_store);
> +
> +static struct class_attribute class_attr_f0_calib =
> +		__ATTR(f0_calib, 0444,
> +		aw_cali_class_cali_f0_show, NULL);
> +
> +static struct class_attribute class_attr_f0_q_calib =
> +		__ATTR(f0_q_calib, 0444,
> +		aw_cali_class_cali_f0_q_show, NULL);
> +
> +static struct class_attribute class_att_re_range =
> +		__ATTR(re_range, 0444,
> +		aw_class_re_range_show, NULL);
> +
> +static struct class aw_cali_class = {
> +	.name = "smartpa",
> +	.owner = THIS_MODULE,
> +};
> +
> +static void aw_cali_class_attr_init(struct aw_device *aw_dev)
> +{
> +	int ret;
> +
> +	if (aw_dev->channel != 0) {
> +		aw_dev_err(aw_dev->dev, "class node already register");
> +		return;
> +	}
> +
> +	ret = class_register(&aw_cali_class);
> +	if (ret < 0) {
> +		aw_dev_err(aw_dev->dev, "error creating class node");
> +		return;
> +	}
> +
> +	ret = class_create_file(&aw_cali_class, &class_attr_cali_time);
> +	if (ret)
> +		aw_dev_err(aw_dev->dev, "creat class_attr_cali_time fail");
> +
> +	ret = class_create_file(&aw_cali_class, &class_attr_re25_calib);
> +	if (ret)
> +		aw_dev_err(aw_dev->dev, "creat class_attr_re25_calib fail");
> +
> +	ret = class_create_file(&aw_cali_class, &class_attr_f0_calib);
> +	if (ret)
> +		aw_dev_err(aw_dev->dev, "creat class_attr_f0_calib fail");
> +
> +
> +	ret = class_create_file(&aw_cali_class, &class_attr_f0_q_calib);
> +	if (ret)
> +		aw_dev_err(aw_dev->dev, "creat class_attr_f0_q_calib fail");
> +
> +	ret = class_create_file(&aw_cali_class, &class_att_re_range);
> +	if (ret)
> +		aw_dev_err(aw_dev->dev, "creat class_att_re_range fail");
> +}
> +
> +static void aw_cali_class_attr_deinit(struct aw_device *aw_dev)
> +{
> +	class_remove_file(&aw_cali_class, &class_att_re_range);
> +	class_remove_file(&aw_cali_class, &class_attr_f0_q_calib);
> +	class_remove_file(&aw_cali_class, &class_attr_f0_calib);
> +	class_remove_file(&aw_cali_class, &class_attr_re25_calib);
> +	class_remove_file(&aw_cali_class, &class_attr_cali_time);
> +
> +	class_unregister(&aw_cali_class);
> +	aw_dev_info(aw_dev->dev, "unregister class node");
> +}
> +/*****************************class node******************************************************/
> +
> +
> +/*****************************misc cali******************************************************/
> +static int aw_cali_misc_open(struct inode *inode, struct file *file)
> +{
> +	struct list_head *dev_list = NULL;
> +	struct list_head *pos = NULL;
> +	struct aw_device *local_dev = NULL;
> +	int ret;
> +
> +	aw_pr_dbg("misc open success");
> +
> +	ret = aw883xx_dev_get_list_head(&dev_list);
> +	if (ret) {
> +		aw_pr_err("get dev list failed");
> +		file->private_data = NULL;
> +		return -EINVAL;
> +	}
> +
> +	//find select dev
> +	list_for_each(pos, dev_list) {
> +		local_dev = container_of(pos, struct aw_device, list_node);
> +		if (local_dev->channel == g_dev_select)
> +			break;
> +	}
> +
> +	if (local_dev == NULL) {
> +		aw_pr_err("get dev failed");
> +		return -EINVAL;
> +	}
> +
> +	//cannot find sel dev, use list first dev
> +	if (local_dev->channel != g_dev_select) {
> +		local_dev = list_first_entry(dev_list, struct aw_device, list_node);
> +		aw_dev_dbg(local_dev->dev, "can not find dev[%d], use default", g_dev_select);
> +	}
> +
> +	file->private_data = (void *)local_dev;
> +
> +	aw_dev_dbg(local_dev->dev, "misc open success");
> +
> +	return 0;
> +}
> +
> +static int aw_cali_misc_release(struct inode *inode, struct file *file)
> +{
> +	file->private_data = (void *)NULL;
> +
> +	aw_pr_dbg("misc release success");
> +
> +	return 0;
> +}
> +
> +static int aw_cali_misc_ops_write(struct aw_device *aw_dev,
> +			unsigned int cmd, unsigned long arg)
> +{
> +
> +	unsigned int data_len = _IOC_SIZE(cmd);
> +	char *data_ptr = NULL;
> +	int ret = 0;
> +
> +	data_ptr = devm_kzalloc(aw_dev->dev, data_len, GFP_KERNEL);
> +	if (!data_ptr)
> +		return -ENOMEM;
> +	if (copy_from_user(data_ptr, (void __user *)arg, data_len)) {
> +		ret = -EFAULT;
> +		goto exit;
> +	}
> +
> +	switch (cmd) {
> +		case AW_IOCTL_SET_CALI_RE: {
> +			aw_cali_store_cali_re(aw_dev, *((int32_t *)data_ptr));
> +		} break;
> +		default:{
> +			aw_dev_err(aw_dev->dev, "unsupported  cmd %d", cmd);
> +			ret = -EINVAL;
> +		} break;
> +	}
> +
> +exit:
> +	devm_kfree(aw_dev->dev, data_ptr);
> +	data_ptr = NULL;
> +	return ret;
> +}
> +
> +static int aw_cali_misc_ops_read(struct aw_device *aw_dev,
> +			unsigned int cmd, unsigned long arg)
> +{
> +
> +	int16_t data_len = _IOC_SIZE(cmd);
> +	char *data_ptr = NULL;
> +	int32_t *data_32_ptr = NULL;
> +	int ret = 0;
> +
> +	data_ptr = devm_kzalloc(aw_dev->dev, data_len, GFP_KERNEL);
> +	if (!data_ptr)
> +		return -ENOMEM;
> +
> +	data_32_ptr = (int32_t *)data_ptr;
> +	switch (cmd) {
> +		case AW_IOCTL_GET_RE: {
> +			ret = aw_cali_svc_dev_cali_re(aw_dev, CALI_OPS_HMUTE);
> +			if (ret < 0)
> +				goto exit;
> +
> +			ret = aw_cali_svc_get_dev_cali_val(aw_dev, GET_RE_TYPE, data_32_ptr);
> +		} break;
> +		case AW_IOCTL_GET_CALI_F0: {
> +			ret = aw_cali_svc_dev_cali_f0_q(aw_dev, CALI_OPS_NOISE);
> +			if (ret < 0)
> +				goto exit;
> +
> +			ret = aw_cali_svc_get_dev_cali_val(aw_dev, GET_F0_TYPE, data_32_ptr);
> +		} break;
> +		case AW_IOCTL_GET_F0: {
> +			ret = aw_cali_svc_get_dev_f0(aw_dev, data_32_ptr);
> +		} break;
> +		case AW_IOCTL_GET_TE: {
> +			ret = aw883xx_cali_svc_get_dev_te(&aw_dev->cali_desc, data_32_ptr);
> +		} break;
> +		case AW_IOCTL_GET_REAL_R0: {
> +			ret = aw_cali_svc_get_dev_realtime_re(aw_dev, data_32_ptr);
> +		} break;
> +		case AW_IOCTL_GET_RE_RANGE: {
> +			ret = aw_cali_svc_get_dev_re_range(aw_dev, data_32_ptr);
> +		} break;
> +		default:{
> +			aw_dev_err(aw_dev->dev, "unsupported  cmd %d", cmd);
> +			ret = -EINVAL;
> +		} break;
> +	}
> +
> +exit:
> +	if (copy_to_user((void __user *)arg,
> +		data_ptr, data_len)) {
> +		ret = -EFAULT;
> +	}
> +
> +	devm_kfree(aw_dev->dev, data_ptr);
> +	data_ptr = NULL;
> +	return ret;
> +}
> +
> +static int aw_cali_misc_ops(struct aw_device *aw_dev,
> +			unsigned int cmd, unsigned long arg)
> +{
> +	int ret = 0;
> +
> +	switch (cmd) {
> +	case AW_IOCTL_SET_CALI_RE:
> +		return aw_cali_misc_ops_write(aw_dev, cmd, arg);
> +	case AW_IOCTL_GET_F0:
> +	case AW_IOCTL_GET_CALI_F0:
> +	case AW_IOCTL_GET_RE:
> +	case AW_IOCTL_GET_REAL_R0:
> +	case AW_IOCTL_GET_TE:
> +	case AW_IOCTL_GET_RE_RANGE:
> +		return aw_cali_misc_ops_read(aw_dev, cmd, arg);
> +	default:
> +		aw_dev_err(aw_dev->dev, "unsupported  cmd %d", cmd);
> +		ret = -EINVAL;
> +		break;
> +	}
> +
> +	return ret;
> +}
> +
> +static long aw_cali_misc_unlocked_ioctl(struct file *file,
> +			unsigned int cmd, unsigned long arg)
> +{
> +	int ret = 0;
> +	struct aw_device *aw_dev = NULL;
> +
> +	if (((_IOC_TYPE(cmd)) != (AW_IOCTL_MAGIC))) {
> +		aw_pr_err(" cmd magic err");
> +		return -EINVAL;
> +	}
> +	aw_dev = (struct aw_device *)file->private_data;
> +	ret = aw_cali_misc_ops(aw_dev, cmd, arg);
> +	if (ret < 0)
> +		return -EINVAL;
> +	return 0;
> +}
> +
> +#ifdef CONFIG_COMPAT
> +static long aw_cali_misc_compat_ioctl(struct file *file,
> +	unsigned int cmd, unsigned long arg)
> +{
> +	int ret = 0;
> +	struct aw_device *aw_dev = NULL;
> +
> +	if (((_IOC_TYPE(cmd)) != (AW_IOCTL_MAGIC))) {
> +		aw_pr_err("cmd magic err");
> +		return -EINVAL;
> +	}
> +	aw_dev = (struct aw_device *)file->private_data;
> +	ret = aw_cali_misc_ops(aw_dev, cmd, arg);
> +	if (ret < 0)
> +		return -EINVAL;
> +
> +
> +	return 0;
> +}
> +#endif
> +
> +static ssize_t aw_cali_misc_read(struct file *filp, char __user *buf, size_t size, loff_t *pos)
> +{
> +	int len = 0;
> +	int i, ret;
> +	struct aw_device *aw_dev = (struct aw_device *)filp->private_data;
> +	char local_buf[512] = { 0 };
> +	uint32_t temp_data[AW_DEV_CH_MAX] = { 0 };
> +	uint32_t re_value[AW_DEV_RE_RANGE] = { 0 };
> +
> +	aw_dev_info(aw_dev->dev, "enter");
> +
> +	if (*pos) {
> +		*pos = 0;
> +		return 0;
> +	}
> +
> +	switch (g_msic_wr_flag) {
> +	case CALI_STR_SHOW_RE: {
> +		ret = aw_cali_svc_get_devs_cali_val(aw_dev, GET_RE_TYPE, temp_data, AW_DEV_CH_MAX);
> +		if (ret > 0) {
> +			for (i = 0; i < ret; i++)
> +				len += snprintf(local_buf+len,
> +								sizeof(local_buf)-len,
> +								"dev[%d]:%u ",
> +								i, temp_data[i]);
> +
> +			len += snprintf(local_buf+len, sizeof(local_buf)-len, "\n");
> +		} else {
> +			aw_dev_err(aw_dev->dev, "get re failed");
> +			return -EINVAL;
> +		}
> +	} break;
> +	case CALI_STR_SHOW_R0: {
> +		ret = aw_cali_svc_get_devs_r0(aw_dev, temp_data, AW_DEV_CH_MAX);
> +		if (ret > 0) {
> +			for (i = 0; i < ret; i++)
> +				len += snprintf(local_buf+len, sizeof(local_buf)-len,
> +							"dev[%d]:%d ", i, temp_data[i]);
> +			len += snprintf(local_buf+len, sizeof(local_buf)-len, "\n");
> +		} else {
> +			aw_dev_err(aw_dev->dev, "get r0 failed");
> +			return -EINVAL;
> +		}
> +	} break;
> +	case CALI_STR_SHOW_CALI_F0: {
> +		ret = aw_cali_svc_get_devs_cali_val(aw_dev, GET_F0_TYPE, temp_data, AW_DEV_CH_MAX);
> +		if (ret > 0) {
> +			for (i = 0; i < ret; i++)
> +				len += snprintf(local_buf+len, sizeof(local_buf)-len,
> +							"dev[%d]:%d ", i, temp_data[i]);
> +
> +			len += snprintf(local_buf+len, sizeof(local_buf)-len, "\n");
> +		} else {
> +			aw_dev_err(aw_dev->dev, "get cali f0 failed");
> +			return -EINVAL;
> +		}
> +	} break;
> +	case CALI_STR_SHOW_F0: {
> +		ret = aw_cali_svc_get_devs_f0(aw_dev, temp_data, AW_DEV_CH_MAX);
> +		if (ret > 0) {
> +			for (i = 0; i < ret; i++)
> +				len += snprintf(local_buf+len, sizeof(local_buf)-len,
> +							"dev[%d]:%d ", i, temp_data[i]);
> +
> +			len += snprintf(local_buf+len, sizeof(local_buf) - len, "\n");
> +		} else {
> +			aw_dev_err(aw_dev->dev, "get f0 failed");
> +			return -EINVAL;
> +		}
> +	} break;
> +	case CALI_STR_SHOW_TE: {
> +		ret = aw_cali_svc_get_devs_te(aw_dev, temp_data, AW_DEV_CH_MAX);
> +		if (ret > 0) {
> +			for (i = 0; i < ret; i++)
> +				len += snprintf(local_buf+len, sizeof(local_buf)-len,
> +							"dev[%d]:%d ", i, temp_data[i]);
> +			len += snprintf(local_buf+len, sizeof(local_buf)-len, "\n");
> +		} else {
> +			aw_dev_err(aw_dev->dev, "get te failed");
> +			return -EINVAL;
> +		}
> +	} break;
> +	case CALI_STR_VER: {
> +		if (aw_dev->ops.aw_get_version) {
> +			len = aw_dev->ops.aw_get_version(local_buf, sizeof(local_buf));
> +			if (len < 0) {
> +				aw_dev_err(aw_dev->dev, "get version failed");
> +				return -EINVAL;
> +			}
> +			len += snprintf(local_buf+len, sizeof(local_buf) - len, "\n");
> +		} else {
> +			aw_dev_err(aw_dev->dev, "get version is NULL");
> +			return -EINVAL;
> +		}
> +	} break;
> +	case CALI_STR_SHOW_RE_RANGE: {
> +		ret = aw_cali_svc_get_devs_re_range(aw_dev, re_value, AW_DEV_CH_MAX);
> +		if (ret > 0) {
> +			for (i = 0; i < ret; i++) {
> +				len += snprintf(local_buf+len, sizeof(local_buf)-len,
> +					"dev[%d]:re_min:%d re_max:%d\n",
> +					i, re_value[RE_MIN_FLAG + i * RE_RANGE_NUM],
> +					re_value[RE_MAX_FLAG + i * RE_RANGE_NUM]);
> +			}
> +		} else {
> +			aw_dev_err(aw_dev->dev, "get re range failed");
> +			return -EINVAL;
> +		}
> +	} break;
> +	default: {
> +		if (g_msic_wr_flag == CALI_STR_NONE) {
> +			aw_dev_info(aw_dev->dev, "please write cmd first");
> +		} else {
> +			aw_dev_err(aw_dev->dev, "unsupported flag [%d]", g_msic_wr_flag);
> +			g_msic_wr_flag = CALI_STR_NONE;
> +			return -EINVAL;
> +		}
> +		return -EINVAL;
> +	} break;
> +	}
> +
> +	if (copy_to_user((void __user *)buf, local_buf, len)) {
> +		aw_dev_err(aw_dev->dev, "copy_to_user error");
> +		g_msic_wr_flag = CALI_STR_NONE;
> +		return -EFAULT;
> +	}
> +
> +	g_msic_wr_flag = CALI_STR_NONE;
> +	*pos += len;
> +	return len;
> +
> +}
> +
> +static int aw_cali_misc_switch_dev(struct file *filp, struct aw_device *aw_dev, char *cmd_buf)
> +{
> +	int dev_select_num;
> +	struct list_head *dev_list = NULL;
> +	struct list_head *pos = NULL;
> +	struct aw_device *local_dev = NULL;
> +	int ret;
> +
> +	if (cmd_buf == NULL) {
> +		aw_dev_err(aw_dev->dev, "cmd_buf is NULL");
> +		return -EINVAL;
> +	}
> +
> +	/*get sel dev str*/
> +	sscanf(cmd_buf, "dev_sel:dev[%d]", &dev_select_num);
> +
> +	if (dev_select_num >= AW_DEV_CH_MAX) {
> +		aw_dev_err(aw_dev->dev, "unsupport str [%s]", cmd_buf);
> +		return -EINVAL;
> +	}
> +
> +	/*get dev list*/
> +	ret = aw883xx_dev_get_list_head(&dev_list);
> +	if (ret) {
> +		aw_dev_err(aw_dev->dev, "get dev list failed");
> +		return ret;
> +	}
> +
> +	/*find sel dev*/
> +	list_for_each(pos, dev_list) {
> +		local_dev = container_of(pos, struct aw_device, list_node);
> +		if (local_dev->channel == dev_select_num) {
> +			filp->private_data = (void *)local_dev;
> +			g_dev_select = dev_select_num;
> +			aw_dev_info(local_dev->dev, "switch to dev[%d]", dev_select_num);
> +			return 0;
> +		}
> +	}
> +	aw_dev_err(aw_dev->dev, " unsupport [%s]", cmd_buf);
> +	return -EINVAL;
> +}
> +
> +static ssize_t aw_cali_misc_write(struct file *filp,
> +								const char __user *buf,
> +								size_t size, loff_t *pos)
> +{
> +	char *kernel_buf = NULL;
> +	struct aw_device *aw_dev = (struct aw_device *)filp->private_data;
> +	int ret = 0;
> +
> +	aw_dev_info(aw_dev->dev, "enter, write size:%d", (int)size);
> +	kernel_buf = kzalloc(size + 1, GFP_KERNEL);
> +	if (kernel_buf == NULL) {
> +		aw_dev_err(aw_dev->dev, "kzalloc failed !");
> +		return -ENOMEM;
> +	}
> +
> +	if (copy_from_user(kernel_buf,
> +			(void __user *)buf,
> +			size)) {
> +		ret = -EFAULT;
> +		goto exit;
> +	}
> +
> +	ret = aw_cali_svc_get_cmd_form_str(aw_dev, kernel_buf);
> +	if (ret < 0) {
> +		aw_dev_err(aw_dev->dev, "upported cmd [%s]!", kernel_buf);
> +		ret = -EINVAL;
> +		goto exit;
> +	}
> +
> +	switch (ret) {
> +	case CALI_STR_CALI_RE_F0: {
> +		ret = aw_cali_svc_cali_cmd(aw_dev, AW_CALI_CMD_RE_F0,
> +					is_single_cali, CALI_OPS_HMUTE|CALI_OPS_NOISE);
> +	} break;
> +	case CALI_STR_CALI_RE: {
> +		ret = aw_cali_svc_cali_cmd(aw_dev, AW_CALI_CMD_RE,
> +					is_single_cali, CALI_OPS_HMUTE);
> +	} break;
> +	case CALI_STR_CALI_F0: {
> +		ret = aw_cali_svc_cali_cmd(aw_dev, AW_CALI_CMD_F0,
> +					is_single_cali, CALI_OPS_HMUTE|CALI_OPS_NOISE);
> +	} break;
> +	case CALI_STR_SET_RE: {
> +		/*skip store_re*/
> +		kernel_buf[size] = '\0';
> +		ret = aw_cali_svc_set_devs_re_str(aw_dev,
> +				kernel_buf + strlen(cali_str[CALI_STR_SET_RE]) + 1);
> +	} break;
> +	case CALI_STR_DEV_SEL: {
> +		ret = aw_cali_misc_switch_dev(filp, aw_dev, kernel_buf);
> +	} break;
> +	case CALI_STR_SHOW_RE:			/*show cali_re*/
> +	case CALI_STR_SHOW_R0:			/*show real r0*/
> +	case CALI_STR_SHOW_CALI_F0:		/*GET DEV CALI_F0*/
> +	case CALI_STR_SHOW_F0:			/*SHOW REAL F0*/
> +	case CALI_STR_SHOW_TE:
> +	case CALI_STR_VER:
> +	case CALI_STR_SHOW_RE_RANGE: {
> +		g_msic_wr_flag = ret;
> +		ret = 0;
> +	} break;
> +	default: {
> +		aw_dev_err(aw_dev->dev, "unsupported [%s]!", kernel_buf);
> +		ret = -EINVAL;
> +	} break;
> +	};
> +
> +exit:
> +	aw_dev_dbg(aw_dev->dev, "cmd [%s]!", kernel_buf);
> +	kfree(kernel_buf);
> +	kernel_buf = NULL;
> +
> +	if (ret < 0)
> +		return -EINVAL;
> +	else
> +		return size;
> +}
> +
> +static const struct file_operations aw_cali_misc_fops = {
> +	.owner = THIS_MODULE,
> +	.open = aw_cali_misc_open,
> +	.read = aw_cali_misc_read,
> +	.write = aw_cali_misc_write,
> +	.release = aw_cali_misc_release,
> +	.unlocked_ioctl = aw_cali_misc_unlocked_ioctl,
> +#ifdef CONFIG_COMPAT
> +	.compat_ioctl = aw_cali_misc_compat_ioctl,
> +#endif
> +};
> +
> +static struct miscdevice misc_cali = {
> +	.name = "aw_smartpa",
> +	.minor = MISC_DYNAMIC_MINOR,
> +	.fops  = &aw_cali_misc_fops,
> +};
> +
> +static int aw_cali_misc_init(struct aw_device *aw_dev)
> +{
> +	int ret;
> +
> +	mutex_lock(&g_cali_lock);
> +	if (g_misc_dev == NULL) {
> +		ret = misc_register(&misc_cali);
> +		if (ret) {
> +			aw_dev_err(aw_dev->dev, "misc register fail: %d\n", ret);
> +			mutex_unlock(&g_cali_lock);
> +			return -EINVAL;
> +		}
> +		g_misc_dev = &misc_cali;
> +		aw_dev_dbg(aw_dev->dev, "misc register success");
> +	} else {
> +		aw_dev_dbg(aw_dev->dev, "misc already register");
> +	}
> +	mutex_unlock(&g_cali_lock);
> +
> +	return 0;
> +}
> +
> +static void aw_cali_misc_deinit(struct aw_device *aw_dev)
> +{
> +	mutex_lock(&g_cali_lock);
> +	if (g_misc_dev) {
> +		misc_deregister(g_misc_dev);
> +		g_misc_dev = NULL;
> +	}
> +	mutex_unlock(&g_cali_lock);
> +	aw_dev_dbg(aw_dev->dev, " misc unregister done");
> +}
> +/*****************************misc cali******************************************************/
> +
> +static void aw_cali_parse_dt(struct aw_device *aw_dev)
> +{
> +	struct device_node *np = aw_dev->dev->of_node;
> +	int ret = -1;
> +	uint32_t cali_check = CALI_CHECK_DISABLE;
> +	struct aw_cali_desc *desc = &aw_dev->cali_desc;
> +
> +	ret = of_property_read_u32(np, "aw-cali-check", &cali_check);
> +	if (ret < 0) {
> +		aw_dev_info(aw_dev->dev, " cali-check get failed ,default turn off");
> +		cali_check = CALI_CHECK_DISABLE;
> +	}
> +
> +	desc->cali_check_st = cali_check;
> +	aw_dev_info(aw_dev->dev, "cali check :%s",
> +			(desc->cali_check_st) ? "enable" : "disable");
> +}
> +
> +void aw883xx_cali_init(struct aw_cali_desc *cali_desc)
> +{
> +	struct aw_device *aw_dev =
> +		container_of(cali_desc, struct aw_device, cali_desc);
> +
> +	memset(cali_desc, 0, sizeof(struct aw_cali_desc));
> +
> +	aw_cali_parse_dt(aw_dev);
> +
> +	aw_cali_attr_init(aw_dev);
> +
> +	aw_cali_class_attr_init(aw_dev);
> +
> +	aw_cali_misc_init(aw_dev);
> +
> +	cali_desc->cali_result = CALI_RESULT_NONE;
> +}
> +
> +void aw883xx_cali_deinit(struct aw_cali_desc *cali_desc)
> +{
> +	struct aw_device *aw_dev =
> +		container_of(cali_desc, struct aw_device, cali_desc);
> +
> +	aw_cali_attr_deinit(aw_dev);
> +
> +	aw_cali_class_attr_deinit(aw_dev);
> +
> +	aw_cali_misc_deinit(aw_dev);
> +}
> diff --git a/sound/soc/codecs/aw883xx/aw883xx_calib.h b/sound/soc/codecs/aw883xx/aw883xx_calib.h
> new file mode 100644
> index 0000000..c20c319
> --- /dev/null
> +++ b/sound/soc/codecs/aw883xx/aw883xx_calib.h
> @@ -0,0 +1,154 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * aw883xx.c --  ALSA Soc AW883XX codec support
> + *
> + * Copyright (c) 2020 AWINIC Technology CO., LTD
> + *
> + * Author: Bruce zhao <zhaolei@awinic.com>
> + */
> +
> +#ifndef __AW883XX_CALIBRATION_H__
> +#define __AW883XX_CALIBRATION_H__
> +
> +/*#define AW_CALI_STORE_EXAMPLE*/
> +
> +#define AW_CALI_STORE_EXAMPLE
> +#define AW_ERRO_CALI_RE_VALUE (0)
> +#define AW_ERRO_CALI_F0_VALUE (2600)
> +
> +#define AW_CALI_RE_DEFAULT_TIMER (3000)
> +#define MSGS_SIZE (512)
> +#define RESERVED_SIZE (252)
> +
> +
> +#define AW_CALI_ALL_DEV (0xFFFFFFFF)
> +
> +#define AW_CALI_RE_MAX (15000)
> +#define AW_CALI_RE_MIN (4000)
> +#define AW_CALI_CFG_NUM (4)
> +#define AW_CALI_F0_DATA_NUM (4)
> +#define AW_CALI_READ_CNT_MAX (8)
> +#define AW_CALI_DATA_SUM_RM (2)
> +#define AW_DSP_RE_TO_SHOW_RE(re, shift) (((re) * (1000)) >> (shift))
> +#define AW_SHOW_RE_TO_DSP_RE(re, shift)  (((re) << shift) / (1000))
> +#define AW_CALI_F0_TIME (5 * 1000)
> +#define F0_READ_CNT_MAX (5)
> +#define AW_FS_CFG_MAX	(11)
> +#define AW_DEV_CH_MAX	(16)
> +#define AW_DEV_RE_RANGE	(RE_RANGE_NUM * AW_DEV_CH_MAX)
> +#define AW_TE_CACL_VALUE(te, coil_alpha) ((int32_t)(((int32_t)te << 18) / (coil_alpha)))
> +#define AW_RE_REALTIME_VALUE(re_cacl, te_cacl) \
> +		((re_cacl) + (int32_t)((int64_t)((te_cacl) * (re_cacl)) >> 14))
> +
> +enum {
> +	CALI_CHECK_DISABLE = 0,
> +	CALI_CHECK_ENABLE = 1,
> +};
> +
> +enum {
> +	CALI_RESULT_NONE = 0,
> +	CALI_RESULT_NORMAL = 1,
> +	CALI_RESULT_ERROR = -1,
> +};
> +
> +enum {
> +	CALI_OPS_HMUTE = 0X0001,
> +	CALI_OPS_NOISE = 0X0002,
> +};
> +
> +enum {
> +	CALI_TYPE_RE = 0,
> +	CALI_TYPE_F0,
> +};
> +
> +enum{
> +	AW_CALI_MODE_NONE = 0,
> +	AW_CALI_MODE_ATTR,
> +	AW_CALI_MODE_CLASS,
> +	AW_CALI_MODE_MISC,
> +	AW_CALI_MODE_MAX
> +};
> +
> +enum {
> +	GET_RE_TYPE = 0,
> +	GET_F0_TYPE,
> +	GET_Q_TYPE,
> +};
> +
> +enum {
> +	AW_CALI_CMD_RE = 0,
> +	AW_CALI_CMD_F0,
> +	AW_CALI_CMD_RE_F0,
> +	AW_CALI_CMD_F0_Q,
> +	AW_CALI_CMD_RE_F0_Q,
> +};
> +
> +enum {
> +	CALI_STR_NONE = 0,
> +	CALI_STR_CALI_RE_F0,
> +	CALI_STR_CALI_RE,
> +	CALI_STR_CALI_F0,
> +	CALI_STR_SET_RE,
> +	CALI_STR_SHOW_RE,		/*show cali_re*/
> +	CALI_STR_SHOW_R0,		/*show real r0*/
> +	CALI_STR_SHOW_CALI_F0,		/*GET DEV CALI_F0*/
> +	CALI_STR_SHOW_F0,		/*SHOW REAL F0*/
> +	CALI_STR_SHOW_TE,
> +	CALI_STR_DEV_SEL,		/*switch device*/
> +	CALI_STR_VER,
> +	CALI_STR_SHOW_RE_RANGE,
> +	CALI_STR_MAX,
> +};
> +
> +enum {
> +	RE_MIN_FLAG = 0,
> +	RE_MAX_FLAG = 1,
> +	RE_RANGE_NUM = 2,
> +};
> +
> +struct re_data {
> +	uint32_t re_range[2];
> +};
> +
> +
> +#define AW_IOCTL_MAGIC				'a'
> +
> +#define AW_IOCTL_GET_F0				_IOWR(AW_IOCTL_MAGIC, 5, int32_t)
> +#define AW_IOCTL_SET_CALI_RE			_IOWR(AW_IOCTL_MAGIC, 6, int32_t)
> +
> +#define AW_IOCTL_GET_RE				_IOWR(AW_IOCTL_MAGIC, 17, int32_t)
> +#define AW_IOCTL_GET_CALI_F0			_IOWR(AW_IOCTL_MAGIC, 18, int32_t)
> +#define AW_IOCTL_GET_REAL_R0			_IOWR(AW_IOCTL_MAGIC, 19, int32_t)
> +#define AW_IOCTL_GET_TE				_IOWR(AW_IOCTL_MAGIC, 20, int32_t)
> +#define AW_IOCTL_GET_RE_RANGE			_IOWR(AW_IOCTL_MAGIC, 21, struct re_data)
> +
> +struct cali_cfg {
> +	uint32_t data[AW_CALI_CFG_NUM];
> +};
> +
> +
> +struct aw_cali_desc {
> +	bool status;
> +	struct cali_cfg cali_cfg;
> +	uint16_t store_vol;
> +	uint32_t cali_re;	/*cali value*/
> +	uint32_t f0;
> +	uint32_t q;
> +	uint32_t ra;
> +	int8_t cali_result;
> +	uint8_t cali_check_st;
> +};
> +
> +void aw883xx_cali_init(struct aw_cali_desc *cali_desc);
> +void aw883xx_cali_deinit(struct aw_cali_desc *cali_desc);
> +bool aw883xx_cali_svc_get_cali_status(struct aw_cali_desc *cali_desc);
> +int aw883xx_cali_svc_set_cali_re_to_dsp(struct aw_cali_desc *cali_desc);
> +int aw883xx_cali_svc_get_ra(struct aw_cali_desc *cali_desc);
> +int aw883xx_cali_svc_get_dev_te(struct aw_cali_desc *cali_desc, int32_t *te);
> +int aw883xx_cali_get_cali_re(struct aw_cali_desc *cali_desc);
> +int aw883xx_cali_read_cali_re_from_dsp(struct aw_cali_desc *cali_desc, uint32_t *re);
> +bool aw883xx_cali_check_result(struct aw_cali_desc *cali_desc);
> +
> +#endif
> +
> +
> diff --git a/sound/soc/codecs/aw883xx/aw883xx_data_type.h b/sound/soc/codecs/aw883xx/aw883xx_data_type.h
> new file mode 100644
> index 0000000..b21f938
> --- /dev/null
> +++ b/sound/soc/codecs/aw883xx/aw883xx_data_type.h
> @@ -0,0 +1,157 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * aw883xx.c --  ALSA Soc AW883XX codec support
> + *
> + * Copyright (c) 2020 AWINIC Technology CO., LTD
> + *
> + * Author: Bruce zhao <zhaolei@awinic.com>
> + */
> +
> +#ifndef __AW883XX_DATA_TYPE_H__
> +#define __AW883XX_DATA_TYPE_H__
> +
> +#define AW_NAME_BUF_MAX (50)
> +
> +
> +/*
> + * aw profile
> + */
> +#define PROJECT_NAME_MAX (24)
> +#define CUSTOMER_NAME_MAX (16)
> +#define CFG_VERSION_MAX (4)
> +#define DEV_NAME_MAX (16)
> +#define PROFILE_STR_MAX (32)
> +
> +#define ACF_FILE_ID (0xa15f908)
> +
> +struct aw_msg_hdr {
> +	int32_t type;
> +	int32_t opcode_id;
> +	int32_t version;
> +	int32_t reseriver[3];
> +};
> +
> +enum aw_cfg_hdr_version {
> +	AW_CFG_HDR_VER_0_0_0_1 = 0x00000001,
> +	AW_CFG_HDR_VER_1_0_0_0 = 0x01000000,
> +};
> +
> +enum aw_cfg_dde_type {
> +	AW_DEV_NONE_TYPE_ID = 0xFFFFFFFF,
> +	AW_DEV_TYPE_ID = 0x00000000,
> +	AW_SKT_TYPE_ID = 0x00000001,
> +	AW_DEV_DEFAULT_TYPE_ID = 0x00000002,
> +};
> +
> +enum aw_sec_type {
> +	ACF_SEC_TYPE_REG = 0,
> +	ACF_SEC_TYPE_DSP,
> +	ACF_SEC_TYPE_DSP_CFG,
> +	ACF_SEC_TYPE_DSP_FW,
> +	ACF_SEC_TYPE_HDR_REG,
> +	ACF_SEC_TYPE_HDR_DSP_CFG,
> +	ACF_SEC_TYPE_HDR_DSP_FW,
> +	ACF_SEC_TYPE_MUTLBIN,
> +	ACF_SEC_TYPE_SKT_PROJECT,
> +	ACF_SEC_TYPE_DSP_PROJECT,
> +	ACF_SEC_TYPE_MONITOR,
> +	ACF_SEC_TYPE_MAX,
> +};
> +
> +enum profile_data_type {
> +	AW_DATA_TYPE_REG = 0,
> +	AW_DATA_TYPE_DSP_CFG,
> +	AW_DATA_TYPE_DSP_FW,
> +	AW_DATA_TYPE_MAX,
> +};
> +
> +enum aw_prof_type {
> +	AW_PROFILE_MUSIC = 0,
> +	AW_PROFILE_VOICE,
> +	AW_PROFILE_VOIP,
> +	AW_PROFILE_RINGTONE,
> +	AW_PROFILE_RINGTONE_HS,
> +	AW_PROFILE_LOWPOWER,
> +	AW_PROFILE_BYPASS,
> +	AW_PROFILE_MMI,
> +	AW_PROFILE_FM,
> +	AW_PROFILE_NOTIFICATION,
> +	AW_PROFILE_RECEIVER,
> +	AW_PROFILE_MAX,
> +};
> +
> +enum aw_profile_status {
> +	AW_PROFILE_WAIT = 0,
> +	AW_PROFILE_OK,
> +};
> +
> +struct aw_cfg_hdr {
> +	uint32_t a_id;					/*acf file ID 0xa15f908*/
> +	char a_project[PROJECT_NAME_MAX];		/*project name*/
> +	char a_custom[CUSTOMER_NAME_MAX];		/*custom name :huawei xiaomi vivo oppo*/
> +	char a_version[CFG_VERSION_MAX];		/*author update version*/
> +	uint32_t a_author_id;				/*author id*/
> +	uint32_t a_ddt_size;				/*sub section table entry size*/
> +	uint32_t a_ddt_num;				/*sub section table entry num*/
> +	uint32_t a_hdr_offset;				/*sub section table offset in file*/
> +	uint32_t a_hdr_version;				/*sub section table version*/
> +	uint32_t reserve[3];
> +};
> +
> +struct aw_cfg_dde {
> +	uint32_t type;					/*DDE type id*/
> +	char dev_name[DEV_NAME_MAX];
> +	uint16_t dev_index;				/*dev id*/
> +	uint16_t dev_bus;				/*dev bus id*/
> +	uint16_t dev_addr;				/*dev addr id*/
> +	uint16_t dev_profile;				/*dev profile id*/
> +	uint32_t data_type;				/*data type id*/
> +	uint32_t data_size;
> +	uint32_t data_offset;
> +	uint32_t data_crc;
> +	uint32_t reserve[5];
> +};
> +
> +struct aw_cfg_dde_v_1_0_0_0 {
> +	uint32_t type;					/*DDE type id*/
> +	char dev_name[DEV_NAME_MAX];
> +	uint16_t dev_index;				/*dev id*/
> +	uint16_t dev_bus;				/*dev bus id*/
> +	uint16_t dev_addr;				/*dev addr id*/
> +	uint16_t dev_profile;				/*dev profile id*/
> +	uint32_t data_type;				/*data type id*/
> +	uint32_t data_size;
> +	uint32_t data_offset;
> +	uint32_t data_crc;
> +	char dev_profile_str[PROFILE_STR_MAX];
> +	uint32_t chip_id;
> +	uint32_t reserve[4];
> +};
> +
> +struct aw_sec_data_desc {
> +	uint32_t len;
> +	unsigned char *data;
> +};
> +
> +struct aw_prof_desc {
> +	uint32_t id;
> +	uint32_t prof_st;
> +	char *prf_str;
> +	uint32_t fw_ver;
> +	struct aw_sec_data_desc sec_desc[AW_DATA_TYPE_MAX];
> +};
> +
> +struct aw_all_prof_info {
> +	struct aw_prof_desc prof_desc[AW_PROFILE_MAX];
> +};
> +
> +struct aw_prof_info {
> +	int count;
> +	int prof_type;
> +	char **prof_name_list;
> +	struct aw_prof_desc *prof_desc;
> +};
> +
> +
> +#endif
> +
> diff --git a/sound/soc/codecs/aw883xx/aw883xx_device.c b/sound/soc/codecs/aw883xx/aw883xx_device.c
> new file mode 100644
> index 0000000..681d9e5
> --- /dev/null
> +++ b/sound/soc/codecs/aw883xx/aw883xx_device.c
> @@ -0,0 +1,1734 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * aw883xx.c --  ALSA Soc AW883XX codec support
> + *
> + * Copyright (c) 2020 AWINIC Technology CO., LTD
> + *
> + * Author: Bruce zhao <zhaolei@awinic.com>
> + */
> +
> +#include <linux/module.h>
> +#include <linux/i2c.h>
> +#include <sound/core.h>
> +#include <sound/pcm.h>
> +#include <sound/pcm_params.h>
> +#include <sound/soc.h>
> +#include <linux/of_gpio.h>
> +#include <linux/delay.h>
> +#include <linux/device.h>
> +#include <linux/firmware.h>
> +#include <linux/debugfs.h>
> +#include <linux/version.h>
> +#include <linux/workqueue.h>
> +#include <linux/syscalls.h>
> +#include <sound/control.h>
> +#include <linux/uaccess.h>
> +
> +#include "aw883xx_data_type.h"
> +#include "aw883xx_log.h"
> +#include "aw883xx_device.h"
> +#include "aw883xx_bin_parse.h"
> +#include "aw883xx_calib.h"
> +
> +#define AW_DEV_SYSST_CHECK_MAX   (10)
> +
> +enum {
> +	AW_EXT_DSP_WRITE_NONE = 0,
> +	AW_EXT_DSP_WRITE,
> +};
> +
> +static unsigned int g_fade_in_time = AW_1000_US / 10;
> +static unsigned int g_fade_out_time = AW_1000_US >> 1;
> +static LIST_HEAD(g_dev_list);
> +static DEFINE_MUTEX(g_dev_lock);
> +
> +static int aw_dev_reg_dump(struct aw_device *aw_dev)
> +{
> +	int reg_num = aw_dev->ops.aw_get_reg_num();
> +	uint8_t i = 0;
> +	uint16_t reg_val = 0;
> +
> +	for (i = 0; i < reg_num; i++) {
> +		if (aw_dev->ops.aw_check_rd_access(i)) {
> +			aw_dev->ops.aw_reg_read(aw_dev, i, &reg_val);
> +			aw_dev_info(aw_dev->dev, "read: reg = 0x%02x, val = 0x%04x",
> +				i, reg_val);
> +		}
> +	}
> +
> +	return 0;
> +}
> +
> +int aw883xx_dev_set_volume(struct aw_device *aw_dev, uint16_t set_vol)
> +{
> +	uint16_t hw_vol = 0;
> +	int ret = -1;
> +	struct aw_volume_desc *vol_desc = &aw_dev->volume_desc;
> +
> +	hw_vol = set_vol + vol_desc->init_volume;
> +
> +	ret = aw_dev->ops.aw_set_hw_volume(aw_dev, hw_vol);
> +	if (ret < 0) {
> +		aw_dev_err(aw_dev->dev, "set volume failed");
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +int aw883xx_dev_get_volume(struct aw_device *aw_dev, uint16_t *get_vol)
> +{
> +	int ret = -1;
> +	uint16_t hw_vol = 0;
> +	struct aw_volume_desc *vol_desc = &aw_dev->volume_desc;
> +
> +	ret = aw_dev->ops.aw_get_hw_volume(aw_dev, &hw_vol);
> +	if (ret < 0) {
> +		aw_dev_err(aw_dev->dev, "read volume failed");
> +		return ret;
> +	}
> +
> +	*get_vol = hw_vol - vol_desc->init_volume;
> +
> +	return 0;
> +}
> +
> +static void aw_dev_fade_in(struct aw_device *aw_dev)
> +{
> +	int i = 0;
> +	struct aw_volume_desc *desc = &aw_dev->volume_desc;
> +	int fade_step = aw_dev->fade_step;
> +	uint16_t fade_in_vol = desc->ctl_volume;
> +
> +	if (!aw_dev->fade_en)
> +		return;
> +
> +	if (fade_step == 0 || g_fade_in_time == 0) {
> +		aw883xx_dev_set_volume(aw_dev, fade_in_vol);
> +		return;
> +	}
> +	/*volume up*/
> +	for (i = desc->mute_volume; i >= fade_in_vol; i -= fade_step) {
> +		aw883xx_dev_set_volume(aw_dev, i);
> +		usleep_range(g_fade_in_time, g_fade_in_time + 10);
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
> +	if (fade_step == 0 || g_fade_out_time == 0) {
> +		aw883xx_dev_set_volume(aw_dev, desc->mute_volume);
> +		return;
> +	}
> +
> +	for (i = desc->ctl_volume; i <= desc->mute_volume; i += fade_step) {
> +		aw883xx_dev_set_volume(aw_dev, i);
> +		usleep_range(g_fade_out_time, g_fade_out_time + 10);
> +	}
> +	if (i != desc->mute_volume) {
> +		aw883xx_dev_set_volume(aw_dev, desc->mute_volume);
> +		usleep_range(g_fade_out_time, g_fade_out_time + 10);
> +	}
> +}
> +
> +int aw883xx_dev_get_fade_vol_step(struct aw_device *aw_dev)
> +{
> +	return aw_dev->fade_step;
> +}
> +
> +void aw883xx_dev_set_fade_vol_step(struct aw_device *aw_dev, unsigned int step)
> +{
> +	aw_dev->fade_step = step;
> +}
> +
> +void aw883xx_dev_get_fade_time(unsigned int *time, bool fade_in)
> +{
> +	if (fade_in)
> +		*time = g_fade_in_time;
> +	else
> +		*time = g_fade_out_time;
> +}
> +
> +void aw883xx_dev_set_fade_time(unsigned int time, bool fade_in)
> +{
> +	if (fade_in)
> +		g_fade_in_time = time;
> +	else
> +		g_fade_out_time = time;
> +}
> +
> +static uint64_t aw_dev_dsp_crc32_reflect(uint64_t ref, uint8_t ch)
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
> +static uint32_t aw_dev_calc_dsp_cfg_crc32(uint8_t *buf, uint32_t len)
> +{
> +	uint8_t i;
> +	uint32_t crc = 0xffffffff;
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
> +	uint32_t crc_value = 0;
> +	uint32_t crc_data_len = 0;
> +	int ret = -1;
> +	struct aw_sec_data_desc *crc_dsp_cfg = &aw_dev->crc_dsp_cfg;
> +	struct aw_dsp_crc_desc *desc = &aw_dev->dsp_crc_desc;
> +
> +	/*get crc data len*/
> +	crc_data_len = (desc->dsp_reg - aw_dev->dsp_mem_desc.dsp_cfg_base_addr) * 2;
> +	if (crc_data_len > crc_dsp_cfg->len) {
> +		aw_dev_err(aw_dev->dev, "crc data len :%d > cfg_data len:%d",
> +			crc_data_len, crc_dsp_cfg->len);
> +		return -EINVAL;
> +	}
> +
> +	if (crc_data_len % 4 != 0) {
> +		aw_dev_err(aw_dev->dev, "The crc data len :%d unsupport", crc_data_len);
> +		return -EINVAL;
> +	}
> +
> +	crc_value = aw_dev_calc_dsp_cfg_crc32(crc_dsp_cfg->data, crc_data_len);
> +
> +	aw_dev_info(aw_dev->dev, "crc_value:0x%x", crc_value);
> +	ret = aw_dev->ops.aw_dsp_write(aw_dev, desc->dsp_reg, crc_value,
> +						desc->data_type);
> +	if (ret < 0) {
> +		aw_dev_err(aw_dev->dev, "set dsp crc value failed");
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static int aw_dev_dsp_crc_check_enable(struct aw_device *aw_dev, bool flag)
> +{
> +	struct aw_dsp_crc_desc *dsp_crc_desc = &aw_dev->dsp_crc_desc;
> +	int ret;
> +
> +	aw_dev_info(aw_dev->dev, "enter,flag:%d", flag);
> +	if (flag) {
> +		ret = aw_dev->ops.aw_reg_write_bits(aw_dev, dsp_crc_desc->ctl_reg,
> +				dsp_crc_desc->ctl_mask, dsp_crc_desc->ctl_enable);
> +		if (ret < 0) {
> +			aw_dev_err(aw_dev->dev, "enable dsp crc failed");
> +			return ret;
> +		}
> +	} else {
> +		ret = aw_dev->ops.aw_reg_write_bits(aw_dev, dsp_crc_desc->ctl_reg,
> +				dsp_crc_desc->ctl_mask, dsp_crc_desc->ctl_disable);
> +		if (ret < 0) {
> +			aw_dev_err(aw_dev->dev, "close dsp crc failed");
> +			return ret;
> +		}
> +	}
> +
> +	return 0;
> +}
> +
> +
> +static int aw_dev_dsp_st_check(struct aw_device *aw_dev)
> +{
> +	struct aw_sysst_desc *desc = &aw_dev->sysst_desc;
> +	int ret = -1;
> +	uint16_t reg_val = 0;
> +	int i;
> +
> +	for (i = 0; i < AW_DSP_ST_CHECK_MAX; i++) {
> +		ret = aw_dev->ops.aw_reg_read(aw_dev, desc->reg, &reg_val);
> +		if (ret < 0) {
> +			aw_dev_err(aw_dev->dev, "read reg0x%x failed", desc->reg);
> +			continue;
> +		}
> +
> +		if ((reg_val & (~desc->dsp_mask)) != desc->dsp_check) {
> +			aw_dev_err(aw_dev->dev, "check dsp st fail,reg_val:0x%04x", reg_val);
> +			ret = -EINVAL;
> +			continue;
> +		} else {
> +			aw_dev_info(aw_dev->dev, "dsp st check ok, reg_val:0x%04x", reg_val);
> +			return 0;
> +		}
> +	}
> +
> +	return ret;
> +}
> +
> +static int aw_dev_dsp_crc32_check(struct aw_device *aw_dev)
> +{
> +	int ret;
> +
> +	if (aw_dev->dsp_cfg == AW_DEV_DSP_BYPASS) {
> +		aw_dev_info(aw_dev->dev, "dsp bypass");
> +		return 0;
> +	}
> +
> +	ret = aw_dev_set_dsp_crc32(aw_dev);
> +	if (ret < 0) {
> +		aw_dev_info(aw_dev->dev, "set dsp crc32 failed");
> +		return ret;
> +	}
> +
> +	aw_dev_dsp_crc_check_enable(aw_dev, true);
> +
> +	/*dsp enable*/
> +	aw883xx_dev_dsp_enable(aw_dev, true);
> +	usleep_range(AW_5000_US, AW_5000_US + 100);
> +
> +	ret = aw_dev_dsp_st_check(aw_dev);
> +	if (ret < 0) {
> +		aw_dev_err(aw_dev->dev, "check crc32 fail");
> +		return ret;
> +	}
> +
> +	aw_dev_dsp_crc_check_enable(aw_dev, false);
> +	aw_dev->dsp_crc_st = AW_DSP_CRC_OK;
> +	return 0;
> +}
> +
> +static void aw_dev_pwd(struct aw_device *aw_dev, bool pwd)
> +{
> +	struct aw_pwd_desc *pwd_desc = &aw_dev->pwd_desc;
> +
> +	aw_dev_dbg(aw_dev->dev, "enter");
> +
> +	if (pwd) {
> +		aw_dev->ops.aw_reg_write_bits(aw_dev, pwd_desc->reg,
> +				pwd_desc->mask,
> +				pwd_desc->enable);
> +	} else {
> +		aw_dev->ops.aw_reg_write_bits(aw_dev, pwd_desc->reg,
> +				pwd_desc->mask,
> +				pwd_desc->disable);
> +	}
> +	aw_dev_info(aw_dev->dev, "done");
> +}
> +
> +static void aw_dev_amppd(struct aw_device *aw_dev, bool amppd)
> +{
> +	struct aw_amppd_desc *amppd_desc = &aw_dev->amppd_desc;
> +
> +	aw_dev_dbg(aw_dev->dev, "enter");
> +	if (amppd) {
> +		aw_dev->ops.aw_reg_write_bits(aw_dev, amppd_desc->reg,
> +				amppd_desc->mask,
> +				amppd_desc->enable);
> +	} else {
> +		aw_dev->ops.aw_reg_write_bits(aw_dev, amppd_desc->reg,
> +				amppd_desc->mask,
> +				amppd_desc->disable);
> +	}
> +	aw_dev_info(aw_dev->dev, "done");
> +}
> +
> +
> +void aw883xx_dev_mute(struct aw_device *aw_dev, bool mute)
> +{
> +	struct aw_mute_desc *mute_desc = &aw_dev->mute_desc;
> +
> +	aw_dev_dbg(aw_dev->dev, "enter");
> +	if (mute) {
> +		aw_dev_fade_out(aw_dev);
> +		aw_dev->ops.aw_reg_write_bits(aw_dev, mute_desc->reg,
> +				mute_desc->mask, mute_desc->enable);
> +	} else {
> +		aw_dev->ops.aw_reg_write_bits(aw_dev, mute_desc->reg,
> +				mute_desc->mask, mute_desc->disable);
> +		aw_dev_fade_in(aw_dev);
> +	}
> +	aw_dev_info(aw_dev->dev, "done");
> +}
> +
> +int aw883xx_dev_get_hmute(struct aw_device *aw_dev)
> +{
> +	uint16_t reg_val = 0;
> +	int ret;
> +	struct aw_mute_desc *desc = &aw_dev->mute_desc;
> +
> +	aw_dev_dbg(aw_dev->dev, "enter");
> +
> +	ret = aw_dev->ops.aw_reg_read(aw_dev, desc->reg, &reg_val);
> +	if (ret < 0)
> +		return ret;
> +
> +	if (reg_val & (~desc->mask))
> +		ret = 1;
> +	else
> +		ret = 0;
> +
> +	return ret;
> +}
> +
> +static int aw_dev_get_icalk(struct aw_device *aw_dev, int16_t *icalk)
> +{
> +	int ret = -1;
> +	uint16_t reg_val = 0;
> +	uint16_t reg_icalk = 0;
> +	struct aw_vcalb_desc *desc = &aw_dev->vcalb_desc;
> +
> +	ret = aw_dev->ops.aw_reg_read(aw_dev, desc->icalk_reg, &reg_val);
> +	if (ret < 0) {
> +		aw_dev_err(aw_dev->dev, "reg read failed");
> +		return ret;
> +	}
> +
> +	reg_icalk = reg_val & (~desc->icalk_reg_mask);
> +
> +	if (reg_icalk & (~desc->icalk_sign_mask))
> +		reg_icalk = reg_icalk | desc->icalk_neg_mask;
> +
> +	*icalk = (int16_t)reg_icalk;
> +
> +	return 0;
> +}
> +
> +static int aw_dev_get_vcalk(struct aw_device *aw_dev, int16_t *vcalk)
> +{
> +	int ret = -1;
> +	uint16_t reg_val = 0;
> +	uint16_t reg_vcalk = 0;
> +	struct aw_vcalb_desc *desc = &aw_dev->vcalb_desc;
> +
> +	ret = aw_dev->ops.aw_reg_read(aw_dev, desc->vcalk_reg, &reg_val);
> +	if (ret < 0) {
> +		aw_dev_err(aw_dev->dev, "reg read failed");
> +		return ret;
> +	}
> +
> +	reg_val = reg_val >> desc->vcalk_shift;
> +
> +	reg_vcalk = (uint16_t)reg_val & (~desc->vcalk_reg_mask);
> +
> +	if (reg_vcalk & (~desc->vcalk_sign_mask))
> +		reg_vcalk = reg_vcalk | desc->vcalk_neg_mask;
> +
> +	*vcalk = (int16_t)reg_vcalk;
> +
> +	return 0;
> +}
> +
> +static int aw_dev_get_vcalk_dac(struct aw_device *aw_dev, int16_t *vcalk)
> +{
> +	int ret = -1;
> +	uint16_t reg_val = 0;
> +	uint16_t reg_vcalk = 0;
> +	struct aw_vcalb_desc *desc = &aw_dev->vcalb_desc;
> +
> +	ret = aw_dev->ops.aw_reg_read(aw_dev, desc->icalk_reg, &reg_val);
> +	if (ret < 0) {
> +		aw_dev_err(aw_dev->dev, "reg read failed");
> +		return ret;
> +	}
> +
> +	reg_vcalk = reg_val >> desc->vcalk_dac_shift;
> +
> +	if (reg_vcalk & desc->vcalk_dac_mask)
> +		reg_vcalk = reg_vcalk | desc->vcalk_dac_neg_mask;
> +
> +	*vcalk = (int16_t)reg_vcalk;
> +
> +	return 0;
> +}
> +
> +int aw883xx_dev_modify_dsp_cfg(struct aw_device *aw_dev,
> +			unsigned int addr, uint32_t dsp_data, unsigned char data_type)
> +{
> +	uint32_t addr_offset = 0;
> +	int len = 0;
> +	uint8_t temp_data[4] = { 0 };
> +	struct aw_sec_data_desc *crc_dsp_cfg = &aw_dev->crc_dsp_cfg;
> +
> +	aw_dev_dbg(aw_dev->dev, "addr:0x%x, dsp_data:0x%x", addr, dsp_data);
> +	if (data_type == AW_DSP_16_DATA) {
> +		temp_data[0] = (uint8_t)(dsp_data & 0x00ff);
> +		temp_data[1] = (uint8_t)((dsp_data & 0xff00) >> 8);
> +		len = 2;
> +	} else if (data_type == AW_DSP_32_DATA) {
> +		temp_data[0] = (uint8_t)(dsp_data & 0x000000ff);
> +		temp_data[1] = (uint8_t)((dsp_data & 0x0000ff00) >> 8);
> +		temp_data[2] = (uint8_t)((dsp_data & 0x00ff0000) >> 16);
> +		temp_data[3] = (uint8_t)((dsp_data & 0xff000000) >> 24);
> +		len = 4;
> +	} else {
> +		aw_dev_err(aw_dev->dev, "data type[%d] unsupported", data_type);
> +		return -EINVAL;
> +	}
> +
> +	addr_offset = (addr - aw_dev->dsp_mem_desc.dsp_cfg_base_addr) * 2;
> +	if (addr_offset > crc_dsp_cfg->len) {
> +		aw_dev_err(aw_dev->dev, "addr_offset[%d] > crc_dsp_cfg->len[%d]",
> +				addr_offset, crc_dsp_cfg->len);
> +		return -EINVAL;
> +	}
> +
> +	memcpy(crc_dsp_cfg->data + addr_offset, temp_data, len);
> +	return 0;
> +}
> +
> +static int aw_dev_vsense_select(struct aw_device *aw_dev, int *vsense_select)
> +{
> +	int ret = -1;
> +	struct aw_vcalb_desc *desc = &aw_dev->vcalb_desc;
> +	uint16_t vsense_reg_val;
> +
> +	ret = aw_dev->ops.aw_reg_read(aw_dev, desc->vcalb_vsense_reg, &vsense_reg_val);
> +	if (ret < 0) {
> +		aw_dev_err(aw_dev->dev, "read vsense_reg_val failed");
> +		return ret;
> +	}
> +	aw_dev_dbg(aw_dev->dev, "vsense_reg = 0x%x", vsense_reg_val);
> +
> +	if (vsense_reg_val & (~desc->vcalk_vdsel_mask)) {
> +		*vsense_select = AW_DEV_VDSEL_VSENSE;
> +		aw_dev_info(aw_dev->dev, "vsense outside");
> +		return 0;
> +	}
> +
> +	*vsense_select = AW_DEV_VDSEL_DAC;
> +	aw_dev_info(aw_dev->dev, "vsense inside");
> +	return 0;
> +}
> +
> +static int aw_dev_set_vcalb(struct aw_device *aw_dev)
> +{
> +	int ret = -1;
> +	uint32_t reg_val = 0;
> +	int vcalb;
> +	int icalk;
> +	int vcalk;
> +	int16_t icalk_val = 0;
> +	int16_t vcalk_val = 0;
> +	struct aw_vcalb_desc *desc = &aw_dev->vcalb_desc;
> +	uint32_t vcalb_adj;
> +	int vsense_select = -1;
> +
> +	ret = aw_dev->ops.aw_dsp_read(aw_dev, desc->vcalb_dsp_reg, &vcalb_adj, desc->data_type);
> +	if (ret < 0) {
> +		aw_dev_err(aw_dev->dev, "read vcalb_adj failed");
> +		return ret;
> +	}
> +
> +	ret = aw_dev_vsense_select(aw_dev, &vsense_select);
> +	if (ret < 0)
> +		return ret;
> +	aw_dev_dbg(aw_dev->dev, "vsense_select = %d", vsense_select);
> +
> +	ret = aw_dev_get_icalk(aw_dev, &icalk_val);
> +	if (ret < 0)
> +		return ret;
> +	icalk = desc->cabl_base_value + desc->icalk_value_factor * icalk_val;
> +
> +	if (vsense_select == AW_DEV_VDSEL_VSENSE) {
> +		ret = aw_dev_get_vcalk(aw_dev, &vcalk_val);
> +		if (ret < 0)
> +			return ret;
> +		vcalk = desc->cabl_base_value + desc->vcalk_value_factor * vcalk_val;
> +		vcalb = desc->vcal_factor * desc->vscal_factor /
> +			desc->iscal_factor * icalk / vcalk * vcalb_adj;
> +
> +		aw_dev_dbg(aw_dev->dev, "vcalk_factor=%d, vscal_factor=%d, icalk=%d, vcalk=%d",
> +				desc->vcalk_value_factor, desc->vscal_factor, icalk, vcalk);
> +	} else if (vsense_select == AW_DEV_VDSEL_DAC) {
> +		ret = aw_dev_get_vcalk_dac(aw_dev, &vcalk_val);
> +		if (ret < 0)
> +			return ret;
> +		vcalk = desc->cabl_base_value + desc->vcalk_value_factor_vsense_in * vcalk_val;
> +		vcalb = desc->vcal_factor * desc->vscal_factor_vsense_in /
> +			desc->iscal_factor * icalk / vcalk * vcalb_adj;
> +
> +		aw_dev_dbg(aw_dev->dev, "vcalk_dac_factor=%d, vscal_dac_factor=%d, icalk=%d, vcalk=%d",
> +				desc->vcalk_value_factor_vsense_in,
> +				desc->vscal_factor_vsense_in, icalk, vcalk);
> +	} else {
> +		aw_dev_err(aw_dev->dev, "unsupport vsense status");
> +		return -EINVAL;
> +	}
> +
> +	if ((vcalk == 0) || (desc->iscal_factor == 0)) {
> +		aw_dev_err(aw_dev->dev, "vcalk:%d or desc->iscal_factor:%d unsupported",
> +			vcalk, desc->iscal_factor);
> +		return -EINVAL;
> +	}
> +
> +	vcalb = vcalb >> aw_dev->vcalb_desc.vcalb_adj_shift;
> +	reg_val = (uint32_t)vcalb;
> +
> +	aw_dev_dbg(aw_dev->dev, "vcalb=%d, reg_val=0x%x, vcalb_adj =0x%x",
> +				vcalb, reg_val, vcalb_adj);
> +
> +	ret = aw_dev->ops.aw_dsp_write(aw_dev, desc->vcalb_dsp_reg, reg_val, desc->data_type);
> +	if (ret < 0) {
> +		aw_dev_err(aw_dev->dev, "write vcalb failed");
> +		return ret;
> +	}
> +
> +	ret = aw883xx_dev_modify_dsp_cfg(aw_dev, desc->vcalb_dsp_reg,
> +					(uint32_t)reg_val, desc->data_type);
> +	if (ret < 0) {
> +		aw_dev_err(aw_dev->dev, "modify dsp cfg failed");
> +		return ret;
> +	}
> +
> +	aw_dev_info(aw_dev->dev, "done");
> +
> +	return 0;
> +}
> +
> +static int aw_dev_get_cali_f0_delay(struct aw_device *aw_dev)
> +{
> +	struct aw_cali_delay_desc *desc = &aw_dev->cali_delay_desc;
> +	uint32_t cali_delay = 0;
> +	int ret = -1;
> +
> +	ret = aw_dev->ops.aw_dsp_read(aw_dev,
> +			desc->dsp_reg, &cali_delay, desc->data_type);
> +	if (ret < 0) {
> +		aw_dev_err(aw_dev->dev, "read cali delay failed, ret=%d", ret);
> +		return ret;
> +	}
> +
> +	desc->delay = AW_CALI_DELAY_CACL(cali_delay);
> +	aw_dev_info(aw_dev->dev, "read cali delay: %d ms", desc->delay);
> +
> +	return 0;
> +}
> +
> +int aw883xx_dev_get_int_status(struct aw_device *aw_dev, uint16_t *int_status)
> +{
> +	int ret = -1;
> +	uint16_t reg_val = 0;
> +
> +	ret = aw_dev->ops.aw_reg_read(aw_dev, aw_dev->int_desc.st_reg, &reg_val);
> +	if (ret < 0)
> +		aw_dev_err(aw_dev->dev, "read interrupt reg fail, ret=%d", ret);
> +	else
> +		*int_status = reg_val;
> +
> +	aw_dev_dbg(aw_dev->dev, "read interrupt reg = 0x%04x", *int_status);
> +	return ret;
> +}
> +
> +void aw883xx_dev_clear_int_status(struct aw_device *aw_dev)
> +{
> +	uint16_t int_status = 0;
> +
> +	/*read int status and clear*/
> +	aw883xx_dev_get_int_status(aw_dev, &int_status);
> +	/*make sure int status is clear*/
> +	aw883xx_dev_get_int_status(aw_dev, &int_status);
> +	aw_dev_info(aw_dev->dev, "done");
> +}
> +
> +
> +int aw883xx_dev_get_iis_status(struct aw_device *aw_dev)
> +{
> +	int ret = -1;
> +	uint16_t reg_val = 0;
> +	struct aw_sysst_desc *desc = &aw_dev->sysst_desc;
> +
> +	aw_dev_dbg(aw_dev->dev, "enter");
> +
> +	aw_dev->ops.aw_reg_read(aw_dev, desc->reg, &reg_val);
> +	if ((reg_val & desc->pll_check) == desc->pll_check)
> +		ret = 0;
> +	else
> +		aw_dev_err(aw_dev->dev, "check pll lock fail,reg_val:0x%04x", reg_val);
> +
> +	return ret;
> +}
> +
> +
> +static int aw_dev_mode1_pll_check(struct aw_device *aw_dev)
> +{
> +	int ret = -1;
> +	uint16_t i = 0;
> +
> +	for (i = 0; i < AW_DEV_SYSST_CHECK_MAX; i++) {
> +		ret = aw883xx_dev_get_iis_status(aw_dev);
> +		if (ret < 0) {
> +			aw_dev_err(aw_dev->dev, "mode1 iis signal check error");
> +			usleep_range(AW_2000_US, AW_2000_US + 10);
> +		} else {
> +			return 0;
> +		}
> +	}
> +
> +	return ret;
> +}
> +
> +static int aw_dev_mode2_pll_check(struct aw_device *aw_dev)
> +{
> +	int ret = -1;
> +	uint16_t i = 0;
> +	uint16_t reg_val = 0;
> +	struct aw_cco_mux_desc *cco_mux_desc = &aw_dev->cco_mux_desc;
> +
> +	aw_dev->ops.aw_reg_read(aw_dev, cco_mux_desc->reg, &reg_val);
> +	reg_val &= (~cco_mux_desc->mask);
> +	if (reg_val == cco_mux_desc->divider) {
> +		aw_dev_dbg(aw_dev->dev, "CCO_MUX is already divider");
> +		return ret;
> +	}
> +
> +	/* change mode2 */
> +	aw_dev->ops.aw_reg_write_bits(aw_dev, cco_mux_desc->reg,
> +		cco_mux_desc->mask, cco_mux_desc->divider);
> +
> +	for (i = 0; i < AW_DEV_SYSST_CHECK_MAX; i++) {
> +		ret = aw883xx_dev_get_iis_status(aw_dev);
> +		if (ret < 0) {
> +			aw_dev_err(aw_dev->dev, "mode2 iis signal check error");
> +			usleep_range(AW_2000_US, AW_2000_US + 10);
> +		} else {
> +			break;
> +		}
> +	}
> +
> +	/* change mode1*/
> +	aw_dev->ops.aw_reg_write_bits(aw_dev, cco_mux_desc->reg,
> +		cco_mux_desc->mask, cco_mux_desc->bypass);
> +
> +	if (ret == 0) {
> +		usleep_range(AW_2000_US, AW_2000_US + 10);
> +		for (i = 0; i < AW_DEV_SYSST_CHECK_MAX; i++) {
> +			ret = aw_dev_mode1_pll_check(aw_dev);
> +			if (ret < 0) {
> +				aw_dev_err(aw_dev->dev, "mode2 switch to mode1, iis signal check error");
> +				usleep_range(AW_2000_US, AW_2000_US + 10);
> +			} else {
> +				break;
> +			}
> +		}
> +	}
> +
> +	return ret;
> +}
> +
> +int aw883xx_dev_syspll_check(struct aw_device *aw_dev)
> +{
> +	int ret = -1;
> +
> +	ret = aw_dev_mode1_pll_check(aw_dev);
> +	if (ret < 0) {
> +		aw_dev_info(aw_dev->dev, "mode1 check iis failed try switch to mode2 check");
> +		ret = aw_dev_mode2_pll_check(aw_dev);
> +		if (ret < 0) {
> +			aw_dev_err(aw_dev->dev, "mode2 check iis failed");
> +			return ret;
> +		}
> +	}
> +
> +	return ret;
> +}
> +
> +int aw883xx_dev_sysst_check(struct aw_device *aw_dev)
> +{
> +	int ret = -1;
> +	unsigned char i;
> +	uint16_t reg_val = 0;
> +	struct aw_sysst_desc *desc = &aw_dev->sysst_desc;
> +
> +	for (i = 0; i < AW_DEV_SYSST_CHECK_MAX; i++) {
> +		aw_dev->ops.aw_reg_read(aw_dev, desc->reg, &reg_val);
> +		if (((reg_val & (~desc->st_mask)) & desc->st_check) != desc->st_check) {
> +			aw_dev_dbg(aw_dev->dev, "check fail, cnt=%d, reg_val=0x%04x",
> +				i, reg_val);
> +			usleep_range(AW_2000_US, AW_2000_US + 10);
> +		} else {
> +			ret = 0;
> +			break;
> +		}
> +	}
> +	if (ret < 0)
> +		aw_dev_err(aw_dev->dev, "check fail");
> +
> +	return ret;
> +}
> +
> +static int aw_dev_get_monitor_sysint_st(struct aw_device *aw_dev)
> +{
> +	int ret = 0;
> +	struct aw_int_desc *desc = &aw_dev->int_desc;
> +
> +	if ((desc->intst_mask) & (desc->sysint_st)) {
> +		aw_dev_err(aw_dev->dev,
> +			"monitor check fail:0x%04x", desc->sysint_st);
> +		ret = -EINVAL;
> +	}
> +	desc->sysint_st = 0;
> +
> +	return ret;
> +}
> +
> +static int aw_dev_sysint_check(struct aw_device *aw_dev)
> +{
> +	int ret = 0;
> +	uint16_t reg_val = 0;
> +	struct aw_int_desc *desc = &aw_dev->int_desc;
> +
> +	aw883xx_dev_get_int_status(aw_dev, &reg_val);
> +
> +	if (reg_val & (desc->intst_mask)) {
> +		aw_dev_err(aw_dev->dev, "pa stop check fail:0x%04x", reg_val);
> +		ret = -EINVAL;
> +	}
> +
> +	return ret;
> +}
> +
> +static void aw_dev_get_cur_mode_st(struct aw_device *aw_dev)
> +{
> +	uint16_t reg_val;
> +	struct aw_profctrl_desc *profctrl_desc = &aw_dev->profctrl_desc;
> +
> +	aw_dev->ops.aw_reg_read(aw_dev, aw_dev->pwd_desc.reg, &reg_val);
> +
> +	if ((reg_val & (~profctrl_desc->mask)) == profctrl_desc->rcv_mode_val)
> +		profctrl_desc->cur_mode = AW_RCV_MODE;
> +	else
> +		profctrl_desc->cur_mode = AW_NOT_RCV_MODE;
> +}
> +
> +int aw883xx_dev_set_intmask(struct aw_device *aw_dev, bool flag)
> +{
> +	int ret = -1;
> +	struct aw_int_desc *desc = &aw_dev->int_desc;
> +
> +	if (flag)
> +		ret = aw_dev->ops.aw_reg_write(aw_dev, desc->mask_reg,
> +					desc->int_mask);
> +	else
> +		ret = aw_dev->ops.aw_reg_write(aw_dev, desc->mask_reg,
> +					desc->mask_default);
> +
> +	aw_dev_info(aw_dev->dev, "done");
> +	return ret;
> +}
> +
> +void aw883xx_dev_dsp_enable(struct aw_device *aw_dev, bool dsp)
> +{
> +	int ret = -1;
> +	struct aw_dsp_en_desc *desc = &aw_dev->dsp_en_desc;
> +
> +	if (dsp) {
> +		ret = aw_dev->ops.aw_reg_write_bits(aw_dev, desc->reg,
> +					desc->mask, desc->enable);
> +		if (ret < 0)
> +			aw_dev_err(aw_dev->dev, "enable dsp failed");
> +	} else {
> +		ret = aw_dev->ops.aw_reg_write_bits(aw_dev, desc->reg,
> +					desc->mask, desc->disable);
> +		if (ret < 0)
> +			aw_dev_err(aw_dev->dev, "disable dsp failed");
> +	}
> +
> +	aw_dev_info(aw_dev->dev, "done");
> +}
> +
> +static int aw_dev_get_dsp_config(struct aw_device *aw_dev, unsigned char *dsp_cfg)
> +{
> +	int ret = -1;
> +	uint16_t reg_val = 0;
> +	struct aw_dsp_en_desc *desc = &aw_dev->dsp_en_desc;
> +
> +	ret = aw_dev->ops.aw_reg_read(aw_dev, desc->reg, &reg_val);
> +	if (ret < 0) {
> +		aw_dev_err(aw_dev->dev, "reg read failed");
> +		return ret;
> +	}
> +
> +	if (reg_val & (~desc->mask))
> +		*dsp_cfg = AW_DEV_DSP_BYPASS;
> +	else
> +		*dsp_cfg = AW_DEV_DSP_WORK;
> +
> +	aw_dev_info(aw_dev->dev, "done");
> +
> +	return 0;
> +}
> +
> +void aw883xx_dev_memclk_select(struct aw_device *aw_dev, unsigned char flag)
> +{
> +	struct aw_memclk_desc *desc = &aw_dev->memclk_desc;
> +	int ret = -1;
> +
> +	if (flag == AW_DEV_MEMCLK_PLL) {
> +		ret = aw_dev->ops.aw_reg_write_bits(aw_dev, desc->reg,
> +					desc->mask, desc->mcu_hclk);
> +		if (ret < 0)
> +			aw_dev_err(aw_dev->dev, "memclk select pll failed");
> +
> +	} else if (flag == AW_DEV_MEMCLK_OSC) {
> +		ret = aw_dev->ops.aw_reg_write_bits(aw_dev, desc->reg,
> +					desc->mask, desc->osc_clk);
> +		if (ret < 0)
> +			aw_dev_err(aw_dev->dev, "memclk select OSC failed");
> +	} else {
> +		aw_dev_err(aw_dev->dev, "unknown memclk config, flag=0x%x", flag);
> +	}
> +
> +	aw_dev_info(aw_dev->dev, "done");
> +}
> +
> +int aw883xx_dev_get_dsp_status(struct aw_device *aw_dev)
> +{
> +	int ret = -1;
> +	uint16_t reg_val = 0;
> +	struct aw_watch_dog_desc *desc = &aw_dev->watch_dog_desc;
> +
> +	aw_dev_info(aw_dev->dev, "enter");
> +
> +	aw_dev->ops.aw_reg_read(aw_dev, desc->reg, &reg_val);
> +	if (reg_val & (~desc->mask))
> +		ret = 0;
> +
> +	return ret;
> +}
> +
> +static int aw_dev_get_vmax(struct aw_device *aw_dev, unsigned int *vmax)
> +{
> +	int ret = -1;
> +	struct aw_vmax_desc *desc = &aw_dev->vmax_desc;
> +
> +	ret = aw_dev->ops.aw_dsp_read(aw_dev, desc->dsp_reg, vmax, desc->data_type);
> +	if (ret < 0) {
> +		aw_dev_err(aw_dev->dev, "get vmax failed");
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +/*
> + * aw_dev update cfg
> + */
> +
> +static int aw_dev_reg_container_update(struct aw_device *aw_dev,
> +				uint8_t *data, uint32_t len)
> +{
> +	int i, ret;
> +	uint8_t reg_addr = 0;
> +	uint16_t reg_val = 0;
> +	uint16_t read_val = 0;
> +	uint16_t read_vol = 0;
> +	struct aw_int_desc *int_desc = &aw_dev->int_desc;
> +	struct aw_volume_desc *vol_desc = &aw_dev->volume_desc;
> +	int16_t *reg_data = NULL;
> +	int data_len;
> +
> +	aw_dev_dbg(aw_dev->dev, "enter");
> +	reg_data = (int16_t *)data;
> +	data_len = len >> 1;
> +
> +	if (data_len % 2 != 0) {
> +		aw_dev_err(aw_dev->dev, "data len:%d unsupported",
> +				data_len);
> +		return -EINVAL;
> +	}
> +
> +	for (i = 0; i < data_len; i += 2) {
> +		reg_addr = reg_data[i];
> +		reg_val = reg_data[i + 1];
> +		aw_dev_dbg(aw_dev->dev, "reg = 0x%02x, val = 0x%04x",
> +				reg_addr, reg_val);
> +		if (reg_addr == int_desc->mask_reg) {
> +			int_desc->int_mask = reg_val;
> +			reg_val = int_desc->mask_default;
> +		}
> +		if (reg_addr == aw_dev->mute_desc.reg) {
> +			aw_dev->ops.aw_reg_read(aw_dev, reg_addr, &read_val);
> +			read_val &= (~aw_dev->mute_desc.mask);
> +			reg_val &= aw_dev->mute_desc.mask;
> +			reg_val |= read_val;
> +		}
> +		if (reg_addr == aw_dev->dsp_crc_desc.ctl_reg)
> +			reg_val &= aw_dev->dsp_crc_desc.ctl_mask;
> +
> +		if (reg_addr == aw_dev->chansel_desc.txchan_reg) {
> +			/*close tx*/
> +			reg_val &= aw_dev->tx_en_desc.tx_en_mask;
> +			reg_val |= aw_dev->tx_en_desc.tx_disable;
> +		}
> +
> +		if (reg_addr == aw_dev->volume_desc.reg) {
> +			read_vol = (reg_val & (~aw_dev->volume_desc.mask)) >>
> +				aw_dev->volume_desc.shift;
> +			aw_dev->volume_desc.init_volume =
> +				aw_dev->ops.aw_reg_val_to_db(read_vol);
> +		}
> +
> +		ret = aw_dev->ops.aw_reg_write(aw_dev, reg_addr, reg_val);
> +		if (ret < 0)
> +			break;
> +
> +	}
> +
> +	aw883xx_hold_reg_spin_st(&aw_dev->spin_desc);
> +
> +	aw_dev_get_cur_mode_st(aw_dev);
> +
> +	if (aw_dev->cur_prof != aw_dev->set_prof) {
> +		/*clear control volume when PA change profile*/
> +		vol_desc->ctl_volume = 0;
> +	} else {
> +		/*keep control volume when PA start with sync mode*/
> +		aw883xx_dev_set_volume(aw_dev, vol_desc->ctl_volume);
> +	}
> +
> +	/*keep min volume*/
> +	if (aw_dev->fade_en)
> +		aw883xx_dev_set_volume(aw_dev, vol_desc->mute_volume);
> +
> +	aw_dev_get_dsp_config(aw_dev, &aw_dev->dsp_cfg);
> +
> +	aw_dev_dbg(aw_dev->dev, "exit");
> +
> +	return ret;
> +}
> +
> +static int aw_dev_reg_update(struct aw_device *aw_dev,
> +					uint8_t *data, uint32_t len)
> +{
> +
> +	aw_dev_dbg(aw_dev->dev, "reg len:%d", len);
> +
> +	if (len && (data != NULL)) {
> +		aw_dev_reg_container_update(aw_dev, data, len);
> +	} else {
> +		aw_dev_err(aw_dev->dev, "reg data is null or len is 0");
> +		return -EPERM;
> +	}
> +
> +	return 0;
> +}
> +
> +static int aw_dev_dsp_container_update(struct aw_device *aw_dev,
> +			uint8_t *data, uint32_t len, uint16_t base)
> +{
> +	int i;
> +	struct aw_dsp_mem_desc *dsp_mem_desc = &aw_dev->dsp_mem_desc;
> +#ifdef AW_DSP_I2C_WRITES
> +	uint32_t tmp_len = 0;
> +#else
> +	uint16_t reg_val = 0;
> +#endif
> +
> +	aw_dev_dbg(aw_dev->dev, "enter");
> +	mutex_lock(aw_dev->i2c_lock);
> +#ifdef AW_DSP_I2C_WRITES
> +	/* i2c writes */
> +	aw_dev->ops.aw_i2c_write(aw_dev, dsp_mem_desc->dsp_madd_reg, base);
> +
> +	for (i = 0; i < len; i += AW_MAX_RAM_WRITE_BYTE_SIZE) {
> +		if ((len - i) < AW_MAX_RAM_WRITE_BYTE_SIZE)
> +			tmp_len = len - i;
> +		else
> +			tmp_len = AW_MAX_RAM_WRITE_BYTE_SIZE;
> +		aw_dev->ops.aw_i2c_writes(aw_dev, dsp_mem_desc->dsp_mdat_reg,
> +					&data[i], tmp_len);
> +	}
> +
> +#else
> +	/* i2c write */
> +	aw_dev->ops.aw_i2c_write(aw_dev, dsp_mem_desc->dsp_madd_reg, base);
> +	for (i = 0; i < len; i += 2) {
> +		reg_val = (data[i] << 8) + data[i + 1];
> +		aw_dev->ops.aw_i2c_write(aw_dev, dsp_mem_desc->dsp_mdat_reg,
> +					reg_val);
> +	}
> +#endif
> +	mutex_unlock(aw_dev->i2c_lock);
> +	aw_dev_dbg(aw_dev->dev, "exit");
> +
> +	return 0;
> +}
> +
> +int aw_dev_dsp_fw_update(struct aw_device *aw_dev,
> +			uint8_t *data, uint32_t len)
> +{
> +	struct aw_dsp_mem_desc *dsp_mem_desc = &aw_dev->dsp_mem_desc;
> +
> +	aw_dev_dbg(aw_dev->dev, "dsp firmware len:%d", len);
> +
> +	if (len && (data != NULL)) {
> +		aw_dev_dsp_container_update(aw_dev,
> +			data, len, dsp_mem_desc->dsp_fw_base_addr);
> +		aw_dev->dsp_fw_len = len;
> +	} else {
> +		aw_dev_err(aw_dev->dev, "dsp firmware data is null or len is 0");
> +		return -EPERM;
> +	}
> +
> +	return 0;
> +}
> +
> +static int aw_dev_copy_to_crc_dsp_cfg(struct aw_device *aw_dev,
> +			uint8_t *data, uint32_t size)
> +{
> +	struct aw_sec_data_desc *crc_dsp_cfg = &aw_dev->crc_dsp_cfg;
> +	int ret;
> +
> +	if (crc_dsp_cfg->data == NULL) {
> +		crc_dsp_cfg->data = devm_kzalloc(aw_dev->dev, size, GFP_KERNEL);
> +		if (!crc_dsp_cfg->data)
> +			return -ENOMEM;
> +		crc_dsp_cfg->len = size;
> +	} else if (crc_dsp_cfg->len < size) {
> +		devm_kfree(aw_dev->dev, crc_dsp_cfg->data);
> +		crc_dsp_cfg->data = NULL;
> +		crc_dsp_cfg->data = devm_kzalloc(aw_dev->dev, size, GFP_KERNEL);
> +		if (!crc_dsp_cfg->data) {
> +			aw_dev_err(aw_dev->dev, "error allocating memory");
> +			return -ENOMEM;
> +		}
> +	}
> +	memcpy(crc_dsp_cfg->data, data, size);
> +	ret = aw883xx_dev_dsp_data_order(aw_dev, crc_dsp_cfg->data, size);
> +	if (ret < 0)
> +		return ret;
> +
> +	return 0;
> +}
> +
> +int aw883xx_dev_dsp_cfg_update(struct aw_device *aw_dev,
> +			uint8_t *data, uint32_t len)
> +{
> +	struct aw_dsp_mem_desc *dsp_mem_desc = &aw_dev->dsp_mem_desc;
> +	int ret;
> +
> +	aw_dev_dbg(aw_dev->dev, "dsp config len:%d", len);
> +
> +	if (len && (data != NULL)) {
> +		aw_dev_dsp_container_update(aw_dev,
> +			data, len, dsp_mem_desc->dsp_cfg_base_addr);
> +		aw_dev->dsp_cfg_len = len;
> +
> +		ret = aw_dev_copy_to_crc_dsp_cfg(aw_dev, data, len);
> +		if (ret < 0)
> +			return ret;
> +
> +		aw_dev_set_vcalb(aw_dev);
> +		aw883xx_cali_svc_get_ra(&aw_dev->cali_desc);
> +		aw_dev_get_cali_f0_delay(aw_dev);
> +
> +		if (aw_dev->ops.aw_get_hw_mon_st) {
> +			ret = aw_dev->ops.aw_get_hw_mon_st(aw_dev,
> +					&aw_dev->monitor_desc.hw_mon_en,
> +					&aw_dev->monitor_desc.hw_temp_flag);
> +			if (ret < 0)
> +				return ret;
> +		}
> +
> +		ret = aw_dev_get_vmax(aw_dev, &aw_dev->vmax_desc.init_vmax);
> +		if (ret == 0) {
> +			aw_dev_info(aw_dev->dev, "get init vmax:0x%x",
> +						aw_dev->vmax_desc.init_vmax);
> +		} else {
> +			aw_dev_err(aw_dev->dev, "get vmax failed");
> +			return ret;
> +		}
> +
> +		aw_dev->dsp_crc_st = AW_DSP_CRC_NA;
> +	} else {
> +		aw_dev_err(aw_dev->dev, "dsp config data is null or len is 0");
> +		return -EPERM;
> +	}
> +
> +	return 0;
> +}
> +
> +static int aw_dev_sram_check(struct aw_device *aw_dev)
> +{
> +	int ret = -1;
> +	uint16_t reg_val = 0;
> +	struct aw_dsp_mem_desc *dsp_mem_desc = &aw_dev->dsp_mem_desc;
> +
> +	mutex_lock(aw_dev->i2c_lock);
> +	/*check the odd bits of reg 0x40*/
> +	aw_dev->ops.aw_i2c_write(aw_dev, dsp_mem_desc->dsp_madd_reg,
> +					AW_DSP_ODD_NUM_BIT_TEST);
> +	aw_dev->ops.aw_i2c_read(aw_dev, dsp_mem_desc->dsp_madd_reg, &reg_val);
> +	if (reg_val != AW_DSP_ODD_NUM_BIT_TEST) {
> +		aw_dev_err(aw_dev->dev, "check reg 0x40 odd bit failed, read[0x%x] does not match write[0x%x]",
> +				reg_val, AW_DSP_ODD_NUM_BIT_TEST);
> +		goto error;
> +	}
> +
> +	/*check the even bits of reg 0x40*/
> +	aw_dev->ops.aw_i2c_write(aw_dev, dsp_mem_desc->dsp_madd_reg,
> +					AW_DSP_EVEN_NUM_BIT_TEST);
> +	aw_dev->ops.aw_i2c_read(aw_dev, dsp_mem_desc->dsp_madd_reg, &reg_val);
> +	if (reg_val != AW_DSP_EVEN_NUM_BIT_TEST) {
> +		aw_dev_err(aw_dev->dev, "check reg 0x40 even bit failed, read[0x%x] does not match write[0x%x]",
> +				reg_val, AW_DSP_EVEN_NUM_BIT_TEST);
> +		goto error;
> +	}
> +
> +	/*check dsp_fw_base_addr*/
> +	aw_dev->ops.aw_i2c_write(aw_dev, dsp_mem_desc->dsp_madd_reg,
> +					dsp_mem_desc->dsp_fw_base_addr);
> +	aw_dev->ops.aw_i2c_write(aw_dev, dsp_mem_desc->dsp_mdat_reg,
> +					AW_DSP_EVEN_NUM_BIT_TEST);
> +
> +	aw_dev->ops.aw_i2c_write(aw_dev, dsp_mem_desc->dsp_madd_reg,
> +					dsp_mem_desc->dsp_fw_base_addr);
> +	aw_dev->ops.aw_i2c_read(aw_dev, dsp_mem_desc->dsp_mdat_reg, &reg_val);
> +	if (reg_val != AW_DSP_EVEN_NUM_BIT_TEST) {
> +		aw_dev_err(aw_dev->dev, "check dsp fw addr failed, read[0x%x] does not match write[0x%x]",
> +						reg_val, AW_DSP_EVEN_NUM_BIT_TEST);
> +		goto error;
> +	}
> +
> +	/*check dsp_cfg_base_addr*/
> +	aw_dev->ops.aw_i2c_write(aw_dev, dsp_mem_desc->dsp_madd_reg,
> +					dsp_mem_desc->dsp_cfg_base_addr);
> +	aw_dev->ops.aw_i2c_write(aw_dev, dsp_mem_desc->dsp_mdat_reg,
> +					AW_DSP_ODD_NUM_BIT_TEST);
> +
> +	aw_dev->ops.aw_i2c_write(aw_dev, dsp_mem_desc->dsp_madd_reg,
> +					dsp_mem_desc->dsp_cfg_base_addr);
> +	aw_dev->ops.aw_i2c_read(aw_dev, dsp_mem_desc->dsp_mdat_reg, &reg_val);
> +	if (reg_val != AW_DSP_ODD_NUM_BIT_TEST) {
> +		aw_dev_err(aw_dev->dev, "check dsp cfg failed, read[0x%x] does not match write[0x%x]",
> +						reg_val, AW_DSP_ODD_NUM_BIT_TEST);
> +		goto error;
> +	}
> +
> +	mutex_unlock(aw_dev->i2c_lock);
> +	return 0;
> +
> +error:
> +	mutex_unlock(aw_dev->i2c_lock);
> +	return ret;
> +}
> +
> +int aw883xx_dev_fw_update(struct aw_device *aw_dev, bool up_dsp_fw_en, bool force_up_en)
> +{
> +	int ret = -1;
> +	struct aw_prof_desc *set_prof_desc = NULL;
> +	struct aw_sec_data_desc *sec_desc = NULL;
> +	char *prof_name = NULL;
> +
> +	if ((aw_dev->cur_prof == aw_dev->set_prof) &&
> +			(force_up_en == AW_FORCE_UPDATE_OFF)) {
> +		aw_dev_info(aw_dev->dev, "scene no change, not update");
> +		return 0;
> +	}
> +
> +	if (aw_dev->fw_status == AW_DEV_FW_FAILED) {
> +		aw_dev_err(aw_dev->dev, "fw status[%d] error", aw_dev->fw_status);
> +		return -EPERM;
> +	}
> +
> +	prof_name = aw_dev_get_prof_name(aw_dev, aw_dev->set_prof);
> +	if (prof_name == NULL)
> +		return -ENOMEM;
> +
> +	aw_dev_info(aw_dev->dev, "start update %s", prof_name);
> +
> +	ret = aw883xx_dev_get_prof_data(aw_dev, aw_dev->set_prof, &set_prof_desc);
> +	if (ret < 0)
> +		return ret;
> +
> +	/*update reg*/
> +	sec_desc = set_prof_desc->sec_desc;
> +	ret = aw_dev_reg_update(aw_dev, sec_desc[AW_DATA_TYPE_REG].data,
> +					sec_desc[AW_DATA_TYPE_REG].len);
> +	if (ret < 0) {
> +		aw_dev_err(aw_dev->dev, "update reg failed");
> +		return ret;
> +	}
> +
> +	aw883xx_dev_mute(aw_dev, true);
> +
> +	if (aw_dev->dsp_cfg == AW_DEV_DSP_WORK)
> +		aw883xx_dev_dsp_enable(aw_dev, false);
> +
> +	aw883xx_dev_memclk_select(aw_dev, AW_DEV_MEMCLK_OSC);
> +
> +	if (up_dsp_fw_en) {
> +		ret = aw_dev_sram_check(aw_dev);
> +		if (ret < 0) {
> +			aw_dev_err(aw_dev->dev, "check sram failed");
> +			goto error;
> +		}
> +
> +		/*update dsp firmware*/
> +		aw_dev_info(aw_dev->dev, "fw_ver: [%x]", set_prof_desc->fw_ver);
> +		ret = aw_dev_dsp_fw_update(aw_dev, sec_desc[AW_DATA_TYPE_DSP_FW].data,
> +					sec_desc[AW_DATA_TYPE_DSP_FW].len);
> +		if (ret < 0) {
> +			aw_dev_err(aw_dev->dev, "update dsp fw failed");
> +			goto error;
> +		}
> +	}
> +
> +	/*update dsp config*/
> +	ret = aw883xx_dev_dsp_cfg_update(aw_dev, sec_desc[AW_DATA_TYPE_DSP_CFG].data,
> +					sec_desc[AW_DATA_TYPE_DSP_CFG].len);
> +	if (ret < 0) {
> +		aw_dev_err(aw_dev->dev, "update dsp cfg failed");
> +		goto error;
> +	}
> +
> +	aw883xx_dev_memclk_select(aw_dev, AW_DEV_MEMCLK_PLL);
> +
> +	aw_dev->cur_prof = aw_dev->set_prof;
> +
> +	aw_dev_info(aw_dev->dev, "load %s done", prof_name);
> +	return 0;
> +
> +error:
> +	aw883xx_dev_memclk_select(aw_dev, AW_DEV_MEMCLK_PLL);
> +
> +	return ret;
> +}
> +
> +int aw883xx_dev_dsp_check(struct aw_device *aw_dev)
> +{
> +	int ret = -1;
> +	uint16_t i = 0;
> +
> +	aw_dev_dbg(aw_dev->dev, "enter");
> +
> +	if (aw_dev->dsp_cfg == AW_DEV_DSP_BYPASS) {
> +		aw_dev_dbg(aw_dev->dev, "dsp bypass");
> +		return 0;
> +	} else if (aw_dev->dsp_cfg == AW_DEV_DSP_WORK) {
> +		aw883xx_dev_dsp_enable(aw_dev, false);
> +		aw883xx_dev_dsp_enable(aw_dev, true);
> +		usleep_range(AW_1000_US, AW_1000_US + 10);
> +		for (i = 0; i < AW_DEV_DSP_CHECK_MAX; i++) {
> +			ret = aw883xx_dev_get_dsp_status(aw_dev);
> +			if (ret < 0) {
> +				aw_dev_err(aw_dev->dev, "dsp wdt status error=%d", ret);
> +				usleep_range(AW_2000_US, AW_2000_US + 10);
> +			} else {
> +				return 0;
> +			}
> +		}
> +	} else {
> +		aw_dev_err(aw_dev->dev, "unknown dsp cfg=%d", aw_dev->dsp_cfg);
> +		return -EINVAL;
> +	}
> +
> +	return -EINVAL;
> +}
> +
> +static int aw_dev_set_cfg_f0_fs(struct aw_device *aw_dev)
> +{
> +	uint32_t f0_fs = 0;
> +	struct aw_cfgf0_fs_desc *cfgf0_fs_desc = &aw_dev->cfgf0_fs_desc;
> +	int ret;
> +
> +	if (aw_dev->ops.aw_set_cfg_f0_fs) {
> +		aw_dev->ops.aw_set_cfg_f0_fs(aw_dev, &f0_fs);
> +		ret = aw883xx_dev_modify_dsp_cfg(aw_dev, cfgf0_fs_desc->dsp_reg,
> +					f0_fs, cfgf0_fs_desc->data_type);
> +		if (ret < 0) {
> +			aw_dev_err(aw_dev->dev, "modify dsp cfg failed");
> +			return ret;
> +		}
> +	}
> +
> +	return 0;
> +}
> +
> +static void aw_dev_cali_re_update(struct aw_cali_desc *cali_desc)
> +{
> +	struct aw_device *aw_dev =
> +		container_of(cali_desc, struct aw_device, cali_desc);
> +
> +	if (aw_dev->cali_desc.cali_re < aw_dev->re_range.re_max &&
> +		aw_dev->cali_desc.cali_re > aw_dev->re_range.re_min) {
> +		aw883xx_cali_svc_set_cali_re_to_dsp(&aw_dev->cali_desc);
> +	} else {
> +		aw_dev_err(aw_dev->dev, "cali_re:%d out of range, no set",
> +				aw_dev->cali_desc.cali_re);
> +	}
> +}
> +
> +
> +int aw883xx_device_start(struct aw_device *aw_dev)
> +{
> +	int ret = -1;
> +
> +	aw_dev_info(aw_dev->dev, "enter");
> +
> +	if (aw_dev->status == AW_DEV_PW_ON) {
> +		aw_dev_info(aw_dev->dev, "already power on");
> +		return 0;
> +	}
> +
> +	/*power on*/
> +	aw_dev_pwd(aw_dev, false);
> +	usleep_range(AW_2000_US, AW_2000_US + 10);
> +
> +	ret = aw883xx_dev_syspll_check(aw_dev);
> +	if (ret < 0) {
> +		aw_dev_err(aw_dev->dev, "pll check failed cannot start");
> +		aw_dev_reg_dump(aw_dev);
> +		goto pll_check_fail;
> +	}
> +
> +	/*amppd on*/
> +	aw_dev_amppd(aw_dev, false);
> +	usleep_range(AW_1000_US, AW_1000_US + 50);
> +
> +	/*check i2s status*/
> +	ret = aw883xx_dev_sysst_check(aw_dev);
> +	if (ret < 0) {
> +		/*check failed*/
> +		aw_dev_reg_dump(aw_dev);
> +		goto sysst_check_fail;
> +	}
> +
> +	if (aw_dev->dsp_cfg == AW_DEV_DSP_WORK) {
> +		/*dsp bypass*/
> +		aw883xx_dev_dsp_enable(aw_dev, false);
> +		if (aw_dev->ops.aw_dsp_fw_check) {
> +			ret = aw_dev->ops.aw_dsp_fw_check(aw_dev);
> +			if (ret < 0) {
> +				aw_dev_reg_dump(aw_dev);
> +				goto dsp_fw_check_fail;
> +			}
> +		}
> +		aw_dev_set_cfg_f0_fs(aw_dev);
> +
> +		aw_dev_cali_re_update(&aw_dev->cali_desc);
> +
> +		if (aw_dev->dsp_crc_st != AW_DSP_CRC_OK) {
> +			ret = aw_dev_dsp_crc32_check(aw_dev);
> +			if (ret < 0) {
> +				aw_dev_err(aw_dev->dev, "dsp crc check failed");
> +				aw_dev_reg_dump(aw_dev);
> +				goto crc_check_fail;
> +			}
> +		}
> +
> +		ret = aw883xx_dev_dsp_check(aw_dev);
> +		if (ret < 0) {
> +			aw_dev_err(aw_dev->dev, "check dsp status failed");
> +			aw_dev_reg_dump(aw_dev);
> +			goto dsp_check_fail;
> +		}
> +	} else {
> +		aw_dev_dbg(aw_dev->dev, "start pa with dsp bypass");
> +	}
> +
> +	/*enable tx feedback*/
> +	if (aw_dev->ops.aw_i2s_tx_enable)
> +		aw_dev->ops.aw_i2s_tx_enable(aw_dev, true);
> +
> +	/*close mute*/
> +	if (aw883xx_cali_check_result(&aw_dev->cali_desc))
> +		aw883xx_dev_mute(aw_dev, false);
> +	else
> +		aw883xx_dev_mute(aw_dev, true);
> +
> +	/*clear inturrupt*/
> +	aw883xx_dev_clear_int_status(aw_dev);
> +	/*set inturrupt mask*/
> +	aw883xx_dev_set_intmask(aw_dev, true);
> +
> +	aw883xx_monitor_start(&aw_dev->monitor_desc);
> +
> +	aw_dev->status = AW_DEV_PW_ON;
> +
> +	aw_dev_info(aw_dev->dev, "done");
> +
> +	return 0;
> +
> +dsp_check_fail:
> +crc_check_fail:
> +	aw883xx_dev_dsp_enable(aw_dev, false);
> +dsp_fw_check_fail:
> +sysst_check_fail:
> +	/*clear interrupt*/
> +	aw883xx_dev_clear_int_status(aw_dev);
> +	aw_dev_amppd(aw_dev, true);
> +pll_check_fail:
> +	aw_dev_pwd(aw_dev, true);
> +	aw_dev->status = AW_DEV_PW_OFF;
> +	return ret;
> +}
> +
> +int aw883xx_device_stop(struct aw_device *aw_dev)
> +{
> +	struct aw_sec_data_desc *dsp_cfg =
> +		&aw_dev->prof_info.prof_desc[aw_dev->cur_prof].sec_desc[AW_DATA_TYPE_DSP_CFG];
> +	struct aw_sec_data_desc *dsp_fw =
> +		&aw_dev->prof_info.prof_desc[aw_dev->cur_prof].sec_desc[AW_DATA_TYPE_DSP_FW];
> +	int int_st = 0;
> +	int monitor_int_st = 0;
> +
> +	aw_dev_dbg(aw_dev->dev, "enter");
> +
> +	if (aw_dev->status == AW_DEV_PW_OFF) {
> +		aw_dev_info(aw_dev->dev, "already power off");
> +		return 0;
> +	}
> +
> +	aw_dev->status = AW_DEV_PW_OFF;
> +
> +	aw883xx_monitor_stop(&aw_dev->monitor_desc);
> +
> +	/*set mute*/
> +	aw883xx_dev_mute(aw_dev, true);
> +	usleep_range(AW_4000_US, AW_4000_US + 100);
> +
> +	/*close tx feedback*/
> +	if (aw_dev->ops.aw_i2s_tx_enable)
> +		aw_dev->ops.aw_i2s_tx_enable(aw_dev, false);
> +	usleep_range(AW_1000_US, AW_1000_US + 100);
> +
> +	/*set defaut int mask*/
> +	aw883xx_dev_set_intmask(aw_dev, false);
> +
> +	/*check sysint state*/
> +	int_st = aw_dev_sysint_check(aw_dev);
> +
> +	/*close dsp*/
> +	aw883xx_dev_dsp_enable(aw_dev, false);
> +
> +	/*enable amppd*/
> +	aw_dev_amppd(aw_dev, true);
> +
> +	/*check monitor process sysint state*/
> +	monitor_int_st = aw_dev_get_monitor_sysint_st(aw_dev);
> +
> +	if (int_st < 0 || monitor_int_st < 0) {
> +		/*system status anomaly*/
> +		aw883xx_dev_memclk_select(aw_dev, AW_DEV_MEMCLK_OSC);
> +		aw883xx_dev_dsp_cfg_update(aw_dev, dsp_cfg->data, dsp_cfg->len);
> +		aw_dev_dsp_fw_update(aw_dev, dsp_fw->data, dsp_fw->len);
> +		aw883xx_dev_memclk_select(aw_dev, AW_DEV_MEMCLK_PLL);
> +	}
> +
> +	/*set power down*/
> +	aw_dev_pwd(aw_dev, true);
> +
> +	aw_dev_info(aw_dev->dev, "done");
> +	return 0;
> +}
> +
> +/*deinit aw_device*/
> +void aw883xx_dev_deinit(struct aw_device *aw_dev)
> +{
> +	if (aw_dev == NULL)
> +		return;
> +
> +	if (aw_dev->prof_info.prof_desc != NULL) {
> +		devm_kfree(aw_dev->dev, aw_dev->prof_info.prof_desc);
> +		aw_dev->prof_info.prof_desc = NULL;
> +	}
> +	aw_dev->prof_info.count = 0;
> +
> +	if (aw_dev->crc_dsp_cfg.data != NULL) {
> +		aw_dev->crc_dsp_cfg.len = 0;
> +		devm_kfree(aw_dev->dev, aw_dev->crc_dsp_cfg.data);
> +		aw_dev->crc_dsp_cfg.data = NULL;
> +	}
> +
> +}
> +
> +/*init aw_device*/
> +int aw883xx_device_init(struct aw_device *aw_dev, struct aw_container *aw_cfg)
> +{
> +	int ret;
> +
> +	if (aw_dev == NULL || aw_cfg == NULL) {
> +		aw_pr_err("aw_dev is NULL or aw_cfg is NULL");
> +		return -ENOMEM;
> +	}
> +
> +	ret = aw883xx_dev_cfg_load(aw_dev, aw_cfg);
> +	if (ret < 0) {
> +		aw883xx_dev_deinit(aw_dev);
> +		aw_dev_err(aw_dev->dev, "aw_dev acf parse failed");
> +		return -EINVAL;
> +	}
> +
> +	aw_dev->cur_prof = aw_dev->prof_info.prof_desc[0].id;
> +	aw_dev->set_prof = aw_dev->prof_info.prof_desc[0].id;
> +	ret = aw883xx_dev_fw_update(aw_dev, AW_FORCE_UPDATE_ON,
> +			AW_DSP_FW_UPDATE_ON);
> +	if (ret < 0) {
> +		aw_dev_err(aw_dev->dev, "fw update failed");
> +		return ret;
> +	}
> +
> +	aw883xx_dev_set_intmask(aw_dev, false);
> +
> +	/*set mute*/
> +	aw883xx_dev_mute(aw_dev, true);
> +
> +	/*close tx feedback*/
> +	if (aw_dev->ops.aw_i2s_tx_enable)
> +		aw_dev->ops.aw_i2s_tx_enable(aw_dev, false);
> +	usleep_range(AW_1000_US, AW_1000_US + 100);
> +
> +	/*enable amppd*/
> +	aw_dev_amppd(aw_dev, true);
> +	/*close dsp*/
> +	aw883xx_dev_dsp_enable(aw_dev, false);
> +	/*set power down*/
> +	aw_dev_pwd(aw_dev, true);
> +
> +	mutex_lock(&g_dev_lock);
> +	list_add(&aw_dev->list_node, &g_dev_list);
> +	mutex_unlock(&g_dev_lock);
> +
> +	aw_dev_info(aw_dev->dev, "init done");
> +
> +	return 0;
> +}
> +
> +static void aw883xx_parse_channel_dt(struct aw_device *aw_dev)
> +{
> +	int ret;
> +	uint32_t channel_value;
> +	struct device_node *np = aw_dev->dev->of_node;
> +
> +	ret = of_property_read_u32(np, "sound-channel", &channel_value);
> +	if (ret < 0) {
> +		aw_dev_info(aw_dev->dev,
> +			"read sound-channel failed,use default 0");
> +		aw_dev->channel = AW_DEV_DEFAULT_CH;
> +		return;
> +	}
> +
> +	aw_dev_dbg(aw_dev->dev, "read sound-channel value is: %d",
> +			channel_value);
> +	aw_dev->channel = channel_value;
> +}
> +
> +static void aw883xx_parse_fade_enable_dt(struct aw_device *aw_dev)
> +{
> +	int ret = -1;
> +	struct device_node *np = aw_dev->dev->of_node;
> +	uint32_t fade_en;
> +
> +	ret = of_property_read_u32(np, "fade-enable", &fade_en);
> +	if (ret < 0) {
> +		aw_dev_info(aw_dev->dev,
> +			"read fade-enable failed, close fade_in_out");
> +		fade_en = AW_FADE_IN_OUT_DEFAULT;
> +	} else {
> +		aw_dev_info(aw_dev->dev, "read fade-enable value is: %d", fade_en);
> +	}
> +
> +	aw_dev->fade_en = fade_en;
> +}
> +
> +static void aw883xx_parse_re_range_dt(struct aw_device *aw_dev)
> +{
> +	int ret;
> +	uint32_t re_max;
> +	uint32_t re_min;
> +	struct device_node *np = aw_dev->dev->of_node;
> +
> +	ret = of_property_read_u32(np, "re-min", &re_min);
> +	if (ret < 0) {
> +		aw_dev->re_range.re_min = aw_dev->re_range.re_min_default;
> +		aw_dev_info(aw_dev->dev,
> +			"read re-min value failed, set default value:[%d]mohm",
> +			aw_dev->re_range.re_min);
> +	} else {
> +		aw_dev_info(aw_dev->dev,
> +			"parse re-min:[%d]", re_min);
> +		aw_dev->re_range.re_min = re_min;
> +	}
> +
> +	ret = of_property_read_u32(np, "re-max", &re_max);
> +	if (ret < 0) {
> +		aw_dev->re_range.re_max = aw_dev->re_range.re_max_default;
> +		aw_dev_info(aw_dev->dev,
> +			"read re-max failed, set default value:[%d]mohm",
> +			aw_dev->re_range.re_max);
> +	} else {
> +		aw_dev_info(aw_dev->dev,
> +			"parse re-max:[%d]", re_max);
> +		aw_dev->re_range.re_max = re_max;
> +	}
> +}
> +
> +static void aw_device_parse_dt(struct aw_device *aw_dev)
> +{
> +	aw883xx_parse_channel_dt(aw_dev);
> +	aw883xx_parse_fade_enable_dt(aw_dev);
> +	aw883xx_parse_re_range_dt(aw_dev);
> +}
> +
> +int aw883xx_dev_get_list_head(struct list_head **head)
> +{
> +	if (list_empty(&g_dev_list))
> +		return -EINVAL;
> +
> +	*head = &g_dev_list;
> +
> +	return 0;
> +}
> +
> +int aw883xx_device_probe(struct aw_device *aw_dev)
> +{
> +	INIT_LIST_HEAD(&aw_dev->list_node);
> +
> +	aw_device_parse_dt(aw_dev);
> +
> +	aw883xx_cali_init(&aw_dev->cali_desc);
> +
> +	aw883xx_monitor_init(&aw_dev->monitor_desc);
> +
> +	aw883xx_spin_init(&aw_dev->spin_desc);
> +
> +	return 0;
> +}
> +
> +int aw883xx_device_remove(struct aw_device *aw_dev)
> +{
> +	aw883xx_monitor_deinit(&aw_dev->monitor_desc);
> +
> +	aw883xx_cali_deinit(&aw_dev->cali_desc);
> +
> +	return 0;
> +}
> +
> diff --git a/sound/soc/codecs/aw883xx/aw883xx_device.h b/sound/soc/codecs/aw883xx/aw883xx_device.h
> new file mode 100644
> index 0000000..bfac8e2
> --- /dev/null
> +++ b/sound/soc/codecs/aw883xx/aw883xx_device.h
> @@ -0,0 +1,557 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * aw883xx.c --  ALSA Soc AW883XX codec support
> + *
> + * Copyright (c) 2020 AWINIC Technology CO., LTD
> + *
> + * Author: Bruce zhao <zhaolei@awinic.com>
> + */
> +
> +#ifndef __AW883XX_DEVICE_FILE_H__
> +#define __AW883XX_DEVICE_FILE_H__
> +#include "aw883xx_spin.h"
> +#include "aw883xx_monitor.h"
> +#include "aw883xx_data_type.h"
> +#include "aw883xx_calib.h"
> +
> +#define AW_DEV_DEFAULT_CH	(0)
> +#define AW_DEV_I2S_CHECK_MAX	(5)
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
> +
> +#define AW_GET_MIN_VALUE(value1, value2) \
> +	((value1) > (value2) ? (value2) : (value1))
> +
> +#define AW_GET_MAX_VALUE(value1, value2) \
> +	((value1) > (value2) ? (value1) : (value2))
> +
> +struct aw_device;
> +
> +enum {
> +	AW_DEV_VDSEL_DAC = 0,
> +	AW_DEV_VDSEL_VSENSE = 1,
> +};
> +
> +enum {
> +	AW_DSP_CRC_NA = 0,
> +	AW_DSP_CRC_OK = 1,
> +};
> +
> +enum {
> +	AW_DSP_CRC_DISABLE = 0,
> +	AW_DSP_CRC_ENABLE = 1,
> +};
> +
> +enum {
> +	AW_DSP_FW_UPDATE_OFF = 0,
> +	AW_DSP_FW_UPDATE_ON = 1,
> +};
> +
> +enum {
> +	AW_FORCE_UPDATE_OFF = 0,
> +	AW_FORCE_UPDATE_ON = 1,
> +};
> +
> +enum {
> +	AW_1000_US = 1000,
> +	AW_2000_US = 2000,
> +	AW_3000_US = 3000,
> +	AW_4000_US = 4000,
> +	AW_5000_US = 5000,
> +	AW_10000_US = 10000,
> +	AW_100000_US = 100000,
> +};
> +
> +enum {
> +	AW_DEV_TYPE_OK = 0,
> +	AW_DEV_TYPE_NONE = 1,
> +};
> +
> +
> +enum AW_DEV_STATUS {
> +	AW_DEV_PW_OFF = 0,
> +	AW_DEV_PW_ON,
> +};
> +
> +enum AW_DEV_FW_STATUS {
> +	AW_DEV_FW_FAILED = 0,
> +	AW_DEV_FW_OK,
> +};
> +
> +enum AW_DEV_MEMCLK {
> +	AW_DEV_MEMCLK_OSC = 0,
> +	AW_DEV_MEMCLK_PLL = 1,
> +};
> +
> +enum AW_DEV_DSP_CFG {
> +	AW_DEV_DSP_WORK = 0,
> +	AW_DEV_DSP_BYPASS = 1,
> +};
> +
> +enum {
> +	AW_DSP_16_DATA = 0,
> +	AW_DSP_32_DATA = 1,
> +};
> +
> +enum aw_platform {
> +	AW_QCOM = 0,
> +	AW_MTK = 1,
> +	AW_SPRD = 2,
> +};
> +
> +enum {
> +	AW_NOT_RCV_MODE = 0,
> +	AW_RCV_MODE = 1,
> +};
> +
> +struct aw_device_ops {
> +	int (*aw_i2c_writes)(struct aw_device *aw_dev, uint8_t reg_addr,
> +								uint8_t *buf, uint16_t len);
> +	int (*aw_i2c_write)(struct aw_device *aw_dev, uint8_t reg_addr, uint16_t reg_data);
> +	int (*aw_i2c_read)(struct aw_device *aw_dev, uint8_t reg_addr, uint16_t *reg_data);
> +
> +	int (*aw_reg_write)(struct aw_device *aw_dev, uint8_t reg_addr, uint16_t reg_data);
> +	int (*aw_reg_read)(struct aw_device *aw_dev, uint8_t reg_addr, uint16_t *reg_data);
> +	int (*aw_reg_write_bits)(struct aw_device *aw_dev, uint8_t reg_addr,
> +								uint16_t mask, uint16_t reg_data);
> +
> +	int (*aw_dsp_write)(struct aw_device *aw_dev,
> +						uint16_t dsp_addr,
> +						uint32_t reg_data,
> +						uint8_t data_type);
> +	int (*aw_dsp_read)(struct aw_device *aw_dev,
> +						uint16_t dsp_addr,
> +						uint32_t *dsp_data,
> +						uint8_t data_type);
> +	int (*aw_dsp_write_bits)(struct aw_device *aw_dev, uint16_t dsp_addr,
> +								uint16_t mask, uint16_t dsp_data);
> +
> +	int (*aw_set_hw_volume)(struct aw_device *aw_dev, uint16_t value);
> +	int (*aw_get_hw_volume)(struct aw_device *aw_dev, uint16_t *value);
> +	unsigned int (*aw_reg_val_to_db)(unsigned int value);
> +
> +	void (*aw_i2s_tx_enable)(struct aw_device *aw_dev, bool flag);
> +	int (*aw_get_dev_num)(void);
> +
> +	bool (*aw_check_wr_access)(int reg);
> +	bool (*aw_check_rd_access)(int reg);
> +	int (*aw_get_reg_num)(void);
> +	int (*aw_get_version)(char *buf, int size);
> +	int (*aw_read_dsp_pid)(struct aw_device *aw_dev);
> +	int (*aw_get_hw_mon_st)(struct aw_device *aw_dev, bool *is_enable, uint8_t *temp_flag);
> +	int (*aw_cali_svc_get_iv_st)(struct aw_device *aw_dev);
> +	void (*aw_set_cfg_f0_fs)(struct aw_device *aw_dev, uint32_t *f0_fs);
> +	int (*aw_dsp_fw_check)(struct aw_device *aw_dev);
> +};
> +
> +struct aw_int_desc {
> +	unsigned int mask_reg;			/*interrupt mask reg*/
> +	unsigned int st_reg;			/*interrupt status reg*/
> +	unsigned int mask_default;		/*default mask close all*/
> +	unsigned int int_mask;			/*set mask*/
> +	unsigned int intst_mask;		/*interrupt check mask*/
> +	uint16_t sysint_st;			/*interrupt reg status*/
> +};
> +
> +struct aw_pwd_desc {
> +	unsigned int reg;
> +	unsigned int mask;
> +	unsigned int enable;
> +	unsigned int disable;
> +};
> +
> +struct aw_vcalb_desc {
> +	unsigned int icalk_reg;
> +	unsigned int icalk_reg_mask;
> +	unsigned int icalk_sign_mask;
> +	unsigned int icalk_neg_mask;
> +	int icalk_value_factor;
> +
> +	unsigned int vcalk_reg;
> +	unsigned int vcalk_reg_mask;
> +	unsigned int vcalk_sign_mask;
> +	unsigned int vcalk_neg_mask;
> +	unsigned int vcalk_shift;
> +	int vcalk_value_factor;
> +
> +	unsigned int vcalb_dsp_reg;
> +	unsigned char data_type;
> +	int cabl_base_value;
> +	int vcal_factor;
> +	int vscal_factor;
> +	int iscal_factor;
> +
> +	unsigned int vcalb_adj_shift;
> +
> +	unsigned int vcalb_vsense_reg;
> +	int vscal_factor_vsense_in;
> +	int vcalk_value_factor_vsense_in;
> +	unsigned int vcalk_dac_shift;
> +	unsigned int vcalk_dac_mask;
> +	unsigned int vcalk_dac_neg_mask;
> +	unsigned int vcalk_vdsel_mask;
> +};
> +
> +struct aw_mute_desc {
> +	unsigned int reg;
> +	unsigned int mask;
> +	unsigned int enable;
> +	unsigned int disable;
> +};
> +
> +struct aw_sysst_desc {
> +	unsigned int reg;
> +	unsigned int st_check;
> +	unsigned int st_mask;
> +	unsigned int pll_check;
> +	unsigned int dsp_check;
> +	unsigned int dsp_mask;
> +};
> +
> +struct aw_profctrl_desc {
> +	unsigned int reg;
> +	unsigned int mask;
> +	unsigned int rcv_mode_val;
> +	unsigned int cur_mode;
> +};
> +
> +struct aw_volume_desc {
> +	unsigned int reg;
> +	unsigned int mask;
> +	unsigned int shift;
> +	unsigned int init_volume;
> +	unsigned int mute_volume;
> +	unsigned int ctl_volume;
> +	unsigned int max_volume;
> +	unsigned int monitor_volume;
> +};
> +
> +struct aw_dsp_en_desc {
> +	unsigned int reg;
> +	unsigned int mask;
> +	unsigned int enable;
> +	unsigned int disable;
> +};
> +
> +struct aw_memclk_desc {
> +	unsigned int reg;
> +	unsigned int mask;
> +	unsigned int mcu_hclk;
> +	unsigned int osc_clk;
> +};
> +
> +struct aw_watch_dog_desc {
> +	unsigned int reg;
> +	unsigned int mask;
> +};
> +
> +struct aw_dsp_mem_desc {
> +	unsigned int dsp_madd_reg;
> +	unsigned int dsp_mdat_reg;
> +	unsigned int dsp_fw_base_addr;
> +	unsigned int dsp_cfg_base_addr;
> +};
> +
> +struct aw_voltage_desc {
> +	unsigned int reg;
> +	unsigned int vbat_range;
> +	unsigned int int_bit;
> +};
> +
> +struct aw_temperature_desc {
> +	unsigned int reg;
> +	unsigned int sign_mask;
> +	unsigned int neg_mask;
> +};
> +
> +struct aw_ipeak_desc {
> +	unsigned int reg;
> +	unsigned int mask;
> +};
> +
> +struct aw_vmax_desc {
> +	unsigned int dsp_reg;
> +	unsigned char data_type;
> +	unsigned int init_vmax;
> +};
> +
> +struct aw_soft_rst {
> +	uint8_t reg;
> +	uint16_t reg_value;
> +};
> +
> +struct aw_cali_cfg_desc {
> +	unsigned int actampth_reg;
> +	unsigned char actampth_data_type;
> +
> +	unsigned int noiseampth_reg;
> +	unsigned char noiseampth_data_type;
> +
> +	unsigned int ustepn_reg;
> +	unsigned char ustepn_data_type;
> +
> +	unsigned int alphan_reg;
> +	unsigned int alphan_data_type;
> +};
> +
> +struct aw_dsp_vol_desc {
> +	unsigned int reg;
> +	unsigned int mute_st;
> +	unsigned int noise_st;
> +	unsigned int mask;
> +};
> +
> +struct aw_amppd_desc {
> +	unsigned int reg;
> +	unsigned int mask;
> +	unsigned int enable;
> +	unsigned int disable;
> +};
> +
> +struct aw_f0_desc {
> +	unsigned int dsp_reg;
> +	unsigned char data_type;
> +	unsigned int shift;
> +};
> +
> +struct aw_cfgf0_fs_desc {
> +	unsigned int dsp_reg;
> +	unsigned char data_type;
> +};
> +
> +struct aw_q_desc {
> +	unsigned int dsp_reg;
> +	unsigned char data_type;
> +	unsigned int shift;
> +};
> +
> +struct aw_ra_desc {
> +	unsigned int dsp_reg;
> +	unsigned char data_type;
> +};
> +
> +struct aw_noise_desc {
> +	unsigned int dsp_reg;
> +	unsigned char data_type;
> +	unsigned int mask;
> +};
> +
> +struct aw_hw_mon_desc {
> +	unsigned int dsp_reg;
> +	unsigned char data_type;
> +	unsigned int mask;
> +	unsigned int enable;
> +	unsigned int disable;
> +};
> +
> +struct aw_ste_re_desc {
> +	unsigned int dsp_reg;
> +	unsigned char data_type;
> +	unsigned int shift;
> +};
> +
> +struct aw_adpz_re_desc {
> +	unsigned int dsp_reg;
> +	unsigned char data_type;
> +	unsigned int shift;
> +};
> +
> +struct aw_adpz_t0_desc {
> +	unsigned int dsp_reg;
> +	unsigned char data_type;
> +	uint16_t coilalpha_reg;
> +	unsigned char coil_type;
> +};
> +
> +struct aw_spkr_temp_desc {
> +	unsigned int reg;
> +};
> +
> +struct aw_dsp_crc_desc {
> +	unsigned int ctl_reg;
> +	unsigned int ctl_mask;
> +	unsigned int ctl_enable;
> +	unsigned int ctl_disable;
> +
> +	unsigned int dsp_reg;
> +	unsigned char data_type;
> +};
> +
> +struct aw_cco_mux_desc {
> +	unsigned int reg;
> +	unsigned int mask;
> +	unsigned int divider;
> +	unsigned int bypass;
> +};
> +
> +struct aw_hw_temp_desc {
> +	unsigned int dsp_reg;
> +	unsigned char data_type;
> +};
> +
> +struct aw_re_range_desc {
> +	uint32_t re_min;
> +	uint32_t re_max;
> +	uint32_t re_min_default;
> +	uint32_t re_max_default;
> +};
> +
> +struct aw_cali_delay_desc {
> +	unsigned int dsp_reg;
> +	unsigned char data_type;
> +	unsigned int delay;
> +};
> +
> +struct aw_chansel_desc {
> +	unsigned int rxchan_reg;
> +	unsigned int rxchan_mask;
> +	unsigned int txchan_reg;
> +	unsigned int txchan_mask;
> +
> +	unsigned int rx_left;
> +	unsigned int rx_right;
> +	unsigned int tx_left;
> +	unsigned int tx_right;
> +};
> +
> +struct aw_tx_en_desc {
> +	unsigned int tx_en_mask;
> +	unsigned int tx_disable;
> +};
> +
> +struct aw_dsp_st {
> +	unsigned int dsp_reg_s1;
> +	unsigned int dsp_reg_e1;
> +
> +	unsigned int dsp_reg_s2;
> +	unsigned int dsp_reg_e2;
> +};
> +
> +struct aw_container {
> +	int len;
> +	uint8_t data[];
> +};
> +
> +struct aw_device {
> +	int status;
> +	struct mutex *i2c_lock;
> +
> +	unsigned char cur_prof;	/*current profile index*/
> +	unsigned char set_prof;	/*set profile index*/
> +	unsigned char dsp_crc_st;
> +	uint16_t chip_id;
> +
> +	unsigned int channel;	/*pa channel select*/
> +	unsigned int fade_step;
> +
> +	struct i2c_client *i2c;
> +	struct device *dev;
> +	char *acf;
> +	void *private_data;
> +
> +	uint32_t fade_en;
> +	unsigned char dsp_cfg;
> +
> +	uint32_t dsp_fw_len;
> +	uint32_t dsp_cfg_len;
> +	uint8_t platform;
> +	uint8_t fw_status;	/*load cfg status*/
> +	struct aw_prof_info prof_info;
> +	struct aw_sec_data_desc crc_dsp_cfg;
> +
> +	struct aw_int_desc int_desc;
> +	struct aw_pwd_desc pwd_desc;
> +	struct aw_mute_desc mute_desc;
> +	struct aw_vcalb_desc vcalb_desc;
> +	struct aw_sysst_desc sysst_desc;
> +	struct aw_profctrl_desc profctrl_desc;
> +	struct aw_volume_desc volume_desc;
> +	struct aw_dsp_en_desc dsp_en_desc;
> +	struct aw_memclk_desc memclk_desc;
> +	struct aw_watch_dog_desc watch_dog_desc;
> +	struct aw_dsp_mem_desc dsp_mem_desc;
> +	struct aw_voltage_desc voltage_desc;
> +	struct aw_temperature_desc temp_desc;
> +	struct aw_vmax_desc vmax_desc;
> +	struct aw_ipeak_desc ipeak_desc;
> +	struct aw_soft_rst soft_rst;
> +	struct aw_cali_cfg_desc cali_cfg_desc;
> +	struct aw_ra_desc ra_desc;
> +	struct aw_dsp_vol_desc dsp_vol_desc;
> +	struct aw_noise_desc noise_desc;
> +	struct aw_f0_desc f0_desc;
> +	struct aw_cfgf0_fs_desc cfgf0_fs_desc;
> +	struct aw_q_desc q_desc;
> +	struct aw_hw_mon_desc hw_mon_desc;
> +	struct aw_ste_re_desc ste_re_desc;
> +	struct aw_adpz_re_desc adpz_re_desc;
> +	struct aw_adpz_t0_desc t0_desc;
> +	struct aw_amppd_desc amppd_desc;
> +	struct aw_spkr_temp_desc spkr_temp_desc;
> +	struct aw_dsp_crc_desc dsp_crc_desc;
> +	struct aw_cco_mux_desc cco_mux_desc;
> +	struct aw_hw_temp_desc hw_temp_desc;
> +
> +	struct aw_cali_desc cali_desc;
> +	struct aw_monitor_desc monitor_desc;
> +	struct aw_re_range_desc re_range;
> +	struct aw_spin_desc spin_desc;
> +	struct aw_chansel_desc chansel_desc;
> +	struct aw_tx_en_desc tx_en_desc;
> +	struct aw_cali_delay_desc cali_delay_desc;
> +	struct aw_dsp_st dsp_st_desc;
> +
> +	struct aw_device_ops ops;
> +	struct list_head list_node;
> +};
> +
> +
> +void aw883xx_dev_deinit(struct aw_device *aw_dev);
> +int aw883xx_device_init(struct aw_device *aw_dev, struct aw_container *aw_prof);
> +int aw883xx_device_start(struct aw_device *aw_dev);
> +int aw883xx_device_stop(struct aw_device *aw_dev);
> +
> +int aw883xx_dev_fw_update(struct aw_device *aw_dev, bool up_dsp_fw_en, bool force_up_en);
> +int aw883xx_dev_get_int_status(struct aw_device *aw_dev, uint16_t *int_status);
> +void aw883xx_dev_set_volume_step(struct aw_device *aw_dev, unsigned int step);
> +int aw883xx_dev_set_intmask(struct aw_device *aw_dev, bool flag);
> +void aw883xx_dev_clear_int_status(struct aw_device *aw_dev);
> +int aw883xx_dev_get_volume_step(struct aw_device *aw_dev);
> +int aw883xx_device_probe(struct aw_device *aw_dev);
> +int aw883xx_device_remove(struct aw_device *aw_dev);
> +int aw883xx_dev_syspll_check(struct aw_device *aw_dev);
> +int aw883xx_dev_get_dsp_status(struct aw_device *aw_dev);
> +
> +void aw883xx_dev_set_fade_vol_step(struct aw_device *aw_dev, unsigned int step);
> +int aw883xx_dev_get_fade_vol_step(struct aw_device *aw_dev);
> +void aw883xx_dev_get_fade_time(unsigned int *time, bool fade_in);
> +void aw883xx_dev_set_fade_time(unsigned int time, bool fade_in);
> +int aw883xx_dev_get_hmute(struct aw_device *aw_dev);
> +int aw883xx_dev_sysst_check(struct aw_device *aw_dev);
> +int aw883xx_dev_get_list_head(struct list_head **head);
> +int aw883xx_dev_dsp_check(struct aw_device *aw_dev);
> +void aw883xx_dev_memclk_select(struct aw_device *aw_dev, unsigned char flag);
> +void aw883xx_dev_dsp_enable(struct aw_device *aw_dev, bool dsp);
> +void aw883xx_dev_mute(struct aw_device *aw_dev, bool mute);
> +int aw883xx_dev_dsp_fw_update(struct aw_device *aw_dev,
> +			uint8_t *data, uint32_t len);
> +int aw883xx_dev_dsp_cfg_update(struct aw_device *aw_dev,
> +			uint8_t *data, uint32_t len);
> +int aw883xx_dev_modify_dsp_cfg(struct aw_device *aw_dev,
> +			unsigned int addr, uint32_t dsp_data, unsigned char data_type);
> +int aw883xx_dev_get_iis_status(struct aw_device *aw_dev);
> +int aw883xx_dev_set_volume(struct aw_device *aw_dev, uint16_t set_vol);
> +int aw883xx_dev_get_volume(struct aw_device *aw_dev, uint16_t *get_vol);
> +
> +#endif
> +
> diff --git a/sound/soc/codecs/aw883xx/aw883xx_init.c b/sound/soc/codecs/aw883xx/aw883xx_init.c
> new file mode 100644
> index 0000000..b34f92f
> --- /dev/null
> +++ b/sound/soc/codecs/aw883xx/aw883xx_init.c
> @@ -0,0 +1,649 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * aw883xx.c --  ALSA Soc AW883XX codec support
> + *
> + * Copyright (c) 2020 AWINIC Technology CO., LTD
> + *
> + * Author: Bruce zhao <zhaolei@awinic.com>
> + */
> +
> +/*#define DEBUG*/
> +#include <linux/module.h>
> +#include <linux/i2c.h>
> +#include <sound/core.h>
> +#include <sound/pcm.h>
> +#include <sound/pcm_params.h>
> +#include <sound/soc.h>
> +#include <linux/of_gpio.h>
> +#include <linux/delay.h>
> +#include <linux/device.h>
> +#include <linux/firmware.h>
> +#include <linux/version.h>
> +#include <linux/workqueue.h>
> +#include <linux/syscalls.h>
> +#include <sound/control.h>
> +#include <linux/uaccess.h>
> +#include <linux/syscalls.h>
> +
> +#include "aw883xx.h"
> +#include "aw883xx_bin_parse.h"
> +#include "aw883xx_pid_2049_reg.h"
> +#include "aw883xx_log.h"
> +
> +#define AW_FW_CHECK_PART		(10)
> +
> +
> +static int aw883xx_dev_i2c_writes(struct aw_device *aw_dev,
> +		uint8_t reg_addr, uint8_t *buf, uint16_t len)
> +{
> +	struct aw883xx *aw883xx = (struct aw883xx *)aw_dev->private_data;
> +
> +	return aw883xx_i2c_writes(aw883xx, reg_addr, buf, len);
> +}
> +
> +static int aw883xx_dev_i2c_write(struct aw_device *aw_dev,
> +		uint8_t reg_addr, uint16_t reg_data)
> +{
> +	struct aw883xx *aw883xx = (struct aw883xx *)aw_dev->private_data;
> +
> +	return aw883xx_i2c_write(aw883xx, reg_addr, reg_data);
> +}
> +
> +static int aw883xx_dev_i2c_read(struct aw_device *aw_dev,
> +			uint8_t reg_addr, uint16_t *reg_data)
> +{
> +	struct aw883xx *aw883xx = (struct aw883xx *)aw_dev->private_data;
> +
> +	return aw883xx_i2c_read(aw883xx, reg_addr, reg_data);
> +}
> +
> +
> +static int aw883xx_dev_reg_read(struct aw_device *aw_dev,
> +			uint8_t reg_addr, uint16_t *reg_data)
> +{
> +	struct aw883xx *aw883xx = (struct aw883xx *)aw_dev->private_data;
> +
> +	return aw883xx_reg_read(aw883xx, reg_addr, reg_data);
> +}
> +
> +static int aw883xx_dev_reg_write(struct aw_device *aw_dev,
> +			uint8_t reg_addr, uint16_t reg_data)
> +{
> +	struct aw883xx *aw883xx = (struct aw883xx *)aw_dev->private_data;
> +
> +	return aw883xx_reg_write(aw883xx, reg_addr, reg_data);
> +}
> +
> +static int aw883xx_dev_reg_write_bits(struct aw_device *aw_dev,
> +			uint8_t reg_addr, uint16_t mask, uint16_t reg_data)
> +{
> +	struct aw883xx *aw883xx = (struct aw883xx *)aw_dev->private_data;
> +
> +	return aw883xx_reg_write_bits(aw883xx, reg_addr, mask, reg_data);
> +}
> +
> +static int aw883xx_dev_dsp_write(struct aw_device *aw_dev,
> +			uint16_t dsp_addr, uint32_t dsp_data, uint8_t data_type)
> +{
> +	struct aw883xx *aw883xx = (struct aw883xx *)aw_dev->private_data;
> +
> +	return aw883xx_dsp_write(aw883xx, dsp_addr, dsp_data, data_type);
> +}
> +
> +static int aw883xx_dev_dsp_read(struct aw_device *aw_dev,
> +			uint16_t dsp_addr, uint32_t *dsp_data, uint8_t data_type)
> +{
> +	struct aw883xx *aw883xx = (struct aw883xx *)aw_dev->private_data;
> +
> +	return aw883xx_dsp_read(aw883xx, dsp_addr, dsp_data, data_type);
> +}
> +
> +
> +/*
> + * aw883xx i2c write/read
> + */
> +/*[9 : 6]: -6DB ; [5 : 0]: -0.125DB  real_value = value * 8 : 0.125db --> 1*/
> +static unsigned int aw_pid_2049_reg_val_to_db(unsigned int value)
> +{
> +	return (((value >> AW_PID_2049_VOL_6DB_START) * AW_PID_2049_VOLUME_STEP_DB) +
> +			((value & 0x3f) % AW_PID_2049_VOLUME_STEP_DB));
> +}
> +
> +/*[9 : 6]: -6DB ; [5 : 0]: -0.125DB reg_value = value / step << 6 + value % step ; step = 6 * 8*/
> +static uint16_t aw_pid_2049_db_val_to_reg(uint16_t value)
> +{
> +	return (((value / AW_PID_2049_VOLUME_STEP_DB) << AW_PID_2049_VOL_6DB_START) +
> +			(value % AW_PID_2049_VOLUME_STEP_DB));
> +}
> +
> +static int aw883xx_set_volume(struct aw883xx *aw883xx, uint16_t value)
> +{
> +	uint16_t reg_value = 0;
> +	uint16_t real_value = 0;
> +	uint16_t volume = 0;
> +	struct aw_volume_desc *vol_desc = &aw883xx->aw_pa->volume_desc;
> +
> +	volume = AW_GET_MIN_VALUE(value, vol_desc->mute_volume);
> +	real_value = aw_pid_2049_db_val_to_reg(volume);
> +
> +	/* cal real value */
> +	aw883xx_reg_read(aw883xx, AW_PID_2049_SYSCTRL2_REG, &reg_value);
> +
> +	aw_dev_dbg(aw883xx->dev, "value 0x%x , reg:0x%x", value, real_value);
> +
> +	/*[15 : 6] volume*/
> +	real_value = (real_value << AW_PID_2049_VOL_START_BIT) | (reg_value & AW_PID_2049_VOL_MASK);
> +
> +	/* write value */
> +	aw883xx_reg_write(aw883xx, AW_PID_2049_SYSCTRL2_REG, real_value);
> +
> +	return 0;
> +}
> +
> +static int aw883xx_get_volume(struct aw883xx *aw883xx, uint16_t *value)
> +{
> +	uint16_t reg_value = 0;
> +	uint16_t real_value = 0;
> +
> +	/* read value */
> +	aw883xx_reg_read(aw883xx, AW_PID_2049_SYSCTRL2_REG, &reg_value);
> +
> +	/*[15 : 6] volume*/
> +	real_value = reg_value >> AW_PID_2049_VOL_START_BIT;
> +
> +	real_value = aw_pid_2049_reg_val_to_db(real_value);
> +
> +	*value = real_value;
> +
> +	return 0;
> +}
> +
> +static int aw_pid_2049_set_volume(struct aw_device *aw_dev, uint16_t value)
> +{
> +	struct aw883xx *aw883xx = (struct aw883xx *)aw_dev->private_data;
> +
> +	return aw883xx_set_volume(aw883xx, value);
> +}
> +
> +static int aw_pid_2049_get_volume(struct aw_device *aw_dev, uint16_t *value)
> +{
> +	struct aw883xx *aw883xx = (struct aw883xx *)aw_dev->private_data;
> +
> +	return aw883xx_get_volume(aw883xx, value);
> +}
> +
> +static void aw_pid_2049_i2s_tx_enable(struct aw_device *aw_dev, bool flag)
> +{
> +	struct aw883xx *aw883xx = (struct aw883xx *)aw_dev->private_data;
> +
> +	aw_dev_dbg(aw883xx->dev, "enter");
> +
> +	if (flag) {
> +		aw883xx_reg_write_bits(aw883xx, AW_PID_2049_I2SCFG1_REG,
> +				AW_PID_2049_I2STXEN_MASK,
> +				AW_PID_2049_I2STXEN_ENABLE_VALUE);
> +	} else {
> +		aw883xx_reg_write_bits(aw883xx, AW_PID_2049_I2SCFG1_REG,
> +				AW_PID_2049_I2STXEN_MASK,
> +				AW_PID_2049_I2STXEN_DISABLE_VALUE);
> +	}
> +}
> +
> +static void aw_pid_2049_set_cfg_f0_fs(struct aw_device *aw_dev, uint32_t *f0_fs)
> +{
> +	uint16_t rate_data = 0;
> +	uint32_t fs = 0;
> +	struct aw883xx *aw883xx = (struct aw883xx *)aw_dev->private_data;
> +
> +	aw_dev_dbg(aw883xx->dev, "enter");
> +	aw883xx_reg_read(aw883xx, AW_PID_2049_I2SCTRL_REG, &rate_data);
> +
> +	switch (rate_data & (~AW_PID_2049_I2SSR_MASK)) {
> +	case AW_PID_2049_I2SSR_8_KHZ_VALUE:
> +		fs = 8000;
> +		break;
> +	case AW_PID_2049_I2SSR_16_KHZ_VALUE:
> +		fs = 16000;
> +		break;
> +	case AW_PID_2049_I2SSR_32_KHZ_VALUE:
> +		fs = 32000;
> +		break;
> +	case AW_PID_2049_I2SSR_44_KHZ_VALUE:
> +		fs = 44000;
> +		break;
> +	case AW_PID_2049_I2SSR_48_KHZ_VALUE:
> +		fs = 48000;
> +		break;
> +	case AW_PID_2049_I2SSR_96_KHZ_VALUE:
> +		fs = 96000;
> +		break;
> +	case AW_PID_2049_I2SSR_192KHZ_VALUE:
> +		fs = 192000;
> +		break;
> +	default:
> +		fs = 48000;
> +		aw_dev_err(aw883xx->dev,
> +			"rate can not support, use default 48k");
> +		break;
> +	}
> +
> +	aw_dev_dbg(aw883xx->dev, "get i2s fs:%d", fs);
> +	*f0_fs = fs / 8;
> +
> +	aw883xx_dsp_write(aw883xx,
> +		AW_PID_2049_DSP_REG_CFGF0_FS, *f0_fs, AW_DSP_32_DATA);
> +}
> +
> +static bool aw_pid_2049_check_rd_access(int reg)
> +{
> +	if (reg >= AW_PID_2049_REG_MAX)
> +		return false;
> +
> +	if (aw_pid_2049_reg_access[reg] & REG_RD_ACCESS)
> +		return true;
> +	else
> +		return false;
> +}
> +
> +static bool aw_pid_2049_check_wr_access(int reg)
> +{
> +	if (reg >= AW_PID_2049_REG_MAX)
> +		return false;
> +
> +	if (aw_pid_2049_reg_access[reg] & REG_WR_ACCESS)
> +		return true;
> +	else
> +		return false;
> +}
> +
> +static int aw_pid_2049_get_reg_num(void)
> +{
> +	return AW_PID_2049_REG_MAX;
> +}
> +
> +static int aw_pid_2049_get_hw_mon_st(struct aw_device *aw_dev,
> +					bool *is_enable, uint8_t *temp_flag)
> +{
> +	int ret = 0;
> +	uint32_t vbat_en = 0;
> +	uint32_t temp_en = 0;
> +	uint32_t temp_switch = 0;
> +	struct aw883xx *aw883xx = (struct aw883xx *)aw_dev->private_data;
> +
> +	ret = aw883xx_dsp_read(aw883xx,
> +		AW_PID_2049_DSP_REG_CFG_MBMEC_GLBCFG, &vbat_en, AW_DSP_16_DATA);
> +	if (ret < 0) {
> +		aw_dev_err(aw883xx->dev, "read hardware monitor status failed");
> +		return ret;
> +	}
> +
> +	ret = aw883xx_dsp_read(aw883xx,
> +		AW_PID_2049_DSP_REG_TEMP_SWITCH, &temp_en, AW_DSP_16_DATA);
> +	if (ret < 0) {
> +		aw_dev_err(aw883xx->dev, "read hardware temp switch failed");
> +		return ret;
> +	}
> +
> +	temp_switch = temp_en;
> +	vbat_en &= (~AW_PID_2049_DSP_MONITOR_MASK);
> +	temp_en &= (~AW_PID_2049_DSP_TEMP_PEAK_MASK);
> +	temp_switch &= (~AW_PID_2049_DSP_TEMP_SEL_FLAG);
> +
> +	if (vbat_en || temp_en)
> +		*is_enable = true;
> +	else
> +		*is_enable = false;
> +
> +	if (temp_switch)
> +		*temp_flag = AW_EXTERNAL_TEMP;
> +	else
> +		*temp_flag = AW_INTERNAL_TEMP;
> +
> +	return 0;
> +}
> +
> +static int aw_pid_2049_cali_get_iv_st(struct aw_device *aw_dev)
> +{
> +	struct aw883xx *aw883xx = (struct aw883xx *)aw_dev->private_data;
> +	int ret;
> +	uint16_t reg_data = 0;
> +	int i;
> +
> +	aw_dev_info(aw_dev->dev, "enter");
> +
> +	for (i = 0; i < AW_GET_IV_CNT_MAX; i++) {
> +		ret = aw883xx_reg_read(aw883xx, AW_PID_2049_ASR1_REG, &reg_data);
> +		if (ret < 0) {
> +			aw_dev_err(aw883xx->dev,
> +				"read 0x%x failed", AW_PID_2049_ASR1_REG);
> +			return ret;
> +		}
> +
> +		reg_data &= (~AW_PID_2049_ReAbs_MASK);
> +		if (!reg_data)
> +			return 0;
> +		msleep(30);
> +	}
> +
> +	aw_dev_err(aw883xx->dev, "IV data abnormal, please check");
> +
> +	return -EINVAL;
> +}
> +
> +static int aw_pid_2049_dsp_fw_check(struct aw_device *aw_dev)
> +{
> +	struct aw_prof_desc *set_prof_desc = NULL;
> +	struct aw_sec_data_desc *dsp_fw_desc = NULL;
> +	uint16_t base_addr = AW_PID_2049_DSP_FW_ADDR;
> +	uint16_t addr = base_addr;
> +	int ret, i;
> +	uint32_t dsp_val;
> +	uint16_t bin_val;
> +
> +	aw_dev_info(aw_dev->dev, "enter");
> +
> +	ret = aw883xx_dev_get_prof_data(aw_dev, aw_dev->cur_prof, &set_prof_desc);
> +	if (ret < 0)
> +		return ret;
> +
> +	/*update reg*/
> +	dsp_fw_desc = &set_prof_desc->sec_desc[AW_DATA_TYPE_DSP_FW];
> +
> +	for (i = 0; i < AW_FW_CHECK_PART; i++) {
> +		ret = aw883xx_dev_dsp_read(aw_dev, addr, &dsp_val, AW_DSP_16_DATA);
> +		if (ret  < 0) {
> +			aw_dev_err(aw_dev->dev, "dsp read failed");
> +			return ret;
> +		}
> +
> +		bin_val = AW_GET_16_DATA(dsp_fw_desc->data[2 * (addr - base_addr)],
> +					dsp_fw_desc->data[2 * (addr - base_addr) + 1]);
> +
> +		if (dsp_val != bin_val) {
> +			aw_dev_err(aw_dev->dev, "check failed, addr[0x%x], read[0x%x] != bindata[0x%x]",
> +					addr, dsp_val, bin_val);
> +			return -EINVAL;
> +		}
> +
> +		addr += (dsp_fw_desc->len / 2) / AW_FW_CHECK_PART;
> +		if ((addr - base_addr) > dsp_fw_desc->len) {
> +			aw_dev_err(aw_dev->dev, "check failed, addr[0x%x] too large", addr);
> +			return -EINVAL;
> +		}
> +	}
> +
> +	aw_dev_info(aw_dev->dev, "dsp fw check success");
> +
> +	return 0;
> +}
> +
> +static int aw883xx_dev_init(struct aw883xx *aw883xx)
> +{
> +	struct aw_device *aw_pa = NULL;
> +
> +	aw_pa = devm_kzalloc(aw883xx->dev, sizeof(struct aw_device), GFP_KERNEL);
> +	if (aw_pa == NULL)
> +		return -ENOMEM;
> +
> +	/*call aw device init func*/
> +	aw_pa->acf = NULL;
> +	aw_pa->prof_info.prof_desc = NULL;
> +	aw_pa->prof_info.count = 0;
> +	aw_pa->prof_info.prof_type = AW_DEV_NONE_TYPE_ID;
> +	aw_pa->channel = 0;
> +	aw_pa->i2c_lock = &aw883xx->i2c_lock;
> +	aw_pa->i2c = aw883xx->i2c;
> +	aw_pa->fw_status = AW_DEV_FW_FAILED;
> +	aw_pa->fade_step = AW_PID_2049_VOLUME_STEP_DB;
> +	aw_pa->re_range.re_min_default = AW_RE_MIN;
> +	aw_pa->re_range.re_max_default = AW_RE_MAX;
> +	aw_pa->monitor_desc.hw_monitor_delay = AW_HW_MONITOR_DELAY;
> +
> +	aw_pa->chip_id = aw883xx->chip_id;
> +	aw_pa->private_data = (void *)aw883xx;
> +	aw_pa->dev = aw883xx->dev;
> +	aw_pa->ops.aw_get_version = aw883xx_get_version;
> +	aw_pa->ops.aw_i2c_writes = aw883xx_dev_i2c_writes;
> +	aw_pa->ops.aw_i2c_write = aw883xx_dev_i2c_write;
> +	aw_pa->ops.aw_reg_write = aw883xx_dev_reg_write;
> +	aw_pa->ops.aw_reg_write_bits = aw883xx_dev_reg_write_bits;
> +	aw_pa->ops.aw_i2c_read = aw883xx_dev_i2c_read;
> +	aw_pa->ops.aw_reg_read = aw883xx_dev_reg_read;
> +	aw_pa->ops.aw_dsp_read = aw883xx_dev_dsp_read;
> +	aw_pa->ops.aw_dsp_write = aw883xx_dev_dsp_write;
> +	aw_pa->ops.aw_get_dev_num = aw883xx_get_dev_num;
> +
> +	aw_pa->ops.aw_get_hw_volume = aw_pid_2049_get_volume;
> +	aw_pa->ops.aw_set_hw_volume = aw_pid_2049_set_volume;
> +	aw_pa->ops.aw_reg_val_to_db = aw_pid_2049_reg_val_to_db;
> +
> +	aw_pa->ops.aw_check_rd_access = aw_pid_2049_check_rd_access;
> +	aw_pa->ops.aw_check_wr_access = aw_pid_2049_check_wr_access;
> +	aw_pa->ops.aw_get_reg_num = aw_pid_2049_get_reg_num;
> +
> +	aw_pa->ops.aw_i2s_tx_enable = aw_pid_2049_i2s_tx_enable;
> +	aw_pa->ops.aw_get_hw_mon_st = aw_pid_2049_get_hw_mon_st;
> +
> +	aw_pa->ops.aw_cali_svc_get_iv_st = aw_pid_2049_cali_get_iv_st;
> +	aw_pa->ops.aw_set_cfg_f0_fs = aw_pid_2049_set_cfg_f0_fs;
> +	aw_pa->ops.aw_dsp_fw_check = aw_pid_2049_dsp_fw_check;
> +
> +	aw_pa->int_desc.mask_reg = AW_PID_2049_SYSINTM_REG;
> +	aw_pa->int_desc.mask_default = AW_PID_2049_SYSINTM_DEFAULT;
> +	aw_pa->int_desc.int_mask = AW_PID_2049_SYSINTM_DEFAULT;
> +	aw_pa->int_desc.st_reg = AW_PID_2049_SYSINT_REG;
> +	aw_pa->int_desc.intst_mask = AW_PID_2049_BIT_SYSINT_CHECK;
> +
> +	aw_pa->pwd_desc.reg = AW_PID_2049_SYSCTRL_REG;
> +	aw_pa->pwd_desc.mask = AW_PID_2049_PWDN_MASK;
> +	aw_pa->pwd_desc.enable = AW_PID_2049_PWDN_POWER_DOWN_VALUE;
> +	aw_pa->pwd_desc.disable = AW_PID_2049_PWDN_WORKING_VALUE;
> +
> +	aw_pa->mute_desc.reg = AW_PID_2049_SYSCTRL_REG;
> +	aw_pa->mute_desc.mask = AW_PID_2049_HMUTE_MASK;
> +	aw_pa->mute_desc.enable = AW_PID_2049_HMUTE_ENABLE_VALUE;
> +	aw_pa->mute_desc.disable = AW_PID_2049_HMUTE_DISABLE_VALUE;
> +
> +	aw_pa->vcalb_desc.vcalb_dsp_reg = AW_PID_2049_DSP_REG_VCALB;
> +	aw_pa->vcalb_desc.data_type = AW_DSP_16_DATA;
> +	aw_pa->vcalb_desc.vcal_factor = AW_PID_2049_VCAL_FACTOR;
> +	aw_pa->vcalb_desc.cabl_base_value = AW_PID_2049_CABL_BASE_VALUE;
> +	aw_pa->vcalb_desc.vscal_factor = AW_PID_2049_VSCAL_FACTOR;
> +	aw_pa->vcalb_desc.iscal_factor = AW_PID_2049_ISCAL_FACTOR;
> +
> +	aw_pa->vcalb_desc.vcalb_adj_shift = AW_PID_2049_VCALB_ADJ_FACTOR;
> +
> +	aw_pa->vcalb_desc.icalk_value_factor = AW_PID_2049_ICABLK_FACTOR;
> +	aw_pa->vcalb_desc.icalk_reg = AW_PID_2049_EFRM2_REG;
> +	aw_pa->vcalb_desc.icalk_reg_mask = AW_PID_2049_EF_ISN_GESLP_MASK;
> +	aw_pa->vcalb_desc.icalk_sign_mask = AW_PID_2049_EF_ISN_GESLP_SIGN_MASK;
> +	aw_pa->vcalb_desc.icalk_neg_mask = AW_PID_2049_EF_ISN_GESLP_SIGN_NEG;
> +
> +	aw_pa->vcalb_desc.vcalk_reg = AW_PID_2049_EFRH_REG;
> +	aw_pa->vcalb_desc.vcalk_reg_mask = AW_PID_2049_EF_VSN_GESLP_MASK;
> +	aw_pa->vcalb_desc.vcalk_sign_mask = AW_PID_2049_EF_VSN_GESLP_SIGN_MASK;
> +	aw_pa->vcalb_desc.vcalk_neg_mask = AW_PID_2049_EF_VSN_GESLP_SIGN_NEG;
> +	aw_pa->vcalb_desc.vcalk_value_factor = AW_PID_2049_VCABLK_FACTOR;
> +	aw_pa->vcalb_desc.vcalk_shift = AW_PID_2049_EF_VSENSE_GAIN_SHIFT;
> +
> +	aw_pa->vcalb_desc.vcalb_vsense_reg = AW_PID_2049_I2SCFG3_REG;
> +	aw_pa->vcalb_desc.vcalk_vdsel_mask = AW_PID_2049_VDSEL_MASK;
> +	aw_pa->vcalb_desc.vcalk_value_factor_vsense_in = AW_PID_2049_VCABLK_FACTOR_DAC;
> +	aw_pa->vcalb_desc.vscal_factor_vsense_in = AW_PID_2049_VSCAL_FACTOR_DAC;
> +	aw_pa->vcalb_desc.vcalk_dac_shift = AW_PID_2049_EF_DAC_GESLP_SHIFT;
> +	aw_pa->vcalb_desc.vcalk_dac_mask = AW_PID_2049_EF_DAC_GESLP_SIGN_MASK;
> +	aw_pa->vcalb_desc.vcalk_dac_neg_mask = AW_PID_2049_EF_DAC_GESLP_SIGN_NEG;
> +
> +	aw_pa->sysst_desc.reg = AW_PID_2049_SYSST_REG;
> +	aw_pa->sysst_desc.st_check = AW_PID_2049_BIT_SYSST_CHECK;
> +	aw_pa->sysst_desc.st_mask = AW_PID_2049_BIT_SYSST_CHECK_MASK;
> +	aw_pa->sysst_desc.pll_check = AW_PID_2049_BIT_PLL_CHECK;
> +	aw_pa->sysst_desc.dsp_check = AW_PID_2049_DSPS_NORMAL_VALUE;
> +	aw_pa->sysst_desc.dsp_mask = AW_PID_2049_DSPS_MASK;
> +
> +	aw_pa->profctrl_desc.reg = AW_PID_2049_SYSCTRL_REG;
> +	aw_pa->profctrl_desc.mask = AW_PID_2049_RCV_MODE_MASK;
> +	aw_pa->profctrl_desc.rcv_mode_val = AW_PID_2049_RCV_MODE_RECEIVER_VALUE;
> +
> +	aw_pa->volume_desc.reg = AW_PID_2049_SYSCTRL2_REG;
> +	aw_pa->volume_desc.mask = AW_PID_2049_VOL_MASK;
> +	aw_pa->volume_desc.shift = AW_PID_2049_VOL_START_BIT;
> +	aw_pa->volume_desc.mute_volume = AW_PID_2049_MUTE_VOL;
> +	aw_pa->volume_desc.max_volume = AW_PID_2049_VOL_DEFAULT_VALUE;
> +	aw_pa->volume_desc.ctl_volume = AW_PID_2049_VOL_DEFAULT_VALUE;
> +
> +	aw_pa->dsp_en_desc.reg = AW_PID_2049_SYSCTRL_REG;
> +	aw_pa->dsp_en_desc.mask = AW_PID_2049_DSPBY_MASK;
> +	aw_pa->dsp_en_desc.enable = AW_PID_2049_DSPBY_WORKING_VALUE;
> +	aw_pa->dsp_en_desc.disable = AW_PID_2049_DSPBY_BYPASS_VALUE;
> +
> +	aw_pa->memclk_desc.reg = AW_PID_2049_DBGCTRL_REG;
> +	aw_pa->memclk_desc.mask = AW_PID_2049_MEM_CLKSEL_MASK;
> +	aw_pa->memclk_desc.mcu_hclk = AW_PID_2049_MEM_CLKSEL_DAP_HCLK_VALUE;
> +	aw_pa->memclk_desc.osc_clk = AW_PID_2049_MEM_CLKSEL_OSC_CLK_VALUE;
> +
> +	aw_pa->watch_dog_desc.reg = AW_PID_2049_WDT_REG;
> +	aw_pa->watch_dog_desc.mask = AW_PID_2049_WDT_CNT_MASK;
> +
> +	aw_pa->dsp_mem_desc.dsp_madd_reg = AW_PID_2049_DSPMADD_REG;
> +	aw_pa->dsp_mem_desc.dsp_mdat_reg = AW_PID_2049_DSPMDAT_REG;
> +	aw_pa->dsp_mem_desc.dsp_cfg_base_addr = AW_PID_2049_DSP_CFG_ADDR;
> +	aw_pa->dsp_mem_desc.dsp_fw_base_addr = AW_PID_2049_DSP_FW_ADDR;
> +
> +	aw_pa->voltage_desc.reg = AW_PID_2049_VBAT_REG;
> +	aw_pa->voltage_desc.vbat_range = AW_PID_2049_VBAT_RANGE;
> +	aw_pa->voltage_desc.int_bit = AW_PID_2049_INT_10BIT;
> +
> +	aw_pa->temp_desc.reg = AW_PID_2049_TEMP_REG;
> +	aw_pa->temp_desc.sign_mask = AW_PID_2049_TEMP_SIGN_MASK;
> +	aw_pa->temp_desc.neg_mask = AW_PID_2049_TEMP_NEG_MASK;
> +
> +	aw_pa->vmax_desc.dsp_reg = AW_PID_2049_DSP_REG_VMAX;
> +	aw_pa->vmax_desc.data_type = AW_DSP_16_DATA;
> +
> +	aw_pa->ipeak_desc.reg = AW_PID_2049_SYSCTRL2_REG;
> +	aw_pa->ipeak_desc.mask = AW_PID_2049_BST_IPEAK_MASK;
> +
> +	aw_pa->soft_rst.reg = AW_PID_2049_ID_REG;
> +	aw_pa->soft_rst.reg_value = AW_PID_2049_SOFT_RESET_VALUE;
> +
> +	aw_pa->dsp_vol_desc.reg = AW_PID_2049_DSPCFG_REG;
> +	aw_pa->dsp_vol_desc.mask = AW_PID_2049_DSP_VOL_MASK;
> +	aw_pa->dsp_vol_desc.mute_st = AW_PID_2049_DSP_VOL_MUTE;
> +	aw_pa->dsp_vol_desc.noise_st = AW_PID_2049_DSP_VOL_NOISE_ST;
> +
> +	aw_pa->amppd_desc.reg = AW_PID_2049_SYSCTRL_REG;
> +	aw_pa->amppd_desc.mask = AW_PID_2049_AMPPD_MASK;
> +	aw_pa->amppd_desc.enable = AW_PID_2049_AMPPD_POWER_DOWN_VALUE;
> +	aw_pa->amppd_desc.disable = AW_PID_2049_AMPPD_WORKING_VALUE;
> +
> +	aw_pa->spkr_temp_desc.reg = AW_PID_2049_ASR2_REG;
> +
> +	/*32-bit data types need bypass dsp*/
> +	aw_pa->ra_desc.dsp_reg = AW_PID_2049_DSP_REG_CFG_ADPZ_RA;
> +	aw_pa->ra_desc.data_type = AW_DSP_32_DATA;
> +
> +	/*32-bit data types need bypass dsp*/
> +	aw_pa->cali_cfg_desc.actampth_reg = AW_PID_2049_DSP_REG_CFG_MBMEC_ACTAMPTH;
> +	aw_pa->cali_cfg_desc.actampth_data_type = AW_DSP_32_DATA;
> +
> +	/*32-bit data types need bypass dsp*/
> +	aw_pa->cali_cfg_desc.noiseampth_reg = AW_PID_2049_DSP_REG_CFG_MBMEC_NOISEAMPTH;
> +	aw_pa->cali_cfg_desc.noiseampth_data_type = AW_DSP_32_DATA;
> +
> +	aw_pa->cali_cfg_desc.ustepn_reg = AW_PID_2049_DSP_REG_CFG_ADPZ_USTEPN;
> +	aw_pa->cali_cfg_desc.ustepn_data_type = AW_DSP_16_DATA;
> +
> +	aw_pa->cali_cfg_desc.alphan_reg = AW_PID_2049_DSP_REG_CFG_RE_ALPHA;
> +	aw_pa->cali_cfg_desc.alphan_data_type = AW_DSP_16_DATA;
> +
> +	/*32-bit data types need bypass dsp*/
> +	aw_pa->adpz_re_desc.dsp_reg = AW_PID_2049_DSP_REG_CFG_ADPZ_RE;
> +	aw_pa->adpz_re_desc.data_type = AW_DSP_32_DATA;
> +	aw_pa->adpz_re_desc.shift = AW_PID_2049_DSP_RE_SHIFT;
> +
> +	aw_pa->t0_desc.dsp_reg = AW_PID_2049_DSP_CFG_ADPZ_T0;
> +	aw_pa->t0_desc.data_type = AW_DSP_16_DATA;
> +	aw_pa->t0_desc.coilalpha_reg = AW_PID_2049_DSP_CFG_ADPZ_COILALPHA;
> +	aw_pa->t0_desc.coil_type = AW_DSP_16_DATA;
> +
> +	aw_pa->ste_re_desc.shift = AW_PID_2049_DSP_REG_CALRE_SHIFT;
> +	aw_pa->ste_re_desc.dsp_reg = AW_PID_2049_DSP_REG_CALRE;
> +	aw_pa->ste_re_desc.data_type = AW_DSP_16_DATA;
> +
> +	aw_pa->noise_desc.dsp_reg = AW_PID_2049_DSP_REG_CFG_MBMEC_GLBCFG;
> +	aw_pa->noise_desc.data_type = AW_DSP_16_DATA;
> +	aw_pa->noise_desc.mask = AW_PID_2049_DSP_REG_NOISE_MASK;
> +
> +	aw_pa->f0_desc.dsp_reg = AW_PID_2049_DSP_REG_RESULT_F0;
> +	aw_pa->f0_desc.shift = AW_PID_2049_DSP_F0_SHIFT;
> +	aw_pa->f0_desc.data_type = AW_DSP_16_DATA;
> +
> +	/*32-bit data types need bypass dsp*/
> +	aw_pa->cfgf0_fs_desc.dsp_reg = AW_PID_2049_DSP_REG_CFGF0_FS;
> +	aw_pa->cfgf0_fs_desc.data_type = AW_DSP_32_DATA;
> +
> +	aw_pa->q_desc.dsp_reg = AW_PID_2049_DSP_REG_RESULT_Q;
> +	aw_pa->q_desc.shift = AW_PID_2049_DSP_Q_SHIFT;
> +	aw_pa->q_desc.data_type = AW_DSP_16_DATA;
> +
> +	/*32-bit data types need bypass dsp*/
> +	aw_pa->dsp_crc_desc.dsp_reg = AW_PID_2049_DSP_REG_CRC_ADDR;
> +	aw_pa->dsp_crc_desc.data_type = AW_DSP_32_DATA;
> +
> +	aw_pa->dsp_crc_desc.ctl_reg = AW_PID_2049_HAGCCFG7_REG;
> +	aw_pa->dsp_crc_desc.ctl_mask = AW_PID_2049_AGC_DSP_CTL_MASK;
> +	aw_pa->dsp_crc_desc.ctl_enable = AW_PID_2049_AGC_DSP_CTL_ENABLE_VALUE;
> +	aw_pa->dsp_crc_desc.ctl_disable = AW_PID_2049_AGC_DSP_CTL_DISABLE_VALUE;
> +
> +	aw_pa->cco_mux_desc.reg = AW_PID_2049_PLLCTRL1_REG;
> +	aw_pa->cco_mux_desc.mask = AW_PID_2049_CCO_MUX_MASK;
> +	aw_pa->cco_mux_desc.divider = AW_PID_2049_CCO_MUX_DIVIDED_VALUE;
> +	aw_pa->cco_mux_desc.bypass = AW_PID_2049_CCO_MUX_BYPASS_VALUE;
> +
> +	/*hw monitor temp reg*/
> +	aw_pa->hw_temp_desc.dsp_reg = AW_PID_2049_DSP_REG_TEMP_ADDR;
> +	aw_pa->hw_temp_desc.data_type = AW_DSP_16_DATA;
> +
> +	aw_pa->chansel_desc.rxchan_reg = AW_PID_2049_I2SCTRL_REG;
> +	aw_pa->chansel_desc.rxchan_mask = AW_PID_2049_CHSEL_MASK;
> +	aw_pa->chansel_desc.txchan_reg = AW_PID_2049_I2SCFG1_REG;
> +	aw_pa->chansel_desc.txchan_mask = AW_PID_2049_I2SCHS_MASK;
> +
> +	aw_pa->chansel_desc.rx_left = AW_PID_2049_CHSEL_LEFT_VALUE;
> +	aw_pa->chansel_desc.rx_right = AW_PID_2049_CHSEL_RIGHT_VALUE;
> +	aw_pa->chansel_desc.tx_left = AW_PID_2049_I2SCHS_LEFT_VALUE;
> +	aw_pa->chansel_desc.tx_right = AW_PID_2049_I2SCHS_RIGHT_VALUE;
> +
> +	aw_pa->tx_en_desc.tx_en_mask = AW_PID_2049_I2STXEN_MASK;
> +	aw_pa->tx_en_desc.tx_disable = AW_PID_2049_I2STXEN_DISABLE_VALUE;
> +
> +	aw_pa->cali_delay_desc.dsp_reg = AW_PID_2049_DSP_CALI_F0_DELAY;
> +	aw_pa->cali_delay_desc.data_type = AW_DSP_16_DATA;
> +
> +	aw_pa->dsp_st_desc.dsp_reg_s1 = AW_PID_2049_DSP_ST_S1;
> +	aw_pa->dsp_st_desc.dsp_reg_e1 = AW_PID_2049_DSP_ST_E1;
> +	aw_pa->dsp_st_desc.dsp_reg_s2 = AW_PID_2049_DSP_ST_S2;
> +	aw_pa->dsp_st_desc.dsp_reg_e2 = AW_PID_2049_DSP_ST_E2;
> +
> +	aw883xx_device_probe(aw_pa);
> +
> +	aw883xx->aw_pa = aw_pa;
> +
> +	return 0;
> +}
> +
> +int aw883xx_init(struct aw883xx *aw883xx)
> +{
> +	int ret = 0;
> +
> +	if (aw883xx->chip_id == AW883XX_PID_2049) {
> +		ret = aw883xx_dev_init(aw883xx);
> +	} else {
> +		aw_dev_err(aw883xx->dev, "unsupported device");
> +		return -EINVAL;
> +	}
> +
> +	return ret;
> +}
> +
> diff --git a/sound/soc/codecs/aw883xx/aw883xx_log.h b/sound/soc/codecs/aw883xx/aw883xx_log.h
> new file mode 100644
> index 0000000..1667f43
> --- /dev/null
> +++ b/sound/soc/codecs/aw883xx/aw883xx_log.h
> @@ -0,0 +1,32 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * aw883xx.c --  ALSA Soc AW883XX codec support
> + *
> + * Copyright (c) 2020 AWINIC Technology CO., LTD
> + *
> + * Author: Bruce zhao <zhaolei@awinic.com>
> + */
> +
> +#ifndef __AW883XX_LOG_H__
> +#define __AW883XX_LOG_H__
> +
> +/*
> + * print information control
> + */
> +#define aw_dev_err(dev, format, ...) \
> +		pr_err("[Awinic][%s]%s: " format "\n", dev_name(dev), __func__, ##__VA_ARGS__)
> +#define aw_dev_info(dev, format, ...) \
> +		pr_info("[Awinic][%s]%s: " format "\n", dev_name(dev), __func__, ##__VA_ARGS__)
> +#define aw_dev_dbg(dev, format, ...) \
> +		pr_debug("[Awinic][%s]%s: " format "\n", dev_name(dev), __func__, ##__VA_ARGS__)
> +
> +#define aw_pr_err(format, ...) \
> +		pr_err("[Awinic]%s: " format "\n", __func__, ##__VA_ARGS__)
> +#define aw_pr_info(format, ...) \
> +		pr_info("[Awinic]%s: " format "\n", __func__, ##__VA_ARGS__)
> +#define aw_pr_dbg(format, ...) \
> +		pr_debug("[Awinic]%s: " format "\n", __func__, ##__VA_ARGS__)
> +
> +
> +#endif
> +
> diff --git a/sound/soc/codecs/aw883xx/aw883xx_monitor.c b/sound/soc/codecs/aw883xx/aw883xx_monitor.c
> new file mode 100644
> index 0000000..1897d40
> --- /dev/null
> +++ b/sound/soc/codecs/aw883xx/aw883xx_monitor.c
> @@ -0,0 +1,1197 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * awinic_monitor.c monitor_module
> + *
> + * Copyright (c) 2019 AWINIC Technology CO., LTD
> + *
> + *  Author: Nick Li <liweilei@awinic.com.cn>
> + */
> +
> +#include <linux/module.h>
> +#include <linux/i2c.h>
> +#include <sound/core.h>
> +#include <sound/pcm.h>
> +#include <sound/pcm_params.h>
> +#include <sound/soc.h>
> +#include <linux/of_gpio.h>
> +#include <linux/delay.h>
> +#include <linux/device.h>
> +#include <linux/firmware.h>
> +#include <linux/of.h>
> +#include <linux/version.h>
> +#include <linux/input.h>
> +#include <linux/timer.h>
> +#include <linux/workqueue.h>
> +#include <linux/hrtimer.h>
> +#include <linux/power_supply.h>
> +#include "aw883xx_monitor.h"
> +#include "aw883xx_log.h"
> +#include "aw883xx_device.h"
> +#include "aw883xx.h"
> +#include "aw883xx_calib.h"
> +
> +
> +#define AW883XX_MONITOR_NAME "aw883xx_monitor.bin"
> +
> +/*
> + * device monitor
> + */
> + #ifndef AW_SYS_BATTERY_ST
> +static int aw_monitor_get_chip_voltage(struct aw_device *aw_dev,
> +						unsigned int *vol)
> +{
> +	int ret = -1;
> +	uint16_t local_vol = 0;
> +	struct aw_voltage_desc *desc = &aw_dev->voltage_desc;
> +
> +	ret = aw_dev->ops.aw_reg_read(aw_dev, desc->reg, (uint16_t *)vol);
> +	if (ret < 0) {
> +		aw_dev_err(aw_dev->dev, "read voltage failed!");
> +		return ret;
> +	}
> +
> +	if (desc->int_bit == 0) {
> +		aw_dev_err(aw_dev->dev, "desc->int_bit:%d unsupported", desc->int_bit);
> +		return -EINVAL;
> +	}
> +
> +	local_vol = ((*vol) * desc->vbat_range) / desc->int_bit;
> +
> +	*vol = local_vol;
> +
> +	aw_dev_info(aw_dev->dev, "chip voltage is %d", *vol);
> +
> +	return 0;
> +}
> +
> +static int aw_monitor_get_chip_temperature(struct aw_device *aw_dev, int *temp)
> +{
> +	int ret = -1;
> +	uint16_t reg_val = 0;
> +	uint16_t local_temp;
> +	struct aw_temperature_desc *desc = &aw_dev->temp_desc;
> +
> +	ret = aw_dev->ops.aw_reg_read(aw_dev, desc->reg, &reg_val);
> +	if (ret < 0) {
> +		aw_dev_err(aw_dev->dev, "get temperature failed!");
> +		return ret;
> +	}
> +
> +	local_temp = reg_val;
> +
> +	if (local_temp & (~desc->sign_mask))
> +		local_temp = local_temp | desc->neg_mask;
> +
> +	*temp = (int)((int16_t)local_temp);
> +
> +	aw_dev_info(aw_dev->dev, "chip temperature = %d", *temp);
> +	return 0;
> +}
> +#endif
> +
> +static int aw_monitor_get_battery_state(struct aw_device *aw_dev,
> +			int *data, int data_type)
> +{
> +	char name[] = "battery";
> +	int ret = -1;
> +	union power_supply_propval prop = { 0 };
> +	struct power_supply *psy = NULL;
> +
> +	psy = power_supply_get_by_name(name);
> +	if (psy) {
> +		ret = power_supply_get_property(psy, data_type, &prop);
> +		if (ret < 0) {
> +			aw_dev_err(aw_dev->dev, "get data failed");
> +			return -EINVAL;
> +		}
> +		*data = prop.intval;
> +		aw_dev_dbg(aw_dev->dev, "get system data: %d", *data);
> +	} else {
> +		aw_dev_err(aw_dev->dev, "no struct power supply name : %s", name);
> +		return -EINVAL;
> +	}
> +
> +	return 0;
> +}
> +
> +static int aw_monitor_get_system_temperature(struct aw_device *aw_dev, int *temp)
> +{
> +	int ret = -1;
> +	int sys_temp;
> +
> +	ret = aw_monitor_get_battery_state(aw_dev, &sys_temp, POWER_SUPPLY_PROP_TEMP);
> +	if (ret < 0) {
> +		aw_dev_err(aw_dev->dev, "get system temperature failed!");
> +		return ret;
> +	}
> +
> +	*temp = sys_temp / 10;
> +	aw_dev_dbg(aw_dev->dev, "system temperature = %d", *temp);
> +
> +	return ret;
> +}
> +
> +static int aw_monitor_set_system_temperature(struct aw_device *aw_dev, int sys_temp)
> +{
> +	int ret = -1;
> +	struct aw_hw_temp_desc *hw_temp_desc = &aw_dev->hw_temp_desc;
> +
> +	ret = aw_dev->ops.aw_dsp_write(aw_dev, hw_temp_desc->dsp_reg,
> +				sys_temp, hw_temp_desc->data_type);
> +	if (ret < 0) {
> +		aw_dev_err(aw_dev->dev, "set system temperature failed!");
> +		return ret;
> +	}
> +
> +	return ret;
> +}
> +
> +#ifdef AW_SYS_BATTERY_ST
> +static int aw_monitor_get_system_voltage(struct aw_device *aw_dev, unsigned int *vol)
> +{
> +	int ret = -1;
> +	unsigned int sys_vol;
> +
> +	ret = aw_monitor_get_battery_state(aw_dev, &sys_vol, POWER_SUPPLY_PROP_VOLTAGE_NOW);
> +	if (ret < 0) {
> +		aw_dev_err(aw_dev->dev, "get system voltage failed!");
> +		return ret;
> +	}
> +
> +	*vol = sys_vol / 1000;
> +	aw_dev_dbg(aw_dev->dev, "system voltage = %d", *vol);
> +
> +	return ret;
> +}
> +#endif
> +
> +static int aw_monitor_get_temperature(struct aw_device *aw_dev, int *temp)
> +{
> +#ifdef AW_SYS_BATTERY_ST
> +	return aw_monitor_get_system_temperature(aw_dev, temp);
> +#else
> +	return aw_monitor_get_chip_temperature(aw_dev, temp);
> +#endif
> +}
> +
> +static int aw_monitor_get_voltage(struct aw_device *aw_dev, unsigned int *vol)
> +{
> +#ifdef AW_SYS_BATTERY_ST
> +	return aw_monitor_get_system_voltage(aw_dev, vol);
> +#else
> +	return aw_monitor_get_chip_voltage(aw_dev, vol);
> +#endif
> +}
> +
> +static int aw_monitor_get_temp_and_vol(struct aw_device *aw_dev)
> +{
> +	struct aw_monitor_desc *monitor = &aw_dev->monitor_desc;
> +	unsigned int voltage = 0;
> +	int current_temp = 0;
> +	int ret = -1;
> +
> +#ifdef AW_DEBUG
> +	if (monitor->test_vol == 0) {
> +		ret = aw_monitor_get_voltage(aw_dev, &voltage);
> +		if (ret < 0)
> +			return ret;
> +	} else {
> +		voltage = monitor->test_vol;
> +	}
> +
> +	if (monitor->test_temp == 0) {
> +		ret = aw_monitor_get_temperature(aw_dev, &current_temp);
> +		if (ret < 0)
> +			return ret;
> +	} else {
> +		current_temp = monitor->test_temp;
> +	}
> +#else
> +	ret = aw_monitor_get_voltage(aw_dev, &voltage);
> +	if (ret < 0)
> +		return ret;
> +
> +	ret = aw_monitor_get_temperature(aw_dev, &current_temp);
> +	if (ret < 0)
> +		return ret;
> +#endif
> +
> +	monitor->vol_trace.sum_val += voltage;
> +	monitor->temp_trace.sum_val += current_temp;
> +	monitor->samp_count++;
> +
> +	return 0;
> +}
> +
> +static int aw_monitor_first_get_data_form_table(struct aw_device *aw_dev,
> +				struct aw_table_info table_info,
> +			struct aw_monitor_trace *data_trace)
> +{
> +	int i;
> +
> +	if (table_info.aw_table == NULL) {
> +		aw_dev_err(aw_dev->dev, "table_info.aw_table is null");
> +		return -EINVAL;
> +	}
> +
> +	for (i = 0; i < table_info.table_num; i++) {
> +		if (data_trace->sum_val >= table_info.aw_table[i].min_val) {
> +			memcpy(&data_trace->aw_table, &table_info.aw_table[i],
> +				sizeof(struct aw_table));
> +			break;
> +		}
> +	}
> +	return 0;
> +}
> +
> +static int aw_monitor_trace_data_from_table(struct aw_device *aw_dev,
> +			struct aw_table_info table_info,
> +			struct aw_monitor_trace *data_trace)
> +{
> +	int i;
> +
> +	if (table_info.aw_table == NULL) {
> +		aw_dev_err(aw_dev->dev, "table_info.aw_table is null");
> +		return -EINVAL;
> +	}
> +
> +	for (i = 0; i < table_info.table_num; i++) {
> +		if (data_trace->sum_val >= table_info.aw_table[i].min_val &&
> +			data_trace->sum_val <= table_info.aw_table[i].max_val) {
> +			memcpy(&data_trace->aw_table, &table_info.aw_table[i],
> +				sizeof(struct aw_table));
> +			break;
> +		}
> +	}
> +
> +	return 0;
> +}
> +
> +static int aw_monitor_get_data_from_table(struct aw_device *aw_dev,
> +					struct aw_table_info table_info,
> +					struct aw_monitor_trace *data_trace,
> +					uint32_t aplha)
> +{
> +	struct aw_monitor_desc *monitor = &aw_dev->monitor_desc;
> +
> +	if (monitor->first_entry == AW_FIRST_ENTRY) {
> +		return aw_monitor_first_get_data_form_table(aw_dev,
> +						table_info, data_trace);
> +	} else {
> +		if (monitor->samp_count == 0) {
> +			aw_dev_err(aw_dev->dev, "monitor->samp_count:%d unsupported",
> +						monitor->samp_count);
> +			return -EINVAL;
> +		}
> +
> +		data_trace->sum_val = data_trace->sum_val / monitor->samp_count;
> +		data_trace->sum_val = ((int32_t)aplha * data_trace->sum_val +
> +			(1000 - (int32_t)aplha) * data_trace->pre_val) / 1000;
> +		return aw_monitor_trace_data_from_table(aw_dev,
> +						table_info, data_trace);
> +	}
> +
> +	return 0;
> +}
> +
> +static int aw_monitor_get_data(struct aw_device *aw_dev)
> +{
> +	struct aw_monitor_desc *monitor = &aw_dev->monitor_desc;
> +	struct aw_monitor_cfg *monitor_cfg = &monitor->monitor_cfg;
> +	struct aw_monitor_trace *vol_trace = &monitor->vol_trace;
> +	struct aw_monitor_trace *temp_trace = &monitor->temp_trace;
> +	int ret;
> +
> +	if (monitor_cfg->vol_switch) {
> +		ret = aw_monitor_get_data_from_table(aw_dev,
> +			monitor_cfg->vol_info, vol_trace,
> +			monitor_cfg->vol_aplha);
> +		if (ret < 0)
> +			return ret;
> +	} else {
> +		vol_trace->aw_table.ipeak = IPEAK_NONE;
> +		vol_trace->aw_table.gain = GAIN_NONE;
> +		vol_trace->aw_table.vmax = VMAX_NONE;
> +	}
> +
> +	if (monitor_cfg->temp_switch) {
> +		ret = aw_monitor_get_data_from_table(aw_dev,
> +			monitor_cfg->temp_info, temp_trace,
> +			monitor_cfg->temp_aplha);
> +		if (ret < 0)
> +			return ret;
> +	} else {
> +		temp_trace->aw_table.ipeak = IPEAK_NONE;
> +		temp_trace->aw_table.gain = GAIN_NONE;
> +		temp_trace->aw_table.vmax = VMAX_NONE;
> +	}
> +
> +	aw_dev_dbg(aw_dev->dev,
> +			"filter_vol:%d, vol: ipeak = 0x%x, gain = 0x%x, vmax = 0x%x",
> +			monitor->vol_trace.sum_val, vol_trace->aw_table.ipeak,
> +			vol_trace->aw_table.gain, vol_trace->aw_table.vmax);
> +
> +	aw_dev_dbg(aw_dev->dev,
> +			"filter_temp:%d, temp: ipeak = 0x%x, gain = 0x%x, vmax = 0x%x",
> +			monitor->temp_trace.sum_val, temp_trace->aw_table.ipeak,
> +			temp_trace->aw_table.gain, temp_trace->aw_table.vmax);
> +	return 0;
> +}
> +
> +static void aw_monitor_get_cfg(struct aw_device *aw_dev,
> +					struct aw_table *set_table)
> +{
> +	struct aw_monitor_desc *monitor = &aw_dev->monitor_desc;
> +	struct aw_table *temp_data = &monitor->temp_trace.aw_table;
> +	struct aw_table *vol_data = &monitor->vol_trace.aw_table;
> +
> +	if (temp_data->ipeak == IPEAK_NONE && vol_data->ipeak == IPEAK_NONE) {
> +		memcpy(set_table, temp_data, sizeof(struct aw_table));
> +	} else if (temp_data->ipeak == IPEAK_NONE) {
> +		memcpy(set_table, vol_data, sizeof(struct aw_table));
> +	} else if (vol_data->ipeak == IPEAK_NONE) {
> +		memcpy(set_table, temp_data, sizeof(struct aw_table));
> +	} else {
> +		if (monitor->monitor_cfg.logic_switch == AW_MON_LOGIC_OR) {
> +			set_table->ipeak = (temp_data->ipeak < vol_data->ipeak ?
> +					temp_data->ipeak : vol_data->ipeak);
> +			set_table->gain = (temp_data->gain < vol_data->gain ?
> +					vol_data->gain : temp_data->gain);
> +			set_table->vmax = (temp_data->vmax < vol_data->vmax ?
> +					vol_data->vmax : temp_data->vmax);
> +		} else {
> +			set_table->ipeak = (temp_data->ipeak < vol_data->ipeak ?
> +				vol_data->ipeak : temp_data->ipeak);
> +			set_table->gain = (temp_data->gain < vol_data->gain ?
> +					temp_data->gain : vol_data->gain);
> +			set_table->vmax = (temp_data->vmax < vol_data->vmax ?
> +					temp_data->vmax : vol_data->vmax);
> +		}
> +	}
> +}
> +
> +static void aw_monitor_set_ipeak(struct aw_device *aw_dev,
> +				uint16_t ipeak)
> +{
> +	struct aw_monitor_cfg *monitor_cfg = &aw_dev->monitor_desc.monitor_cfg;
> +	uint16_t reg_val = 0;
> +	uint16_t read_reg_val;
> +	int ret;
> +	struct aw_ipeak_desc *desc = &aw_dev->ipeak_desc;
> +
> +	if (ipeak == IPEAK_NONE || (!monitor_cfg->ipeak_switch))
> +		return;
> +
> +	ret = aw_dev->ops.aw_reg_read(aw_dev, desc->reg, &reg_val);
> +	if (ret < 0) {
> +		aw_dev_err(aw_dev->dev, "read ipeak failed");
> +		return;
> +	}
> +
> +	read_reg_val = reg_val;
> +	read_reg_val &= (~desc->mask);
> +
> +	if (read_reg_val == ipeak) {
> +		aw_dev_dbg(aw_dev->dev, "ipeak = 0x%x, no change",
> +					read_reg_val);
> +		return;
> +	}
> +	reg_val &= desc->mask;
> +	read_reg_val = ipeak;
> +	reg_val |= read_reg_val;
> +
> +	ret = aw_dev->ops.aw_reg_write(aw_dev, desc->reg, reg_val);
> +	if (ret < 0) {
> +		aw_dev_err(aw_dev->dev, "write ipeak failed");
> +		return;
> +	}
> +	aw_dev_info(aw_dev->dev, "set reg val = 0x%x, ipeak = 0x%x",
> +				reg_val, ipeak);
> +
> +}
> +
> +static void aw_monitor_set_gain(struct aw_device *aw_dev, uint16_t gain)
> +{
> +	uint16_t monitor_vol = 0;
> +	uint16_t compared_vol = 0;
> +	struct aw_monitor_cfg *monitor_cfg = &aw_dev->monitor_desc.monitor_cfg;
> +	struct aw_volume_desc *vol_desc = &aw_dev->volume_desc;
> +
> +	if (gain == GAIN_NONE || (!monitor_cfg->gain_switch))
> +		return;
> +
> +	monitor_vol = aw_dev->ops.aw_reg_val_to_db(gain);
> +	vol_desc->monitor_volume = monitor_vol;
> +
> +	/*get smaller dB*/
> +	compared_vol = AW_GET_MAX_VALUE(vol_desc->ctl_volume,
> +		vol_desc->monitor_volume);
> +
> +	aw883xx_dev_set_volume(aw_dev, compared_vol);
> +}
> +
> +static int aw_monitor_vmax_check(struct aw_device *aw_dev)
> +{
> +	int ret = -1;
> +
> +	ret = aw883xx_dev_syspll_check(aw_dev);
> +	if (ret < 0) {
> +		aw_dev_err(aw_dev->dev, "no iis signal");
> +		return ret;
> +	}
> +
> +	ret = aw883xx_dev_get_dsp_status(aw_dev);
> +	if (ret < 0) {
> +		aw_dev_err(aw_dev->dev, "dsp not work");
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static void aw_monitor_set_vmax(struct aw_device *aw_dev,
> +						uint32_t vmax)
> +{
> +	struct aw_monitor_cfg *monitor_cfg = &aw_dev->monitor_desc.monitor_cfg;
> +	struct aw_vmax_desc *desc = &aw_dev->vmax_desc;
> +	uint16_t vmax_set;
> +	int ret = -1;
> +
> +	if (vmax == VMAX_NONE || (!monitor_cfg->vmax_switch))
> +		return;
> +
> +	ret = aw_monitor_vmax_check(aw_dev);
> +	if (ret < 0) {
> +		aw_dev_err(aw_dev->dev, "vmax_check fail, ret=%d", ret);
> +		return;
> +	}
> +
> +	if ((vmax == aw_dev->monitor_desc.pre_vmax) &&
> +		(aw_dev->monitor_desc.first_entry != AW_FIRST_ENTRY)) {
> +		aw_dev_dbg(aw_dev->dev, "vmax = 0x%x, no change", vmax);
> +		return;
> +	}
> +
> +	vmax_set = (uint16_t)((int16_t)vmax +
> +		(int16_t)aw_dev->vmax_desc.init_vmax);
> +
> +
> +	ret = aw_dev->ops.aw_dsp_write(aw_dev,
> +		desc->dsp_reg, vmax_set, desc->data_type);
> +	if (ret < 0)
> +		return;
> +
> +	aw_dev_info(aw_dev->dev, "get monitor vmax = 0x%x, set vmax = 0x%x",
> +		vmax, vmax_set);
> +}
> +
> +static void aw_monitor_check_sysint(struct aw_device *aw_dev)
> +{
> +	int ret = -1;
> +	uint16_t sysint = 0;
> +	struct aw_int_desc *desc = &aw_dev->int_desc;
> +
> +	ret = aw883xx_dev_get_int_status(aw_dev, &sysint);
> +	if (ret < 0)
> +		aw_dev_err(aw_dev->dev, "get_sysint fail, ret=%d", ret);
> +
> +	if (sysint & (desc->intst_mask)) {
> +		desc->sysint_st = sysint;
> +		aw_dev_err(aw_dev->dev, "check sysint fail, reg=0x%04x", sysint);
> +	}
> +}
> +
> +static int aw_monitor_work(struct aw_device *aw_dev)
> +{
> +	struct aw_monitor_desc *monitor = &aw_dev->monitor_desc;
> +	struct aw_monitor_cfg *monitor_cfg = &monitor->monitor_cfg;
> +	struct aw_table set_table;
> +	int ret = -1;
> +
> +	if (aw883xx_cali_svc_get_cali_status(&aw_dev->cali_desc)) {
> +		aw_dev_info(aw_dev->dev, "done nothing during calibration");
> +		return 0;
> +	}
> +
> +	ret = aw_monitor_get_temp_and_vol(aw_dev);
> +	if (ret < 0)
> +		return ret;
> +
> +	if (monitor->samp_count < monitor_cfg->monitor_count &&
> +		(monitor->first_entry == AW_NOT_FIRST_ENTRY))
> +		return 0;
> +
> +	ret = aw_monitor_get_data(aw_dev);
> +	if (ret < 0)
> +		return ret;
> +
> +	aw_monitor_get_cfg(aw_dev, &set_table);
> +
> +	aw_dev_dbg(aw_dev->dev,
> +		"set_ipeak = 0x%x, set_gain = 0x%x, set_vmax = 0x%x",
> +		set_table.ipeak, set_table.gain, set_table.vmax);
> +
> +	aw_monitor_set_ipeak(aw_dev, set_table.ipeak);
> +
> +	aw_monitor_set_gain(aw_dev, set_table.gain);
> +
> +	aw_monitor_set_vmax(aw_dev, set_table.vmax);
> +
> +	aw_monitor_check_sysint(aw_dev);
> +
> +	monitor->samp_count = 0;
> +	monitor->temp_trace.pre_val = monitor->temp_trace.sum_val;
> +	monitor->temp_trace.sum_val = 0;
> +
> +	monitor->vol_trace.pre_val = monitor->vol_trace.sum_val;
> +	monitor->vol_trace.sum_val = 0;
> +
> +	if (monitor->first_entry == AW_FIRST_ENTRY)
> +		monitor->first_entry = AW_NOT_FIRST_ENTRY;
> +
> +	return 0;
> +}
> +
> +static void aw_monitor_work_func(struct work_struct *work)
> +{
> +	struct aw_device *aw_dev  = container_of(work,
> +		struct aw_device, monitor_desc.delay_work.work);
> +	struct aw883xx *aw883xx = (struct aw883xx *)aw_dev->private_data;
> +	struct aw_monitor_cfg *monitor_cfg = &aw_dev->monitor_desc.monitor_cfg;
> +	struct aw_monitor_desc *monitor = &aw_dev->monitor_desc;
> +
> +	aw_dev_dbg(aw_dev->dev, "scene_mode %d,monitor_status:%d, monitor_switch:%d",
> +		aw_dev->cur_prof, monitor_cfg->monitor_status,
> +		monitor_cfg->monitor_switch);
> +
> +	if ((monitor_cfg->monitor_status == AW_MON_CFG_OK) &&
> +		monitor_cfg->monitor_switch) {
> +
> +		if (!aw883xx_dev_get_hmute(aw_dev)) {
> +			aw_monitor_work(aw_dev);
> +			queue_delayed_work(aw883xx->work_queue,
> +				&monitor->delay_work,
> +				msecs_to_jiffies(monitor_cfg->monitor_time));
> +		}
> +
> +	}
> +}
> +
> +static int aw_hw_monitor_work(struct aw_device *aw_dev)
> +{
> +	int32_t sys_temp;
> +
> +	aw_monitor_get_system_temperature(aw_dev, &sys_temp);
> +
> +	aw_monitor_set_system_temperature(aw_dev, sys_temp);
> +
> +	return 0;
> +}
> +
> +static void aw_hw_monitor_work_func(struct work_struct *work)
> +{
> +	struct aw_device *aw_dev  = container_of(work,
> +		struct aw_device, monitor_desc.hw_monitor_work.work);
> +	struct aw883xx *aw883xx = (struct aw883xx *)aw_dev->private_data;
> +	struct aw_monitor_desc *monitor = &aw_dev->monitor_desc;
> +
> +	if (!aw883xx_dev_get_hmute(aw_dev)) {
> +		aw_hw_monitor_work(aw_dev);
> +		queue_delayed_work(aw883xx->work_queue,
> +					&monitor->hw_monitor_work,
> +					msecs_to_jiffies(monitor->hw_monitor_delay));
> +	}
> +}
> +
> +void aw883xx_monitor_start(struct aw_monitor_desc *monitor_desc)
> +{
> +	uint8_t temp_flag = monitor_desc->hw_temp_flag;
> +	struct aw_device *aw_dev = container_of(monitor_desc,
> +			struct aw_device, monitor_desc);
> +	struct aw883xx *aw883xx = (struct aw883xx *)aw_dev->private_data;
> +
> +	aw_dev_info(aw_dev->dev, "enter");
> +
> +	if (aw_dev->profctrl_desc.cur_mode == AW_RCV_MODE) {
> +		aw_dev_dbg(aw_dev->dev, "receiver mode no need to start monitor");
> +		return;
> +	}
> +
> +	if (monitor_desc->hw_mon_en) {
> +		aw_dev_info(aw_dev->dev, "hardware monitor is enable");
> +		if (temp_flag == AW_EXTERNAL_TEMP) {
> +			queue_delayed_work(aw883xx->work_queue,
> +					&monitor_desc->hw_monitor_work, 0);
> +		} else {
> +			aw_dev_dbg(aw_dev->dev, "Internal chip temperature used");
> +		}
> +		return;
> +	}
> +
> +	monitor_desc->first_entry = AW_FIRST_ENTRY;
> +	monitor_desc->samp_count = 0;
> +	monitor_desc->vol_trace.sum_val = 0;
> +	monitor_desc->temp_trace.sum_val = 0;
> +
> +	queue_delayed_work(aw883xx->work_queue,
> +				&monitor_desc->delay_work, 0);
> +}
> +
> +int aw883xx_monitor_stop(struct aw_monitor_desc *monitor_desc)
> +{
> +	struct aw_device *aw_dev = container_of(monitor_desc,
> +			struct aw_device, monitor_desc);
> +
> +	aw_dev_info(aw_dev->dev, "enter");
> +
> +	aw_dev->volume_desc.monitor_volume = 0;
> +	cancel_delayed_work_sync(&monitor_desc->delay_work);
> +	cancel_delayed_work_sync(&monitor_desc->hw_monitor_work);
> +
> +	return 0;
> +
> +}
> +
> +/*
> + * load monitor config
> + */
> +static int aw_monitor_param_check_sum(struct aw_device *aw_dev,
> +					uint8_t *data, uint32_t data_len)
> +{
> +	int i, check_sum = 0;
> +	struct aw_monitor_hdr_v_0_1_1 *monitor_hdr =
> +		(struct aw_monitor_hdr_v_0_1_1 *)data;
> +
> +	if (data_len < sizeof(struct aw_monitor_hdr_v_0_1_1)) {
> +		aw_dev_err(aw_dev->dev,
> +			"data size smaller than hdr , please check monitor bin");
> +		return -ENOMEM;
> +	}
> +
> +	for (i = 4 ; i < data_len; i++)
> +		check_sum += (uint8_t)data[i];
> +
> +	if (monitor_hdr->check_sum != check_sum) {
> +		aw_dev_err(aw_dev->dev,
> +			"check_sum[%d] is not equal to actual check_sum[%d]",
> +				monitor_hdr->check_sum, check_sum);
> +		return -ENOMEM;
> +	}
> +
> +	return 0;
> +}
> +
> +static void aw_monitor_write_data_to_table(struct aw_device *aw_dev,
> +		struct aw_table_info *table_info, const char *offset_ptr)
> +{
> +	int i;
> +	int table_size = AW_TABLE_SIZE;
> +
> +	for (i = 0; i < table_info->table_num * table_size; i += table_size) {
> +		table_info->aw_table[i / AW_TABLE_SIZE].min_val =
> +			AW_GET_16_DATA(offset_ptr[1 + i], offset_ptr[i]);
> +		table_info->aw_table[i / AW_TABLE_SIZE].max_val =
> +			AW_GET_16_DATA(offset_ptr[3 + i], offset_ptr[2 + i]);
> +		table_info->aw_table[i / AW_TABLE_SIZE].ipeak =
> +			AW_GET_16_DATA(offset_ptr[5 + i], offset_ptr[4 + i]);
> +		table_info->aw_table[i / AW_TABLE_SIZE].gain =
> +			AW_GET_16_DATA(offset_ptr[7 + i], offset_ptr[6 + i]);
> +		table_info->aw_table[i / AW_TABLE_SIZE].vmax =
> +			AW_GET_32_DATA(offset_ptr[11 + i], offset_ptr[10 + i],
> +				offset_ptr[9 + i], offset_ptr[8 + i]);
> +	}
> +
> +	for (i = 0; i < table_info->table_num; i++)
> +		aw_dev_info(aw_dev->dev,
> +			"min_val:%d, max_val:%d, ipeak:0x%x, gain:0x%x, vmax:0x%x",
> +			table_info->aw_table[i].min_val,
> +			table_info->aw_table[i].max_val,
> +			table_info->aw_table[i].ipeak,
> +			table_info->aw_table[i].gain,
> +			table_info->aw_table[i].vmax);
> +
> +}
> +
> +static int aw_monitor_parse_vol_data_v_0_1_1(struct aw_device *aw_dev, uint8_t *data)
> +{
> +	struct aw_monitor_hdr_v_0_1_1 *monitor_hdr =
> +			(struct aw_monitor_hdr_v_0_1_1 *)data;
> +	struct aw_table_info *vol_info =
> +		&aw_dev->monitor_desc.monitor_cfg.vol_info;
> +
> +	aw_dev_info(aw_dev->dev, "===parse vol start ===");
> +	if (vol_info->aw_table != NULL) {
> +		devm_kfree(aw_dev->dev, vol_info->aw_table);
> +		vol_info->aw_table = NULL;
> +	}
> +
> +	vol_info->aw_table = devm_kzalloc(aw_dev->dev,
> +					(monitor_hdr->vol_num * AW_TABLE_SIZE),
> +					GFP_KERNEL);
> +	if (vol_info->aw_table == NULL)
> +		return -ENOMEM;
> +
> +	vol_info->table_num = monitor_hdr->vol_num;
> +	aw_monitor_write_data_to_table(aw_dev, vol_info,
> +		&data[monitor_hdr->vol_offset]);
> +	aw_dev_info(aw_dev->dev, "===parse vol end ===");
> +	return 0;
> +}
> +
> +static int aw_monitor_parse_temp_data_v_0_1_1(struct aw_device *aw_dev, uint8_t *data)
> +{
> +	struct aw_monitor_hdr_v_0_1_1 *monitor_hdr =
> +			(struct aw_monitor_hdr_v_0_1_1 *)data;
> +	struct aw_table_info *temp_info =
> +		&aw_dev->monitor_desc.monitor_cfg.temp_info;
> +
> +	aw_dev_info(aw_dev->dev, "===parse temp start ===");
> +
> +	if (temp_info->aw_table != NULL) {
> +		devm_kfree(aw_dev->dev, temp_info->aw_table);
> +		temp_info->aw_table = NULL;
> +	}
> +
> +	temp_info->aw_table = devm_kzalloc(aw_dev->dev,
> +					(monitor_hdr->temp_num * AW_TABLE_SIZE),
> +					GFP_KERNEL);
> +	if (temp_info->aw_table == NULL)
> +		return -ENOMEM;
> +
> +	temp_info->table_num = monitor_hdr->temp_num;
> +	aw_monitor_write_data_to_table(aw_dev, temp_info,
> +		&data[monitor_hdr->temp_offset]);
> +	aw_dev_info(aw_dev->dev, "===parse temp end ===");
> +	return 0;
> +}
> +
> +static void aw_monitor_parse_hdr_v_0_1_1(struct aw_device *aw_dev, uint8_t *data)
> +{
> +	struct aw_monitor_hdr_v_0_1_1 *monitor_hdr =
> +			(struct aw_monitor_hdr_v_0_1_1 *)data;
> +	struct aw_monitor_cfg *monitor_cfg = &aw_dev->monitor_desc.monitor_cfg;
> +
> +	monitor_cfg->monitor_switch =
> +		(monitor_hdr->enable_flag >> MONITOR_EN_BIT) & MONITOR_EN_MASK;
> +	monitor_cfg->monitor_time = monitor_hdr->monitor_time;
> +	monitor_cfg->monitor_count = monitor_hdr->monitor_count;
> +	monitor_cfg->ipeak_switch =
> +		(monitor_hdr->enable_flag >> MONITOR_IPEAK_EN_BIT) & MONITOR_EN_MASK;
> +	monitor_cfg->logic_switch =
> +		(monitor_hdr->enable_flag >> MONITOR_LOGIC_BIT) & MONITOR_EN_MASK;
> +	monitor_cfg->gain_switch =
> +		(monitor_hdr->enable_flag >> MONITOR_GAIN_EN_BIT) & MONITOR_EN_MASK;
> +	monitor_cfg->vmax_switch =
> +		(monitor_hdr->enable_flag >> MONITOR_VMAX_EN_BIT) & MONITOR_EN_MASK;
> +	monitor_cfg->temp_switch =
> +		(monitor_hdr->enable_flag >> MONITOR_TEMP_EN_BIT) & MONITOR_EN_MASK;
> +	monitor_cfg->temp_aplha = monitor_hdr->temp_aplha;
> +	monitor_cfg->vol_switch =
> +		(monitor_hdr->enable_flag >> MONITOR_VOL_EN_BIT) & MONITOR_EN_MASK;
> +	monitor_cfg->vol_aplha = monitor_hdr->vol_aplha;
> +
> +	aw_dev_info(aw_dev->dev, "chip name:%s",
> +		monitor_hdr->chip_type);
> +	aw_dev_info(aw_dev->dev, "ui ver:0x%x",
> +		monitor_hdr->ui_ver);
> +
> +	aw_dev_info(aw_dev->dev,
> +		"monitor_switch:%d, monitor_time:%d (ms), monitor_count:%d",
> +		monitor_cfg->monitor_switch, monitor_cfg->monitor_time,
> +		monitor_cfg->monitor_count);
> +
> +	aw_dev_info(aw_dev->dev,
> +		"logic_switch:%d, ipeak_switch:%d, gain_switch:%d, vmax_switch:%d",
> +		monitor_cfg->logic_switch, monitor_cfg->ipeak_switch,
> +		monitor_cfg->gain_switch, monitor_cfg->vmax_switch);
> +
> +	aw_dev_info(aw_dev->dev,
> +		"temp_switch:%d, temp_aplha:%d, vol_switch:%d, vol_aplha:%d",
> +		monitor_cfg->temp_switch, monitor_cfg->temp_aplha,
> +		monitor_cfg->vol_switch, monitor_cfg->vol_aplha);
> +}
> +
> +static int aw_monitor_check_fw_v_0_1_1(struct aw_device *aw_dev,
> +					uint8_t *data, uint32_t data_len)
> +{
> +	struct aw_monitor_hdr_v_0_1_1 *monitor_hdr =
> +				(struct aw_monitor_hdr_v_0_1_1 *)data;
> +	int temp_size, vol_size;
> +
> +	if (data_len < sizeof(struct aw_monitor_hdr_v_0_1_1)) {
> +		aw_dev_err(aw_dev->dev,
> +			"params size[%d] < struct aw_monitor_hdr size[%d]!",
> +			data_len, (int)sizeof(struct aw_monitor_hdr_v_0_1_1));
> +		return -ENOMEM;
> +	}
> +
> +	if (monitor_hdr->temp_offset > data_len) {
> +		aw_dev_err(aw_dev->dev, "temp_offset[%d] overflow file size[%d]!",
> +			monitor_hdr->temp_offset, data_len);
> +		return -ENOMEM;
> +	}
> +
> +	if (monitor_hdr->vol_offset > data_len) {
> +		aw_dev_err(aw_dev->dev, "vol_offset[%d] overflow file size[%d]!",
> +			monitor_hdr->vol_offset, data_len);
> +		return -ENOMEM;
> +	}
> +
> +	temp_size = monitor_hdr->temp_num * monitor_hdr->single_temp_size;
> +	if (temp_size > data_len) {
> +		aw_dev_err(aw_dev->dev, "temp_size:[%d] overflow file size[%d]!",
> +			temp_size, data_len);
> +		return -ENOMEM;
> +	}
> +
> +	vol_size = monitor_hdr->vol_num * monitor_hdr->single_vol_size;
> +	if (vol_size > data_len) {
> +		aw_dev_err(aw_dev->dev, "vol_size:[%d] overflow file size[%d]!",
> +			vol_size, data_len);
> +		return -ENOMEM;
> +	}
> +
> +	return 0;
> +}
> +
> +static int aw_monitor_parse_data_v_0_1_1(struct aw_device *aw_dev,
> +				uint8_t *data, uint32_t data_len)
> +{
> +	int ret;
> +	struct aw_monitor_cfg *monitor_cfg = &aw_dev->monitor_desc.monitor_cfg;
> +
> +	ret = aw_monitor_check_fw_v_0_1_1(aw_dev, data, data_len);
> +	if (ret < 0) {
> +		aw_dev_err(aw_dev->dev, "check monitor failed");
> +		return ret;
> +	}
> +
> +	aw_monitor_parse_hdr_v_0_1_1(aw_dev, data);
> +
> +	ret = aw_monitor_parse_temp_data_v_0_1_1(aw_dev, data);
> +	if (ret < 0)
> +		return ret;
> +
> +	ret = aw_monitor_parse_vol_data_v_0_1_1(aw_dev, data);
> +	if (ret < 0) {
> +		if (monitor_cfg->temp_info.aw_table != NULL) {
> +			devm_kfree(aw_dev->dev, monitor_cfg->temp_info.aw_table);
> +			monitor_cfg->temp_info.aw_table = NULL;
> +			monitor_cfg->temp_info.table_num = 0;
> +		}
> +		return ret;
> +	}
> +
> +	monitor_cfg->monitor_status = AW_MON_CFG_OK;
> +	return 0;
> +}
> +
> +int aw883xx_monitor_parse_fw(struct aw_monitor_desc *monitor_desc,
> +				uint8_t *data, uint32_t data_len)
> +{
> +	struct aw_monitor_hdr_v_0_1_1 *monitor_hdr = NULL;
> +	struct aw_device *aw_dev = NULL;
> +	int ret;
> +
> +	if (monitor_desc == NULL || data == NULL) {
> +		pr_err("monitor_desc or data is NULL");
> +		return -EINVAL;
> +	}
> +
> +	monitor_hdr = (struct aw_monitor_hdr_v_0_1_1 *)data;
> +	aw_dev = container_of(monitor_desc,
> +			struct aw_device, monitor_desc);
> +
> +	ret = aw_monitor_param_check_sum(aw_dev, data, data_len);
> +	if (ret < 0)
> +		return ret;
> +
> +	switch (monitor_hdr->monitor_ver) {
> +	case AW_MONITOR_HDR_VER_0_1_1:
> +		return aw_monitor_parse_data_v_0_1_1(aw_dev, data, data_len);
> +	default:
> +		aw_dev_err(aw_dev->dev, "cfg version:0x%x unsupported",
> +				monitor_hdr->monitor_ver);
> +		return -EINVAL;
> +	}
> +}
> +
> +static void aw_monitor_free_firmware(struct aw_device *aw_dev)
> +{
> +	struct aw_monitor_cfg *monitor_cfg =
> +				&aw_dev->monitor_desc.monitor_cfg;
> +
> +	monitor_cfg->monitor_status = AW_MON_CFG_ST;
> +
> +	if (monitor_cfg->temp_info.aw_table != NULL) {
> +		devm_kfree(aw_dev->dev, monitor_cfg->temp_info.aw_table);
> +		monitor_cfg->temp_info.aw_table = NULL;
> +	}
> +
> +	if (monitor_cfg->vol_info.aw_table != NULL) {
> +		devm_kfree(aw_dev->dev, monitor_cfg->vol_info.aw_table);
> +		monitor_cfg->vol_info.aw_table = NULL;
> +	}
> +
> +	memset(monitor_cfg, 0, sizeof(struct aw_monitor_cfg));
> +}
> +
> +static int aw_monitor_real_time_update_monitor(struct aw_device *aw_dev)
> +{
> +	const struct firmware *cont = NULL;
> +	struct aw_container *aw_monitor_cnt = NULL;
> +	int ret;
> +
> +	ret = request_firmware(&cont, AW883XX_MONITOR_NAME, aw_dev->dev);
> +	if (ret < 0) {
> +		aw_dev_err(aw_dev->dev, "failed to read %s", AW883XX_MONITOR_NAME);
> +		release_firmware(cont);
> +		return ret;
> +	}
> +
> +	aw_monitor_cnt = devm_kzalloc(aw_dev->dev,
> +			cont->size + sizeof(uint32_t), GFP_KERNEL);
> +	if (aw_monitor_cnt == NULL) {
> +		release_firmware(cont);
> +		return ret;
> +	}
> +
> +	aw_monitor_cnt->len = (int)cont->size;
> +	memcpy(aw_monitor_cnt->data, cont->data, cont->size);
> +	release_firmware(cont);
> +
> +	ret = aw883xx_monitor_parse_fw(&aw_dev->monitor_desc,
> +			aw_monitor_cnt->data, aw_monitor_cnt->len);
> +	if (ret < 0)
> +		aw_dev_err(aw_dev->dev, "parse monitor firmware failed!");
> +
> +	devm_kfree(aw_dev->dev, aw_monitor_cnt);
> +	aw_monitor_cnt = NULL;
> +
> +	return ret;
> +}
> +
> +/*
> + * monitor init
> + */
> +#ifdef AW_DEBUG
> +static ssize_t aw_vol_store(struct device *dev,
> +	struct device_attribute *attr, const char *buf, size_t count)
> +{
> +	struct aw883xx *aw883xx = dev_get_drvdata(dev);
> +	struct aw_device *aw_dev = aw883xx->aw_pa;
> +	uint32_t vol = 0;
> +	int ret = -1;
> +
> +	if (count == 0)
> +		return 0;
> +
> +	ret = kstrtouint(buf, 0, &vol);
> +	if (ret < 0)
> +		return ret;
> +
> +	aw_dev_info(aw_dev->dev, "vol set =%d", vol);
> +	aw_dev->monitor_desc.test_vol = vol;
> +
> +	return count;
> +}
> +
> +static ssize_t aw_vol_show(struct device *dev,
> +	struct device_attribute *attr, char *buf)
> +{
> +	struct aw883xx *aw883xx = dev_get_drvdata(dev);
> +	struct aw_device *aw_dev = aw883xx->aw_pa;
> +	ssize_t len = 0;
> +
> +	len += snprintf(buf+len, PAGE_SIZE-len,
> +		"vol: %d\n",
> +		aw_dev->monitor_desc.test_vol);
> +	return len;
> +}
> +
> +static ssize_t aw_temp_store(struct device *dev,
> +	struct device_attribute *attr, const char *buf, size_t count)
> +{
> +	struct aw883xx *aw883xx = dev_get_drvdata(dev);
> +	struct aw_device *aw_dev = aw883xx->aw_pa;
> +	int32_t temp = 0;
> +	int ret = -1;
> +
> +	if (count == 0)
> +		return 0;
> +
> +	ret = kstrtoint(buf, 0, &temp);
> +	if (ret < 0)
> +		return ret;
> +
> +	aw_dev_info(aw_dev->dev, "temp set =%d", temp);
> +
> +	aw_dev->monitor_desc.test_temp = temp;
> +
> +	return count;
> +}
> +
> +static ssize_t aw_temp_show(struct device *dev,
> +	struct device_attribute *attr, char *buf)
> +{
> +	struct aw883xx *aw883xx = dev_get_drvdata(dev);
> +	struct aw_device *aw_dev = aw883xx->aw_pa;
> +	ssize_t len = 0;
> +
> +	len += snprintf(buf+len, PAGE_SIZE-len,
> +		"aw883xx temp: %d\n",
> +		aw_dev->monitor_desc.test_temp);
> +
> +	return len;
> +}
> +
> +static DEVICE_ATTR(vol, 0644,
> +	aw_vol_show, aw_vol_store);
> +static DEVICE_ATTR(temp, 0644,
> +	aw_temp_show, aw_temp_store);
> +#endif
> +
> +static ssize_t aw_monitor_store(struct device *dev,
> +	struct device_attribute *attr, const char *buf, size_t count)
> +{
> +	struct aw883xx *aw883xx = dev_get_drvdata(dev);
> +	struct aw_device *aw_dev = aw883xx->aw_pa;
> +	uint32_t enable = 0;
> +	int ret = -1;
> +
> +	if (count == 0)
> +		return 0;
> +
> +	ret = kstrtouint(buf, 0, &enable);
> +	if (ret < 0)
> +		return ret;
> +
> +	aw_dev_info(aw_dev->dev, "monitor enable set =%d", enable);
> +
> +	if (aw_dev->monitor_desc.monitor_cfg.monitor_switch != enable) {
> +		aw_dev->monitor_desc.monitor_cfg.monitor_switch = enable;
> +		if (enable)
> +			aw883xx_monitor_start(&aw_dev->monitor_desc);
> +	} else {
> +		return count;
> +	}
> +
> +	return count;
> +}
> +
> +static ssize_t aw_monitor_show(struct device *dev,
> +	struct device_attribute *attr, char *buf)
> +{
> +	struct aw883xx *aw883xx = dev_get_drvdata(dev);
> +	struct aw_device *aw_dev = aw883xx->aw_pa;
> +	ssize_t len = 0;
> +
> +
> +	len += snprintf(buf+len, PAGE_SIZE-len,
> +		"aw883xx monitor_flag=%u\n",
> +		aw_dev->monitor_desc.monitor_cfg.monitor_switch);
> +	return len;
> +}
> +
> +static ssize_t aw_monitor_update_store(struct device *dev,
> +	struct device_attribute *attr, const char *buf, size_t count)
> +{
> +	struct aw883xx *aw883xx = dev_get_drvdata(dev);
> +	struct aw_device *aw_dev = aw883xx->aw_pa;
> +
> +	uint32_t update = 0;
> +	int ret = -1;
> +
> +	if (count == 0)
> +		return 0;
> +
> +	ret = kstrtouint(buf, 0, &update);
> +	if (ret < 0)
> +		return ret;
> +
> +	aw_dev_info(aw_dev->dev, "monitor update = %d", update);
> +
> +	if (update) {
> +		aw883xx_monitor_stop(&aw_dev->monitor_desc);
> +		aw_monitor_free_firmware(aw_dev);
> +		ret = aw_monitor_real_time_update_monitor(aw_dev);
> +		if (ret < 0)
> +			return ret;
> +		aw883xx_monitor_start(&aw_dev->monitor_desc);
> +	}
> +
> +	return count;
> +}
> +
> +static DEVICE_ATTR(monitor, 0644,
> +	aw_monitor_show, aw_monitor_store);
> +static DEVICE_ATTR(monitor_update, 0200,
> +	NULL, aw_monitor_update_store);
> +
> +
> +static struct attribute *aw_monitor_attr[] = {
> +	&dev_attr_monitor.attr,
> +	&dev_attr_monitor_update.attr,
> +#ifdef AW_DEBUG
> +	&dev_attr_vol.attr,
> +	&dev_attr_temp.attr,
> +#endif
> +	NULL
> +};
> +
> +static struct attribute_group aw_monitor_attr_group = {
> +	.attrs = aw_monitor_attr,
> +};
> +
> +static void aw_monitor_parse_dt(struct aw_device *aw_dev)
> +{
> +	int ret = -1;
> +	uint32_t monitor_delay;
> +	struct device_node *np = aw_dev->dev->of_node;
> +
> +	ret = of_property_read_u32(np, "hw-monitor-delay", &monitor_delay);
> +	if (ret < 0) {
> +		aw_dev_info(aw_dev->dev,
> +			"read hw-monitor-delay failed, set default value:[%d]ms",
> +			aw_dev->monitor_desc.hw_monitor_delay);
> +	} else {
> +		aw_dev_info(aw_dev->dev,
> +			"parse hw-monitor-delay:[%d]", monitor_delay);
> +		aw_dev->monitor_desc.hw_monitor_delay = monitor_delay;
> +	}
> +}
> +
> +void aw883xx_monitor_init(struct aw_monitor_desc *monitor_desc)
> +{
> +	int ret;
> +	struct aw_device *aw_dev = container_of(monitor_desc,
> +				struct aw_device, monitor_desc);
> +
> +	aw_dev_info(aw_dev->dev, "enter");
> +
> +	aw_monitor_parse_dt(aw_dev);
> +
> +#ifdef AW_DEBUG
> +	monitor_desc->test_vol = 0;
> +	monitor_desc->test_temp = 0;
> +#endif
> +
> +	INIT_DELAYED_WORK(&monitor_desc->delay_work, aw_monitor_work_func);
> +	INIT_DELAYED_WORK(&monitor_desc->hw_monitor_work, aw_hw_monitor_work_func);
> +
> +	ret = sysfs_create_group(&aw_dev->dev->kobj,
> +				&aw_monitor_attr_group);
> +	if (ret < 0)
> +		aw_dev_err(aw_dev->dev, "error creating sysfs attr files");
> +}
> +
> +void aw883xx_monitor_deinit(struct aw_monitor_desc *monitor_desc)
> +{
> +	struct aw_device *aw_dev =
> +		container_of(monitor_desc, struct aw_device, monitor_desc);
> +
> +	aw883xx_monitor_stop(monitor_desc);
> +
> +	sysfs_remove_group(&aw_dev->dev->kobj, &aw_monitor_attr_group);
> +}
> +
> diff --git a/sound/soc/codecs/aw883xx/aw883xx_monitor.h b/sound/soc/codecs/aw883xx/aw883xx_monitor.h
> new file mode 100644
> index 0000000..5a1a017
> --- /dev/null
> +++ b/sound/soc/codecs/aw883xx/aw883xx_monitor.h
> @@ -0,0 +1,167 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * aw883xx.c --  ALSA Soc AW883XX codec support
> + *
> + * Copyright (c) 2020 AWINIC Technology CO., LTD
> + *
> + * Author: Bruce zhao <zhaolei@awinic.com>
> + */
> +
> +#ifndef __AW883XX_MONITOR_H__
> +#define __AW883XX_MONITOR_H__
> +
> +/*#define AW_DEBUG*/
> +/*#define AW_SYS_BATTERY_ST*/
> +
> +struct aw_table;
> +
> +#define AW_TABLE_SIZE	sizeof(struct aw_table)
> +#define AW_MONITOR_DEFAULT_FLAG (0)
> +
> +#define IPEAK_NONE	(0xFF)
> +#define GAIN_NONE	(0xFF)
> +#define VMAX_NONE	(0xFFFFFFFF)
> +
> +
> +#define AW_GET_32_DATA(w, x, y, z) \
> +		((uint32_t)((((uint8_t)w) << 24) | (((uint8_t)x) << 16) | \
> +		(((uint8_t)y) << 8) | ((uint8_t)z)))
> +#define AW_GET_16_DATA(x, y) \
> +		((uint16_t)((((uint8_t)x) << 8) | (uint8_t)y))
> +
> +enum {
> +	AW_MON_LOGIC_OR = 0,
> +	AW_MON_LOGIC_AND = 1,
> +};
> +
> +enum {
> +	AW_FIRST_ENTRY = 0,
> +	AW_NOT_FIRST_ENTRY = 1,
> +};
> +
> +enum aw_monitor_hdr_ver {
> +	AW_MONITOR_HDR_VER_0_1_1 = 0x00010100,
> +};
> +
> +enum aw_monitor_init {
> +	AW_MON_CFG_ST = 0,
> +	AW_MON_CFG_OK = 1,
> +};
> +
> +#define MONITOR_EN_MASK  0x01
> +
> +enum {
> +	MONITOR_EN_BIT = 0,
> +	MONITOR_LOGIC_BIT = 1,
> +	MONITOR_IPEAK_EN_BIT = 2,
> +	MONITOR_GAIN_EN_BIT = 3,
> +	MONITOR_VMAX_EN_BIT = 4,
> +	MONITOR_TEMP_EN_BIT = 5,
> +	MONITOR_VOL_EN_BIT = 6,
> +};
> +
> +enum {
> +	AW_INTERNAL_TEMP = 0,
> +	AW_EXTERNAL_TEMP = 1,
> +};
> +
> +struct aw_monitor_hdr_v_0_1_1 {
> +	uint32_t check_sum;
> +	uint32_t monitor_ver;
> +	char chip_type[16];
> +	uint32_t ui_ver;
> +	uint32_t monitor_time;
> +	uint32_t monitor_count;
> +	uint32_t enable_flag;
> +		/* [bit 31:7]*/
> +		/* [bit 6: vol en]*/
> +		/* [bit 5: temp en]*/
> +		/* [bit 4: vmax en]*/
> +		/* [bit 3: gain en]*/
> +		/* [bit 2: ipeak en]*/
> +		/* [bit 1: & or | flag]*/
> +		/* [bit 0: monitor en]*/
> +	uint32_t temp_aplha;
> +	uint32_t temp_num;
> +	uint32_t single_temp_size;
> +	uint32_t temp_offset;
> +	uint32_t vol_aplha;
> +	uint32_t vol_num;
> +	uint32_t single_vol_size;
> +	uint32_t vol_offset;
> +	uint32_t reserver[3];
> +};
> +
> +struct aw_table {
> +	int16_t min_val;
> +	int16_t max_val;
> +	uint16_t ipeak;
> +	uint16_t gain;
> +	uint32_t vmax;
> +};
> +
> +struct aw_table_info {
> +	uint8_t table_num;
> +	struct aw_table *aw_table;
> +};
> +
> +struct aw_monitor_cfg {
> +	uint8_t monitor_status;
> +	uint32_t monitor_switch;
> +	uint32_t monitor_time;
> +	uint32_t monitor_count;
> +	uint32_t logic_switch;
> +	uint32_t temp_switch;
> +	uint32_t temp_aplha;
> +	uint32_t vol_switch;
> +	uint32_t vol_aplha;
> +	uint32_t ipeak_switch;
> +	uint32_t gain_switch;
> +	uint32_t vmax_switch;
> +	struct aw_table_info temp_info;
> +	struct aw_table_info vol_info;
> +};
> +
> +struct aw_monitor_trace {
> +	int32_t pre_val;
> +	int32_t sum_val;
> +	struct aw_table aw_table;
> +};
> +
> +
> +/*
> + * struct aw882xx monitor
> + */
> +struct aw_monitor_desc {
> +	struct delayed_work delay_work;
> +	struct delayed_work hw_monitor_work;
> +	struct aw_monitor_cfg monitor_cfg;
> +	bool hw_mon_en;
> +
> +	uint8_t hw_temp_flag;
> +	uint8_t first_entry;
> +	uint8_t samp_count;
> +	uint32_t pre_vmax;
> +	uint32_t hw_monitor_delay;
> +
> +	struct aw_monitor_trace temp_trace;
> +	struct aw_monitor_trace vol_trace;
> +
> +#ifdef AW_DEBUG
> +	uint16_t test_vol;
> +	int16_t test_temp;
> +#endif
> +};
> +
> +/*
> + * aw882xx monitor functions
> + */
> +void aw883xx_monitor_start(struct aw_monitor_desc *monitor_desc);
> +int aw883xx_monitor_stop(struct aw_monitor_desc *monitor_desc);
> +void aw883xx_monitor_init(struct aw_monitor_desc *monitor_desc);
> +void aw883xx_monitor_deinit(struct aw_monitor_desc *monitor_desc);
> +int aw883xx_monitor_parse_fw(struct aw_monitor_desc *monitor_desc,
> +				uint8_t *data, uint32_t data_len);
> +
> +#endif
> +
> diff --git a/sound/soc/codecs/aw883xx/aw883xx_pid_2049_reg.h b/sound/soc/codecs/aw883xx/aw883xx_pid_2049_reg.h
> new file mode 100644
> index 0000000..afddec5
> --- /dev/null
> +++ b/sound/soc/codecs/aw883xx/aw883xx_pid_2049_reg.h
> @@ -0,0 +1,2388 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * aw883xx.c --  ALSA Soc AW883XX codec support
> + *
> + * Copyright (c) 2020 AWINIC Technology CO., LTD
> + *
> + * Author: Bruce zhao <zhaolei@awinic.com>
> + */
> +
> +#ifndef __AW883XX_PID_2049_REG_H__
> +#define __AW883XX_PID_2049_REG_H__
> +
> +/* registers list */
> +#define AW_PID_2049_ID_REG				(0x00)
> +#define AW_PID_2049_SYSST_REG			(0x01)
> +#define AW_PID_2049_SYSINT_REG			(0x02)
> +#define AW_PID_2049_SYSINTM_REG			(0x03)
> +#define AW_PID_2049_SYSCTRL_REG			(0x04)
> +#define AW_PID_2049_SYSCTRL2_REG		(0x05)
> +#define AW_PID_2049_I2SCTRL_REG			(0x06)
> +#define AW_PID_2049_I2SCFG1_REG			(0x07)
> +#define AW_PID_2049_I2SCFG2_REG			(0x08)
> +#define AW_PID_2049_HAGCCFG1_REG		(0x09)
> +#define AW_PID_2049_HAGCCFG2_REG		(0x0A)
> +#define AW_PID_2049_HAGCCFG3_REG		(0x0B)
> +#define AW_PID_2049_HAGCCFG4_REG		(0x0C)
> +#define AW_PID_2049_HAGCCFG5_REG		(0x0D)
> +#define AW_PID_2049_HAGCCFG6_REG		(0x0E)
> +#define AW_PID_2049_HAGCCFG7_REG		(0x0F)
> +#define AW_PID_2049_MPDCFG_REG			(0x10)
> +#define AW_PID_2049_PWMCTRL_REG			(0x11)
> +#define AW_PID_2049_I2SCFG3_REG			(0x12)
> +#define AW_PID_2049_DBGCTRL_REG			(0x13)
> +#define AW_PID_2049_HAGCST_REG			(0x20)
> +#define AW_PID_2049_VBAT_REG			(0x21)
> +#define AW_PID_2049_TEMP_REG			(0x22)
> +#define AW_PID_2049_PVDD_REG			(0x23)
> +#define AW_PID_2049_ISNDAT_REG			(0x24)
> +#define AW_PID_2049_VSNDAT_REG			(0x25)
> +#define AW_PID_2049_I2SINT_REG			(0x26)
> +#define AW_PID_2049_I2SCAPCNT_REG		(0x27)
> +#define AW_PID_2049_ANASTA1_REG			(0x28)
> +#define AW_PID_2049_ANASTA2_REG			(0x29)
> +#define AW_PID_2049_ANASTA3_REG			(0x2A)
> +#define AW_PID_2049_ANASTA4_REG			(0x2B)
> +#define AW_PID_2049_TESTDET_REG			(0x2C)
> +#define AW_PID_2049_TESTIN_REG			(0x38)
> +#define AW_PID_2049_TESTOUT_REG			(0x39)
> +#define AW_PID_2049_DSPMADD_REG			(0x40)
> +#define AW_PID_2049_DSPMDAT_REG			(0x41)
> +#define AW_PID_2049_WDT_REG				(0x42)
> +#define AW_PID_2049_ACR1_REG			(0x43)
> +#define AW_PID_2049_ACR2_REG			(0x44)
> +#define AW_PID_2049_ASR1_REG			(0x45)
> +#define AW_PID_2049_ASR2_REG			(0x46)
> +#define AW_PID_2049_DSPCFG_REG			(0x47)
> +#define AW_PID_2049_ASR3_REG			(0x48)
> +#define AW_PID_2049_ASR4_REG			(0x49)
> +#define AW_PID_2049_VSNCTRL1_REG		(0x50)
> +#define AW_PID_2049_ISNCTRL1_REG		(0x51)
> +#define AW_PID_2049_PLLCTRL1_REG		(0x52)
> +#define AW_PID_2049_PLLCTRL2_REG		(0x53)
> +#define AW_PID_2049_PLLCTRL3_REG		(0x54)
> +#define AW_PID_2049_CDACTRL1_REG		(0x55)
> +#define AW_PID_2049_CDACTRL2_REG		(0x56)
> +#define AW_PID_2049_SADCCTRL1_REG		(0x57)
> +#define AW_PID_2049_SADCCTRL2_REG		(0x58)
> +#define AW_PID_2049_CPCTRL1_REG			(0x59)
> +#define AW_PID_2049_BSTCTRL1_REG		(0x60)
> +#define AW_PID_2049_BSTCTRL2_REG		(0x61)
> +#define AW_PID_2049_BSTCTRL3_REG		(0x62)
> +#define AW_PID_2049_BSTCTRL4_REG		(0x63)
> +#define AW_PID_2049_BSTCTRL5_REG		(0x64)
> +#define AW_PID_2049_BSTCTRL6_REG		(0x65)
> +#define AW_PID_2049_BSTCTRL7_REG		(0x66)
> +#define AW_PID_2049_DSMCFG1_REG			(0x67)
> +#define AW_PID_2049_DSMCFG2_REG			(0x68)
> +#define AW_PID_2049_DSMCFG3_REG			(0x69)
> +#define AW_PID_2049_DSMCFG4_REG			(0x6A)
> +#define AW_PID_2049_DSMCFG5_REG			(0x6B)
> +#define AW_PID_2049_DSMCFG6_REG			(0x6C)
> +#define AW_PID_2049_DSMCFG7_REG			(0x6D)
> +#define AW_PID_2049_DSMCFG8_REG			(0x6E)
> +#define AW_PID_2049_TESTCTRL1_REG		(0x70)
> +#define AW_PID_2049_TESTCTRL2_REG		(0x71)
> +#define AW_PID_2049_EFCTRL1_REG			(0x72)
> +#define AW_PID_2049_EFCTRL2_REG			(0x73)
> +#define AW_PID_2049_EFWH_REG			(0x74)
> +#define AW_PID_2049_EFWM2_REG			(0x75)
> +#define AW_PID_2049_EFWM1_REG			(0x76)
> +#define AW_PID_2049_EFWL_REG			(0x77)
> +#define AW_PID_2049_EFRH_REG			(0x78)
> +#define AW_PID_2049_EFRM2_REG			(0x79)
> +#define AW_PID_2049_EFRM1_REG			(0x7A)
> +#define AW_PID_2049_EFRL_REG			(0x7B)
> +#define AW_PID_2049_TM_REG				(0x7C)
> +
> +/*
> + * Register Access
> + */
> +enum aw883xx_id {
> +	AW883XX_PID_2049 = 0x2049,
> +};
> +
> +#define AW_PID_2049_REG_MAX				(0x7D)
> +
> +#define REG_NONE_ACCESS					(0)
> +#define REG_RD_ACCESS					(1 << 0)
> +#define REG_WR_ACCESS					(1 << 1)
> +
> +static const unsigned char aw_pid_2049_reg_access[AW_PID_2049_REG_MAX] = {
> +	[AW_PID_2049_ID_REG]		= (REG_RD_ACCESS),
> +	[AW_PID_2049_SYSST_REG]		= (REG_RD_ACCESS),
> +	[AW_PID_2049_SYSINT_REG]	= (REG_RD_ACCESS),
> +	[AW_PID_2049_SYSINTM_REG]	= (REG_RD_ACCESS | REG_WR_ACCESS),
> +	[AW_PID_2049_SYSCTRL_REG]	= (REG_RD_ACCESS | REG_WR_ACCESS),
> +	[AW_PID_2049_SYSCTRL2_REG]	= (REG_RD_ACCESS | REG_WR_ACCESS),
> +	[AW_PID_2049_I2SCTRL_REG]	= (REG_RD_ACCESS | REG_WR_ACCESS),
> +	[AW_PID_2049_I2SCFG1_REG]	= (REG_RD_ACCESS | REG_WR_ACCESS),
> +	[AW_PID_2049_I2SCFG2_REG]	= (REG_RD_ACCESS | REG_WR_ACCESS),
> +	[AW_PID_2049_HAGCCFG1_REG]	= (REG_RD_ACCESS | REG_WR_ACCESS),
> +	[AW_PID_2049_HAGCCFG2_REG]	= (REG_RD_ACCESS | REG_WR_ACCESS),
> +	[AW_PID_2049_HAGCCFG3_REG]	= (REG_RD_ACCESS | REG_WR_ACCESS),
> +	[AW_PID_2049_HAGCCFG4_REG]	= (REG_RD_ACCESS | REG_WR_ACCESS),
> +	[AW_PID_2049_HAGCCFG5_REG]	= (REG_RD_ACCESS | REG_WR_ACCESS),
> +	[AW_PID_2049_HAGCCFG6_REG]	= (REG_RD_ACCESS | REG_WR_ACCESS),
> +	[AW_PID_2049_HAGCCFG7_REG]	= (REG_RD_ACCESS | REG_WR_ACCESS),
> +	[AW_PID_2049_MPDCFG_REG]	= (REG_RD_ACCESS | REG_WR_ACCESS),
> +	[AW_PID_2049_PWMCTRL_REG]	= (REG_RD_ACCESS | REG_WR_ACCESS),
> +	[AW_PID_2049_I2SCFG3_REG]	= (REG_RD_ACCESS | REG_WR_ACCESS),
> +	[AW_PID_2049_DBGCTRL_REG]	= (REG_RD_ACCESS | REG_WR_ACCESS),
> +	[AW_PID_2049_HAGCST_REG]	= (REG_RD_ACCESS),
> +	[AW_PID_2049_VBAT_REG]		= (REG_RD_ACCESS),
> +	[AW_PID_2049_TEMP_REG]		= (REG_RD_ACCESS),
> +	[AW_PID_2049_PVDD_REG]		= (REG_RD_ACCESS),
> +	[AW_PID_2049_ISNDAT_REG]	= (REG_RD_ACCESS),
> +	[AW_PID_2049_VSNDAT_REG]	= (REG_RD_ACCESS),
> +	[AW_PID_2049_I2SINT_REG]	= (REG_RD_ACCESS),
> +	[AW_PID_2049_I2SCAPCNT_REG]	= (REG_RD_ACCESS),
> +	[AW_PID_2049_ANASTA1_REG]	= (REG_RD_ACCESS),
> +	[AW_PID_2049_ANASTA2_REG]	= (REG_RD_ACCESS),
> +	[AW_PID_2049_ANASTA3_REG]	= (REG_RD_ACCESS),
> +	[AW_PID_2049_ANASTA4_REG]	= (REG_RD_ACCESS),
> +	[AW_PID_2049_TESTDET_REG]	= (REG_RD_ACCESS),
> +	[AW_PID_2049_TESTIN_REG]	= (REG_RD_ACCESS | REG_WR_ACCESS),
> +	[AW_PID_2049_TESTOUT_REG]	= (REG_RD_ACCESS),
> +	[AW_PID_2049_DSPMADD_REG]	= (REG_RD_ACCESS | REG_WR_ACCESS),
> +	[AW_PID_2049_DSPMDAT_REG]	= (REG_RD_ACCESS | REG_WR_ACCESS),
> +	[AW_PID_2049_WDT_REG]		= (REG_RD_ACCESS),
> +	[AW_PID_2049_ACR1_REG]		= (REG_RD_ACCESS | REG_WR_ACCESS),
> +	[AW_PID_2049_ACR2_REG]		= (REG_RD_ACCESS | REG_WR_ACCESS),
> +	[AW_PID_2049_ASR1_REG]		= (REG_RD_ACCESS),
> +	[AW_PID_2049_ASR2_REG]		= (REG_RD_ACCESS),
> +	[AW_PID_2049_DSPCFG_REG]	= (REG_RD_ACCESS | REG_WR_ACCESS),
> +	[AW_PID_2049_ASR3_REG]		= (REG_RD_ACCESS),
> +	[AW_PID_2049_ASR4_REG]		= (REG_RD_ACCESS),
> +	[AW_PID_2049_VSNCTRL1_REG]	= (REG_RD_ACCESS | REG_WR_ACCESS),
> +	[AW_PID_2049_ISNCTRL1_REG]	= (REG_RD_ACCESS | REG_WR_ACCESS),
> +	[AW_PID_2049_PLLCTRL1_REG]	= (REG_RD_ACCESS | REG_WR_ACCESS),
> +	[AW_PID_2049_PLLCTRL2_REG]	= (REG_RD_ACCESS | REG_WR_ACCESS),
> +	[AW_PID_2049_PLLCTRL3_REG]	= (REG_RD_ACCESS | REG_WR_ACCESS),
> +	[AW_PID_2049_CDACTRL1_REG]	= (REG_RD_ACCESS | REG_WR_ACCESS),
> +	[AW_PID_2049_CDACTRL2_REG]	= (REG_RD_ACCESS | REG_WR_ACCESS),
> +	[AW_PID_2049_SADCCTRL1_REG]	= (REG_RD_ACCESS | REG_WR_ACCESS),
> +	[AW_PID_2049_SADCCTRL2_REG]	= (REG_RD_ACCESS | REG_WR_ACCESS),
> +	[AW_PID_2049_CPCTRL1_REG]	= (REG_RD_ACCESS | REG_WR_ACCESS),
> +	[AW_PID_2049_BSTCTRL1_REG]	= (REG_RD_ACCESS | REG_WR_ACCESS),
> +	[AW_PID_2049_BSTCTRL2_REG]	= (REG_RD_ACCESS | REG_WR_ACCESS),
> +	[AW_PID_2049_BSTCTRL3_REG]	= (REG_RD_ACCESS | REG_WR_ACCESS),
> +	[AW_PID_2049_BSTCTRL4_REG]	= (REG_RD_ACCESS | REG_WR_ACCESS),
> +	[AW_PID_2049_BSTCTRL5_REG]	= (REG_RD_ACCESS | REG_WR_ACCESS),
> +	[AW_PID_2049_BSTCTRL6_REG]	= (REG_RD_ACCESS | REG_WR_ACCESS),
> +	[AW_PID_2049_BSTCTRL7_REG]	= (REG_RD_ACCESS | REG_WR_ACCESS),
> +	[AW_PID_2049_DSMCFG1_REG]	= (REG_RD_ACCESS | REG_WR_ACCESS),
> +	[AW_PID_2049_DSMCFG2_REG]	= (REG_RD_ACCESS | REG_WR_ACCESS),
> +	[AW_PID_2049_DSMCFG3_REG]	= (REG_RD_ACCESS | REG_WR_ACCESS),
> +	[AW_PID_2049_DSMCFG4_REG]	= (REG_RD_ACCESS | REG_WR_ACCESS),
> +	[AW_PID_2049_DSMCFG5_REG]	= (REG_RD_ACCESS | REG_WR_ACCESS),
> +	[AW_PID_2049_DSMCFG6_REG]	= (REG_RD_ACCESS | REG_WR_ACCESS),
> +	[AW_PID_2049_DSMCFG7_REG]	= (REG_RD_ACCESS | REG_WR_ACCESS),
> +	[AW_PID_2049_DSMCFG8_REG]	= (REG_RD_ACCESS | REG_WR_ACCESS),
> +	[AW_PID_2049_TESTCTRL1_REG]	= (REG_RD_ACCESS | REG_WR_ACCESS),
> +	[AW_PID_2049_TESTCTRL2_REG]	= (REG_RD_ACCESS | REG_WR_ACCESS),
> +	[AW_PID_2049_EFCTRL1_REG]	= (REG_RD_ACCESS | REG_WR_ACCESS),
> +	[AW_PID_2049_EFCTRL2_REG]	= (REG_RD_ACCESS | REG_WR_ACCESS),
> +	[AW_PID_2049_EFWH_REG]		= (REG_RD_ACCESS | REG_WR_ACCESS),
> +	[AW_PID_2049_EFWM2_REG]		= (REG_RD_ACCESS | REG_WR_ACCESS),
> +	[AW_PID_2049_EFWM1_REG]		= (REG_RD_ACCESS | REG_WR_ACCESS),
> +	[AW_PID_2049_EFWL_REG]		= (REG_RD_ACCESS | REG_WR_ACCESS),
> +	[AW_PID_2049_EFRH_REG]		= (REG_RD_ACCESS),
> +	[AW_PID_2049_EFRM2_REG]		= (REG_RD_ACCESS),
> +	[AW_PID_2049_EFRM1_REG]		= (REG_RD_ACCESS),
> +	[AW_PID_2049_EFRL_REG]		= (REG_RD_ACCESS),
> +	[AW_PID_2049_TM_REG]		= (REG_NONE_ACCESS),
> +};
> +
> +#define AW_PID_2049_VOLUME_STEP_DB	(6 * 8)
> +
> +
> +/* detail information of registers begin */
> +/* ID (0x00) detail */
> +/* IDCODE bit 15:0 (ID 0x00) */
> +#define AW_PID_2049_IDCODE_START_BIT	(0)
> +#define AW_PID_2049_IDCODE_BITS_LEN		(16)
> +#define AW_PID_2049_IDCODE_MASK			\
> +	(~(((1<<AW_PID_2049_IDCODE_BITS_LEN)-1) << AW_PID_2049_IDCODE_START_BIT))
> +
> +#define AW_PID_2049_IDCODE_DEFAULT_VALUE	(0x2049)
> +#define AW_PID_2049_IDCODE_DEFAULT		\
> +	(AW_PID_2049_IDCODE_DEFAULT_VALUE << AW_PID_2049_IDCODE_START_BIT)
> +
> +#define AW_PID_2049_SOFT_RESET_VALUE	(0x55aa)
> +
> +/* default value of ID (0x00) */
> +/* #define AW_PID_2049_ID_DEFAULT		(0x2049) */
> +
> +/* SYSST (0x01) detail */
> +/* OVP2S bit 15 (SYSST 0x01) */
> +#define AW_PID_2049_OVP2S_START_BIT		(15)
> +#define AW_PID_2049_OVP2S_BITS_LEN		(1)
> +#define AW_PID_2049_OVP2S_MASK			\
> +	(~(((1<<AW_PID_2049_OVP2S_BITS_LEN)-1) << AW_PID_2049_OVP2S_START_BIT))
> +
> +#define AW_PID_2049_OVP2S_NORMAL		(0)
> +#define AW_PID_2049_OVP2S_NORMAL_VALUE	\
> +	(AW_PID_2049_OVP2S_NORMAL << AW_PID_2049_OVP2S_START_BIT)
> +
> +#define AW_PID_2049_OVP2S_OVP			(1)
> +#define AW_PID_2049_OVP2S_OVP_VALUE		\
> +	(AW_PID_2049_OVP2S_OVP << AW_PID_2049_OVP2S_START_BIT)
> +
> +#define AW_PID_2049_OVP2S_DEFAULT_VALUE	(0)
> +#define AW_PID_2049_OVP2S_DEFAULT		\
> +	(AW_PID_2049_OVP2S_DEFAULT_VALUE << AW_PID_2049_OVP2S_START_BIT)
> +
> +/* UVLS bit 14 (SYSST 0x01) */
> +#define AW_PID_2049_UVLS_START_BIT		(14)
> +#define AW_PID_2049_UVLS_BITS_LEN		(1)
> +#define AW_PID_2049_UVLS_MASK			\
> +	(~(((1<<AW_PID_2049_UVLS_BITS_LEN)-1) << AW_PID_2049_UVLS_START_BIT))
> +
> +#define AW_PID_2049_UVLS_NORMAL			(0)
> +#define AW_PID_2049_UVLS_NORMAL_VALUE	\
> +	(AW_PID_2049_UVLS_NORMAL << AW_PID_2049_UVLS_START_BIT)
> +
> +#define AW_PID_2049_UVLS_UVLO			(1)
> +#define AW_PID_2049_UVLS_UVLO_VALUE		\
> +	(AW_PID_2049_UVLS_UVLO << AW_PID_2049_UVLS_START_BIT)
> +
> +#define AW_PID_2049_UVLS_DEFAULT_VALUE	(0)
> +#define AW_PID_2049_UVLS_DEFAULT		\
> +	(AW_PID_2049_UVLS_DEFAULT_VALUE << AW_PID_2049_UVLS_START_BIT)
> +
> +/* ADPS bit 13 (SYSST 0x01) */
> +#define AW_PID_2049_ADPS_START_BIT		(13)
> +#define AW_PID_2049_ADPS_BITS_LEN		(1)
> +#define AW_PID_2049_ADPS_MASK			\
> +	(~(((1<<AW_PID_2049_ADPS_BITS_LEN)-1) << AW_PID_2049_ADPS_START_BIT))
> +
> +#define AW_PID_2049_ADPS_TRANSPARENT	(0)
> +#define AW_PID_2049_ADPS_TRANSPARENT_VALUE	\
> +	(AW_PID_2049_ADPS_TRANSPARENT << AW_PID_2049_ADPS_START_BIT)
> +
> +#define AW_PID_2049_ADPS_BOOST			(1)
> +#define AW_PID_2049_ADPS_BOOST_VALUE	\
> +	(AW_PID_2049_ADPS_BOOST << AW_PID_2049_ADPS_START_BIT)
> +
> +#define AW_PID_2049_ADPS_DEFAULT_VALUE	(0)
> +#define AW_PID_2049_ADPS_DEFAULT		\
> +	(AW_PID_2049_ADPS_DEFAULT_VALUE << AW_PID_2049_ADPS_START_BIT)
> +
> +/* DSPS bit 12 (SYSST 0x01) */
> +#define AW_PID_2049_DSPS_START_BIT		(12)
> +#define AW_PID_2049_DSPS_BITS_LEN		(1)
> +#define AW_PID_2049_DSPS_MASK			\
> +	(~(((1<<AW_PID_2049_DSPS_BITS_LEN)-1) << AW_PID_2049_DSPS_START_BIT))
> +
> +#define AW_PID_2049_DSPS_NORMAL			(0)
> +#define AW_PID_2049_DSPS_NORMAL_VALUE	\
> +	(AW_PID_2049_DSPS_NORMAL << AW_PID_2049_DSPS_START_BIT)
> +
> +#define AW_PID_2049_DSPS_DSP_STABLE		(1)
> +#define AW_PID_2049_DSPS_DSP_STABLE_VALUE	\
> +	(AW_PID_2049_DSPS_DSP_STABLE << AW_PID_2049_DSPS_START_BIT)
> +
> +#define AW_PID_2049_DSPS_DEFAULT_VALUE	(0)
> +#define AW_PID_2049_DSPS_DEFAULT		\
> +	(AW_PID_2049_DSPS_DEFAULT_VALUE << AW_PID_2049_DSPS_START_BIT)
> +
> +/* BSTOCS bit 11 (SYSST 0x01) */
> +#define AW_PID_2049_BSTOCS_START_BIT	(11)
> +#define AW_PID_2049_BSTOCS_BITS_LEN		(1)
> +#define AW_PID_2049_BSTOCS_MASK			\
> +	(~(((1<<AW_PID_2049_BSTOCS_BITS_LEN)-1) << AW_PID_2049_BSTOCS_START_BIT))
> +
> +#define AW_PID_2049_BSTOCS_NORMAL		(0)
> +#define AW_PID_2049_BSTOCS_NORMAL_VALUE	\
> +	(AW_PID_2049_BSTOCS_NORMAL << AW_PID_2049_BSTOCS_START_BIT)
> +
> +#define AW_PID_2049_BSTOCS_OVER_CURRENT	(1)
> +#define AW_PID_2049_BSTOCS_OVER_CURRENT_VALUE	\
> +	(AW_PID_2049_BSTOCS_OVER_CURRENT << AW_PID_2049_BSTOCS_START_BIT)
> +
> +#define AW_PID_2049_BSTOCS_DEFAULT_VALUE	(0)
> +#define AW_PID_2049_BSTOCS_DEFAULT		\
> +	(AW_PID_2049_BSTOCS_DEFAULT_VALUE << AW_PID_2049_BSTOCS_START_BIT)
> +
> +/* OVPS bit 10 (SYSST 0x01) */
> +#define AW_PID_2049_OVPS_START_BIT		(10)
> +#define AW_PID_2049_OVPS_BITS_LEN		(1)
> +#define AW_PID_2049_OVPS_MASK			\
> +	(~(((1<<AW_PID_2049_OVPS_BITS_LEN)-1) << AW_PID_2049_OVPS_START_BIT))
> +
> +#define AW_PID_2049_OVPS_NORMAL			(0)
> +#define AW_PID_2049_OVPS_NORMAL_VALUE	\
> +	(AW_PID_2049_OVPS_NORMAL << AW_PID_2049_OVPS_START_BIT)
> +
> +#define AW_PID_2049_OVPS_OVP			(1)
> +#define AW_PID_2049_OVPS_OVP_VALUE		\
> +	(AW_PID_2049_OVPS_OVP << AW_PID_2049_OVPS_START_BIT)
> +
> +#define AW_PID_2049_OVPS_DEFAULT_VALUE	(0)
> +#define AW_PID_2049_OVPS_DEFAULT		\
> +	(AW_PID_2049_OVPS_DEFAULT_VALUE << AW_PID_2049_OVPS_START_BIT)
> +
> +/* BSTS bit 9 (SYSST 0x01) */
> +#define AW_PID_2049_BSTS_START_BIT		(9)
> +#define AW_PID_2049_BSTS_BITS_LEN		(1)
> +#define AW_PID_2049_BSTS_MASK			\
> +	(~(((1<<AW_PID_2049_BSTS_BITS_LEN)-1) << AW_PID_2049_BSTS_START_BIT))
> +
> +#define AW_PID_2049_BSTS_NOT_FINISHED	(0)
> +#define AW_PID_2049_BSTS_NOT_FINISHED_VALUE	\
> +	(AW_PID_2049_BSTS_NOT_FINISHED << AW_PID_2049_BSTS_START_BIT)
> +
> +#define AW_PID_2049_BSTS_FINISHED		(1)
> +#define AW_PID_2049_BSTS_FINISHED_VALUE	\
> +	(AW_PID_2049_BSTS_FINISHED << AW_PID_2049_BSTS_START_BIT)
> +
> +#define AW_PID_2049_BSTS_DEFAULT_VALUE	(0)
> +#define AW_PID_2049_BSTS_DEFAULT		\
> +	(AW_PID_2049_BSTS_DEFAULT_VALUE << AW_PID_2049_BSTS_START_BIT)
> +
> +/* SWS bit 8 (SYSST 0x01) */
> +#define AW_PID_2049_SWS_START_BIT		(8)
> +#define AW_PID_2049_SWS_BITS_LEN		(1)
> +#define AW_PID_2049_SWS_MASK			\
> +	(~(((1<<AW_PID_2049_SWS_BITS_LEN)-1) << AW_PID_2049_SWS_START_BIT))
> +
> +#define AW_PID_2049_SWS_NOT_SWITCHING	(0)
> +#define AW_PID_2049_SWS_NOT_SWITCHING_VALUE	\
> +	(AW_PID_2049_SWS_NOT_SWITCHING << AW_PID_2049_SWS_START_BIT)
> +
> +#define AW_PID_2049_SWS_SWITCHING		(1)
> +#define AW_PID_2049_SWS_SWITCHING_VALUE	\
> +	(AW_PID_2049_SWS_SWITCHING << AW_PID_2049_SWS_START_BIT)
> +
> +#define AW_PID_2049_SWS_DEFAULT_VALUE	(0)
> +#define AW_PID_2049_SWS_DEFAULT			\
> +	(AW_PID_2049_SWS_DEFAULT_VALUE << AW_PID_2049_SWS_START_BIT)
> +
> +/* CLIPS bit 7 (SYSST 0x01) */
> +#define AW_PID_2049_CLIPS_START_BIT		(7)
> +#define AW_PID_2049_CLIPS_BITS_LEN		(1)
> +#define AW_PID_2049_CLIPS_MASK			\
> +	(~(((1<<AW_PID_2049_CLIPS_BITS_LEN)-1) << AW_PID_2049_CLIPS_START_BIT))
> +
> +#define AW_PID_2049_CLIPS_NOT_CLIPPING	(0)
> +#define AW_PID_2049_CLIPS_NOT_CLIPPING_VALUE	\
> +	(AW_PID_2049_CLIPS_NOT_CLIPPING << AW_PID_2049_CLIPS_START_BIT)
> +
> +#define AW_PID_2049_CLIPS_CLIPPING		(1)
> +#define AW_PID_2049_CLIPS_CLIPPING_VALUE	\
> +	(AW_PID_2049_CLIPS_CLIPPING << AW_PID_2049_CLIPS_START_BIT)
> +
> +#define AW_PID_2049_CLIPS_DEFAULT_VALUE	(0)
> +#define AW_PID_2049_CLIPS_DEFAULT		\
> +	(AW_PID_2049_CLIPS_DEFAULT_VALUE << AW_PID_2049_CLIPS_START_BIT)
> +
> +/* WDS bit 6 (SYSST 0x01) */
> +#define AW_PID_2049_WDS_START_BIT		(6)
> +#define AW_PID_2049_WDS_BITS_LEN		(1)
> +#define AW_PID_2049_WDS_MASK			\
> +	(~(((1<<AW_PID_2049_WDS_BITS_LEN)-1) << AW_PID_2049_WDS_START_BIT))
> +
> +#define AW_PID_2049_WDS_NORMAL			(0)
> +#define AW_PID_2049_WDS_NORMAL_VALUE	\
> +	(AW_PID_2049_WDS_NORMAL << AW_PID_2049_WDS_START_BIT)
> +
> +#define AW_PID_2049_WDS_ABNORMAL		(1)
> +#define AW_PID_2049_WDS_ABNORMAL_VALUE	\
> +	(AW_PID_2049_WDS_ABNORMAL << AW_PID_2049_WDS_START_BIT)
> +
> +#define AW_PID_2049_WDS_DEFAULT_VALUE	(0)
> +#define AW_PID_2049_WDS_DEFAULT			\
> +	(AW_PID_2049_WDS_DEFAULT_VALUE << AW_PID_2049_WDS_START_BIT)
> +
> +/* NOCLKS bit 5 (SYSST 0x01) */
> +#define AW_PID_2049_NOCLKS_START_BIT	(5)
> +#define AW_PID_2049_NOCLKS_BITS_LEN		(1)
> +#define AW_PID_2049_NOCLKS_MASK			\
> +	(~(((1<<AW_PID_2049_NOCLKS_BITS_LEN)-1) << AW_PID_2049_NOCLKS_START_BIT))
> +
> +#define AW_PID_2049_NOCLKS_CLOCK_OK		(0)
> +#define AW_PID_2049_NOCLKS_CLOCK_OK_VALUE	\
> +	(AW_PID_2049_NOCLKS_CLOCK_OK << AW_PID_2049_NOCLKS_START_BIT)
> +
> +#define AW_PID_2049_NOCLKS_NO_CLOCK		(1)
> +#define AW_PID_2049_NOCLKS_NO_CLOCK_VALUE	\
> +	(AW_PID_2049_NOCLKS_NO_CLOCK << AW_PID_2049_NOCLKS_START_BIT)
> +
> +#define AW_PID_2049_NOCLKS_DEFAULT_VALUE	(0)
> +#define AW_PID_2049_NOCLKS_DEFAULT		\
> +	(AW_PID_2049_NOCLKS_DEFAULT_VALUE << AW_PID_2049_NOCLKS_START_BIT)
> +
> +/* CLKS bit 4 (SYSST 0x01) */
> +#define AW_PID_2049_CLKS_START_BIT		(4)
> +#define AW_PID_2049_CLKS_BITS_LEN		(1)
> +#define AW_PID_2049_CLKS_MASK			\
> +	(~(((1<<AW_PID_2049_CLKS_BITS_LEN)-1) << AW_PID_2049_CLKS_START_BIT))
> +
> +#define AW_PID_2049_CLKS_NOT_STABLE		(0)
> +#define AW_PID_2049_CLKS_NOT_STABLE_VALUE	\
> +	(AW_PID_2049_CLKS_NOT_STABLE << AW_PID_2049_CLKS_START_BIT)
> +
> +#define AW_PID_2049_CLKS_STABLE			(1)
> +#define AW_PID_2049_CLKS_STABLE_VALUE	\
> +	(AW_PID_2049_CLKS_STABLE << AW_PID_2049_CLKS_START_BIT)
> +
> +#define AW_PID_2049_CLKS_DEFAULT_VALUE	(0)
> +#define AW_PID_2049_CLKS_DEFAULT		\
> +	(AW_PID_2049_CLKS_DEFAULT_VALUE << AW_PID_2049_CLKS_START_BIT)
> +
> +/* OCDS bit 3 (SYSST 0x01) */
> +#define AW_PID_2049_OCDS_START_BIT		(3)
> +#define AW_PID_2049_OCDS_BITS_LEN		(1)
> +#define AW_PID_2049_OCDS_MASK			\
> +	(~(((1<<AW_PID_2049_OCDS_BITS_LEN)-1) << AW_PID_2049_OCDS_START_BIT))
> +
> +#define AW_PID_2049_OCDS_NORAML			(0)
> +#define AW_PID_2049_OCDS_NORAML_VALUE	\
> +	(AW_PID_2049_OCDS_NORAML << AW_PID_2049_OCDS_START_BIT)
> +
> +#define AW_PID_2049_OCDS_OC				(1)
> +#define AW_PID_2049_OCDS_OC_VALUE		\
> +	(AW_PID_2049_OCDS_OC << AW_PID_2049_OCDS_START_BIT)
> +
> +#define AW_PID_2049_OCDS_DEFAULT_VALUE	(0)
> +#define AW_PID_2049_OCDS_DEFAULT		\
> +	(AW_PID_2049_OCDS_DEFAULT_VALUE << AW_PID_2049_OCDS_START_BIT)
> +
> +/* CLIP_PRES bit 2 (SYSST 0x01) */
> +#define AW_PID_2049_CLIP_PRES_START_BIT	(2)
> +#define AW_PID_2049_CLIP_PRES_BITS_LEN	(1)
> +#define AW_PID_2049_CLIP_PRES_MASK		\
> +	(~(((1<<AW_PID_2049_CLIP_PRES_BITS_LEN)-1) << AW_PID_2049_CLIP_PRES_START_BIT))
> +
> +#define AW_PID_2049_CLIP_PRES_NOT_CLIPPING	(0)
> +#define AW_PID_2049_CLIP_PRES_NOT_CLIPPING_VALUE	\
> +	(AW_PID_2049_CLIP_PRES_NOT_CLIPPING << AW_PID_2049_CLIP_PRES_START_BIT)
> +
> +#define AW_PID_2049_CLIP_PRES_CLIPPING	(1)
> +#define AW_PID_2049_CLIP_PRES_CLIPPING_VALUE	\
> +	(AW_PID_2049_CLIP_PRES_CLIPPING << AW_PID_2049_CLIP_PRES_START_BIT)
> +
> +#define AW_PID_2049_CLIP_PRES_DEFAULT_VALUE	(0)
> +#define AW_PID_2049_CLIP_PRES_DEFAULT	\
> +	(AW_PID_2049_CLIP_PRES_DEFAULT_VALUE << AW_PID_2049_CLIP_PRES_START_BIT)
> +
> +/* OTHS bit 1 (SYSST 0x01) */
> +#define AW_PID_2049_OTHS_START_BIT		(1)
> +#define AW_PID_2049_OTHS_BITS_LEN		(1)
> +#define AW_PID_2049_OTHS_MASK			\
> +	(~(((1<<AW_PID_2049_OTHS_BITS_LEN)-1) << AW_PID_2049_OTHS_START_BIT))
> +
> +#define AW_PID_2049_OTHS_NORMAL			(0)
> +#define AW_PID_2049_OTHS_NORMAL_VALUE	\
> +	(AW_PID_2049_OTHS_NORMAL << AW_PID_2049_OTHS_START_BIT)
> +
> +#define AW_PID_2049_OTHS_OT				(1)
> +#define AW_PID_2049_OTHS_OT_VALUE		\
> +	(AW_PID_2049_OTHS_OT << AW_PID_2049_OTHS_START_BIT)
> +
> +#define AW_PID_2049_OTHS_DEFAULT_VALUE	(0)
> +#define AW_PID_2049_OTHS_DEFAULT		\
> +	(AW_PID_2049_OTHS_DEFAULT_VALUE << AW_PID_2049_OTHS_START_BIT)
> +
> +/* PLLS bit 0 (SYSST 0x01) */
> +#define AW_PID_2049_PLLS_START_BIT		(0)
> +#define AW_PID_2049_PLLS_BITS_LEN		(1)
> +#define AW_PID_2049_PLLS_MASK			\
> +	(~(((1<<AW_PID_2049_PLLS_BITS_LEN)-1) << AW_PID_2049_PLLS_START_BIT))
> +
> +#define AW_PID_2049_PLLS_UNLOCKED		(0)
> +#define AW_PID_2049_PLLS_UNLOCKED_VALUE	\
> +	(AW_PID_2049_PLLS_UNLOCKED << AW_PID_2049_PLLS_START_BIT)
> +
> +#define AW_PID_2049_PLLS_LOCKED			(1)
> +#define AW_PID_2049_PLLS_LOCKED_VALUE	\
> +	(AW_PID_2049_PLLS_LOCKED << AW_PID_2049_PLLS_START_BIT)
> +
> +#define AW_PID_2049_PLLS_DEFAULT_VALUE	(0)
> +#define AW_PID_2049_PLLS_DEFAULT		\
> +	(AW_PID_2049_PLLS_DEFAULT_VALUE << AW_PID_2049_PLLS_START_BIT)
> +
> +
> +
> +#define AW_PID_2049_BIT_PLL_CHECK \
> +		(AW_PID_2049_CLKS_STABLE_VALUE | \
> +		AW_PID_2049_PLLS_LOCKED_VALUE)
> +
> +
> +#define AW_PID_2049_BIT_SYSST_CHECK_MASK \
> +		(~(AW_PID_2049_UVLS_NORMAL_VALUE | \
> +		AW_PID_2049_BSTOCS_OVER_CURRENT_VALUE | \
> +		AW_PID_2049_BSTS_FINISHED_VALUE | \
> +		AW_PID_2049_SWS_SWITCHING_VALUE | \
> +		AW_PID_2049_NOCLKS_NO_CLOCK_VALUE | \
> +		AW_PID_2049_CLKS_STABLE_VALUE | \
> +		AW_PID_2049_OCDS_OC_VALUE | \
> +		AW_PID_2049_OTHS_OT_VALUE | \
> +		AW_PID_2049_PLLS_LOCKED_VALUE))
> +
> +#define AW_PID_2049_BIT_SYSST_CHECK \
> +		(AW_PID_2049_BSTS_FINISHED_VALUE | \
> +		AW_PID_2049_SWS_SWITCHING_VALUE | \
> +		AW_PID_2049_CLKS_STABLE_VALUE | \
> +		AW_PID_2049_PLLS_LOCKED_VALUE)
> +
> +/* default value of SYSST (0x01) */
> +/* #define AW_PID_2049_SYSST_DEFAULT		(0x0000) */
> +
> +/* SYSINT (0x02) detail */
> +/* OVP2I bit 15 (SYSINT 0x02) */
> +#define AW_PID_2049_OVP2I_START_BIT		(15)
> +#define AW_PID_2049_OVP2I_BITS_LEN		(1)
> +#define AW_PID_2049_OVP2I_MASK			\
> +	(~(((1<<AW_PID_2049_OVP2I_BITS_LEN)-1) << AW_PID_2049_OVP2I_START_BIT))
> +
> +#define AW_PID_2049_OVP2I_DEFAULT_VALUE	(0)
> +#define AW_PID_2049_OVP2I_DEFAULT		\
> +	(AW_PID_2049_OVP2I_DEFAULT_VALUE << AW_PID_2049_OVP2I_START_BIT)
> +
> +/* UVLI bit 14 (SYSINT 0x02) */
> +#define AW_PID_2049_UVLI_START_BIT		(14)
> +#define AW_PID_2049_UVLI_BITS_LEN		(1)
> +#define AW_PID_2049_UVLI_MASK			\
> +	(~(((1<<AW_PID_2049_UVLI_BITS_LEN)-1) << AW_PID_2049_UVLI_START_BIT))
> +
> +#define AW_PID_2049_UVLI_DEFAULT_VALUE	(0)
> +#define AW_PID_2049_UVLI_DEFAULT		\
> +	(AW_PID_2049_UVLI_DEFAULT_VALUE << AW_PID_2049_UVLI_START_BIT)
> +
> +/* ADPI bit 13 (SYSINT 0x02) */
> +#define AW_PID_2049_ADPI_START_BIT		(13)
> +#define AW_PID_2049_ADPI_BITS_LEN		(1)
> +#define AW_PID_2049_ADPI_MASK			\
> +	(~(((1<<AW_PID_2049_ADPI_BITS_LEN)-1) << AW_PID_2049_ADPI_START_BIT))
> +
> +#define AW_PID_2049_ADPI_DEFAULT_VALUE	(0)
> +#define AW_PID_2049_ADPI_DEFAULT		\
> +	(AW_PID_2049_ADPI_DEFAULT_VALUE << AW_PID_2049_ADPI_START_BIT)
> +
> +/* DSPI bit 12 (SYSINT 0x02) */
> +#define AW_PID_2049_DSPI_START_BIT		(12)
> +#define AW_PID_2049_DSPI_BITS_LEN		(1)
> +#define AW_PID_2049_DSPI_MASK			\
> +	(~(((1<<AW_PID_2049_DSPI_BITS_LEN)-1) << AW_PID_2049_DSPI_START_BIT))
> +
> +#define AW_PID_2049_DSPI_DEFAULT_VALUE	(0)
> +#define AW_PID_2049_DSPI_DEFAULT		\
> +	(AW_PID_2049_DSPI_DEFAULT_VALUE << AW_PID_2049_DSPI_START_BIT)
> +
> +/* BSTOCI bit 11 (SYSINT 0x02) */
> +#define AW_PID_2049_BSTOCI_START_BIT	(11)
> +#define AW_PID_2049_BSTOCI_BITS_LEN		(1)
> +#define AW_PID_2049_BSTOCI_MASK			\
> +	(~(((1<<AW_PID_2049_BSTOCI_BITS_LEN)-1) << AW_PID_2049_BSTOCI_START_BIT))
> +
> +#define AW_PID_2049_BSTOCI_DEFAULT_VALUE	(0)
> +#define AW_PID_2049_BSTOCI_DEFAULT		\
> +	(AW_PID_2049_BSTOCI_DEFAULT_VALUE << AW_PID_2049_BSTOCI_START_BIT)
> +
> +/* OVPI bit 10 (SYSINT 0x02) */
> +#define AW_PID_2049_OVPI_START_BIT		(10)
> +#define AW_PID_2049_OVPI_BITS_LEN		(1)
> +#define AW_PID_2049_OVPI_MASK			\
> +	(~(((1<<AW_PID_2049_OVPI_BITS_LEN)-1) << AW_PID_2049_OVPI_START_BIT))
> +
> +#define AW_PID_2049_OVPI_DEFAULT_VALUE	(0)
> +#define AW_PID_2049_OVPI_DEFAULT		\
> +	(AW_PID_2049_OVPI_DEFAULT_VALUE << AW_PID_2049_OVPI_START_BIT)
> +
> +/* BSTI bit 9 (SYSINT 0x02) */
> +#define AW_PID_2049_BSTI_START_BIT		(9)
> +#define AW_PID_2049_BSTI_BITS_LEN		(1)
> +#define AW_PID_2049_BSTI_MASK			\
> +	(~(((1<<AW_PID_2049_BSTI_BITS_LEN)-1) << AW_PID_2049_BSTI_START_BIT))
> +
> +#define AW_PID_2049_BSTI_DEFAULT_VALUE	(0)
> +#define AW_PID_2049_BSTI_DEFAULT		\
> +	(AW_PID_2049_BSTI_DEFAULT_VALUE << AW_PID_2049_BSTI_START_BIT)
> +
> +/* SWI bit 8 (SYSINT 0x02) */
> +#define AW_PID_2049_SWI_START_BIT		(8)
> +#define AW_PID_2049_SWI_BITS_LEN		(1)
> +#define AW_PID_2049_SWI_MASK			\
> +	(~(((1<<AW_PID_2049_SWI_BITS_LEN)-1) << AW_PID_2049_SWI_START_BIT))
> +
> +#define AW_PID_2049_SWI_DEFAULT_VALUE	(0)
> +#define AW_PID_2049_SWI_DEFAULT			\
> +	(AW_PID_2049_SWI_DEFAULT_VALUE << AW_PID_2049_SWI_START_BIT)
> +
> +/* CLIPI bit 7 (SYSINT 0x02) */
> +#define AW_PID_2049_CLIPI_START_BIT		(7)
> +#define AW_PID_2049_CLIPI_BITS_LEN		(1)
> +#define AW_PID_2049_CLIPI_MASK			\
> +	(~(((1<<AW_PID_2049_CLIPI_BITS_LEN)-1) << AW_PID_2049_CLIPI_START_BIT))
> +
> +#define AW_PID_2049_CLIPI_DEFAULT_VALUE	(0)
> +#define AW_PID_2049_CLIPI_DEFAULT		\
> +	(AW_PID_2049_CLIPI_DEFAULT_VALUE << AW_PID_2049_CLIPI_START_BIT)
> +
> +/* WDI bit 6 (SYSINT 0x02) */
> +#define AW_PID_2049_WDI_START_BIT		(6)
> +#define AW_PID_2049_WDI_BITS_LEN		(1)
> +#define AW_PID_2049_WDI_MASK			\
> +	(~(((1<<AW_PID_2049_WDI_BITS_LEN)-1) << AW_PID_2049_WDI_START_BIT))
> +
> +#define AW_PID_2049_WDI_DEFAULT_VALUE	(0)
> +#define AW_PID_2049_WDI_INT_VALUE	(1)
> +#define AW_PID_2049_WDI_DEFAULT			\
> +	(AW_PID_2049_WDI_DEFAULT_VALUE << AW_PID_2049_WDI_START_BIT)
> +#define AW_PID_2049_WDI_INTERRUPT		\
> +	(AW_PID_2049_WDI_INT_VALUE << AW_PID_2049_WDI_START_BIT)
> +
> +/* NOCLKI bit 5 (SYSINT 0x02) */
> +#define AW_PID_2049_NOCLKI_START_BIT	(5)
> +#define AW_PID_2049_NOCLKI_BITS_LEN		(1)
> +#define AW_PID_2049_NOCLKI_MASK			\
> +	(~(((1<<AW_PID_2049_NOCLKI_BITS_LEN)-1) << AW_PID_2049_NOCLKI_START_BIT))
> +
> +#define AW_PID_2049_NOCLKI_DEFAULT_VALUE	(0)
> +#define AW_PID_2049_NOCLKI_INT_VALUE	(1)
> +#define AW_PID_2049_NOCLKI_DEFAULT		\
> +	(AW_PID_2049_NOCLKI_DEFAULT_VALUE << AW_PID_2049_NOCLKI_START_BIT)
> +#define AW_PID_2049_NOCLKI_INTERRUPT		\
> +	(AW_PID_2049_NOCLKI_INT_VALUE << AW_PID_2049_NOCLKI_START_BIT)
> +
> +/* CLKI bit 4 (SYSINT 0x02) */
> +#define AW_PID_2049_CLKI_START_BIT		(4)
> +#define AW_PID_2049_CLKI_BITS_LEN		(1)
> +#define AW_PID_2049_CLKI_MASK			\
> +	(~(((1<<AW_PID_2049_CLKI_BITS_LEN)-1) << AW_PID_2049_CLKI_START_BIT))
> +
> +#define AW_PID_2049_CLKI_DEFAULT_VALUE	(0)
> +#define AW_PID_2049_CLKI_INT_VALUE	(1)
> +#define AW_PID_2049_CLKI_DEFAULT		\
> +	(AW_PID_2049_CLKI_DEFAULT_VALUE << AW_PID_2049_CLKI_START_BIT)
> +#define AW_PID_2049_CLKI_INTERRUPT		\
> +	(AW_PID_2049_CLKI_INT_VALUE << AW_PID_2049_CLKI_START_BIT)
> +
> +/* OCDI bit 3 (SYSINT 0x02) */
> +#define AW_PID_2049_OCDI_START_BIT		(3)
> +#define AW_PID_2049_OCDI_BITS_LEN		(1)
> +#define AW_PID_2049_OCDI_MASK			\
> +	(~(((1<<AW_PID_2049_OCDI_BITS_LEN)-1) << AW_PID_2049_OCDI_START_BIT))
> +
> +#define AW_PID_2049_OCDI_DEFAULT_VALUE	(0)
> +#define AW_PID_2049_OCDI_DEFAULT		\
> +	(AW_PID_2049_OCDI_DEFAULT_VALUE << AW_PID_2049_OCDI_START_BIT)
> +
> +/* CLIP_PREI bit 2 (SYSINT 0x02) */
> +#define AW_PID_2049_CLIP_PREI_START_BIT	(2)
> +#define AW_PID_2049_CLIP_PREI_BITS_LEN	(1)
> +#define AW_PID_2049_CLIP_PREI_MASK		\
> +	(~(((1<<AW_PID_2049_CLIP_PREI_BITS_LEN)-1) << AW_PID_2049_CLIP_PREI_START_BIT))
> +
> +#define AW_PID_2049_CLIP_PREI_DEFAULT_VALUE	(0)
> +#define AW_PID_2049_CLIP_PREI_DEFAULT	\
> +	(AW_PID_2049_CLIP_PREI_DEFAULT_VALUE << AW_PID_2049_CLIP_PREI_START_BIT)
> +
> +/* OTHI bit 1 (SYSINT 0x02) */
> +#define AW_PID_2049_OTHI_START_BIT		(1)
> +#define AW_PID_2049_OTHI_BITS_LEN		(1)
> +#define AW_PID_2049_OTHI_MASK			\
> +	(~(((1<<AW_PID_2049_OTHI_BITS_LEN)-1) << AW_PID_2049_OTHI_START_BIT))
> +
> +#define AW_PID_2049_OTHI_DEFAULT_VALUE	(0)
> +#define AW_PID_2049_OTHI_DEFAULT		\
> +	(AW_PID_2049_OTHI_DEFAULT_VALUE << AW_PID_2049_OTHI_START_BIT)
> +
> +/* PLLI bit 0 (SYSINT 0x02) */
> +#define AW_PID_2049_PLLI_START_BIT		(0)
> +#define AW_PID_2049_PLLI_BITS_LEN		(1)
> +#define AW_PID_2049_PLLI_MASK			\
> +	(~(((1<<AW_PID_2049_PLLI_BITS_LEN)-1) << AW_PID_2049_PLLI_START_BIT))
> +
> +#define AW_PID_2049_PLLI_DEFAULT_VALUE	(0)
> +#define AW_PID_2049_PLLI_INT_VALUE	(1)
> +#define AW_PID_2049_PLLI_DEFAULT		\
> +	(AW_PID_2049_PLLI_DEFAULT_VALUE << AW_PID_2049_PLLI_START_BIT)
> +#define AW_PID_2049_PLLI_INTERRUPT		\
> +	(AW_PID_2049_PLLI_INT_VALUE << AW_PID_2049_PLLI_START_BIT)
> +
> +/* default value of SYSINT (0x02) */
> +/* #define AW_PID_2049_SYSINT_DEFAULT		(0x0000) */
> +
> +#define AW_PID_2049_BIT_SYSINT_CHECK \
> +		(AW_PID_2049_WDI_INTERRUPT | \
> +		AW_PID_2049_CLKI_INTERRUPT | \
> +		AW_PID_2049_NOCLKI_INTERRUPT | \
> +		AW_PID_2049_PLLI_INTERRUPT)
> +
> +/* SYSINTM (0x03) detail */
> +/* OVP2M bit 15 (SYSINTM 0x03) */
> +#define AW_PID_2049_OVP2M_START_BIT		(15)
> +#define AW_PID_2049_OVP2M_BITS_LEN		(1)
> +#define AW_PID_2049_OVP2M_MASK			\
> +	(~(((1<<AW_PID_2049_OVP2M_BITS_LEN)-1) << AW_PID_2049_OVP2M_START_BIT))
> +
> +#define AW_PID_2049_OVP2M_DEFAULT_VALUE	(1)
> +#define AW_PID_2049_OVP2M_DEFAULT		\
> +	(AW_PID_2049_OVP2M_DEFAULT_VALUE << AW_PID_2049_OVP2M_START_BIT)
> +
> +/* UVLM bit 14 (SYSINTM 0x03) */
> +#define AW_PID_2049_UVLM_START_BIT		(14)
> +#define AW_PID_2049_UVLM_BITS_LEN		(1)
> +#define AW_PID_2049_UVLM_MASK			\
> +	(~(((1<<AW_PID_2049_UVLM_BITS_LEN)-1) << AW_PID_2049_UVLM_START_BIT))
> +
> +#define AW_PID_2049_UVLM_DEFAULT_VALUE	(1)
> +#define AW_PID_2049_UVLM_DEFAULT		\
> +	(AW_PID_2049_UVLM_DEFAULT_VALUE << AW_PID_2049_UVLM_START_BIT)
> +
> +/* ADPM bit 13 (SYSINTM 0x03) */
> +#define AW_PID_2049_ADPM_START_BIT		(13)
> +#define AW_PID_2049_ADPM_BITS_LEN		(1)
> +#define AW_PID_2049_ADPM_MASK			\
> +	(~(((1<<AW_PID_2049_ADPM_BITS_LEN)-1) << AW_PID_2049_ADPM_START_BIT))
> +
> +#define AW_PID_2049_ADPM_DEFAULT_VALUE	(1)
> +#define AW_PID_2049_ADPM_DEFAULT		\
> +	(AW_PID_2049_ADPM_DEFAULT_VALUE << AW_PID_2049_ADPM_START_BIT)
> +
> +/* DSPM bit 12 (SYSINTM 0x03) */
> +#define AW_PID_2049_DSPM_START_BIT		(12)
> +#define AW_PID_2049_DSPM_BITS_LEN		(1)
> +#define AW_PID_2049_DSPM_MASK			\
> +	(~(((1<<AW_PID_2049_DSPM_BITS_LEN)-1) << AW_PID_2049_DSPM_START_BIT))
> +
> +#define AW_PID_2049_DSPM_DEFAULT_VALUE	(1)
> +#define AW_PID_2049_DSPM_DEFAULT		\
> +	(AW_PID_2049_DSPM_DEFAULT_VALUE << AW_PID_2049_DSPM_START_BIT)
> +
> +/* BSTOCM bit 11 (SYSINTM 0x03) */
> +#define AW_PID_2049_BSTOCM_START_BIT	(11)
> +#define AW_PID_2049_BSTOCM_BITS_LEN		(1)
> +#define AW_PID_2049_BSTOCM_MASK			\
> +	(~(((1<<AW_PID_2049_BSTOCM_BITS_LEN)-1) << AW_PID_2049_BSTOCM_START_BIT))
> +
> +#define AW_PID_2049_BSTOCM_DEFAULT_VALUE	(1)
> +#define AW_PID_2049_BSTOCM_DEFAULT		\
> +	(AW_PID_2049_BSTOCM_DEFAULT_VALUE << AW_PID_2049_BSTOCM_START_BIT)
> +
> +/* OVPM bit 10 (SYSINTM 0x03) */
> +#define AW_PID_2049_OVPM_START_BIT		(10)
> +#define AW_PID_2049_OVPM_BITS_LEN		(1)
> +#define AW_PID_2049_OVPM_MASK			\
> +	(~(((1<<AW_PID_2049_OVPM_BITS_LEN)-1) << AW_PID_2049_OVPM_START_BIT))
> +
> +#define AW_PID_2049_OVPM_DEFAULT_VALUE	(1)
> +#define AW_PID_2049_OVPM_DEFAULT		\
> +	(AW_PID_2049_OVPM_DEFAULT_VALUE << AW_PID_2049_OVPM_START_BIT)
> +
> +/* BSTM bit 9 (SYSINTM 0x03) */
> +#define AW_PID_2049_BSTM_START_BIT		(9)
> +#define AW_PID_2049_BSTM_BITS_LEN		(1)
> +#define AW_PID_2049_BSTM_MASK			\
> +	(~(((1<<AW_PID_2049_BSTM_BITS_LEN)-1) << AW_PID_2049_BSTM_START_BIT))
> +
> +#define AW_PID_2049_BSTM_DEFAULT_VALUE	(1)
> +#define AW_PID_2049_BSTM_DEFAULT		\
> +	(AW_PID_2049_BSTM_DEFAULT_VALUE << AW_PID_2049_BSTM_START_BIT)
> +
> +/* SWM bit 8 (SYSINTM 0x03) */
> +#define AW_PID_2049_SWM_START_BIT		(8)
> +#define AW_PID_2049_SWM_BITS_LEN		(1)
> +#define AW_PID_2049_SWM_MASK			\
> +	(~(((1<<AW_PID_2049_SWM_BITS_LEN)-1) << AW_PID_2049_SWM_START_BIT))
> +
> +#define AW_PID_2049_SWM_DEFAULT_VALUE	(1)
> +#define AW_PID_2049_SWM_DEFAULT			\
> +	(AW_PID_2049_SWM_DEFAULT_VALUE << AW_PID_2049_SWM_START_BIT)
> +
> +/* CLIPM bit 7 (SYSINTM 0x03) */
> +#define AW_PID_2049_CLIPM_START_BIT		(7)
> +#define AW_PID_2049_CLIPM_BITS_LEN		(1)
> +#define AW_PID_2049_CLIPM_MASK			\
> +	(~(((1<<AW_PID_2049_CLIPM_BITS_LEN)-1) << AW_PID_2049_CLIPM_START_BIT))
> +
> +#define AW_PID_2049_CLIPM_DEFAULT_VALUE	(1)
> +#define AW_PID_2049_CLIPM_DEFAULT		\
> +	(AW_PID_2049_CLIPM_DEFAULT_VALUE << AW_PID_2049_CLIPM_START_BIT)
> +
> +/* WDM bit 6 (SYSINTM 0x03) */
> +#define AW_PID_2049_WDM_START_BIT		(6)
> +#define AW_PID_2049_WDM_BITS_LEN		(1)
> +#define AW_PID_2049_WDM_MASK			\
> +	(~(((1<<AW_PID_2049_WDM_BITS_LEN)-1) << AW_PID_2049_WDM_START_BIT))
> +
> +#define AW_PID_2049_WDM_DEFAULT_VALUE	(1)
> +#define AW_PID_2049_WDM_DEFAULT			\
> +	(AW_PID_2049_WDM_DEFAULT_VALUE << AW_PID_2049_WDM_START_BIT)
> +
> +/* NOCLKM bit 5 (SYSINTM 0x03) */
> +#define AW_PID_2049_NOCLKM_START_BIT	(5)
> +#define AW_PID_2049_NOCLKM_BITS_LEN		(1)
> +#define AW_PID_2049_NOCLKM_MASK			\
> +	(~(((1<<AW_PID_2049_NOCLKM_BITS_LEN)-1) << AW_PID_2049_NOCLKM_START_BIT))
> +
> +#define AW_PID_2049_NOCLKM_DEFAULT_VALUE	(1)
> +#define AW_PID_2049_NOCLKM_DEFAULT		\
> +	(AW_PID_2049_NOCLKM_DEFAULT_VALUE << AW_PID_2049_NOCLKM_START_BIT)
> +
> +/* CLKM bit 4 (SYSINTM 0x03) */
> +#define AW_PID_2049_CLKM_START_BIT		(4)
> +#define AW_PID_2049_CLKM_BITS_LEN		(1)
> +#define AW_PID_2049_CLKM_MASK			\
> +	(~(((1<<AW_PID_2049_CLKM_BITS_LEN)-1) << AW_PID_2049_CLKM_START_BIT))
> +
> +#define AW_PID_2049_CLKM_DEFAULT_VALUE	(1)
> +#define AW_PID_2049_CLKM_DEFAULT		\
> +	(AW_PID_2049_CLKM_DEFAULT_VALUE << AW_PID_2049_CLKM_START_BIT)
> +
> +/* OCDM bit 3 (SYSINTM 0x03) */
> +#define AW_PID_2049_OCDM_START_BIT		(3)
> +#define AW_PID_2049_OCDM_BITS_LEN		(1)
> +#define AW_PID_2049_OCDM_MASK			\
> +	(~(((1<<AW_PID_2049_OCDM_BITS_LEN)-1) << AW_PID_2049_OCDM_START_BIT))
> +
> +#define AW_PID_2049_OCDM_DEFAULT_VALUE	(1)
> +#define AW_PID_2049_OCDM_DEFAULT		\
> +	(AW_PID_2049_OCDM_DEFAULT_VALUE << AW_PID_2049_OCDM_START_BIT)
> +
> +/* CLIP_PREM bit 2 (SYSINTM 0x03) */
> +#define AW_PID_2049_CLIP_PREM_START_BIT	(2)
> +#define AW_PID_2049_CLIP_PREM_BITS_LEN	(1)
> +#define AW_PID_2049_CLIP_PREM_MASK		\
> +	(~(((1<<AW_PID_2049_CLIP_PREM_BITS_LEN)-1) << AW_PID_2049_CLIP_PREM_START_BIT))
> +
> +#define AW_PID_2049_CLIP_PREM_DEFAULT_VALUE	(1)
> +#define AW_PID_2049_CLIP_PREM_DEFAULT	\
> +	(AW_PID_2049_CLIP_PREM_DEFAULT_VALUE << AW_PID_2049_CLIP_PREM_START_BIT)
> +
> +/* OTHM bit 1 (SYSINTM 0x03) */
> +#define AW_PID_2049_OTHM_START_BIT		(1)
> +#define AW_PID_2049_OTHM_BITS_LEN		(1)
> +#define AW_PID_2049_OTHM_MASK			\
> +	(~(((1<<AW_PID_2049_OTHM_BITS_LEN)-1) << AW_PID_2049_OTHM_START_BIT))
> +
> +#define AW_PID_2049_OTHM_DEFAULT_VALUE	(1)
> +#define AW_PID_2049_OTHM_DEFAULT		\
> +	(AW_PID_2049_OTHM_DEFAULT_VALUE << AW_PID_2049_OTHM_START_BIT)
> +
> +/* PLLM bit 0 (SYSINTM 0x03) */
> +#define AW_PID_2049_PLLM_START_BIT		(0)
> +#define AW_PID_2049_PLLM_BITS_LEN		(1)
> +#define AW_PID_2049_PLLM_MASK			\
> +	(~(((1<<AW_PID_2049_PLLM_BITS_LEN)-1) << AW_PID_2049_PLLM_START_BIT))
> +
> +#define AW_PID_2049_PLLM_DEFAULT_VALUE	(1)
> +#define AW_PID_2049_PLLM_DEFAULT		\
> +	(AW_PID_2049_PLLM_DEFAULT_VALUE << AW_PID_2049_PLLM_START_BIT)
> +
> +/* default value of SYSINTM (0x03) */
> +#define AW_PID_2049_SYSINTM_DEFAULT		(0xFFFF)
> +
> +/* SYSCTRL (0x04) detail */
> +/* SPK_GAIN bit 14:12 (SYSCTRL 0x04) */
> +#define AW_PID_2049_SPK_GAIN_START_BIT	(12)
> +#define AW_PID_2049_SPK_GAIN_BITS_LEN	(3)
> +#define AW_PID_2049_SPK_GAIN_MASK		\
> +	(~(((1<<AW_PID_2049_SPK_GAIN_BITS_LEN)-1) << AW_PID_2049_SPK_GAIN_START_BIT))
> +
> +#define AW_PID_2049_SPK_GAIN_4_AV		(0)
> +#define AW_PID_2049_SPK_GAIN_4_AV_VALUE	\
> +	(AW_PID_2049_SPK_GAIN_4_AV << AW_PID_2049_SPK_GAIN_START_BIT)
> +
> +#define AW_PID_2049_SPK_GAIN_4P67_AV	(1)
> +#define AW_PID_2049_SPK_GAIN_4P67_AV_VALUE	\
> +	(AW_PID_2049_SPK_GAIN_4P67_AV << AW_PID_2049_SPK_GAIN_START_BIT)
> +
> +#define AW_PID_2049_SPK_GAIN_6_AV		(2)
> +#define AW_PID_2049_SPK_GAIN_6_AV_VALUE	\
> +	(AW_PID_2049_SPK_GAIN_6_AV << AW_PID_2049_SPK_GAIN_START_BIT)
> +
> +#define AW_PID_2049_SPK_GAIN_7_AV		(3)
> +#define AW_PID_2049_SPK_GAIN_7_AV_VALUE	\
> +	(AW_PID_2049_SPK_GAIN_7_AV << AW_PID_2049_SPK_GAIN_START_BIT)
> +
> +#define AW_PID_2049_SPK_GAIN_12_AV		(4)
> +#define AW_PID_2049_SPK_GAIN_12_AV_VALUE	\
> +	(AW_PID_2049_SPK_GAIN_12_AV << AW_PID_2049_SPK_GAIN_START_BIT)
> +
> +#define AW_PID_2049_SPK_GAIN_14_AV		(5)
> +#define AW_PID_2049_SPK_GAIN_14_AV_VALUE	\
> +	(AW_PID_2049_SPK_GAIN_14_AV << AW_PID_2049_SPK_GAIN_START_BIT)
> +
> +#define AW_PID_2049_SPK_GAIN_DEFAULT_VALUE	(0x5)
> +#define AW_PID_2049_SPK_GAIN_DEFAULT	\
> +	(AW_PID_2049_SPK_GAIN_DEFAULT_VALUE << AW_PID_2049_SPK_GAIN_START_BIT)
> +
> +/* RMSE bit 11 (SYSCTRL 0x04) */
> +#define AW_PID_2049_RMSE_START_BIT		(11)
> +#define AW_PID_2049_RMSE_BITS_LEN		(1)
> +#define AW_PID_2049_RMSE_MASK			\
> +	(~(((1<<AW_PID_2049_RMSE_BITS_LEN)-1) << AW_PID_2049_RMSE_START_BIT))
> +
> +#define AW_PID_2049_RMSE_PEAK_AGC		(0)
> +#define AW_PID_2049_RMSE_PEAK_AGC_VALUE	\
> +	(AW_PID_2049_RMSE_PEAK_AGC << AW_PID_2049_RMSE_START_BIT)
> +
> +#define AW_PID_2049_RMSE_RMS_AGC		(1)
> +#define AW_PID_2049_RMSE_RMS_AGC_VALUE	\
> +	(AW_PID_2049_RMSE_RMS_AGC << AW_PID_2049_RMSE_START_BIT)
> +
> +#define AW_PID_2049_RMSE_DEFAULT_VALUE	(0)
> +#define AW_PID_2049_RMSE_DEFAULT		\
> +	(AW_PID_2049_RMSE_DEFAULT_VALUE << AW_PID_2049_RMSE_START_BIT)
> +
> +/* HAGCE bit 10 (SYSCTRL 0x04) */
> +#define AW_PID_2049_HAGCE_START_BIT		(10)
> +#define AW_PID_2049_HAGCE_BITS_LEN		(1)
> +#define AW_PID_2049_HAGCE_MASK			\
> +	(~(((1<<AW_PID_2049_HAGCE_BITS_LEN)-1) << AW_PID_2049_HAGCE_START_BIT))
> +
> +#define AW_PID_2049_HAGCE_DISABLE		(0)
> +#define AW_PID_2049_HAGCE_DISABLE_VALUE	\
> +	(AW_PID_2049_HAGCE_DISABLE << AW_PID_2049_HAGCE_START_BIT)
> +
> +#define AW_PID_2049_HAGCE_ENABLE		(1)
> +#define AW_PID_2049_HAGCE_ENABLE_VALUE	\
> +	(AW_PID_2049_HAGCE_ENABLE << AW_PID_2049_HAGCE_START_BIT)
> +
> +#define AW_PID_2049_HAGCE_DEFAULT_VALUE	(0)
> +#define AW_PID_2049_HAGCE_DEFAULT		\
> +	(AW_PID_2049_HAGCE_DEFAULT_VALUE << AW_PID_2049_HAGCE_START_BIT)
> +
> +/* HDCCE bit 9 (SYSCTRL 0x04) */
> +#define AW_PID_2049_HDCCE_START_BIT		(9)
> +#define AW_PID_2049_HDCCE_BITS_LEN		(1)
> +#define AW_PID_2049_HDCCE_MASK			\
> +	(~(((1<<AW_PID_2049_HDCCE_BITS_LEN)-1) << AW_PID_2049_HDCCE_START_BIT))
> +
> +#define AW_PID_2049_HDCCE_DISABLE		(0)
> +#define AW_PID_2049_HDCCE_DISABLE_VALUE	\
> +	(AW_PID_2049_HDCCE_DISABLE << AW_PID_2049_HDCCE_START_BIT)
> +
> +#define AW_PID_2049_HDCCE_ENABLE		(1)
> +#define AW_PID_2049_HDCCE_ENABLE_VALUE	\
> +	(AW_PID_2049_HDCCE_ENABLE << AW_PID_2049_HDCCE_START_BIT)
> +
> +#define AW_PID_2049_HDCCE_DEFAULT_VALUE	(1)
> +#define AW_PID_2049_HDCCE_DEFAULT		\
> +	(AW_PID_2049_HDCCE_DEFAULT_VALUE << AW_PID_2049_HDCCE_START_BIT)
> +
> +/* HMUTE bit 8 (SYSCTRL 0x04) */
> +#define AW_PID_2049_HMUTE_START_BIT		(8)
> +#define AW_PID_2049_HMUTE_BITS_LEN		(1)
> +#define AW_PID_2049_HMUTE_MASK			\
> +	(~(((1<<AW_PID_2049_HMUTE_BITS_LEN)-1) << AW_PID_2049_HMUTE_START_BIT))
> +
> +#define AW_PID_2049_HMUTE_DISABLE		(0)
> +#define AW_PID_2049_HMUTE_DISABLE_VALUE	\
> +	(AW_PID_2049_HMUTE_DISABLE << AW_PID_2049_HMUTE_START_BIT)
> +
> +#define AW_PID_2049_HMUTE_ENABLE		(1)
> +#define AW_PID_2049_HMUTE_ENABLE_VALUE	\
> +	(AW_PID_2049_HMUTE_ENABLE << AW_PID_2049_HMUTE_START_BIT)
> +
> +#define AW_PID_2049_HMUTE_DEFAULT_VALUE	(1)
> +#define AW_PID_2049_HMUTE_DEFAULT		\
> +	(AW_PID_2049_HMUTE_DEFAULT_VALUE << AW_PID_2049_HMUTE_START_BIT)
> +
> +/* RCV_MODE bit 7 (SYSCTRL 0x04) */
> +#define AW_PID_2049_RCV_MODE_START_BIT	(7)
> +#define AW_PID_2049_RCV_MODE_BITS_LEN	(1)
> +#define AW_PID_2049_RCV_MODE_MASK		\
> +	(~(((1<<AW_PID_2049_RCV_MODE_BITS_LEN)-1) << AW_PID_2049_RCV_MODE_START_BIT))
> +
> +#define AW_PID_2049_RCV_MODE_SPEAKER	(0)
> +#define AW_PID_2049_RCV_MODE_SPEAKER_VALUE	\
> +	(AW_PID_2049_RCV_MODE_SPEAKER << AW_PID_2049_RCV_MODE_START_BIT)
> +
> +#define AW_PID_2049_RCV_MODE_RECEIVER	(1)
> +#define AW_PID_2049_RCV_MODE_RECEIVER_VALUE	\
> +	(AW_PID_2049_RCV_MODE_RECEIVER << AW_PID_2049_RCV_MODE_START_BIT)
> +
> +#define AW_PID_2049_RCV_MODE_DEFAULT_VALUE	(0)
> +#define AW_PID_2049_RCV_MODE_DEFAULT	\
> +	(AW_PID_2049_RCV_MODE_DEFAULT_VALUE << AW_PID_2049_RCV_MODE_START_BIT)
> +
> +/* I2SEN bit 6 (SYSCTRL 0x04) */
> +#define AW_PID_2049_I2SEN_START_BIT		(6)
> +#define AW_PID_2049_I2SEN_BITS_LEN		(1)
> +#define AW_PID_2049_I2SEN_MASK			\
> +	(~(((1<<AW_PID_2049_I2SEN_BITS_LEN)-1) << AW_PID_2049_I2SEN_START_BIT))
> +
> +#define AW_PID_2049_I2SEN_DISABLE		(0)
> +#define AW_PID_2049_I2SEN_DISABLE_VALUE	\
> +	(AW_PID_2049_I2SEN_DISABLE << AW_PID_2049_I2SEN_START_BIT)
> +
> +#define AW_PID_2049_I2SEN_ENABLE		(1)
> +#define AW_PID_2049_I2SEN_ENABLE_VALUE	\
> +	(AW_PID_2049_I2SEN_ENABLE << AW_PID_2049_I2SEN_START_BIT)
> +
> +#define AW_PID_2049_I2SEN_DEFAULT_VALUE	(0)
> +#define AW_PID_2049_I2SEN_DEFAULT		\
> +	(AW_PID_2049_I2SEN_DEFAULT_VALUE << AW_PID_2049_I2SEN_START_BIT)
> +
> +/* WSINV bit 5 (SYSCTRL 0x04) */
> +#define AW_PID_2049_WSINV_START_BIT		(5)
> +#define AW_PID_2049_WSINV_BITS_LEN		(1)
> +#define AW_PID_2049_WSINV_MASK			\
> +	(~(((1<<AW_PID_2049_WSINV_BITS_LEN)-1) << AW_PID_2049_WSINV_START_BIT))
> +
> +#define AW_PID_2049_WSINV_NOT_SWITCH	(0)
> +#define AW_PID_2049_WSINV_NOT_SWITCH_VALUE	\
> +	(AW_PID_2049_WSINV_NOT_SWITCH << AW_PID_2049_WSINV_START_BIT)
> +
> +#define AW_PID_2049_WSINV_SWITCH		(1)
> +#define AW_PID_2049_WSINV_SWITCH_VALUE	\
> +	(AW_PID_2049_WSINV_SWITCH << AW_PID_2049_WSINV_START_BIT)
> +
> +#define AW_PID_2049_WSINV_DEFAULT_VALUE	(0)
> +#define AW_PID_2049_WSINV_DEFAULT		\
> +	(AW_PID_2049_WSINV_DEFAULT_VALUE << AW_PID_2049_WSINV_START_BIT)
> +
> +/* BCKINV bit 4 (SYSCTRL 0x04) */
> +#define AW_PID_2049_BCKINV_START_BIT	(4)
> +#define AW_PID_2049_BCKINV_BITS_LEN		(1)
> +#define AW_PID_2049_BCKINV_MASK			\
> +	(~(((1<<AW_PID_2049_BCKINV_BITS_LEN)-1) << AW_PID_2049_BCKINV_START_BIT))
> +
> +#define AW_PID_2049_BCKINV_NOT_INVERT	(0)
> +#define AW_PID_2049_BCKINV_NOT_INVERT_VALUE	\
> +	(AW_PID_2049_BCKINV_NOT_INVERT << AW_PID_2049_BCKINV_START_BIT)
> +
> +#define AW_PID_2049_BCKINV_INVERTED		(1)
> +#define AW_PID_2049_BCKINV_INVERTED_VALUE	\
> +	(AW_PID_2049_BCKINV_INVERTED << AW_PID_2049_BCKINV_START_BIT)
> +
> +#define AW_PID_2049_BCKINV_DEFAULT_VALUE	(0)
> +#define AW_PID_2049_BCKINV_DEFAULT		\
> +	(AW_PID_2049_BCKINV_DEFAULT_VALUE << AW_PID_2049_BCKINV_START_BIT)
> +
> +/* IPLL bit 3 (SYSCTRL 0x04) */
> +#define AW_PID_2049_IPLL_START_BIT		(3)
> +#define AW_PID_2049_IPLL_BITS_LEN		(1)
> +#define AW_PID_2049_IPLL_MASK			\
> +	(~(((1<<AW_PID_2049_IPLL_BITS_LEN)-1) << AW_PID_2049_IPLL_START_BIT))
> +
> +#define AW_PID_2049_IPLL_BCK			(0)
> +#define AW_PID_2049_IPLL_BCK_VALUE		\
> +	(AW_PID_2049_IPLL_BCK << AW_PID_2049_IPLL_START_BIT)
> +
> +#define AW_PID_2049_IPLL_WCK			(1)
> +#define AW_PID_2049_IPLL_WCK_VALUE		\
> +	(AW_PID_2049_IPLL_WCK << AW_PID_2049_IPLL_START_BIT)
> +
> +#define AW_PID_2049_IPLL_DEFAULT_VALUE	(0)
> +#define AW_PID_2049_IPLL_DEFAULT		\
> +	(AW_PID_2049_IPLL_DEFAULT_VALUE << AW_PID_2049_IPLL_START_BIT)
> +
> +/* DSPBY bit 2 (SYSCTRL 0x04) */
> +#define AW_PID_2049_DSPBY_START_BIT		(2)
> +#define AW_PID_2049_DSPBY_BITS_LEN		(1)
> +#define AW_PID_2049_DSPBY_MASK			\
> +	(~(((1<<AW_PID_2049_DSPBY_BITS_LEN)-1) << AW_PID_2049_DSPBY_START_BIT))
> +
> +#define AW_PID_2049_DSPBY_WORKING		(0)
> +#define AW_PID_2049_DSPBY_WORKING_VALUE	\
> +	(AW_PID_2049_DSPBY_WORKING << AW_PID_2049_DSPBY_START_BIT)
> +
> +#define AW_PID_2049_DSPBY_BYPASS		(1)
> +#define AW_PID_2049_DSPBY_BYPASS_VALUE	\
> +	(AW_PID_2049_DSPBY_BYPASS << AW_PID_2049_DSPBY_START_BIT)
> +
> +#define AW_PID_2049_DSPBY_DEFAULT_VALUE	(1)
> +#define AW_PID_2049_DSPBY_DEFAULT		\
> +	(AW_PID_2049_DSPBY_DEFAULT_VALUE << AW_PID_2049_DSPBY_START_BIT)
> +
> +/* AMPPD bit 1 (SYSCTRL 0x04) */
> +#define AW_PID_2049_AMPPD_START_BIT		(1)
> +#define AW_PID_2049_AMPPD_BITS_LEN		(1)
> +#define AW_PID_2049_AMPPD_MASK			\
> +	(~(((1<<AW_PID_2049_AMPPD_BITS_LEN)-1) << AW_PID_2049_AMPPD_START_BIT))
> +
> +#define AW_PID_2049_AMPPD_WORKING		(0)
> +#define AW_PID_2049_AMPPD_WORKING_VALUE	\
> +	(AW_PID_2049_AMPPD_WORKING << AW_PID_2049_AMPPD_START_BIT)
> +
> +#define AW_PID_2049_AMPPD_POWER_DOWN	(1)
> +#define AW_PID_2049_AMPPD_POWER_DOWN_VALUE	\
> +	(AW_PID_2049_AMPPD_POWER_DOWN << AW_PID_2049_AMPPD_START_BIT)
> +
> +#define AW_PID_2049_AMPPD_DEFAULT_VALUE	(1)
> +#define AW_PID_2049_AMPPD_DEFAULT		\
> +	(AW_PID_2049_AMPPD_DEFAULT_VALUE << AW_PID_2049_AMPPD_START_BIT)
> +
> +/* PWDN bit 0 (SYSCTRL 0x04) */
> +#define AW_PID_2049_PWDN_START_BIT		(0)
> +#define AW_PID_2049_PWDN_BITS_LEN		(1)
> +#define AW_PID_2049_PWDN_MASK			\
> +	(~(((1<<AW_PID_2049_PWDN_BITS_LEN)-1) << AW_PID_2049_PWDN_START_BIT))
> +
> +#define AW_PID_2049_PWDN_WORKING		(0)
> +#define AW_PID_2049_PWDN_WORKING_VALUE	\
> +	(AW_PID_2049_PWDN_WORKING << AW_PID_2049_PWDN_START_BIT)
> +
> +#define AW_PID_2049_PWDN_POWER_DOWN		(1)
> +#define AW_PID_2049_PWDN_POWER_DOWN_VALUE	\
> +	(AW_PID_2049_PWDN_POWER_DOWN << AW_PID_2049_PWDN_START_BIT)
> +
> +#define AW_PID_2049_PWDN_DEFAULT_VALUE	(1)
> +#define AW_PID_2049_PWDN_DEFAULT		\
> +	(AW_PID_2049_PWDN_DEFAULT_VALUE << AW_PID_2049_PWDN_START_BIT)
> +
> +/* default value of SYSCTRL (0x04) */
> +/* #define AW_PID_2049_SYSCTRL_DEFAULT		(0x5307) */
> +
> +/* SYSCTRL2 (0x05) detail */
> +/* VOL bit 15:6 (SYSCTRL2 0x05) */
> +#define AW_PID_2049_MUTE_VOL		(90 * 8)
> +#define AW_PID_2049_VOLUME_STEP_DB		(6 * 8)
> +
> +#define AW_PID_2049_VOL_6DB_START				(6)
> +#define AW_PID_2049_VOL_START_BIT		(6)
> +#define AW_PID_2049_VOL_BITS_LEN		(10)
> +#define AW_PID_2049_VOL_MASK			\
> +	(~(((1<<AW_PID_2049_VOL_BITS_LEN)-1) << AW_PID_2049_VOL_START_BIT))
> +
> +#define AW_PID_2049_VOL_DEFAULT_VALUE	(0)
> +#define AW_PID_2049_VOL_DEFAULT			\
> +	(AW_PID_2049_VOL_DEFAULT_VALUE << AW_PID_2049_VOL_START_BIT)
> +
> +/* INTMODE bit 5 (SYSCTRL2 0x05) */
> +#define AW_PID_2049_INTMODE_START_BIT	(5)
> +#define AW_PID_2049_INTMODE_BITS_LEN	(1)
> +#define AW_PID_2049_INTMODE_MASK		\
> +	(~(((1<<AW_PID_2049_INTMODE_BITS_LEN)-1) << AW_PID_2049_INTMODE_START_BIT))
> +
> +#define AW_PID_2049_INTMODE_OPENMINUS_DRAIN	(0)
> +#define AW_PID_2049_INTMODE_OPENMINUS_DRAIN_VALUE	\
> +	(AW_PID_2049_INTMODE_OPENMINUS_DRAIN << AW_PID_2049_INTMODE_START_BIT)
> +
> +#define AW_PID_2049_INTMODE_PUSHPULL	(1)
> +#define AW_PID_2049_INTMODE_PUSHPULL_VALUE	\
> +	(AW_PID_2049_INTMODE_PUSHPULL << AW_PID_2049_INTMODE_START_BIT)
> +
> +#define AW_PID_2049_INTMODE_DEFAULT_VALUE	(0)
> +#define AW_PID_2049_INTMODE_DEFAULT		\
> +	(AW_PID_2049_INTMODE_DEFAULT_VALUE << AW_PID_2049_INTMODE_START_BIT)
> +
> +/* INTN bit 4 (SYSCTRL2 0x05) */
> +#define AW_PID_2049_INTN_START_BIT		(4)
> +#define AW_PID_2049_INTN_BITS_LEN		(1)
> +#define AW_PID_2049_INTN_MASK			\
> +	(~(((1<<AW_PID_2049_INTN_BITS_LEN)-1) << AW_PID_2049_INTN_START_BIT))
> +
> +#define AW_PID_2049_INTN_SYSINT			(0)
> +#define AW_PID_2049_INTN_SYSINT_VALUE	\
> +	(AW_PID_2049_INTN_SYSINT << AW_PID_2049_INTN_START_BIT)
> +
> +#define AW_PID_2049_INTN_SYSST			(1)
> +#define AW_PID_2049_INTN_SYSST_VALUE	\
> +	(AW_PID_2049_INTN_SYSST << AW_PID_2049_INTN_START_BIT)
> +
> +#define AW_PID_2049_INTN_DEFAULT_VALUE	(0)
> +#define AW_PID_2049_INTN_DEFAULT		\
> +	(AW_PID_2049_INTN_DEFAULT_VALUE << AW_PID_2049_INTN_START_BIT)
> +
> +/* BST_IPEAK bit 3:0 (SYSCTRL2 0x05) */
> +#define AW_PID_2049_BST_IPEAK_START_BIT	(0)
> +#define AW_PID_2049_BST_IPEAK_BITS_LEN	(4)
> +#define AW_PID_2049_BST_IPEAK_MASK		\
> +	(~(((1<<AW_PID_2049_BST_IPEAK_BITS_LEN)-1) << AW_PID_2049_BST_IPEAK_START_BIT))
> +
> +#define AW_PID_2049_BST_IPEAK_1P50A		(0)
> +#define AW_PID_2049_BST_IPEAK_1P50A_VALUE	\
> +	(AW_PID_2049_BST_IPEAK_1P50A << AW_PID_2049_BST_IPEAK_START_BIT)
> +
> +#define AW_PID_2049_BST_IPEAK_1P75A		(1)
> +#define AW_PID_2049_BST_IPEAK_1P75A_VALUE	\
> +	(AW_PID_2049_BST_IPEAK_1P75A << AW_PID_2049_BST_IPEAK_START_BIT)
> +
> +#define AW_PID_2049_BST_IPEAK_2P00A		(2)
> +#define AW_PID_2049_BST_IPEAK_2P00A_VALUE	\
> +	(AW_PID_2049_BST_IPEAK_2P00A << AW_PID_2049_BST_IPEAK_START_BIT)
> +
> +#define AW_PID_2049_BST_IPEAK_2P25A		(3)
> +#define AW_PID_2049_BST_IPEAK_2P25A_VALUE	\
> +	(AW_PID_2049_BST_IPEAK_2P25A << AW_PID_2049_BST_IPEAK_START_BIT)
> +
> +#define AW_PID_2049_BST_IPEAK_2P50A		(4)
> +#define AW_PID_2049_BST_IPEAK_2P50A_VALUE	\
> +	(AW_PID_2049_BST_IPEAK_2P50A << AW_PID_2049_BST_IPEAK_START_BIT)
> +
> +#define AW_PID_2049_BST_IPEAK_2P75A		(5)
> +#define AW_PID_2049_BST_IPEAK_2P75A_VALUE	\
> +	(AW_PID_2049_BST_IPEAK_2P75A << AW_PID_2049_BST_IPEAK_START_BIT)
> +
> +#define AW_PID_2049_BST_IPEAK_3P00A		(6)
> +#define AW_PID_2049_BST_IPEAK_3P00A_VALUE	\
> +	(AW_PID_2049_BST_IPEAK_3P00A << AW_PID_2049_BST_IPEAK_START_BIT)
> +
> +#define AW_PID_2049_BST_IPEAK_3P25A		(7)
> +#define AW_PID_2049_BST_IPEAK_3P25A_VALUE	\
> +	(AW_PID_2049_BST_IPEAK_3P25A << AW_PID_2049_BST_IPEAK_START_BIT)
> +
> +#define AW_PID_2049_BST_IPEAK_3P50A		(8)
> +#define AW_PID_2049_BST_IPEAK_3P50A_VALUE	\
> +	(AW_PID_2049_BST_IPEAK_3P50A << AW_PID_2049_BST_IPEAK_START_BIT)
> +
> +#define AW_PID_2049_BST_IPEAK_3P75A		(9)
> +#define AW_PID_2049_BST_IPEAK_3P75A_VALUE	\
> +	(AW_PID_2049_BST_IPEAK_3P75A << AW_PID_2049_BST_IPEAK_START_BIT)
> +
> +#define AW_PID_2049_BST_IPEAK_4P00A		(10)
> +#define AW_PID_2049_BST_IPEAK_4P00A_VALUE	\
> +	(AW_PID_2049_BST_IPEAK_4P00A << AW_PID_2049_BST_IPEAK_START_BIT)
> +
> +#define AW_PID_2049_BST_IPEAK_4P25A		(11)
> +#define AW_PID_2049_BST_IPEAK_4P25A_VALUE	\
> +	(AW_PID_2049_BST_IPEAK_4P25A << AW_PID_2049_BST_IPEAK_START_BIT)
> +
> +#define AW_PID_2049_BST_IPEAK_4P50A		(12)
> +#define AW_PID_2049_BST_IPEAK_4P50A_VALUE	\
> +	(AW_PID_2049_BST_IPEAK_4P50A << AW_PID_2049_BST_IPEAK_START_BIT)
> +
> +#define AW_PID_2049_BST_IPEAK_DEFAULT_VALUE	(9)
> +#define AW_PID_2049_BST_IPEAK_DEFAULT	\
> +	(AW_PID_2049_BST_IPEAK_DEFAULT_VALUE << AW_PID_2049_BST_IPEAK_START_BIT)
> +
> +/* default value of SYSCTRL2 (0x05) */
> +/* #define AW_PID_2049_SYSCTRL2_DEFAULT		(0x0009) */
> +
> +/* I2SCTRL (0x06) detail */
> +/* SLOT_NUM bit 14:12 (I2SCTRL 0x06) */
> +#define AW_PID_2049_SLOT_NUM_START_BIT	(12)
> +#define AW_PID_2049_SLOT_NUM_BITS_LEN	(3)
> +#define AW_PID_2049_SLOT_NUM_MASK		\
> +	(~(((1<<AW_PID_2049_SLOT_NUM_BITS_LEN)-1) << AW_PID_2049_SLOT_NUM_START_BIT))
> +
> +#define AW_PID_2049_SLOT_NUM_I2S_MODE	(0)
> +#define AW_PID_2049_SLOT_NUM_I2S_MODE_VALUE	\
> +	(AW_PID_2049_SLOT_NUM_I2S_MODE << AW_PID_2049_SLOT_NUM_START_BIT)
> +
> +#define AW_PID_2049_SLOT_NUM_TDM1S		(1)
> +#define AW_PID_2049_SLOT_NUM_TDM1S_VALUE	\
> +	(AW_PID_2049_SLOT_NUM_TDM1S << AW_PID_2049_SLOT_NUM_START_BIT)
> +
> +#define AW_PID_2049_SLOT_NUM_TDM2S		(2)
> +#define AW_PID_2049_SLOT_NUM_TDM2S_VALUE	\
> +	(AW_PID_2049_SLOT_NUM_TDM2S << AW_PID_2049_SLOT_NUM_START_BIT)
> +
> +#define AW_PID_2049_SLOT_NUM_TDM4S		(3)
> +#define AW_PID_2049_SLOT_NUM_TDM4S_VALUE	\
> +	(AW_PID_2049_SLOT_NUM_TDM4S << AW_PID_2049_SLOT_NUM_START_BIT)
> +
> +#define AW_PID_2049_SLOT_NUM_TDM6S		(4)
> +#define AW_PID_2049_SLOT_NUM_TDM6S_VALUE	\
> +	(AW_PID_2049_SLOT_NUM_TDM6S << AW_PID_2049_SLOT_NUM_START_BIT)
> +
> +#define AW_PID_2049_SLOT_NUM_TDM8S		(5)
> +#define AW_PID_2049_SLOT_NUM_TDM8S_VALUE	\
> +	(AW_PID_2049_SLOT_NUM_TDM8S << AW_PID_2049_SLOT_NUM_START_BIT)
> +
> +#define AW_PID_2049_SLOT_NUM_TDM16S		(6)
> +#define AW_PID_2049_SLOT_NUM_TDM16S_VALUE	\
> +	(AW_PID_2049_SLOT_NUM_TDM16S << AW_PID_2049_SLOT_NUM_START_BIT)
> +
> +#define AW_PID_2049_SLOT_NUM_RESERVED	(7)
> +#define AW_PID_2049_SLOT_NUM_RESERVED_VALUE	\
> +	(AW_PID_2049_SLOT_NUM_RESERVED << AW_PID_2049_SLOT_NUM_START_BIT)
> +
> +#define AW_PID_2049_SLOT_NUM_DEFAULT_VALUE	(0)
> +#define AW_PID_2049_SLOT_NUM_DEFAULT	\
> +	(AW_PID_2049_SLOT_NUM_DEFAULT_VALUE << AW_PID_2049_SLOT_NUM_START_BIT)
> +
> +/* CHSEL bit 11:10 (I2SCTRL 0x06) */
> +#define AW_PID_2049_CHSEL_START_BIT		(10)
> +#define AW_PID_2049_CHSEL_BITS_LEN		(2)
> +#define AW_PID_2049_CHSEL_MASK			\
> +	(~(((1<<AW_PID_2049_CHSEL_BITS_LEN)-1) << AW_PID_2049_CHSEL_START_BIT))
> +
> +#define AW_PID_2049_CHSEL_RESERVED		(0)
> +#define AW_PID_2049_CHSEL_RESERVED_VALUE	\
> +	(AW_PID_2049_CHSEL_RESERVED << AW_PID_2049_CHSEL_START_BIT)
> +
> +#define AW_PID_2049_CHSEL_LEFT			(1)
> +#define AW_PID_2049_CHSEL_LEFT_VALUE	\
> +	(AW_PID_2049_CHSEL_LEFT << AW_PID_2049_CHSEL_START_BIT)
> +
> +#define AW_PID_2049_CHSEL_RIGHT			(2)
> +#define AW_PID_2049_CHSEL_RIGHT_VALUE	\
> +	(AW_PID_2049_CHSEL_RIGHT << AW_PID_2049_CHSEL_START_BIT)
> +
> +#define AW_PID_2049_CHSEL_MONO			(3)
> +#define AW_PID_2049_CHSEL_MONO_VALUE	\
> +	(AW_PID_2049_CHSEL_MONO << AW_PID_2049_CHSEL_START_BIT)
> +
> +#define AW_PID_2049_CHSEL_DEFAULT_VALUE	(1)
> +#define AW_PID_2049_CHSEL_DEFAULT		\
> +	(AW_PID_2049_CHSEL_DEFAULT_VALUE << AW_PID_2049_CHSEL_START_BIT)
> +
> +/* I2SMD bit 9:8 (I2SCTRL 0x06) */
> +#define AW_PID_2049_I2SMD_START_BIT		(8)
> +#define AW_PID_2049_I2SMD_BITS_LEN		(2)
> +#define AW_PID_2049_I2SMD_MASK			\
> +	(~(((1<<AW_PID_2049_I2SMD_BITS_LEN)-1) << AW_PID_2049_I2SMD_START_BIT))
> +
> +#define AW_PID_2049_I2SMD_PHILIP_STANDARD	(0)
> +#define AW_PID_2049_I2SMD_PHILIP_STANDARD_VALUE	\
> +	(AW_PID_2049_I2SMD_PHILIP_STANDARD << AW_PID_2049_I2SMD_START_BIT)
> +
> +#define AW_PID_2049_I2SMD_MSB_JUSTIFIED	(1)
> +#define AW_PID_2049_I2SMD_MSB_JUSTIFIED_VALUE	\
> +	(AW_PID_2049_I2SMD_MSB_JUSTIFIED << AW_PID_2049_I2SMD_START_BIT)
> +
> +#define AW_PID_2049_I2SMD_LSB_JUSTIFIED	(2)
> +#define AW_PID_2049_I2SMD_LSB_JUSTIFIED_VALUE	\
> +	(AW_PID_2049_I2SMD_LSB_JUSTIFIED << AW_PID_2049_I2SMD_START_BIT)
> +
> +#define AW_PID_2049_I2SMD_RESERVED		(3)
> +#define AW_PID_2049_I2SMD_RESERVED_VALUE	\
> +	(AW_PID_2049_I2SMD_RESERVED << AW_PID_2049_I2SMD_START_BIT)
> +
> +#define AW_PID_2049_I2SMD_DEFAULT_VALUE	(0)
> +#define AW_PID_2049_I2SMD_DEFAULT		\
> +	(AW_PID_2049_I2SMD_DEFAULT_VALUE << AW_PID_2049_I2SMD_START_BIT)
> +
> +/* I2SFS bit 7:6 (I2SCTRL 0x06) */
> +#define AW_PID_2049_I2SFS_START_BIT		(6)
> +#define AW_PID_2049_I2SFS_BITS_LEN		(2)
> +#define AW_PID_2049_I2SFS_MASK			\
> +	(~(((1<<AW_PID_2049_I2SFS_BITS_LEN)-1) << AW_PID_2049_I2SFS_START_BIT))
> +
> +#define AW_PID_2049_I2SFS_16_BITS		(0)
> +#define AW_PID_2049_I2SFS_16_BITS_VALUE	\
> +	(AW_PID_2049_I2SFS_16_BITS << AW_PID_2049_I2SFS_START_BIT)
> +
> +#define AW_PID_2049_I2SFS_20_BITS		(1)
> +#define AW_PID_2049_I2SFS_20_BITS_VALUE	\
> +	(AW_PID_2049_I2SFS_20_BITS << AW_PID_2049_I2SFS_START_BIT)
> +
> +#define AW_PID_2049_I2SFS_24_BITS		(2)
> +#define AW_PID_2049_I2SFS_24_BITS_VALUE	\
> +	(AW_PID_2049_I2SFS_24_BITS << AW_PID_2049_I2SFS_START_BIT)
> +
> +#define AW_PID_2049_I2SFS_32_BITS		(3)
> +#define AW_PID_2049_I2SFS_32_BITS_VALUE	\
> +	(AW_PID_2049_I2SFS_32_BITS << AW_PID_2049_I2SFS_START_BIT)
> +
> +#define AW_PID_2049_I2SFS_DEFAULT_VALUE	(3)
> +#define AW_PID_2049_I2SFS_DEFAULT		\
> +	(AW_PID_2049_I2SFS_DEFAULT_VALUE << AW_PID_2049_I2SFS_START_BIT)
> +
> +/* I2SBCK bit 5:4 (I2SCTRL 0x06) */
> +#define AW_PID_2049_I2SBCK_START_BIT	(4)
> +#define AW_PID_2049_I2SBCK_BITS_LEN		(2)
> +#define AW_PID_2049_I2SBCK_MASK			\
> +	(~(((1<<AW_PID_2049_I2SBCK_BITS_LEN)-1) << AW_PID_2049_I2SBCK_START_BIT))
> +
> +#define AW_PID_2049_I2SBCK_32FS			(0)
> +#define AW_PID_2049_I2SBCK_32FS_VALUE	\
> +	(AW_PID_2049_I2SBCK_32FS << AW_PID_2049_I2SBCK_START_BIT)
> +
> +#define AW_PID_2049_I2SBCK_48FS			(1)
> +#define AW_PID_2049_I2SBCK_48FS_VALUE	\
> +	(AW_PID_2049_I2SBCK_48FS << AW_PID_2049_I2SBCK_START_BIT)
> +
> +#define AW_PID_2049_I2SBCK_64FS			(2)
> +#define AW_PID_2049_I2SBCK_64FS_VALUE	\
> +	(AW_PID_2049_I2SBCK_64FS << AW_PID_2049_I2SBCK_START_BIT)
> +
> +#define AW_PID_2049_I2SBCK_RESERVED		(3)
> +#define AW_PID_2049_I2SBCK_RESERVED_VALUE	\
> +	(AW_PID_2049_I2SBCK_RESERVED << AW_PID_2049_I2SBCK_START_BIT)
> +
> +#define AW_PID_2049_I2SBCK_DEFAULT_VALUE	(2)
> +#define AW_PID_2049_I2SBCK_DEFAULT		\
> +	(AW_PID_2049_I2SBCK_DEFAULT_VALUE << AW_PID_2049_I2SBCK_START_BIT)
> +
> +/* I2SSR bit 3:0 (I2SCTRL 0x06) */
> +#define AW_PID_2049_I2SSR_START_BIT		(0)
> +#define AW_PID_2049_I2SSR_BITS_LEN		(4)
> +#define AW_PID_2049_I2SSR_MASK			\
> +	(~(((1<<AW_PID_2049_I2SSR_BITS_LEN)-1) << AW_PID_2049_I2SSR_START_BIT))
> +
> +#define AW_PID_2049_I2SSR_8_KHZ			(0)
> +#define AW_PID_2049_I2SSR_8_KHZ_VALUE	\
> +	(AW_PID_2049_I2SSR_8_KHZ << AW_PID_2049_I2SSR_START_BIT)
> +
> +#define AW_PID_2049_I2SSR_11_KHZ		(1)
> +#define AW_PID_2049_I2SSR_11_KHZ_VALUE	\
> +	(AW_PID_2049_I2SSR_11_KHZ << AW_PID_2049_I2SSR_START_BIT)
> +
> +#define AW_PID_2049_I2SSR_12_KHZ		(2)
> +#define AW_PID_2049_I2SSR_12_KHZ_VALUE	\
> +	(AW_PID_2049_I2SSR_12_KHZ << AW_PID_2049_I2SSR_START_BIT)
> +
> +#define AW_PID_2049_I2SSR_16_KHZ		(3)
> +#define AW_PID_2049_I2SSR_16_KHZ_VALUE	\
> +	(AW_PID_2049_I2SSR_16_KHZ << AW_PID_2049_I2SSR_START_BIT)
> +
> +#define AW_PID_2049_I2SSR_22_KHZ		(4)
> +#define AW_PID_2049_I2SSR_22_KHZ_VALUE	\
> +	(AW_PID_2049_I2SSR_22_KHZ << AW_PID_2049_I2SSR_START_BIT)
> +
> +#define AW_PID_2049_I2SSR_24_KHZ		(5)
> +#define AW_PID_2049_I2SSR_24_KHZ_VALUE	\
> +	(AW_PID_2049_I2SSR_24_KHZ << AW_PID_2049_I2SSR_START_BIT)
> +
> +#define AW_PID_2049_I2SSR_32_KHZ		(6)
> +#define AW_PID_2049_I2SSR_32_KHZ_VALUE	\
> +	(AW_PID_2049_I2SSR_32_KHZ << AW_PID_2049_I2SSR_START_BIT)
> +
> +#define AW_PID_2049_I2SSR_44_KHZ		(7)
> +#define AW_PID_2049_I2SSR_44_KHZ_VALUE	\
> +	(AW_PID_2049_I2SSR_44_KHZ << AW_PID_2049_I2SSR_START_BIT)
> +
> +#define AW_PID_2049_I2SSR_48_KHZ		(8)
> +#define AW_PID_2049_I2SSR_48_KHZ_VALUE	\
> +	(AW_PID_2049_I2SSR_48_KHZ << AW_PID_2049_I2SSR_START_BIT)
> +
> +#define AW_PID_2049_I2SSR_96_KHZ		(9)
> +#define AW_PID_2049_I2SSR_96_KHZ_VALUE	\
> +	(AW_PID_2049_I2SSR_96_KHZ << AW_PID_2049_I2SSR_START_BIT)
> +
> +#define AW_PID_2049_I2SSR_192KHZ		(10)
> +#define AW_PID_2049_I2SSR_192KHZ_VALUE	\
> +	(AW_PID_2049_I2SSR_192KHZ << AW_PID_2049_I2SSR_START_BIT)
> +
> +#define AW_PID_2049_I2SSR_DEFAULT_VALUE	(8)
> +#define AW_PID_2049_I2SSR_DEFAULT		\
> +	(AW_PID_2049_I2SSR_DEFAULT_VALUE << AW_PID_2049_I2SSR_START_BIT)
> +
> +/* default value of I2SCTRL (0x06) */
> +/* #define AW_PID_2049_I2SCTRL_DEFAULT		(0x04E8) */
> +
> +/* I2SCFG1 (0x07) detail */
> +/* I2S_RXL_SLOTVLD bit 15:12 (I2SCFG1 0x07) */
> +#define AW_PID_2049_I2S_RXL_SLOTVLD_START_BIT	(12)
> +#define AW_PID_2049_I2S_RXL_SLOTVLD_BITS_LEN	(4)
> +#define AW_PID_2049_I2S_RXL_SLOTVLD_MASK	\
> +	(~(((1<<AW_PID_2049_I2S_RXL_SLOTVLD_BITS_LEN)-1) << AW_PID_2049_I2S_RXL_SLOTVLD_START_BIT))
> +
> +#define AW_PID_2049_I2S_RXL_SLOTVLD_SLOT_0	(0)
> +#define AW_PID_2049_I2S_RXL_SLOTVLD_SLOT_0_VALUE	\
> +	(AW_PID_2049_I2S_RXL_SLOTVLD_SLOT_0 << AW_PID_2049_I2S_RXL_SLOTVLD_START_BIT)
> +
> +#define AW_PID_2049_I2S_RXL_SLOTVLD_SLOT_1	(1)
> +#define AW_PID_2049_I2S_RXL_SLOTVLD_SLOT_1_VALUE	\
> +	(AW_PID_2049_I2S_RXL_SLOTVLD_SLOT_1 << AW_PID_2049_I2S_RXL_SLOTVLD_START_BIT)
> +
> +#define AW_PID_2049_I2S_RXL_SLOTVLD_SLOT_2	(2)
> +#define AW_PID_2049_I2S_RXL_SLOTVLD_SLOT_2_VALUE	\
> +	(AW_PID_2049_I2S_RXL_SLOTVLD_SLOT_2 << AW_PID_2049_I2S_RXL_SLOTVLD_START_BIT)
> +
> +#define AW_PID_2049_I2S_RXL_SLOTVLD_SLOT_3	(3)
> +#define AW_PID_2049_I2S_RXL_SLOTVLD_SLOT_3_VALUE	\
> +	(AW_PID_2049_I2S_RXL_SLOTVLD_SLOT_3 << AW_PID_2049_I2S_RXL_SLOTVLD_START_BIT)
> +
> +#define AW_PID_2049_I2S_RXL_SLOTVLD_SLOT_15	(15)
> +#define AW_PID_2049_I2S_RXL_SLOTVLD_SLOT_15_VALUE	\
> +	(AW_PID_2049_I2S_RXL_SLOTVLD_SLOT_15 << AW_PID_2049_I2S_RXL_SLOTVLD_START_BIT)
> +
> +#define AW_PID_2049_I2S_RXL_SLOTVLD_DEFAULT_VALUE	(0)
> +#define AW_PID_2049_I2S_RXL_SLOTVLD_DEFAULT	\
> +	(AW_PID_2049_I2S_RXL_SLOTVLD_DEFAULT_VALUE << AW_PID_2049_I2S_RXL_SLOTVLD_START_BIT)
> +
> +/* I2S_RXR_SLOTVLD bit 11:8 (I2SCFG1 0x07) */
> +#define AW_PID_2049_I2S_RXR_SLOTVLD_START_BIT	(8)
> +#define AW_PID_2049_I2S_RXR_SLOTVLD_BITS_LEN	(4)
> +#define AW_PID_2049_I2S_RXR_SLOTVLD_MASK	\
> +	(~(((1<<AW_PID_2049_I2S_RXR_SLOTVLD_BITS_LEN)-1) << AW_PID_2049_I2S_RXR_SLOTVLD_START_BIT))
> +
> +#define AW_PID_2049_I2S_RXR_SLOTVLD_SLOT_0	(0)
> +#define AW_PID_2049_I2S_RXR_SLOTVLD_SLOT_0_VALUE	\
> +	(AW_PID_2049_I2S_RXR_SLOTVLD_SLOT_0 << AW_PID_2049_I2S_RXR_SLOTVLD_START_BIT)
> +
> +#define AW_PID_2049_I2S_RXR_SLOTVLD_SLOT_1	(1)
> +#define AW_PID_2049_I2S_RXR_SLOTVLD_SLOT_1_VALUE	\
> +	(AW_PID_2049_I2S_RXR_SLOTVLD_SLOT_1 << AW_PID_2049_I2S_RXR_SLOTVLD_START_BIT)
> +
> +#define AW_PID_2049_I2S_RXR_SLOTVLD_SLOT_2	(2)
> +#define AW_PID_2049_I2S_RXR_SLOTVLD_SLOT_2_VALUE	\
> +	(AW_PID_2049_I2S_RXR_SLOTVLD_SLOT_2 << AW_PID_2049_I2S_RXR_SLOTVLD_START_BIT)
> +
> +#define AW_PID_2049_I2S_RXR_SLOTVLD_SLOT_3	(3)
> +#define AW_PID_2049_I2S_RXR_SLOTVLD_SLOT_3_VALUE	\
> +	(AW_PID_2049_I2S_RXR_SLOTVLD_SLOT_3 << AW_PID_2049_I2S_RXR_SLOTVLD_START_BIT)
> +
> +#define AW_PID_2049_I2S_RXR_SLOTVLD_SLOT_15	(15)
> +#define AW_PID_2049_I2S_RXR_SLOTVLD_SLOT_15_VALUE	\
> +	(AW_PID_2049_I2S_RXR_SLOTVLD_SLOT_15 << AW_PID_2049_I2S_RXR_SLOTVLD_START_BIT)
> +
> +#define AW_PID_2049_I2S_RXR_SLOTVLD_DEFAULT_VALUE	(1)
> +#define AW_PID_2049_I2S_RXR_SLOTVLD_DEFAULT	\
> +	(AW_PID_2049_I2S_RXR_SLOTVLD_DEFAULT_VALUE << AW_PID_2049_I2S_RXR_SLOTVLD_START_BIT)
> +
> +/* I2S_TX_SLOTVLD bit 7:4 (I2SCFG1 0x07) */
> +#define AW_PID_2049_I2S_TX_SLOTVLD_START_BIT	(4)
> +#define AW_PID_2049_I2S_TX_SLOTVLD_BITS_LEN	(4)
> +#define AW_PID_2049_I2S_TX_SLOTVLD_MASK	\
> +	(~(((1<<AW_PID_2049_I2S_TX_SLOTVLD_BITS_LEN)-1) << AW_PID_2049_I2S_TX_SLOTVLD_START_BIT))
> +
> +#define AW_PID_2049_I2S_TX_SLOTVLD_SLOT_0	(0)
> +#define AW_PID_2049_I2S_TX_SLOTVLD_SLOT_0_VALUE	\
> +	(AW_PID_2049_I2S_TX_SLOTVLD_SLOT_0 << AW_PID_2049_I2S_TX_SLOTVLD_START_BIT)
> +
> +#define AW_PID_2049_I2S_TX_SLOTVLD_SLOT_1	(1)
> +#define AW_PID_2049_I2S_TX_SLOTVLD_SLOT_1_VALUE	\
> +	(AW_PID_2049_I2S_TX_SLOTVLD_SLOT_1 << AW_PID_2049_I2S_TX_SLOTVLD_START_BIT)
> +
> +#define AW_PID_2049_I2S_TX_SLOTVLD_SLOT_2	(2)
> +#define AW_PID_2049_I2S_TX_SLOTVLD_SLOT_2_VALUE	\
> +	(AW_PID_2049_I2S_TX_SLOTVLD_SLOT_2 << AW_PID_2049_I2S_TX_SLOTVLD_START_BIT)
> +
> +#define AW_PID_2049_I2S_TX_SLOTVLD_SLOT_3	(3)
> +#define AW_PID_2049_I2S_TX_SLOTVLD_SLOT_3_VALUE	\
> +	(AW_PID_2049_I2S_TX_SLOTVLD_SLOT_3 << AW_PID_2049_I2S_TX_SLOTVLD_START_BIT)
> +
> +#define AW_PID_2049_I2S_TX_SLOTVLD_SLOT_15	(15)
> +#define AW_PID_2049_I2S_TX_SLOTVLD_SLOT_15_VALUE	\
> +	(AW_PID_2049_I2S_TX_SLOTVLD_SLOT_15 << AW_PID_2049_I2S_TX_SLOTVLD_START_BIT)
> +
> +#define AW_PID_2049_I2S_TX_SLOTVLD_DEFAULT_VALUE	(0)
> +#define AW_PID_2049_I2S_TX_SLOTVLD_DEFAULT	\
> +	(AW_PID_2049_I2S_TX_SLOTVLD_DEFAULT_VALUE << AW_PID_2049_I2S_TX_SLOTVLD_START_BIT)
> +
> +/* FSYNC_TYPE bit 3 (I2SCFG1 0x07) */
> +#define AW_PID_2049_FSYNC_TYPE_START_BIT	(3)
> +#define AW_PID_2049_FSYNC_TYPE_BITS_LEN	(1)
> +#define AW_PID_2049_FSYNC_TYPE_MASK		\
> +	(~(((1<<AW_PID_2049_FSYNC_TYPE_BITS_LEN)-1) << AW_PID_2049_FSYNC_TYPE_START_BIT))
> +
> +#define AW_PID_2049_FSYNC_TYPE_ONEMINUS_SLOT	(0)
> +#define AW_PID_2049_FSYNC_TYPE_ONEMINUS_SLOT_VALUE	\
> +	(AW_PID_2049_FSYNC_TYPE_ONEMINUS_SLOT << AW_PID_2049_FSYNC_TYPE_START_BIT)
> +
> +#define AW_PID_2049_FSYNC_TYPE_ONEMINUS_BCK	(1)
> +#define AW_PID_2049_FSYNC_TYPE_ONEMINUS_BCK_VALUE	\
> +	(AW_PID_2049_FSYNC_TYPE_ONEMINUS_BCK << AW_PID_2049_FSYNC_TYPE_START_BIT)
> +
> +#define AW_PID_2049_FSYNC_TYPE_DEFAULT_VALUE	(0)
> +#define AW_PID_2049_FSYNC_TYPE_DEFAULT	\
> +	(AW_PID_2049_FSYNC_TYPE_DEFAULT_VALUE << AW_PID_2049_FSYNC_TYPE_START_BIT)
> +
> +/* I2SCHS bit 2 (I2SCFG1 0x07) */
> +#define AW_PID_2049_I2SCHS_START_BIT	(2)
> +#define AW_PID_2049_I2SCHS_BITS_LEN		(1)
> +#define AW_PID_2049_I2SCHS_MASK			\
> +	(~(((1<<AW_PID_2049_I2SCHS_BITS_LEN)-1) << AW_PID_2049_I2SCHS_START_BIT))
> +
> +#define AW_PID_2049_I2SCHS_LEFT			(0)
> +#define AW_PID_2049_I2SCHS_LEFT_VALUE	\
> +	(AW_PID_2049_I2SCHS_LEFT << AW_PID_2049_I2SCHS_START_BIT)
> +
> +#define AW_PID_2049_I2SCHS_RIGHT		(1)
> +#define AW_PID_2049_I2SCHS_RIGHT_VALUE	\
> +	(AW_PID_2049_I2SCHS_RIGHT << AW_PID_2049_I2SCHS_START_BIT)
> +
> +#define AW_PID_2049_I2SCHS_DEFAULT_VALUE	(0)
> +#define AW_PID_2049_I2SCHS_DEFAULT		\
> +	(AW_PID_2049_I2SCHS_DEFAULT_VALUE << AW_PID_2049_I2SCHS_START_BIT)
> +
> +/* I2SRXEN bit 1 (I2SCFG1 0x07) */
> +#define AW_PID_2049_I2SRXEN_START_BIT	(1)
> +#define AW_PID_2049_I2SRXEN_BITS_LEN	(1)
> +#define AW_PID_2049_I2SRXEN_MASK		\
> +	(~(((1<<AW_PID_2049_I2SRXEN_BITS_LEN)-1) << AW_PID_2049_I2SRXEN_START_BIT))
> +
> +#define AW_PID_2049_I2SRXEN_DISABLE		(0)
> +#define AW_PID_2049_I2SRXEN_DISABLE_VALUE	\
> +	(AW_PID_2049_I2SRXEN_DISABLE << AW_PID_2049_I2SRXEN_START_BIT)
> +
> +#define AW_PID_2049_I2SRXEN_ENABLE		(1)
> +#define AW_PID_2049_I2SRXEN_ENABLE_VALUE	\
> +	(AW_PID_2049_I2SRXEN_ENABLE << AW_PID_2049_I2SRXEN_START_BIT)
> +
> +#define AW_PID_2049_I2SRXEN_DEFAULT_VALUE	(1)
> +#define AW_PID_2049_I2SRXEN_DEFAULT		\
> +	(AW_PID_2049_I2SRXEN_DEFAULT_VALUE << AW_PID_2049_I2SRXEN_START_BIT)
> +
> +/* I2STXEN bit 0 (I2SCFG1 0x07) */
> +#define AW_PID_2049_I2STXEN_START_BIT	(0)
> +#define AW_PID_2049_I2STXEN_BITS_LEN	(1)
> +#define AW_PID_2049_I2STXEN_MASK		\
> +	(~(((1<<AW_PID_2049_I2STXEN_BITS_LEN)-1) << AW_PID_2049_I2STXEN_START_BIT))
> +
> +#define AW_PID_2049_I2STXEN_DISABLE		(0)
> +#define AW_PID_2049_I2STXEN_DISABLE_VALUE	\
> +	(AW_PID_2049_I2STXEN_DISABLE << AW_PID_2049_I2STXEN_START_BIT)
> +
> +#define AW_PID_2049_I2STXEN_ENABLE		(1)
> +#define AW_PID_2049_I2STXEN_ENABLE_VALUE	\
> +	(AW_PID_2049_I2STXEN_ENABLE << AW_PID_2049_I2STXEN_START_BIT)
> +
> +#define AW_PID_2049_I2STXEN_DEFAULT_VALUE	(0)
> +#define AW_PID_2049_I2STXEN_DEFAULT		\
> +	(AW_PID_2049_I2STXEN_DEFAULT_VALUE << AW_PID_2049_I2STXEN_START_BIT)
> +
> +/* default value of I2SCFG1 (0x07) */
> +/* #define AW_PID_2049_I2SCFG1_DEFAULT		(0x0102) */
> +
> +/* I2SCFG2 (0x08) detail */
> +/* ULS_FIR_MD bit 14 (I2SCFG2 0x08) */
> +#define AW_PID_2049_ULS_FIR_MD_START_BIT	(14)
> +#define AW_PID_2049_ULS_FIR_MD_BITS_LEN	(1)
> +#define AW_PID_2049_ULS_FIR_MD_MASK		\
> +	(~(((1<<AW_PID_2049_ULS_FIR_MD_BITS_LEN)-1) << AW_PID_2049_ULS_FIR_MD_START_BIT))
> +
> +#define AW_PID_2049_ULS_FIR_MD_NOTMINUS_USED	(0)
> +#define AW_PID_2049_ULS_FIR_MD_NOTMINUS_USED_VALUE	\
> +	(AW_PID_2049_ULS_FIR_MD_NOTMINUS_USED << AW_PID_2049_ULS_FIR_MD_START_BIT)
> +
> +#define AW_PID_2049_ULS_FIR_MD_USED		(1)
> +#define AW_PID_2049_ULS_FIR_MD_USED_VALUE	\
> +	(AW_PID_2049_ULS_FIR_MD_USED << AW_PID_2049_ULS_FIR_MD_START_BIT)
> +
> +#define AW_PID_2049_ULS_FIR_MD_DEFAULT_VALUE	(0)
> +#define AW_PID_2049_ULS_FIR_MD_DEFAULT	\
> +	(AW_PID_2049_ULS_FIR_MD_DEFAULT_VALUE << AW_PID_2049_ULS_FIR_MD_START_BIT)
> +
> +/* ULS_MODE bit 13 (I2SCFG2 0x08) */
> +#define AW_PID_2049_ULS_MODE_START_BIT	(13)
> +#define AW_PID_2049_ULS_MODE_BITS_LEN	(1)
> +#define AW_PID_2049_ULS_MODE_MASK		\
> +	(~(((1<<AW_PID_2049_ULS_MODE_BITS_LEN)-1) << AW_PID_2049_ULS_MODE_START_BIT))
> +
> +#define AW_PID_2049_ULS_MODE_LOWPASS	(0)
> +#define AW_PID_2049_ULS_MODE_LOWPASS_VALUE	\
> +	(AW_PID_2049_ULS_MODE_LOWPASS << AW_PID_2049_ULS_MODE_START_BIT)
> +
> +#define AW_PID_2049_ULS_MODE_TDM		(1)
> +#define AW_PID_2049_ULS_MODE_TDM_VALUE	\
> +	(AW_PID_2049_ULS_MODE_TDM << AW_PID_2049_ULS_MODE_START_BIT)
> +
> +#define AW_PID_2049_ULS_MODE_DEFAULT_VALUE	(0)
> +#define AW_PID_2049_ULS_MODE_DEFAULT	\
> +	(AW_PID_2049_ULS_MODE_DEFAULT_VALUE << AW_PID_2049_ULS_MODE_START_BIT)
> +
> +/* ULS_EN bit 12 (I2SCFG2 0x08) */
> +#define AW_PID_2049_ULS_EN_START_BIT	(12)
> +#define AW_PID_2049_ULS_EN_BITS_LEN		(1)
> +#define AW_PID_2049_ULS_EN_MASK			\
> +	(~(((1<<AW_PID_2049_ULS_EN_BITS_LEN)-1) << AW_PID_2049_ULS_EN_START_BIT))
> +
> +#define AW_PID_2049_ULS_EN_DISABLE		(0)
> +#define AW_PID_2049_ULS_EN_DISABLE_VALUE	\
> +	(AW_PID_2049_ULS_EN_DISABLE << AW_PID_2049_ULS_EN_START_BIT)
> +
> +#define AW_PID_2049_ULS_EN_ENABLE		(1)
> +#define AW_PID_2049_ULS_EN_ENABLE_VALUE	\
> +	(AW_PID_2049_ULS_EN_ENABLE << AW_PID_2049_ULS_EN_START_BIT)
> +
> +#define AW_PID_2049_ULS_EN_DEFAULT_VALUE	(0)
> +#define AW_PID_2049_ULS_EN_DEFAULT		\
> +	(AW_PID_2049_ULS_EN_DEFAULT_VALUE << AW_PID_2049_ULS_EN_START_BIT)
> +
> +/* IV2CH bit 9 (I2SCFG2 0x08) */
> +#define AW_PID_2049_IV2CH_START_BIT		(9)
> +#define AW_PID_2049_IV2CH_BITS_LEN		(1)
> +#define AW_PID_2049_IV2CH_MASK			\
> +	(~(((1<<AW_PID_2049_IV2CH_BITS_LEN)-1) << AW_PID_2049_IV2CH_START_BIT))
> +
> +#define AW_PID_2049_IV2CH_LEGACY		(0)
> +#define AW_PID_2049_IV2CH_LEGACY_VALUE	\
> +	(AW_PID_2049_IV2CH_LEGACY << AW_PID_2049_IV2CH_START_BIT)
> +
> +#define AW_PID_2049_IV2CH_SPECIAL		(1)
> +#define AW_PID_2049_IV2CH_SPECIAL_VALUE	\
> +	(AW_PID_2049_IV2CH_SPECIAL << AW_PID_2049_IV2CH_START_BIT)
> +
> +#define AW_PID_2049_IV2CH_DEFAULT_VALUE	(0)
> +#define AW_PID_2049_IV2CH_DEFAULT		\
> +	(AW_PID_2049_IV2CH_DEFAULT_VALUE << AW_PID_2049_IV2CH_START_BIT)
> +
> +/* I2S_TXEDGE bit 8 (I2SCFG2 0x08) */
> +#define AW_PID_2049_I2S_TXEDGE_START_BIT	(8)
> +#define AW_PID_2049_I2S_TXEDGE_BITS_LEN	(1)
> +#define AW_PID_2049_I2S_TXEDGE_MASK		\
> +	(~(((1<<AW_PID_2049_I2S_TXEDGE_BITS_LEN)-1) << AW_PID_2049_I2S_TXEDGE_START_BIT))
> +
> +#define AW_PID_2049_I2S_TXEDGE_NEGEDGE	(0)
> +#define AW_PID_2049_I2S_TXEDGE_NEGEDGE_VALUE	\
> +	(AW_PID_2049_I2S_TXEDGE_NEGEDGE << AW_PID_2049_I2S_TXEDGE_START_BIT)
> +
> +#define AW_PID_2049_I2S_TXEDGE_POSEDGE	(1)
> +#define AW_PID_2049_I2S_TXEDGE_POSEDGE_VALUE	\
> +	(AW_PID_2049_I2S_TXEDGE_POSEDGE << AW_PID_2049_I2S_TXEDGE_START_BIT)
> +
> +#define AW_PID_2049_I2S_TXEDGE_DEFAULT_VALUE	(0)
> +#define AW_PID_2049_I2S_TXEDGE_DEFAULT	\
> +	(AW_PID_2049_I2S_TXEDGE_DEFAULT_VALUE << AW_PID_2049_I2S_TXEDGE_START_BIT)
> +
> +/* I2SDOSEL bit 7 (I2SCFG2 0x08) */
> +#define AW_PID_2049_I2SDOSEL_START_BIT	(7)
> +#define AW_PID_2049_I2SDOSEL_BITS_LEN	(1)
> +#define AW_PID_2049_I2SDOSEL_MASK		\
> +	(~(((1<<AW_PID_2049_I2SDOSEL_BITS_LEN)-1) << AW_PID_2049_I2SDOSEL_START_BIT))
> +
> +#define AW_PID_2049_I2SDOSEL_ZEROS		(0)
> +#define AW_PID_2049_I2SDOSEL_ZEROS_VALUE	\
> +	(AW_PID_2049_I2SDOSEL_ZEROS << AW_PID_2049_I2SDOSEL_START_BIT)
> +
> +#define AW_PID_2049_I2SDOSEL_TXDATA		(1)
> +#define AW_PID_2049_I2SDOSEL_TXDATA_VALUE	\
> +	(AW_PID_2049_I2SDOSEL_TXDATA << AW_PID_2049_I2SDOSEL_START_BIT)
> +
> +#define AW_PID_2049_I2SDOSEL_DEFAULT_VALUE	(0)
> +#define AW_PID_2049_I2SDOSEL_DEFAULT	\
> +	(AW_PID_2049_I2SDOSEL_DEFAULT_VALUE << AW_PID_2049_I2SDOSEL_START_BIT)
> +
> +/* DOHZ bit 6 (I2SCFG2 0x08) */
> +#define AW_PID_2049_DOHZ_START_BIT		(6)
> +#define AW_PID_2049_DOHZ_BITS_LEN		(1)
> +#define AW_PID_2049_DOHZ_MASK			\
> +	(~(((1<<AW_PID_2049_DOHZ_BITS_LEN)-1) << AW_PID_2049_DOHZ_START_BIT))
> +
> +#define AW_PID_2049_DOHZ_ALL			(0)
> +#define AW_PID_2049_DOHZ_ALL_VALUE		\
> +	(AW_PID_2049_DOHZ_ALL << AW_PID_2049_DOHZ_START_BIT)
> +
> +#define AW_PID_2049_DOHZ_HIZ			(1)
> +#define AW_PID_2049_DOHZ_HIZ_VALUE		\
> +	(AW_PID_2049_DOHZ_HIZ << AW_PID_2049_DOHZ_START_BIT)
> +
> +#define AW_PID_2049_DOHZ_DEFAULT_VALUE	(1)
> +#define AW_PID_2049_DOHZ_DEFAULT		\
> +	(AW_PID_2049_DOHZ_DEFAULT_VALUE << AW_PID_2049_DOHZ_START_BIT)
> +
> +/* DRVSTREN bit 5 (I2SCFG2 0x08) */
> +#define AW_PID_2049_DRVSTREN_START_BIT	(5)
> +#define AW_PID_2049_DRVSTREN_BITS_LEN	(1)
> +#define AW_PID_2049_DRVSTREN_MASK		\
> +	(~(((1<<AW_PID_2049_DRVSTREN_BITS_LEN)-1) << AW_PID_2049_DRVSTREN_START_BIT))
> +
> +#define AW_PID_2049_DRVSTREN_4MA		(0)
> +#define AW_PID_2049_DRVSTREN_4MA_VALUE	\
> +	(AW_PID_2049_DRVSTREN_4MA << AW_PID_2049_DRVSTREN_START_BIT)
> +
> +#define AW_PID_2049_DRVSTREN_12MA		(1)
> +#define AW_PID_2049_DRVSTREN_12MA_VALUE	\
> +	(AW_PID_2049_DRVSTREN_12MA << AW_PID_2049_DRVSTREN_START_BIT)
> +
> +#define AW_PID_2049_DRVSTREN_DEFAULT_VALUE	(1)
> +#define AW_PID_2049_DRVSTREN_DEFAULT	\
> +	(AW_PID_2049_DRVSTREN_DEFAULT_VALUE << AW_PID_2049_DRVSTREN_START_BIT)
> +
> +/* INPLEV bit 4 (I2SCFG2 0x08) */
> +#define AW_PID_2049_INPLEV_START_BIT	(4)
> +#define AW_PID_2049_INPLEV_BITS_LEN		(1)
> +#define AW_PID_2049_INPLEV_MASK			\
> +	(~(((1<<AW_PID_2049_INPLEV_BITS_LEN)-1) << AW_PID_2049_INPLEV_START_BIT))
> +
> +#define AW_PID_2049_INPLEV_NOT_ATTENUATED	(0)
> +#define AW_PID_2049_INPLEV_NOT_ATTENUATED_VALUE	\
> +	(AW_PID_2049_INPLEV_NOT_ATTENUATED << AW_PID_2049_INPLEV_START_BIT)
> +
> +#define AW_PID_2049_INPLEV_ATTENUATED	(1)
> +#define AW_PID_2049_INPLEV_ATTENUATED_VALUE	\
> +	(AW_PID_2049_INPLEV_ATTENUATED << AW_PID_2049_INPLEV_START_BIT)
> +
> +#define AW_PID_2049_INPLEV_DEFAULT_VALUE	(0)
> +#define AW_PID_2049_INPLEV_DEFAULT		\
> +	(AW_PID_2049_INPLEV_DEFAULT_VALUE << AW_PID_2049_INPLEV_START_BIT)
> +
> +/* CFSEL bit 2:0 (I2SCFG2 0x08) */
> +#define AW_PID_2049_CFSEL_START_BIT		(0)
> +#define AW_PID_2049_CFSEL_BITS_LEN		(3)
> +#define AW_PID_2049_CFSEL_MASK			\
> +	(~(((1<<AW_PID_2049_CFSEL_BITS_LEN)-1) << AW_PID_2049_CFSEL_START_BIT))
> +
> +#define AW_PID_2049_CFSEL_HAGC			(0)
> +#define AW_PID_2049_CFSEL_HAGC_VALUE	\
> +	(AW_PID_2049_CFSEL_HAGC << AW_PID_2049_CFSEL_START_BIT)
> +
> +#define AW_PID_2049_CFSEL_DFIFO			(1)
> +#define AW_PID_2049_CFSEL_DFIFO_VALUE	\
> +	(AW_PID_2049_CFSEL_DFIFO << AW_PID_2049_CFSEL_START_BIT)
> +
> +#define AW_PID_2049_CFSEL_ULS			(2)
> +#define AW_PID_2049_CFSEL_ULS_VALUE		\
> +	(AW_PID_2049_CFSEL_ULS << AW_PID_2049_CFSEL_START_BIT)
> +
> +#define AW_PID_2049_CFSEL_IVT_FS		(3)
> +#define AW_PID_2049_CFSEL_IVT_FS_VALUE	\
> +	(AW_PID_2049_CFSEL_IVT_FS << AW_PID_2049_CFSEL_START_BIT)
> +
> +#define AW_PID_2049_CFSEL_IVT_IPVT		(4)
> +#define AW_PID_2049_CFSEL_IVT_IPVT_VALUE	\
> +	(AW_PID_2049_CFSEL_IVT_IPVT << AW_PID_2049_CFSEL_START_BIT)
> +
> +#define AW_PID_2049_CFSEL_DEFAULT_VALUE	(0)
> +#define AW_PID_2049_CFSEL_DEFAULT		\
> +	(AW_PID_2049_CFSEL_DEFAULT_VALUE << AW_PID_2049_CFSEL_START_BIT)
> +
> +/* default value of I2SCFG2 (0x08) */
> +/* #define AW_PID_2049_I2SCFG2_DEFAULT		(0x0060) */
> +
> +/* HAGCCFG1 (0x09) detail */
> +/* RVTH bit 15:8 (HAGCCFG1 0x09) */
> +#define AW_PID_2049_RVTH_START_BIT		(8)
> +#define AW_PID_2049_RVTH_BITS_LEN		(8)
> +#define AW_PID_2049_RVTH_MASK			\
> +	(~(((1<<AW_PID_2049_RVTH_BITS_LEN)-1) << AW_PID_2049_RVTH_START_BIT))
> +
> +#define AW_PID_2049_RVTH_DEFAULT_VALUE	(0x39)
> +#define AW_PID_2049_RVTH_DEFAULT		\
> +	(AW_PID_2049_RVTH_DEFAULT_VALUE << AW_PID_2049_RVTH_START_BIT)
> +
> +/* AVTH bit 7:0 (HAGCCFG1 0x09) */
> +#define AW_PID_2049_AVTH_START_BIT		(0)
> +#define AW_PID_2049_AVTH_BITS_LEN		(8)
> +#define AW_PID_2049_AVTH_MASK			\
> +	(~(((1<<AW_PID_2049_AVTH_BITS_LEN)-1) << AW_PID_2049_AVTH_START_BIT))
> +
> +#define AW_PID_2049_AVTH_DEFAULT_VALUE	(0x40)
> +#define AW_PID_2049_AVTH_DEFAULT		\
> +	(AW_PID_2049_AVTH_DEFAULT_VALUE << AW_PID_2049_AVTH_START_BIT)
> +
> +/* default value of HAGCCFG1 (0x09) */
> +/* #define AW_PID_2049_HAGCCFG1_DEFAULT		(0x3940) */
> +
> +/* HAGCCFG2 (0x0A) detail */
> +/* ATTH bit 15:0 (HAGCCFG2 0x0A) */
> +#define AW_PID_2049_ATTH_START_BIT		(0)
> +#define AW_PID_2049_ATTH_BITS_LEN		(16)
> +#define AW_PID_2049_ATTH_MASK			\
> +	(~(((1<<AW_PID_2049_ATTH_BITS_LEN)-1) << AW_PID_2049_ATTH_START_BIT))
> +
> +#define AW_PID_2049_ATTH_RESERVED		(0)
> +#define AW_PID_2049_ATTH_RESERVED_VALUE	\
> +	(AW_PID_2049_ATTH_RESERVED << AW_PID_2049_ATTH_START_BIT)
> +
> +#define AW_PID_2049_ATTH_DEFAULT_VALUE	(0x0030)
> +#define AW_PID_2049_ATTH_DEFAULT		\
> +	(AW_PID_2049_ATTH_DEFAULT_VALUE << AW_PID_2049_ATTH_START_BIT)
> +
> +/* default value of HAGCCFG2 (0x0A) */
> +/* #define AW_PID_2049_HAGCCFG2_DEFAULT		(0x0030) */
> +
> +/* HAGCCFG3 (0x0B) detail */
> +/* RTTH bit 15:0 (HAGCCFG3 0x0B) */
> +#define AW_PID_2049_RTTH_START_BIT		(0)
> +#define AW_PID_2049_RTTH_BITS_LEN		(16)
> +#define AW_PID_2049_RTTH_MASK			\
> +	(~(((1<<AW_PID_2049_RTTH_BITS_LEN)-1) << AW_PID_2049_RTTH_START_BIT))
> +
> +#define AW_PID_2049_RTTH_RESERVED		(0)
> +#define AW_PID_2049_RTTH_RESERVED_VALUE	\
> +	(AW_PID_2049_RTTH_RESERVED << AW_PID_2049_RTTH_START_BIT)
> +
> +#define AW_PID_2049_RTTH_DEFAULT_VALUE	(0x01E0)
> +#define AW_PID_2049_RTTH_DEFAULT		\
> +	(AW_PID_2049_RTTH_DEFAULT_VALUE << AW_PID_2049_RTTH_START_BIT)
> +
> +/* default value of HAGCCFG3 (0x0B) */
> +/* #define AW_PID_2049_HAGCCFG3_DEFAULT		(0x01E0) */
> +
> +/* HAGCCFG4 (0x0C) detail */
> +/* IIC_GEN_ADDR bit 15:9 (HAGCCFG4 0x0C) */
> +#define AW_PID_2049_IIC_GEN_ADDR_START_BIT	(9)
> +#define AW_PID_2049_IIC_GEN_ADDR_BITS_LEN	(7)
> +#define AW_PID_2049_IIC_GEN_ADDR_MASK	\
> +	(~(((1<<AW_PID_2049_IIC_GEN_ADDR_BITS_LEN)-1) << AW_PID_2049_IIC_GEN_ADDR_START_BIT))
> +
> +#define AW_PID_2049_IIC_GEN_ADDR_DEFAULT_VALUE	(0x0E)
> +#define AW_PID_2049_IIC_GEN_ADDR_DEFAULT	\
> +	(AW_PID_2049_IIC_GEN_ADDR_DEFAULT_VALUE << AW_PID_2049_IIC_GEN_ADDR_START_BIT)
> +
> +/* IIC_GEN_EN bit 8 (HAGCCFG4 0x0C) */
> +#define AW_PID_2049_IIC_GEN_EN_START_BIT	(8)
> +#define AW_PID_2049_IIC_GEN_EN_BITS_LEN	(1)
> +#define AW_PID_2049_IIC_GEN_EN_MASK		\
> +	(~(((1<<AW_PID_2049_IIC_GEN_EN_BITS_LEN)-1) << AW_PID_2049_IIC_GEN_EN_START_BIT))
> +
> +#define AW_PID_2049_IIC_GEN_EN_DISABLE	(0)
> +#define AW_PID_2049_IIC_GEN_EN_DISABLE_VALUE	\
> +	(AW_PID_2049_IIC_GEN_EN_DISABLE << AW_PID_2049_IIC_GEN_EN_START_BIT)
> +
> +#define AW_PID_2049_IIC_GEN_EN_ENABLE	(1)
> +#define AW_PID_2049_IIC_GEN_EN_ENABLE_VALUE	\
> +	(AW_PID_2049_IIC_GEN_EN_ENABLE << AW_PID_2049_IIC_GEN_EN_START_BIT)
> +
> +#define AW_PID_2049_IIC_GEN_EN_DEFAULT_VALUE	(0)
> +#define AW_PID_2049_IIC_GEN_EN_DEFAULT	\
> +	(AW_PID_2049_IIC_GEN_EN_DEFAULT_VALUE << AW_PID_2049_IIC_GEN_EN_START_BIT)
> +
> +/* HOLDTH bit 7:0 (HAGCCFG4 0x0C) */
> +#define AW_PID_2049_HOLDTH_START_BIT	(0)
> +#define AW_PID_2049_HOLDTH_BITS_LEN		(8)
> +#define AW_PID_2049_HOLDTH_MASK			\
> +	(~(((1<<AW_PID_2049_HOLDTH_BITS_LEN)-1) << AW_PID_2049_HOLDTH_START_BIT))
> +
> +#define AW_PID_2049_HOLDTH_RESERVED		(0)
> +#define AW_PID_2049_HOLDTH_RESERVED_VALUE	\
> +	(AW_PID_2049_HOLDTH_RESERVED << AW_PID_2049_HOLDTH_START_BIT)
> +
> +#define AW_PID_2049_HOLDTH_DEFAULT_VALUE	(0x64)
> +#define AW_PID_2049_HOLDTH_DEFAULT		\
> +	(AW_PID_2049_HOLDTH_DEFAULT_VALUE << AW_PID_2049_HOLDTH_START_BIT)
> +
> +/* default value of HAGCCFG4 (0x0C) */
> +/* #define AW_PID_2049_HAGCCFG4_DEFAULT		(0x1C64) */
> +
> +/* AGC_DSP_CTL bit 15 (HAGCCFG7 0x0F) */
> +#define AW_PID_2049_AGC_DSP_CTL_START_BIT	(15)
> +#define AW_PID_2049_AGC_DSP_CTL_BITS_LEN	(1)
> +#define AW_PID_2049_AGC_DSP_CTL_MASK	\
> +	(~(((1<<AW_PID_2049_AGC_DSP_CTL_BITS_LEN)-1) << AW_PID_2049_AGC_DSP_CTL_START_BIT))
> +
> +#define AW_PID_2049_AGC_DSP_CTL_DISABLE	(0)
> +#define AW_PID_2049_AGC_DSP_CTL_DISABLE_VALUE	\
> +	(AW_PID_2049_AGC_DSP_CTL_DISABLE << AW_PID_2049_AGC_DSP_CTL_START_BIT)
> +
> +#define AW_PID_2049_AGC_DSP_CTL_ENABLE	(1)
> +#define AW_PID_2049_AGC_DSP_CTL_ENABLE_VALUE	\
> +	(AW_PID_2049_AGC_DSP_CTL_ENABLE << AW_PID_2049_AGC_DSP_CTL_START_BIT)
> +/* VDSEL bit 0 (I2SCFG3 0x12) */
> +#define AW_PID_2049_VDSEL_START_BIT		(0)
> +#define AW_PID_2049_VDSEL_BITS_LEN		(1)
> +#define AW_PID_2049_VDSEL_MASK			\
> +	(~(((1<<AW_PID_2049_VDSEL_BITS_LEN)-1) << AW_PID_2049_VDSEL_START_BIT))
> +
> +/* MEM_CLKSEL bit 3 (DBGCTRL 0x13) */
> +#define AW_PID_2049_MEM_CLKSEL_START_BIT	(3)
> +#define AW_PID_2049_MEM_CLKSEL_BITS_LEN	(1)
> +#define AW_PID_2049_MEM_CLKSEL_MASK		\
> +	(~(((1<<AW_PID_2049_MEM_CLKSEL_BITS_LEN)-1) << AW_PID_2049_MEM_CLKSEL_START_BIT))
> +
> +#define AW_PID_2049_MEM_CLKSEL_OSC_CLK	(0)
> +#define AW_PID_2049_MEM_CLKSEL_OSC_CLK_VALUE	\
> +	(AW_PID_2049_MEM_CLKSEL_OSC_CLK << AW_PID_2049_MEM_CLKSEL_START_BIT)
> +
> +#define AW_PID_2049_MEM_CLKSEL_DAP_HCLK	(1)
> +#define AW_PID_2049_MEM_CLKSEL_DAP_HCLK_VALUE	\
> +	(AW_PID_2049_MEM_CLKSEL_DAP_HCLK << AW_PID_2049_MEM_CLKSEL_START_BIT)
> +
> +/* HAGCST (0x20) detail */
> +/* SPK_GAIN_ST bit 10:8 (HAGCST 0x20) */
> +#define AW_PID_2049_SPK_GAIN_ST_START_BIT	(8)
> +#define AW_PID_2049_SPK_GAIN_ST_BITS_LEN	(3)
> +#define AW_PID_2049_SPK_GAIN_ST_MASK	\
> +	(~(((1<<AW_PID_2049_SPK_GAIN_ST_BITS_LEN)-1) << AW_PID_2049_SPK_GAIN_ST_START_BIT))
> +
> +#define AW_PID_2049_SPK_GAIN_ST_4_AV	(0)
> +#define AW_PID_2049_SPK_GAIN_ST_4_AV_VALUE	\
> +	(AW_PID_2049_SPK_GAIN_ST_4_AV << AW_PID_2049_SPK_GAIN_ST_START_BIT)
> +
> +#define AW_PID_2049_SPK_GAIN_ST_4P67_AV	(1)
> +#define AW_PID_2049_SPK_GAIN_ST_4P67_AV_VALUE	\
> +	(AW_PID_2049_SPK_GAIN_ST_4P67_AV << AW_PID_2049_SPK_GAIN_ST_START_BIT)
> +
> +#define AW_PID_2049_SPK_GAIN_ST_6_AV	(2)
> +#define AW_PID_2049_SPK_GAIN_ST_6_AV_VALUE	\
> +	(AW_PID_2049_SPK_GAIN_ST_6_AV << AW_PID_2049_SPK_GAIN_ST_START_BIT)
> +
> +#define AW_PID_2049_SPK_GAIN_ST_7_AV	(3)
> +#define AW_PID_2049_SPK_GAIN_ST_7_AV_VALUE	\
> +	(AW_PID_2049_SPK_GAIN_ST_7_AV << AW_PID_2049_SPK_GAIN_ST_START_BIT)
> +
> +#define AW_PID_2049_SPK_GAIN_ST_12_AV	(4)
> +#define AW_PID_2049_SPK_GAIN_ST_12_AV_VALUE	\
> +	(AW_PID_2049_SPK_GAIN_ST_12_AV << AW_PID_2049_SPK_GAIN_ST_START_BIT)
> +
> +#define AW_PID_2049_SPK_GAIN_ST_14_AV	(5)
> +#define AW_PID_2049_SPK_GAIN_ST_14_AV_VALUE	\
> +	(AW_PID_2049_SPK_GAIN_ST_14_AV << AW_PID_2049_SPK_GAIN_ST_START_BIT)
> +
> +#define AW_PID_2049_SPK_GAIN_ST_DEFAULT_VALUE	(5)
> +#define AW_PID_2049_SPK_GAIN_ST_DEFAULT	\
> +	(AW_PID_2049_SPK_GAIN_ST_DEFAULT_VALUE << AW_PID_2049_SPK_GAIN_ST_START_BIT)
> +
> +/* BSTVOUT_ST bit 5:0 (HAGCST 0x20) */
> +#define AW_PID_2049_BSTVOUT_ST_START_BIT	(0)
> +#define AW_PID_2049_BSTVOUT_ST_BITS_LEN	(6)
> +#define AW_PID_2049_BSTVOUT_ST_MASK		\
> +	(~(((1<<AW_PID_2049_BSTVOUT_ST_BITS_LEN)-1) << AW_PID_2049_BSTVOUT_ST_START_BIT))
> +
> +#define AW_PID_2049_BSTVOUT_ST_3P125V	(0)
> +#define AW_PID_2049_BSTVOUT_ST_3P125V_VALUE	\
> +	(AW_PID_2049_BSTVOUT_ST_3P125V << AW_PID_2049_BSTVOUT_ST_START_BIT)
> +
> +#define AW_PID_2049_BSTVOUT_ST_3P250V	(1)
> +#define AW_PID_2049_BSTVOUT_ST_3P250V_VALUE	\
> +	(AW_PID_2049_BSTVOUT_ST_3P250V << AW_PID_2049_BSTVOUT_ST_START_BIT)
> +
> +#define AW_PID_2049_BSTVOUT_ST_3P375V	(2)
> +#define AW_PID_2049_BSTVOUT_ST_3P375V_VALUE	\
> +	(AW_PID_2049_BSTVOUT_ST_3P375V << AW_PID_2049_BSTVOUT_ST_START_BIT)
> +
> +#define AW_PID_2049_BSTVOUT_ST_3P500V	(3)
> +#define AW_PID_2049_BSTVOUT_ST_3P500V_VALUE	\
> +	(AW_PID_2049_BSTVOUT_ST_3P500V << AW_PID_2049_BSTVOUT_ST_START_BIT)
> +
> +#define AW_PID_2049_BSTVOUT_ST_3P625V	(4)
> +#define AW_PID_2049_BSTVOUT_ST_3P625V_VALUE	\
> +	(AW_PID_2049_BSTVOUT_ST_3P625V << AW_PID_2049_BSTVOUT_ST_START_BIT)
> +
> +#define AW_PID_2049_BSTVOUT_ST_3P750V	(5)
> +#define AW_PID_2049_BSTVOUT_ST_3P750V_VALUE	\
> +	(AW_PID_2049_BSTVOUT_ST_3P750V << AW_PID_2049_BSTVOUT_ST_START_BIT)
> +
> +#define AW_PID_2049_BSTVOUT_ST_11P000V	(63)
> +#define AW_PID_2049_BSTVOUT_ST_11P000V_VALUE	\
> +	(AW_PID_2049_BSTVOUT_ST_11P000V << AW_PID_2049_BSTVOUT_ST_START_BIT)
> +
> +#define AW_PID_2049_BSTVOUT_ST_DEFAULT_VALUE	(0)
> +#define AW_PID_2049_BSTVOUT_ST_DEFAULT	\
> +	(AW_PID_2049_BSTVOUT_ST_DEFAULT_VALUE << AW_PID_2049_BSTVOUT_ST_START_BIT)
> +
> +/* default value of HAGCST (0x20) */
> +/* #define AW_PID_2049_HAGCST_DEFAULT		(0x0500) */
> +
> +/* VBAT (0x21) detail */
> +/* VBAT_DET bit 9:0 (VBAT 0x21) */
> +#define AW_PID_2049_VBAT_DET_START_BIT	(0)
> +#define AW_PID_2049_VBAT_DET_BITS_LEN	(10)
> +#define AW_PID_2049_VBAT_DET_MASK		\
> +	(~(((1<<AW_PID_2049_VBAT_DET_BITS_LEN)-1) << AW_PID_2049_VBAT_DET_START_BIT))
> +
> +#define AW_PID_2049_VBAT_DET_DEFAULT_VALUE	(0x263)
> +#define AW_PID_2049_VBAT_DET_DEFAULT	\
> +	(AW_PID_2049_VBAT_DET_DEFAULT_VALUE << AW_PID_2049_VBAT_DET_START_BIT)
> +
> +#define AW_PID_2049_VBAT_RANGE	(6025)
> +#define AW_PID_2049_INT_10BIT	(1023)
> +/* default value of VBAT (0x21) */
> +/* #define AW_PID_2049_VBAT_DEFAULT		(0x0263) */
> +
> +/* TEMP (0x22) detail */
> +/* TEMP_DET bit 9:0 (TEMP 0x22) */
> +#define AW_PID_2049_TEMP_DET_START_BIT	(0)
> +#define AW_PID_2049_TEMP_DET_BITS_LEN	(10)
> +#define AW_PID_2049_TEMP_DET_MASK		\
> +	(~(((1<<AW_PID_2049_TEMP_DET_BITS_LEN)-1) << AW_PID_2049_TEMP_DET_START_BIT))
> +
> +#define AW_PID_2049_TEMP_DET_MINUS_40	(0x3D8)
> +#define AW_PID_2049_TEMP_DET_MINUS_40_VALUE	\
> +	(AW_PID_2049_TEMP_DET_MINUS_40 << AW_PID_2049_TEMP_DET_START_BIT)
> +
> +#define AW_PID_2049_TEMP_DET_0			(0x00)
> +#define AW_PID_2049_TEMP_DET_0_VALUE	\
> +	(AW_PID_2049_TEMP_DET_0 << AW_PID_2049_TEMP_DET_START_BIT)
> +
> +#define AW_PID_2049_TEMP_DET_1			(0x01)
> +#define AW_PID_2049_TEMP_DET_1_VALUE	\
> +	(AW_PID_2049_TEMP_DET_1 << AW_PID_2049_TEMP_DET_START_BIT)
> +
> +#define AW_PID_2049_TEMP_DET_25			(0x19)
> +#define AW_PID_2049_TEMP_DET_25_VALUE	\
> +	(AW_PID_2049_TEMP_DET_25 << AW_PID_2049_TEMP_DET_START_BIT)
> +
> +#define AW_PID_2049_TEMP_DET_55			(0x37)
> +#define AW_PID_2049_TEMP_DET_55_VALUE	\
> +	(AW_PID_2049_TEMP_DET_55 << AW_PID_2049_TEMP_DET_START_BIT)
> +
> +#define AW_PID_2049_TEMP_DET_DEFAULT_VALUE	(0x019)
> +#define AW_PID_2049_TEMP_DET_DEFAULT	\
> +	(AW_PID_2049_TEMP_DET_DEFAULT_VALUE << AW_PID_2049_TEMP_DET_START_BIT)
> +#define AW_PID_2049_TEMP_SIGN_MASK	(~(1 << 9))
> +#define AW_PID_2049_TEMP_NEG_MASK	(0XFC00)
> +
> +/* default value of TEMP (0x22) */
> +/* #define AW_PID_2049_TEMP_DEFAULT		(0x0019) */
> +
> +/* PVDD (0x23) detail */
> +/* PVDD_DET bit 9:0 (PVDD 0x23) */
> +#define AW_PID_2049_PVDD_DET_START_BIT	(0)
> +#define AW_PID_2049_PVDD_DET_BITS_LEN	(10)
> +#define AW_PID_2049_PVDD_DET_MASK		\
> +	(~(((1<<AW_PID_2049_PVDD_DET_BITS_LEN)-1) << AW_PID_2049_PVDD_DET_START_BIT))
> +
> +#define AW_PID_2049_PVDD_DET_DEFAULT_VALUE	(0x263)
> +#define AW_PID_2049_PVDD_DET_DEFAULT	\
> +	(AW_PID_2049_PVDD_DET_DEFAULT_VALUE << AW_PID_2049_PVDD_DET_START_BIT)
> +
> +/* default value of PVDD (0x23) */
> +/* #define AW_PID_2049_PVDD_DEFAULT		(0x0263) */
> +
> +/* BSTCTRL1 (0x60) detail */
> +/* BST_RTH bit 13:8 (BSTCTRL1 0x60) */
> +#define AW_PID_2049_BST_RTH_START_BIT	(8)
> +#define AW_PID_2049_BST_RTH_BITS_LEN	(6)
> +#define AW_PID_2049_BST_RTH_MASK		\
> +	(~(((1<<AW_PID_2049_BST_RTH_BITS_LEN)-1) << AW_PID_2049_BST_RTH_START_BIT))
> +
> +#define AW_PID_2049_BST_RTH_DEFAULT_VALUE	(4)
> +#define AW_PID_2049_BST_RTH_DEFAULT		\
> +	(AW_PID_2049_BST_RTH_DEFAULT_VALUE << AW_PID_2049_BST_RTH_START_BIT)
> +
> +/* BST_ATH bit 5:0 (BSTCTRL1 0x60) */
> +#define AW_PID_2049_BST_ATH_START_BIT	(0)
> +#define AW_PID_2049_BST_ATH_BITS_LEN	(6)
> +#define AW_PID_2049_BST_ATH_MASK		\
> +	(~(((1<<AW_PID_2049_BST_ATH_BITS_LEN)-1) << AW_PID_2049_BST_ATH_START_BIT))
> +
> +#define AW_PID_2049_BST_ATH_DEFAULT_VALUE	(2)
> +#define AW_PID_2049_BST_ATH_DEFAULT		\
> +	(AW_PID_2049_BST_ATH_DEFAULT_VALUE << AW_PID_2049_BST_ATH_START_BIT)
> +
> +/* default value of BSTCTRL1 (0x60) */
> +/* #define AW_PID_2049_BSTCTRL1_DEFAULT		(0x0402) */
> +
> +/* BSTCTRL2 (0x61) detail */
> +/* BST_MODE bit 14:12 (BSTCTRL2 0x61) */
> +#define AW_PID_2049_BST_MODE_START_BIT	(12)
> +#define AW_PID_2049_BST_MODE_BITS_LEN	(3)
> +#define AW_PID_2049_BST_MODE_MASK		\
> +	(~(((1<<AW_PID_2049_BST_MODE_BITS_LEN)-1) << AW_PID_2049_BST_MODE_START_BIT))
> +
> +#define AW_PID_2049_BST_MODE_TRANSPARENT	(0)
> +#define AW_PID_2049_BST_MODE_TRANSPARENT_VALUE	\
> +	(AW_PID_2049_BST_MODE_TRANSPARENT << AW_PID_2049_BST_MODE_START_BIT)
> +
> +#define AW_PID_2049_BST_MODE_FORCE_BOOST	(1)
> +#define AW_PID_2049_BST_MODE_FORCE_BOOST_VALUE	\
> +	(AW_PID_2049_BST_MODE_FORCE_BOOST << AW_PID_2049_BST_MODE_START_BIT)
> +
> +#define AW_PID_2049_BST_MODE_SMART_BOOST1	(5)
> +#define AW_PID_2049_BST_MODE_SMART_BOOST1_VALUE	\
> +	(AW_PID_2049_BST_MODE_SMART_BOOST1 << AW_PID_2049_BST_MODE_START_BIT)
> +
> +#define AW_PID_2049_BST_MODE_SMART_BOOST2	(6)
> +#define AW_PID_2049_BST_MODE_SMART_BOOST2_VALUE	\
> +	(AW_PID_2049_BST_MODE_SMART_BOOST2 << AW_PID_2049_BST_MODE_START_BIT)
> +
> +#define AW_PID_2049_BST_MODE_DEFAULT_VALUE	(0x6)
> +#define AW_PID_2049_BST_MODE_DEFAULT	\
> +	(AW_PID_2049_BST_MODE_DEFAULT_VALUE << AW_PID_2049_BST_MODE_START_BIT)
> +
> +/* WDT_CNT bit 7:0 (WDT 0x42) */
> +#define AW_PID_2049_WDT_CNT_START_BIT	(0)
> +#define AW_PID_2049_WDT_CNT_BITS_LEN	(8)
> +#define AW_PID_2049_WDT_CNT_MASK		\
> +	(~(((1<<AW_PID_2049_WDT_CNT_BITS_LEN)-1) << AW_PID_2049_WDT_CNT_START_BIT))
> +
> +/* BST_TDEG bit 11:8 (BSTCTRL2 0x61) */
> +#define AW_PID_2049_BST_TDEG_START_BIT	(8)
> +#define AW_PID_2049_BST_TDEG_BITS_LEN	(4)
> +#define AW_PID_2049_BST_TDEG_MASK		\
> +	(~(((1<<AW_PID_2049_BST_TDEG_BITS_LEN)-1) << AW_PID_2049_BST_TDEG_START_BIT))
> +
> +#define AW_PID_2049_BST_TDEG_0P50_MS	(0)
> +#define AW_PID_2049_BST_TDEG_0P50_MS_VALUE	\
> +	(AW_PID_2049_BST_TDEG_0P50_MS << AW_PID_2049_BST_TDEG_START_BIT)
> +
> +#define AW_PID_2049_BST_TDEG_1P00_MS	(1)
> +#define AW_PID_2049_BST_TDEG_1P00_MS_VALUE	\
> +	(AW_PID_2049_BST_TDEG_1P00_MS << AW_PID_2049_BST_TDEG_START_BIT)
> +
> +#define AW_PID_2049_BST_TDEG_2P00_MS	(2)
> +#define AW_PID_2049_BST_TDEG_2P00_MS_VALUE	\
> +	(AW_PID_2049_BST_TDEG_2P00_MS << AW_PID_2049_BST_TDEG_START_BIT)
> +
> +#define AW_PID_2049_BST_TDEG_4P00_MS	(3)
> +#define AW_PID_2049_BST_TDEG_4P00_MS_VALUE	\
> +	(AW_PID_2049_BST_TDEG_4P00_MS << AW_PID_2049_BST_TDEG_START_BIT)
> +
> +#define AW_PID_2049_BST_TDEG_8P00_MS	(4)
> +#define AW_PID_2049_BST_TDEG_8P00_MS_VALUE	\
> +	(AW_PID_2049_BST_TDEG_8P00_MS << AW_PID_2049_BST_TDEG_START_BIT)
> +
> +#define AW_PID_2049_BST_TDEG_10P7_MS	(5)
> +#define AW_PID_2049_BST_TDEG_10P7_MS_VALUE	\
> +	(AW_PID_2049_BST_TDEG_10P7_MS << AW_PID_2049_BST_TDEG_START_BIT)
> +
> +/* ReAbs bit 3 (ASR1 0x45) */
> +#define AW_PID_2049_ReAbs_START_BIT		(3)
> +#define AW_PID_2049_ReAbs_BITS_LEN		(1)
> +#define AW_PID_2049_ReAbs_MASK			\
> +	(~(((1<<AW_PID_2049_ReAbs_BITS_LEN)-1) << AW_PID_2049_ReAbs_START_BIT))
> +
> +#define AW_PID_2049_BST_TDEG_13P3_MS	(6)
> +#define AW_PID_2049_BST_TDEG_13P3_MS_VALUE	\
> +	(AW_PID_2049_BST_TDEG_13P3_MS << AW_PID_2049_BST_TDEG_START_BIT)
> +
> +/* DSP_VOL bit 15:8 (DSPCFG 0x47) */
> +#define AW_PID_2049_DSP_VOL_START_BIT	(8)
> +#define AW_PID_2049_DSP_VOL_BITS_LEN	(8)
> +#define AW_PID_2049_DSP_VOL_MASK		\
> +	(~(((1<<AW_PID_2049_DSP_VOL_BITS_LEN)-1) << AW_PID_2049_DSP_VOL_START_BIT))
> +
> +#define AW_PID_2049_DSP_VOL_MUTE			(0XFF00)
> +#define AW_PID_2049_DSP_VOL_NOISE_ST		(0X1800)
> +
> +#define AW_PID_2049_BST_TDEG_16P0_MS	(7)
> +#define AW_PID_2049_BST_TDEG_16P0_MS_VALUE	\
> +	(AW_PID_2049_BST_TDEG_16P0_MS << AW_PID_2049_BST_TDEG_START_BIT)
> +
> +#define AW_PID_2049_BST_TDEG_18P6_MS	(8)
> +#define AW_PID_2049_BST_TDEG_18P6_MS_VALUE	\
> +	(AW_PID_2049_BST_TDEG_18P6_MS << AW_PID_2049_BST_TDEG_START_BIT)
> +
> +#define AW_PID_2049_BST_TDEG_21P3_MS	(9)
> +#define AW_PID_2049_BST_TDEG_21P3_MS_VALUE	\
> +	(AW_PID_2049_BST_TDEG_21P3_MS << AW_PID_2049_BST_TDEG_START_BIT)
> +
> +#define AW_PID_2049_BST_TDEG_24P0_MS	(10)
> +#define AW_PID_2049_BST_TDEG_24P0_MS_VALUE	\
> +	(AW_PID_2049_BST_TDEG_24P0_MS << AW_PID_2049_BST_TDEG_START_BIT)
> +
> +#define AW_PID_2049_BST_TDEG_32P0_MS	(11)
> +#define AW_PID_2049_BST_TDEG_32P0_MS_VALUE	\
> +	(AW_PID_2049_BST_TDEG_32P0_MS << AW_PID_2049_BST_TDEG_START_BIT)
> +
> +#define AW_PID_2049_BST_TDEG_64P0_MS	(12)
> +#define AW_PID_2049_BST_TDEG_64P0_MS_VALUE	\
> +	(AW_PID_2049_BST_TDEG_64P0_MS << AW_PID_2049_BST_TDEG_START_BIT)
> +
> +#define AW_PID_2049_BST_TDEG_128_MS		(13)
> +#define AW_PID_2049_BST_TDEG_128_MS_VALUE	\
> +	(AW_PID_2049_BST_TDEG_128_MS << AW_PID_2049_BST_TDEG_START_BIT)
> +
> +#define AW_PID_2049_BST_TDEG_256_MS		(14)
> +#define AW_PID_2049_BST_TDEG_256_MS_VALUE	\
> +	(AW_PID_2049_BST_TDEG_256_MS << AW_PID_2049_BST_TDEG_START_BIT)
> +
> +#define AW_PID_2049_BST_TDEG_1200_MS	(15)
> +#define AW_PID_2049_BST_TDEG_1200_MS_VALUE	\
> +	(AW_PID_2049_BST_TDEG_1200_MS << AW_PID_2049_BST_TDEG_START_BIT)
> +
> +#define AW_PID_2049_BST_TDEG_DEFAULT_VALUE	(11)
> +#define AW_PID_2049_BST_TDEG_DEFAULT	\
> +	(AW_PID_2049_BST_TDEG_DEFAULT_VALUE << AW_PID_2049_BST_TDEG_START_BIT)
> +
> +/* VOUT_VREFSET bit 5:0 (BSTCTRL2 0x61) */
> +/* CCO_MUX bit 14 (PLLCTRL1 0x52) */
> +#define AW_PID_2049_CCO_MUX_START_BIT	(14)
> +#define AW_PID_2049_CCO_MUX_BITS_LEN	(1)
> +#define AW_PID_2049_CCO_MUX_MASK		\
> +	(~(((1<<AW_PID_2049_CCO_MUX_BITS_LEN)-1) << AW_PID_2049_CCO_MUX_START_BIT))
> +
> +#define AW_PID_2049_CCO_MUX_DIVIDED		(0)
> +#define AW_PID_2049_CCO_MUX_DIVIDED_VALUE	\
> +	(AW_PID_2049_CCO_MUX_DIVIDED << AW_PID_2049_CCO_MUX_START_BIT)
> +
> +#define AW_PID_2049_CCO_MUX_BYPASS		(1)
> +#define AW_PID_2049_CCO_MUX_BYPASS_VALUE	\
> +	(AW_PID_2049_CCO_MUX_BYPASS << AW_PID_2049_CCO_MUX_START_BIT)
> +
> +#define AW_PID_2049_VOUT_VREFSET_START_BIT	(0)
> +#define AW_PID_2049_VOUT_VREFSET_BITS_LEN	(6)
> +#define AW_PID_2049_VOUT_VREFSET_MASK	\
> +	(~(((1<<AW_PID_2049_VOUT_VREFSET_BITS_LEN)-1) << AW_PID_2049_VOUT_VREFSET_START_BIT))
> +
> +#define AW_PID_2049_VOUT_VREFSET_3P125V	(0)
> +#define AW_PID_2049_VOUT_VREFSET_3P125V_VALUE	\
> +	(AW_PID_2049_VOUT_VREFSET_3P125V << AW_PID_2049_VOUT_VREFSET_START_BIT)
> +
> +#define AW_PID_2049_VOUT_VREFSET_3P250V	(1)
> +#define AW_PID_2049_VOUT_VREFSET_3P250V_VALUE	\
> +	(AW_PID_2049_VOUT_VREFSET_3P250V << AW_PID_2049_VOUT_VREFSET_START_BIT)
> +
> +#define AW_PID_2049_VOUT_VREFSET_3P375V	(2)
> +#define AW_PID_2049_VOUT_VREFSET_3P375V_VALUE	\
> +	(AW_PID_2049_VOUT_VREFSET_3P375V << AW_PID_2049_VOUT_VREFSET_START_BIT)
> +
> +#define AW_PID_2049_VOUT_VREFSET_3P500V	(3)
> +#define AW_PID_2049_VOUT_VREFSET_3P500V_VALUE	\
> +	(AW_PID_2049_VOUT_VREFSET_3P500V << AW_PID_2049_VOUT_VREFSET_START_BIT)
> +
> +#define AW_PID_2049_VOUT_VREFSET_3P625V	(4)
> +#define AW_PID_2049_VOUT_VREFSET_3P625V_VALUE	\
> +	(AW_PID_2049_VOUT_VREFSET_3P625V << AW_PID_2049_VOUT_VREFSET_START_BIT)
> +
> +#define AW_PID_2049_VOUT_VREFSET_3P750V	(5)
> +#define AW_PID_2049_VOUT_VREFSET_3P750V_VALUE	\
> +	(AW_PID_2049_VOUT_VREFSET_3P750V << AW_PID_2049_VOUT_VREFSET_START_BIT)
> +
> +#define AW_PID_2049_VOUT_VREFSET_11P000V	(63)
> +#define AW_PID_2049_VOUT_VREFSET_11P000V_VALUE	\
> +	(AW_PID_2049_VOUT_VREFSET_11P000V << AW_PID_2049_VOUT_VREFSET_START_BIT)
> +
> +#define AW_PID_2049_VOUT_VREFSET_DEFAULT_VALUE	(0x33)
> +#define AW_PID_2049_VOUT_VREFSET_DEFAULT	\
> +	(AW_PID_2049_VOUT_VREFSET_DEFAULT_VALUE << AW_PID_2049_VOUT_VREFSET_START_BIT)
> +
> +/* default value of BSTCTRL2 (0x61) */
> +/* #define AW_PID_2049_BSTCTRL2_DEFAULT		(0x6B33) */
> +
> +/* detail information of registers end */
> +
> +/* EF_VSN_GESLP bit 9:0 (EFRH 0x78) */
> +#define AW_PID_2049_EF_VSN_GESLP_START_BIT	(0)
> +#define AW_PID_2049_EF_VSN_GESLP_BITS_LEN	(10)
> +#define AW_PID_2049_EF_VSN_GESLP_MASK	\
> +	(~(((1<<AW_PID_2049_EF_VSN_GESLP_BITS_LEN)-1) << AW_PID_2049_EF_VSN_GESLP_START_BIT))
> +
> +#define AW_PID_2049_EF_VSN_GESLP_SIGN_MASK		(~(1 << 9))
> +#define AW_PID_2049_EF_VSN_GESLP_SIGN_NEG		(0xfe00)
> +/* EF_ISN_GESLP bit 9:0 (EFRM2 0x79) */
> +#define AW_PID_2049_EF_ISN_GESLP_START_BIT	(0)
> +#define AW_PID_2049_EF_ISN_GESLP_BITS_LEN	(10)
> +#define AW_PID_2049_EF_ISN_GESLP_MASK	\
> +	(~(((1<<AW_PID_2049_EF_ISN_GESLP_BITS_LEN)-1) << AW_PID_2049_EF_ISN_GESLP_START_BIT))
> +
> +#define AW_PID_2049_EF_ISN_GESLP_SIGN_MASK		(~(1 << 9))
> +#define AW_PID_2049_EF_ISN_GESLP_SIGN_NEG		(0xfe00)
> +/*
> + * Vcalb
> + */
> +
> +#define AW_PID_2049_CABL_BASE_VALUE			(1000)
> +#define AW_PID_2049_ICABLK_FACTOR			(1)
> +#define AW_PID_2049_VCABLK_FACTOR			(1)
> +#define AW_PID_2049_VCAL_FACTOR				(1 << 12)
> +#define AW_PID_2049_VSCAL_FACTOR			(16500)
> +#define AW_PID_2049_ISCAL_FACTOR			(3667)
> +#define AW_PID_2049_EF_VSENSE_GAIN_SHIFT		(0)
> +
> +#define AW_PID_2049_VCABLK_FACTOR_DAC			(2)
> +#define AW_PID_2049_VSCAL_FACTOR_DAC			(11790)
> +#define AW_PID_2049_EF_DAC_GESLP_SHIFT			(10)
> +#define AW_PID_2049_EF_DAC_GESLP_SIGN_MASK		(1 << 5)
> +#define AW_PID_2049_EF_DAC_GESLP_SIGN_NEG		(0xffc0)
> +
> +#define AW_PID_2049_VCALB_ADJ_FACTOR			(12)
> +
> +/*
> + * AW883XX DSP
> + */
> +#define AW_PID_2049_DSP_CFG_ADDR			(0x9C80)
> +#define AW_PID_2049_DSP_FW_ADDR				(0x8C00)
> +
> +#define AW_PID_2049_DSP_REG_RESULT_F0			(0x9C58)
> +#define AW_PID_2049_DSP_F0_SHIFT			(1)
> +
> +#define AW_PID_2049_DSP_REG_CALRE			(0x9C5A)
> +#define AW_PID_2049_DSP_REG_CALRE_SHIFT			(10)
> +#define AW_PID_2049_DSP_REG_RESULT_Q			(0x9C5C)
> +#define AW_PID_2049_DSP_Q_SHIFT				(11)
> +
> +#define AW_PID_2049_DSP_REG_VMAX			(0x9C94)
> +
> +
> +#define AW_PID_2049_DSP_REG_CFG_MBMEC_GLBCFG		(0x9CE2)
> +/* bit 0 */
> +#define AW_PID_2049_DSP_MONITOR_MASK			(~(1 << 0))
> +#define AW_PID_2049_DSP_MONITOR_ENABLE			(1 << 0)
> +#define AW_PID_2049_DSP_MONITOR_DISABLE			(0 << 0)
> +/*bit 4*/
> +#define AW_PID_2049_DSP_REG_NOISE_MASK			(~(1 << 4))
> +
> +#define AW_PID_2049_DSP_TEMP_PEAK_MASK			(~(1 << 4))
> +#define AW_PID_2049_DSP_TEMP_SEL_FLAG			(~(1 << 14))
> +
> +#define AW_PID_2049_DSP_REG_CFG_MBMEC_ACTAMPTH		(0x9CE4)/*32bit*/
> +#define AW_PID_2049_DSP_REG_CFG_MBMEC_NOISEAMPTH	(0x9CE6)/*32bit*/
> +#define AW_PID_2049_DSP_REG_VCALB			(0x9CF7)
> +
> +#define AW_PID_2049_DSP_REG_CFG_ADPZ_RE			(0x9D00)/*32bit*/
> +#define AW_PID_2049_DSP_RE_SHIFT			(12)
> +
> +#define AW_PID_2049_DSP_REG_CFG_ADPZ_RA			(0x9D02)/*32bit*/
> +
> +#define AW_PID_2049_DSP_REG_CFG_ADPZ_USTEPN		(0x9D08)
> +
> +
> +#define AW_PID_2049_DSP_REG_CRC_ADDR			(0x9F42)/*32bit*/
> +#define AW_PID_2049_DSP_REG_CFGF0_FS			(0x9F44)/*32bit*/
> +#define AW_PID_2049_DSP_REG_CFG_RE_ALPHA		(0x9F47)
> +#define AW_PID_2049_DSP_REG_TEMP_ADDR			(0x9C5D)
> +#define AW_PID_2049_DSP_REG_TEMP_SWITCH			(0x9D71)/*16bit*/
> +#define AW_PID_2049_DSP_CALI_F0_DELAY			(0x9CFD)
> +#define AW_PID_2049_DSP_CFG_ADPZ_T0			(0x9D11)/*16bit*/
> +#define AW_PID_2049_DSP_CFG_ADPZ_COILALPHA		(0x9D0F)/*16bit*/
> +#define AW_PID_2049_DSP_ST_S1				(0x8180)
> +#define AW_PID_2049_DSP_ST_E1				(0x83FD)
> +#define AW_PID_2049_DSP_ST_S2				(0x9C00)
> +#define AW_PID_2049_DSP_ST_E2				(0x9C5D)
> +
> +#endif  /* #ifndef  __AW_PID_2049_REG_H__ */
> diff --git a/sound/soc/codecs/aw883xx/aw883xx_spin.c b/sound/soc/codecs/aw883xx/aw883xx_spin.c
> new file mode 100644
> index 0000000..de5f6c3
> --- /dev/null
> +++ b/sound/soc/codecs/aw883xx/aw883xx_spin.c
> @@ -0,0 +1,807 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * aw_spin.c   aw883xx spin module
> + *
> + * Copyright (c) 2020 AWINIC Technology CO., LTD
> + *
> + * Author: Bruce zhao <zhaolei@awinic.com>
> + */
> +
> +#include <linux/module.h>
> +#include <linux/i2c.h>
> +#include <sound/soc.h>
> +#include <linux/of_gpio.h>
> +#include <linux/delay.h>
> +#include <linux/device.h>
> +#include <linux/version.h>
> +#include <linux/syscalls.h>
> +#include <sound/control.h>
> +#include <linux/uaccess.h>
> +#include <linux/debugfs.h>
> +#include <linux/slab.h>
> +#include <linux/fs.h>
> +#include <linux/kernel.h>
> +#include <linux/of.h>
> +#include "aw883xx_spin.h"
> +#include "aw883xx_device.h"
> +#include "aw883xx.h"
> +#include "aw883xx_log.h"
> +
> +static DEFINE_MUTEX(g_aw_spin_lock);
> +static DEFINE_MUTEX(g_aw_dsp_lock);
> +
> +static int g_rx_topo_id = AW_RX_TOPO_ID;
> +static int g_rx_port_id = AW_RX_PORT_ID;
> +
> +static unsigned int g_spin_angle = AW_SPIN_0;
> +static unsigned int g_spin_mode = AW_SPIN_OFF_MODE;
> +
> +static const char *const aw_spin[] = {"spin_0", "spin_90",
> +					"spin_180", "spin_270"};
> +
> +#ifdef AW_MTK_PLATFORM_SPIN
> +extern int mtk_spk_send_ipi_buf_to_dsp(void *data_buffer, uint32_t data_size);
> +extern int mtk_spk_recv_ipi_buf_from_dsp(int8_t *buffer, int16_t size, uint32_t *buf_len);
> +#elif defined AW_QCOM_PLATFORM_SPIN
> +extern int afe_get_topology(int port_id);
> +extern int aw_send_afe_cal_apr(uint32_t param_id,
> +	void *buf, int cmd_size, bool write);
> +#else
> +static int aw_send_afe_cal_apr(uint32_t param_id,
> +		void *buf, int cmd_size, bool write)
> +{
> +	return 0;
> +}
> +
> +static int afe_get_topology(int port_id)
> +{
> +	return 0;
> +}
> +#endif
> +
> +#ifdef AW_QCOM_PLATFORM_SPIN
> +extern void aw_set_port_id(int tx_port_id, int rx_port_id);
> +#else
> +static void aw_set_port_id(int tx_port_id, int rx_port_id)
> +{
> +
> +}
> +#endif
> +
> +static int aw_get_msg_id(int dev_ch, uint32_t *msg_id)
> +{
> +	switch (dev_ch) {
> +	case AW_DEV_CH_PRI_L:
> +		*msg_id = AFE_MSG_ID_MSG_0;
> +		break;
> +	case AW_DEV_CH_PRI_R:
> +		*msg_id = AFE_MSG_ID_MSG_0;
> +		break;
> +	case AW_DEV_CH_SEC_L:
> +		*msg_id = AFE_MSG_ID_MSG_1;
> +		break;
> +	case AW_DEV_CH_SEC_R:
> +		*msg_id = AFE_MSG_ID_MSG_1;
> +		break;
> +	default:
> +		pr_err("%s: can not find msg num, channel %d ", __func__, dev_ch);
> +		return -EINVAL;
> +	}
> +
> +	pr_debug("%s: msg id[%d] ", __func__, *msg_id);
> +	return 0;
> +}
> +
> +#ifdef AW_MTK_PLATFORM_SPIN
> +static int aw_mtk_write_data_to_dsp(int msg_id, void *data, int size)
> +{
> +	int32_t *dsp_data = NULL;
> +	struct aw_msg_hdr *hdr = NULL;
> +	int ret;
> +
> +	dsp_data = kzalloc(sizeof(struct aw_msg_hdr) + size, GFP_KERNEL);
> +	if (!dsp_data)
> +		return -ENOMEM;
> +
> +	hdr = (struct aw_msg_hdr *)dsp_data;
> +	hdr->type = AW_DSP_MSG_TYPE_DATA;
> +	hdr->opcode_id = msg_id;
> +	hdr->version = AW_DSP_MSG_HDR_VER;
> +
> +	memcpy(((char *)dsp_data) + sizeof(struct aw_msg_hdr), data, size);
> +
> +	ret = mtk_spk_send_ipi_buf_to_dsp(dsp_data,
> +				sizeof(struct aw_msg_hdr) + size);
> +	if (ret < 0) {
> +		pr_err("%s: write data failed\n", __func__);
> +		kfree(dsp_data);
> +		dsp_data = NULL;
> +		return ret;
> +	}
> +
> +	kfree(dsp_data);
> +	dsp_data = NULL;
> +	return 0;
> +}
> +
> +static int aw_mtk_set_spin_angle(struct aw_device *aw_dev, uint32_t spin_angle)
> +{
> +	int ret;
> +
> +	ret = aw_mtk_write_data_to_dsp(AW_MSG_ID_SPIN, &spin_angle, sizeof(uint32_t));
> +	if (ret)
> +		aw_dev_err(aw_dev->dev, "write data to dsp failed");
> +
> +	return ret;
> +}
> +
> +static int aw_mtk_get_spin_angle(void *spin_angle, int size)
> +{
> +	int ret;
> +	struct aw_msg_hdr hdr;
> +
> +	hdr.type = AW_DSP_MSG_TYPE_CMD;
> +	hdr.opcode_id = AW_MSG_ID_SPIN;
> +	hdr.version = AW_DSP_MSG_HDR_VER;
> +
> +	mutex_lock(&g_aw_dsp_lock);
> +	ret = mtk_spk_send_ipi_buf_to_dsp(&hdr, sizeof(struct aw_msg_hdr));
> +	if (ret < 0) {
> +		pr_err("%s:send cmd failed\n", __func__);
> +		mutex_unlock(&g_aw_dsp_lock);
> +		return ret;
> +	}
> +
> +	ret = mtk_spk_recv_ipi_buf_from_dsp(spin_angle, size, &size);
> +	if (ret < 0) {
> +		pr_err("%s:get data failed\n", __func__);
> +		mutex_unlock(&g_aw_dsp_lock);
> +		return ret;
> +	}
> +	mutex_unlock(&g_aw_dsp_lock);
> +
> +	return 0;
> +}
> +
> +static int aw_mtk_set_mixer_en(struct aw_device *aw_dev, uint32_t msg_id, int32_t is_enable)
> +{
> +	int32_t *dsp_msg = NULL;
> +	struct aw_msg_hdr *hdr = NULL;
> +	int ret;
> +
> +	dsp_msg = kzalloc(sizeof(struct aw_msg_hdr) + sizeof(int32_t), GFP_KERNEL);
> +	if (!dsp_msg)
> +		return -ENOMEM;
> +	hdr = (struct aw_msg_hdr *)dsp_msg;
> +	hdr->type = AW_DSP_MSG_TYPE_DATA;
> +	hdr->opcode_id = AW_INLINE_ID_AUDIO_MIX;
> +	hdr->version = AW_DSP_MSG_HDR_VER;
> +
> +	memcpy(((char *)dsp_msg) + sizeof(struct aw_msg_hdr),
> +				(char *)&is_enable, sizeof(int32_t));
> +
> +	ret = aw_mtk_write_data_to_dsp(msg_id, (void *)dsp_msg,
> +				sizeof(struct aw_msg_hdr) + sizeof(int32_t));
> +	if (ret < 0) {
> +		aw_dev_err(aw_dev->dev, " write data failed");
> +		kfree(dsp_msg);
> +		dsp_msg = NULL;
> +		return ret;
> +	}
> +
> +	kfree(dsp_msg);
> +	dsp_msg = NULL;
> +	return 0;
> +}
> +#else
> +static int aw_check_dsp_ready(void)
> +{
> +	int ret;
> +
> +	ret = afe_get_topology(g_rx_port_id);

What is this related to, and why is this Qualcomm-specific.

I stopped here.

> +
> +	aw_pr_dbg("rx topo_id 0x%x ", ret);
> +
> +	if (ret != g_rx_topo_id)
> +		aw_pr_err("get rx_topo_id 0x%x ", ret);
> +
> +	return 0;
> +}
> +
> +static int aw_qcom_write_data_to_dsp(uint32_t msg_id, void *data, int size)
> +{
> +	int ret;
> +
> +	mutex_lock(&g_aw_dsp_lock);
> +
> +	aw_check_dsp_ready();
> +	ret = aw_send_afe_cal_apr(msg_id, data, size, true);
> +
> +	mutex_unlock(&g_aw_dsp_lock);
> +
> +	return ret;
> +}
> +
> +static int aw_qcom_read_data_from_dsp(uint32_t msg_id, void *data, int size)
> +{
> +	int ret;
> +
> +	mutex_lock(&g_aw_dsp_lock);
> +
> +	aw_check_dsp_ready();
> +	ret = aw_send_afe_cal_apr(msg_id, data, size, false);
> +
> +	mutex_unlock(&g_aw_dsp_lock);
> +
> +	return ret;
> +}
> +
> +static int aw_qcom_set_spin_angle(struct aw_device *aw_dev,
> +					uint32_t spin_angle)
> +{
> +	int ret;
> +
> +	ret = aw_qcom_write_data_to_dsp(AW_MSG_ID_SPIN, &spin_angle, sizeof(uint32_t));
> +	if (ret)
> +		aw_dev_err(aw_dev->dev, "write spin angle to dsp failed");
> +	else
> +		aw_dev_info(aw_dev->dev, "write spin angle to dsp successful");
> +
> +	return ret;
> +}
> +
> +static int aw_qcom_get_spin_angle(uint32_t *spin_angle, int size)
> +{
> +	int ret;
> +
> +	ret = aw_qcom_read_data_from_dsp(AW_MSG_ID_SPIN, spin_angle, size);
> +	if (ret)
> +		pr_err("%s: get spin angle failed\n", __func__);
> +	else
> +		pr_info("%s: get spin angle successful\n", __func__);
> +
> +	return ret;
> +}
> +
> +static int aw_qcom_set_mixer_en(struct aw_device *aw_dev,
> +						uint32_t msg_id, int32_t is_enable)
> +{
> +	int32_t *dsp_msg;
> +	int ret = 0;
> +	int msg_len = (int)(sizeof(struct aw_msg_hdr) + sizeof(int32_t));
> +
> +	dsp_msg = kzalloc(msg_len, GFP_KERNEL);
> +	if (!dsp_msg)
> +		return -ENOMEM;
> +
> +	dsp_msg[0] = AW_DSP_MSG_TYPE_DATA;
> +	dsp_msg[1] = AW_INLINE_ID_AUDIO_MIX;
> +	dsp_msg[2] = AW_DSP_MSG_HDR_VER;
> +
> +	memcpy(dsp_msg + (sizeof(struct aw_msg_hdr) / sizeof(int32_t)),
> +		(char *)&is_enable, sizeof(int32_t));
> +
> +	ret = aw_qcom_write_data_to_dsp(msg_id, (void *)dsp_msg, msg_len);
> +	if (ret < 0) {
> +		aw_dev_err(aw_dev->dev, "write data to dsp failed");
> +		kfree(dsp_msg);
> +		return ret;
> +	}
> +
> +	aw_dev_dbg(aw_dev->dev, "write data[%d] to dsp success", msg_len);
> +	kfree(dsp_msg);
> +	return 0;
> +}
> +#endif
> +
> +/***********************************spin_angle**********************************/
> +static int aw_set_adsp_spin_angle(struct aw_device *aw_dev, uint32_t spin_angle)
> +{
> +	if (spin_angle >= AW_SPIN_MAX) {
> +		aw_dev_err(aw_dev->dev, "spin_angle:%d not support",
> +				spin_angle);
> +		return -EINVAL;
> +	}
> +
> +#ifdef AW_MTK_PLATFORM_SPIN
> +	return aw_mtk_set_spin_angle(aw_dev, spin_angle);
> +#else
> +	return aw_qcom_set_spin_angle(aw_dev, spin_angle);
> +#endif
> +}
> +
> +static void aw_get_adsp_spin_angle(uint32_t *spin_angle)
> +{
> +#ifdef AW_MTK_PLATFORM_SPIN
> +	aw_mtk_get_spin_angle(spin_angle, sizeof(uint32_t));
> +#else
> +	aw_qcom_get_spin_angle(spin_angle, sizeof(uint32_t));
> +#endif
> +}
> +/*******************************************************************************/
> +
> +/**********************************mixer_status*********************************/
> +static int aw_set_mixer_en(struct aw_device *aw_dev, int32_t is_enable)
> +{
> +	int ret;
> +	uint32_t msg_id;
> +
> +	ret = aw_get_msg_id(aw_dev->channel, &msg_id);
> +	if (ret < 0) {
> +		aw_dev_err(aw_dev->dev, "get msg_num failed");
> +		return ret;
> +	}
> +
> +#ifdef AW_MTK_PLATFORM_SPIN
> +	ret = aw_mtk_set_mixer_en(aw_dev, msg_id, is_enable);
> +#else
> +	ret = aw_qcom_set_mixer_en(aw_dev, msg_id, is_enable);
> +#endif

No, we can't have such ifdefs


> +	if (ret)
> +		aw_dev_err(aw_dev->dev, "set mixer status failed");
> +
> +	return ret;
> +}
> +
> +int aw883xx_hold_reg_spin_st(struct aw_spin_desc *spin_desc)
> +{
> +	struct aw_device *aw_dev = container_of(spin_desc,
> +						struct aw_device, spin_desc);
> +	uint16_t reg_val;
> +
> +	if (aw_dev == NULL) {
> +		aw_pr_err("aw_dev is NULL");
> +		return -EINVAL;
> +	}
> +
> +	mutex_lock(&g_aw_spin_lock);
> +	if ((g_spin_mode == AW_REG_SPIN_MODE) ||
> +		(g_spin_mode == AW_REG_MIXER_SPIN_MODE)) {
> +		/*set rx*/
> +		aw_dev->ops.aw_reg_read(aw_dev,
> +			aw_dev->chansel_desc.rxchan_reg, &reg_val);
> +		reg_val &= aw_dev->chansel_desc.rxchan_mask;
> +		reg_val |= spin_desc->spin_table[g_spin_angle].rx_val;
> +		aw_dev->ops.aw_reg_write(aw_dev,
> +			aw_dev->chansel_desc.rxchan_reg, reg_val);
> +
> +		/*set tx*/
> +		aw_dev->ops.aw_reg_read(aw_dev,
> +			aw_dev->chansel_desc.txchan_reg, &reg_val);
> +		reg_val &= aw_dev->chansel_desc.txchan_mask;
> +		reg_val |= spin_desc->spin_table[g_spin_angle].tx_val;
> +		aw_dev->ops.aw_reg_write(aw_dev,
> +			aw_dev->chansel_desc.txchan_reg, reg_val);
> +	}
> +	mutex_unlock(&g_aw_spin_lock);
> +
> +	return 0;
> +}
> +
> +int aw883xx_check_spin_mode(struct aw_spin_desc *spin_desc)
> +{
> +	struct list_head *pos = NULL;
> +	struct list_head *dev_list = NULL;
> +	struct aw_device *local_pa = NULL;
> +	int ret = -1;
> +	int spin_mode = AW_SPIN_OFF_MODE;
> +	struct aw_device *aw_dev = container_of(spin_desc,
> +						struct aw_device, spin_desc);
> +	struct aw883xx *aw883xx = (struct aw883xx *)aw_dev->private_data;
> +
> +	if (g_spin_mode == AW_SPIN_OFF_MODE) {
> +		aw883xx->spin_flag = AW_SPIN_OFF;
> +		return 0;
> +	}
> +
> +	ret = aw883xx_dev_get_list_head(&dev_list);
> +	if (ret) {
> +		aw_pr_err("get dev list failed");
> +		return ret;
> +	}
> +
> +	list_for_each(pos, dev_list) {
> +		local_pa = container_of(pos, struct aw_device, list_node);
> +		spin_mode = local_pa->spin_desc.spin_mode;
> +		if (g_spin_mode != spin_mode) {
> +			aw_pr_err("dev[%d] spin mode:%d not equal g_spin_mode:%d, check failed",
> +				local_pa->channel, spin_mode, g_spin_mode);
> +			aw883xx->spin_flag = AW_SPIN_OFF;
> +			return -EINVAL;
> +		}
> +	}
> +	aw883xx->spin_flag = AW_SPIN_ON;
> +
> +	return 0;
> +}
> +
> +int aw883xx_hold_dsp_spin_st(struct aw_spin_desc *spin_desc)
> +{
> +	struct aw_device *aw_dev = container_of(spin_desc,
> +						struct aw_device, spin_desc);
> +	int ret = -1;
> +
> +	if (aw_dev == NULL) {
> +		aw_pr_err("aw_dev is NULL");
> +		return -EINVAL;
> +	}
> +
> +	if (aw_dev->channel == 0) {
> +		if (g_spin_mode == AW_ADSP_SPIN_MODE) {
> +			ret = aw_set_adsp_spin_angle(aw_dev,
> +							g_spin_angle);
> +			if (ret < 0)
> +				return ret;
> +		}
> +	}
> +
> +	return ret;
> +}
> +
> +static int aw_set_channal_mode(struct aw_device *aw_pa,

channel

> +					uint32_t spin_angle)
> +{
> +	int ret;
> +	struct aw_chansel_desc *chansel_desc = &aw_pa->chansel_desc;
> +	struct aw_spin_ch *spin_ch = &aw_pa->spin_desc.spin_table[spin_angle];
> +
> +	ret = aw_pa->ops.aw_reg_write_bits(aw_pa, chansel_desc->rxchan_reg,
> +				chansel_desc->rxchan_mask, spin_ch->rx_val);

this looks like regmap should be used...

> +	if (ret < 0) {
> +		aw_dev_err(aw_pa->dev, "set rx failed");
> +		return ret;
> +	}
> +
> +	ret = aw_pa->ops.aw_reg_write_bits(aw_pa, chansel_desc->txchan_reg,
> +				chansel_desc->txchan_mask, spin_ch->tx_val);
> +	if (ret < 0) {
> +		aw_dev_err(aw_pa->dev, "set tx failed");
> +		return ret;
> +	}
> +
> +	aw_dev_dbg(aw_pa->dev, "set channel mode done!");
> +
> +	return 0;
> +}
> +
> +static int aw_set_reg_spin_angle(struct aw883xx *aw883xx, uint32_t spin_angle)

what do spin and spin_angle refer to?

> +{
> +	struct list_head *pos = NULL;
> +	struct list_head *dev_list = NULL;
> +	struct aw_device *local_pa = NULL;
> +	int ret;
> +
> +	if (spin_angle >= ARRAY_SIZE(aw_spin)) {
> +		aw_dev_err(aw883xx->dev, "spin_angle:%d not support",
> +					spin_angle);
> +		return -EINVAL;
> +	}
> +
> +	ret = aw883xx_dev_get_list_head(&dev_list);
> +	if (ret) {
> +		aw_dev_err(aw883xx->dev, "get dev list failed");
> +		return ret;
> +	}
> +
> +	list_for_each(pos, dev_list) {
> +		local_pa = container_of(pos, struct aw_device, list_node);
> +		ret = aw_set_channal_mode(local_pa, spin_angle);
> +		if (ret < 0) {
> +			aw_dev_err(aw883xx->dev, "set channal mode failed");
> +			return ret;
> +		}
> +	}
> +
> +	return 0;
> +}
> +
> +static int aw_set_reg_mixer_spin_angle(struct aw883xx *aw883xx, uint32_t spin_angle)
> +{
> +	int ret;
> +
> +	if (spin_angle >= ARRAY_SIZE(aw_spin)) {
> +		aw_dev_err(aw883xx->dev, "spin_angle:%d not support",
> +					spin_angle);
> +		return -EINVAL;
> +	}
> +
> +	ret = aw_set_mixer_en(aw883xx->aw_pa, AW_AUDIO_MIX_ENABLE);
> +	if (ret)
> +		return ret;
> +
> +	usleep_range(AW_100000_US, AW_100000_US + 10);
> +
> +	aw_set_reg_spin_angle(aw883xx, spin_angle);
> +
> +	ret = aw_set_mixer_en(aw883xx->aw_pa, AW_AUDIO_MIX_DISABLE);
> +	if (ret)
> +		return ret;
> +
> +	return ret;
> +}
> +
> +static void aw_get_reg_spin_angle(uint32_t *spin_angle)
> +{
> +	*spin_angle = g_spin_angle;
> +
> +	pr_debug("%s: get spin:%s\n", __func__, aw_spin[g_spin_angle]);
> +}
> +
> +static int aw_set_spin_angle(struct aw883xx *aw883xx, uint32_t spin_angle)
> +{
> +	switch (g_spin_mode) {
> +	case AW_REG_SPIN_MODE:
> +		return aw_set_reg_spin_angle(aw883xx, spin_angle);
> +	case AW_ADSP_SPIN_MODE:
> +		return aw_set_adsp_spin_angle(aw883xx->aw_pa, spin_angle);
> +	case AW_REG_MIXER_SPIN_MODE:
> +		return aw_set_reg_mixer_spin_angle(aw883xx, spin_angle);
> +	default:
> +		aw_pr_err("unsupported spin mode:%d", g_spin_mode);
> +		return -EINVAL;
> +	}
> +}
> +
> +static void aw_set_spin_mode(int mode)
> +{
> +	g_spin_mode = mode;
> +}
> +
> +static int aw_set_spin(struct snd_kcontrol *kcontrol,
> +	struct snd_ctl_elem_value *ucontrol)
> +{
> +	struct aw883xx *aw883xx = (struct aw883xx *)kcontrol->private_value;
> +	uint32_t ctrl_value;
> +	int ret;
> +
> +	aw_dev_dbg(aw883xx->dev, "ucontrol->value.integer.value[0]=%ld",
> +			ucontrol->value.integer.value[0]);
> +
> +	if (aw883xx->spin_flag == AW_SPIN_OFF) {
> +		aw_dev_dbg(aw883xx->dev, "spin func not enable");
> +		return 0;
> +	}
> +
> +	ctrl_value = (uint32_t)ucontrol->value.integer.value[0];
> +
> +	mutex_lock(&g_aw_spin_lock);
> +	if (aw883xx->pstream == AW883XX_STREAM_OPEN) {
> +		ret = aw_set_spin_angle(aw883xx, ctrl_value);
> +		if (ret < 0)
> +			aw_dev_err(aw883xx->dev, "set spin error, ret=%d\n",
> +				ret);
> +	} else {
> +		if ((g_spin_mode == AW_REG_SPIN_MODE) || (g_spin_mode == AW_REG_MIXER_SPIN_MODE))
> +			aw_set_reg_spin_angle(aw883xx, ctrl_value);
> +		else
> +			aw_dev_info(aw883xx->dev, "stream no start only record spin angle");
> +	}
> +	g_spin_angle = ctrl_value;
> +	mutex_unlock(&g_aw_spin_lock);
> +
> +	return 0;
> +}
> +
> +static void aw_get_spin_angle(uint32_t *spin_angle)
> +{
> +	if ((g_spin_mode == AW_REG_SPIN_MODE) || (g_spin_mode == AW_REG_MIXER_SPIN_MODE))
> +		aw_get_reg_spin_angle(spin_angle);
> +	else if (g_spin_mode == AW_ADSP_SPIN_MODE)
> +		aw_get_adsp_spin_angle(spin_angle);
> +}
> +
> +static int aw_get_spin(struct snd_kcontrol *kcontrol,
> +	struct snd_ctl_elem_value *ucontrol)
> +{
> +	struct aw883xx *aw883xx = (struct aw883xx *)kcontrol->private_value;
> +	uint32_t ctrl_value = 0;
> +
> +	mutex_lock(&g_aw_spin_lock);
> +	if (aw883xx->pstream == AW883XX_STREAM_OPEN) {
> +		aw_get_spin_angle(&ctrl_value);
> +		ucontrol->value.integer.value[0] = ctrl_value;
> +	} else {
> +		ucontrol->value.integer.value[0] = g_spin_angle;
> +		aw_dev_dbg(aw883xx->dev, "no stream, use record value");
> +	}
> +	mutex_unlock(&g_aw_spin_lock);
> +
> +	return 0;
> +}
> +
> +static int aw_spin_info(struct snd_kcontrol *kcontrol,
> +			struct snd_ctl_elem_info *uinfo)
> +{
> +	struct aw883xx *aw883xx = (struct aw883xx *)kcontrol->private_value;
> +	int count = 0;
> +
> +	if (aw883xx == NULL) {
> +		aw_pr_err("get struct aw883xx failed");
> +		return -EINVAL;
> +	}
> +
> +	uinfo->type = SNDRV_CTL_ELEM_TYPE_ENUMERATED;
> +	uinfo->count = 1;
> +	count = ARRAY_SIZE(aw_spin);
> +
> +	uinfo->value.enumerated.items = count;
> +		if (uinfo->value.enumerated.item >= count)
> +			uinfo->value.enumerated.item = count - 1;
> +
> +	strscpy(uinfo->value.enumerated.name,
> +			aw_spin[uinfo->value.enumerated.item],
> +			strlen(aw_spin[uinfo->value.enumerated.item]) + 1);
> +
> +	return 0;
> +}
> +
> +static int aw_spin_control_create(struct aw883xx *aw883xx)
> +{
> +	int kcontrol_num = 1;
> +	struct snd_kcontrol_new *aw_spin_control = NULL;
> +	char *kctl_name = NULL;
> +
> +	aw_spin_control = devm_kzalloc(aw883xx->codec->dev,
> +			sizeof(struct snd_kcontrol_new) * 1, GFP_KERNEL);
> +	if (aw_spin_control == NULL)
> +		return -ENOMEM;
> +
> +	kctl_name = devm_kzalloc(aw883xx->codec->dev, AW_NAME_BUF_MAX, GFP_KERNEL);
> +	if (kctl_name == NULL)
> +		return -ENOMEM;
> +
> +	snprintf(kctl_name, AW_NAME_BUF_MAX, "aw_spin_switch");
> +
> +	aw_spin_control[0].name = kctl_name;
> +	aw_spin_control[0].iface = SNDRV_CTL_ELEM_IFACE_MIXER;
> +	aw_spin_control[0].info = aw_spin_info;
> +	aw_spin_control[0].get = aw_get_spin;
> +	aw_spin_control[0].put = aw_set_spin;
> +	aw_spin_control[0].private_value = (unsigned long)aw883xx;
> +
> +	kctl_name = devm_kzalloc(aw883xx->codec->dev, AW_NAME_BUF_MAX, GFP_KERNEL);
> +	if (!kctl_name)
> +		return -ENOMEM;
> +
> +	aw883xx->codec_ops->add_codec_controls(aw883xx->codec,
> +		aw_spin_control, kcontrol_num);
> +
> +	return 0;
> +}
> +
> +void aw883xx_add_spin_controls(void *aw_dev)
> +{
> +	struct aw883xx *aw883xx = (struct aw883xx *)aw_dev;
> +
> +	if (aw883xx->aw_pa->spin_desc.spin_mode != AW_SPIN_OFF_MODE)
> +		aw_spin_control_create(aw883xx);
> +}
> +
> +static int aw_parse_spin_table_dt(struct aw_device *aw_dev,
> +					struct device_node *np)
> +{
> +	int ret = -1;
> +	const char *str_data = NULL;
> +	char spin_table_str[AW_SPIN_MAX] = { 0 };
> +	int i, spin_count = 0;
> +
> +	ret = of_property_read_string(np, "spin-data", &str_data);
> +	if (ret < 0) {
> +		aw_dev_err(aw_dev->dev, "get spin_data failed, close spin function");
> +		return ret;
> +	}
> +
> +	ret = sscanf(str_data, "%c %c %c %c",
> +				&spin_table_str[AW_SPIN_0], &spin_table_str[AW_SPIN_90],
> +				&spin_table_str[AW_SPIN_180], &spin_table_str[AW_SPIN_270]);
> +	if  (ret != AW_SPIN_MAX) {
> +		aw_dev_err(aw_dev->dev, "unsupported str:%s, close spin function",
> +				str_data);
> +		return -EINVAL;
> +	}
> +
> +	for (i = 0; i < AW_SPIN_MAX; i++) {
> +		if (spin_table_str[i] == 'l' || spin_table_str[i] == 'L') {
> +			aw_dev->spin_desc.spin_table[i].rx_val = aw_dev->chansel_desc.rx_left;
> +			aw_dev->spin_desc.spin_table[i].tx_val = aw_dev->chansel_desc.tx_left;
> +			spin_count++;
> +		} else if (spin_table_str[i] == 'r' || spin_table_str[i] == 'R') {
> +			aw_dev->spin_desc.spin_table[i].rx_val = aw_dev->chansel_desc.rx_right;
> +			aw_dev->spin_desc.spin_table[i].tx_val = aw_dev->chansel_desc.tx_right;
> +			spin_count++;
> +		} else {
> +			aw_dev_err(aw_dev->dev, "unsupported str:%s, close spin function",
> +				str_data);
> +			return -EINVAL;
> +		}
> +	}
> +
> +	if (spin_count != ARRAY_SIZE(aw_spin)) {
> +		aw_dev_err(aw_dev->dev, "get spin_data failed, spin_count:%d", spin_count);
> +		return -EINVAL;
> +	}
> +
> +	return 0;
> +}
> +
> +static void aw_parse_topo_id_dt(struct aw_device *aw_dev)
> +{
> +	int ret;
> +
> +	ret = of_property_read_u32(aw_dev->dev->of_node, "aw-rx-topo-id", &g_rx_topo_id);
> +	if (ret < 0) {
> +		g_rx_topo_id = AW_RX_TOPO_ID;
> +		aw_dev_info(aw_dev->dev, "read aw-rx-topo-id failed,use default");
> +	}
> +
> +	aw_dev_info(aw_dev->dev, "rx-topo-id: 0x%x", g_rx_topo_id);
> +}
> +
> +static void aw_parse_port_id_dt(struct aw_device *aw_dev)
> +{
> +	int ret;
> +
> +	ret = of_property_read_u32(aw_dev->dev->of_node, "aw-rx-port-id", &g_rx_port_id);
> +	if (ret < 0) {
> +		g_rx_port_id = AW_RX_PORT_ID;
> +		aw_dev_info(aw_dev->dev, "read aw-rx-port-id failed,use default");
> +	}
> +
> +	aw_set_port_id(0, g_rx_port_id);
> +	aw_dev_info(aw_dev->dev, "rx-port-id: 0x%x",
> +						g_rx_port_id);
> +}
> +
> +static int aw_parse_spin_mode_dt(struct aw_device *aw_dev)

what does 'spin' refer to?

> +{
> +	int ret = -1;
> +	const char *spin_mode = NULL;
> +	int mode;
> +	struct device_node *np = aw_dev->dev->of_node;
> +
> +	ret = of_property_read_string(np, "spin-mode", &spin_mode);
> +	if (ret < 0) {
> +		aw_dev_info(aw_dev->dev,
> +			"spin-mode get failed, spin switch off");
> +		aw_dev->spin_desc.spin_mode = AW_SPIN_OFF_MODE;
> +		return 0;
> +	}
> +
> +	if (!strcmp(spin_mode, "dsp_spin"))
> +		mode = AW_ADSP_SPIN_MODE;
> +	else if (!strcmp(spin_mode, "reg_spin"))
> +		mode = AW_REG_SPIN_MODE;
> +	else if (!strcmp(spin_mode, "reg_mixer_spin"))
> +		mode = AW_REG_MIXER_SPIN_MODE;
> +	else
> +		mode = AW_SPIN_OFF_MODE;
> +
> +	aw_dev->spin_desc.spin_mode = mode;
> +
> +	aw_set_spin_mode(mode);
> +
> +	if ((mode == AW_REG_SPIN_MODE) || (mode == AW_REG_MIXER_SPIN_MODE)) {
> +		ret = aw_parse_spin_table_dt(aw_dev, np);
> +		if (ret < 0) {
> +			aw_dev->spin_desc.spin_mode = AW_SPIN_OFF_MODE;
> +			aw_dev_err(aw_dev->dev,
> +				"spin-table get failed, ret = %d", ret);
> +			return ret;
> +		}
> +	}
> +
> +	aw_dev_info(aw_dev->dev, "spin mode is %d", mode);
> +
> +	return 0;
> +}
> +
> +void aw883xx_spin_init(struct aw_spin_desc *spin_desc)
> +{
> +	struct aw_device *aw_dev = container_of(spin_desc,
> +					struct aw_device, spin_desc);
> +
> +	aw_parse_spin_mode_dt(aw_dev);
> +	aw_parse_topo_id_dt(aw_dev);
> +	aw_parse_port_id_dt(aw_dev);
> +}
> +
> diff --git a/sound/soc/codecs/aw883xx/aw883xx_spin.h b/sound/soc/codecs/aw883xx/aw883xx_spin.h
> new file mode 100644
> index 0000000..cb5dc39
> --- /dev/null
> +++ b/sound/soc/codecs/aw883xx/aw883xx_spin.h
> @@ -0,0 +1,80 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * aw883xx.c --  ALSA Soc AW883XX codec support
> + *
> + * Copyright (c) 2020 AWINIC Technology CO., LTD

2022?
