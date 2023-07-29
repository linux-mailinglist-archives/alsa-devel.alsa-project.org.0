Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A35C767EB1
	for <lists+alsa-devel@lfdr.de>; Sat, 29 Jul 2023 13:29:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 70731200;
	Sat, 29 Jul 2023 13:28:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 70731200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690630180;
	bh=BCE0FU/Gw21tqHBzk0MlRvWt7UFwCOEurmakdYqdQZE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=CPXOt0XyYnCW1Ib2mXg0Q/UswiQ6m9I3hK4ivTZDR8/XLU+JZM1GSHvEyXkDIH9sL
	 HF0czc5aSWC60gmSXN8aJD0ngb+TPgO3LqVh5BugpveTYyO+hTed0ezc0q5ZeFXh2I
	 ZdDBFmjgxtyQvOvk4xtQgWk4rOpNeOZpAjEvlTOw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E0D01F802E8; Sat, 29 Jul 2023 13:28:49 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 950FCF80163;
	Sat, 29 Jul 2023 13:28:49 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A1597F8019B; Sat, 29 Jul 2023 13:28:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A3312F800D2
	for <alsa-devel@alsa-project.org>; Sat, 29 Jul 2023 13:28:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A3312F800D2
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=siffDaiP
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-317744867a6so2878786f8f.1
        for <alsa-devel@alsa-project.org>;
 Sat, 29 Jul 2023 04:28:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690630114; x=1691234914;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pRDwWAB/tb7083VSEGzmcpz2Ehv9nbqjUHEzV2waCS0=;
        b=siffDaiP9GP62trwaRl80GYOruJzb5ssaxEiXM03DawB+eazWxT+Cy+j+AajVYkgBH
         VmEQ+z7js5Z/L7vy/RZGN/7LvmTfgE9JHW/mn6zwt1dnyxQj+oXOvv1l6nlgPZnAKB6C
         cH1VviRJ/xyIqCt/jgEyRT6TWGbgJLqr+M5opNVhfMZuvsp5m4lNacF9PpFRtZlRhNFw
         0GPF3lkv9cXU0r9rvEWgbwy8f0iZzgiad0Xfi0UsxYy7fmrLzFLRhpxL0XuL0zEkdkGl
         gAfP/mdYquJgZ12qvxiD316gaT9AxZtu6Yliy8MEKVJT0nVHN8FVr7bC1fXMvU1p/89B
         QbgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690630114; x=1691234914;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pRDwWAB/tb7083VSEGzmcpz2Ehv9nbqjUHEzV2waCS0=;
        b=ZhGmlVsovRVJoBuOBepRB5vYaGO/ozjxG3bxMUH8yBhaReNFXfXIQuglgigL5nXRZS
         lB/7weldeVv1xmUxbzW9b51hQfzd2usRtMmKc05bvyWegjoZ0KuL62dnxDIXXHdAIXya
         zyDXYv8eDojmKT7tMPUbWiZNzYM+UAznTu0cHTel6o+QRoFnGa+QBL8gbOev9e/2mXaj
         QCZo/muI1s7q62Z9uiwAmOi2PiGktsT4yRxQiE3mzXjqI7BFv5AuACDXHrpLbd9AjXVR
         ougLwyDkiFr6T/l+QhDPUS8fq8za5DyYJY4rxMIIU5j3f2ISkTjvkNwI9k5yc+F8cS7q
         uY6Q==
X-Gm-Message-State: ABy/qLbB/+fOmp0Ht4a/3d2fU1Xuw0VkHwM8MGyBNHfDyMEykCQe5IXi
	xHz3rpTx/XMxlq0M1MKyogFrZg==
X-Google-Smtp-Source: 
 APBJJlFwn53/NAUi96jua9lUrHCesB4IPoDQQN2ncMi0AMKL8ZcCwfTB7YJFxsSfzxbxL4HsLXcoXg==
