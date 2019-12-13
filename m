Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F340811E725
	for <lists+alsa-devel@lfdr.de>; Fri, 13 Dec 2019 16:56:54 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8B38F17B5;
	Fri, 13 Dec 2019 16:56:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8B38F17B5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1576252614;
	bh=D8jDzNaW2ygYJMOPWwAkujMDKbmvCvn5Ocvke48jnKc=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Lm1Tjhyc2BzDwVt2xFnsCgYsW6J1LFat+wCzN1fRbILYZH0mToyExin/OHBb/4OZc
	 xTH4GXC6xbh2WbcUtEsEMzP1OxXeTSHusC5o7eJyKLwSyK7ng8o9K/1GEaSUQLSTxV
	 1HqHSDhFTIG9AkBUqpRwc2SUIDSgRoVaGs+vTsTk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 13586F80252;
	Fri, 13 Dec 2019 16:54:31 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2F12EF8019B; Fri, 13 Dec 2019 16:54:26 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7A7CAF8019B
 for <alsa-devel@alsa-project.org>; Fri, 13 Dec 2019 16:54:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7A7CAF8019B
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 13 Dec 2019 07:54:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,309,1571727600"; d="scan'208";a="246170754"
Received: from dbmoens-mobl1.amr.corp.intel.com ([10.255.228.102])
 by fmsmga002.fm.intel.com with ESMTP; 13 Dec 2019 07:54:17 -0800
To: Greg KH <gregkh@linuxfoundation.org>
References: <20191213050409.12776-1-pierre-louis.bossart@linux.intel.com>
 <20191213050409.12776-8-pierre-louis.bossart@linux.intel.com>
 <20191213072231.GE1750354@kroah.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <032e6505-22b6-45bb-ff04-87db1f8d8be9@linux.intel.com>
Date: Fri, 13 Dec 2019 09:11:27 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <20191213072231.GE1750354@kroah.com>
Content-Language: en-US
Cc: alsa-devel@alsa-project.org, tiwai@suse.de, linux-kernel@vger.kernel.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, vkoul@kernel.org,
 broonie@kernel.org, srinivas.kandagatla@linaro.org, jank@cadence.com,
 slawomir.blauciak@intel.com, Sanyog Kale <sanyog.r.kale@intel.com>,
 Bard liao <yung-chuan.liao@linux.intel.com>,
 Rander Wang <rander.wang@linux.intel.com>
Subject: Re: [alsa-devel] [PATCH v4 07/15] soundwire: slave: move uevent
 handling to slave
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

On 12/13/19 1:22 AM, Greg KH wrote:
> On Thu, Dec 12, 2019 at 11:04:01PM -0600, Pierre-Louis Bossart wrote:
>> Currently the code deals with uevents at the bus level, but we only care
>> for Slave events
> 
> What does this mean?  I can't understand it, can you please provide more
> information on what you are doing here?

In the earlier versions of the patch, the code looks like this and there 
was an open on what to do with a master-specific event.

  static int sdw_uevent(struct device *dev, struct kobj_uevent_env *env)
  {
+	struct sdw_master_device *md;
  	struct sdw_slave *slave;
  	char modalias[32];

-	if (is_sdw_slave(dev)) {
+	if (is_sdw_md(dev)) {
+		md = to_sdw_master_device(dev);
+		/* TODO: do we need to call add_uevent_var() ? */
+	} else if (is_sdw_slave(dev)) {
  		slave = to_sdw_slave_device(dev);
+
+		sdw_slave_modalias(slave, modalias, sizeof(modalias));
+
+		if (add_uevent_var(env, "MODALIAS=%s", modalias))
+			return -ENOMEM;
  	} else {
  		dev_warn(dev, "uevent for unknown Soundwire type\n");
  		return -EINVAL;
  	}

Vinod suggested this was not needed and suggested the code for uevents 
be moved to be slave-specific, which is what this patch does.
>> diff --git a/drivers/soundwire/slave.c b/drivers/soundwire/slave.c
>> index c87267f12a3b..014c3ece1f17 100644
>> --- a/drivers/soundwire/slave.c
>> +++ b/drivers/soundwire/slave.c
>> @@ -17,6 +17,7 @@ static void sdw_slave_release(struct device *dev)
>>   struct device_type sdw_slave_type = {
>>   	.name =		"sdw_slave",
>>   	.release =	sdw_slave_release,
>> +	.uevent = sdw_uevent,
> 
> Align this with the other ones?
> 
> does this cause any different functionality?

As mentioned above, this move was suggested by Vinod. I don't have a 
specific need for uevents for the master and there's no functionality 
limitation, that said this is way beyond my comfort zone so I will 
follow recommendations, if any.

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
