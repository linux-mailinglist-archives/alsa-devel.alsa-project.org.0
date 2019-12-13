Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B0BBE11E724
	for <lists+alsa-devel@lfdr.de>; Fri, 13 Dec 2019 16:56:10 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3D9A017A8;
	Fri, 13 Dec 2019 16:55:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3D9A017A8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1576252570;
	bh=RRx6hg6uJ4jeiBXCuHzrMdjB7+OqF6LgQVxmwZD9sLI=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=SBW0RUClk+wsVEJrC9VVF03w6h9S3kEd15M8J5lwoAdW7LRcoFg0GYTApEKt64g9Q
	 hYbPDGyjWAdazJYv+imcI0inCaxRpoPcpMVuCbiY22bEq1qPuQ8zdIeqrLGM6dzfw3
	 X+EVT4OTTTn1qKCQJImzx2lxRwAIV2WVUbJiKb8Q=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 98C1DF8021D;
	Fri, 13 Dec 2019 16:54:27 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D7DC3F8021E; Fri, 13 Dec 2019 16:54:24 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 56C01F8014F
 for <alsa-devel@alsa-project.org>; Fri, 13 Dec 2019 16:54:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 56C01F8014F
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 13 Dec 2019 07:54:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,309,1571727600"; d="scan'208";a="246170744"
Received: from dbmoens-mobl1.amr.corp.intel.com ([10.255.228.102])
 by fmsmga002.fm.intel.com with ESMTP; 13 Dec 2019 07:54:15 -0800
To: Greg KH <gregkh@linuxfoundation.org>
References: <20191213050409.12776-1-pierre-louis.bossart@linux.intel.com>
 <20191213050409.12776-7-pierre-louis.bossart@linux.intel.com>
 <20191213072127.GD1750354@kroah.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <41d1fcbc-47b7-bbee-5b55-759cbb5f5a7b@linux.intel.com>
Date: Fri, 13 Dec 2019 09:05:37 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <20191213072127.GD1750354@kroah.com>
Content-Language: en-US
Cc: alsa-devel@alsa-project.org, tiwai@suse.de, linux-kernel@vger.kernel.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, vkoul@kernel.org,
 broonie@kernel.org, srinivas.kandagatla@linaro.org, jank@cadence.com,
 slawomir.blauciak@intel.com, Sanyog Kale <sanyog.r.kale@intel.com>,
 Bard liao <yung-chuan.liao@linux.intel.com>,
 Rander Wang <rander.wang@linux.intel.com>
Subject: Re: [alsa-devel] [PATCH v4 06/15] soundwire: add support for
 sdw_slave_type
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

On 12/13/19 1:21 AM, Greg KH wrote:
> On Thu, Dec 12, 2019 at 11:04:00PM -0600, Pierre-Louis Bossart wrote:
>> Currently the bus does not have any explicit support for master
>> devices.
>>
>> First add explicit support for sdw_slave_type and error checks if this type
>> is not set.
>>
>> In follow-up patches we can add support for the sdw_md_type (md==Master
>> Device), following the Grey Bus example.
> 
> How are you using greybus as an example of "master devices"?  All you
> are doing here is setting the type of the existing devices, right?

I took your advice to look at GreyBus and used the 'gb host device' as 
the model to implement the 'sdw master' add/startup/remove interfaces we 
needed.

so yes in this patch we just add a type for the slave, the interesting 
part is in the next patches.
>>   static int sdw_uevent(struct device *dev, struct kobj_uevent_env *env)
>>   {
>> -	struct sdw_slave *slave = to_sdw_slave_device(dev);
>> +	struct sdw_slave *slave;
>>   	char modalias[32];
>>   
>> -	sdw_slave_modalias(slave, modalias, sizeof(modalias));
>> +	if (is_sdw_slave(dev)) {
>> +		slave = to_sdw_slave_device(dev);
>> +
>> +		sdw_slave_modalias(slave, modalias, sizeof(modalias));
>>   
>> -	if (add_uevent_var(env, "MODALIAS=%s", modalias))
>> -		return -ENOMEM;
>> +		if (add_uevent_var(env, "MODALIAS=%s", modalias))
>> +			return -ENOMEM;
>> +	} else {
>> +		/* only Slave device type supported */
>> +		dev_warn(dev, "uevent for unknown Soundwire type\n");
>> +		return -EINVAL;
> 
> Right now, this can not happen, right?
> 
> Not a problem, just trying to understand the sequence of patches here...

yes this cannot happen at this point, it's more of a paranoid test. In 
theory a SoundWire solution could enable a 'monitor' device as defined 
in the standard.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
