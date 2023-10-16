Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D34407CA145
	for <lists+alsa-devel@lfdr.de>; Mon, 16 Oct 2023 10:08:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2687D84A;
	Mon, 16 Oct 2023 10:08:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2687D84A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1697443732;
	bh=8aCy4YzwPToYnVeQsNgsPXahd+yDBteAMd651gYtSfo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=QHGtCxCy7MWvRscMpDABNZBkCW+I4lEFl+wBNk9Hc2o4FSWaQ1J+99bNdhmUr3v8P
	 XCcHeVVehVeK/JLKJp32J1pmi8BUvWAQwUbUe4eyo6AaNky4SfwT/8oFByxM+Ja/r3
	 28+TjuuoXChyoqHnvnFaWb2g48aNY84UY712WIBY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5BADBF8032D; Mon, 16 Oct 2023 10:08:01 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 13721F8024E;
	Mon, 16 Oct 2023 10:08:01 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EAC9EF8025F; Mon, 16 Oct 2023 10:06:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
	RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,
	UNPARSEABLE_RELAY shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from out28-193.mail.aliyun.com (out28-193.mail.aliyun.com
 [115.124.28.193])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0200DF8019B
	for <alsa-devel@alsa-project.org>; Mon, 16 Oct 2023 10:05:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0200DF8019B
X-Alimail-AntiSpam: 
 AC=CONTINUE;BC=0.2612196|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_news_journal|0.0128076-0.000445282-0.986747;FP=0|0|0|0|0|-1|-1|-1;HT=ay29a033018047208;MF=wangweidong.a@awinic.com;NM=1;PH=DS;RN=27;RT=27;SR=0;TI=SMTPD_---.V04MZU._1697443545;
Received: from ubuntu-VirtualBox..(mailfrom:wangweidong.a@awinic.com
 fp:SMTPD_---.V04MZU._1697443545)
          by smtp.aliyun-inc.com;
          Mon, 16 Oct 2023 16:05:53 +0800
From: wangweidong.a@awinic.com
To: krzysztof.kozlowski@linaro.org
Cc: 13916275206@139.com,
	alsa-devel@alsa-project.org,
	arnd@arndb.de,
	broonie@kernel.org,
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
Date: Mon, 16 Oct 2023 16:05:44 +0800
Message-ID: <20231016080544.45778-1-wangweidong.a@awinic.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <37a2d2d1-5ede-4f88-b4e7-d9750336465d@linaro.org>
References: <37a2d2d1-5ede-4f88-b4e7-d9750336465d@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 6DSXYZQEWB6HCFJUPHSGE3MXGGZ2OWJN
X-Message-ID-Hash: 6DSXYZQEWB6HCFJUPHSGE3MXGGZ2OWJN
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6DSXYZQEWB6HCFJUPHSGE3MXGGZ2OWJN/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Thank you very much for your review

On 13/10/2023 13:50, +200 krzysztof.kozlowski@linaro.org wrote:
> On 13/10/2023 12:42, wangweidong.a@awinic.com wrote:
>> From: Weidong Wang <wangweidong.a@awinic.com>
>> 
>> Add i2c and amplifier registration for
>> aw88399 and their associated operation functions.
>> 


>> +
>> +static void aw88399_hw_reset(struct aw88399 *aw88399)
>> +{
>> +	if (aw88399->reset_gpio) {
>> +		gpiod_set_value_cansleep(aw88399->reset_gpio, 0);
>> +		usleep_range(AW88399_1000_US, AW88399_1000_US + 10);
>> +		gpiod_set_value_cansleep(aw88399->reset_gpio, 1);

> Why do you leave the device in reset state? I think you wanted these
> reverted.

our chip is reset at low level, So I'll change it to
    gpiod_set_value_cansleep(aw88399->reset_gpio, 1);
	usleep_range(AW88399_1000_US, AW88399_1000_US + 10);
	gpiod_set_value_cansleep(aw88399->reset_gpio, 0);
	usleep_range(AW88399_1000_US, AW88399_1000_US + 10);
	gpiod_set_value_cansleep(aw88399->reset_gpio, 1);
Thanks again for your advice.

Best regards,
Weidong Wang
