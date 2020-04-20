Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C3F071B0B1C
	for <lists+alsa-devel@lfdr.de>; Mon, 20 Apr 2020 14:54:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 74FDA1680;
	Mon, 20 Apr 2020 14:53:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 74FDA1680
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1587387277;
	bh=WzoNoH/aBHYBltzKKWVfDStdb/rnCV624KN9CZEVPcc=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ph1n6Mw7x8iKTOVw+CBQ83jIWKEl8oygrdeiW/soI+FP71+kTyo2JJcjFHes3WF5Q
	 6nzmMDuP3t78Xj0x6I74FNdx8oHjrYBrBRPqyeJY5H/p1btJIETSQ+3/aBwZMU5RuE
	 qCo7ti/BIOy7ACK+Im0aJkf3AqdmeDJ0MnxMTWWo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B05CAF8013E;
	Mon, 20 Apr 2020 14:52:56 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 13585F801D9; Mon, 20 Apr 2020 14:52:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from huawei.com (szxga04-in.huawei.com [45.249.212.190])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 96270F800E7
 for <alsa-devel@alsa-project.org>; Mon, 20 Apr 2020 14:52:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 96270F800E7
Received: from DGGEMS402-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 3E7B429041ABCD99F1AA;
 Mon, 20 Apr 2020 20:52:46 +0800 (CST)
Received: from [127.0.0.1] (10.166.215.154) by DGGEMS402-HUB.china.huawei.com
 (10.3.19.202) with Microsoft SMTP Server id 14.3.487.0;
 Mon, 20 Apr 2020 20:52:41 +0800
Subject: Re: [PATCH] ASoC: wm89xx: Fix build error without CONFIG_I2C
To: Charles Keepax <ckeepax@opensource.cirrus.com>
References: <20200418090853.30340-1-yuehaibing@huawei.com>
 <20200420102701.GB44490@ediswmail.ad.cirrus.com>
From: Yuehaibing <yuehaibing@huawei.com>
Message-ID: <f175d79f-ff45-18e5-f7e7-1b22a1495871@huawei.com>
Date: Mon, 20 Apr 2020 20:52:40 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:45.0) Gecko/20100101
 Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <20200420102701.GB44490@ediswmail.ad.cirrus.com>
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.166.215.154]
X-CFilter-Loop: Reflected
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org, tiwai@suse.com,
 lgirdwood@gmail.com, broonie@kernel.org, geert@linux-m68k.org
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On 2020/4/20 18:27, Charles Keepax wrote:
> On Sat, Apr 18, 2020 at 05:08:53PM +0800, YueHaibing wrote:
>> sound/soc/codecs/wm8900.o: In function `wm8900_i2c_probe':
>> wm8900.c:(.text+0xa36): undefined reference to `__devm_regmap_init_i2c'
>> sound/soc/codecs/wm8900.o: In function `wm8900_modinit':
>> wm8900.c:(.init.text+0xb): undefined reference to `i2c_register_driver'
>> sound/soc/codecs/wm8900.o: In function `wm8900_exit':
>> wm8900.c:(.exit.text+0x8): undefined reference to `i2c_del_driver'
>> sound/soc/codecs/wm8988.o: In function `wm8988_i2c_probe':
>> wm8988.c:(.text+0x857): undefined reference to `__devm_regmap_init_i2c'
>> sound/soc/codecs/wm8988.o: In function `wm8988_modinit':
>> wm8988.c:(.init.text+0xb): undefined reference to `i2c_register_driver'
>> sound/soc/codecs/wm8988.o: In function `wm8988_exit':
>> wm8988.c:(.exit.text+0x8): undefined reference to `i2c_del_driver'
>> sound/soc/codecs/wm8995.o: In function `wm8995_i2c_probe':
>> wm8995.c:(.text+0x1c4f): undefined reference to `__devm_regmap_init_i2c'
>> sound/soc/codecs/wm8995.o: In function `wm8995_modinit':
>> wm8995.c:(.init.text+0xb): undefined reference to `i2c_register_driver'
>> sound/soc/codecs/wm8995.o: In function `wm8995_exit':
>> wm8995.c:(.exit.text+0x8): undefined reference to `i2c_del_driver'
>>
>> Add missing I2C dependency to fix this.
>>
> 
> This doesn't look like the right fix there, all these parts can
> be used on SPI so should be usable without I2C build in.

Sorry, the patch title is wrong, the issue is CONFIG_I2C m but SND_SOC_WM8900 is y.

This should depends on SND_SOC_I2C_AND_SPI like others.

> 
> Thanks,
> Charles
> 
> .
> 

