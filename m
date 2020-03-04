Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C8859179329
	for <lists+alsa-devel@lfdr.de>; Wed,  4 Mar 2020 16:19:03 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 24E4A166B;
	Wed,  4 Mar 2020 16:18:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 24E4A166B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1583335143;
	bh=0N4Ht+reM0qkqPJnSoQ3BVgeFBmEdhIbqDSnbj/IYkI=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=vmsKBW0geUvEaFARsQNg2DJZMFo4U3+WwlVFhuDwwEszuKs6sGksgrDuEkrg0kdPZ
	 F81Ke04Gbr4JNhDvks+yg6QR5tN2l3tYhE+eruQaKk1U2lXdj0lFWsocTEhylmhwDj
	 WAWzY8SZDifwzqPNH66yqwtSK4COLpkG1VbdBbp8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 21699F8011C;
	Wed,  4 Mar 2020 16:17:22 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2BA18F801ED; Wed,  4 Mar 2020 16:17:19 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=PRX_BODYSUB_10,
 RCVD_IN_DNSWL_BLOCKED, SPF_HELO_NONE, SPF_NONE autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6C3CAF8012D
 for <alsa-devel@alsa-project.org>; Wed,  4 Mar 2020 16:17:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6C3CAF8012D
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 04 Mar 2020 07:17:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,514,1574150400"; d="scan'208";a="387193635"
Received: from hhartana-mobl3.amr.corp.intel.com (HELO [10.251.140.18])
 ([10.251.140.18])
 by orsmga004.jf.intel.com with ESMTP; 04 Mar 2020 07:17:07 -0800
Subject: Re: [PATCH 1/8] soundwire: bus_type: add master_device/driver support
To: Vinod Koul <vkoul@kernel.org>
References: <20200227223206.5020-1-pierre-louis.bossart@linux.intel.com>
 <20200227223206.5020-2-pierre-louis.bossart@linux.intel.com>
 <20200303054136.GP4148@vkoul-mobl>
 <8a04eda6-cbcf-582f-c229-5d6e4557344b@linux.intel.com>
 <20200304095312.GT4148@vkoul-mobl>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <05dbe43c-abf8-9d5a-d808-35bf4defe4ba@linux.intel.com>
Date: Wed, 4 Mar 2020 09:17:07 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200304095312.GT4148@vkoul-mobl>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, tiwai@suse.de, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Hui Wang <hui.wang@canonical.com>, broonie@kernel.org,
 srinivas.kandagatla@linaro.org, jank@cadence.com, slawomir.blauciak@intel.com,
 Sanyog Kale <sanyog.r.kale@intel.com>,
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



> Were the above lines agreed or not? Do you see driver for master devices
> or not? Greg was okay with as well as these patches but I am not okay
> with the driver part for master, so I would like to see that removed.
> 
> Different reviewers can have different reasons.. I have given bunch of
> reasons here, BUT I have not seen a single technical reason why this
> cannot be done.

With all due respect, I consider Greg as THE reviewer for device/driver 
questions. Your earlier proposal to use platform devices was rejected by 
Greg, and we've lost an entire month in the process, so I am somewhat 
dubious on your proposal not to use a driver.

If you want a technical objection, let me restate what I already mentioned:

If you look at the hierarchy, we have

PCI device -> PCI driver
   soundwire_master_device0
      soundwire_slave(s) -> codec driver
   ...
   soundwire_master_deviceN
      soundwire_slave(s) -> codec driver

You have not explained how I could possibly deal with power management 
without having a driver for the master_device(s). The pm_ops need to be 
inserted in a driver structure, which means we need a driver. And if we 
need a driver, then we might as well have a real driver with .probe 
.remove support, driver_register(), etc.

I really don't see what's broken or unnecessary with these patches.

I would also kindly ask that you stop using exclamation marks and what I 
consider as hostile language. I've asked you multiple times, it's not 
professional, sorry.

Regards
-Pierre

