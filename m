Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 05EC8137381
	for <lists+alsa-devel@lfdr.de>; Fri, 10 Jan 2020 17:26:11 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4DF1C16AE;
	Fri, 10 Jan 2020 17:25:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4DF1C16AE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1578673570;
	bh=4k3fIxVYgno+tIOTp8pOZJm21RHdBQZNyBim2MtTyN8=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=d7cxMGCjg6tWjzA2dXesTUNyTg+o+vnbdXXyVh/zBfLXjJ8giif9EDAMM8HqQhJjg
	 ApZsBdBFRDJ9HhtN6pXWPfQVDqpSsZmJqjJvIUEPFWVJNkKybN2k2M74jgRi1YB+ef
	 zgXBYRx6LQr+KNV5bL9x90Qa7DVII1cr4t1YAriY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DC7C4F80116;
	Fri, 10 Jan 2020 17:24:26 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 87F78F8010B; Fri, 10 Jan 2020 17:24:24 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4B44FF8010B
 for <alsa-devel@alsa-project.org>; Fri, 10 Jan 2020 17:24:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4B44FF8010B
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 10 Jan 2020 08:24:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,417,1571727600"; d="scan'208";a="224240060"
Received: from nehudak-mobl1.amr.corp.intel.com (HELO [10.251.145.164])
 ([10.251.145.164])
 by orsmga003.jf.intel.com with ESMTP; 10 Jan 2020 08:24:11 -0800
To: Vinod Koul <vkoul@kernel.org>
References: <20200108175438.13121-1-pierre-louis.bossart@linux.intel.com>
 <20200108175438.13121-7-pierre-louis.bossart@linux.intel.com>
 <20200110070321.GA2818@vkoul-mobl>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <0553dba8-6a08-93c7-d0d5-4d2ca6a67f56@linux.intel.com>
Date: Fri, 10 Jan 2020 10:24:10 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20200110070321.GA2818@vkoul-mobl>
Content-Language: en-US
Cc: alsa-devel@alsa-project.org, tiwai@suse.de, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, broonie@kernel.org,
 srinivas.kandagatla@linaro.org, jank@cadence.com, slawomir.blauciak@intel.com,
 Sanyog Kale <sanyog.r.kale@intel.com>, Rander Wang <rander.wang@intel.com>,
 Bard liao <yung-chuan.liao@linux.intel.com>,
 Rander Wang <rander.wang@linux.intel.com>
Subject: Re: [alsa-devel] [PATCH 6/6] soundwire: stream: don't program ports
 for a stream that has not been prepared
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




>> GitHub issue: https://github.com/thesofproject/linux/issues/1637
> 
> This is not relevant for kernel, pls remove

Why? it's not uncommon to have bugzilla links, why would we lose the 
publicly-available information because GitHub is used?

>>   	list_for_each_entry(m_rt, &bus->m_rt_list, bus_node) {
>> +
>> +		/*
>> +		 * this loop walks through all master runtimes for a
>> +		 * bus, but the ports can only be configured while
>> +		 * explicitly preparing a stream or handling an
>> +		 * already-prepared stream otherwise.
> 
> we can go upto 80 chars, make sure you align the above comment block as
> such

this is formatted by emacs, and with long words you get spaces at the end.

>>   		/* Program params */
>> -		ret = sdw_program_params(bus);
>> +		ret = sdw_program_params(bus, false);
> 
> Can you do a converse test as well, when the streams are running and
> concurrently two stream are stopped, it would be good to get it confirmed...

we cannot concurrently stop two streams since we take a bus lock. That's 
a problem but it'll have to be addressed separately. the problem with 
multiple streams addressed here is when one is CONFIGURED, which does 
not require a bus lock.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
