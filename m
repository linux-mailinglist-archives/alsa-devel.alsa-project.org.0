Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 41288255DAD
	for <lists+alsa-devel@lfdr.de>; Fri, 28 Aug 2020 17:20:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D841D189B;
	Fri, 28 Aug 2020 17:20:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D841D189B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1598628054;
	bh=HEB9ppR5KrCQLZeHT7WiU7Rn0hbjcN8sl3V0HtTO0G0=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=kUolxsLOYRWm+D9rDfyG1GsrYZqZQ6qw5isLTMZ6AYv7yDAoxmB5KdX368uNgE8iy
	 my7fwD0Ch0X5MgaDMzd2wucp4/OVdHmJDe6mjuxqa/4UXnFU4O00mPBdf3/VOw9v4q
	 rXYH/EMMXUbdhpCtXlw49WSJLm49uulLamWLAisQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 64C6DF80257;
	Fri, 28 Aug 2020 17:18:35 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6C3DFF80257; Fri, 28 Aug 2020 17:18:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.8 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 122F1F80143
 for <alsa-devel@alsa-project.org>; Fri, 28 Aug 2020 17:18:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 122F1F80143
IronPort-SDR: E3nRl8eiq1bLOJuXo1nU9zWJeYf3AZR6B1fIsMndEhFq5an344swSEJD44ECpiHLqtV1R49JBJ
 oxoxFFSVCO5w==
X-IronPort-AV: E=McAfee;i="6000,8403,9727"; a="136744154"
X-IronPort-AV: E=Sophos;i="5.76,364,1592895600"; d="scan'208";a="136744154"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2020 08:18:20 -0700
IronPort-SDR: lpnUix3jb1jq5RniOzI6GlxCPQkIhMwJ2N2ThQElCFiFYWFOWsKKR9DPQKVUtEpN5FFTJ5NW61
 g8ymFrLqnyBg==
X-IronPort-AV: E=Sophos;i="5.76,364,1592895600"; d="scan'208";a="300266458"
Received: from lilymao-mobl.amr.corp.intel.com (HELO [10.209.185.175])
 ([10.209.185.175])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2020 08:18:18 -0700
Subject: Re: [PATCH 09/11] soundwire: intel: add dynamic debug trace for
 clock-stop invalid configs
To: Vinod Koul <vkoul@kernel.org>
References: <20200818024120.20721-1-yung-chuan.liao@linux.intel.com>
 <20200818024120.20721-10-yung-chuan.liao@linux.intel.com>
 <20200826094817.GC2639@vkoul-mobl>
 <21038e8d-dbd9-76c7-c758-9933fb45024a@linux.intel.com>
 <20200828074952.GO2639@vkoul-mobl>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <b5d8a731-d753-060a-f224-63de3b29b7d2@linux.intel.com>
Date: Fri, 28 Aug 2020 09:54:11 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200828074952.GO2639@vkoul-mobl>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, tiwai@suse.de, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org, ranjani.sridharan@linux.intel.com,
 hui.wang@canonical.com, broonie@kernel.org, srinivas.kandagatla@linaro.org,
 jank@cadence.com, mengdong.lin@intel.com, sanyog.r.kale@intel.com,
 Bard Liao <yung-chuan.liao@linux.intel.com>, rander.wang@linux.intel.com,
 bard.liao@intel.com
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


>>>> Detect cases where the clock is assumed to be stopped but the IP is
>>>> not in the relevant state, and add a dynamic debug trace.
>>>
>>> you meant a debug print..and it looks like error print below (also in title).
>>
>> I don't understand the comment. Is the 'trace' confusing and are you asking
>> to e.g. change the commit message to 'add dynamic debug log'?
> 
> Question is what is dynamic about this?
dev_dbg() is part of the kernel dynamic debug capability...

https://www.kernel.org/doc/html/latest/admin-guide/dynamic-debug-howto.html

Not sure what you are asking here?
