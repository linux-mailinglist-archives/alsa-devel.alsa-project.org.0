Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 703EA867B22
	for <lists+alsa-devel@lfdr.de>; Mon, 26 Feb 2024 17:06:56 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0B74285D;
	Mon, 26 Feb 2024 17:06:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0B74285D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1708963616;
	bh=b3xl9FmNk6hu+KL8YOmLHkCKnjghMPXBxrgh3d+k4SM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=oHAKgohYYQYUvOhqA0FY7VSyZX2Q3/HVK6Z6iTHle/pHlBL5MU4LYossWi6aWFwZR
	 9UG61tyTtwSOVdfnnP7hzEv9iufjro5/4FrGiOrDVkOg2JgVMszShvQm2aj1Fz49v4
	 OwlAhW3c9pxjwiOBD/KmhWc6qyvHFP6hdbXPxuFQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3EBF8F8057B; Mon, 26 Feb 2024 17:06:24 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9FC26F80567;
	Mon, 26 Feb 2024 17:06:24 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F382CF8024E; Mon, 26 Feb 2024 17:06:19 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0E08CF8012B
	for <alsa-devel@alsa-project.org>; Mon, 26 Feb 2024 17:06:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0E08CF8012B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=n49i9oNL
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708963574; x=1740499574;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=b3xl9FmNk6hu+KL8YOmLHkCKnjghMPXBxrgh3d+k4SM=;
  b=n49i9oNL3ikAnBGxqtb6PgdKkSyKQmL9VNOat9MZ0dC1vhpfB8C9RWIe
   oudnUU3txepimvxHIqCccrBUM+5rHHfK0qHKq5UCbVl9rMzuMLT+uMhB0
   VfeHEx4gpMPhqaDQCbzrNPGWzULcvQ4zgBvdgq6w3Z+BxQmY5r5YioyIc
   PNR2TDmcVo9jd2gHRnTo3YOvA2hnpb8M6GXYF+KDoAmkoIqb2jBKRGEAf
   yS2Ur0NF05wL+vbrZZiw9f8luZ0T88/WQ8wrPdS5YvtOyJv8bP0ehzdxk
   lcLd+OBbSfb2q+Nh5jbRGaGRJCtBOZkRElSiHSmooGPw/LELIfdNQML5f
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10996"; a="3129133"
X-IronPort-AV: E=Sophos;i="6.06,185,1705392000";
   d="scan'208";a="3129133"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2024 08:06:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,185,1705392000";
   d="scan'208";a="11343492"
Received: from tankuang-mobl.gar.corp.intel.com (HELO [10.246.128.202])
 ([10.246.128.202])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2024 08:06:06 -0800
Message-ID: <2c7e33e5-6904-467d-9912-417bab95e517@linux.intel.com>
Date: Mon, 26 Feb 2024 10:56:41 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [EXTERNAL] Re: [PATCH v9] ASoc: tas2783: Add tas2783 codec driver
To: Mark Brown <broonie@kernel.org>, "Ding, Shenghao" <shenghao-ding@ti.com>
Cc: "andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>,
 "lgirdwood@gmail.com" <lgirdwood@gmail.com>, "perex@perex.cz"
 <perex@perex.cz>, "13916275206@139.com" <13916275206@139.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "liam.r.girdwood@intel.com" <liam.r.girdwood@intel.com>,
 "bard.liao@intel.com" <bard.liao@intel.com>,
 "mengdong.lin@intel.com" <mengdong.lin@intel.com>,
 "yung-chuan.liao@linux.intel.com" <yung-chuan.liao@linux.intel.com>,
 "Xu, Baojun" <baojun.xu@ti.com>, "Lu, Kevin" <kevin-lu@ti.com>,
 "tiwai@suse.de" <tiwai@suse.de>, "soyer@irl.hu" <soyer@irl.hu>
References: <20240222074000.659-1-shenghao-ding@ti.com>
 <10f53a13-a0ff-40f9-b089-f5baacdb76b6@linux.intel.com>
 <5c7127256bf54fcd921fc1ec83f3e527@ti.com>
 <ZdjTyccCDoD9QYpi@finisterre.sirena.org.uk>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <ZdjTyccCDoD9QYpi@finisterre.sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Message-ID-Hash: XE4XYY73A6DRJGH2QBAQPPJMG5MEUQY6
X-Message-ID-Hash: XE4XYY73A6DRJGH2QBAQPPJMG5MEUQY6
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/XE4XYY73A6DRJGH2QBAQPPJMG5MEUQY6/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 2/23/24 12:20 PM, Mark Brown wrote:
> On Fri, Feb 23, 2024 at 10:12:49AM +0000, Ding, Shenghao wrote:
>> Hi Pierre-Louis
>>
>>> In the SoundWire spec, the unique_id is *LINK SPECIFIC*, and only used at
>>> the bus level within the context of a link to help avoid enumeration
>>> conflicts
> 
>>> If you are using the unique_id as a SYSTEM-UNIQUE value to lookup EFI
>>> data, this is a TI-specific requirement that needs to be documented.
>>> That also means you need to double-check for errors so make sure there
>>> are no board configurations where the same unique_id is used in multiple
>>> links, or by devices other than tas2783.
> 
>> This code only covers the tas2783s sitting in the same bus link. As to cases of the
>> different SWD links, customer will be required to have the secondary development
>> on current code. I'm sure my customers have much knowledge to handle this.

PC OEMs don't usually have a Linux team capable of handling this sort of 
low-level plumbing, so the burden of this "secondary development" will 
come back at you...

> As Pierre says I think we really should have some sort of defensive
> programming here, even if you're going to leave multi-link systems to
> future work people will still have older versions in distributions or
> whtaever.  While I'm not sure the consequences of getting things wrong
> are likely to be that bad (I'm expecting bad quality audio) it's also
> going to be kind of hard to figure out if we just silently pick the
> wrong calibration, especially if it's actually a valid calibration for
> another device in the system.  Other vendors (eg, Cirrus) seem to have
> figured out a scheme here?

Leaving multi-link aside has to be seen as as temporary step, there are 
a number of electrical issues that will prevent more than 4 amps to be 
placed on the same link. And indeed this "secondary development" has to 
be backwards compatible with initial calibration schemes.
