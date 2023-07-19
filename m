Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EB218758BD3
	for <lists+alsa-devel@lfdr.de>; Wed, 19 Jul 2023 05:08:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7BE36112;
	Wed, 19 Jul 2023 05:07:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7BE36112
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689736113;
	bh=fhrj7mcTCknEt+0s4qKyZoWzUzTBb6A+wnfTJRgtZSc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=jpgGHF8zQlf4pJr45WK5ZMKEYhT+0aJos8XVlivrzo7ol6fVm/ZZSAJW6C7hk6vR0
	 xiPGkpP70zC2/C4B+OjSn8eSJ5/27eB3Dy+g1A/D0MSYmSi3dOfqJA8wmvo4CIbq0L
	 ToE4zmPdYfItCjCnRdpTMoGiyr1kHsn37iF9fpN0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 03A84F800D2; Wed, 19 Jul 2023 05:07:21 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 80505F8032D;
	Wed, 19 Jul 2023 05:07:21 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2E296F8047D; Wed, 19 Jul 2023 05:07:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
	RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,UNPARSEABLE_RELAY shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from out28-172.mail.aliyun.com (out28-172.mail.aliyun.com
 [115.124.28.172])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 1EBF9F800D2
	for <alsa-devel@alsa-project.org>; Wed, 19 Jul 2023 05:07:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1EBF9F800D2
X-Alimail-AntiSpam: 
 AC=CONTINUE;BC=0.0743626|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_system_inform|0.0581865-0.00128256-0.940531;FP=0|0|0|0|0|-1|-1|-1;HT=ay29a033018047208;MF=wangweidong.a@awinic.com;NM=1;PH=DS;RN=26;RT=26;SR=0;TI=SMTPD_---.Tx46JNx_1689736015;
Received: from ubuntu-VirtualBox..(mailfrom:wangweidong.a@awinic.com
 fp:SMTPD_---.Tx46JNx_1689736015)
          by smtp.aliyun-inc.com;
          Wed, 19 Jul 2023 11:06:58 +0800
From: wangweidong.a@awinic.com
To: krzysztof.kozlowski@linaro.org
Cc: alsa-devel@alsa-project.org,
	broonie@kernel.org,
	ckeepax@opensource.cirrus.com,
	colin.i.king@gmail.com,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	doug@schmorgal.com,
	fido_max@inbox.ru,
	flatmax@flatmax.com,
	herve.codina@bootlin.com,
	kiseok.jo@irondevice.com,
	krzysztof.kozlowski+dt@linaro.org,
	lgirdwood@gmail.com,
	linux-kernel@vger.kernel.org,
	liweilei@awinic.com,
	perex@perex.cz,
	pierre-louis.bossart@linux.intel.com,
	rf@opensource.cirrus.com,
	robh+dt@kernel.org,
	shumingf@realtek.com,
	tiwai@suse.com,
	trix@redhat.com,
	wangweidong.a@awinic.com,
	yijiangtao@awinic.com,
	zhangjianming@awinic.com
Subject: Re: [PATCH V1 1/5] ASoC: codecs: Add i2c and codec registration for
 aw88261 and their associated operation functions
Date: Wed, 19 Jul 2023 11:06:55 +0800
Message-ID: <20230719030655.41451-1-wangweidong.a@awinic.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <0c534a51-dff3-84f1-34cb-41cae25d3871@linaro.org>
References: <0c534a51-dff3-84f1-34cb-41cae25d3871@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: OCK5MZMSZBCDGN5EHMGJIPCLFL7WRINV
X-Message-ID-Hash: OCK5MZMSZBCDGN5EHMGJIPCLFL7WRINV
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/OCK5MZMSZBCDGN5EHMGJIPCLFL7WRINV/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi, Krzysztof,
Thank you very much for your advice.

On 18/07/2023 16:39, krzysztof.kozlowski@linaro.org wrote:
> On 17/07/2023 13:58, wangweidong.a@awinic.com wrote:
>> From: Weidong Wang <wangweidong.a@awinic.com>
>> 
>> The AW88261 is an I2S/TDM input, high efficiency
>> digital Smart K audio amplifier with an integrated 10.25V
>> smart boost convert
>> 

...

