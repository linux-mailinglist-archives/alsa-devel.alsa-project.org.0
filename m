Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 706884254F1
	for <lists+alsa-devel@lfdr.de>; Thu,  7 Oct 2021 16:01:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C630B168F;
	Thu,  7 Oct 2021 16:00:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C630B168F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1633615296;
	bh=f5krMqhwgdsJH9xADZJs2I7/67Gk4ODwT4AU2idUMC4=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Of0N2UYRDfIs4kM8fDZIfV6sJDOVmLQKwey3lvZlr1QO3ObQ8MdyKL48KltVytY7X
	 EEWLxc082Pn0WpNKqalTr4aMy1ZWFYL44sVP1WBpE8NJHEZoAC1Rk02py0S9Tcxagp
	 6U+Qzm3rgM4RQ8QjZjYMehFrvjRkYmhysKHu7HVs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7E630F804CF;
	Thu,  7 Oct 2021 15:59:58 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5C269F8028B; Thu,  7 Oct 2021 15:59:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A9015F80130
 for <alsa-devel@alsa-project.org>; Thu,  7 Oct 2021 15:59:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A9015F80130
X-IronPort-AV: E=McAfee;i="6200,9189,10130"; a="225027006"
X-IronPort-AV: E=Sophos;i="5.85,354,1624345200"; d="scan'208";a="225027006"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2021 06:59:41 -0700
X-IronPort-AV: E=Sophos;i="5.85,354,1624345200"; d="scan'208";a="440273797"
Received: from klmutolo-mobl.amr.corp.intel.com (HELO [10.212.1.203])
 ([10.212.1.203])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2021 06:59:40 -0700
Subject: Re: [RFC PATCH v2 0/5] ASoC: soc-pcm: fix trigger race conditions
 with shared BE
To: Takashi Iwai <tiwai@suse.de>
References: <20211004225441.233375-1-pierre-louis.bossart@linux.intel.com>
 <cce82420-d744-ee43-d514-b77ac4905ffa@nvidia.com>
 <1efa1c31-7342-05f8-5f73-95e2462d4179@linux.intel.com>
 <3683cf39-632b-50df-c65d-63779c464850@nvidia.com>
 <11257d77-9975-3b00-94da-5dc1b5c95fc6@linux.intel.com>
 <s5hk0ip9js7.wl-tiwai@suse.de>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <ff43fede-aa66-3cb7-6365-e1f279cd135f@linux.intel.com>
Date: Thu, 7 Oct 2021 08:31:49 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <s5hk0ip9js7.wl-tiwai@suse.de>
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


>> Takashi, Mark, do you think that an all/none assumption on FE nonatomic
>> properties would make sense?
> 
> As long as BE's are updated from FE's PCM callback, BE has to follow
> the atomicity of its FE, so we can't assume all or none globally.

A BE may have more than one FEs. That's precisely the point of
mixers/demux, and if the BE has FEs with different 'atomicity' then I
don't see how locking can work: the BE operations are run in the context
of each of its FE, typically using the following loop:

for_each_dpcm_be(fe, stream, dpcm) {
   do_something();
}

Applications will view multiple FEs as completely independent. They may
be opened/prepared/started/stopped/paused as needed. When the BE is
shared, then there is a need for consistency, such as starting the BE
when the first FE becomes active and stopping it when the last FE stops.

> How is the expected lock granularity and the protection context?  Do
> we need a card global lock/mutex, or is it specific to each BE
> substream?

We already have a dpcm_lock at the card level, which protects the
addition of BEs and BE states. That spin_lock is fine for most cases.

The only real problem is the trigger, which is currently completely
unprotected: we have to serialize the BE triggers, otherwise you could
STOP before you START due to scheduling, or other problems that I saw in
my SoundWire tests with two START triggers, or the STOP never sent.

But how to do this serialization is unclear...

A lateral thinking approach would be to decouple the BEs entirely, and
have the FEs 'signal' their change of state. The BE 'thread' run in the
BE context would then serialize the requests and perform all the BE
operations, and the same approach could be chained. I am afraid that
would be a complete rewrite of DPCM, but maybe we have to do so anyways
if we can't support a basic case of a mixer with 2 streams :-)

