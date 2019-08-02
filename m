Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E1197FF8A
	for <lists+alsa-devel@lfdr.de>; Fri,  2 Aug 2019 19:26:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B5ABE16D5;
	Fri,  2 Aug 2019 19:25:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B5ABE16D5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1564766760;
	bh=EhTpOXvXhdzFUHHcqYr9eqtLBvfV4LasPOwU0f2Q91Y=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=KXfW8Sf3CYmrFLLua80ftJZeI1f9bUSnKZHFwvDfz2rxLbdPJBNCYk8OnKxtLD8Wk
	 r4drzJpB33Mri8e1IrEusXiCljKWqqX5AVZ55Kd4TzQdTMceMN2Kz2pYloNpaAcTm1
	 FymxXNX0squk+XkJZvTJo+BX5WREnTy4ob8A9FFI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 11DB4F8049B;
	Fri,  2 Aug 2019 19:24:17 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9DC7AF8048F; Fri,  2 Aug 2019 19:24:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BD003F800F3
 for <alsa-devel@alsa-project.org>; Fri,  2 Aug 2019 19:24:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BD003F800F3
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 02 Aug 2019 10:24:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,338,1559545200"; d="scan'208";a="324630980"
Received: from linux.intel.com ([10.54.29.200])
 by orsmga004.jf.intel.com with ESMTP; 02 Aug 2019 10:24:10 -0700
Received: from cwhanson-mobl.amr.corp.intel.com (unknown [10.252.133.191])
 by linux.intel.com (Postfix) with ESMTP id 65DFC58046F;
 Fri,  2 Aug 2019 10:24:09 -0700 (PDT)
To: Vinod Koul <vkoul@kernel.org>
References: <20190725234032.21152-1-pierre-louis.bossart@linux.intel.com>
 <20190725234032.21152-25-pierre-louis.bossart@linux.intel.com>
 <20190802171014.GZ12733@vkoul-mobl.Dlink>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <a7b691cc-353f-f052-b25e-edbf7fe21c4a@linux.intel.com>
Date: Fri, 2 Aug 2019 12:24:08 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:60.0)
 Gecko/20100101 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190802171014.GZ12733@vkoul-mobl.Dlink>
Content-Language: en-US
Cc: alsa-devel@alsa-project.org, tiwai@suse.de, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org, broonie@kernel.org,
 srinivas.kandagatla@linaro.org, jank@cadence.com, slawomir.blauciak@intel.com,
 Sanyog Kale <sanyog.r.kale@intel.com>
Subject: Re: [alsa-devel] [RFC PATCH 24/40] soundwire: cadence_master: use
 BIOS defaults for frame shape
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

On 8/2/19 12:10 PM, Vinod Koul wrote:
> On 25-07-19, 18:40, Pierre-Louis Bossart wrote:
>> Remove hard-coding and use BIOS values. If they are wrong use default
> 
> BIOS :) this is cadence, am sure this can be used outside BIOS :D
> 
> It would be better to say firmware (ACPI/DT)

yes

> 
>> 48x2 frame shape.
>>
>> Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
>> ---
>>   drivers/soundwire/cadence_master.c | 19 +++++++++++++++++--
>>   1 file changed, 17 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/soundwire/cadence_master.c b/drivers/soundwire/cadence_master.c
>> index 442f78c00f09..d84344e29f71 100644
>> --- a/drivers/soundwire/cadence_master.c
>> +++ b/drivers/soundwire/cadence_master.c
>> @@ -175,7 +175,6 @@
>>   /* Driver defaults */
>>   
>>   #define CDNS_DEFAULT_CLK_DIVIDER		0
>> -#define CDNS_DEFAULT_FRAME_SHAPE		0x30
>>   #define CDNS_DEFAULT_SSP_INTERVAL		0x18
>>   #define CDNS_TX_TIMEOUT				2000
>>   
>> @@ -954,6 +953,20 @@ int sdw_cdns_pdi_init(struct sdw_cdns *cdns,
>>   }
>>   EXPORT_SYMBOL(sdw_cdns_pdi_init);
>>   
>> +static u32 cdns_set_default_frame_shape(int n_rows, int n_cols)
>> +{
>> +	u32 val;
>> +	int c;
>> +	int r;
> 
> This can be in single line!

one line per variable is what I prefer.

> 
>> +
>> +	r = sdw_find_row_index(n_rows);
>> +	c = sdw_find_col_index(n_cols);
>> +
>> +	val = (r << 3) | c;
> 
> Magic 3?

yes fixed already.

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
