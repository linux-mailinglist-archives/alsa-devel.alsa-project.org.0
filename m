Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BAC55768C1E
	for <lists+alsa-devel@lfdr.de>; Mon, 31 Jul 2023 08:40:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E812C82A;
	Mon, 31 Jul 2023 08:40:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E812C82A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690785655;
	bh=yKOoemBkNhBqe1lat60jHoj1gVqYWoXUcENXkBR7yCY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=BGYXBWLfvMZ3f+Y05dhtAMsY2NLC1iSoEtWx+DSTxHfoDKOjQ3uJPqBNE79jOl6wV
	 BF4mP78DkX6oRMFfeHUQZddi/ITarLQ7GdMTve0g9XQjfYh/l9GmoQv4f1n7fPnsRX
	 3RXLVKteMcDwDjHR5I+LUOhGu2Fa21uwjoeaBScA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3E540F801D5; Mon, 31 Jul 2023 08:39:41 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 448F3F80163;
	Mon, 31 Jul 2023 08:39:41 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 73D4BF8016D; Mon, 31 Jul 2023 08:39:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=5.0 tests=RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,UNPARSEABLE_RELAY shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from out28-51.mail.aliyun.com (out28-51.mail.aliyun.com
 [115.124.28.51])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 08E83F80149
	for <alsa-devel@alsa-project.org>; Mon, 31 Jul 2023 08:39:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 08E83F80149
X-Alimail-AntiSpam: 
 AC=CONTINUE;BC=0.07436259|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_system_inform|0.00400371-0.000150313-0.995846;FP=0|0|0|0|0|-1|-1|-1;HT=ay29a033018047205;MF=wangweidong.a@awinic.com;NM=1;PH=DS;RN=26;RT=26;SR=0;TI=SMTPD_---.U4bHBGG_1690785547;
Received: from ubuntu-VirtualBox..(mailfrom:wangweidong.a@awinic.com
 fp:SMTPD_---.U4bHBGG_1690785547)
          by smtp.aliyun-inc.com;
          Mon, 31 Jul 2023 14:39:10 +0800
From: wangweidong.a@awinic.com
To: krzysztof.kozlowski@linaro.org
Cc: 13916275206@139.com,
	alsa-devel@alsa-project.org,
	broonie@kernel.org,
	ckeepax@opensource.cirrus.com,
	colin.i.king@gmail.com,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	doug@schmorgal.com,
	fido_max@inbox.ru,
	herve.codina@bootlin.com,
	krzysztof.kozlowski+dt@linaro.org,
	lgirdwood@gmail.com,
	linux-kernel@vger.kernel.org,
	liweilei@awinic.com,
	perex@perex.cz,
	povik+lin@cutebit.org,
	rf@opensource.cirrus.com,
	robh+dt@kernel.org,
	ryans.lee@analog.com,
	shumingf@realtek.com,
	tiwai@suse.com,
	trix@redhat.com,
	wangweidong.a@awinic.com,
	yijiangtao@awinic.com,
	zhangjianming@awinic.com
Subject: Re: [PATCH V3 3/5] ASoC: codecs: Add aw88261 amplifier driver
Date: Mon, 31 Jul 2023 14:39:07 +0800
Message-ID: <20230731063907.4097-1-wangweidong.a@awinic.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <4d822ff6-b7e6-20e2-6087-78941488a3cf@linaro.org>
References: <4d822ff6-b7e6-20e2-6087-78941488a3cf@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: VCBNLETKKDM6MNGH7M3A4H4OXJFGHPUK
X-Message-ID-Hash: VCBNLETKKDM6MNGH7M3A4H4OXJFGHPUK
X-MailFrom: wangweidong.a@awinic.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VCBNLETKKDM6MNGH7M3A4H4OXJFGHPUK/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Thank you very much for your review, but I have a few questions
I'd like to discuss with you

On 29/07/2023 19:22, krzysztof.kozlowski@linaro.org wrote:
> On 29/07/2023 11:12, wangweidong.a@awinic.com wrote:
>> From: Weidong Wang <wangweidong.a@awinic.com>
>> 
>> Add i2c and amplifier registration for
>> aw88261 and their associated operation functions.
>> 
>> Signed-off-by: Weidong Wang <wangweidong.a@awinic.com>
>> ---
>>  sound/soc/codecs/aw88261/aw88261.c | 517 +++++++++++++++++++++++++++++
>>  sound/soc/codecs/aw88261/aw88261.h |  52 +++
>>  2 files changed, 569 insertions(+)
>>  create mode 100644 sound/soc/codecs/aw88261/aw88261.c
>>  create mode 100644 sound/soc/codecs/aw88261/aw88261.h
>> 


