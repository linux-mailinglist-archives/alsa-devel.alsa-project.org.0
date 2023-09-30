Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C0427B3F06
	for <lists+alsa-devel@lfdr.de>; Sat, 30 Sep 2023 10:10:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8C208F00;
	Sat, 30 Sep 2023 10:09:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8C208F00
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1696061441;
	bh=ZJgnicUSd9EpnP293O3Fi2NVqfTX0cToacn5iBWsqbQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=uxZdv0opxWOWn8JFh94XQI/7jVPl01Yx7ZN38qWndp3T3/Nne0cgiVH3+lq/KQ5d0
	 6ZoniwxqtxrL1yDvhLyKraoOjVlw4YZ92gYzz7Xh/kbesl6t8RmZfdMLfCawmdvJ9z
	 8eG3pUlqLHVswNmfq+VydHwWkQo4zEqyKa9D6tEM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AE238F8068E; Sat, 30 Sep 2023 10:07:35 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9CFBCF80564;
	Sat, 30 Sep 2023 10:07:34 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CB1DEF8016A; Wed, 27 Sep 2023 16:32:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 06994F800AA
	for <alsa-devel@alsa-project.org>; Wed, 27 Sep 2023 16:32:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 06994F800AA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=vxvQgjvr
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-31f737b8b69so9817191f8f.3
        for <alsa-devel@alsa-project.org>;
 Wed, 27 Sep 2023 07:32:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695825132; x=1696429932;
 darn=alsa-project.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1J+yaSMFmVZfIARwt5H97JhAGmtyhiEPIa1h+fAEOWs=;
        b=vxvQgjvr+f7gzunEZsTlP7HqXvwclWLVugI9Q/vmTayY9/eOLnRWjm0MbbR89fzxjp
         2vu/b9TE+zEtTXXl7QjZVPg6GfsJFhxEBa+2dRz7mDZDH+yGNdoXGoGUteBwMexYZORJ
         vBNxwCwxViJAnCWpBGg2OgKkiyYNJhwgjeGF454T17qyowxebp7BMSI27wg00VFMxvLf
         V0/JvjMuEKV+ZVhOTrhpUNWnz6ostMB+3TTmKvbRTRFVdUJgUbBCr7eiV1XlpIcOJf8u
         raXF7jHOn47t6Vpi2nKaX0Mxv4MD3XeIYVGznCNz1HosHcaxtLrzH5h8GRjigasbJqQ+
         QNwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695825132; x=1696429932;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1J+yaSMFmVZfIARwt5H97JhAGmtyhiEPIa1h+fAEOWs=;
        b=Vjxjg77xW6UDUIVUUnmJI1LltBWQc9NShOLOy8/Sl2iGMehFwy2ErjwTGoPARe5xA0
         2W2vDubSoesVcggJhAdLuayER5ZtuPs1rhwPOtRcnQsHD5v3wEltd6BC5dusKtRc/ucT
         mzzD9yLP/D3i36BDCFdakd86rl/aN05hg8ct06C6t6fpMLf5iez1VI6/XIezDlrf7Xdk
         4WjMFbU9aLxxMBq8N4wqe4Vr2qm9HjPZcEblxN/wLT0VlfnavTtKHuunlA53/8Cb6uvB
         xu44s59TPk+UOAE/R8o4iq4x+pONHLPLcOXztHBX6JDP4OfJb9XWhgy+F8uli9nutd4h
         pEPA==
X-Gm-Message-State: AOJu0YxWLy8Y7CBOupu7Cw3V9fK0Z2ktaheFlXNDgQhKIDX1Dox5OtRW
	YZl4cdPGNTvXPpPiDpjvuBidXA==
X-Google-Smtp-Source: 
 AGHT+IFsPFiVT5s/R+2Pg6SRuXnaQKsAUppG720Vzu5kvzuYl5QQ7Rr7viP3+Q3bM9r9FHI8NizDHA==
X-Received: by 2002:a5d:694e:0:b0:31f:fa66:5852 with SMTP id
 r14-20020a5d694e000000b0031ffa665852mr1790547wrw.21.1695825131690;
        Wed, 27 Sep 2023 07:32:11 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id
 s23-20020adf9797000000b003247f732c11sm550137wrb.76.2023.09.27.07.32.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Sep 2023 07:32:10 -0700 (PDT)
