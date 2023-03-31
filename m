Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C98676D2990
	for <lists+alsa-devel@lfdr.de>; Fri, 31 Mar 2023 22:42:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BA2611F1;
	Fri, 31 Mar 2023 22:41:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BA2611F1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1680295356;
	bh=VXVjcwGVYzUEzPZS5+Pk4+wUr+vGoG70AaLub12SgGY=;
	h=Date:Subject:To:References:From:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=LZmBFrW+Sfmm8aWZ1faPdH9bhdy3yTJl2nDW89tsRRt6IcEoMvgbCvKtQU2KzmMw8
	 As7s8PPTvDRb5unDQ4bP4IzTv/jbhq/xRtSvJR3BKoMLGMWHfRw+naXrdr7bocfVCx
	 DbgSTDk0ubQ/b8jyrxt4iOOn9OLPXF3LCN1A1g4w=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 297B3F8024E;
	Fri, 31 Mar 2023 22:41:46 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 704F8F80272; Fri, 31 Mar 2023 22:41:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=NICE_REPLY_A,
	RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from smtp.smtpout.orange.fr (smtp-16.smtpout.orange.fr
 [80.12.242.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5BF0CF80114
	for <alsa-devel@alsa-project.org>; Fri, 31 Mar 2023 22:41:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5BF0CF80114
Received: from [192.168.1.18] ([86.243.2.178])
	by smtp.orange.fr with ESMTPA
	id iLYopzKfMmTnIiLYopYmd3; Fri, 31 Mar 2023 22:41:27 +0200
X-ME-Helo: [192.168.1.18]
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Fri, 31 Mar 2023 22:41:27 +0200
X-ME-IP: 86.243.2.178
Message-ID: <458d7c2f-bcee-9ec3-e955-9661a06a3349@wanadoo.fr>
Date: Fri, 31 Mar 2023 22:41:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v10] ASoC: tas2781: Add tas2781 driver
Content-Language: fr, en-US
To: "Ding, Shenghao" <shenghao-ding@ti.com>,
 Amadeusz Slawinski <amadeuszx.slawinski@linux.intel.com>,
 Shenghao Ding <13916275206@139.com>, "broonie@kernel.org"
 <broonie@kernel.org>, "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
 "perex@perex.cz" <perex@perex.cz>,
 "pierre-louis.bossart@linux.intel.com" <pierre-louis.bossart@linux.intel.com>
References: <20230329100107.8181-1-13916275206@139.com>
 <8d0d0478-1e45-ea52-f1b7-910b747d6282@linux.intel.com>
 <7a0cfa60e2a244168edd49c3d2f6a2bd@ti.com>
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
In-Reply-To: <7a0cfa60e2a244168edd49c3d2f6a2bd@ti.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 6CUD5AX56CYI322FOUR25VZT6B4FO3JZ
X-Message-ID-Hash: 6CUD5AX56CYI322FOUR25VZT6B4FO3JZ
X-MailFrom: christophe.jaillet@wanadoo.fr
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: "Lu, Kevin" <kevin-lu@ti.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Xu,
 Baojun" <x1077012@ti.com>, "Gupta, Peeyush" <peeyush@ti.com>,
 "Navada Kanyana, Mukund" <navada@ti.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6CUD5AX56CYI322FOUR25VZT6B4FO3JZ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Le 31/03/2023 à 04:19, Ding, Shenghao a écrit :
> Hi Amadeusz Sławiński
> Thanks for your comment.
> Answer inline.
> 
> -----Original Message-----
> From: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
> Sent: Thursday, March 30, 2023 7:54 PM
> To: Shenghao Ding <13916275206@139.com>; broonie@kernel.org; lgirdwood@gmail.com; perex@perex.cz; pierre-louis.bossart@linux.intel.com
> Cc: Lu, Kevin <kevin-lu@ti.com>; Ding, Shenghao <shenghao-ding@ti.com>; alsa-devel@alsa-project.org; linux-kernel@vger.kernel.org; Xu, Baojun <x1077012@ti.com>; Gupta, Peeyush <peeyush@ti.com>; Navada Kanyana, Mukund <navada@ti.com>
> Subject: [EXTERNAL] Re: [PATCH v10] ASoC: tas2781: Add tas2781 driver
> 
> On 3/29/2023 12:01 PM, Shenghao Ding wrote:
>> Create tas2781 driver.
>>
>> Signed-off-by: Shenghao Ding <13916275206@139.com>
>>
>> ---
>> Changes in v10:
>>    - using be16_to_cpu and be32_to_cpu instead of SMS_HTONS and SMS_HTONL
>>    - optimize and reduce the boundary checks
>>    - Add comments on some kmemdup instead of kzalloc+memcpy
>>    Changes to be committed:
>> 	modified:   sound/soc/codecs/Kconfig
>> 	modified:   sound/soc/codecs/Makefile
>> 	new file:   sound/soc/codecs/tas2781-dsp.c
>> 	new file:   sound/soc/codecs/tas2781-dsp.h
>> 	new file:   sound/soc/codecs/tas2781-i2c.c
>> 	new file:   sound/soc/codecs/tas2781.h
>> ---
> 
> ...
> 
>> +
>> +static int fw_parse_block_data_kernel(struct tasdevice_fw *tas_fmw,
>> +	struct tasdev_blk *block, const struct firmware *fmw, int offset) {
>> +	const unsigned char *data = fmw->data;
>> +
>> +	if (offset + 16 > fmw->size) {
>> +		dev_err(tas_fmw->dev, "%s: File Size error\n", __func__);
>> +		offset = -EINVAL;
>> +		goto out;
>> +	}
>> +	block->type = be32_to_cpup((__be32 *)&data[offset]);
> 
> Wouldn't just be32_to_cpu(data[offset]) work instead of be32_to_cpup?
> Same in other cases.
> [DING] data[] is a char array, the code will convert data[offset], data[offset + 1],
> data[offset + 2] and data[offset + 3] into host instead of data[offset] only.
> 

Not sure to follow you.
Isn't it the purpose of be32_to_cpu() to take a 32 bits word, in other 
words 4 x 8 bits char, and swap what if needed (little endian arch)?

It ends to __swab32() ([1] for the "constant" implementation)


be32_to_cpup(&p) ends to __swab32(*p), which really looks to the same as 
be32_to_cpu(p).

Can you elaborate more?

CJ


[1]: 
https://elixir.bootlin.com/linux/v6.3-rc3/source/include/uapi/linux/swab.h#L18

