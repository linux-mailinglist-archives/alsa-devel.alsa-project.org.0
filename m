Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 12FAE25331E
	for <lists+alsa-devel@lfdr.de>; Wed, 26 Aug 2020 17:13:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A86331768;
	Wed, 26 Aug 2020 17:12:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A86331768
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1598454794;
	bh=/LguMcfUawnfYlYtIwbW/F26bSGASj2xxa/2U3UJUUk=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dOUhZYtLHAAwfBNwl31zU0LdZhlJQsxZHrggK6/kU/OfLguj9+71m/Y22SVLESftD
	 zOZtGguSTmHhMPZl9L7564hCSiYBq01RnxznUVsThjx4GnuljJxirNuGKySaDo5tI1
	 e2GhpNELYXP7XIiHB6QMaxPv+5t4HMbkXzOdH+y0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2693CF802C3;
	Wed, 26 Aug 2020 17:11:35 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A6954F8016F; Wed, 26 Aug 2020 17:11:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 72C01F800EB
 for <alsa-devel@alsa-project.org>; Wed, 26 Aug 2020 17:11:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 72C01F800EB
IronPort-SDR: udUt4jOmRXAW3Doy78DiSsyX4ElW/o+XQK2WYewlpg8KOgI4w6reuGiHuVgrIXHu+E/8BOqhYl
 22EF30YkKv3g==
X-IronPort-AV: E=McAfee;i="6000,8403,9725"; a="143970581"
X-IronPort-AV: E=Sophos;i="5.76,356,1592895600"; d="scan'208";a="143970581"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2020 08:11:23 -0700
IronPort-SDR: 8BOuzBscj9k1lVGdB5yJS0/sLIDM5VLn6aH07+vWPTj0D+L0nElcFtADnHP9l4yhtte+n6Vrfd
 A7qzJE3PNBsQ==
X-IronPort-AV: E=Sophos;i="5.76,356,1592895600"; d="scan'208";a="299505123"
Received: from gillelas-mobl1.amr.corp.intel.com (HELO [10.255.231.51])
 ([10.255.231.51])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2020 08:11:22 -0700
Subject: Re: [PATCH 1/4] regmap: sdw: move to -EOPNOTSUPP
To: Takashi Iwai <tiwai@suse.de>, Mark Brown <broonie@kernel.org>
References: <20200825171656.75836-2-pierre-louis.bossart@linux.intel.com>
 <20200825214858.GK5379@sirena.org.uk>
 <6f7e5830-4dd8-1ecc-20c3-df75bc9ef265@linux.intel.com>
 <20200826095600.GA4965@sirena.org.uk> <s5ha6yhu3af.wl-tiwai@suse.de>
 <20200826101301.GB4965@sirena.org.uk> <s5h8se1u2or.wl-tiwai@suse.de>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <927c93bc-9ad8-7e5d-a5ea-d566e5f543df@linux.intel.com>
Date: Wed, 26 Aug 2020 10:05:50 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <s5h8se1u2or.wl-tiwai@suse.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 alsa-devel@alsa-project.org, Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Hui Wang <hui.wang@canonical.com>, vkoul@kernel.org,
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




>>>> checkpatch is broken.
>>
>>> Heh, I'm not objecting it :)
>>
>>> OTOH, it's also true that ENOTSUPP is no good error code if returned
>>> to user-space.  Unfortunately many codes (including what I wrote) use
>>> this code mistakenly, and they can't be changed any longer...
>>
>> It's also used internally in various places without being returned to
>> userspace, that's what's going on here - the regmap core has some
>> specific checks for -ENOTSUPP.
> 
> Sure, for such an internal usage any code can be used.
> The question is a case like this -- where the return code might be
> carried to outside.  Though, looking through the grep output, all
> callers simply return -EINVAL for any errors, so it doesn't matter
> much for now.

I assumed this change to -EOPNOTSUPP reflected a consensus in 
kernel-land, it's obviously not the case. This patch was supposed to be 
a trivial clean-up...

So to be clear, what is the direction for existing code
a) keep -ENOTSUPP as is?
b) move to -EOPNOTSUPP?

And what is the preference for new code?