Date: Wed, 27 Sep 2023 17:31:54 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: wangweidong.a@awinic.com
Cc: lgirdwood@gmail.com, broonie@kernel.org, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
	perex@perex.cz, tiwai@suse.com, shumingf@realtek.com,
	rf@opensource.cirrus.com, herve.codina@bootlin.com, arnd@arndb.de,
	13916275206@139.com, ryans.lee@analog.com, linus.walleij@linaro.org,
	ckeepax@opensource.cirrus.com, doug@schmorgal.com,
	fido_max@inbox.ru, harshit.m.mogalapalli@oracle.com,
	liweilei@awinic.com, yang.lee@linux.alibaba.com,
	u.kleine-koenig@pengutronix.de, yijiangtao@awinic.com,
	colin.i.king@gmail.com, trix@redhat.com,
	alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH V5 8/8] ASoC: codecs: Add aw87390 amplifier driver
Message-ID: <464ada20-072d-48f8-a270-155dfd4a06b9@kadam.mountain>
References: <20230927121634.94822-1-wangweidong.a@awinic.com>
 <20230927121634.94822-9-wangweidong.a@awinic.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230927121634.94822-9-wangweidong.a@awinic.com>
X-MailFrom: dan.carpenter@linaro.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: 756JB2QBIYIS37DZTXI35B5GZHJB6ESU
X-Message-ID-Hash: 756JB2QBIYIS37DZTXI35B5GZHJB6ESU
X-Mailman-Approved-At: Sat, 30 Sep 2023 08:07:27 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/756JB2QBIYIS37DZTXI35B5GZHJB6ESU/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

I just had a few nits.  Sorry to complain about such minor things in a
v5 patch.

On Wed, Sep 27, 2023 at 08:16:34PM +0800, wangweidong.a@awinic.com wrote:
> @@ -668,6 +668,17 @@ config SND_SOC_AW88261
>  	  boost converter can be adjusted smartly according to
>  	  the input amplitude.
>  
> +config SND_SOC_AW87390
> +	tristate "Soc Audio for awinic aw87390"

Capitalize A in Awinic.

> +	depends on I2C
> +	select REGMAP_I2C
> +	select SND_SOC_AW88395_LIB
> +	help
> +	  The awinic aw87390 is specifically designed to improve
> +	  the musical output dynamic range, enhance the overall
> +	  sound quallity, which is a new high efficiency, low

s/quallity/quality/.

> +	  noise, constant large volume, 6th Smart K audio amplifier.
> +
>  config SND_SOC_BD28623
>  	tristate "ROHM BD28623 CODEC"
>  	help

[ snip ]

> diff --git a/sound/soc/codecs/aw87390.c b/sound/soc/codecs/aw87390.c
> new file mode 100644
> index 000000000000..8efae3b73eea
> --- /dev/null
> +++ b/sound/soc/codecs/aw87390.c
> @@ -0,0 +1,462 @@
> +// SPDX-License-Identifier: GPL-2.0-only

Checkpatch complains about this.  It should just be GPL-2.0, the "only"
is assumed unless there is a + as in "GPL-2.0+".  You might want to
run scripts/checkpatch.pl --strict on your patch.

