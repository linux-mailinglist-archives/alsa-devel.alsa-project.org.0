Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 73E1176D03
	for <lists+alsa-devel@lfdr.de>; Fri, 26 Jul 2019 17:31:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E711A208F;
	Fri, 26 Jul 2019 17:30:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E711A208F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1564155068;
	bh=kbgXY5/xHWjrzBDxYJs5JiqZKNCDU0vnTbEjBZshSlM=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=IKw/A7pr1ewvoguppY4uQ8MV3BYILBnisTnoiwd2DvUBiKky830U1a6ZqM3tOqzkb
	 rIJl0Ab+3WlYHnZu+bvwocQptzKpazDNi5WjJyB26wW5UL9tMGPEbYwu5NV2FSAsUH
	 BPBoXs6z+s8pJowU7B/WbAjbu7Si8+ya3SOhbABk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0A7D4F80393;
	Fri, 26 Jul 2019 17:29:23 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5DAE5F80393; Fri, 26 Jul 2019 17:29:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 41AFAF801A4
 for <alsa-devel@alsa-project.org>; Fri, 26 Jul 2019 17:29:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 41AFAF801A4
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 26 Jul 2019 08:29:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,311,1559545200"; d="scan'208";a="322065695"
Received: from msmall-mobl.amr.corp.intel.com (HELO [10.251.154.62])
 ([10.251.154.62])
 by orsmga004.jf.intel.com with ESMTP; 26 Jul 2019 08:29:13 -0700
To: Greg KH <gregkh@linuxfoundation.org>
References: <20190725234032.21152-1-pierre-louis.bossart@linux.intel.com>
 <20190725234032.21152-2-pierre-louis.bossart@linux.intel.com>
 <20190726140411.GA8767@kroah.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <1c9448c3-2a98-e5c3-fadf-910e361187ab@linux.intel.com>
Date: Fri, 26 Jul 2019 10:29:13 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190726140411.GA8767@kroah.com>
Content-Language: en-US
Cc: alsa-devel@alsa-project.org, tiwai@suse.de, linux-kernel@vger.kernel.org,
 vkoul@kernel.org, broonie@kernel.org, srinivas.kandagatla@linaro.org,
 jank@cadence.com, slawomir.blauciak@intel.com,
 Sanyog Kale <sanyog.r.kale@intel.com>
Subject: Re: [alsa-devel] [RFC PATCH 01/40] soundwire: add debugfs support
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


>> diff --git a/drivers/soundwire/debugfs.c b/drivers/soundwire/debugfs.c
>> new file mode 100644
>> index 000000000000..8d86e100516e
>> --- /dev/null
>> +++ b/drivers/soundwire/debugfs.c
>> @@ -0,0 +1,156 @@
>> +// SPDX-License-Identifier: (GPL-2.0 OR BSD-3-Clause)
> 
> No, for debugfs-specific code, that dual license makes no sense, right?
> Don't cargo-cult SPDX identifiers please.

It's a miss, I used EXPORT_GPL and missed this line, will fix.

> 
>> +// Copyright(c) 2017-19 Intel Corporation.
> 
> Spell the year out fully unless you want lawyers knocking on your door :)

haha, will fix.

> 
>> +
>> +#include <linux/device.h>
>> +#include <linux/debugfs.h>
>> +#include <linux/mod_devicetable.h>
>> +#include <linux/slab.h>
>> +#include <linux/soundwire/sdw.h>
>> +#include <linux/soundwire/sdw_registers.h>
>> +#include "bus.h"
>> +
>> +#ifdef CONFIG_DEBUG_FS
>> +struct dentry *sdw_debugfs_root;
>> +#endif
> 
> This whole file is not built if that option is not enabled, so why the
> #ifdef?

Ah, will look into this, thanks!
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
