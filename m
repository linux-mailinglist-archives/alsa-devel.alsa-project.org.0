Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6475926FFC8
	for <lists+alsa-devel@lfdr.de>; Fri, 18 Sep 2020 16:27:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C8AF116DE;
	Fri, 18 Sep 2020 16:26:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C8AF116DE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1600439240;
	bh=0HyxU8n/RVVdRH/gPRozSO+RwkrksisJb+6HenCxpdM=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=BzHGlS2GqoD/YpFyB5XAxd0632LT1DSEXZXqU778Lv9PuQ/1u6+5+kRwHsFbRkvc1
	 nh+5fPMdHYq5hn0xAkhi8MhuIdjvqQcvyaChb+ZIk/fJdYrIkrQLQpd95U/qqJzCU2
	 tKGS8Aif77kEVpr6Cer4nJdy842ESia6DCJ28c0c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4D7F9F8012D;
	Fri, 18 Sep 2020 16:24:58 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D556BF800E8; Fri, 18 Sep 2020 16:24:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8ED40F800E8
 for <alsa-devel@alsa-project.org>; Fri, 18 Sep 2020 16:24:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8ED40F800E8
IronPort-SDR: 8zBxVr3xgmlZT+xRj2R0ahxXBQ+yNtENnClMBViveNCoIBVCrKpdVhm0FabzkkgaTGH9h/pZTO
 /pdPJLYYfI+A==
X-IronPort-AV: E=McAfee;i="6000,8403,9747"; a="157336302"
X-IronPort-AV: E=Sophos;i="5.77,274,1596524400"; d="scan'208";a="157336302"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2020 07:24:41 -0700
IronPort-SDR: 9H0j1WCh4LHBop/GgIdiwl89F+leKXJLfERJFpJTSsvvYxREg4ncgdiwBknKa9sfDkEo87AVW6
 qFwhlhfr0FLg==
X-IronPort-AV: E=Sophos;i="5.77,274,1596524400"; d="scan'208";a="332653963"
Received: from tsecasiu-mobl.amr.corp.intel.com (HELO [10.213.179.236])
 ([10.213.179.236])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2020 07:24:40 -0700
Subject: Re: [PATCH v2 2/2] soundwire: sysfs: add slave status and device
 number before probe
To: Vinod Koul <vkoul@kernel.org>
References: <20200917160007.153106-1-pierre-louis.bossart@linux.intel.com>
 <20200917160007.153106-3-pierre-louis.bossart@linux.intel.com>
 <20200918121614.GS2968@vkoul-mobl>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <c8729c1d-6d36-ad34-34c3-899ba0f5366d@linux.intel.com>
Date: Fri, 18 Sep 2020 09:21:32 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200918121614.GS2968@vkoul-mobl>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, tiwai@suse.de, gregkh@linuxfoundation.org,
 broonie@kernel.org, srinivas.kandagatla@linaro.org,
 Bard liao <yung-chuan.liao@linux.intel.com>,
 Rander Wang <rander.wang@linux.intel.com>
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




>>    * Base file is device
>>    *	|---- modalias
>> + *	|---- dev-status
>> + *		|---- status
>> + *		|---- device_number
> 
> Any reason why we want this under dev-status.
> 
> Both the status and device_number belong to the device, so we can
> put them under device and use device properties

We already use directories for device-level and port-level properties, I 
just thought it be cleaner to continue this model. We might also expand 
the information later on, e.g. provide interrupt status.

I don't mind if we remove the directory and move everything up one 
level, but it wouldn't be consistent with the previous work.

>> +static ssize_t device_number_show(struct device *dev,
>> +				  struct device_attribute *attr, char *buf)
>> +{
>> +	struct sdw_slave *slave = dev_to_sdw_dev(dev);
>> +
>> +	if (slave->status == SDW_SLAVE_UNATTACHED)
>> +		return sprintf(buf, "%s", "N/A");
> 
> Do we really want N/A here, 0 should imply UNATTACHED and then the
> status_show would tell UNATTACHED.

Actually no. If you look at the standard, 'Unattached' is an 'internal 
state of a Slave that indicates that it is not synchronized with to the 
Frame boundaries within the Bitstream'. A Slave device can only become 
attached and report it's presence as Device0 in a PING frame once it's 
ATTACHED - which in turn means the device has been able to sync for 15 
frames. A device number of zero means the device is able to respond to 
command but has not yet been enumerated, or was enumerated previously 
but lost sync or went through a reset sequence and reattached. A device 
number of zero does not mean the device is unattached, the logic is as 
follow:

Attached -> Device 0 or 1..11
Unattached -> No concept of device number (or not an observable value).

We should not overload what 'Device0' means and instead follow the 
standard to the letter. We also don't want the attribute to come and go 
dynamically, so N/A (Not Applicable) is IMHO the only way to convey this 
meaning.

Does this help?
