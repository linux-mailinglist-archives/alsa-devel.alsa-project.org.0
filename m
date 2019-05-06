Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D59E14D28
	for <lists+alsa-devel@lfdr.de>; Mon,  6 May 2019 16:50:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 87D5C1902;
	Mon,  6 May 2019 16:49:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 87D5C1902
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1557154226;
	bh=Gi8gpBCv5FvJdt9j2i1idKTZBVeml+N0cWsph3KNaX0=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bf9iStfQI+eWeK8GJRAFjMh6poqKSbF0dWtUTrcL5X55d92n1DU/maxj+pCoxZnJf
	 LIyxacOWQSr4zv5ROtajEjJIKgB10O23sJtFuqbfIJ89hFTZfKkAkvlzfp2drjVpeI
	 uZcT0rEYEiCxfmkIyq5utsVBByErysLeE9+h4jow=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6AB5DF896FD;
	Mon,  6 May 2019 16:48:42 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BA1F1F896F0; Mon,  6 May 2019 16:48:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=none autolearn=disabled
 version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1A91DF80C07
 for <alsa-devel@alsa-project.org>; Mon,  6 May 2019 16:48:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1A91DF80C07
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 06 May 2019 07:48:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,438,1549958400"; d="scan'208";a="343986368"
Received: from linux.intel.com ([10.54.29.200])
 by fmsmga005.fm.intel.com with ESMTP; 06 May 2019 07:48:32 -0700
Received: from slaugust-mobl.amr.corp.intel.com (unknown [10.254.21.102])
 by linux.intel.com (Postfix) with ESMTP id 63339580238;
 Mon,  6 May 2019 07:48:31 -0700 (PDT)
To: Greg KH <gregkh@linuxfoundation.org>
References: <20190504010030.29233-1-pierre-louis.bossart@linux.intel.com>
 <20190504010030.29233-6-pierre-louis.bossart@linux.intel.com>
 <20190504070301.GD9770@kroah.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <a9e1c3d2-fe29-1683-9253-b66034c62010@linux.intel.com>
Date: Mon, 6 May 2019 09:48:30 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:60.0)
 Gecko/20100101 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190504070301.GD9770@kroah.com>
Content-Language: en-US
Cc: alsa-devel@alsa-project.org, tiwai@suse.de, linux-kernel@vger.kernel.org,
 liam.r.girdwood@linux.intel.com, vkoul@kernel.org, broonie@kernel.org,
 srinivas.kandagatla@linaro.org, jank@cadence.com, joe@perches.com,
 Sanyog Kale <sanyog.r.kale@intel.com>
Subject: Re: [alsa-devel] [RFC PATCH 5/7] soundwire: add debugfs support
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


>> @@ -136,6 +139,8 @@ static int sdw_delete_slave(struct device *dev, void *data)
>>   void sdw_delete_bus_master(struct sdw_bus *bus)
>>   {
>>   	sdw_sysfs_bus_exit(bus);
>> +	if (bus->debugfs)
>> +		sdw_bus_debugfs_exit(bus->debugfs);
> 
> No need to check, just call it.

That was on my todo list, will remove.


>> +struct sdw_bus_debugfs {
>> +	struct sdw_bus *bus;
> 
> Why do you need to save this pointer?
> 
>> +	struct dentry *fs;
> 
> This really is all you need to have around, right?

will check.

>> +struct dentry *sdw_bus_debugfs_get_root(struct sdw_bus_debugfs *d)
>> +{
>> +	if (d)
>> +		return d->fs;
>> +	return NULL;
>> +}
>> +EXPORT_SYMBOL(sdw_bus_debugfs_get_root);
> 
> _GPL()?

Oops, that's a big miss. will fix, thanks for spotting this.

> 
> But why is this exported at all?  No one calls this function.

I will have to check.

> 
>> +struct sdw_slave_debugfs {
>> +	struct sdw_slave *slave;
> 
> Same question as above, why do you need this pointer?

will check.

> 
> And meta-comment, if you _EVER_ save off a pointer to a reference
> counted object (like this and the above one), you HAVE to grab a
> reference to it, otherwise it can go away at any point in time as that
> is the point of reference counted objects.
> 
> So even if you do need/want this, you have to properly handle the
> reference count by incrementing/decrementing it as needed.

good comment, thank you for the guidance.

>> +struct sdw_slave_debugfs *sdw_slave_debugfs_init(struct sdw_slave *slave)
>> +{
>> +	struct sdw_bus_debugfs *master;
>> +	struct sdw_slave_debugfs *d;
>> +	char name[32];
>> +
>> +	master = slave->bus->debugfs;
>> +	if (!master)
>> +		return NULL;
>> +
>> +	d = kzalloc(sizeof(*d), GFP_KERNEL);
>> +	if (!d)
>> +		return NULL;
>> +
>> +	/* create the debugfs slave-name */
>> +	snprintf(name, sizeof(name), "%s", dev_name(&slave->dev));
>> +	d->fs = debugfs_create_dir(name, master->fs);
>> +	if (IS_ERR_OR_NULL(d->fs)) {
>> +		dev_err(&slave->dev, "slave debugfs root creation failed\n");
>> +		goto err;
>> +	}
> 
> You never care about the return value of a debugfs call.  I have a 100+
> patch series stripping all of this out of the kernel, please don't force
> me to add another one to it :)
> 
> Just call debugfs and move on, you can always put the return value of
> one call into another one just fine, and your function logic should
> never change if debugfs returns an error or not, you do not care.

Yes, it's agreed that we should not depend on debugfs or fail here. will 
fix, no worries.

>
>> +void sdw_debugfs_init(void)
>> +{
>> +	sdw_debugfs_root = debugfs_create_dir("soundwire", NULL);
>> +	if (IS_ERR_OR_NULL(sdw_debugfs_root)) {
>> +		pr_warn("SoundWire: Failed to create debugfs directory\n");
>> +		sdw_debugfs_root = NULL;
>> +		return;
> 
> Same here, just call the function and return.

yep, will do.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
