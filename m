Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 03138768F1D
	for <lists+alsa-devel@lfdr.de>; Mon, 31 Jul 2023 09:44:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7436E4E;
	Mon, 31 Jul 2023 09:43:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7436E4E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690789458;
	bh=85VYgR+rGTC6jrfqIp9RI4etMMiC7NTNmz26pSAsXDA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=YuLSIaMt/ES19KJMFDt+Ff55vcC0GNhXMNel4ho+nVo0VsZAVpMkYCyzZuihQB0to
	 JVA2tNI4dO05j9WuTBZpkMUDNomzJzC1cAnEWlMeLAN+d5wnXdZTybTxL/UzKtIKZC
	 NURQxRNM13Rbzi4+ElmRM0tcpPN52Cs9r3rubnJE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D59F4F80425; Mon, 31 Jul 2023 09:43:27 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 69EF7F80163;
	Mon, 31 Jul 2023 09:43:27 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 80CC4F8016D; Mon, 31 Jul 2023 09:43:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
	RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,UNPARSEABLE_RELAY shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from out28-101.mail.aliyun.com (out28-101.mail.aliyun.com
 [115.124.28.101])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 043E9F8015B
	for <alsa-devel@alsa-project.org>; Mon, 31 Jul 2023 09:43:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 043E9F8015B
X-Alimail-AntiSpam: 
 AC=CONTINUE;BC=0.0779505|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_system_inform|0.0237288-0.000924996-0.975346;FP=0|0|0|0|0|-1|-1|-1;HT=ay29a033018047207;MF=wangweidong.a@awinic.com;NM=1;PH=DS;RN=26;RT=26;SR=0;TI=SMTPD_---.U4fOa9R_1690789380;
Received: from ubuntu-VirtualBox..(mailfrom:wangweidong.a@awinic.com
 fp:SMTPD_---.U4fOa9R_1690789380)
          by smtp.aliyun-inc.com;
          Mon, 31 Jul 2023 15:43:03 +0800
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
Subject: Re: [PATCH V3 4/5] ASoC: codecs: aw88261 device related operation
 functions
Date: Mon, 31 Jul 2023 15:43:00 +0800
Message-ID: <20230731074300.6200-1-wangweidong.a@awinic.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <be25dead-89f0-8859-d182-84754ad8bfc0@linaro.org>
References: <be25dead-89f0-8859-d182-84754ad8bfc0@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: BF5O6NGHMKOHA4TBFMGW3F2FJACB3D6N
X-Message-ID-Hash: BF5O6NGHMKOHA4TBFMGW3F2FJACB3D6N
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/BF5O6NGHMKOHA4TBFMGW3F2FJACB3D6N/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Thank you very much for your advice

On 31/07/2023 08:51, krzysztof.kozlowski@linaro.org wrote:
> On 31/07/2023 08:41, wangweidong.a@awinic.com wrote:
>> 
>>>> +
>>>> +	return 0;
>>>> +}
>>>> +
>>>> +int aw88261_dev_init(struct aw88261_device *aw_dev, struct aw_container *aw_cfg)
>> 
>>> You already used this function in patch #3, so your order of patches is
>>> confusing.
>> 
>> Do I need to change the order of patch? 
>> Do I neeed to put aw88261_device.c aw88261_device.h in patch #3 and 
>> put aw88261.c aw88261.h in patch #4?
>> Is that how you change the order?

> Your patchset should be logically ordered, so first you add bindings
> (because it must be before their users), then you one piece, then other
> etc. I understand that only the last patch will make everything
> buildable, but still code should be added before its user/caller.

Thank you very much for your suggestion. 
Do I need to keep the Makefile and kconfig files in a separate patch?

...

>> 
>>>> +
>>>> +	switch (chip_id) {
>>>> +	case AW88261_CHIP_ID:
>>>> +		ret = aw_dev_init((*aw_dev));
>>>> +		break;
>>>> +	default:
>>>> +		ret = -EINVAL;
>>>> +		dev_err((*aw_dev)->dev, "unsupported device");
>>>> +		break;
>>>> +	}
>>>> +
>>>> +	return ret;
>>>> +}
>>>> +
>>>> +MODULE_DESCRIPTION("AW88261 device");
>>>> +MODULE_LICENSE("GPL v2");
>> 
>>> Wait, is this a module? Does not look complete. I already saw one
>>> module, so what is this for? For which module?
>> 
>> Can it be changed to MODULE_DESCRIPTION("AW88261 device lib")?

> If this is a module, then it can. If this is not a module, then why
> would you ever like to do it?

>> The function in the aw88261_device.c file, which I used in the aw88261.c file.

> Functions are not modules.

Thank you very much for your suggestion. 
I will delete MODULE_DESCRIPTION and MODULE_LICENSE

Best regards,
Weidong Wang