X-Received: by 2002:adf:f512:0:b0:30f:c5b1:23ef with SMTP id
 q18-20020adff512000000b0030fc5b123efmr3631974wro.41.1690630114310;
        Sat, 29 Jul 2023 04:28:34 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.104])
        by smtp.gmail.com with ESMTPSA id
 r16-20020a0560001b9000b0031769585da4sm7214702wru.57.2023.07.29.04.28.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 29 Jul 2023 04:28:33 -0700 (PDT)
Message-ID: <7cdd4825-c0da-f60e-bbef-970bea48dc95@linaro.org>
Date: Sat, 29 Jul 2023 13:28:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH V3 4/5] ASoC: codecs: aw88261 device related operation
 functions
Content-Language: en-US
To: wangweidong.a@awinic.com, lgirdwood@gmail.com, broonie@kernel.org,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 perex@perex.cz, tiwai@suse.com, rf@opensource.cirrus.com,
 shumingf@realtek.com, ryans.lee@analog.com, 13916275206@139.com,
 herve.codina@bootlin.com, ckeepax@opensource.cirrus.com, doug@schmorgal.com,
 fido_max@inbox.ru, povik+lin@cutebit.org, liweilei@awinic.com,
 yijiangtao@awinic.com, colin.i.king@gmail.com, trix@redhat.com,
 alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: zhangjianming@awinic.com
References: <20230729091223.193466-1-wangweidong.a@awinic.com>
 <20230729091223.193466-5-wangweidong.a@awinic.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230729091223.193466-5-wangweidong.a@awinic.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: PZMM353IT46C7LRRQT6TDYULN3VR4IWJ
X-Message-ID-Hash: PZMM353IT46C7LRRQT6TDYULN3VR4IWJ
X-MailFrom: krzysztof.kozlowski@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/PZMM353IT46C7LRRQT6TDYULN3VR4IWJ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 29/07/2023 11:12, wangweidong.a@awinic.com wrote:
> From: Weidong Wang <wangweidong.a@awinic.com>
> 
> Operate the aw88261 chip, including device initialization,
> chip power-on and power-off, control volume, etc.
> 
> Signed-off-by: Weidong Wang <wangweidong.a@awinic.com>
> ---
>  sound/soc/codecs/aw88261/aw88261_device.c | 877 ++++++++++++++++++++++
>  sound/soc/codecs/aw88261/aw88261_device.h |  79 ++
>  2 files changed, 956 insertions(+)
>  create mode 100644 sound/soc/codecs/aw88261/aw88261_device.c
>  create mode 100644 sound/soc/codecs/aw88261/aw88261_device.h
> 

...

> +
> +int aw88261_dev_stop(struct aw88261_device *aw_dev)
> +{
> +	if (aw_dev->aw88261_base->status == AW88261_DEV_PW_OFF) {
> +		dev_info(aw_dev->aw88261_base->dev, "already power off");
> +		return 0;
> +	}
> +
> +	aw_dev->aw88261_base->status = AW88261_DEV_PW_OFF;
> +
> +	/* clear inturrupt */
> +	aw_dev_clear_int_status(aw_dev);
> +
> +	aw88261_dev_uls_hmute(aw_dev, true);
> +	/* set mute */
> +	aw88261_dev_mute(aw_dev, true);
> +
> +	/* close tx feedback */
> +	aw_dev_i2s_tx_enable(aw_dev, false);
> +	usleep_range(AW88261_1000_US, AW88261_1000_US + 100);
> +
> +	/* enable amppd */
> +	aw_dev_amppd(aw_dev, true);
> +
> +	/* set power down */
> +	aw_dev_pwd(aw_dev, true);
> +
> +	dev_dbg(aw_dev->dev, "pa stop success\n");

No for debug replacing tracing. We have tracing for this.

> +
> +	return 0;
> +}
> +
> +int aw88261_dev_init(struct aw88261_device *aw_dev, struct aw_container *aw_cfg)

You already used this function in patch #3, so your order of patches is
confusing.

