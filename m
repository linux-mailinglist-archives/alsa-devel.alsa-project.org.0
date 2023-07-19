Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4692F758BE6
	for <lists+alsa-devel@lfdr.de>; Wed, 19 Jul 2023 05:13:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C5B791FC;
	Wed, 19 Jul 2023 05:12:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C5B791FC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689736429;
	bh=d/ru70VUa2jVvdr/g3DeMfCLy7SlSyI0xz5Dw8Pz6m0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=gZbeTomKfwcXfBgOKu42AUMZWGL6pc6qYVjR3sRpMsCLM03WVW0E0cFz10fNZNECS
	 +7vp3I1DrJvG7XUYUi3nQ6tYqHlOmuJOi8DRva1dUfp+ugUDzulzvbmlRTMmBDseYb
	 w9hENzPHBxemKZxJ90LRflMH/UyPU/l1AoCkPMws=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 94A61F80527; Wed, 19 Jul 2023 05:12:59 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E938DF8032D;
	Wed, 19 Jul 2023 05:12:58 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 96BABF8047D; Wed, 19 Jul 2023 05:12:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
	RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,UNPARSEABLE_RELAY shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from out28-76.mail.aliyun.com (out28-76.mail.aliyun.com
 [115.124.28.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id CFFAAF80153
	for <alsa-devel@alsa-project.org>; Wed, 19 Jul 2023 05:12:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CFFAAF80153
X-Alimail-AntiSpam: 
 AC=CONTINUE;BC=0.07720535|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_system_inform|0.00838821-0.000344401-0.991267;FP=0|0|0|0|0|-1|-1|-1;HT=ay29a033018047208;MF=wangweidong.a@awinic.com;NM=1;PH=DS;RN=26;RT=26;SR=0;TI=SMTPD_---.Tx4TxI5_1689736357;
Received: from ubuntu-VirtualBox..(mailfrom:wangweidong.a@awinic.com
 fp:SMTPD_---.Tx4TxI5_1689736357)
          by smtp.aliyun-inc.com;
          Wed, 19 Jul 2023 11:12:40 +0800
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
Subject: Re: [PATCH V1 3/5] ASoC: codecs: ACF bin parsing and check library
 file for aw88261
Date: Wed, 19 Jul 2023 11:12:37 +0800
Message-ID: <20230719031237.41530-1-wangweidong.a@awinic.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <98292541-8435-53cb-22d9-716ed6541485@linaro.org>
References: <98292541-8435-53cb-22d9-716ed6541485@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: L2QPC2GEMAX7DF52K6NMKKQFO6N5W3J6
X-Message-ID-Hash: L2QPC2GEMAX7DF52K6NMKKQFO6N5W3J6
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/L2QPC2GEMAX7DF52K6NMKKQFO6N5W3J6/>
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

On 18/07/2023 16:41, krzysztof.kozlowski@linaro.org wrote:
> On 17/07/2023 13:58, wangweidong.a@awinic.com wrote:
>> From: Weidong Wang <wangweidong.a@awinic.com>
>> 
>> The AW88261 is an I2S/TDM input, high efficiency
>> digital Smart K audio amplifier with an integrated 10.25V
>> smart boost convert

> So all your commits are doing the same?

I will modify the commit information and differentiate the commit 
 information for each file

>> 
>> Signed-off-by: Weidong Wang <wangweidong.a@awinic.com>
>> ---
>>  sound/soc/codecs/aw88261/aw88261_lib.c | 997 +++++++++++++++++++++++++
>>  sound/soc/codecs/aw88261/aw88261_lib.h |  91 +++
>>  2 files changed, 1088 insertions(+)
>>  create mode 100644 sound/soc/codecs/aw88261/aw88261_lib.c
>>  create mode 100644 sound/soc/codecs/aw88261/aw88261_lib.h
>> 
>> diff --git a/sound/soc/codecs/aw88261/aw88261_lib.c b/sound/soc/codecs/aw88261/aw88261_lib.c
>> new file mode 100644
>> index 000000000000..b8f00708dacf
>> --- /dev/null
>> +++ b/sound/soc/codecs/aw88261/aw88261_lib.c
>> @@ -0,0 +1,997 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +//
>> +// aw88261_lib.c  -- ACF bin parsing and check library file for aw88261
>> +//
>> +// Copyright (c) 2023 awinic Technology CO., LTD
>> +//
>> +// Author: Jimmy Zhang <zhangjianming@awinic.com>
>> +// Author: Weidong Wang <wangweidong.a@awinic.com>
>> +//
>> +
>> +#include <linux/crc8.h>
>> +#include <linux/i2c.h>
>> +#include "aw88261_lib.h"
>> +#include "aw88261_device.h"
>> +
>> +#define AW88261_CRC8_POLYNOMIAL 0x8C
>> +DECLARE_CRC8_TABLE(aw_crc8_table);
>> +
>> +static char *profile_name[AW88261_PROFILE_MAX] = {

> Cannot be const char *?

I will modify it according to your suggestion

...

>> +EXPORT_SYMBOL_GPL(aw88261_dev_load_acf_check);

> Why?

This function is also called in the aw88261.c file

Best regards,
Weidong Wang
