Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DA49279207E
	for <lists+alsa-devel@lfdr.de>; Tue,  5 Sep 2023 08:09:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DBE86832;
	Tue,  5 Sep 2023 08:08:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DBE86832
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1693894141;
	bh=qpFrkfoif99wFoA9QI0vEHV61QPOlw2L8N3R6xrWTYI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=uAZTwJyaJY0ah+JIZ28waY6bO5cfeArZXGTrHsHAmNuqSxKhUdV2t6e+CNxEH4mxQ
	 BzfXEnqicOIl48kKFt8sabQUskPmjyiv7r6RP2tmsKSzeSYUji9LLr103BgsA2sZn4
	 sovSuxMG6zCu/hv/qUujdnZ8LkGhMQsGkxoScBW4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 83C6EF80549; Tue,  5 Sep 2023 08:08:02 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E315BF80431;
	Tue,  5 Sep 2023 08:08:01 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id ACE24F8047D; Tue,  5 Sep 2023 08:07:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,
	UNPARSEABLE_RELAY shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from out28-5.mail.aliyun.com (out28-5.mail.aliyun.com
 [115.124.28.5])
	by alsa1.perex.cz (Postfix) with ESMTP id 73924F80236
	for <alsa-devel@alsa-project.org>; Tue,  5 Sep 2023 08:07:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 73924F80236
X-Alimail-AntiSpam: 
 AC=CONTINUE;BC=0.07437018|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_system_inform|0.0078599-0.000796544-0.991344;FP=0|0|0|0|0|-1|-1|-1;HT=ay29a033018047194;MF=wangweidong.a@awinic.com;NM=1;PH=DS;RN=25;RT=25;SR=0;TI=SMTPD_---.UXsaVvi_1693893801;
Received: from ubuntu-VirtualBox..(mailfrom:wangweidong.a@awinic.com
 fp:SMTPD_---.UXsaVvi_1693893801)
          by smtp.aliyun-inc.com;
          Tue, 05 Sep 2023 14:03:29 +0800
From: wangweidong.a@awinic.com
To: krzysztof.kozlowski@linaro.org
Cc: 13916275206@139.com,
	alsa-devel@alsa-project.org,
	broonie@kernel.org,
	ckeepax@opensource.cirrus.com,
	colin.i.king@gmail.com,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	herve.codina@bootlin.com,
	krzysztof.kozlowski+dt@linaro.org,
	lgirdwood@gmail.com,
	linus.walleij@linaro.org,
	linux-kernel@vger.kernel.org,
	liweilei@awinic.com,
	perex@perex.cz,
	rdunlap@infradead.org,
	rf@opensource.cirrus.com,
	robh+dt@kernel.org,
	ryans.lee@analog.com,
	shumingf@realtek.com,
	tiwai@suse.com,
	trix@redhat.com,
	wangweidong.a@awinic.com,
	yijiangtao@awinic.com,
	zhangjianming@awinic.com
Subject: Re: [PATCH V1 3/3] ASoC: codecs: Add aw87390 amplifier driver
Date: Tue,  5 Sep 2023 14:03:21 +0800
Message-ID: <20230905060321.15849-1-wangweidong.a@awinic.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <5ea76d3f-c9dd-10f5-4f9a-7b32b535ab5c@linaro.org>
References: <5ea76d3f-c9dd-10f5-4f9a-7b32b535ab5c@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: FAJWWAOGXPBO22LDSE774TKZAIGXWD6Q
X-Message-ID-Hash: FAJWWAOGXPBO22LDSE774TKZAIGXWD6Q
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/FAJWWAOGXPBO22LDSE774TKZAIGXWD6Q/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Thank you very much. Here are some things I'd like to discuss with you.

On 05/09/2023 11:50, krzysztof.kozlowski@linaro.org wrote:
> On 04/09/2023 13:46, wangweidong.a@awinic.com wrote:
>> From: Weidong Wang <wangweidong.a@awinic.com>
>> 

> ...