> +{
> +	int ret;
> +
> +	if ((!aw_dev) || (!aw_cfg)) {
> +		pr_err("aw_dev is NULL or aw_cfg is NULL");

Is this possible? If so, why?

> +		return -ENOMEM;
> +	}
> +
> +	ret = aw88395_dev_cfg_load(aw_dev->aw88261_base, aw_cfg);
> +	if (ret) {
> +		dev_err(aw_dev->dev, "aw_dev acf parse failed");
> +		return -EINVAL;
> +	}
> +
> +	ret = regmap_write(aw_dev->aw88261_base->regmap, AW88261_ID_REG, AW88261_SOFT_RESET_VALUE);
> +	if (ret < 0)
> +		return ret;
> +
> +	aw_dev->aw88261_base->fade_in_time = AW88261_1000_US / 10;
> +	aw_dev->aw88261_base->fade_out_time = AW88261_1000_US >> 1;
> +	aw_dev->aw88261_base->prof_cur = AW_INIT_PROFILE;
> +	aw_dev->aw88261_base->prof_index = AW_INIT_PROFILE;
> +
> +	ret = aw_dev_fw_update(aw_dev);
> +	if (ret) {
> +		dev_err(aw_dev->dev, "fw update failed ret = %d\n", ret);
> +		return ret;
> +	}
> +
> +	ret = aw_frcset_check(aw_dev);
> +	if (ret) {
> +		dev_err(aw_dev->dev, "aw_frcset_check failed ret = %d\n", ret);
> +		return ret;
> +	}
> +
> +	aw_dev_clear_int_status(aw_dev);
> +
> +	aw88261_dev_uls_hmute(aw_dev, true);
> +
> +	aw88261_dev_mute(aw_dev, true);
> +
> +	aw_dev_i2s_tx_enable(aw_dev, false);
> +
> +	usleep_range(AW88261_1000_US, AW88261_1000_US + 100);
> +
> +	aw_dev_amppd(aw_dev, true);
> +
> +	aw_dev_pwd(aw_dev, true);
> +
> +	return 0;
> +}
> +
> +static void aw_parse_channel_dt(struct aw88261_device *aw_dev)
> +{
> +	struct device_node *np = aw_dev->aw88261_base->dev->of_node;
> +	u32 channel_value;
> +	u32 sync_enable;
> +	int ret;
> +
> +	ret = of_property_read_u32(np, "sound-channel", &channel_value);
> +	if (ret)
> +		channel_value = AW88261_DEV_DEFAULT_CH;
> +
> +	ret = of_property_read_u32(np, "sync-flag", &sync_enable);
> +	if (ret)
> +		sync_enable = false;
> +
> +	dev_dbg(aw_dev->dev,  "sync flag is %d", sync_enable);

Fix style - only one space after ,

> +	dev_dbg(aw_dev->dev, "read sound-channel value is: %d", channel_value);
> +
> +	aw_dev->aw88261_base->channel = channel_value;
> +	aw_dev->phase_sync = sync_enable;
> +}
> +
> +static int aw_dev_init(struct aw88261_device *aw_dev)
> +{
> +	aw_dev->aw88261_base->chip_id = AW88261_CHIP_ID;
> +	/* call aw device init func */
> +	aw_dev->aw88261_base->acf = NULL;
> +	aw_dev->aw88261_base->prof_info.prof_desc = NULL;
> +	aw_dev->aw88261_base->prof_info.count = 0;
> +	aw_dev->aw88261_base->prof_info.prof_type = AW88395_DEV_NONE_TYPE_ID;
> +	aw_dev->aw88261_base->channel = 0;
> +	aw_dev->aw88261_base->fw_status = AW88261_DEV_FW_FAILED;
> +
> +	aw_dev->aw88261_base->fade_step = AW88261_VOLUME_STEP_DB;
> +	aw_dev->aw88261_base->volume_desc.ctl_volume = AW88261_VOL_DEFAULT_VALUE;
> +	aw_dev->aw88261_base->volume_desc.mute_volume = AW88261_MUTE_VOL;
> +	aw_parse_channel_dt(aw_dev);
> +
> +	return 0;
> +}
> +
> +int aw88261_dev_set_profile_index(struct aw88261_device *aw_dev, int index)
> +{
> +	struct aw_device *aw88261_base = aw_dev->aw88261_base;
> +
> +	/* check the index whether is valid */
> +	if ((index >= aw88261_base->prof_info.count) || (index < 0))
> +		return -EINVAL;
> +	/* check the index whether change */
> +	if (aw88261_base->prof_index == index)
> +		return -EINVAL;
> +
> +	aw88261_base->prof_index = index;
> +
> +	return 0;
> +}
> +
> +char *aw88261_dev_get_prof_name(struct aw88261_device *aw_dev, int index)
> +{
> +	struct aw_prof_info *prof_info = &aw_dev->aw88261_base->prof_info;
> +	struct aw_prof_desc *prof_desc;
> +
> +	if ((index >= aw_dev->aw88261_base->prof_info.count) || (index < 0)) {
> +		dev_err(aw_dev->dev, "index[%d] overflow count[%d]",
> +			index, aw_dev->aw88261_base->prof_info.count);
> +		return NULL;
> +	}
> +
> +	prof_desc = &aw_dev->aw88261_base->prof_info.prof_desc[index];
> +
> +	return prof_info->prof_name_list[prof_desc->id];
> +}
> +
> +int aw88261_dev_get_prof_data(struct aw88261_device *aw_dev, int index,
> +			struct aw_prof_desc **prof_desc)
> +{
> +	if ((index >= aw_dev->aw88261_base->prof_info.count) || (index < 0)) {
> +		dev_err(aw_dev->dev, "%s: index[%d] overflow count[%d]\n",
> +				__func__, index, aw_dev->aw88261_base->prof_info.count);
> +		return -EINVAL;
> +	}
> +
> +	*prof_desc = &aw_dev->aw88261_base->prof_info.prof_desc[index];
> +
> +	return 0;
> +}
> +
> +int aw88261_init(struct aw88261_device **aw_dev, struct i2c_client *i2c, struct regmap *regmap)

