Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ADE8524478
	for <lists+alsa-devel@lfdr.de>; Thu, 12 May 2022 06:47:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 20C0D1A5F;
	Thu, 12 May 2022 06:46:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 20C0D1A5F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1652330841;
	bh=WknkTJ0paq5rZ6uDN0mLPKhj0sET5smcWr7emDkbkAM=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LV9V5v1cJgI2reZF4FzsCulruDIuDpjZ6oO4lYZXOqe0/EqpkOrJP5fgquix7X2ro
	 fqHHycMaZUUm0l/SXbxE87gTpWwm9olYeEDQeltB7+0desIeqzvhD/S7Fn5jziO60s
	 09a7+8SGlwFYZiPILFvC0LUBMjw+eW000yL0om7o=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9E39EF80249;
	Thu, 12 May 2022 06:46:22 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7FC2AF80245; Thu, 12 May 2022 06:46:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from szxga03-in.huawei.com (szxga03-in.huawei.com [45.249.212.189])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0FDF1F8011C
 for <alsa-devel@alsa-project.org>; Thu, 12 May 2022 06:46:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0FDF1F8011C
Received: from kwepemi100006.china.huawei.com (unknown [172.30.72.54])
 by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4KzJy860tgzCsXP;
 Thu, 12 May 2022 12:41:20 +0800 (CST)
Received: from kwepemm600005.china.huawei.com (7.193.23.191) by
 kwepemi100006.china.huawei.com (7.221.188.165) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Thu, 12 May 2022 12:46:09 +0800
Received: from [10.67.109.54] (10.67.109.54) by kwepemm600005.china.huawei.com
 (7.193.23.191) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Thu, 12 May
 2022 12:46:08 +0800
Subject: Re: [PATCH -next 1/2] ASoC: max98396: Fix build error for implicit
 function declaration
To: Mark Brown <broonie@kernel.org>
References: <20220511012348.94288-1-tanghui20@huawei.com>
 <20220511012348.94288-2-tanghui20@huawei.com>
 <YnumrRUSkVCPONdl@sirena.org.uk>
From: Hui Tang <tanghui20@huawei.com>
Message-ID: <f84cbd0a-0a9e-fd72-b319-dfca8c19ce64@huawei.com>
Date: Thu, 12 May 2022 12:46:08 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:45.0) Gecko/20100101
 Thunderbird/45.7.1
MIME-Version: 1.0
In-Reply-To: <YnumrRUSkVCPONdl@sirena.org.uk>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.67.109.54]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 kwepemm600005.china.huawei.com (7.193.23.191)
X-CFilter-Loop: Reflected
Cc: alsa-devel@alsa-project.org, steve@sk2.org, linux-kernel@vger.kernel.org,
 tiwai@suse.com, lgirdwood@gmail.com, ricardw@axis.com,
 ryan.lee.analog@gmail.com
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



On 2022/5/11 20:06, Mark Brown wrote:
> On Wed, May 11, 2022 at 09:23:47AM +0800, Hui Tang wrote:
>
>>                          devm_regulator_get_optional
>> sound/soc/codecs/max98396.c:1556:23: error: ‘GPIOD_OUT_HIGH’ undeclared (first use in this function); did you mean ‘GPIOF_INIT_HIGH’?
>>               "reset", GPIOD_OUT_HIGH);
>>                        ^~~~~~~~~~~~~~
>>                        GPIOF_INIT_HIGH
>> sound/soc/codecs/max98396.c:1556:23: note: each undeclared identifier is reported only once for each function it appears in
>> sound/soc/codecs/max98396.c:1565:3: error: implicit declaration of function ‘gpiod_set_value_cansleep’; did you mean ‘gpio_set_value_cansleep’? [-Werror=implicit-function-declaration]
>>    gpiod_set_value_cansleep(max98396->reset_gpio, 0);
>>    ^~~~~~~~~~~~~~~~~~~~~~~~
>>    gpio_set_value_cansleep
>> cc1: all warnings being treated as errors
>>
>> Add depend on GPIOLIB for 'config SND_SOC_MAX98396'
>
> No, these issues are missing headers not dependencies.  In general
> gpiolib stubs out so drivers can optionally use GPIO functionality.
>

Ok, I will do that

thank you
