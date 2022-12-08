Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EAA52647105
	for <lists+alsa-devel@lfdr.de>; Thu,  8 Dec 2022 14:49:26 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 51B2C1922;
	Thu,  8 Dec 2022 14:48:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 51B2C1922
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1670507366;
	bh=bouq9i1saOga6prylMknbBrrgqnAVAjxDZyEUW19yJc=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=DYUW9p+a04l9aj1xHczcJMsmK9aMcEvCSmU3LyV5nUNvdCVqZCBBlgfTuNoPPtki0
	 7rjJq2YHQmSrpQljTvSOKxT+xqDxGHlzAdrqm2V6qNNU2D3VNc39VvEtc4flQZA5rN
	 LLNSb2aPTfJxXSVz+yR6a/mniOuzb1UDjvXfA95E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EDE97F80121;
	Thu,  8 Dec 2022 14:48:34 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6FE66F8020D; Thu,  8 Dec 2022 14:48:33 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=1.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,PRX_BODY_30,RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS
 autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id ACD98F80089
 for <alsa-devel@alsa-project.org>; Thu,  8 Dec 2022 14:48:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ACD98F80089
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="B6/rw92x"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1670507307; x=1702043307;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=bouq9i1saOga6prylMknbBrrgqnAVAjxDZyEUW19yJc=;
 b=B6/rw92xWkaQevNv60xnMUHgoy5/q93lUHetReG94PwVuKqFlpqrShlS
 ei603PArwkyuZx91c7MSq8NEhIVXWspI8EVj2IV1GHl/k11SCu0wTjJ0H
 F1osZRL6PfboOZwXRsN/a65vToyNGHdKRFrLdQfJIi+dq6gBRN0CkmjHw
 aAcMC3SFB+1zIwxI1lAVk3/gGAGJaAh9cDlQRHfYPaZF/XRMhng0CJGQ6
 MjpR0s+RUfwHNnw40iRKp4NTCfqw5/jh3H50WtCUG+X41xKNHRWhIpb31
 LCzcIlygo67qVLTUQfVoae7BpnlME3zAdUz6e4YIjQVCfT0s/u2NvI9i+ w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10554"; a="296861519"
X-IronPort-AV: E=Sophos;i="5.96,227,1665471600"; d="scan'208";a="296861519"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2022 05:48:22 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10554"; a="679534500"
X-IronPort-AV: E=Sophos;i="5.96,227,1665471600"; d="scan'208";a="679534500"
Received: from aslawinx-mobl.ger.corp.intel.com (HELO [10.99.249.223])
 ([10.99.249.223])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2022 05:48:17 -0800
Message-ID: <c4b8651b-c190-8b3f-b41c-7143a885dba7@linux.intel.com>
Date: Thu, 8 Dec 2022 14:48:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH V6 2/5] ASoC: codecs: Implementation of aw883xx
 configuration file parsing function
Content-Language: en-US
To: wangweidong.a@awinic.com, broonie@kernel.org, perex@perex.cz,
 alsa-devel@alsa-project.org, tiwai@suse.com, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, ckeepax@opensource.cirrus.com,
 tanureal@opensource.cirrus.com, quic_potturu@quicinc.com,
 pierre-louis.bossart@linux.intel.com, cy_huang@richtek.com
References: <20221208122313.55118-1-wangweidong.a@awinic.com>
 <20221208122313.55118-3-wangweidong.a@awinic.com>
From: =?UTF-8?Q?Amadeusz_S=c5=82awi=c5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
In-Reply-To: <20221208122313.55118-3-wangweidong.a@awinic.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
>   sound/soc/codecs/aw883xx/aw883xx_bin_parse.c | 1324 ++++++++++++++++++
>   sound/soc/codecs/aw883xx/aw883xx_bin_parse.h |  149 ++
>   2 files changed, 1473 insertions(+)
>   create mode 100644 sound/soc/codecs/aw883xx/aw883xx_bin_parse.c
>   create mode 100644 sound/soc/codecs/aw883xx/aw883xx_bin_parse.h
> 
> diff --git a/sound/soc/codecs/aw883xx/aw883xx_bin_parse.c b/sound/soc/codecs/aw883xx/aw883xx_bin_parse.c
> new file mode 100644
> index 000000000000..f3d9b8a9fdf2
> --- /dev/null
> +++ b/sound/soc/codecs/aw883xx/aw883xx_bin_parse.c
> @@ -0,0 +1,1324 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * aw_bin_parse.c  -- ALSA Soc AW883XX codec support

