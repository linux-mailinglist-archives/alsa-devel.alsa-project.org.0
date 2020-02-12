Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B38015ACC6
	for <lists+alsa-devel@lfdr.de>; Wed, 12 Feb 2020 17:05:34 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CD1B1167A;
	Wed, 12 Feb 2020 17:04:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CD1B1167A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1581523533;
	bh=184mD0ZRb1OgZdzOjjfAV/UYtE0Zed0t6FavUsfK27o=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=FwjfVBBFojp4N52D/KnvUPqjAKSKSoyRcN7PHQEXfuWYCRIeBGPRpSbNLUCMyZC6j
	 ZJfiU7iIFBFXrrltF/Ozi0w9iLJroaA4Sn3loFFMy7oGN8kHOCt1zwvLbfbljnuTUy
	 o2LUjcLymIHyQAjaYTTe3/7eAVwBwcXlFeqXTkJA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D74FDF8020B;
	Wed, 12 Feb 2020 17:03:52 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EEAA8F80158; Wed, 12 Feb 2020 17:03:49 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A353FF80125
 for <alsa-devel@alsa-project.org>; Wed, 12 Feb 2020 17:03:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A353FF80125
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 12 Feb 2020 08:03:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,433,1574150400"; d="scan'208";a="313442360"
Received: from gmoralez-mobl.amr.corp.intel.com (HELO [10.252.135.232])
 ([10.252.135.232])
 by orsmga001.jf.intel.com with ESMTP; 12 Feb 2020 08:03:41 -0800
To: Adam Thomson <Adam.Thomson.Opensource@diasemi.com>,
 "Sridharan, Ranjani" <ranjani.sridharan@intel.com>
References: <1581322611-25695-1-git-send-email-brent.lu@intel.com>
 <AM6PR10MB2263F302A86B17C95B16361280190@AM6PR10MB2263.EURPRD10.PROD.OUTLOOK.COM>
 <SN6PR11MB26702B2E7E5F705425517F4897180@SN6PR11MB2670.namprd11.prod.outlook.com>
 <855c88fb-4438-aefb-ac9b-a9a5a2dc8caa@linux.intel.com>
 <CAFQqKeWHDyyd_YBBaD6P2sCL5OCNEsiUU6B7eUwtiLv8GZU0yg@mail.gmail.com>
 <2eeca7fe-aec9-c680-5d61-930de18b952b@linux.intel.com>
 <CAFQqKeXK3OG7KXaHGUuC75sxWrdf11xJooC7XsDCOyd6KUgPTQ@mail.gmail.com>
 <c9dbcdd8-b943-94a6-581f-7bbebe8c6d25@linux.intel.com>
 <AM6PR10MB22630C79D08CE74878A6A096801B0@AM6PR10MB2263.EURPRD10.PROD.OUTLOOK.COM>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <043c8384-6ce2-c78e-f52c-6a37a4bab3a0@linux.intel.com>
Date: Wed, 12 Feb 2020 09:48:24 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <AM6PR10MB22630C79D08CE74878A6A096801B0@AM6PR10MB2263.EURPRD10.PROD.OUTLOOK.COM>
Content-Language: en-US
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 Support Opensource <Support.Opensource@diasemi.com>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Chiang,
 Mac" <mac.chiang@intel.com>, Mark Brown <broonie@kernel.org>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, "Lu,
 Brent" <brent.lu@intel.com>, "cychiang@google.com" <cychiang@google.com>
Subject: Re: [alsa-devel] [PATCH] ASoC: da7219: check SRM lock in trigger
 callback
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


>> Thanks Ranjani. That information closes the door on the idea of playing
>> with the trigger order suggested earlier in the thread, so my guess is
>> that we really need to expose the MCLK/BCLK with the clk API and turn
>> them on/off from the machine driver as needed. I hope is that we don't
>> need the FSYNC as well, that would be rather painful to implement.
> 
> Am not going to make myself popular here. It's MCLK and FSYNC (or WCLK as it's
> termed for our device) that is required for SRM to lock in the PLL.
> 
> So far I've not found a way in the codec driver to be able to get around this.
> I spent a very long time with Sathya in the early days (Apollo Lake) looking at
> options but nothing would fit which is why I have the solution that's in place
> right now. We could probably reduce the number of rechecks before timeout in the
> driver but that's really just papering over the crack and there's still the
> possibility of noise later when SRM finally does lock.

Sorry, you lost me at "the solution that's in place right now". There is 
nothing in the bxt_da7219_max98357a.c code that deals with clocks or 
defines a trigger order?
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
