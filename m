Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C11164B037
	for <lists+alsa-devel@lfdr.de>; Tue, 13 Dec 2022 08:11:54 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1719818BB;
	Tue, 13 Dec 2022 08:11:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1719818BB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1670915514;
	bh=bXtMKD+soqeuM+Jlzs6vQrsAqm0Mgg3MCKFEC5sD0oQ=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=nOIrSWNj/5X6YqU7fmxzkWulqJcB4s4KBuGWRz1Ak/LvenJuYQHObwVMsStPPLAvQ
	 BlrSQV063wBWi5vEKU4qj+wqeRq4cKNb5d++YDYa1EwhkxuNpQD1SWHi+nF26yvY8+
	 EuPFWcOmJb/QT+2/M1swxGV6RwGWSzXRWXQv2kv0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A004DF803DD;
	Tue, 13 Dec 2022 08:10:56 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 11C8EF8047D; Tue, 13 Dec 2022 08:10:53 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
 SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED shortcircuit=no
 autolearn=ham autolearn_force=no version=3.4.6
Received: from out29-198.mail.aliyun.com (out29-198.mail.aliyun.com
 [115.124.29.198])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F2A0DF803DD
 for <alsa-devel@alsa-project.org>; Tue, 13 Dec 2022 08:10:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F2A0DF803DD
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.07436261|-1; CH=green;
 DM=|CONTINUE|false|;
 DS=CONTINUE|ham_system_inform|0.00177895-5.05086e-05-0.998171;
 FP=0|0|0|0|0|-1|-1|-1; HT=ay29a033018047193; MF=wangweidong.a@awinic.com; NM=0;
 PH=DS; RN=18; RT=18; SR=0; TI=SMTPD_---.QUYNbJF_1670915428; 
Received: from ubuntu-VirtualBox..(mailfrom:wangweidong.a@awinic.com
 fp:SMTPD_---.QUYNbJF_1670915428) by smtp.aliyun-inc.com;
 Tue, 13 Dec 2022 15:10:36 +0800
From: wangweidong.a@awinic.com
To: amadeuszx.slawinski@linux.intel.com
Subject: Re: [PATCH V6 2/5] ASoC: codecs: Implementation of aw883xx
 configuration file parsing function
Date: Tue, 13 Dec 2022 15:10:27 +0800
Message-Id: <20221213071027.57095-1-wangweidong.a@awinic.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <c4b8651b-c190-8b3f-b41c-7143a885dba7@linux.intel.com>
References: <c4b8651b-c190-8b3f-b41c-7143a885dba7@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
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

