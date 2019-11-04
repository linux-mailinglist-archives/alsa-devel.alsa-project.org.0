Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A3306EE2A0
	for <lists+alsa-devel@lfdr.de>; Mon,  4 Nov 2019 15:34:33 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2BAC5173C;
	Mon,  4 Nov 2019 15:33:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2BAC5173C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1572878073;
	bh=8C+6RoA0oAJ5whEjuQ4jx7RBXxCBfNDGSIsWgw1x12Y=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=thPY8CY7cUAw8gTcKF3yX/4LcYk5Ws/fHp1vnh5jWe/3FZ2izHsp/uCwp5j/gTVnL
	 17jGZP9myM4f7BQKBYEwG+C5vZO3vmeZ/F0SM5ryHpvQSsqW0TEULvj1ccpFKTMlVW
	 0RmLmvS7pTutsMQP5bqiBEZvi3z6sNeIelxEbkEQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5C70AF8019B;
	Mon,  4 Nov 2019 15:32:49 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 455A1F803F4; Mon,  4 Nov 2019 15:32:47 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 58243F8019B
 for <alsa-devel@alsa-project.org>; Mon,  4 Nov 2019 15:32:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 58243F8019B
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 04 Nov 2019 06:32:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,267,1569308400"; d="scan'208";a="402989494"
Received: from cckuo1-mobl2.amr.corp.intel.com (HELO [10.251.130.8])
 ([10.251.130.8])
 by fmsmga006.fm.intel.com with ESMTP; 04 Nov 2019 06:32:38 -0800
To: Vinod Koul <vkoul@kernel.org>
References: <20191023210657.32440-1-pierre-louis.bossart@linux.intel.com>
 <20191023210657.32440-2-pierre-louis.bossart@linux.intel.com>
 <20191103045604.GE2695@vkoul-mobl.Dlink>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <f53b28bb-1ec7-a400-54ed-51fd55819ecd@linux.intel.com>
Date: Mon, 4 Nov 2019 08:32:38 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.2
MIME-Version: 1.0
In-Reply-To: <20191103045604.GE2695@vkoul-mobl.Dlink>
Content-Language: en-US
Cc: alsa-devel@alsa-project.org, tiwai@suse.de, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, broonie@kernel.org,
 srinivas.kandagatla@linaro.org, jank@cadence.com, slawomir.blauciak@intel.com,
 Sanyog Kale <sanyog.r.kale@intel.com>,
 Bard liao <yung-chuan.liao@linux.intel.com>,
 Rander Wang <rander.wang@linux.intel.com>
Subject: Re: [alsa-devel] [PATCH 1/4] soundwire: sdw_slave: add new fields
 to track probe status
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



On 11/2/19 11:56 PM, Vinod Koul wrote:
> On 23-10-19, 16:06, Pierre-Louis Bossart wrote:
>> Changes to the sdw_slave structure needed to solve race conditions on
>> driver probe.
> 
> Can you please explain the race you have observed, it would be a very
> useful to document it as well

the races are explained in the [PATCH 00/18] soundwire: code hardening 
and suspend-resume support series.

>>
>> The functionality is added in the next patch.
> 
> which one..?

[PATCH 00/18] soundwire: code hardening and suspend-resume support


> 
>>
>> Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
>> ---
>>   include/linux/soundwire/sdw.h | 6 ++++++
>>   1 file changed, 6 insertions(+)
>>
>> diff --git a/include/linux/soundwire/sdw.h b/include/linux/soundwire/sdw.h
>> index 688b40e65c89..a381a596212b 100644
>> --- a/include/linux/soundwire/sdw.h
>> +++ b/include/linux/soundwire/sdw.h
>> @@ -545,6 +545,10 @@ struct sdw_slave_ops {
>>    * @node: node for bus list
>>    * @port_ready: Port ready completion flag for each Slave port
>>    * @dev_num: Device Number assigned by Bus
>> + * @probed: boolean tracking driver state
>> + * @probe_complete: completion utility to control potential races
>> + * on startup between driver probe/initialization and SoundWire
>> + * Slave state changes/imp-def interrupts
>>    */
>>   struct sdw_slave {
>>   	struct sdw_slave_id id;
>> @@ -559,6 +563,8 @@ struct sdw_slave {
>>   	struct list_head node;
>>   	struct completion *port_ready;
>>   	u16 dev_num;
>> +	bool probed;
>> +	struct completion probe_complete;
>>   };
>>   
>>   #define dev_to_sdw_dev(_dev) container_of(_dev, struct sdw_slave, dev)
>> -- 
>> 2.20.1
> 
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
