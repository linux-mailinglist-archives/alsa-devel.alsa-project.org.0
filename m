Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 797087CA155
	for <lists+alsa-devel@lfdr.de>; Mon, 16 Oct 2023 10:11:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C5C4484B;
	Mon, 16 Oct 2023 10:10:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C5C4484B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1697443892;
	bh=zaBr6l2KlSeUwNySP4VYmncmy9eplJW/9BjkmtA/sQ8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=f3aa+e3ThvwaoFxfAeM0hCQfdgA6Id2ZUPnO8joqe+I9fpKrBgg/1FRVUwplhP9zt
	 JwVdGJatpbO50UbNh67FlNutQuCfgxX3mebzrHpF+jBlyQQOtDtFOZhcGdNhuJgY1o
	 ROkXqSlmoyxtahmJPS+t88dBkCcuLJqt/ca8tHzc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2600AF8024E; Mon, 16 Oct 2023 10:10:42 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A258EF8024E;
	Mon, 16 Oct 2023 10:10:41 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 02D28F8025F; Mon, 16 Oct 2023 10:10:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
	RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,
	UNPARSEABLE_RELAY shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from out28-194.mail.aliyun.com (out28-194.mail.aliyun.com
 [115.124.28.194])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6AF12F80236
	for <alsa-devel@alsa-project.org>; Mon, 16 Oct 2023 10:10:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6AF12F80236
X-Alimail-AntiSpam: 
 AC=CONTINUE;BC=0.07441231|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_system_inform|0.0174846-0.000237189-0.982278;FP=0|0|0|0|0|-1|-1|-1;HT=ay29a033018047209;MF=wangweidong.a@awinic.com;NM=1;PH=DS;RN=26;RT=26;SR=0;TI=SMTPD_---.V04yDun_1697443818;
Received: from ubuntu-VirtualBox..(mailfrom:wangweidong.a@awinic.com
 fp:SMTPD_---.V04yDun_1697443818)
          by smtp.aliyun-inc.com;
          Mon, 16 Oct 2023 16:10:26 +0800
From: wangweidong.a@awinic.com
To: broonie@kernel.org
Cc: 13916275206@139.com,
	alsa-devel@alsa-project.org,
	arnd@arndb.de,
	ckeepax@opensource.cirrus.com,
	colin.i.king@gmail.com,
	conor+dt@kernel.org,
	dan.carpenter@linaro.org,
	devicetree@vger.kernel.org,
	fido_max@inbox.ru,
	herve.codina@bootlin.com,
	krzysztof.kozlowski+dt@linaro.org,
	lgirdwood@gmail.com,
	linus.walleij@linaro.org,
	linux-kernel@vger.kernel.org,
	liweilei@awinic.com,
	perex@perex.cz,
	rf@opensource.cirrus.com,
	robh+dt@kernel.org,
	ryans.lee@analog.com,
	sebastian.reichel@collabora.com,
	shumingf@realtek.com,
	tiwai@suse.com,
	trix@redhat.com,
	wangweidong.a@awinic.com,
	yijiangtao@awinic.com
Subject: Re: [PATCH V1 3/3] ASoC: codecs: Add aw88399 amplifier driver
Date: Mon, 16 Oct 2023 16:10:17 +0800
Message-ID: <20231016081017.46963-1-wangweidong.a@awinic.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <ZSlP8GvTAOe35peC@finisterre.sirena.org.uk>
References: <ZSlP8GvTAOe35peC@finisterre.sirena.org.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: E6LL33TGXHCDTYWPC3CTQ36GP652XYGE
X-Message-ID-Hash: E6LL33TGXHCDTYWPC3CTQ36GP652XYGE
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/E6LL33TGXHCDTYWPC3CTQ36GP652XYGE/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Thank you very much for your review

On Fri, Oct 13, 2023 at 03:10:56 PM +0100, broonie@kernel.org wrote:
> On Fri, Oct 13, 2023 at 06:42:20PM +0800, wangweidong.a@awinic.com wrote:

> This looks good - some *very* minor comments below.

>> +static const struct regmap_config aw88399_remap_config = {
>> +	.val_bits = 16,
>> +	.reg_bits = 8,
>> +	.max_register = AW88399_REG_MAX - 1,

> I see this is already the case for the aw88261 driver but it is a bit
> weird that _REG_MAX isn't the maximum register - it looks like it should
> probably be _NUM_REG.  Not the end of the world though.

Thank you very much, I will modify it to ".max_register = AW88399_REG_MAX;"

>> +static int aw_dev_dsp_update_container(struct aw_device *aw_dev,
>> +			unsigned char *data, unsigned int len, unsigned short base)
>> +{
>> +	int i, ret;
>> +
>> +#ifdef AW88399_DSP_I2C_WRITES
>> +	u32 tmp_len;

> This looks like debug code which can hopefully be removed in favour of
> the regmap implementation?

Thank you very much, but this is not a debugging statement, This is designed
to be compatible with different platforms that may not support continuous
writing.

>> +static int aw88399_codec_probe(struct snd_soc_component *component)
>> +{
>> +	struct snd_soc_dapm_context *dapm = snd_soc_component_get_dapm(component);
>> +	struct aw88399 *aw88399 = snd_soc_component_get_drvdata(component);
>> +	int ret;
>> +
>> +	ret = aw88399_request_firmware_file(aw88399);
>> +	if (ret < 0) {
>> +		dev_err(aw88399->aw_pa->dev, "%s failed\n", __func__);
>> +		return ret;
>> +	}
>> +
>> +	INIT_DELAYED_WORK(&aw88399->start_work, aw88399_startup_work);
>> +
>> +	/* add widgets */
>> +	ret = snd_soc_dapm_new_controls(dapm, aw88399_dapm_widgets,
>> +							ARRAY_SIZE(aw88399_dapm_widgets));
>> +	if (ret < 0)
>> +		return ret;
>> +
>> +	/* add route */
>> +	ret = snd_soc_dapm_add_routes(dapm, aw88399_audio_map,
>> +							ARRAY_SIZE(aw88399_audio_map));
>> +	if (ret < 0)
>> +		return ret;
>> +
>> +	ret = snd_soc_add_component_controls(component, aw88399_controls,
>> +							ARRAY_SIZE(aw88399_controls));

> You should just be able to pass these arrays in the component strucutre?

Thank you very much. I will modify it

Best regards,
Weidong Wang