>> +static void aw87390_parse_channel_dt(struct aw87390 *aw87390)
>> +{
>> +	struct aw_device *aw_dev = aw87390->aw_pa;
>> +	struct device_node *np = aw_dev->dev->of_node;
>> +	u32 channel_value = AW87390_DEV_DEFAULT_CH;
>> +
>> +	of_property_read_u32(np, "sound-channel", &channel_value);

> NAK, there is no such property. It seems you already sneaked in such for
> other codecs. Please do not repeat such patterns of work.

> That's also why I expect full DTS example, not some reduced pieces.

Thank you very much. I would like to add a sound-channel property to awinic,aw87390.yaml
This property is used to distinguish between multiple PA's in order to 
load different configurations for different PA's

>> +
>> +	aw_dev->channel = channel_value;
>> +}
>> +
>> +static int aw87390_init(struct aw87390 **aw87390, struct i2c_client *i2c, struct regmap *regmap)
>> +{
>> +	struct aw_device *aw_dev;
>> +	unsigned int chip_id;
>> +	int ret;
>> +
>> +	/* read chip id */
>> +	ret = regmap_read(regmap, AW87390_ID_REG, &chip_id);
>> +	if (ret) {
>> +		dev_err(&i2c->dev, "%s read chipid error. ret = %d\n", __func__, ret);
>> +		return ret;
>> +	}
>> +
>> +	if (chip_id != AW87390_CHIP_ID) {
>> +		dev_err(&i2c->dev, "unsupported device\n");

> Why? The compatible tells it cannot be anything else.

>> +		return -ENXIO;
>> +	}
>> +
>> +	dev_info(&i2c->dev, "chip id = 0x%x\n", chip_id);
>> +
>> +	aw_dev = devm_kzalloc(&i2c->dev, sizeof(*aw_dev), GFP_KERNEL);
>> +	if (!aw_dev)
>> +		return -ENOMEM;
>> +
>> +	(*aw87390)->aw_pa = aw_dev;
>> +	aw_dev->i2c = i2c;
>> +	aw_dev->regmap = regmap;
>> +	aw_dev->dev = &i2c->dev;
>> +	aw_dev->chip_id = AW87390_CHIP_ID;
>> +	aw_dev->acf = NULL;
>> +	aw_dev->prof_info.prof_desc = NULL;
>> +	aw_dev->prof_info.count = 0;
>> +	aw_dev->prof_info.prof_type = AW88395_DEV_NONE_TYPE_ID;
>> +	aw_dev->channel = AW87390_DEV_DEFAULT_CH;
>> +	aw_dev->fw_status = AW87390_DEV_FW_FAILED;
>> +	aw_dev->prof_index = AW87390_INIT_PROFILE;
>> +	aw_dev->status = AW87390_DEV_PW_OFF;
>> +
>> +	aw87390_parse_channel_dt(*aw87390);
>> +
>> +	return ret;
>> +}
>> +
>> +static int aw87390_i2c_probe(struct i2c_client *i2c)
>> +{
>> +	struct aw87390 *aw87390;
>> +	int ret;
>> +
>> +	ret = i2c_check_functionality(i2c->adapter, I2C_FUNC_I2C);
>> +	if (!ret)
>> +		return dev_err_probe(&i2c->dev, -ENXIO, "check_functionality failed\n");
>> +
>> +	aw87390 = devm_kzalloc(&i2c->dev, sizeof(*aw87390), GFP_KERNEL);
>> +	if (!aw87390)
>> +		return -ENOMEM;
>> +
>> +	mutex_init(&aw87390->lock);
>> +
>> +	i2c_set_clientdata(i2c, aw87390);
>> +
>> +	aw87390->regmap = devm_regmap_init_i2c(i2c, &aw87390_remap_config);
>> +	if (IS_ERR(aw87390->regmap)) {
>> +		ret = PTR_ERR(aw87390->regmap);

> ret is not needed here, so just:
> return dev_err_probe()

Thank you very much. I will modify it to 
"return dev_err_probe(&i2c->dev, PTR_ERR(aw87390->regmap), "failed to init regmap: %d\n", ret);"

>> +		return dev_err_probe(&i2c->dev, ret, "failed to init regmap: %d\n", ret);
>> +	}
>> +
>> +	/* aw pa init */
>> +	ret = aw87390_init(&aw87390, i2c, aw87390->regmap);
>> +	if (ret)
>> +		return ret;
>> +
>> +	ret = regmap_write(aw87390->regmap, AW87390_ID_REG, AW87390_SOFT_RESET_VALUE);
>> +	if (ret)
>> +		return ret;
>> +
>> +	ret = devm_snd_soc_register_component(&i2c->dev,
>> +				&soc_codec_dev_aw87390, NULL, 0);
>> +	if (ret)
>> +		dev_err(&i2c->dev, "failed to register aw87390: %d\n", ret);
>> +
>> +	return ret;
>> +}


Best regards,
Weidong Wang
