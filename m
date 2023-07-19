Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EFE7758BE0
	for <lists+alsa-devel@lfdr.de>; Wed, 19 Jul 2023 05:11:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C25491F6;
	Wed, 19 Jul 2023 05:10:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C25491F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689736273;
	bh=iooe6fOluNG8eE0lWunStS5GSFkiWunZntjr742WX48=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=nSI6wu1EFYcbw7eZFfEu4dhq4Bv8prjZtvMqLOHqCc9tLE7pGcg9sBG8bYexQwOUG
	 vbUg5B+hUrosyC6UKPF7YA2sXILZCn+mkkkHCN+DJh85fUueSEkbZCuU1P6PrqCYTT
	 1a6N5f5/VvgtpVA5kQogVsB0Nxg05Ebs1cdlGf1M=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2DFACF80527; Wed, 19 Jul 2023 05:10:23 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A1D4CF8032D;
	Wed, 19 Jul 2023 05:10:22 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8F41DF8047D; Wed, 19 Jul 2023 05:10:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
	RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,UNPARSEABLE_RELAY shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from out28-2.mail.aliyun.com (out28-2.mail.aliyun.com
 [115.124.28.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B9EB6F800D2
	for <alsa-devel@alsa-project.org>; Wed, 19 Jul 2023 05:10:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B9EB6F800D2
X-Alimail-AntiSpam: 
 AC=CONTINUE;BC=0.0745111|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_regular_dialog|0.0197397-0.000681479-0.979579;FP=0|0|0|0|0|-1|-1|-1;HT=ay29a033018047194;MF=wangweidong.a@awinic.com;NM=1;PH=DS;RN=26;RT=26;SR=0;TI=SMTPD_---.Tx3Tklt_1689736195;
Received: from ubuntu-VirtualBox..(mailfrom:wangweidong.a@awinic.com
 fp:SMTPD_---.Tx3Tklt_1689736195)
          by smtp.aliyun-inc.com;
          Wed, 19 Jul 2023 11:09:59 +0800
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
Subject: Re: [PATCH V1 2/5] ASoC: codecs: aw88261 function for ALSA Audio
 Driver
Date: Wed, 19 Jul 2023 11:09:55 +0800
Message-ID: <20230719030955.41489-1-wangweidong.a@awinic.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <4ef0d83e-b0c9-1f6e-c1a4-24d650630fe4@linaro.org>
References: <4ef0d83e-b0c9-1f6e-c1a4-24d650630fe4@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: WRBQNVIGHPV4X5FYHE36PCK7QXGRYEVS
X-Message-ID-Hash: WRBQNVIGHPV4X5FYHE36PCK7QXGRYEVS
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/WRBQNVIGHPV4X5FYHE36PCK7QXGRYEVS/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi, Krzysztof,
Thank you very much for your advice, 
 but I have a few questions I'd like to discuss with you

On 18/07/2023 16:58, krzysztof.kozlowski@linaro.org wrote:
> On 17/07/2023 13:58, wangweidong.a@awinic.com wrote:
>> From: Weidong Wang <wangweidong.a@awinic.com>
>> 
>> The AW88261 is an I2S/TDM input, high efficiency
>> digital Smart K audio amplifier with an integrated 10.25V
>> smart boost convert

> It's the same as in patch before. This does not help and does not
> justify having one driver split into two.

I will modify the commit information and differentiate the commit 
 information for each file

>> 

...

>> +
>> +static void aw_dev_i2s_tx_enable(struct aw_device *aw_dev, bool flag)
>> +{
>> +	int ret;
>> +
>> +	if (flag) {
>> +		ret = regmap_update_bits(aw_dev->regmap, AW88261_I2SCFG1_REG,
>> +			~AW88261_I2STXEN_MASK, AW88261_I2STXEN_ENABLE_VALUE);
>> +	} else {
>> +		ret = regmap_update_bits(aw_dev->regmap, AW88261_I2SCFG1_REG,
>> +			~AW88261_I2STXEN_MASK, AW88261_I2STXEN_DISABLE_VALUE);
>> +	}

> You should not need {} here and in multiple other places.

I will delete {} as suggested

>> +	if (ret)
>> +		dev_dbg(aw_dev->dev, "%s failed", __func__);

> Why you are not handling the errors properly?

Do you need to use dev_err instead?

>> +}
>> +
>> +static void aw_dev_pwd(struct aw_device *aw_dev, bool pwd)
>> +{
>> +	int ret;
>> +
>> +	if (pwd) {
>> +		ret = regmap_update_bits(aw_dev->regmap, AW88261_SYSCTRL_REG,
>> +				~AW88261_PWDN_MASK,	AW88261_PWDN_POWER_DOWN_VALUE);
>> +	} else {
>> +		ret = regmap_update_bits(aw_dev->regmap, AW88261_SYSCTRL_REG,
>> +				~AW88261_PWDN_MASK,	AW88261_PWDN_WORKING_VALUE);
>> +	}
>> +	if (ret)
>> +		dev_dbg(aw_dev->dev, "%s failed", __func__);
>> +}
>> +

...

>> +
>> +int aw88261_dev_fw_update(struct aw_device *aw_dev)
>> +{
>> +	struct aw_prof_desc *prof_index_desc;
>> +	struct aw_sec_data_desc *sec_desc;
>> +	char *prof_name;
>> +	int ret;
>> +
>> +	prof_name = aw88261_dev_get_prof_name(aw_dev, aw_dev->prof_index);
>> +	if (!prof_name) {
>> +		dev_err(aw_dev->dev, "get prof name failed");
>> +		return -EINVAL;
>> +	}
>> +
>> +	dev_dbg(aw_dev->dev, "start update %s", prof_name);
>> +
>> +	ret = aw88261_dev_get_prof_data(aw_dev, aw_dev->prof_index, &prof_index_desc);
>> +	if (ret)
>> +		return ret;
>> +
>> +	/* update reg */
>> +	sec_desc = prof_index_desc->sec_desc;
>> +	ret = aw_dev_reg_update(aw_dev, sec_desc[AW88261_DATA_TYPE_REG].data,
>> +					sec_desc[AW88261_DATA_TYPE_REG].len);
>> +	if (ret) {
>> +		dev_err(aw_dev->dev, "update reg failed");
>> +		return ret;
>> +	}
>> +
>> +	aw_dev->prof_cur = aw_dev->prof_index;
>> +
>> +	return ret;
>> +}
>> +EXPORT_SYMBOL_GPL(aw88261_dev_fw_update);

> Why do you need to export this? Where is the user?

I will delete this export

>> +
>> +int aw88261_dev_reg_update(struct aw_device *aw_dev, bool force)
>> +{
>> +	int ret;
>> +
>> +	if (force) {
>> +		aw88261_dev_soft_reset(aw_dev);
>> +		ret = aw88261_dev_fw_update(aw_dev);
>> +		if (ret < 0)
>> +			return ret;
>> +	} else {
>> +		if (aw_dev->prof_cur != aw_dev->prof_index) {
>> +			ret = aw88261_dev_fw_update(aw_dev);
>> +			if (ret < 0)
>> +				return ret;
>> +		}
>> +	}
>> +
>> +	aw_dev->prof_cur = aw_dev->prof_index;
>> +
>> +	return ret;
>> +}
>> +EXPORT_SYMBOL_GPL(aw88261_dev_reg_update);

> Same question. And in all other places as well.

This function will be called in aw88261.c, can I keep it?

Best regards,
Weidong Wang
