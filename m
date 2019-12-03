Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D66C210F69F
	for <lists+alsa-devel@lfdr.de>; Tue,  3 Dec 2019 06:07:34 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6D2B51658;
	Tue,  3 Dec 2019 06:06:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6D2B51658
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1575349654;
	bh=RFC4p9JqrGEqlmqL+/rOQKn+iUqauorVCTegW5Xdkv8=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=KoI0QtbeMSQ3bO7bP3CbCNJaN9njiuj1lzK6ODtZId4fVbRTZeg5cUohrMCaHQrb6
	 so28HP2LTPqrsJfLvGyIHR74GFdFiEP5h3LV/3i/Oq58lhpSWX8G1eRMo9r31A3TTA
	 c1bWm8oVR9Pzde9aZZ72/+NB2bzdErY6jljAMzSQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D1778F80228;
	Tue,  3 Dec 2019 06:05:50 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 69EF3F80227; Tue,  3 Dec 2019 06:05:47 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1326EF800B4
 for <alsa-devel@alsa-project.org>; Tue,  3 Dec 2019 06:05:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1326EF800B4
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="P72HkHNE"
Received: by mail-pg1-x542.google.com with SMTP id i5so1084907pgj.9
 for <alsa-devel@alsa-project.org>; Mon, 02 Dec 2019 21:05:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=eyhijRr/YQI/e+nakiYV1XQUenXP3bUm+J4bO1NawYU=;
 b=P72HkHNEdTVxL582N76mLhFt/aJgUyPBDfr8x48oFP/rsd60PaSZ8xPVUthbIexaYw
 QkzBOCoaHvWZ2etMK9YFs9IBqHECv4Q/nmZ8TbvBMJBM1Aog4STvGOCmrk0bOQ9JhrpP
 wFiH0gaIEFuEPb2jbaNv3ZqWxkQxw8Aa1c1YoUAWLt6fq5+REO1l0xdvDRoSo5g+JYVm
 lYFA6F0tk2eq5YFuwNFN3HqGBSELuPKxrxjMnoqPo5kTl0moJ3A1X0K5SIpZHCcjzl1t
 ebIK9zXhKVT9vQ+moUbJQdZAIurf6MqdVb8Td6Ie8/TXrUE5RCbG/RmvvNgZ5W/uv2tM
 heoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=eyhijRr/YQI/e+nakiYV1XQUenXP3bUm+J4bO1NawYU=;
 b=RjgYWdpLBSNOqB5+L3evZYhjBKBgPY8OHPT7xqYFcthCkoGJATs5H0Up2miLUifvRN
 ogrAFH2VsGYnLSdEGtjYLvRudGIcQ/t3qqwDJDg/qLLQ4fI+MIm0U1W/hU2ZQTsJ2XcF
 g4HZVIPDlUBbXp1FmZV3d7K4199i8kaJK7ZwgbXArssums/g8nzjttq18gLpzCXzRWrx
 ZPFrRHmGP0NzfUR7vh8zKuFad5eK0eOzr8Y9ooG/z5mrn99+t04n7lDYYcoa7o4uM6Ol
 CFUGtqQ4685pqIkMzZxZALDpGyYZnCSBOM3srtjBmfYTSL5rjeqhPKZBTDDoH66yDBIb
 s+vA==
X-Gm-Message-State: APjAAAUP38uDYVa34NUW+bjMl5/ZNfdHcoQm+UbUfEYrj8BWGA5Dilht
 gjwFbSESJw85o5AC4WATjaU=
X-Google-Smtp-Source: APXvYqyfI2axwjuybif7oNpVQ4sCIgYVs/mOpWhuPqRWpM/uK3ySjzI3swZw55nmmNBtgQmn63CC7g==
X-Received: by 2002:aa7:9510:: with SMTP id b16mr2812758pfp.65.1575349540517; 
 Mon, 02 Dec 2019 21:05:40 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 67sm1393499pfw.82.2019.12.02.21.05.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Dec 2019 21:05:38 -0800 (PST)
To: Yong Liang <yong.liang@mediatek.com>,
 Philipp Zabel <p.zabel@pengutronix.de>
