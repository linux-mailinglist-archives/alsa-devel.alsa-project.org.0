Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 67DBD6D7B7B
	for <lists+alsa-devel@lfdr.de>; Wed,  5 Apr 2023 13:37:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0D7C5200;
	Wed,  5 Apr 2023 13:36:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0D7C5200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1680694626;
	bh=z4M+lGF3PxW5jIEFmkFI2Pz3GGvuMaU0PB9nsRWm/Lw=;
	h=Date:Subject:To:References:From:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=MivtmxJfDwc0ez13WApSN2H1BrnVAA6zU4ebpwDVLeTwOXXI0o3xK1yIzKuJG6h1Z
	 GxG61vRPkIpaN89ydfkagHNZBtFXYQV8eAWi/q1DNqGXxuVyeZ5YpHaRLYdqDDryMk
	 crTTh60ky3/ZHalrwQYApPDzKRzIILYDXA9Lxpuc=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 86A72F8024C;
	Wed,  5 Apr 2023 13:36:15 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 70C61F8024C; Wed,  5 Apr 2023 13:36:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id BA38AF801C0
	for <alsa-devel@alsa-project.org>; Wed,  5 Apr 2023 13:35:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BA38AF801C0
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=G4WWEJBe
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680694558; x=1712230558;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=z4M+lGF3PxW5jIEFmkFI2Pz3GGvuMaU0PB9nsRWm/Lw=;
  b=G4WWEJBecuzt80DquYha5q2wio9I56chK5M9A3F8hNlKJn0zgruSFVJ3
   y9DPagIYk9JZngO5NEUcn67XBhrz/RrP5qqtdi/Ljuf6dlyTEnN8Z1jhv
   7hBKPun/0GKtPMOJLVakJdoSSZGpLADF/s2Qf5LRUekTfglUnNqxqyvZa
   wG54DOO+g0Afs1XeZxTxMDBfH4m8l7QqBvSValBgE6QXgj81J5gRa+ZrI
   gGcA16RS7fUUOVtsjDFdgLworEJ7UWrHWBqwpZ4M4re1JqDdSDB+D5W5Y
   d2LvDyDF+FDfG2FGIRY9jCm8Of59ESmpW3nlXLSQ/ioWo6mJ8tTz2N4Vx
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10670"; a="370257018"
X-IronPort-AV: E=Sophos;i="5.98,319,1673942400";
   d="scan'208";a="370257018"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2023 04:35:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10670"; a="860943315"
X-IronPort-AV: E=Sophos;i="5.98,319,1673942400";
   d="scan'208";a="860943315"
Received: from aslawinx-mobl.ger.corp.intel.com (HELO [10.99.16.144])
 ([10.99.16.144])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2023 04:35:36 -0700
Message-ID: <030c2cbf-dec3-91fb-ac82-949cf5764b78@linux.intel.com>
Date: Wed, 5 Apr 2023 13:35:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [EXTERNAL] Re: [PATCH v10] ASoC: tas2781: Add tas2781 driver
Content-Language: en-US
To: "Ding, Shenghao" <shenghao-ding@ti.com>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>
References: <20230329100107.8181-1-13916275206@139.com>
 <8d0d0478-1e45-ea52-f1b7-910b747d6282@linux.intel.com>
 <7a0cfa60e2a244168edd49c3d2f6a2bd@ti.com>
 <458d7c2f-bcee-9ec3-e955-9661a06a3349@wanadoo.fr>
 <bbae9e35f2bf4cbcbc78f852041e4b2e@ti.com>
From: =?UTF-8?Q?Amadeusz_S=c5=82awi=c5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
In-Reply-To: <bbae9e35f2bf4cbcbc78f852041e4b2e@ti.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 2E77MCQ23ZZKT5XQVHX7AQLN52MDBWRQ
X-Message-ID-Hash: 2E77MCQ23ZZKT5XQVHX7AQLN52MDBWRQ
X-MailFrom: amadeuszx.slawinski@linux.intel.com
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
 "Navada Kanyana, Mukund" <navada@ti.com>,
 Shenghao Ding <13916275206@139.com>,
 "broonie@kernel.org" <broonie@kernel.org>,
 "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
 "pierre-louis.bossart@linux.intel.com" <pierre-louis.bossart@linux.intel.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2E77MCQ23ZZKT5XQVHX7AQLN52MDBWRQ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 4/5/2023 1:21 PM, Ding, Shenghao wrote:
> Hi Both
> I wrote a test code to verify the be32_to_cpu & be32_to_cpup,
> static int __init lkm_init(void)
> {
> 	char test_buf[]={0x12, 0x34, 0xab, 0xbc, 0x56, 0x78, 0xef};
> 	unsigned int *k, p, q;
> 	int i;
> 
> 	printk("Hello, Shanghai!\n");
> 
> 	for (i = 0; i < 4; i ++) {
> 		k = (unsigned int *)&test_buf[i];
> 		p = be32_to_cpup((__be32 *)k);
> 		q = be32_to_cpu(test_buf[i]);
> 		printk("%d: *k = 0x%08x p = 0x%08x q = 0x%08x %ld\n",
> 			i, *k, p, q, sizeof(unsigned int));
> 	}
> 	return 0;
> }
> The output is:
> [ 9109.722548] Hello, Shanghai!
> [ 9109.726287] 0: *k = 0xbcab3412 p = 0x1234abbc q = 0x12000000 4
> [ 9109.727665] 1: *k = 0x56bcab34 p = 0x34abbc56 q = 0x34000000 4
> [ 9109.728553] 2: *k = 0x7856bcab p = 0xabbc5678 q = 0xabffffff 4
> [ 9109.729308] 3: *k = 0xef7856bc p = 0xbc5678ef q = 0xbcffffff 4
> Apparently, be32_to_cpup's output is what I expected.
> Looking forward to your comments. Thanks.
> 

