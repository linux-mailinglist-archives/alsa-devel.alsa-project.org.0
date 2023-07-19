Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AB7E758BC4
	for <lists+alsa-devel@lfdr.de>; Wed, 19 Jul 2023 05:05:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 01ED0203;
	Wed, 19 Jul 2023 05:04:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 01ED0203
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689735917;
	bh=d+LKrMF5a+qWM4xAFOrSzr/ck2KJc4KLpqyyQwB2wXw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Gtk0woCWFY62fgu85bbvkSKJqxxhvp9bVKKUTFYyla7SbVzmPsZ1DdchkUBbAgVt8
	 FsDKkVM6EBzL+VGcAYzVTnc5uNVrj9DRTYiFAkcgrttFpS7MsckV91JtOxRwmpcK3S
	 VOxzlNW8NNOwyxcvlwthpjW1jw/IL+HzIuHkmuEs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 24B0FF8055B; Wed, 19 Jul 2023 05:03:40 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D78A3F80548;
	Wed, 19 Jul 2023 05:03:39 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 40C98F8047D; Wed, 19 Jul 2023 05:03:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
	RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,UNPARSEABLE_RELAY shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from out28-169.mail.aliyun.com (out28-169.mail.aliyun.com
 [115.124.28.169])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D366FF80153
	for <alsa-devel@alsa-project.org>; Wed, 19 Jul 2023 05:03:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D366FF80153
X-Alimail-AntiSpam: 
 AC=CONTINUE;BC=0.09700525|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_social|0.00813514-0.000320179-0.991545;FP=0|0|0|0|0|-1|-1|-1;HT=ay29a033018047206;MF=wangweidong.a@awinic.com;NM=1;PH=DS;RN=26;RT=26;SR=0;TI=SMTPD_---.Tx3STlc_1689735772;
Received: from ubuntu-VirtualBox..(mailfrom:wangweidong.a@awinic.com
 fp:SMTPD_---.Tx3STlc_1689735772)
          by smtp.aliyun-inc.com;
          Wed, 19 Jul 2023 11:02:56 +0800
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
Subject: Re: [PATCH V1 5/5] ASoC: dt-bindings: Add schema for "awinic,aw88261"
Date: Wed, 19 Jul 2023 11:02:52 +0800
Message-ID: <20230719030252.41396-1-wangweidong.a@awinic.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <192fa604-5fe6-c5c2-7fca-10f3a271b640@linaro.org>
References: <192fa604-5fe6-c5c2-7fca-10f3a271b640@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: GODJTWXYPS2QMG6H4GYYTLFRO5KLPRGV
X-Message-ID-Hash: GODJTWXYPS2QMG6H4GYYTLFRO5KLPRGV
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/GODJTWXYPS2QMG6H4GYYTLFRO5KLPRGV/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi, Krzysztof,
Thank you very much for your advice.

On 18/07/2023 16:24, krzysztof.kozlowski@linaro.org wrote:
> On 17/07/2023 13:58, wangweidong.a@awinic.com wrote:
>> From: Weidong Wang <wangweidong.a@awinic.com>
>> 
>> Add a DT schema for describing Awinic aw88261 audio amplifiers. They are
>> controlled using I2C.
>> 
>> Signed-off-by: Weidong Wang <wangweidong.a@awinic.com>

...

>> +  compatible:
>> +    const: awinic,aw88261
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  '#sound-dai-cells':
>> +    const: 0
>> +
>> +  reset-gpios:
>> +    maxItems: 1
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - '#sound-dai-cells'
>> +  - reset-gpios

> I don't see any differences against AW88395. Add the compatible to that
> schema.

I will add "awinic,aw88261" to the awinic,aw88395.yaml

Best regards,
Weidong Wang