References: <20191125061627.GA7313@roeck-us.net>
 <e138b69efad563822da1db8e160d43458c21eae1.camel@pengutronix.de>
 <1575016588.7013.8.camel@mhfsdcap03>
 <88994e7445df8b2d98f3548e2043eb29bf5fa95f.camel@pengutronix.de>
 <1575342124.7013.13.camel@mhfsdcap03>
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <f9628c90-4c9b-ff4b-b3dd-887dbc987d46@roeck-us.net>
Date: Mon, 2 Dec 2019 21:05:36 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <1575342124.7013.13.camel@mhfsdcap03>
Content-Language: en-US
Cc: "mark.rutland@arm.com" <mark.rutland@arm.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
 =?UTF-8?B?SmlheGluIFl1ICjkv57lrrbpkasp?= <Jiaxin.Yu@mediatek.com>,
 "tzungbi@google.com" <tzungbi@google.com>,
 "broonie@kernel.org" <broonie@kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 =?UTF-8?B?RWFzb24gWWVuICjpoY/lu7fku7sp?= <Eason.Yen@mediatek.com>,
 =?UTF-8?B?WWluZ2pvZSBDaGVuICjpmbPoi7HmtLIp?= <Yingjoe.Chen@mediatek.com>,
 "wim@linux-watchdog.org" <wim@linux-watchdog.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [alsa-devel] [PATCH v5 2/2] watchdog: mtk_wdt: mt8183: Add
	reset controller
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On 12/2/19 7:02 PM, Yong Liang wrote:
> On Mon, 2019-12-02 at 21:02 +0800, Philipp Zabel wrote:
>> On Fri, 2019-11-29 at 16:36 +0800, Yong Liang wrote:
>>> On Mon, 2019-11-25 at 17:51 +0800, Philipp Zabel wrote:
>>>> On Sun, 2019-11-24 at 22:16 -0800, Guenter Roeck wrote:
>>>>> On Mon, Nov 25, 2019 at 11:03:50AM +0800, Jiaxin Yu wrote:
>>>>>> From: "yong.liang" <yong.liang@mediatek.com>
>>>>>>
>>>>>> Add reset controller API in watchdog driver.
>>>>>> Besides watchdog, MTK toprgu module also provide sub-system (eg, audio,
>>>>>> camera, codec and connectivity) software reset functionality.
>>>>>>
>>>>>> Signed-off-by: yong.liang <yong.liang@mediatek.com>
>>>>>> Signed-off-by: jiaxin.yu <jiaxin.yu@mediatek.com>
>>>>>> Reviewed-by: Yingjoe Chen <yingjoe.chen@mediatek.com>
>>>>>> ---
>>>>>>   drivers/watchdog/Kconfig   |   1 +
>>>>>>   drivers/watchdog/mtk_wdt.c | 111 ++++++++++++++++++++++++++++++++++++-
>>>>>>   2 files changed, 111 insertions(+), 1 deletion(-)
>>>>>>
>>>>>> diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
>>>>>> index 2e07caab9db2..629249fe5305 100644
>>>>>> --- a/drivers/watchdog/Kconfig
>>>>>> +++ b/drivers/watchdog/Kconfig
>>>>>> @@ -717,6 +717,7 @@ config MEDIATEK_WATCHDOG
>>>>>>   	tristate "Mediatek SoCs watchdog support"
>>>>>>   	depends on ARCH_MEDIATEK || COMPILE_TEST
>>>>>>   	select WATCHDOG_CORE
>>>>>> +	select RESET_CONTROLLER
>>>>>>   	help
>>>>>>   	  Say Y here to include support for the watchdog timer
>>>>>>   	  in Mediatek SoCs.
>>>>>> diff --git a/drivers/watchdog/mtk_wdt.c b/drivers/watchdog/mtk_wdt.c
>>>>>> index 9c3d0033260d..d29484c7940a 100644
>>>>>> --- a/drivers/watchdog/mtk_wdt.c
>>>>>> +++ b/drivers/watchdog/mtk_wdt.c
>>>>>> @@ -9,6 +9,9 @@
>>>>>>    * Based on sunxi_wdt.c
>>>>>>    */
>>>>>>   
>>>>>> +#include <dt-bindings/reset-controller/mt2712-resets.h>
>>>>>> +#include <dt-bindings/reset-controller/mt8183-resets.h>
>>>>>> +#include <linux/delay.h>
>>>>>>   #include <linux/err.h>
>>>>>>   #include <linux/init.h>
>>>>>>   #include <linux/io.h>
>>>>>> @@ -16,10 +19,12 @@
>>>>>>   #include <linux/module.h>
>>>>>>   #include <linux/moduleparam.h>
>>>>>>   #include <linux/of.h>
>>>>>> +#include <linux/of_device.h>
>>>>>>   #include <linux/platform_device.h>
>>>>>> +#include <linux/reset-controller.h>
>>>>>> +#include <linux/slab.h>
>>>>>>   #include <linux/types.h>
>>>>>>   #include <linux/watchdog.h>
>>>>>> -#include <linux/delay.h>
>>>>>>   
>>>>>>   #define WDT_MAX_TIMEOUT		31
>>>>>>   #define WDT_MIN_TIMEOUT		1
>>>>>> @@ -44,6 +49,9 @@
>>>>>>   #define WDT_SWRST		0x14
>>>>>>   #define WDT_SWRST_KEY		0x1209
>>>>>>   
>>>>>> +#define WDT_SWSYSRST		0x18U
>>>>>> +#define WDT_SWSYS_RST_KEY	0x88000000
>>>>>> +
>>>>>>   #define DRV_NAME		"mtk-wdt"
>>>>>>   #define DRV_VERSION		"1.0"
>>>>>>   
>>>>>> @@ -53,8 +61,99 @@ static unsigned int timeout;
>>>>>>   struct mtk_wdt_dev {
>>>>>>   	struct watchdog_device wdt_dev;
>>>>>>   	void __iomem *wdt_base;
>>>>>> +	spinlock_t lock; /* protects WDT_SWSYSRST reg */
>>>>>> +	struct reset_controller_dev rcdev;
>>>>>> +};
>>>>>> +
>>>>>> +struct mtk_wdt_data {
>>>>>> +	int sw_rst_num;
>>>>>>   };
>>>>>>   
>>>>>> +static const struct mtk_wdt_data mt2712_data = {
>>>>>> +	.sw_rst_num = MT2712_TOPRGU_SW_RST_NUM,
>>>>>> +};
>>>>>> +
>>>>>> +static const struct mtk_wdt_data mt8183_data = {
>>>>>> +	.sw_rst_num = MT8183_TOPRGU_SW_RST_NUM,
>>>>>> +};
>>>>>
>>>>> The number of resets can be set in .data directly; there is no need
>>>>> for the structures.
>>>
>>>      We want to put all properities in mtxxxx-resets.h and it easy to
>>> manager. If there are new properity in the feture, we can put it in
>>> mtk_wdt_data mtxxxx_data
>>
>> Do you expect there will be more properties in the future?
> 
>    Yes, We may put some infra reset bit and max number in mtxxxx-resets.h