On 12/8/2022 1:23 PM, wangweidong.a@awinic.com wrote:=0D
> From: Weidong Wang <wangweidong.a@awinic.com>=0D
> =0D
> The Awinic AW883XX is an I2S/TDM input, high efficiency=0D
> digital Smart K audio amplifier with an integrated 10.25V=0D
> smart boost convert=0D
> =0D
> Signed-off-by: Nick Li <liweilei@awinic.com>=0D
> Signed-off-by: Bruce zhao <zhaolei@awinic.com>=0D
> Signed-off-by: Weidong Wang <wangweidong.a@awinic.com>=0D
> ---=0D
>   sound/soc/codecs/aw883xx/aw883xx_bin_parse.c | 1324 ++++++++++++++++++=
=0D
>   sound/soc/codecs/aw883xx/aw883xx_bin_parse.h |  149 ++=0D
>   2 files changed, 1473 insertions(+)=0D
>   create mode 100644 sound/soc/codecs/aw883xx/aw883xx_bin_parse.c=0D
>   create mode 100644 sound/soc/codecs/aw883xx/aw883xx_bin_parse.h=0D
> =0D
> diff --git a/sound/soc/codecs/aw883xx/aw883xx_bin_parse.c b/sound/soc/cod=
ecs/aw883xx/aw883xx_bin_parse.c=0D
> new file mode 100644=0D
> index 000000000000..f3d9b8a9fdf2=0D
> --- /dev/null=0D
> +++ b/sound/soc/codecs/aw883xx/aw883xx_bin_parse.c=0D
> @@ -0,0 +1,1324 @@=0D
> +// SPDX-License-Identifier: GPL-2.0-only=0D
> +/*=0D
> + * aw_bin_parse.c  -- ALSA Soc AW883XX codec support=0D
=0D
> Soc -> SoC=0D
=0D
Thanks for your advice, I will modify it in patch v7=0D
=0D
> + *=0D
> + * Copyright (c) 2022 AWINIC Technology CO., LTD=0D
> + */=0D
> +=0D
> +#include <linux/cdev.h>=0D
> +#include <linux/delay.h>=0D
> +#include <linux/device.h>=0D
> +#include <linux/debugfs.h>=0D
> +#include <linux/firmware.h>=0D
> +#include <linux/hrtimer.h>=0D
> +#include <linux/input.h>=0D
> +#include <linux/i2c.h>=0D
> +#include <linux/interrupt.h>=0D
> +#include <linux/kernel.h>=0D
> +#include <linux/list.h>=0D
> +#include <linux/module.h>=0D
> +#include <linux/mutex.h>=0D
> +#include <linux/miscdevice.h>=0D
> +#include <linux/of_gpio.h>=0D
> +#include <linux/regmap.h>=0D
> +#include <linux/slab.h>=0D
> +#include <linux/string.h>=0D
> +#include <linux/timer.h>=0D
> +#include <linux/uaccess.h>=0D
> +#include <linux/version.h>=0D
> +#include <linux/workqueue.h>=0D
> +#include "aw883xx_bin_parse.h"=0D
> +=0D
> +#include <linux/clk.h>=0D
> +#include <linux/err.h>=0D
> +#include <linux/io.h>=0D
> +#include <linux/module.h>=0D
> +#include <linux/regmap.h>=0D
> +#include <linux/slab.h>=0D
> +#include <linux/swab.h>=0D
> +#include <linux/device.h>=0D
> +#include <linux/regmap.h>=0D
> +#include <linux/fs.h>=0D
> +#include <linux/list.h>=0D
> +#include <linux/wait.h>=0D
=0D
> Same as on patch 1, there seems to be quite a few unnecessary headers, =0D
> and this one even has duplicates.=0D
=0D
Thanks for your advice, I will modify it in patch v7=0D
=0D
> +=0D
> +static char *profile_name[AW_PROFILE_MAX] =3D {=0D
> +	"Music", "Voice", "Voip", "Ringtone",=0D
> +	"Ringtone_hs", "Lowpower", "Bypass",=0D
> +	"Mmi", "Fm", "Notification", "Receiver"=0D
> +};=0D
> +=0D
> +static int aw_parse_bin_header_1_0_0(struct aw_bin *bin);=0D
> +=0D
> +/*=0D
> + * Interface function=0D
> + *=0D
> + * return value:=0D
> + *       value =3D 0 :success;=0D
> + *       value =3D -1 :check bin header version=0D
> + *       value =3D -2 :check bin data type=0D
> + *       value =3D -3 :check sum or check bin data len error=0D
> + *       value =3D -4 :check data version=0D
> + *       value =3D -5 :check register num=0D
> + *       value =3D -6 :check dsp reg num=0D
> + *       value =3D -7 :check soc app num=0D
> + *       value =3D -8 :bin is NULL point=0D
> + *=0D
> + */=0D
> +=0D
> +/*=0D
> + * check sum data=0D
> + */=0D
> +static int aw_check_sum(struct aw_bin *bin, int bin_num)=0D
> +{=0D
> +	unsigned int i =3D 0;=0D
> +	unsigned int sum_data =3D 0;=0D
> +	unsigned int check_sum =3D 0;=0D
> +	unsigned char *p_check_sum =3D NULL;=0D
> +=0D
> +	p_check_sum =3D &(bin->info.data[(bin->header_info[bin_num].valid_data_=
addr -=0D
> +						bin->header_info[bin_num].header_len)]);=0D
> +=0D
> +	pr_debug("aw_bin_parse p_check_sum =3D %p\n", p_check_sum);=0D
> +=0D
> +	check_sum =3D le32_to_cpup((void *)p_check_sum);=0D
> +=0D
> +	for (i =3D 4; i < bin->header_info[bin_num].bin_data_len +=0D
> +					bin->header_info[bin_num].header_len; i++) {=0D
> +		sum_data +=3D *(p_check_sum + i);=0D
> +	}=0D
> +	pr_debug("aw_bin_parse bin_num =3D %d, check_sum =3D 0x%x, sum_data =3D=
 0x%x\n",=0D
> +						bin_num, check_sum, sum_data);=0D
> +	if (sum_data !=3D check_sum) {=0D
> +		p_check_sum =3D NULL;=0D
> No need to assign NULL to pointer?=0D
=0D
Thanks for your advice, I will modify it in patch v7=0D
=0D
> +		pr_err("%s. CheckSum Fail.bin_num=3D%d, CheckSum:0x%x, SumData:0x%x",=
=0D
> +				__func__, bin_num, check_sum, sum_data);=0D
> +		return -BIN_DATA_LEN_ERR;=0D
=0D
> Any reason to invent your own error codes, I went through few call paths =
=0D
> and you don't seem to use them anywhere, might as well return -EINVAL?=0D
=0D
I will modify it in patch v7=0D
=0D
> +	}=0D
> +	p_check_sum =3D NULL;=0D
=0D
> Same here, no need to set this to NULL?=0D
=0D
Thanks for your advice, I will modify it in patch v7=0D
=0D
> +=0D
> +	return 0;=0D
> +}=0D
> +=0D
> +static int aw_check_data_version(struct aw_bin *bin, int bin_num)=0D
> +{=0D
> +	if (bin->header_info[bin_num].bin_data_ver < DATA_VERSION_V1 ||=0D
> +		bin->header_info[bin_num].bin_data_ver > DATA_VERSION_MAX) {=0D
> +		pr_err("aw_bin_parse Unrecognized this bin data version\n");=0D
> +		return -DATA_VER_ERR;=0D
=0D
> Return -EINVAL?=0D
=0D
Thanks for your advice, I will modify it in patch v7=0D
=0D
> +	}=0D
> +=0D
> +	return 0;=0D
> +}=0D
> +=0D
> +static int aw_check_register_num_v1(struct aw_bin *bin, int bin_num)=0D
> +{=0D
> +	unsigned int check_register_num =3D 0;=0D
> +	unsigned int parse_register_num =3D 0;=0D
> +	unsigned char *p_check_sum =3D NULL;=0D
> +	struct bin_header_info temp_info;=0D
> +=0D
> +	temp_info =3D bin->header_info[bin_num];=0D
> +	p_check_sum =3D &(bin->info.data[(temp_info.valid_data_addr)]);=0D
> +	pr_debug("aw_bin_parse p_check_sum =3D %p\n", p_check_sum);=0D
> +	parse_register_num =3D le32_to_cpup((void *)p_check_sum);=0D
> +	check_register_num =3D (bin->header_info[bin_num].bin_data_len - 4) /=0D
> +				(bin->header_info[bin_num].reg_byte_len +=0D
> +				bin->header_info[bin_num].data_byte_len);=0D
> +	pr_debug("%s bin_num =3D %d,parse_register_num =3D 0x%x,check_register_=
num =3D 0x%x\n",=0D
> +				__func__, bin_num, parse_register_num, check_register_num);=0D
> +	if (parse_register_num !=3D check_register_num) {=0D
> +		p_check_sum =3D NULL;=0D
> Same weird pattern as in previous function.=0D
=0D
Thanks for your advice, I will modify it in patch v7=0D
=0D
> +		pr_err("%s bin_num =3D %d,parse_register_num =3D 0x%x,check_register_n=
um =3D 0x%x\n",=0D
> +				__func__, bin_num, parse_register_num, check_register_num);=0D
> +=0D
> +		return -REG_NUM_ERR;=0D
=0D
> -EINVAL?=0D
=0D
Thanks for your advice, I will return -EINVAL at patch v7=0D
=0D
> +	}=0D
> +	bin->header_info[bin_num].reg_num =3D parse_register_num;=0D
> +	bin->header_info[bin_num].valid_data_len =3D temp_info.bin_data_len - 4=
;=0D
> +	p_check_sum =3D NULL;=0D
=0D
> Again. I see that it is same in following function, I won't comment =0D
> them, but it should be also fixed there.=0D
=0D
Thanks for your advice, I will modify it in patch v7=0D
=0D
> +	bin->header_info[bin_num].valid_data_addr =3D temp_info.valid_data_addr=
 + 4;=0D
> +=0D
> +	return 0;=0D
> +}=0D
> +=0D
=0D
(...)=0D
=0D
> +=0D
> +static int aw_dev_parse_dev_default_type(struct aw_device *aw_dev,=0D
> +		struct aw_cfg_hdr *prof_hdr, struct aw_all_prof_info *all_prof_info)=0D
> +{=0D
> +	int i =3D 0;=0D
> +	int ret;=0D
> +	int sec_num =3D 0;=0D
> +	struct aw_cfg_dde *cfg_dde =3D=0D
> +		(struct aw_cfg_dde *)((char *)prof_hdr + prof_hdr->a_hdr_offset);=0D
> +=0D
> +	for (i =3D 0; i < prof_hdr->a_ddt_num; i++) {=0D
> +		if ((aw_dev->channel =3D=3D cfg_dde[i].dev_index) &&=0D
> +			(cfg_dde[i].type =3D=3D AW_DEV_DEFAULT_TYPE_ID)) {=0D
> +			if (cfg_dde[i].data_type !=3D ACF_SEC_TYPE_MONITOR) {=0D
=0D
> "if" containing another "if", you can just use &&, so:=0D
> if ((aw_dev->channel =3D=3D cfg_dde[i].dev_index) &&=0D
>	(cfg_dde[i].type =3D=3D AW_DEV_DEFAULT_TYPE_ID) &&=0D
>	(cfg_dde[i].data_type !=3D ACF_SEC_TYPE_MONITOR)) {=0D
> and then you can reduce one level of intendation here.=0D
=0D
Thanks for your advice, I will modify it in patch v7=0D
=0D
> +				if (cfg_dde[i].dev_profile >=3D AW_PROFILE_MAX) {=0D
> +					dev_err(aw_dev->dev, "dev_profile [%d] overflow",=0D
> +						cfg_dde[i].dev_profile);=0D
> +					return -EINVAL;=0D
> +				}=0D
> +				ret =3D aw_dev_parse_data_by_sec_type(aw_dev, prof_hdr, &cfg_dde[i],=
=0D
> +					&all_prof_info->prof_desc[cfg_dde[i].dev_profile]);=0D
> +				if (ret < 0) {=0D
> +					dev_err(aw_dev->dev, "parse failed");=0D
> +					return ret;=0D
> +				}=0D
> +				sec_num++;=0D
> +			}=0D
> +		}=0D
> +	}=0D
> +=0D
> +	if (sec_num =3D=3D 0) {=0D
> +		dev_err(aw_dev->dev, "get dev default type failed, get num[%d]", sec_n=
um);=0D
> +		return -EINVAL;=0D
> +	}=0D
> +=0D
> +	return 0;=0D
> +}=0D
> +=0D
> +static int aw_dev_cfg_get_vaild_prof(struct aw_device *aw_dev,=0D
> +				struct aw_all_prof_info all_prof_info)=0D
> +{=0D
> +	int i;=0D
> +	int num =3D 0;=0D
> +	struct aw_sec_data_desc *sec_desc =3D NULL;=0D
> +	struct aw_prof_desc *prof_desc =3D all_prof_info.prof_desc;=0D
> +	struct aw_prof_info *prof_info =3D &aw_dev->prof_info;=0D
> +=0D
> +	for (i =3D 0; i < AW_PROFILE_MAX; i++) {=0D
> +		if (prof_desc[i].prof_st =3D=3D AW_PROFILE_OK) {=0D
> +			sec_desc =3D prof_desc[i].sec_desc;=0D
> +			if ((sec_desc[AW_DATA_TYPE_REG].data !=3D NULL) &&=0D
> +				(sec_desc[AW_DATA_TYPE_REG].len !=3D 0) &&=0D
> +				(sec_desc[AW_DATA_TYPE_DSP_CFG].data !=3D NULL) &&=0D
> +				(sec_desc[AW_DATA_TYPE_DSP_CFG].len !=3D 0) &&=0D
> +				(sec_desc[AW_DATA_TYPE_DSP_FW].data !=3D NULL) &&=0D
> +				(sec_desc[AW_DATA_TYPE_DSP_FW].len !=3D 0)) {=0D
> +				prof_info->count++;=0D
> +			}=0D
> +		}=0D
> +	}=0D
> +=0D
> +	dev_dbg(aw_dev->dev, "get valid profile:%d", aw_dev->prof_info.count);=
=0D
> +=0D
> +	if (!prof_info->count) {=0D
> +		dev_err(aw_dev->dev, "no profile data");=0D
> +		return -EPERM;=0D
> +	}=0D
> +=0D
> +	prof_info->prof_desc =3D devm_kzalloc(aw_dev->dev,=0D
> +					prof_info->count * sizeof(struct aw_prof_desc),=0D
> +					GFP_KERNEL);=0D
> +	if (!prof_info->prof_desc) {=0D
> +		dev_err(aw_dev->dev, "prof_desc kzalloc failed");=0D
> +		return -ENOMEM;=0D
> +	}=0D
> +=0D
> +	for (i =3D 0; i < AW_PROFILE_MAX; i++) {=0D
> +		if (prof_desc[i].prof_st =3D=3D AW_PROFILE_OK) {=0D
> +			sec_desc =3D prof_desc[i].sec_desc;=0D
> +			if ((sec_desc[AW_DATA_TYPE_REG].data !=3D NULL) &&=0D
> +				(sec_desc[AW_DATA_TYPE_REG].len !=3D 0) &&=0D
> +				(sec_desc[AW_DATA_TYPE_DSP_CFG].data !=3D NULL) &&=0D
> +				(sec_desc[AW_DATA_TYPE_DSP_CFG].len !=3D 0) &&=0D
> +				(sec_desc[AW_DATA_TYPE_DSP_FW].data !=3D NULL) &&=0D
> +				(sec_desc[AW_DATA_TYPE_DSP_FW].len !=3D 0)) {=0D
> +				if (num >=3D prof_info->count) {=0D
> +					dev_err(aw_dev->dev, "get scene num[%d] overflow count[%d]",=0D
> +						num, prof_info->count);=0D
> +					return -ENOMEM;=0D
> +				}=0D
> +				prof_info->prof_desc[num] =3D prof_desc[i];=0D
> +				prof_info->prof_desc[num].id =3D i;=0D
> +				num++;=0D
> +			}=0D
> +		}=0D
> +	}=0D
> +=0D
> +	return 0;=0D
> +}=0D
> +=0D
> +static int aw_dev_load_cfg_by_hdr(struct aw_device *aw_dev,=0D
> +		struct aw_cfg_hdr *prof_hdr)=0D
> +{=0D
> +	int ret;=0D
> +	struct aw_all_prof_info *all_prof_info;=0D
> +=0D
> +	all_prof_info =3D devm_kzalloc(aw_dev->dev, sizeof(struct aw_all_prof_i=
nfo), GFP_KERNEL);=0D
> +	if (!all_prof_info)=0D
> +		return -ENOMEM;=0D
> +=0D
> +	ret =3D aw_dev_parse_dev_type(aw_dev, prof_hdr, all_prof_info);=0D
> +	if (ret < 0) {=0D
> +		goto exit;=0D
> +	} else if (ret =3D=3D AW_DEV_TYPE_NONE) {=0D
> +		dev_dbg(aw_dev->dev, "get dev type num is 0, parse default dev");=0D
> +		ret =3D aw_dev_parse_dev_default_type(aw_dev, prof_hdr, all_prof_info)=
;=0D
> +		if (ret < 0)=0D
> +			goto exit;=0D
> +	}=0D
> +=0D
> +	ret =3D aw_dev_cfg_get_vaild_prof(aw_dev, *all_prof_info);=0D
> +	if (ret < 0)=0D
> +		goto exit;=0D
> +=0D
> +	aw_dev->prof_info.prof_name_list =3D profile_name;=0D
> +exit:=0D
> +	devm_kfree(aw_dev->dev, all_prof_info);=0D
> +	return ret;=0D
> +}=0D
> +=0D
> +static int aw_dev_create_prof_name_list_v_1_0_0_0(struct aw_device *aw_d=
ev)=0D
> +{=0D
> +	struct aw_prof_info *prof_info =3D &aw_dev->prof_info;=0D
> +	struct aw_prof_desc *prof_desc =3D prof_info->prof_desc;=0D
> +	int i;=0D
> +=0D
> +	if (!prof_desc) {=0D
> +		dev_err(aw_dev->dev, "prof_desc is NULL");=0D
> +		return -EINVAL;=0D
> +	}=0D
> +=0D
> +	prof_info->prof_name_list =3D devm_kzalloc(aw_dev->dev,=0D
> +					prof_info->count * PROFILE_STR_MAX,=0D
> +					GFP_KERNEL);=0D
=0D
> You seem to be allocating an array here, consider devm_kcalloc instead?=0D
=0D
Thanks for your advice, I will modify it in patch v7=0D
=0D
> +	if (!prof_info->prof_name_list) {=0D
> +		dev_err(aw_dev->dev, "prof_name_list devm_kzalloc failed");=0D
> +		return -ENOMEM;=0D
> +	}=0D
> +=0D
> +	for (i =3D 0; i < prof_info->count; i++) {=0D
> +		prof_desc[i].id =3D i;=0D
> +		prof_info->prof_name_list[i] =3D prof_desc[i].prf_str;=0D
> +		dev_dbg(aw_dev->dev, "prof name is %s", prof_info->prof_name_list[i]);=
=0D
> +	}=0D
> +=0D
> +	return 0;=0D
> +}=0D
> +=0D
=0D
(...)=0D
=0D
> +=0D
> +static int aw_dev_load_cfg_by_hdr_v_1_0_0_0(struct aw_device *aw_dev,=0D
> +									struct aw_container *aw_cfg)=0D
> +{=0D
> +	struct aw_prof_info *prof_info =3D &aw_dev->prof_info;=0D
> +	struct aw_cfg_hdr *cfg_hdr =3D (struct aw_cfg_hdr *)aw_cfg->data;=0D
> +	int ret;=0D
> +=0D
> +	ret =3D aw_dev_parse_scene_count_v_1_0_0_0(aw_dev, aw_cfg, &prof_info->=
count);=0D
> +	if (ret < 0) {=0D
> +		dev_err(aw_dev->dev, "get scene count failed");=0D
> +		return ret;=0D
> +	}=0D
> +=0D
> +	prof_info->prof_desc =3D devm_kzalloc(aw_dev->dev,=0D
> +					prof_info->count * sizeof(struct aw_prof_desc),=0D
> +					GFP_KERNEL);=0D
=0D
> You seem to be allocating an array here, consider devm_kcalloc instead?=0D
=0D
Thanks for your advice, I will modify it in patch v7=0D
=0D
> +	if (!prof_info->prof_desc)=0D
> +		return -ENOMEM;=0D
> +=0D
> +	ret =3D aw_dev_parse_by_hdr_v_1_0_0_0(aw_dev, cfg_hdr);=0D
> +	if (ret < 0) {=0D
> +		dev_err(aw_dev->dev, " failed");=0D
> +		return ret;=0D
> +	}=0D
> +=0D
> +	ret =3D aw_dev_create_prof_name_list_v_1_0_0_0(aw_dev);=0D
> +	if (ret < 0) {=0D
> +		dev_err(aw_dev->dev, "create prof name list failed");=0D
> +		return ret;=0D
> +	}=0D
> +=0D
> +	return 0;=0D
> +}=0D
> +=0D
> +int aw883xx_dev_cfg_load(struct aw_device *aw_dev, struct aw_container *=
aw_cfg)=0D
> +{=0D
> +	struct aw_cfg_hdr *cfg_hdr =3D NULL;=0D
> +	int ret;=0D
> +=0D
> +	cfg_hdr =3D (struct aw_cfg_hdr *)aw_cfg->data;=0D
> +=0D
> +	switch (cfg_hdr->a_hdr_version) {=0D
> +	case AW_CFG_HDR_VER_0_0_0_1:=0D
> +		ret =3D aw_dev_load_cfg_by_hdr(aw_dev, cfg_hdr);=0D
> +		if (ret < 0) {=0D
> +			dev_err(aw_dev->dev, "hdr_cersion[0x%x] parse failed",=0D
> +						cfg_hdr->a_hdr_version);=0D
> +			return ret;=0D
> +		}=0D
> +		break;=0D
> +	case AW_CFG_HDR_VER_1_0_0_0:=0D
> +		ret =3D aw_dev_load_cfg_by_hdr_v_1_0_0_0(aw_dev, aw_cfg);=0D
> +		if (ret < 0) {=0D
> +			dev_err(aw_dev->dev, "hdr_cersion[0x%x] parse failed",=0D
> +						cfg_hdr->a_hdr_version);=0D
> +			return ret;=0D
> +		}=0D
> +		break;=0D
> +	default:=0D
> +		dev_err(aw_dev->dev, "unsupported hdr_version [0x%x]", cfg_hdr->a_hdr_=
version);=0D
> +		return -EINVAL;=0D
> +	}=0D
> +	aw_dev->fw_status =3D AW_DEV_FW_OK;=0D
> +	return 0;=0D
> +}=0D
> +=0D
> +static unsigned char aw_dev_crc8_check(unsigned char *data, unsigned int=
 data_size)=0D
> +{=0D
> +	u8 crc_value =3D 0x00;=0D
> +	u8 pdatabuf =3D 0;=0D
> +	int i;=0D
> +=0D
> +	while (data_size--) {=0D
> +		pdatabuf =3D *data++;=0D
> +		for (i =3D 0; i < 8; i++) {=0D
> +			/*if the lowest bit is 1*/=0D
> +			if ((crc_value ^ (pdatabuf)) & 0x01) {=0D
> +				/*Xor multinomial*/=0D
> +				crc_value ^=3D 0x18;=0D
> +				crc_value >>=3D 1;=0D
> +				crc_value |=3D 0x80;=0D
> +			} else {=0D
> +				crc_value >>=3D 1;=0D
> +			}=0D
> +			pdatabuf >>=3D 1;=0D
> +		}=0D
> +	}=0D
> +	return crc_value;=0D
> +}=0D
=0D
> There seems to be crc8 implementation in Linux already, any reason to =0D
> implement your own?=0D
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/i=
nclude/linux/crc8.h=0D
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/l=
ib/crc8.c=0D
=0D
Thanks for your advice, I will modify it in patch v7=0D
=0D
> +=0D
> +static int aw_dev_check_cfg_by_hdr(struct aw_container *aw_cfg)=0D
> +{=0D
> +	struct aw_cfg_hdr *cfg_hdr =3D NULL;=0D
> +	struct aw_cfg_dde *cfg_dde =3D NULL;=0D
> +	unsigned int end_data_offset =3D 0;=0D
> +	unsigned int act_data =3D 0;=0D
> +	unsigned int hdr_ddt_len =3D 0;=0D
> +	u8 act_crc8 =3D 0;=0D
> +	int i;=0D
> +=0D
> +	cfg_hdr =3D (struct aw_cfg_hdr *)aw_cfg->data;=0D
> +	/*check file type id is awinic acf file*/=0D
> +	if (cfg_hdr->a_id !=3D ACF_FILE_ID) {=0D
> +		pr_err("not acf type file");=0D
> +		return -EINVAL;=0D
> +	}=0D
> +=0D
> +	hdr_ddt_len =3D cfg_hdr->a_hdr_offset + cfg_hdr->a_ddt_size;=0D
> +	if (hdr_ddt_len > aw_cfg->len) {=0D
> +		pr_err("hdrlen with ddt_len [%d] overflow file size[%d]",=0D
> +		cfg_hdr->a_hdr_offset, aw_cfg->len);=0D
> +		return -EINVAL;=0D
> +	}=0D
> +=0D
> +	/*check data size*/=0D
> +	cfg_dde =3D (struct aw_cfg_dde *)((char *)aw_cfg->data + cfg_hdr->a_hdr=
_offset);=0D
> +	act_data +=3D hdr_ddt_len;=0D
> +	for (i =3D 0; i < cfg_hdr->a_ddt_num; i++)=0D
> +		act_data +=3D cfg_dde[i].data_size;=0D
> +=0D
> +	if (act_data !=3D aw_cfg->len) {=0D
> +		pr_err("act_data[%d] not equal to file size[%d]!",=0D
> +			act_data, aw_cfg->len);=0D
> +		return -EINVAL;=0D
> +	}=0D
> +=0D
> +	for (i =3D 0; i < cfg_hdr->a_ddt_num; i++) {=0D
> +		/* data check */=0D
> +		end_data_offset =3D cfg_dde[i].data_offset + cfg_dde[i].data_size;=0D
> +		if (end_data_offset > aw_cfg->len) {=0D
> +			pr_err("a_ddt_num[%d] end_data_offset[%d] overflow file size[%d]",=0D
> +				i, end_data_offset, aw_cfg->len);=0D
> +			return -EINVAL;=0D
> +		}=0D
> +=0D
> +		/* crc check */=0D
> +		act_crc8 =3D aw_dev_crc8_check(aw_cfg->data + cfg_dde[i].data_offset,=
=0D
> +									cfg_dde[i].data_size);=0D
> +		if (act_crc8 !=3D cfg_dde[i].data_crc) {=0D
> +			pr_err("a_ddt_num[%d] crc8 check failed, act_crc8:0x%x !=3D data_crc =
0x%x",=0D
> +				i, (u32)act_crc8, cfg_dde[i].data_crc);=0D
> +			return -EINVAL;=0D
> +		}=0D
> +	}=0D
> +=0D
> +	return 0;=0D
> +}=0D
> +=0D
> +static int aw_dev_check_acf_by_hdr_v_1_0_0_0(struct aw_container *aw_cfg=
)=0D
> +{=0D
> +	struct aw_cfg_hdr *cfg_hdr =3D NULL;=0D
> +	struct aw_cfg_dde_v_1_0_0_0 *cfg_dde =3D NULL;=0D
> +	unsigned int end_data_offset =3D 0;=0D
> +	unsigned int act_data =3D 0;=0D
> +	unsigned int hdr_ddt_len =3D 0;=0D
> +	u8 act_crc8 =3D 0;=0D
> +	int i;=0D
> +=0D
> +	cfg_hdr =3D (struct aw_cfg_hdr *)aw_cfg->data;=0D
> +=0D
> +	/*check file type id is awinic acf file*/=0D
> +	if (cfg_hdr->a_id !=3D ACF_FILE_ID) {=0D
> +		pr_err("not acf type file");=0D
> +		return -EINVAL;=0D
> +	}=0D
> +=0D
> +	hdr_ddt_len =3D cfg_hdr->a_hdr_offset + cfg_hdr->a_ddt_size;=0D
> +	if (hdr_ddt_len > aw_cfg->len) {=0D
> +		pr_err("hdrlen with ddt_len [%d] overflow file size[%d]",=0D
> +		cfg_hdr->a_hdr_offset, aw_cfg->len);=0D
> +		return -EINVAL;=0D
> +	}=0D
> +=0D
> +	/*check data size*/=0D
> +	cfg_dde =3D (struct aw_cfg_dde_v_1_0_0_0 *)((char *)aw_cfg->data + cfg_=
hdr->a_hdr_offset);=0D
> +	act_data +=3D hdr_ddt_len;=0D
> +	for (i =3D 0; i < cfg_hdr->a_ddt_num; i++)=0D
> +		act_data +=3D cfg_dde[i].data_size;=0D
> +=0D
> +	if (act_data !=3D aw_cfg->len) {=0D
> +		pr_err("act_data[%d] not equal to file size[%d]!",=0D
> +			act_data, aw_cfg->len);=0D
> +		return -EINVAL;=0D
> +	}=0D
> +=0D
> +	for (i =3D 0; i < cfg_hdr->a_ddt_num; i++) {=0D
> +		/* data check */=0D
> +		end_data_offset =3D cfg_dde[i].data_offset + cfg_dde[i].data_size;=0D
> +		if (end_data_offset > aw_cfg->len) {=0D
> +			pr_err("a_ddt_num[%d] end_data_offset[%d] overflow file size[%d]",=0D
> +				i, end_data_offset, aw_cfg->len);=0D
> +			return -EINVAL;=0D
> +		}=0D
> +=0D
> +		/* crc check */=0D
> +		act_crc8 =3D aw_dev_crc8_check(aw_cfg->data + cfg_dde[i].data_offset,=
=0D
> +							cfg_dde[i].data_size);=0D
> +		if (act_crc8 !=3D cfg_dde[i].data_crc) {=0D
> +			pr_err("a_ddt_num[%d] crc8 check failed, act_crc8:0x%x !=3D data_crc =
0x%x",=0D
> +				i, (u32)act_crc8, cfg_dde[i].data_crc);=0D
> +			return -EINVAL;=0D
> +		}=0D
> +	}=0D
> +=0D
> +	return 0;=0D
> +=0D
> +}=0D
> +=0D
> +int aw883xx_dev_load_acf_check(struct aw_container *aw_cfg)=0D
> +{=0D
> +	struct aw_cfg_hdr *cfg_hdr =3D NULL;=0D
> +=0D
> +	if (!aw_cfg) {=0D
> +		pr_err("aw_prof is NULL");=0D
> +		return -ENOMEM;=0D
> +	}=0D
> +=0D
> +	if (aw_cfg->len < sizeof(struct aw_cfg_hdr)) {=0D
> +		pr_err("cfg hdr size[%d] overflow file size[%d]",=0D
> +			aw_cfg->len, (int)sizeof(struct aw_cfg_hdr));=0D
> +		return -EINVAL;=0D
> +	}=0D
> +=0D
> +	cfg_hdr =3D (struct aw_cfg_hdr *)aw_cfg->data;=0D
> +	switch (cfg_hdr->a_hdr_version) {=0D
> +	case AW_CFG_HDR_VER_0_0_0_1:=0D
> +		return aw_dev_check_cfg_by_hdr(aw_cfg);=0D
> +	case AW_CFG_HDR_VER_1_0_0_0:=0D
> +		return aw_dev_check_acf_by_hdr_v_1_0_0_0(aw_cfg);=0D
> +	default:=0D
> +		pr_err("unsupported hdr_version [0x%x]", cfg_hdr->a_hdr_version);=0D
> +		return -EINVAL;=0D
> +	}=0D
> +=0D
> +	return 0;=0D
> +}=0D
> +=0D
> +int aw883xx_dev_get_profile_count(struct aw_device *aw_dev)=0D
> +{=0D
> +	if (!aw_dev) {=0D
> +		pr_err("aw_dev is NULL");=0D
> +		return -ENOMEM;=0D
> +	}=0D
> +=0D
> +	return aw_dev->prof_info.count;=0D
> +}=0D
> +=0D
> +int aw883xx_dev_check_profile_index(struct aw_device *aw_dev, int index)=
=0D
> +{=0D
> +	if ((index >=3D aw_dev->prof_info.count) || (index < 0))=0D
> +		return -EINVAL;=0D
> +	else=0D
> +		return 0;=0D
> +}=0D
=0D
> No need to do "else return 0;", you can just "return 0;" It looks bit =0D
> cleaner when it is:=0D
> {=0D
> if (check something)=0D
> 	return -EINVAL;=0D
>=0D
> return 0;=0D
> }=0D
=0D
Thanks for your advice, I will modify it in patch v7=0D
=0D
> +=0D
> +int aw883xx_dev_get_profile_index(struct aw_device *aw_dev)=0D
> +{=0D
> +	return aw_dev->set_prof;=0D
> +}=0D
> +=0D
> +int aw883xx_dev_set_profile_index(struct aw_device *aw_dev, int index)=0D
> +{=0D
> +	struct aw_prof_desc *prof_desc =3D NULL;=0D
> +=0D
> +	if ((index < aw_dev->prof_info.count) && (index >=3D 0)) {=0D
> +		aw_dev->set_prof =3D index;=0D
> +		prof_desc =3D &aw_dev->prof_info.prof_desc[index];=0D
> +=0D
> +		dev_dbg(aw_dev->dev, "set prof[%s]",=0D
> +			aw_dev->prof_info.prof_name_list[prof_desc->id]);=0D
> +	} else {=0D
> +		return -EINVAL;=0D
> +	}=0D
> +=0D
> +	return 0;=0D
> +}=0D
=0D
> Similarly here, you can just check before hand and success path later:=0D
> if ((index >=3D aw_dev->prof_info.count) || (index < 0))=0D
>	return -EINVAL;=0D
>=0D
> aw_dev->set_prof =3D index;=0D
> ...=0D
> return 0;=0D
=0D
Thanks for your advice, I will modify it in patch v7=0D
=0D
> +=0D
> +char *aw_dev_get_prof_name(struct aw_device *aw_dev, int index)=0D
> +{=0D
> +	struct aw_prof_desc *prof_desc =3D NULL;=0D
> +	struct aw_prof_info *prof_info =3D &aw_dev->prof_info;=0D
> +=0D
> +	if ((index >=3D aw_dev->prof_info.count) || (index < 0)) {=0D
> +		dev_err(aw_dev->dev, "index[%d] overflow count[%d]",=0D
> +			index, aw_dev->prof_info.count);=0D
> +		return NULL;=0D
> +	}=0D
> +=0D
> +	prof_desc =3D &aw_dev->prof_info.prof_desc[index];=0D
> +=0D
> +	return prof_info->prof_name_list[prof_desc->id];=0D
> +}=0D
> +=0D
> +int aw883xx_dev_get_prof_data(struct aw_device *aw_dev, int index,=0D
> +			struct aw_prof_desc **prof_desc)=0D
> +{=0D
> +	if ((index >=3D aw_dev->prof_info.count) || (index < 0)) {=0D
> +		dev_err(aw_dev->dev, "%s: index[%d] overflow count[%d]\n",=0D
> +			__func__, index, aw_dev->prof_info.count);=0D
> +		return -EINVAL;=0D
> +	}=0D
> +=0D
> +	*prof_desc =3D &aw_dev->prof_info.prof_desc[index];=0D
> +=0D
> +	return 0;=0D
> +}=0D
> +=0D
> diff --git a/sound/soc/codecs/aw883xx/aw883xx_bin_parse.h b/sound/soc/cod=
ecs/aw883xx/aw883xx_bin_parse.h=0D
> new file mode 100644=0D
> index 000000000000..7f5ce0b1f899=0D
> --- /dev/null=0D
> +++ b/sound/soc/codecs/aw883xx/aw883xx_bin_parse.h=0D
> @@ -0,0 +1,149 @@=0D
> +/* SPDX-License-Identifier: GPL-2.0-only */=0D
> +/*=0D
> + * aw883xx.c --  ALSA Soc AW883XX codec support=0D
=0D
> Soc -> SoC=0D
=0D
Thanks for your advice, I will modify it in patch v7=0D
=0D
> + *=0D
> + * Copyright (c) 2022 AWINIC Technology CO., LTD=0D
> + *=0D
> + * Author: Bruce zhao <zhaolei@awinic.com>=0D
> + */=0D
> +=0D
> +#ifndef __AW883XX_BIN_PARSE_H__=0D
> +#define __AW883XX_BIN_PARSE_H__=0D
> +=0D
> +#include "aw883xx_device.h"=0D
> +=0D
> +#define BIN_NUM_MAX				(100)=0D
> +#define HEADER_LEN				(60)=0D
> +#define CHECK_SUM_OFFSET		(0)=0D
> +#define HEADER_VER_OFFSET		(4)=0D
> +#define	BIN_DATA_TYPE_OFFSET	(8)=0D
> +#define	BIN_DATA_VER_OFFSET		(12)=0D
> +#define	BIN_DATA_LEN_OFFSET		(16)=0D
> +#define	UI_VER_OFFSET			(20)=0D
> +#define CHIP_TYPE_OFFSET		(24)=0D
> +#define	REG_BYTE_LEN_OFFSET		(32)=0D
> +#define	DATA_BYTE_LEN_OFFSET	(36)=0D
> +#define	DEVICE_ADDR_OFFSET		(40)=0D
> +=0D
> +#define AW_FW_CHECK_PART		(10)=0D
> +=0D
> +/*=0D
> + * header information=0D
> + */=0D
> +enum return_enum {=0D
> +	BIN_HEADER_VER_ERR =3D 1,=0D
> +	BIN_DATA_TYPE_ERR =3D 2,=0D
> +	BIN_DATA_LEN_ERR =3D 3,=0D
> +	DATA_VER_ERR =3D 4,=0D
> +	REG_NUM_ERR =3D 5,=0D
> +	DSP_REG_NUM_ERR =3D 6,=0D
> +	SOC_APP_NUM_ERR =3D 7,=0D
> +	BIN_IS_NULL =3D 8,=0D
> +};=0D
=0D
> As mentioned in the beginning, do you even need your own error values, =0D
> they seem to be just passed up to be later converted to -EINVAL, might =0D
> as well return -EINVAL directly.=0D
=0D
Thanks for your advice, I will modify it in patch v7=0D
=0D
> +=0D
> +enum bin_header_version_enum {=0D
> +	HEADER_VERSION_1_0_0 =3D 0x01000000,=0D
> +};=0D
> +=0D
> +enum data_type_enum {=0D
> +	DATA_TYPE_REGISTER =3D 0x00000000,=0D
> +	DATA_TYPE_DSP_REG =3D 0x00000010,=0D
> +	DATA_TYPE_DSP_CFG =3D 0x00000011,=0D
> +	DATA_TYPE_SOC_REG =3D 0x00000020,=0D
> +	DATA_TYPE_SOC_APP =3D 0x00000021,=0D
> +	DATA_TYPE_DSP_FW =3D DATA_TYPE_SOC_APP,=0D
> +	DATA_TYPE_MULTI_BINS =3D 0x00002000,=0D
> +};=0D
> +=0D
> +/**=0D
> + * @DATA_VERSION_V1=EF=BC=9Adefault little edian=0D
> + */=0D
> +enum data_version_enum {=0D
> +	DATA_VERSION_V1 =3D 0X00000001,=0D
> +	DATA_VERSION_MAX,=0D
> +};=0D
> +=0D
> +/**=0D
> + * @header_len: Frame header length=0D
> + * @check_sum: Frame header information-Checksum=0D
> + * @header_ver: Frame header information-Frame header version=0D
> + * @bin_data_type: Frame header information-Data type=0D
> + * @bin_data_ver: Frame header information-Data version=0D
> + * @bin_data_len: Frame header information-Data length=0D
> + * @ui_ver: Frame header information-ui version=0D
> + * @chip_type[8]: Frame header information-chip type=0D
> + * @reg_byte_len: Frame header information-reg byte len=0D
> + * @data_byte_len: Frame header information-data byte len=0D
> + * @device_addr: Frame header information-device addr=0D
> + * @valid_data_len: Length of valid data obtained after parsing=0D
> + * @valid_data_addr: The offset address of the valid data obtained=0D
> + *                   after parsing relative to info=0D
> + * @reg_num: The number of registers obtained after parsing=0D
> + * @reg_data_byte_len: The byte length of the register obtained after pa=
rsing=0D
> + * @download_addr: The starting address or download address obtained=0D
> + *                 after parsing=0D
> + * @app_version: The software version number obtained after parsing=0D
> + */=0D
> +struct bin_header_info {=0D
> +	unsigned int header_len;=0D
> +	unsigned int check_sum;=0D
> +	unsigned int header_ver;=0D
> +	unsigned int bin_data_type;=0D
> +	unsigned int bin_data_ver;=0D
> +	unsigned int bin_data_len;=0D
> +	unsigned int ui_ver;=0D
> +	unsigned char chip_type[8];=0D
> +	unsigned int reg_byte_len;=0D
> +	unsigned int data_byte_len;=0D
> +	unsigned int device_addr;=0D
> +	unsigned int valid_data_len;=0D
> +	unsigned int valid_data_addr;=0D
> +=0D
> +	unsigned int reg_num;=0D
> +	unsigned int reg_data_byte_len;=0D
> +	unsigned int download_addr;=0D
> +	unsigned int app_version;=0D
> +};=0D
> +=0D
> +/*=0D
> + * @len: The size of the bin file obtained from the firmware=0D
> + * @data[]: Store the bin file obtained from the firmware=0D
> + */=0D
> +struct bin_container {=0D
> +	unsigned int len;=0D
> +	unsigned char data[];=0D
> +};=0D
> +=0D
> +/**=0D
> + * @p_addr: Offset pointer (backward offset pointer to obtain frame head=
er=0D
> + *          information and important information)=0D
> + * @all_bin_parse_num: The number of all bin files=0D
> + * @multi_bin_parse_num: The number of single bin files=0D
> + * @single_bin_parse_num: The number of multiple bin files=0D
> + * @header_info[BIN_NUM_MAX]: Frame header information and other importa=
nt data=0D
> + *                            obtained after parsing=0D
> + * @info: Obtained bin file data that needs to be parsed=0D
> + */=0D
> +struct aw_bin {=0D
> +	unsigned char *p_addr;=0D
> +	unsigned int all_bin_parse_num;=0D
> +	unsigned int multi_bin_parse_num;=0D
> +	unsigned int single_bin_parse_num;=0D
> +	struct bin_header_info header_info[BIN_NUM_MAX];=0D
> +	struct bin_container info;=0D
> +};=0D
> +=0D
> +/*******************awinic audio parse acf***********************/=0D
> +int aw883xx_dev_dsp_data_order(struct aw_device *aw_dev,=0D
> +				unsigned char *data, unsigned int data_len);=0D
> +int aw883xx_dev_get_prof_data(struct aw_device *aw_dev, int index,=0D
> +			struct aw_prof_desc **prof_desc);=0D
> +char *aw_dev_get_prof_name(struct aw_device *aw_dev, int index);=0D
> +int aw883xx_dev_set_profile_index(struct aw_device *aw_dev, int index);=
=0D
> +int aw883xx_dev_get_profile_index(struct aw_device *aw_dev);=0D
> +int aw883xx_dev_check_profile_index(struct aw_device *aw_dev, int index)=
;=0D
> +int aw883xx_dev_get_profile_count(struct aw_device *aw_dev);=0D
> +int aw883xx_dev_cfg_load(struct aw_device *aw_dev, struct aw_container *=
aw_cfg);=0D
> +int aw883xx_dev_load_acf_check(struct aw_container *aw_cfg);=0D
> +=0D
> +#endif=
