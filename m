Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 646F4130AE
	for <lists+alsa-devel@lfdr.de>; Fri,  3 May 2019 16:49:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B2BEB17FD;
	Fri,  3 May 2019 16:48:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B2BEB17FD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1556894973;
	bh=GTZGruciXLuaMjYYhYu2QVx4jPRNu004odFQI00SWnw=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HodDTQd0UaQ/rzEd2+SmDb/aJ+t6Uoe/mUMIdGF/4Qujpmaawxjfl742mB3rsPAOL
	 KOps6O6PG0HUZsuNYtfq/d0BiDGLOvwgMzI6J1PPiSxYlHjqZMg8UHWud5vbkwuLWa
	 WCthl9ajevddC69ttkUUMNguxje2Uwh16C8UkZkM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3A038F896B6;
	Fri,  3 May 2019 16:47:49 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B11CFF896B7; Fri,  3 May 2019 16:47:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=none autolearn=disabled
 version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1A945F8075A
 for <alsa-devel@alsa-project.org>; Fri,  3 May 2019 16:47:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1A945F8075A
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 03 May 2019 07:47:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,426,1549958400"; d="scan'208";a="145736514"
Received: from nzussbla-mobl.amr.corp.intel.com (HELO [10.254.111.239])
 ([10.254.111.239])
 by fmsmga008.fm.intel.com with ESMTP; 03 May 2019 07:47:40 -0700
To: Mark Brown <broonie@kernel.org>
References: <20190430230934.4321-1-pierre-louis.bossart@linux.intel.com>
 <20190503054047.GB14916@sirena.org.uk>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <6ac56436-5ce1-d977-45ef-f305f77bfe01@linux.intel.com>
Date: Fri, 3 May 2019 09:47:39 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190503054047.GB14916@sirena.org.uk>
Content-Language: en-US
Cc: tiwai@suse.de, alsa-devel@alsa-project.org
Subject: Re: [alsa-devel] [PATCH 00/19] ASoC: SOF: improvements for ABI
 checks and Intel code
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



On 5/3/19 12:40 AM, Mark Brown wrote:
> On Tue, Apr 30, 2019 at 06:09:15PM -0500, Pierre-Louis Bossart wrote:
>> This series is a set of relatively small SOF changes after the big
>> batch merged last week (Thanks!). Since we are very close to the merge
>> window and in May where most of the world takes time off, it'd be
>> perfectly understandable if those patches were queued for 5.3, after
>> feedback and corrections as needed.
> 
> The headline thing I see when this pops up in my inbox is yet another 20
> patch series for these DSPs, I'm not going to notice the size of the
> patches on a first pass.  As I think you've noticed there's a lot of
> reviewer fatigue setting in with this stuff, one thing that'd really
> help here is if there were some help from Intel people with review for
> the DPCM code.

I can certainly understand reviewer fatigue, i've had to put a time 
limit on daily reviews to keep my sanity, but I don't get your last 
point. These patches were submitted and reviewed by Intel people on 
GitHub, what you see here is the result of multiple iterations precisely 
to make sure the patches are acceptable for upstream. we've set the goal 
of having two Intel aprovers for each patch. Can you elaborate on how we 
can make your life simpler?
FYI we are going to have a number of fixes coming in the next 2 months 
for HDaudio support, changes to IPC/power flows to support D0ix states 
and SoundWire, 3rd party firmware module support, etc, so I really want 
to make sure you are comfortable with SOF-related patches, their level 
of maturity and the submission rate.
Thanks!
-Pierre
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
