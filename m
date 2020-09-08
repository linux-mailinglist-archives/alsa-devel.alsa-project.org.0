Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F2AF261291
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Sep 2020 16:23:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 78DA6176A;
	Tue,  8 Sep 2020 16:22:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 78DA6176A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1599575008;
	bh=rDXMkjZg2zrVITxRCUNUoGTJIfcPchmrk+rLMMko8cs=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=iLMDYMFm5fqfo8w9l96Z4BQgjZHYyYryssEDWdCTabgoEsavYYE/Vszyhb55ElFG6
	 4zn35QDi2CkIWB8WlxpojKPjSafvcqeXd4+Ac1Me/o2DtWUjwZAI17W/biv93Vb919
	 FjUF/z6Xfuls88+SEXowaNfHzdL4BphTBj6sZ1M0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 800A8F8010B;
	Tue,  8 Sep 2020 16:21:47 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9A23DF80272; Tue,  8 Sep 2020 16:21:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.6 required=5.0 tests=NICE_REPLY_A,
 RCVD_IN_MSPIKE_H3, RCVD_IN_MSPIKE_WL, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 76371F8015F
 for <alsa-devel@alsa-project.org>; Tue,  8 Sep 2020 16:21:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 76371F8015F
IronPort-SDR: vXg6LULyu54BVYAoxizhsDQoX27vEIHP+bs+uzd6LXP9oYSMNh3Z2iGBxysFDXzhi47bO17vKm
 5svteUg+Msmw==
X-IronPort-AV: E=McAfee;i="6000,8403,9737"; a="159106181"
X-IronPort-AV: E=Sophos;i="5.76,406,1592895600"; d="scan'208";a="159106181"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2020 07:21:35 -0700
IronPort-SDR: 9U38V0bUd/mYray5wxzCRDWYnjXBiS9lSL/E5HRYyM5x5YzRydwb5vMf0RiJypQh71yIJ9AtA3
 fqccYaeY54Sg==
X-IronPort-AV: E=Sophos;i="5.76,406,1592895600"; d="scan'208";a="448802360"
Received: from mgarber-mobl1.amr.corp.intel.com (HELO [10.212.179.134])
 ([10.212.179.134])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2020 07:21:34 -0700
Subject: Re: [RFC PATCH 0/3] alsa-lib/ASoC: use inclusive language for
 bclk/fsync/topology
To: Mark Brown <broonie@kernel.org>
References: <20200903201024.1109914-1-pierre-louis.bossart@linux.intel.com>
 <cac824a4-3882-85dd-dc0b-8366090dce94@perex.cz>
 <9d1c96ad-6860-7a98-4e22-5f566665e7e7@linux.intel.com>
 <20200904085058.GA4625@sirena.org.uk>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <d5682ba4-c487-ef68-ff15-fd51ec655cf1@linux.intel.com>
Date: Tue, 8 Sep 2020 08:36:03 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200904085058.GA4625@sirena.org.uk>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: tiwai@suse.de, alsa-devel@alsa-project.org
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



On 9/4/20 3:50 AM, Mark Brown wrote:
> On Thu, Sep 03, 2020 at 04:32:22PM -0500, Pierre-Louis Bossart wrote:
>> On 9/3/20 3:42 PM, Jaroslav Kysela wrote:
> 
>>>
>>> Only my 2 cents: It's just another word combo. See bellow for sources for others.
>>>
>>> I would prefer probably provider/consumer . It sounds more technic.
> 
>> Thanks Jaroslav for chiming in. I had a similar set of comments in internal
>> reviews, but we didn't really have any consensus and I have not seen good
>> guidance specifically for clocks.
> 
>> Provider/consumer is typically used for discrete data exchange with some
>> sort of locking and buffer fullness metric, but for clocks we'd want
>> something that hints at one device following the timing defined by another.
> 
>> "follow" or "track" seem clearer than 'consume' IMHO, but I will side with
>> the majority, this is an RFC which can be modified at will.
> 
> Producer/consumer is already quite widely used for clocks (possibly
> following the regulator API which was templated off the clock API and
> uses consumer).  The follow/track stuff definitely seems awkward to me.
> Have we seen any movement from anyone like CODEC vendors on this?

No, I haven't seen any input from CODEC vendors.

I'll use consumer then since that's preferred by both Jaroslav and Mark. 
Thanks for the feedback.