Please either do that now or introduce the complexity when needed.

Thanks,
Guenter

>>
>>>>>> +static int toprgu_reset_deassert(struct reset_controller_dev *rcdev,
>>>>>> +				 unsigned long id)
>>>>>> +{
>>>>>> +	unsigned int tmp;
>>>>>> +	unsigned long flags;
>>>>>> +	struct mtk_wdt_dev *data =
>>>>>> +		 container_of(rcdev, struct mtk_wdt_dev, rcdev);
>>>>>> +
>>>>>> +	spin_lock_irqsave(&data->lock, flags);
>>>>>> +
>>>>>> +	tmp = __raw_readl(data->wdt_base + WDT_SWSYSRST);
>>>>>> +	tmp &= ~BIT(id);
>>>>>> +	tmp |= WDT_SWSYS_RST_KEY;
>>>>>> +	writel(tmp, data->wdt_base + WDT_SWSYSRST);
>>>>>> +
>>>>>> +	spin_unlock_irqrestore(&data->lock, flags);
>>>>>> +
>>>>>> +	return 0;
>>>>>> +}
>>>>>
>>>>> There is a lot of duplication in those functions. Only one line
>>>>> is different. I think this is a good example where a helper function
>>>>> with an additional argument indicating set or reset would be helpful.
>>>>>
>>>      .assert and .dessert are two numbers of struct reset_control_ops.
>>>       I think it's better to define both of them.
>>
>> The suggestion was to have two very short _assert and _deassert
>> functions that only contain a single call to a common helper function.
>> See the reset-a10sr.c driver for an example.
> 
>    OK. I will modify it as reset-a10sr.c do.
>>
>> regards
>> Philipp
>>
>>
>> _______________________________________________
>> Linux-mediatek mailing list
>> Linux-mediatek@lists.infradead.org
>> http://lists.infradead.org/mailman/listinfo/linux-mediatek
> 

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