>> +
>> +static int aw88261_request_firmware_file(struct aw88261 *aw88261)
>> +{
>> +	const struct firmware *cont = NULL;
>> +	int ret;
>> +
>> +	aw88261->aw_pa->fw_status = AW88261_DEV_FW_FAILED;
>> +
>> +	ret = request_firmware(&cont, AW88261_ACF_FILE, aw88261->aw_pa->dev);
>> +	if ((ret < 0) || (!cont)) {
>> +		dev_err(aw88261->aw_pa->dev, "load [%s] failed!", AW88261_ACF_FILE);
>> +		return ret;

>return dev_err_probe?

I will modify it as suggested.

>> +	}
>> +
>> +	dev_info(aw88261->aw_pa->dev, "loaded %s - size: %zu\n",
>> +			AW88261_ACF_FILE, cont ? cont->size : 0);> +
>> +	aw88261->aw_cfg = devm_kzalloc(aw88261->aw_pa->dev, cont->size + sizeof(int), GFP_KERNEL);
>> +	if (!aw88261->aw_cfg) {
>> +		release_firmware(cont);
>> +		return -ENOMEM;
>> +	}
>> +	aw88261->aw_cfg->len = (int)cont->size;
>> +	memcpy(aw88261->aw_cfg->data, cont->data, cont->size);
>> +	release_firmware(cont);
>> +
>> +	ret = aw88261_dev_load_acf_check(aw88261->aw_pa, aw88261->aw_cfg);
>> +	if (ret < 0) {
>> +		dev_err(aw88261->aw_pa->dev, "Load [%s] failed ....!", AW88261_ACF_FILE);
>> +		return ret;
>> +	}
>> +
>> +	dev_dbg(aw88261->aw_pa->dev, "%s : bin load success\n", __func__);

> Drop dev_dbg on simple probe success/failure. There is tracing
> infrastructure for this.

I will delete this print statement.

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
>> +		dev_err(aw88261->aw_pa->dev, "aw88261_request_firmware_file failed\n");
>> +		return ret;

> Consider here dev_err_probe, to annotate possibility of probe deferal
> (e.g. missing rootfs). I think component probe is called for device probes?

I will modify it as suggested.

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
>> +	if (!i2c_check_functionality(i2c->adapter, I2C_FUNC_I2C)) {
>> +		dev_err(&i2c->dev, "check_functionality failed");
>> +		return -EIO;
>> +	}
>> +
>> +	aw88261 = aw88261_malloc_init(i2c);
>> +	if (!aw88261) {
>> +		dev_err(&i2c->dev, "malloc aw88261 failed");

> Do not print messages on allocation errors.

> Also, there is little sense in moving one or two functions - kzalloc -
> to separate function. It does not make the code easier to read.

I will modify it as suggested.

>> +		return -ENOMEM;
>> +	}
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
>> +		dev_err(&i2c->dev, "Failed to init regmap: %d\n", ret);
>> +		return ret;

> return dev_err_probe

I will modify it as suggested.

>> +	}
>> +
>> +	/* aw pa init */
>> +	ret = aw88261_init(&aw88261->aw_pa, i2c, aw88261->regmap);
>> +	if (ret < 0)
>> +		return ret;
>> +
>> +	ret = devm_snd_soc_register_component(&i2c->dev,
>> +			&soc_codec_dev_aw88261,
>> +			aw88261_dai, ARRAY_SIZE(aw88261_dai));
>> +	if (ret < 0)
>> +		dev_err(&i2c->dev, "failed to register aw88261: %d", ret);
>> +
>> +	return ret;
>> +}
>> +
>> +#ifdef CONFIG_OF

> Drop

I will modify it as suggested.

>> +static const struct of_device_id aw88261_of_match[] = {
>> +	{ .compatible = "awinic,aw88261" },
>> +	{ },
>> +};
>> +MODULE_DEVICE_TABLE(of, aw88261_of_match);
>> +#endif
>> +
>> +static const struct i2c_device_id aw88261_i2c_id[] = {
>> +	{ AW88261_I2C_NAME, 0 },
>> +	{ }
>> +};
>> +MODULE_DEVICE_TABLE(i2c, aw88261_i2c_id);
>> +
>> +static struct i2c_driver aw88261_i2c_driver = {
>> +	.driver = {
>> +		.name = AW88261_I2C_NAME,
>> +		.of_match_table = of_match_ptr(aw88261_of_match),

> Drop of_match_ptr.

I will modify it as suggested.

Best regards,
Weidong Wang
