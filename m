Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6300076C48
	for <lists+alsa-devel@lfdr.de>; Fri, 26 Jul 2019 17:03:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D613320A2;
	Fri, 26 Jul 2019 17:02:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D613320A2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1564153427;
	bh=slcBzHg64JGhCjD7zpo5ri3BmOAVwe58wrw1MXFua3w=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jory0z0DCaKc2TCNeDAtE7fM2pJvVV239cafjZSF09QEj+4r/Cc6pVKcXrlK+FZQ7
	 6QgMgmstZEiGkEdrrbcI4qgh1ZNsQBpxzurgXQ5H0ZuoHNFKqSDkoIKyTkMAZnnpOE
	 WQnn0OJ1yiJiAPlnkdho+yZJrVMBX5RiIK8d4lYE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 93AF9F80368;
	Fri, 26 Jul 2019 17:02:02 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8D326F80393; Fri, 26 Jul 2019 17:02:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_PASS,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D2154F801A4
 for <alsa-devel@alsa-project.org>; Fri, 26 Jul 2019 17:01:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D2154F801A4
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 26 Jul 2019 08:01:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,311,1559545200"; d="scan'208";a="322059365"
Received: from msmall-mobl.amr.corp.intel.com (HELO [10.251.154.62])
 ([10.251.154.62])
 by orsmga004.jf.intel.com with ESMTP; 26 Jul 2019 08:01:54 -0700
To: Greg KH <gregkh@linuxfoundation.org>
References: <20190725234032.21152-1-pierre-louis.bossart@linux.intel.com>
 <20190725234032.21152-38-pierre-louis.bossart@linux.intel.com>
 <20190726140749.GC8767@kroah.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <81637203-4a8d-5d6b-26c8-524b8868b015@linux.intel.com>
Date: Fri, 26 Jul 2019 10:01:54 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190726140749.GC8767@kroah.com>
Content-Language: en-US
Cc: alsa-devel@alsa-project.org, tiwai@suse.de, linux-kernel@vger.kernel.org,
 vkoul@kernel.org, broonie@kernel.org, srinivas.kandagatla@linaro.org,
 jank@cadence.com, slawomir.blauciak@intel.com,
 Sanyog Kale <sanyog.r.kale@intel.com>
Subject: Re: [alsa-devel] [RFC PATCH 37/40] soundwire: cadence_master: add
 hw_reset capability in debugfs
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

Thanks for the review Greg.

>> +static int cdns_hw_reset(void *data, u64 value)
>> +{
>> +	struct sdw_cdns *cdns = data;
>> +	int ret;
>> +
>> +	if (value != 1)
>> +		return 0;
>> +
>> +	dev_info(cdns->dev, "starting link hw_reset\n");
>> +
>> +	ret = sdw_cdns_exit_reset(cdns);
>> +
>> +	dev_info(cdns->dev, "link hw_reset done\n");
> 
> Do not be noisy for when things always go right.  This looks like
> debuggging code, please remove.

yes, missed this in the cleanup, will remove.

>> +DEFINE_DEBUGFS_ATTRIBUTE(cdns_hw_reset_fops, NULL, cdns_hw_reset, "%llu\n");
>> +
>>   /**
>>    * sdw_cdns_debugfs_init() - Cadence debugfs init
>>    * @cdns: Cadence instance
>> @@ -339,6 +358,9 @@ static const struct file_operations cdns_reg_fops = {
>>   void sdw_cdns_debugfs_init(struct sdw_cdns *cdns, struct dentry *root)
>>   {
>>   	debugfs_create_file("cdns-registers", 0400, root, cdns, &cdns_reg_fops);
>> +
>> +	debugfs_create_file_unsafe("cdns-hw-reset", 0200, root, cdns,
>> +				   &cdns_hw_reset_fops);
> 
> Why unsafe?

Dunno. I followed the documentation and my take-away, along with a 
number of examples, was to use _unsafe. I really have no idea if this is 
correct or not, I can remove this qualifier if that's not needed.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
