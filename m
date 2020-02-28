Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5042717419F
	for <lists+alsa-devel@lfdr.de>; Fri, 28 Feb 2020 22:48:00 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 960CF16DD;
	Fri, 28 Feb 2020 22:47:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 960CF16DD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1582926479;
	bh=P8WF6Z+wjcwWsokS4VMZZbEIPH9047ZeONBEPlZKxf4=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Jn5uQCVNWYdDdis8jhgiCJuXG/B9aW3dD0O5mb793BiSExQ0bIkAeqDXb+lpVmZr+
	 9/HStMA4oK7/8fAd11qLW7bPtz4wjRgw8L7pFrWX22rC3rZJffYv4uY22dOOCYSyfH
	 a85hnIWfs+JdnzYkH7dDzuTMmStdPhY48ShhrlDg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A48E0F8016F;
	Fri, 28 Feb 2020 22:46:18 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0C82DF80113; Fri, 28 Feb 2020 22:46:05 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.1 required=5.0 tests=DATE_IN_PAST_03_06,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6AC78F80113
 for <alsa-devel@alsa-project.org>; Fri, 28 Feb 2020 22:46:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6AC78F80113
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 28 Feb 2020 13:45:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,497,1574150400"; d="scan'208";a="411532236"
Received: from spackerm-mobl2.amr.corp.intel.com (HELO [10.255.231.253])
 ([10.255.231.253])
 by orsmga005.jf.intel.com with ESMTP; 28 Feb 2020 13:45:57 -0800
Subject: Re: [PATCH 1/8] soundwire: bus_type: add master_device/driver support
To: Greg KH <gregkh@linuxfoundation.org>
References: <20200227223206.5020-1-pierre-louis.bossart@linux.intel.com>
 <20200227223206.5020-2-pierre-louis.bossart@linux.intel.com>
 <20200228073227.GA2898712@kroah.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <90417477-c8ba-22e0-de4f-07ef10fc014a@linux.intel.com>
Date: Fri, 28 Feb 2020 09:53:36 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200228073227.GA2898712@kroah.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, tiwai@suse.de, linux-kernel@vger.kernel.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Hui Wang <hui.wang@canonical.com>, vkoul@kernel.org, broonie@kernel.org,
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


> As you are adding new sysfs files here, is there a follow-on patch for
> Documentation/ABI/ updates?

Yes that's the plan. The original patches for sysfs were submitted as an 
RFC:

https://mailman.alsa-project.org/pipermail/alsa-devel/2019-May/148699.html

Most of the sysfs entries would mirror the value of _DSD properties, but 
that's still very useful to check platform integration issues. Some of 
the DSDT blocks are overwritten at run-time depending on BIOS menu 
selections, so it's impossible to figure out what the firmware exposes 
to the OS just by looking at the DSDT contents extracted with acpica tools.


