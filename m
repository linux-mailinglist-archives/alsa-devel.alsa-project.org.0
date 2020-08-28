Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 40879255DA8
	for <lists+alsa-devel@lfdr.de>; Fri, 28 Aug 2020 17:20:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E586D18A8;
	Fri, 28 Aug 2020 17:19:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E586D18A8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1598628012;
	bh=BfEGsvkA+wLvUfI+kpZgTVxR1opyNLSWIo5qzVPgO1I=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=BeVkhwtSDdBb56SwaLMmjH6WaeX1jzQTavprwm1aQUz9UdFi8D/r1TTmVK5NboR6I
	 XvpJM8VTzeSTYkqW2fbj/SP3ezoSfG0CWpVkcUKBMXCyeCh8+sIpfv6RzNHDYpplR7
	 CMq4aGKnsBkOsJPNRS/+u+irjNf5lUaVNzi3zAh0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3ADD4F8016F;
	Fri, 28 Aug 2020 17:18:31 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9A690F801D9; Fri, 28 Aug 2020 17:18:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.8 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 17942F800EB
 for <alsa-devel@alsa-project.org>; Fri, 28 Aug 2020 17:18:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 17942F800EB
IronPort-SDR: 7NnSTk190oLAgQfOWv9niz/FLWZMgW23Jn5YUYJzhWQeuJMUDCg8K2yaOlCUeU8M6zW5808s3s
 hsd9LMHN5Qwg==
X-IronPort-AV: E=McAfee;i="6000,8403,9727"; a="136744147"
X-IronPort-AV: E=Sophos;i="5.76,364,1592895600"; d="scan'208";a="136744147"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2020 08:18:17 -0700
IronPort-SDR: SFp7fwoh3RchKClBFDuKhvS/zyDJ89FB5QdHBT8YxtTTdzyj6eGP06bF4a0Hnwq18on9CEopNw
 z409P3XXfl0A==
X-IronPort-AV: E=Sophos;i="5.76,364,1592895600"; d="scan'208";a="300266451"
Received: from lilymao-mobl.amr.corp.intel.com (HELO [10.209.185.175])
 ([10.209.185.175])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2020 08:18:15 -0700
Subject: Re: [PATCH 4/4] regmap: sdw: add support for SoundWire 1.2 MBQ
To: Vinod Koul <vkoul@kernel.org>
References: <20200825171656.75836-1-pierre-louis.bossart@linux.intel.com>
 <20200825171656.75836-5-pierre-louis.bossart@linux.intel.com>
 <20200826090542.GZ2639@vkoul-mobl>
 <c5119781-bee0-f11b-eb73-cd2da6ab09f5@linux.intel.com>
 <20200828072342.GK2639@vkoul-mobl>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <79ec0d5b-21e9-d54d-1c73-e1007cf493fa@linux.intel.com>
Date: Fri, 28 Aug 2020 09:49:16 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200828072342.GK2639@vkoul-mobl>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 alsa-devel@alsa-project.org, Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>, tiwai@suse.de,
 gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Hui Wang <hui.wang@canonical.com>, broonie@kernel.org,
 srinivas.kandagatla@linaro.org, jank@cadence.com, slawomir.blauciak@intel.com,
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


>>>> +#include <linux/mod_devicetable.h>
>>>
>>> Curious why do you need this header?
>>
>> I'll return the question back to you, since you added this header for
>> regmap-sdw.c:
>>
>> 7c22ce6e21840 (Vinod Koul           2018-01-08 15:50:59 +0530  6) #include
>> <linux/mod_devicetable.h>
> 
> Looks like it should be removed :)
> 
> I could compile it without any issues on few archs I do. let me push the
> patch on my tree and see if bots are happy, will send the patch

I already fixed this on my side, will submit next week.
