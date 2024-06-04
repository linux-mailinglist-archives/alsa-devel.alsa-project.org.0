Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0970D8FB428
	for <lists+alsa-devel@lfdr.de>; Tue,  4 Jun 2024 15:44:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7209684C;
	Tue,  4 Jun 2024 15:44:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7209684C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1717508677;
	bh=73TacqsCpBZ+SAUPu6XyT+doqzn3pkKU04z3oNydmok=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=AB9wZQ11jGnGb+bvFbWEKKdjD+TQJ7f8btSfRYtiPbJtD+cknmwu8843UC/6FeN8f
	 hrG7h6egbGbEDIWwo7SAe9UrnS5oHvonYirDfPs7lTz+mDCzDAJQhD42W0Qclt7/EK
	 dLzVhrOCVJ+x8ezwKwnLVZQpWWPRPj9IPH73cH0Q=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C1D4BF8058C; Tue,  4 Jun 2024 15:44:06 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 11C64F8059F;
	Tue,  4 Jun 2024 15:44:06 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 729E3F802DB; Tue,  4 Jun 2024 15:44:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2FCC3F8003A
	for <alsa-devel@alsa-project.org>; Tue,  4 Jun 2024 15:43:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2FCC3F8003A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=nZU7F2EZ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717508636; x=1749044636;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=73TacqsCpBZ+SAUPu6XyT+doqzn3pkKU04z3oNydmok=;
  b=nZU7F2EZOXf7IIYNl8RWbiZqpzC7WiZzL+0TscMEUz8Zh4Ut9QXQVdU4
   iKNKMRHzFW+Kn773LG5/DviY3cKgVV5FJCfnbeRtKseLS8m9/rFeRFYHk
   wKa1dhCfrHllc5FSdpwyhH5ur7JjyERhWePNUE7oHKO0dTbI6jDIxzAMD
   vO36cUJrVU2rVZ1TvdhGopyM39b56DugAKTHjoH+fckQ92tcyE0s9fNq1
   jIpLadGDJ6/FlIi/ZEXnoXWAZDKdGnaE49vGBNBF/0GzJF2ITndV9Rrtb
   W9vCoRXYl0abeiwZNziqbRIYVQYSk2twgi7uWpGIFT3TLjEkxWEfDrchD
   Q==;
X-CSE-ConnectionGUID: fHM3hpELSxG1oNfju2Zhsw==
X-CSE-MsgGUID: dtWn0v/2TlunCytg/coHmQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11093"; a="13804623"
X-IronPort-AV: E=Sophos;i="6.08,213,1712646000";
   d="scan'208";a="13804623"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2024 06:43:51 -0700
X-CSE-ConnectionGUID: 9s6zS/BhQt67arFy2ujWnQ==
X-CSE-MsgGUID: 6auYehRnRBeQO0y66DqDhw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,213,1712646000";
   d="scan'208";a="41793773"
Received: from fdefranc-mobl3.ger.corp.intel.com (HELO [10.245.246.143])
 ([10.245.246.143])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2024 06:43:50 -0700
Message-ID: <970501b1-09ae-4f2c-a078-2b4f23fe460e@linux.intel.com>
Date: Tue, 4 Jun 2024 15:43:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] soundwire: bus: clean up probe warnings
To: Johan Hovold <johan@kernel.org>
Cc: Johan Hovold <johan+linaro@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Sanyog Kale <sanyog.r.kale@intel.com>, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
References: <20240604075213.20815-1-johan+linaro@kernel.org>
 <20240604075213.20815-4-johan+linaro@kernel.org>
 <8dd7cadc-138c-4ef5-b06f-7177550b1215@linux.intel.com>
 <Zl7boEkMpQaELARP@hovoldconsulting.com>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <Zl7boEkMpQaELARP@hovoldconsulting.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: V3SSGMLSDCAXYJIWSFPWABQPUQBXU4QJ
X-Message-ID-Hash: V3SSGMLSDCAXYJIWSFPWABQPUQBXU4QJ
X-MailFrom: pierre-louis.bossart@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/V3SSGMLSDCAXYJIWSFPWABQPUQBXU4QJ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 6/4/24 11:17, Johan Hovold wrote:
> On Tue, Jun 04, 2024 at 10:33:02AM +0200, Pierre-Louis Bossart wrote:
>> On 6/4/24 02:52, Johan Hovold wrote:
>>> Clean up the probe warning messages by using a common succinct format
>>> (e.g. without __func__ and with a space after ':').
> 
>>> @@ -123,7 +123,7 @@ static int sdw_drv_probe(struct device *dev)
>>>  	/* init the dynamic sysfs attributes we need */
>>>  	ret = sdw_slave_sysfs_dpn_init(slave);
>>>  	if (ret < 0)
>>> -		dev_warn(dev, "Slave sysfs init failed:%d\n", ret);
>>> +		dev_warn(dev, "failed to initialise sysfs: %d\n", ret);
>>>  
>>>  	/*
>>>  	 * Check for valid clk_stop_timeout, use DisCo worst case value of
>>> @@ -147,7 +147,7 @@ static int sdw_drv_probe(struct device *dev)
>>>  	if (drv->ops && drv->ops->update_status) {
>>>  		ret = drv->ops->update_status(slave, slave->status);
>>>  		if (ret < 0)
>>> -			dev_warn(dev, "%s: update_status failed with status %d\n", __func__, ret);
>>> +			dev_warn(dev, "failed to update status: %d\n", ret);
>>
>> the __func__ does help IMHO, 'failed to update status' is way too general...
> 
> Error messages printed with dev_warn will include the device and driver
> names so this message will be quite specific still.

The goal isn't to be 'quite specific' but rather 'completely
straightforward'. Everyone can lookup a function name in a xref tool and
 quickly find out what happened. Doing 'git grep' on message logs isn't
great really, and over time logs tend to be copy-pasted. Just look at
the number of patches where we had to revisit the dev_err logs to make
then really unique/useful.

>> Replacing 'with status' by ":" is fine, but do we really care about 10
>> chars in a log?
> 
> It's not primarily about the numbers of characters but about consistency.

I am advocating for inclusion of __func__ everywhere...It's simpler for
remote support and bug chasing.

The exception to the rule would be dev_dbg where you can get the
function name with module options.