>> +
>> +static int aw88261_request_firmware_file(struct aw88261 *aw88261)
>> +{
>> +	const struct firmware *cont = NULL;
>> +	int ret;
>> +
>> +	aw88261->aw_pa->aw88261_base->fw_status = AW88261_DEV_FW_FAILED;
>> +
>> +	ret = request_firmware(&cont, AW88261_ACF_FILE, aw88261->aw_pa->dev);
>> +	if (ret < 0) {
>> +		dev_err_probe(aw88261->aw_pa->dev, ret, "load [%s] failed!", AW88261_ACF_FILE);
>> +		return ret;

> That's not how you use dev_err_probe. Instead: return dev_err_probe

Thank you very much. I will changed it to
"return dev_err_probe(aw88261->aw_pa->dev, ret, "load [%s] failed!", AW88261_ACF_FILE)".

>> +	}
>> +
>> +	dev_info(aw88261->aw_pa->dev, "loaded %s - size: %zu\n",
>> +			AW88261_ACF_FILE, cont ? cont->size : 0);
>> +
>> +	aw88261->aw_cfg = devm_kzalloc(aw88261->aw_pa->dev, cont->size + sizeof(int), GFP_KERNEL);
>> +	if (!aw88261->aw_cfg) {
>> +		release_firmware(cont);
>> +		return -ENOMEM;
>> +	}
>> +	aw88261->aw_cfg->len = (int)cont->size;
>> +	memcpy(aw88261->aw_cfg->data, cont->data, cont->size);
>> +	release_firmware(cont);
>> +
>> +	ret = aw88395_dev_load_acf_check(aw88261->aw_pa->aw88261_base, aw88261->aw_cfg);
>> +	if (ret < 0) {
>> +		dev_err_probe(aw88261->aw_pa->dev, ret, "load [%s] failed !", AW88261_ACF_FILE);
>> +		return ret;

> return dev_err_probe

I want to use "dev_err" here, Because the aw88395_dev_load_acf_check
function only checks the bin file, it does not involve the application of resources

>> +	}
>> +
>> +	mutex_lock(&aw88261->lock);
>> +	/* aw device init */
>> +	ret = aw88261_dev_init(aw88261->aw_pa, aw88261->aw_cfg);
>> +	if (ret < 0)
>> +		dev_err(aw88261->aw_pa->dev, "dev init failed");
>> +	mutex_unlock(&aw88261->lock);
>> +
>> +	return ret;
>> +}
>> +
>> +static int aw88261_codec_probe(struct snd_soc_component *component)
>> +{
>> +	struct snd_soc_dapm_context *dapm = snd_soc_component_get_dapm(component);
>> +	struct aw88261 *aw88261 = snd_soc_component_get_drvdata(component);
>> +	int ret;
>> +
>> +	INIT_DELAYED_WORK(&aw88261->start_work, aw88261_startup_work);
>> +
>> +	ret = aw88261_request_firmware_file(aw88261);
>> +	if (ret < 0) {
>> +		dev_err_probe(aw88261->aw_pa->dev, ret, "aw88261_request_firmware_file failed\n");
>> +		return ret;

> return dev_err_probe

Thank you very much. I'll change it to "return dev_err_probe"

>> +	}
>> +
>> +	/* add widgets */
>> +	ret = snd_soc_dapm_new_controls(dapm, aw88261_dapm_widgets,
>> +							ARRAY_SIZE(aw88261_dapm_widgets));
>> +	if (ret < 0)
>> +		return ret;
>> +
>> +	/* add route */
>> +	ret = snd_soc_dapm_add_routes(dapm, aw88261_audio_map,
>> +							ARRAY_SIZE(aw88261_audio_map));
>> +	if (ret < 0)
>> +		return ret;
>> +
>> +	ret = snd_soc_add_component_controls(component, aw88261_controls,
>> +							ARRAY_SIZE(aw88261_controls));
>> +
>> +	return ret;
>> +}
>> +
>> +static void aw88261_codec_remove(struct snd_soc_component *aw_codec)
>> +{
>> +	struct aw88261 *aw88261 = snd_soc_component_get_drvdata(aw_codec);
>> +
>> +	cancel_delayed_work_sync(&aw88261->start_work);
>> +}
>> +
>> +static const struct snd_soc_component_driver soc_codec_dev_aw88261 = {
>> +	.probe = aw88261_codec_probe,
>> +	.remove = aw88261_codec_remove,
>> +};
>> +
>> +static void aw88261_hw_reset(struct aw88261 *aw88261)
>> +{
>> +	gpiod_set_value_cansleep(aw88261->reset_gpio, 0);
>> +	usleep_range(AW88261_1000_US, AW88261_1000_US + 10);
>> +	gpiod_set_value_cansleep(aw88261->reset_gpio, 1);
>> +	usleep_range(AW88261_1000_US, AW88261_1000_US + 10);
>> +}
>> +
>> +static int aw88261_i2c_probe(struct i2c_client *i2c)
>> +{
>> +	struct aw88261 *aw88261;
>> +	int ret;
>> +
>> +	ret = i2c_check_functionality(i2c->adapter, I2C_FUNC_I2C);
>> +	if (!ret) {
>> +		dev_err_probe(&i2c->dev, ret, "check_functionality failed");
>> +		return -ENXIO;

> return dev_err_probe

Thank you very much. I'll change it to "return dev_err_probe"

>> +	}
>> +
>> +	aw88261 = devm_kzalloc(&i2c->dev, sizeof(struct aw88261), GFP_KERNEL);

> sizeof(*)

Thank you very much. I will change it to 
"devm_kzalloc(&i2c->dev, sizeof(*aw88261), GFP_KERNEL)".

>> +	if (!aw88261)
>> +		return -ENOMEM;
>> +
>> +	mutex_init(&aw88261->lock);
>> +
>> +	i2c_set_clientdata(i2c, aw88261);
>> +
>> +	aw88261->reset_gpio = devm_gpiod_get_optional(&i2c->dev, "reset", GPIOD_OUT_LOW);
>> +	if (IS_ERR(aw88261->reset_gpio))
>> +		dev_info(&i2c->dev, "reset gpio not defined\n");
>> +	else
>> +		aw88261_hw_reset(aw88261);
>> +
>> +	aw88261->regmap = devm_regmap_init_i2c(i2c, &aw88261_remap_config);
>> +	if (IS_ERR(aw88261->regmap)) {
>> +		ret = PTR_ERR(aw88261->regmap);
>> +		dev_err_probe(&i2c->dev, ret, "failed to init regmap: %d\n", ret);
>> +		return ret;

> return dev_err_probe

> I asked you about this in your first version. I explicitly wrote "return
> dev_err_probe", not some other syntax.

Thank you very much. I'll change it to "return dev_err_probe"

Best regards,
Weidong Wang
