Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D72C4E4FDC
	for <lists+alsa-devel@lfdr.de>; Wed, 23 Mar 2022 10:57:25 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 040C016F7;
	Wed, 23 Mar 2022 10:56:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 040C016F7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1648029445;
	bh=i0l7n32gfPWBP+bfhsXUUrgo4OpOLEyuIo5gt2qxCAs=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=lOcX6pu06YWGqo7myc1710+XSCwHYZ9tAWewiKC/k7G2jAHNa74RFVkV9FUy1gpYt
	 Fm2Qm1KKhSn627V0qUevYDCUxF/wpfZSOF9cy5f5XYM00MgF3BROLDnrSjL0M0Wxmw
	 qddajHlDlHYdpAVDmPyO4u+DIlNFWmqhxuj85sn0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6414EF80310;
	Wed, 23 Mar 2022 10:56:19 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 71A75F802DB; Wed, 23 Mar 2022 10:56:18 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C6C7BF800C1
 for <alsa-devel@alsa-project.org>; Wed, 23 Mar 2022 10:56:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C6C7BF800C1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="ExJiG5W2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1648029373; x=1679565373;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=i0l7n32gfPWBP+bfhsXUUrgo4OpOLEyuIo5gt2qxCAs=;
 b=ExJiG5W2kUSZi+4UQ0cgFIXGAoT/m2EhrUtYgQZKaPg/bbqqX8jzAa9i
 LVCdd/7nGyhNVRS1qwIga0muL9zmgdsRZZn6RViK3YZXAPOQcivYxU7ae
 SXj8msASL6U9stW0Tx0j+QvcmhP3Pt61sGzzPniB3ntzXnRyTgld1DHJJ
 qG09o5P6n2VyY0gz4e8+UBcOpmJtWcVSd5Ds6TgomKF/GOICltOMEDXRC
 M11sOYpofloozFnqRAvg70Bjvh8kziIZu0BQgJ9Wk6xJKXIxK2W1ZKJeu
 rHs9M1uZ9WUWqjUgg3P7XtkRvzeTPens6z5ELNQxQJ3Vn7wj0fq05IALH g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10294"; a="256893161"
X-IronPort-AV: E=Sophos;i="5.90,203,1643702400"; d="scan'208";a="256893161"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2022 02:56:07 -0700
X-IronPort-AV: E=Sophos;i="5.90,203,1643702400"; d="scan'208";a="560826459"
Received: from aslawinx-mobl.ger.corp.intel.com (HELO [10.99.249.37])
 ([10.99.249.37])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2022 02:56:06 -0700
Message-ID: <eda347eb-f7dd-fe05-d670-5365899b74f5@linux.intel.com>
Date: Wed, 23 Mar 2022 10:56:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [EXTERNAL] Re: [PATCH v4 3/3] update tas27xx.h to support either
 TAS2764 or TAS2780
Content-Language: en-US
To: "Xu, Yang" <raphael-xu@ti.com>, Raphael-Xu <13691752556@139.com>,
 "broonie@kernel.org" <broonie@kernel.org>
References: <20220323042644.635-1-13691752556@139.com>
 <20220323042644.635-3-13691752556@139.com>
 <f96222e2-dd66-45aa-7615-7fed99479da6@linux.intel.com>
 <f4ae130bbdde4bf8842b23f3cb3c10b2@ti.com>
From: =?UTF-8?Q?Amadeusz_S=c5=82awi=c5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
In-Reply-To: <f4ae130bbdde4bf8842b23f3cb3c10b2@ti.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>, "Ding,
 Shenghao" <shenghao-ding@ti.com>, "Navada Kanyana, Mukund" <navada@ti.com>
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

On 3/23/2022 10:41 AM, Xu, Yang wrote:
> Hi Slawinski,
> 
> Thanks for your feedback.Here is the target we want to do when submitting all the patchs:
> 1. rename tas2764.c to tas27xx.c
> 2.rename tas2764.h to tas27xx.h
> 3.update Makefile
> 4.update Kconfig
> 5.rename tas2764.yaml to tas27xx.yaml
> 6.update tas27xx.c to support either TAS2764 or TAS2780
> 7. update tas27xx.h to support either TAS2764 or TAS2780
> As just to make everything clear,we plan to do item1 to 5 firstly.Could you let us know what's your suggestion?Should we stop this patch routing and start a new patch submit process?
> Regarding item 6 to 7,we can submit separate patch process after we finish item 1 to 5.
> 
> Regards
> Raphael

Hi,