It makes sense, as array access reads 8 bit value, you would need to 
access value using pointer instead. So instead of doing 
be32_to_cpu(test_buf[i]) you would need to do be32_to_cpu(*(test_buf + 
i)) if I didn't mess the pointer magic ;)

And then I'm not sure which is better, be32_to_cpup or be32_to_cpu.

> BR
> Shenghao Ding
> -----Original Message-----
> From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> Sent: Saturday, April 1, 2023 4:41 AM
> To: Ding, Shenghao <shenghao-ding@ti.com>; Amadeusz Slawinski <amadeuszx.slawinski@linux.intel.com>; Shenghao Ding <13916275206@139.com>; broonie@kernel.org; lgirdwood@gmail.com; perex@perex.cz; pierre-louis.bossart@linux.intel.com
> Cc: Lu, Kevin <kevin-lu@ti.com>; alsa-devel@alsa-project.org; linux-kernel@vger.kernel.org; Xu, Baojun <x1077012@ti.com>; Gupta, Peeyush <peeyush@ti.com>; Navada Kanyana, Mukund <navada@ti.com>
> Subject: [EXTERNAL] Re: [PATCH v10] ASoC: tas2781: Add tas2781 driver
> 
> Le 31/03/2023 à 04:19, Ding, Shenghao a écrit :
>> Hi Amadeusz Sławiński
>> Thanks for your comment.
>> Answer inline.
>>
>> -----Original Message-----
>> From: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
>> Sent: Thursday, March 30, 2023 7:54 PM
>> To: Shenghao Ding <13916275206@139.com>; broonie@kernel.org;
>> lgirdwood@gmail.com; perex@perex.cz;
>> pierre-louis.bossart@linux.intel.com
>> Cc: Lu, Kevin <kevin-lu@ti.com>; Ding, Shenghao
>> <shenghao-ding@ti.com>; alsa-devel@alsa-project.org;
>> linux-kernel@vger.kernel.org; Xu, Baojun <x1077012@ti.com>; Gupta,
>> Peeyush <peeyush@ti.com>; Navada Kanyana, Mukund <navada@ti.com>
>> Subject: [EXTERNAL] Re: [PATCH v10] ASoC: tas2781: Add tas2781 driver
>>
>> On 3/29/2023 12:01 PM, Shenghao Ding wrote:
>>> Create tas2781 driver.
>>>
>>> Signed-off-by: Shenghao Ding <13916275206@139.com>
>>>
>>> ---
>>> Changes in v10:
>>>     - using be16_to_cpu and be32_to_cpu instead of SMS_HTONS and SMS_HTONL
>>>     - optimize and reduce the boundary checks
>>>     - Add comments on some kmemdup instead of kzalloc+memcpy
>>>     Changes to be committed:
>>> 	modified:   sound/soc/codecs/Kconfig
>>> 	modified:   sound/soc/codecs/Makefile
>>> 	new file:   sound/soc/codecs/tas2781-dsp.c
>>> 	new file:   sound/soc/codecs/tas2781-dsp.h
>>> 	new file:   sound/soc/codecs/tas2781-i2c.c
>>> 	new file:   sound/soc/codecs/tas2781.h
>>> ---
>>
>> ...
>>
>>> +
>>> +static int fw_parse_block_data_kernel(struct tasdevice_fw *tas_fmw,
>>> +	struct tasdev_blk *block, const struct firmware *fmw, int offset) {
>>> +	const unsigned char *data = fmw->data;
>>> +
>>> +	if (offset + 16 > fmw->size) {
>>> +		dev_err(tas_fmw->dev, "%s: File Size error\n", __func__);
>>> +		offset = -EINVAL;
>>> +		goto out;
>>> +	}
>>> +	block->type = be32_to_cpup((__be32 *)&data[offset]);
>>
>> Wouldn't just be32_to_cpu(data[offset]) work instead of be32_to_cpup?
>> Same in other cases.
>> [DING] data[] is a char array, the code will convert data[offset],
>> data[offset + 1], data[offset + 2] and data[offset + 3] into host instead of data[offset] only.
>>
> 
> Not sure to follow you.
> Isn't it the purpose of be32_to_cpu() to take a 32 bits word, in other words 4 x 8 bits char, and swap what if needed (little endian arch)?
> 
> It ends to __swab32() ([1] for the "constant" implementation)
> 
> 
> be32_to_cpup(&p) ends to __swab32(*p), which really looks to the same as be32_to_cpu(p).
> 
> Can you elaborate more?
> 
> CJ
> 
> 
> [1]:
> https://elixir.bootlin.com/linux/v6.3-rc3/source/include/uapi/linux/swab.h#L18
> 

