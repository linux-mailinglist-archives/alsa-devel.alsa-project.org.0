Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B596021887E
	for <lists+alsa-devel@lfdr.de>; Wed,  8 Jul 2020 15:08:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DE03F168C;
	Wed,  8 Jul 2020 15:07:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DE03F168C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594213729;
	bh=QTb9kn2b3DUE3Ca1VRAQY9XJLUA/liSaAQuBO3yf8N8=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=llSxA3ecSu1GcNvgjHd0phRm8bxJUBmHkKNARcO54q8Mqd962XxXSbTZpkhoKZkHV
	 bcyAoep6WqLnTnOstEFTYRtDUOl1ljOnmFjcaXVgTdy3RUPsPgkk6UHl2BLbl0Oczp
	 KM9WRLMLL9WuExFBk0oy1Apy1gcZv+kViL0DMn+I=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 38B09F80258;
	Wed,  8 Jul 2020 15:06:43 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A19EAF80161; Wed,  8 Jul 2020 15:06:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 33FADF8011F
 for <alsa-devel@alsa-project.org>; Wed,  8 Jul 2020 15:06:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 33FADF8011F
IronPort-SDR: 9d3YVV1TqiWdZ036zcPUVHsA9z+qVETgQMqRWMVVTUGVobwtIGyjbCGxMVneO+p500Zf/dMf9g
 KQzZM6JM4dsw==
X-IronPort-AV: E=McAfee;i="6000,8403,9675"; a="136018571"
X-IronPort-AV: E=Sophos;i="5.75,327,1589266800"; d="scan'208";a="136018571"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2020 06:06:30 -0700
IronPort-SDR: P5qtq4WPAKu4Jcv7EbkTrZYVMsTvHhoAMjb7Hcm8yODViPeHgSoGywF3dW4kqb/58IvCXubQ3O
 wc9ryDf15Pow==
X-IronPort-AV: E=Sophos;i="5.75,327,1589266800"; d="scan'208";a="323873323"
Received: from sare-mobl.amr.corp.intel.com (HELO [10.251.7.246])
 ([10.251.7.246])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2020 06:06:30 -0700
Subject: Re: [PATCH] regmap: add missing dependency on SoundWire
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <20200707202628.113142-1-pierre-louis.bossart@linux.intel.com>
 <20200708071428.GA353107@kroah.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <dda765be-b252-98ff-f339-f226a42f4093@linux.intel.com>
Date: Wed, 8 Jul 2020 08:06:29 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200708071428.GA353107@kroah.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: tiwai@suse.de, alsa-devel@alsa-project.org, broonie@kernel.org,
 "open list:REGISTER MAP ABSTRACTION" <linux-kernel@vger.kernel.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>
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



On 7/8/20 2:14 AM, Greg Kroah-Hartman wrote:
> On Tue, Jul 07, 2020 at 03:26:28PM -0500, Pierre-Louis Bossart wrote:
>> CONFIG_REGMAP is not selected when no other serial bus is supported.
>> It's largely academic since CONFIG_I2C is usually selected e.g. by
>> DRM, but still this can break randconfig so let's be explicit.
>>
>> Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
>> ---
>>   drivers/base/regmap/Kconfig | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/base/regmap/Kconfig b/drivers/base/regmap/Kconfig
>> index 0fd6f97ee523..1d1d26b0d279 100644
>> --- a/drivers/base/regmap/Kconfig
>> +++ b/drivers/base/regmap/Kconfig
>> @@ -4,7 +4,7 @@
>>   # subsystems should select the appropriate symbols.
>>   
>>   config REGMAP
>> -	default y if (REGMAP_I2C || REGMAP_SPI || REGMAP_SPMI || REGMAP_W1 || REGMAP_AC97 || REGMAP_MMIO || REGMAP_IRQ || REGMAP_SCCB || REGMAP_I3C)
>> +	default y if (REGMAP_I2C || REGMAP_SPI || REGMAP_SPMI || REGMAP_W1 || REGMAP_AC97 || REGMAP_MMIO || REGMAP_IRQ || REGMAP_SOUNDWIRE || REGMAP_SCCB || REGMAP_I3C)
> 
> Any reason you didn't add it to the end of the list instead of adding it
> to the middle?

yes, I followed the config order in the same file:

grep config Kconfig
config REGMAP
config REGCACHE_COMPRESSED
config REGMAP_AC97
config REGMAP_I2C
config REGMAP_SLIMBUS
config REGMAP_SPI
config REGMAP_SPMI
config REGMAP_W1
config REGMAP_MMIO
config REGMAP_IRQ
config REGMAP_SOUNDWIRE
config REGMAP_SCCB
config REGMAP_I3C
