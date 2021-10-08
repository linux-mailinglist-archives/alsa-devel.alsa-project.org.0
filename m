Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A13F1426DC9
	for <lists+alsa-devel@lfdr.de>; Fri,  8 Oct 2021 17:43:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3DF1B1690;
	Fri,  8 Oct 2021 17:42:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3DF1B1690
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1633707787;
	bh=GcQ7HFBYxIxzKkM+TAEzYmdP//8hEzY+IwiM1otm21M=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=aDhqABMGRS3i1c7IJ5fW32hA8ltf+ITBcfHPmUD9h4521DY1wzAHJ/83QlcqUFEVp
	 BvYzeY1+UBc7PiRNxy/TIRoLejds+Z9brxA03z7AeNbv9O9NX8FP0S/ZPITY7d0ne7
	 vFE8+0AQL5E8ORN5dtCeEG9jsVjAeMWIAzkjnyN4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 98AEDF80124;
	Fri,  8 Oct 2021 17:41:50 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 41F12F80124; Fri,  8 Oct 2021 17:41:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=NICE_REPLY_A,PRX_BODY_78,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9BA10F800F0
 for <alsa-devel@alsa-project.org>; Fri,  8 Oct 2021 17:41:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9BA10F800F0
X-IronPort-AV: E=McAfee;i="6200,9189,10131"; a="287413296"
X-IronPort-AV: E=Sophos;i="5.85,358,1624345200"; d="scan'208";a="287413296"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2021 08:41:41 -0700
X-IronPort-AV: E=Sophos;i="5.85,358,1624345200"; d="scan'208";a="440680849"
Received: from vgopala1-mobl.amr.corp.intel.com (HELO [10.212.34.202])
 ([10.212.34.202])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2021 08:41:40 -0700
Subject: Re: [RFC PATCH v2 0/5] ASoC: soc-pcm: fix trigger race conditions
 with shared BE
To: Takashi Iwai <tiwai@suse.de>
References: <20211004225441.233375-1-pierre-louis.bossart@linux.intel.com>
 <cce82420-d744-ee43-d514-b77ac4905ffa@nvidia.com>
 <1efa1c31-7342-05f8-5f73-95e2462d4179@linux.intel.com>
 <3683cf39-632b-50df-c65d-63779c464850@nvidia.com>
 <11257d77-9975-3b00-94da-5dc1b5c95fc6@linux.intel.com>
 <s5hk0ip9js7.wl-tiwai@suse.de>
 <ff43fede-aa66-3cb7-6365-e1f279cd135f@linux.intel.com>
 <s5hzgrk98y9.wl-tiwai@suse.de>
 <80882fe6-ea30-43f6-8d83-8995dd28c748@linux.intel.com>
 <s5hwnmo96vh.wl-tiwai@suse.de>
 <60c6a90b-290d-368c-ce61-4d86e70eaa78@linux.intel.com>
 <s5hily88rri.wl-tiwai@suse.de>
 <75894aba-ca1a-51d6-df7d-ad53fcd89f79@linux.intel.com>
 <s5hee8w82ng.wl-tiwai@suse.de>
 <e9340874-320a-8fc6-f3a4-9cf77f85db25@linux.intel.com>
 <s5hczof7eoq.wl-tiwai@suse.de>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <dcdb8f74-51db-86a1-959f-909dfac22b26@linux.intel.com>
Date: Fri, 8 Oct 2021 10:41:37 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <s5hczof7eoq.wl-tiwai@suse.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Sameer Pujar <spujar@nvidia.com>, vkoul@kernel.org, broonie@kernel.org,
 Gyeongtaek Lee <gt82.lee@samsung.com>,
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


>> dpcm_be_disconnect already uses a spin_lock around
>>
>> list_del(&dpcm->list_be);
>> list_del(&dpcm->list_fe);
>>
>> and in some other places, are you suggesting we change those to the FE lock?
> 
> Basically yes.
> 
>> Otherwise, I understood your proposal as using three locks (existing
>> spinlock, FE lock, BE lock) to deal with DPCM. If the existing spinlock
>> and FE lock are combined, we'd still have two locks.
> 
> Stream locks are more fine-grained, hence more efficient :)
> The card-level spinlock is superfluous and it can go away.
> 
>> I was suggesting we use only one ;-)
> 
> Basically we need to protect two things:
> - The BE links
> - The concurrent accesses to BEs
> The former belongs to each FE that holds the links, and the FE stream
> lock would cover.  The latter is rather a per-BE business.
> 
> An oft-seen risk of multiple locks is deadlocking, but in this case,
> as long as we keep the lock order FE->BE, nothing wrong can happen.

famous last words  "nothing wrong can happen." :-)

I already added a helper to do this FE lock, I can easily replace the
implementation to remove the spin_lock and use the FE PCM lock.
we might even add the lock in the definition of for_each_dpcm_be() to
avoid misses.

Let me try this out today, thanks for the suggestions.