Soc -> SoC

> + *
> + * Copyright (c) 2022 AWINIC Technology CO., LTD
> + */
> +
> +#include <linux/cdev.h>
> +#include <linux/delay.h>
> +#include <linux/device.h>
> +#include <linux/debugfs.h>
> +#include <linux/firmware.h>
> +#include <linux/hrtimer.h>
> +#include <linux/input.h>
> +#include <linux/i2c.h>
> +#include <linux/interrupt.h>
> +#include <linux/kernel.h>
> +#include <linux/list.h>
> +#include <linux/module.h>
> +#include <linux/mutex.h>
> +#include <linux/miscdevice.h>
> +#include <linux/of_gpio.h>
> +#include <linux/regmap.h>
> +#include <linux/slab.h>
> +#include <linux/string.h>
> +#include <linux/timer.h>
> +#include <linux/uaccess.h>
> +#include <linux/version.h>
> +#include <linux/workqueue.h>
> +#include "aw883xx_bin_parse.h"
> +
> +#include <linux/clk.h>
> +#include <linux/err.h>
> +#include <linux/io.h>
> +#include <linux/module.h>
> +#include <linux/regmap.h>
> +#include <linux/slab.h>
> +#include <linux/swab.h>
> +#include <linux/device.h>
> +#include <linux/regmap.h>
> +#include <linux/fs.h>
> +#include <linux/list.h>
> +#include <linux/wait.h>

Same as on patch 1, there seems to be quite a few unnecessary headers, 
and this one even has duplicates.