> +//
> +// aw87390.c  --  AW87390 ALSA SoC Audio driver
> +//
> +// Copyright (c) 2023 awinic Technology CO., LTD
> +//
> +// Author: Weidong Wang <wangweidong.a@awinic.com>
> +//
> +
> +#include <linux/i2c.h>
> +#include <linux/firmware.h>
> +#include <linux/regmap.h>
> +#include <sound/soc.h>
> +#include "aw87390.h"
> +#include "aw88395/aw88395_data_type.h"
> +#include "aw88395/aw88395_device.h"
> +
> +static const struct regmap_config aw87390_remap_config = {
> +	.val_bits = 8,
> +	.reg_bits = 8,
> +	.max_register = AW87390_REG_MAX,
> +	.reg_format_endian = REGMAP_ENDIAN_LITTLE,
> +	.val_format_endian = REGMAP_ENDIAN_BIG,
> +};
> +
> +static int aw87390_dev_reg_update(struct aw_device *aw_dev,
> +					unsigned char *data, unsigned int len)
> +{
> +	int i, ret;
> +
> +	if (!data) {
> +		dev_err(aw_dev->dev, "data is NULL\n");
> +		return -EINVAL;
> +	}
> +
> +	for (i = 0; i < len; i = i + 2) {
> +		if (data[i] == AW87390_DELAY_REG_ADDR) {
> +			usleep_range(data[i + 1] * AW87390_REG_DELAY_TIME,
> +					data[i + 1] * AW87390_REG_DELAY_TIME + 10);
> +			continue;
> +		}
> +		ret = regmap_write(aw_dev->regmap, data[i], data[i + 1]);

This assumes that len is an even number...  Maybe write it as:

	for (i = 0; i < len - 1; i += 2) {

Although that assumes len can't be zero so maybe it's not a win...

> +		if (ret)
> +			return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static int aw87390_dev_get_prof_name(struct aw_device *aw_dev, int index, char **prof_name)
> +{
> +	struct aw_prof_info *prof_info = &aw_dev->prof_info;
> +	struct aw_prof_desc *prof_desc;
> +
> +	if ((index >= aw_dev->prof_info.count) || (index < 0)) {
> +		dev_err(aw_dev->dev, "index[%d] overflow count[%d]\n",
> +			index, aw_dev->prof_info.count);
> +		return -EINVAL;
> +	}
> +
> +	prof_desc = &aw_dev->prof_info.prof_desc[index];
> +
> +	*prof_name = prof_info->prof_name_list[prof_desc->id];
> +
> +	return 0;
> +}
> +
> +static int aw87390_dev_get_prof_data(struct aw_device *aw_dev, int index,
> +			struct aw_prof_desc **prof_desc)
> +{
> +	if ((index >= aw_dev->prof_info.count) || (index < 0)) {
> +		dev_err(aw_dev->dev, "%s: index[%d] overflow count[%d]\n",
> +				__func__, index, aw_dev->prof_info.count);
> +		return -EINVAL;
> +	}
> +
> +	*prof_desc = &aw_dev->prof_info.prof_desc[index];
> +
> +	return 0;
> +}
> +
> +static int aw87390_dev_fw_update(struct aw_device *aw_dev)
> +{
> +	struct aw_prof_desc *prof_index_desc;
> +	struct aw_sec_data_desc *sec_desc;
> +	char *prof_name;
> +	int ret;
> +
> +	ret = aw87390_dev_get_prof_name(aw_dev, aw_dev->prof_index, &prof_name);
> +	if (ret) {
> +		dev_err(aw_dev->dev, "get prof name failed\n");
> +		return -EINVAL;
> +	}
> +
> +	dev_dbg(aw_dev->dev, "start update %s", prof_name);
> +
> +	ret = aw87390_dev_get_prof_data(aw_dev, aw_dev->prof_index, &prof_index_desc);
> +	if (ret) {
> +		dev_err(aw_dev->dev, "aw87390_dev_get_prof_data failed\n");
> +		return ret;
> +	}
> +
> +	/* update reg */
> +	sec_desc = prof_index_desc->sec_desc;
> +	ret = aw87390_dev_reg_update(aw_dev, sec_desc[AW88395_DATA_TYPE_REG].data,
> +					sec_desc[AW88395_DATA_TYPE_REG].len);
> +	if (ret) {
> +		dev_err(aw_dev->dev, "update reg failed\n");
> +		return ret;
> +	}
> +
> +	aw_dev->prof_cur = aw_dev->prof_index;
> +
> +	return ret;

Just "return 0;" here.  It's the same but zero is more clear.

> +}
> +
> +static int aw87390_power_off(struct aw_device *aw_dev)
> +{
> +	int ret;
> +
> +	if (aw_dev->status == AW87390_DEV_PW_OFF) {
> +		dev_info(aw_dev->dev, "already power off\n");
> +		return 0;
> +	}
> +
> +	ret = regmap_write(aw_dev->regmap, AW87390_SYSCTRL_REG, AW87390_POWER_DOWN_VALUE);
> +	if (ret)
> +		return ret;
> +	aw_dev->status = AW87390_DEV_PW_OFF;
> +
> +	return ret;

return 0;

> +}
> +
> +static int aw87390_power_on(struct aw_device *aw_dev)
> +{
> +	int ret;
> +
> +	if (aw_dev->status == AW87390_DEV_PW_ON) {
> +		dev_info(aw_dev->dev, "already power on\n");

Change this dev_info() to dev_dbg().

> +		return 0;
> +	}
> +
> +	if (!aw_dev->fw_status) {
> +		dev_err(aw_dev->dev, "fw not load\n");
> +		return -EINVAL;
> +	}
> +
> +	ret = regmap_write(aw_dev->regmap, AW87390_SYSCTRL_REG, AW87390_POWER_DOWN_VALUE);
> +	if (ret)
> +		return ret;
> +
> +	ret = aw87390_dev_fw_update(aw_dev);
> +	if (ret) {
> +		dev_err(aw_dev->dev, "%s load profile failed\n", __func__);
> +		return ret;
> +	}
> +	aw_dev->status = AW87390_DEV_PW_ON;
> +
> +	return ret;

return 0;

> +}
> +
> +static int aw87390_dev_set_profile_index(struct aw_device *aw_dev, int index)
> +{
> +	if ((index >= aw_dev->prof_info.count) || (index < 0))
> +		return -EINVAL;
> +
> +	if (aw_dev->prof_index == index)
> +		return -EPERM;
> +
> +	aw_dev->prof_index = index;
> +
> +	return 0;
> +}
> +
> +static int aw87390_profile_info(struct snd_kcontrol *kcontrol,
> +			 struct snd_ctl_elem_info *uinfo)
> +{
> +	struct snd_soc_component *codec = snd_soc_kcontrol_component(kcontrol);
> +	struct aw87390 *aw87390 = snd_soc_component_get_drvdata(codec);
> +	char *prof_name, *name;
> +	int count, ret;
> +
> +	uinfo->type = SNDRV_CTL_ELEM_TYPE_ENUMERATED;
> +	uinfo->count = 1;
> +
> +	count = aw87390->aw_pa->prof_info.count;
> +	if (count <= 0) {
> +		uinfo->value.enumerated.items = 0;
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
> +	ret = aw87390_dev_get_prof_name(aw87390->aw_pa, count, &prof_name);
> +	if (ret) {
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
> +static int aw87390_profile_get(struct snd_kcontrol *kcontrol,
> +			struct snd_ctl_elem_value *ucontrol)
> +{
> +	struct snd_soc_component *codec = snd_soc_kcontrol_component(kcontrol);
> +	struct aw87390 *aw87390 = snd_soc_component_get_drvdata(codec);
> +
> +	ucontrol->value.integer.value[0] = aw87390->aw_pa->prof_index;
> +
> +	return 0;
> +}
> +
> +static int aw87390_profile_set(struct snd_kcontrol *kcontrol,
> +		struct snd_ctl_elem_value *ucontrol)
> +{
> +	struct snd_soc_component *codec = snd_soc_kcontrol_component(kcontrol);
> +	struct aw87390 *aw87390 = snd_soc_component_get_drvdata(codec);
> +	int ret;
> +
> +	mutex_lock(&aw87390->lock);
> +	ret = aw87390_dev_set_profile_index(aw87390->aw_pa, ucontrol->value.integer.value[0]);
> +	if (ret) {
> +		dev_dbg(codec->dev, "profile index does not change\n");
> +		mutex_unlock(&aw87390->lock);
> +		return 0;
> +	}
> +
> +	if (aw87390->aw_pa->status == AW87390_DEV_PW_ON) {
> +		aw87390_power_off(aw87390->aw_pa);
> +		aw87390_power_on(aw87390->aw_pa);
> +	}
> +
> +	mutex_unlock(&aw87390->lock);
> +
> +	return 1;
> +}
> +
> +static const struct snd_kcontrol_new aw87390_controls[] = {
> +	AW87390_PROFILE_EXT("AW87390 Profile Set", aw87390_profile_info,
> +		aw87390_profile_get, aw87390_profile_set),
> +};
> +
> +static int aw87390_request_firmware_file(struct aw87390 *aw87390)
> +{
> +	const struct firmware *cont = NULL;
> +	int ret;
> +
> +	aw87390->aw_pa->fw_status = AW87390_DEV_FW_FAILED;
> +
> +	ret = request_firmware(&cont, AW87390_ACF_FILE, aw87390->aw_pa->dev);
> +	if (ret)
> +		return dev_err_probe(aw87390->aw_pa->dev, ret,
> +					"load [%s] failed!\n", AW87390_ACF_FILE);
> +
> +	dev_dbg(aw87390->aw_pa->dev, "loaded %s - size: %zu\n",
> +			AW87390_ACF_FILE, cont ? cont->size : 0);
> +
> +	aw87390->aw_cfg = devm_kzalloc(aw87390->aw_pa->dev, cont->size + sizeof(int), GFP_KERNEL);

Use struct_size().

	aw87390->aw_cfg = devm_kzalloc(aw87390->aw_pa->dev,
				       struct_size(aw87390->aw_cfg, data, cont->size),
				       GFP_KERNEL);


> +	if (!aw87390->aw_cfg) {
> +		release_firmware(cont);
> +		return -ENOMEM;
> +	}
> +
> +	aw87390->aw_cfg->len = (int)cont->size;

No need for this scary looking cast.

> +	memcpy(aw87390->aw_cfg->data, cont->data, cont->size);
> +	release_firmware(cont);
> +
> +	ret = aw88395_dev_load_acf_check(aw87390->aw_pa, aw87390->aw_cfg);
> +	if (ret) {
> +		dev_err(aw87390->aw_pa->dev, "load [%s] failed !\n", AW87390_ACF_FILE);

No space before !.

> +		return ret;
> +	}
> +
> +	mutex_lock(&aw87390->lock);
> +
> +	ret = aw88395_dev_cfg_load(aw87390->aw_pa, aw87390->aw_cfg);
> +	if (ret)
> +		dev_err(aw87390->aw_pa->dev, "aw_dev acf parse failed\n");
> +
> +	mutex_unlock(&aw87390->lock);
> +
> +	return ret;
> +}
> +
> +static int aw87390_drv_event(struct snd_soc_dapm_widget *w,
> +				struct snd_kcontrol *kcontrol, int event)
> +{
> +	struct snd_soc_component *component = snd_soc_dapm_to_component(w->dapm);
> +	struct aw87390 *aw87390 = snd_soc_component_get_drvdata(component);
> +	struct aw_device *aw_dev = aw87390->aw_pa;
> +	int ret;
> +
> +	switch (event) {
> +	case SND_SOC_DAPM_PRE_PMU:
> +		ret = aw87390_power_on(aw_dev);
> +		break;
> +	case SND_SOC_DAPM_POST_PMD:
> +		ret = aw87390_power_off(aw_dev);
> +		break;
> +	default:
> +		dev_err(aw_dev->dev, "%s: invalid event %d\n", __func__, event);
> +		ret = -EINVAL;
> +	}
> +
> +	return ret;
> +}
> +
> +static const struct snd_soc_dapm_widget aw87390_dapm_widgets[] = {
> +	SND_SOC_DAPM_INPUT("IN"),
> +	SND_SOC_DAPM_PGA_E("SPK PA", SND_SOC_NOPM, 0, 0, NULL, 0, aw87390_drv_event,
> +			       SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMD),
> +	SND_SOC_DAPM_OUTPUT("OUT"),
> +};
> +
> +static const struct snd_soc_dapm_route aw87390_dapm_routes[] = {
> +	{ "SPK PA", NULL, "IN" },
> +	{ "OUT", NULL, "SPK PA" },
> +};
> +
> +static int aw87390_codec_probe(struct snd_soc_component *component)
> +{
> +	struct aw87390 *aw87390 = snd_soc_component_get_drvdata(component);
> +	int ret;
> +
> +	ret = aw87390_request_firmware_file(aw87390);
> +	if (ret)
> +		return dev_err_probe(aw87390->aw_pa->dev, ret,
> +				"aw87390_request_firmware_file failed\n");
> +
> +	return 0;
> +}
> +
> +static const struct snd_soc_component_driver soc_codec_dev_aw87390 = {
> +	.probe = aw87390_codec_probe,
> +	.dapm_widgets = aw87390_dapm_widgets,
> +	.num_dapm_widgets = ARRAY_SIZE(aw87390_dapm_widgets),
> +	.dapm_routes = aw87390_dapm_routes,
> +	.num_dapm_routes = ARRAY_SIZE(aw87390_dapm_routes),
> +	.controls = aw87390_controls,
> +	.num_controls = ARRAY_SIZE(aw87390_controls),
> +};
> +
> +static void aw87390_parse_channel_dt(struct aw87390 *aw87390)
> +{
> +	struct aw_device *aw_dev = aw87390->aw_pa;
> +	struct device_node *np = aw_dev->dev->of_node;
> +	u32 channel_value = AW87390_DEV_DEFAULT_CH;
> +
> +	of_property_read_u32(np, "awinic,audio-channel", &channel_value);
> +
> +	aw_dev->channel = channel_value;
> +}
> +
> +static int aw87390_init(struct aw87390 **aw87390, struct i2c_client *i2c, struct regmap *regmap)
> +{
> +	struct aw_device *aw_dev;
> +	unsigned int chip_id;
> +	int ret;
> +
> +	/* read chip id */
> +	ret = regmap_read(regmap, AW87390_ID_REG, &chip_id);
> +	if (ret) {
> +		dev_err(&i2c->dev, "%s read chipid error. ret = %d\n", __func__, ret);
> +		return ret;
> +	}
> +
> +	if (chip_id != AW87390_CHIP_ID) {
> +		dev_err(&i2c->dev, "unsupported device\n");
> +		return -ENXIO;
> +	}
> +
> +	dev_info(&i2c->dev, "chip id = 0x%x\n", chip_id);

Make this dev_dbg().

> +
> +	aw_dev = devm_kzalloc(&i2c->dev, sizeof(*aw_dev), GFP_KERNEL);
> +	if (!aw_dev)
> +		return -ENOMEM;
> +
> +	(*aw87390)->aw_pa = aw_dev;
> +	aw_dev->i2c = i2c;
> +	aw_dev->regmap = regmap;
> +	aw_dev->dev = &i2c->dev;
> +	aw_dev->chip_id = AW87390_CHIP_ID;
> +	aw_dev->acf = NULL;
> +	aw_dev->prof_info.prof_desc = NULL;
> +	aw_dev->prof_info.count = 0;
> +	aw_dev->prof_info.prof_type = AW88395_DEV_NONE_TYPE_ID;
> +	aw_dev->channel = AW87390_DEV_DEFAULT_CH;
> +	aw_dev->fw_status = AW87390_DEV_FW_FAILED;
> +	aw_dev->prof_index = AW87390_INIT_PROFILE;
> +	aw_dev->status = AW87390_DEV_PW_OFF;
> +
> +	aw87390_parse_channel_dt(*aw87390);
> +
> +	return ret;

return 0;

> +}
> +
> +static int aw87390_i2c_probe(struct i2c_client *i2c)
> +{
> +	struct aw87390 *aw87390;
> +	int ret;
> +
> +	ret = i2c_check_functionality(i2c->adapter, I2C_FUNC_I2C);
> +	if (!ret)
> +		return dev_err_probe(&i2c->dev, -ENXIO, "check_functionality failed\n");
> +
> +	aw87390 = devm_kzalloc(&i2c->dev, sizeof(*aw87390), GFP_KERNEL);
> +	if (!aw87390)
> +		return -ENOMEM;
> +
> +	mutex_init(&aw87390->lock);
> +
> +	i2c_set_clientdata(i2c, aw87390);
> +
> +	aw87390->regmap = devm_regmap_init_i2c(i2c, &aw87390_remap_config);
> +	if (IS_ERR(aw87390->regmap))
> +		return dev_err_probe(&i2c->dev, PTR_ERR(aw87390->regmap),
> +					"failed to init regmap\n");
> +
> +	/* aw pa init */
> +	ret = aw87390_init(&aw87390, i2c, aw87390->regmap);
> +	if (ret)
> +		return ret;
> +
> +	ret = regmap_write(aw87390->regmap, AW87390_ID_REG, AW87390_SOFT_RESET_VALUE);
> +	if (ret)
> +		return ret;
> +
> +	ret = devm_snd_soc_register_component(&i2c->dev,
> +				&soc_codec_dev_aw87390, NULL, 0);
> +	if (ret)
> +		dev_err(&i2c->dev, "failed to register aw87390: %d\n", ret);
> +
> +	return ret;
> +}
> +
> +static const struct i2c_device_id aw87390_i2c_id[] = {
> +	{ AW87390_I2C_NAME, 0 },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(i2c, aw87390_i2c_id);
> +
> +static struct i2c_driver aw87390_i2c_driver = {
> +	.driver = {
> +		.name = AW87390_I2C_NAME,
> +	},
> +	.probe = aw87390_i2c_probe,
> +	.id_table = aw87390_i2c_id,
> +};
> +module_i2c_driver(aw87390_i2c_driver);
> +
> +MODULE_DESCRIPTION("ASoC AW87390 PA Driver");
> +MODULE_LICENSE("GPL v2");

This is another checkpatch thing.  It should just be
MODULE_LICENSE("GPL");

regards,
dan carpenter