this would be probably overdoing it, 4 patches should be enough.
Patch 1 and 3 seem ok to me, I would just split patch 2, and reorder a 
bit, so something like:
1. [PATCH v4 1/3] rename tas2764 to tas27xx-Makefile and Kconfig
2. here patch renaming variables (2764 -> xxxx)
3. [PATCH v4 3/3] update tas27xx.h to support either TAS2764 or TAS2780
4. here patch adding TAS2780 support

The reason why patch 3, should go before one adding support is that 
there is dependency on information present in header, and you don't want 
to break build when someone does git bisect with your driver enabled.

> 
> -----Original Message-----
> From: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
> Sent: Wednesday, March 23, 2022 4:29 PM
> To: Raphael-Xu <13691752556@139.com>; broonie@kernel.org
> Cc: Navada Kanyana, Mukund <navada@ti.com>; alsa-devel@alsa-project.org; Ding, Shenghao <shenghao-ding@ti.com>; Xu, Yang <raphael-xu@ti.com>
> Subject: [EXTERNAL] Re: [PATCH v4 3/3] update tas27xx.h to support either TAS2764 or TAS2780
> 
> On 3/23/2022 5:26 AM, Raphael-Xu wrote:
>> Signed-off-by: Raphael-Xu <13691752556@139.com>
>> ---
>>    sound/soc/codecs/tas27xx.h | 27 +++++++++++++++++++--------
>>    1 file changed, 19 insertions(+), 8 deletions(-)
>>
>> diff --git a/sound/soc/codecs/tas27xx.h b/sound/soc/codecs/tas27xx.h
>> index 67d6fd903c42..02b29c030d37 100644
>> --- a/sound/soc/codecs/tas27xx.h
>> +++ b/sound/soc/codecs/tas27xx.h
>> @@ -1,18 +1,20 @@
>>    /* SPDX-License-Identifier: GPL-2.0-only */
>>    /*
>> - * tas2764.h - ALSA SoC Texas Instruments TAS2764 Mono Audio
>> Amplifier
>> + * tas27xx.h - ALSA SoC Texas Instruments TAS2764/TAS2780
>> + *		Mono Audio Amplifier
>>     *
>> - * Copyright (C) 2020 Texas Instruments Incorporated -
>> https://www.ti.com
>> + * Copyright (C) 2022 Texas Instruments Incorporated -
>> + *		https://www.ti.com
>>     *
>> - * Author: Dan Murphy <dmurphy@ti.com>
>> + * Author:
>>     */
>>    
>> -#ifndef __TAS2764__
>> -#define __TAS2764__
>> +#ifndef __TAS27XX__H_
>> +#define __TAS27XX__H_
>>    
>>    /* Book Control Register */
>> -#define TAS2764_BOOKCTL_PAGE	0
>> -#define TAS2764_BOOKCTL_REG	127
>> +#define TAS27XX_BOOKCTL_PAGE	0
>> +#define TAS27XX_BOOKCTL_REG	127
>>    #define TAS2764_REG(page, reg)	((page * 128) + reg)
>>    
>>    /* Page */
>> @@ -77,6 +79,10 @@
>>    #define TAS2764_TDM_CFG3_RXS_SHIFT	0x4
>>    #define TAS2764_TDM_CFG3_MASK		GENMASK(3, 0)
>>    
>> +/* TDM Configuration Reg4 */
>> +#define TAS2764_TDM_CFG4		TAS2764_REG(0X0, 0x0d)
>> +#define TAS2764_TDM_CFG4_TX_OFFSET_MASK	GENMASK(3, 1)
>> +
>>    /* TDM Configuration Reg5 */
>>    #define TAS2764_TDM_CFG5		TAS2764_REG(0X0, 0x0e)
>>    #define TAS2764_TDM_CFG5_VSNS_MASK	BIT(6)
>> @@ -89,4 +95,9 @@
>>    #define TAS2764_TDM_CFG6_ISNS_ENABLE	BIT(6)
>>    #define TAS2764_TDM_CFG6_50_MASK	GENMASK(5, 0)
>>    
>> -#endif /* __TAS2764__ */
>> +/* INT&CLK CFG */
>> +#define TAS27XX_CLK_CFG			TAS2764_REG(0X0, 0x5c)
>> +#define TAS27XX_CLK_CFG_MASK		GENMASK(7, 6)
>> +#define TAS27XX_CLK_CFG_ENABLE		(BIT(7) | BIT(6))
>> +
>> +#endif /* __TAS27XX__H_ */
>> \ No newline at end of file
> 
> And this patch should probably go before patch 2, otherwise there will be build failure on patch 2?

