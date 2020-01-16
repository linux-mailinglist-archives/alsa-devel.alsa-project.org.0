Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 418FD13E7B7
	for <lists+alsa-devel@lfdr.de>; Thu, 16 Jan 2020 18:27:51 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B1C5517E3;
	Thu, 16 Jan 2020 18:27:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B1C5517E3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1579195670;
	bh=HK7SYmqkPhv6MddUNKfDRMMeyWY/dR8Yy9kqMDdIkno=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NqR7o6AnVrz9bD/Ix8dylPRP+Dm7sEwZnnn5RhiHyLpO5kZu/pW2PLHAyovOM6OvR
	 RMFhawEBbZ7Ywv1bqWReHdKCY9nwFjGx2Zx7IPxGReqmeJJxbAtWAn1S8OXDvNGYOR
	 JfvhEKB8mKypFeqb3D71CfGWQruAccVmrRtxaxc8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A1643F80171;
	Thu, 16 Jan 2020 18:26:07 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 25E42F8014E; Thu, 16 Jan 2020 18:26:05 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=PRX_BODY_72, RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 94CF6F800E9
 for <alsa-devel@alsa-project.org>; Thu, 16 Jan 2020 18:25:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 94CF6F800E9
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 16 Jan 2020 09:25:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,327,1574150400"; d="scan'208";a="248886513"
Received: from mrajwa-mobl.ger.corp.intel.com (HELO [10.249.152.103])
 ([10.249.152.103])
 by fmsmga004.fm.intel.com with ESMTP; 16 Jan 2020 09:25:53 -0800
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 "Jie, Yang" <yang.jie@intel.com>, Takashi Iwai <tiwai@suse.de>,
 Keyon Jie <yang.jie@linux.intel.com>
References: <20200116045318.5498-1-yang.jie@linux.intel.com>
 <s5hd0bjq3cu.wl-tiwai@suse.de>
 <97bbe88d1a6b63fe8e9b02bf0c5ce4a80553c48d.camel@linux.intel.com>
 <s5hsgkf7l2e.wl-tiwai@suse.de>
 <3c0a0067043d614cd4491b28acf6d49640746b15.camel@linux.intel.com>
 <s5hh80v7h82.wl-tiwai@suse.de>
 <E7B1D079BA13FB44A978CC8F69C7D6A96F98EDB4@SHSMSX105.ccr.corp.intel.com>
 <E7B1D079BA13FB44A978CC8F69C7D6A96F98EE27@SHSMSX105.ccr.corp.intel.com>
 <c70934a1-b838-5029-6573-bf76a34c4cb9@linux.intel.com>
From: "Rajwa, Marcin" <marcin.rajwa@linux.intel.com>
Message-ID: <93ac843a-bad5-550e-f427-e2a94bd3e8ef@linux.intel.com>
Date: Thu, 16 Jan 2020 18:25:52 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <c70934a1-b838-5029-6573-bf76a34c4cb9@linux.intel.com>
Content-Language: en-US
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
Subject: Re: [alsa-devel] [PATCH] ALSA: pcm: fix buffer_bytes max
 constrained by preallocated bytes issue
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


On 1/16/2020 5:39 PM, Pierre-Louis Bossart wrote:
>
>>> So, do you suggest not doing preallocation(or calling it with 0 
>>> size) for all
>>> driver with TYPE_SG? I am fine if this is the recommended method, I 
>>> can try
>>> this on SOF I2S platform to see if it can work as we required for 
>>> very large
>>> buffer size.
>
> Keyon, for the rest of us to follow this patch, would you mind 
> clarifying what drives the need for a 'very large buffer size', and 
> what order of magnitude this very large size would be.
>
> FWIW, we've measured consistently on different Windows/Linux 
> platforms, maybe 10 years ago, that once you reach a buffer of 1s (384 
> kB) the benefits from increasing that buffer size further are marginal 
> in terms of power consumption, and generate all kinds of issues with 
> volume updates and deferred routing changes.
>
We need bigger buffer on host side to compensate the wake up time from 
d0ix to d0 which takes ~2 seconds on my setup. So, wiith smaller buffer 
sizes like < 2 seconds we overwrite data since FW keeps copping while 
host doesn't read until its up and running again.

> Thanks
> -Pierre
> _______________________________________________
> Alsa-devel mailing list
> Alsa-devel@alsa-project.org
> https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