You already used this function in patch #3, so your order of patches is
confusing.

> +{
> +	unsigned int chip_id;
> +	int ret;
> +
> +	if (*aw_dev) {
> +		dev_info(&i2c->dev, "it should be initialized here.\n");

How is this possible?


> +	} else {
> +		*aw_dev = devm_kzalloc(&i2c->dev, sizeof(struct aw88261_device), GFP_KERNEL);

sizeof(**)

> +		if (!(*aw_dev))
> +			return -ENOMEM;
> +	}
> +
> +	(*aw_dev)->aw88261_base =
> +			devm_kzalloc(&i2c->dev, sizeof(struct aw_device), GFP_KERNEL);

sizeof(*)
> +	if (!(*aw_dev)->aw88261_base)
> +		return -ENOMEM;
> +
> +	(*aw_dev)->aw88261_base->i2c = i2c;

I propose to use some local variable, to simplify all these assignments.

> +	(*aw_dev)->aw88261_base->dev = &i2c->dev;
> +	(*aw_dev)->aw88261_base->regmap = regmap;
> +	(*aw_dev)->dev = &i2c->dev;

In how many places do you need to store &i2c->dev?

> +
> +	/* read chip id */
> +	ret = regmap_read((*aw_dev)->aw88261_base->regmap, AW88261_CHIP_ID_REG, &chip_id);
> +	if (ret) {
> +		dev_err((*aw_dev)->dev, "%s read chipid error. ret = %d", __func__, ret);
> +		return ret;
> +	}
> +	dev_info((*aw_dev)->dev, "chip id = %x\n", chip_id);

"(*aw_dev)->dev" all over this function is not really readable.

> +
> +	switch (chip_id) {
> +	case AW88261_CHIP_ID:
> +		ret = aw_dev_init((*aw_dev));
> +		break;
> +	default:
> +		ret = -EINVAL;
> +		dev_err((*aw_dev)->dev, "unsupported device");
> +		break;
> +	}
> +
> +	return ret;
> +}
> +
> +MODULE_DESCRIPTION("AW88261 device");
> +MODULE_LICENSE("GPL v2");

Wait, is this a module? Does not look complete. I already saw one
module, so what is this for? For which module?

Best regards,
Krzysztof

