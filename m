Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9186FE32A4
	for <lists+alsa-devel@lfdr.de>; Thu, 24 Oct 2019 14:43:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 21B9016D8;
	Thu, 24 Oct 2019 14:43:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 21B9016D8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1571921031;
	bh=bUOxQNSxWzvOu6GsYTTOG0bNyZ85CcUmCrv4YXTOvvg=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jOcicw8Ymgco1mzsLVPmxkUAljWBV+NGxcT64atXoFDzVmQA1zEgfV4FeQR2k5Oq8
	 rlmibksoX9WNkJdRNQawUA7gzcDxbAxsDIKZ47d61FrFd6fVrd+tSzb+SL2cyWjkCP
	 TVOpWpmIUpg7oU58ltdWlFGmWtktkIBfym89z0S8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C395CF8036B;
	Thu, 24 Oct 2019 14:42:07 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 35A15F8036B; Thu, 24 Oct 2019 14:42:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2C2EDF80137
 for <alsa-devel@alsa-project.org>; Thu, 24 Oct 2019 14:41:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2C2EDF80137
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 24 Oct 2019 05:41:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,224,1569308400"; d="scan'208";a="188577330"
Received: from linux.intel.com ([10.54.29.200])
 by orsmga007.jf.intel.com with ESMTP; 24 Oct 2019 05:41:55 -0700
Received: from atirumal-mobl1.amr.corp.intel.com (unknown [10.251.26.228])
 by linux.intel.com (Postfix) with ESMTP id B986658029F;
 Thu, 24 Oct 2019 05:41:54 -0700 (PDT)
To: Vinod Koul <vkoul@kernel.org>
References: <20191022234808.17432-1-pierre-louis.bossart@linux.intel.com>
 <20191022234808.17432-2-pierre-louis.bossart@linux.intel.com>
 <20191024112955.GC2620@vkoul-mobl>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <3b41953e-df3b-cf20-dae9-f3635c532895@linux.intel.com>
Date: Thu, 24 Oct 2019 07:42:13 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:60.0)
 Gecko/20100101 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191024112955.GC2620@vkoul-mobl>
Content-Language: en-US
Cc: alsa-devel@alsa-project.org, tiwai@suse.de, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, broonie@kernel.org,
 srinivas.kandagatla@linaro.org, jank@cadence.com, slawomir.blauciak@intel.com,
 Sanyog Kale <sanyog.r.kale@intel.com>,
 Bard liao <yung-chuan.liao@linux.intel.com>,
 Rander Wang <rander.wang@linux.intel.com>
Subject: Re: [alsa-devel] [PATCH 1/3] soundwire: remove bitfield for
 unique_id, use u8
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

On 10/24/19 6:29 AM, Vinod Koul wrote:
> On 22-10-19, 18:48, Pierre-Louis Bossart wrote:
>> There is no good reason why the unique_id needs to be stored as 4
>> bits. The code will work without changes with a u8 since all values
> 
> Well this was due to the fact the slave id defined by MIPI has unique id
> as 4 bits. In fact if you look closely there are other fields in
> sdw_slave_id doing this

it's not because we extract 4 bits that we need to store the information 
in 4 bits.

> 
>> are already filtered while parsing the ACPI tables and Slave devID
>> registers.
>>
>> Use u8 representation. This will allow us to encode a
>> "IGNORE_UNIQUE_ID" value to account for firmware/BIOS creativity.
> 
> Why are we shoving firmware/BIOS issues into the core?

The core uses a matching formula which is too strict and does not work 
on multiple platforms.

You can argue that the BIOS should be fixed, but the counter argument is 
that the practice of ignoring the unique ID is allowed by the MIPI standard.

> 
>>
>> Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
>> ---
>>   include/linux/soundwire/sdw.h | 4 +++-
>>   1 file changed, 3 insertions(+), 1 deletion(-)
>>
>> diff --git a/include/linux/soundwire/sdw.h b/include/linux/soundwire/sdw.h
>> index 688b40e65c89..28745b9ba279 100644
>> --- a/include/linux/soundwire/sdw.h
>> +++ b/include/linux/soundwire/sdw.h
>> @@ -403,6 +403,8 @@ int sdw_slave_read_prop(struct sdw_slave *slave);
>>    * SDW Slave Structures and APIs
>>    */
>>   
>> +#define SDW_IGNORED_UNIQUE_ID 0xFF
>> +
>>   /**
>>    * struct sdw_slave_id - Slave ID
>>    * @mfg_id: MIPI Manufacturer ID
>> @@ -418,7 +420,7 @@ struct sdw_slave_id {
>>   	__u16 mfg_id;
>>   	__u16 part_id;
>>   	__u8 class_id;
>> -	__u8 unique_id:4;
>> +	__u8 unique_id;
>>   	__u8 sdw_version:4;
>>   };
>>   
>> -- 
>> 2.20.1
> 

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
