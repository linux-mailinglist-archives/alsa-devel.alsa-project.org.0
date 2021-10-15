Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A08C642F9C0
	for <lists+alsa-devel@lfdr.de>; Fri, 15 Oct 2021 19:10:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 16260186B;
	Fri, 15 Oct 2021 19:09:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 16260186B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1634317844;
	bh=1jzp94ZkjpUkuWx6tVRwqIk44Ve+SbMxZLlxOtbjHj8=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=GYme34xO3uh08gPZUTZkXfv4zkgIAzjOIb8r47v9yH/7nFIDVeiUwID63OYNMYx4J
	 jbbe1sTxOm6qxQdrd9yci4q6T8wWiwha3eHGIdUiPHJ5f09ao2hrP7XLdhaKd7rNVB
	 Qvt4p4I+1rMpXf718uhQ6Um+Ul2BZ8paLMG+s3Qs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 699ABF80167;
	Fri, 15 Oct 2021 19:09:27 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6FBB0F80269; Fri, 15 Oct 2021 19:09:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6596BF8016C
 for <alsa-devel@alsa-project.org>; Fri, 15 Oct 2021 19:09:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6596BF8016C
X-IronPort-AV: E=McAfee;i="6200,9189,10138"; a="291435159"
X-IronPort-AV: E=Sophos;i="5.85,376,1624345200"; d="scan'208";a="291435159"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2021 10:08:52 -0700
X-IronPort-AV: E=Sophos;i="5.85,376,1624345200"; d="scan'208";a="492640732"
Received: from liminghu-mobl.ccr.corp.intel.com (HELO [10.212.23.213])
 ([10.212.23.213])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2021 10:08:51 -0700
Subject: Re: [RFC PATCH v3 05/13] ASoC: soc-pcm: align BE 'atomicity' with
 that of the FE
To: Takashi Iwai <tiwai@suse.de>
References: <20211013143050.244444-1-pierre-louis.bossart@linux.intel.com>
 <20211013143050.244444-6-pierre-louis.bossart@linux.intel.com>
 <2847a6d1-d97f-4161-c8b6-03672cf6645c@nvidia.com>
 <s5hmtnavisi.wl-tiwai@suse.de>
 <e2a79095-b8ce-9dd4-3e6d-00f8dda99f30@linux.intel.com>
 <s5h1r4muwlj.wl-tiwai@suse.de>
 <8aa4fa07-2b55-3927-f482-c2fd2b01a22e@linux.intel.com>
 <s5hmtnateeo.wl-tiwai@suse.de>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <c0803288-efb1-aaeb-218f-e1a6ba87abd7@linux.intel.com>
Date: Fri, 15 Oct 2021 12:08:48 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <s5hmtnateeo.wl-tiwai@suse.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Sameer Pujar <spujar@nvidia.com>,
 Takashi Iwai <tiwai@suse.com>, open list <linux-kernel@vger.kernel.org>,
 vkoul@kernel.org, broonie@kernel.org, Gyeongtaek Lee <gt82.lee@samsung.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
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


>> I have not been able to figure out when you need
>> a) the pcm_mutex only
>> b) the fe stream lock only
>> c) both pcm_mutex and fe stream lock
> 
> The pcm_mutex is needed for every sleepable function that treat DPCM
> FE link, but the mutex is taken only at the upper level, i.e. the
> top-most caller like PCM ops FE itself or the DAPM calls.
> 
> That said, pcm_mutex is the top-most protection of BE links in FE.
> But, there is a code path where a mutex can't be used, and that's the
> FE and BE trigger.  For protecting against this, the FE stream lock is
> taken only at the placing both adding and deleting a BE *in addition*.
> At those places, both pcm_mutex and FE stream lock are taken.
> 
> BE stream lock is taken in addition below the above mutex and FE
> locks.

Thanks Takashi, now I get the idea. Makes sense indeed. I'll make sure
to add this explanation to the commit message/cover so that it's not lost.

I added your three patches to my tests, so far so good, code is that
https://github.com/thesofproject/linux/pull/3215

Thanks and have a nice week-end.
-Pierre