> +
> +static char *profile_name[AW_PROFILE_MAX] = {
> +	"Music", "Voice", "Voip", "Ringtone",
> +	"Ringtone_hs", "Lowpower", "Bypass",
> +	"Mmi", "Fm", "Notification", "Receiver"
> +};
> +
> +static int aw_parse_bin_header_1_0_0(struct aw_bin *bin);
> +
> +/*
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
> +	unsigned char *p_check_sum = NULL;
> +
> +	p_check_sum = &(bin->info.data[(bin->header_info[bin_num].valid_data_addr -
> +						bin->header_info[bin_num].header_len)]);
> +
> +	pr_debug("aw_bin_parse p_check_sum = %p\n", p_check_sum);
> +
> +	check_sum = le32_to_cpup((void *)p_check_sum);
> +
> +	for (i = 4; i < bin->header_info[bin_num].bin_data_len +
> +					bin->header_info[bin_num].header_len; i++) {
> +		sum_data += *(p_check_sum + i);
> +	}
> +	pr_debug("aw_bin_parse bin_num = %d, check_sum = 0x%x, sum_data = 0x%x\n",
> +						bin_num, check_sum, sum_data);
> +	if (sum_data != check_sum) {
> +		p_check_sum = NULL;
No need to assign NULL to pointer?

> +		pr_err("%s. CheckSum Fail.bin_num=%d, CheckSum:0x%x, SumData:0x%x",
> +				__func__, bin_num, check_sum, sum_data);
> +		return -BIN_DATA_LEN_ERR;

Any reason to invent your own error codes, I went through few call paths 
and you don't seem to use them anywhere, might as well return -EINVAL?

> +	}
> +	p_check_sum = NULL;

Same here, no need to set this to NULL?

> +
> +	return 0;
> +}
> +
> +static int aw_check_data_version(struct aw_bin *bin, int bin_num)
> +{
> +	if (bin->header_info[bin_num].bin_data_ver < DATA_VERSION_V1 ||
> +		bin->header_info[bin_num].bin_data_ver > DATA_VERSION_MAX) {
> +		pr_err("aw_bin_parse Unrecognized this bin data version\n");
> +		return -DATA_VER_ERR;

Return -EINVAL?

> +	}
> +
> +	return 0;
> +}
> +
> +static int aw_check_register_num_v1(struct aw_bin *bin, int bin_num)
> +{
> +	unsigned int check_register_num = 0;
> +	unsigned int parse_register_num = 0;
> +	unsigned char *p_check_sum = NULL;
> +	struct bin_header_info temp_info;
> +
> +	temp_info = bin->header_info[bin_num];
> +	p_check_sum = &(bin->info.data[(temp_info.valid_data_addr)]);
> +	pr_debug("aw_bin_parse p_check_sum = %p\n", p_check_sum);
> +	parse_register_num = le32_to_cpup((void *)p_check_sum);
> +	check_register_num = (bin->header_info[bin_num].bin_data_len - 4) /
> +				(bin->header_info[bin_num].reg_byte_len +
> +				bin->header_info[bin_num].data_byte_len);
> +	pr_debug("%s bin_num = %d,parse_register_num = 0x%x,check_register_num = 0x%x\n",
> +				__func__, bin_num, parse_register_num, check_register_num);
> +	if (parse_register_num != check_register_num) {
> +		p_check_sum = NULL;
Same weird pattern as in previous function.

> +		pr_err("%s bin_num = %d,parse_register_num = 0x%x,check_register_num = 0x%x\n",
> +				__func__, bin_num, parse_register_num, check_register_num);
> +
> +		return -REG_NUM_ERR;

-EINVAL?

> +	}
> +	bin->header_info[bin_num].reg_num = parse_register_num;
> +	bin->header_info[bin_num].valid_data_len = temp_info.bin_data_len - 4;
> +	p_check_sum = NULL;

Again. I see that it is same in following function, I won't comment 
them, but it should be also fixed there.

> +	bin->header_info[bin_num].valid_data_addr = temp_info.valid_data_addr + 4;
> +
> +	return 0;
> +}
> +

(...)

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
> +	for (i = 0; i < prof_hdr->a_ddt_num; i++) {
> +		if ((aw_dev->channel == cfg_dde[i].dev_index) &&
> +			(cfg_dde[i].type == AW_DEV_DEFAULT_TYPE_ID)) {
> +			if (cfg_dde[i].data_type != ACF_SEC_TYPE_MONITOR) {

"if" containing another "if", you can just use &&, so:
if ((aw_dev->channel == cfg_dde[i].dev_index) &&
	(cfg_dde[i].type == AW_DEV_DEFAULT_TYPE_ID) &&
	(cfg_dde[i].data_type != ACF_SEC_TYPE_MONITOR)) {
and then you can reduce one level of intendation here.


> +				if (cfg_dde[i].dev_profile >= AW_PROFILE_MAX) {
> +					dev_err(aw_dev->dev, "dev_profile [%d] overflow",
> +						cfg_dde[i].dev_profile);
> +					return -EINVAL;
> +				}
> +				ret = aw_dev_parse_data_by_sec_type(aw_dev, prof_hdr, &cfg_dde[i],
> +					&all_prof_info->prof_desc[cfg_dde[i].dev_profile]);
> +				if (ret < 0) {
> +					dev_err(aw_dev->dev, "parse failed");
> +					return ret;
> +				}
> +				sec_num++;
> +			}
> +		}
> +	}
> +
> +	if (sec_num == 0) {
> +		dev_err(aw_dev->dev, "get dev default type failed, get num[%d]", sec_num);
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
> +	dev_dbg(aw_dev->dev, "get valid profile:%d", aw_dev->prof_info.count);
> +
> +	if (!prof_info->count) {
> +		dev_err(aw_dev->dev, "no profile data");
> +		return -EPERM;
> +	}
> +
> +	prof_info->prof_desc = devm_kzalloc(aw_dev->dev,
> +					prof_info->count * sizeof(struct aw_prof_desc),
> +					GFP_KERNEL);
> +	if (!prof_info->prof_desc) {
> +		dev_err(aw_dev->dev, "prof_desc kzalloc failed");
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
> +					dev_err(aw_dev->dev, "get scene num[%d] overflow count[%d]",
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
> +	struct aw_all_prof_info *all_prof_info;
> +
> +	all_prof_info = devm_kzalloc(aw_dev->dev, sizeof(struct aw_all_prof_info), GFP_KERNEL);
> +	if (!all_prof_info)
> +		return -ENOMEM;
> +
> +	ret = aw_dev_parse_dev_type(aw_dev, prof_hdr, all_prof_info);
> +	if (ret < 0) {
> +		goto exit;
> +	} else if (ret == AW_DEV_TYPE_NONE) {
> +		dev_dbg(aw_dev->dev, "get dev type num is 0, parse default dev");
> +		ret = aw_dev_parse_dev_default_type(aw_dev, prof_hdr, all_prof_info);
> +		if (ret < 0)
> +			goto exit;
> +	}
> +
> +	ret = aw_dev_cfg_get_vaild_prof(aw_dev, *all_prof_info);
> +	if (ret < 0)
> +		goto exit;
> +
> +	aw_dev->prof_info.prof_name_list = profile_name;
> +exit:
> +	devm_kfree(aw_dev->dev, all_prof_info);
> +	return ret;
> +}
> +
> +static int aw_dev_create_prof_name_list_v_1_0_0_0(struct aw_device *aw_dev)
> +{
> +	struct aw_prof_info *prof_info = &aw_dev->prof_info;
> +	struct aw_prof_desc *prof_desc = prof_info->prof_desc;
> +	int i;
> +
> +	if (!prof_desc) {
> +		dev_err(aw_dev->dev, "prof_desc is NULL");
> +		return -EINVAL;
> +	}
> +
> +	prof_info->prof_name_list = devm_kzalloc(aw_dev->dev,
> +					prof_info->count * PROFILE_STR_MAX,
> +					GFP_KERNEL);

You seem to be allocating an array here, consider devm_kcalloc instead?

> +	if (!prof_info->prof_name_list) {
> +		dev_err(aw_dev->dev, "prof_name_list devm_kzalloc failed");
> +		return -ENOMEM;
> +	}
> +
> +	for (i = 0; i < prof_info->count; i++) {
> +		prof_desc[i].id = i;
> +		prof_info->prof_name_list[i] = prof_desc[i].prf_str;
> +		dev_dbg(aw_dev->dev, "prof name is %s", prof_info->prof_name_list[i]);
> +	}
> +
> +	return 0;
> +}
> +

(...)

> +
> +static int aw_dev_load_cfg_by_hdr_v_1_0_0_0(struct aw_device *aw_dev,
> +									struct aw_container *aw_cfg)
> +{
> +	struct aw_prof_info *prof_info = &aw_dev->prof_info;
> +	struct aw_cfg_hdr *cfg_hdr = (struct aw_cfg_hdr *)aw_cfg->data;
> +	int ret;
> +
> +	ret = aw_dev_parse_scene_count_v_1_0_0_0(aw_dev, aw_cfg, &prof_info->count);
> +	if (ret < 0) {
> +		dev_err(aw_dev->dev, "get scene count failed");
> +		return ret;
> +	}
> +
> +	prof_info->prof_desc = devm_kzalloc(aw_dev->dev,
> +					prof_info->count * sizeof(struct aw_prof_desc),
> +					GFP_KERNEL);

You seem to be allocating an array here, consider devm_kcalloc instead?

> +	if (!prof_info->prof_desc)
> +		return -ENOMEM;
> +
> +	ret = aw_dev_parse_by_hdr_v_1_0_0_0(aw_dev, cfg_hdr);
> +	if (ret < 0) {
> +		dev_err(aw_dev->dev, " failed");
> +		return ret;
> +	}
> +
> +	ret = aw_dev_create_prof_name_list_v_1_0_0_0(aw_dev);
> +	if (ret < 0) {
> +		dev_err(aw_dev->dev, "create prof name list failed");
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
> +	cfg_hdr = (struct aw_cfg_hdr *)aw_cfg->data;
> +
> +	switch (cfg_hdr->a_hdr_version) {
> +	case AW_CFG_HDR_VER_0_0_0_1:
> +		ret = aw_dev_load_cfg_by_hdr(aw_dev, cfg_hdr);
> +		if (ret < 0) {
> +			dev_err(aw_dev->dev, "hdr_cersion[0x%x] parse failed",
> +						cfg_hdr->a_hdr_version);
> +			return ret;
> +		}
> +		break;
> +	case AW_CFG_HDR_VER_1_0_0_0:
> +		ret = aw_dev_load_cfg_by_hdr_v_1_0_0_0(aw_dev, aw_cfg);
> +		if (ret < 0) {
> +			dev_err(aw_dev->dev, "hdr_cersion[0x%x] parse failed",
> +						cfg_hdr->a_hdr_version);
> +			return ret;
> +		}
> +		break;
> +	default:
> +		dev_err(aw_dev->dev, "unsupported hdr_version [0x%x]", cfg_hdr->a_hdr_version);
> +		return -EINVAL;
> +	}
> +	aw_dev->fw_status = AW_DEV_FW_OK;
> +	return 0;
> +}
> +
> +static unsigned char aw_dev_crc8_check(unsigned char *data, unsigned int data_size)
> +{
> +	u8 crc_value = 0x00;
> +	u8 pdatabuf = 0;
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

There seems to be crc8 implementation in Linux already, any reason to 
implement your own?
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/include/linux/crc8.h
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/lib/crc8.c

> +
> +static int aw_dev_check_cfg_by_hdr(struct aw_container *aw_cfg)
> +{
> +	struct aw_cfg_hdr *cfg_hdr = NULL;
> +	struct aw_cfg_dde *cfg_dde = NULL;
> +	unsigned int end_data_offset = 0;
> +	unsigned int act_data = 0;
> +	unsigned int hdr_ddt_len = 0;
> +	u8 act_crc8 = 0;
> +	int i;
> +
> +	cfg_hdr = (struct aw_cfg_hdr *)aw_cfg->data;
> +	/*check file type id is awinic acf file*/
> +	if (cfg_hdr->a_id != ACF_FILE_ID) {
> +		pr_err("not acf type file");
> +		return -EINVAL;
> +	}
> +
> +	hdr_ddt_len = cfg_hdr->a_hdr_offset + cfg_hdr->a_ddt_size;
> +	if (hdr_ddt_len > aw_cfg->len) {
> +		pr_err("hdrlen with ddt_len [%d] overflow file size[%d]",
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
> +		pr_err("act_data[%d] not equal to file size[%d]!",
> +			act_data, aw_cfg->len);
> +		return -EINVAL;
> +	}
> +
> +	for (i = 0; i < cfg_hdr->a_ddt_num; i++) {
> +		/* data check */
> +		end_data_offset = cfg_dde[i].data_offset + cfg_dde[i].data_size;
> +		if (end_data_offset > aw_cfg->len) {
> +			pr_err("a_ddt_num[%d] end_data_offset[%d] overflow file size[%d]",
> +				i, end_data_offset, aw_cfg->len);
> +			return -EINVAL;
> +		}
> +
> +		/* crc check */
> +		act_crc8 = aw_dev_crc8_check(aw_cfg->data + cfg_dde[i].data_offset,
> +									cfg_dde[i].data_size);
> +		if (act_crc8 != cfg_dde[i].data_crc) {
> +			pr_err("a_ddt_num[%d] crc8 check failed, act_crc8:0x%x != data_crc 0x%x",
> +				i, (u32)act_crc8, cfg_dde[i].data_crc);
> +			return -EINVAL;
> +		}
> +	}
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
> +	u8 act_crc8 = 0;
> +	int i;
> +
> +	cfg_hdr = (struct aw_cfg_hdr *)aw_cfg->data;
> +
> +	/*check file type id is awinic acf file*/
> +	if (cfg_hdr->a_id != ACF_FILE_ID) {
> +		pr_err("not acf type file");
> +		return -EINVAL;
> +	}
> +
> +	hdr_ddt_len = cfg_hdr->a_hdr_offset + cfg_hdr->a_ddt_size;
> +	if (hdr_ddt_len > aw_cfg->len) {
> +		pr_err("hdrlen with ddt_len [%d] overflow file size[%d]",
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
> +		pr_err("act_data[%d] not equal to file size[%d]!",
> +			act_data, aw_cfg->len);
> +		return -EINVAL;
> +	}
> +
> +	for (i = 0; i < cfg_hdr->a_ddt_num; i++) {
> +		/* data check */
> +		end_data_offset = cfg_dde[i].data_offset + cfg_dde[i].data_size;
> +		if (end_data_offset > aw_cfg->len) {
> +			pr_err("a_ddt_num[%d] end_data_offset[%d] overflow file size[%d]",
> +				i, end_data_offset, aw_cfg->len);
> +			return -EINVAL;
> +		}
> +
> +		/* crc check */
> +		act_crc8 = aw_dev_crc8_check(aw_cfg->data + cfg_dde[i].data_offset,
> +							cfg_dde[i].data_size);
> +		if (act_crc8 != cfg_dde[i].data_crc) {
> +			pr_err("a_ddt_num[%d] crc8 check failed, act_crc8:0x%x != data_crc 0x%x",
> +				i, (u32)act_crc8, cfg_dde[i].data_crc);
> +			return -EINVAL;
> +		}
> +	}
> +
> +	return 0;
> +
> +}
> +
> +int aw883xx_dev_load_acf_check(struct aw_container *aw_cfg)
> +{
> +	struct aw_cfg_hdr *cfg_hdr = NULL;
> +
> +	if (!aw_cfg) {
> +		pr_err("aw_prof is NULL");
> +		return -ENOMEM;
> +	}
> +
> +	if (aw_cfg->len < sizeof(struct aw_cfg_hdr)) {
> +		pr_err("cfg hdr size[%d] overflow file size[%d]",
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
> +		pr_err("unsupported hdr_version [0x%x]", cfg_hdr->a_hdr_version);
> +		return -EINVAL;
> +	}
> +
> +	return 0;
> +}
> +
> +int aw883xx_dev_get_profile_count(struct aw_device *aw_dev)
> +{
> +	if (!aw_dev) {
> +		pr_err("aw_dev is NULL");
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

No need to do "else return 0;", you can just "return 0;" It looks bit 
cleaner when it is:
{
if (check something)
	return -EINVAL;

return 0;
}

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
> +		dev_dbg(aw_dev->dev, "set prof[%s]",
> +			aw_dev->prof_info.prof_name_list[prof_desc->id]);
> +	} else {
> +		return -EINVAL;
> +	}
> +
> +	return 0;
> +}

Similarly here, you can just check before hand and success path later:
if ((index >= aw_dev->prof_info.count) || (index < 0))
	return -EINVAL;

aw_dev->set_prof = index;
...
return 0;

> +
> +char *aw_dev_get_prof_name(struct aw_device *aw_dev, int index)
> +{
> +	struct aw_prof_desc *prof_desc = NULL;
> +	struct aw_prof_info *prof_info = &aw_dev->prof_info;
> +
> +	if ((index >= aw_dev->prof_info.count) || (index < 0)) {
> +		dev_err(aw_dev->dev, "index[%d] overflow count[%d]",
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
> +		dev_err(aw_dev->dev, "%s: index[%d] overflow count[%d]\n",
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
> index 000000000000..7f5ce0b1f899
> --- /dev/null
> +++ b/sound/soc/codecs/aw883xx/aw883xx_bin_parse.h
> @@ -0,0 +1,149 @@
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
> +#ifndef __AW883XX_BIN_PARSE_H__
> +#define __AW883XX_BIN_PARSE_H__
> +
> +#include "aw883xx_device.h"
> +
> +#define BIN_NUM_MAX				(100)
> +#define HEADER_LEN				(60)
> +#define CHECK_SUM_OFFSET		(0)
> +#define HEADER_VER_OFFSET		(4)
> +#define	BIN_DATA_TYPE_OFFSET	(8)
> +#define	BIN_DATA_VER_OFFSET		(12)
> +#define	BIN_DATA_LEN_OFFSET		(16)
> +#define	UI_VER_OFFSET			(20)
> +#define CHIP_TYPE_OFFSET		(24)
> +#define	REG_BYTE_LEN_OFFSET		(32)
> +#define	DATA_BYTE_LEN_OFFSET	(36)
> +#define	DEVICE_ADDR_OFFSET		(40)
> +
> +#define AW_FW_CHECK_PART		(10)
> +
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

As mentioned in the beginning, do you even need your own error values, 
they seem to be just passed up to be later converted to -EINVAL, might 
as well return -EINVAL directly.

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
> +				unsigned char *data, unsigned int data_len);
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

