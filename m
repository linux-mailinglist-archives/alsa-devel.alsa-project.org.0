Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E1EB3628D2
	for <lists+alsa-devel@lfdr.de>; Fri, 16 Apr 2021 21:41:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0190916F7;
	Fri, 16 Apr 2021 21:40:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0190916F7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1618602068;
	bh=xG3Vw5PJm1M0X9ootQB/NIPL+ZYZPPqD3eUKnIz+/GE=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JeMTLp2gPkzl5hXDIFPYzim0VONxSIHsILfSicVF7QecMx552thM+BGaxqiIo7sA2
	 0osHxMxahfejyNspqWva6pjRaPYWy9OQhXTmmiMPzzxyDKf9YCFI5D0QKmz9sZvkSY
	 peNCZdbLJP5RWQip1M0XhN+WhHi2/gJRiAuzCNow=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 68881F80128;
	Fri, 16 Apr 2021 21:39:39 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 40C3BF8025B; Fri, 16 Apr 2021 21:39:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CB516F800B9
 for <alsa-devel@alsa-project.org>; Fri, 16 Apr 2021 21:39:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CB516F800B9
IronPort-SDR: htO3FkUm7QcnuTvgTzzm0sZBS5Pc2R2VDo4oRGarzieuJw4KIhQn1MlI2kElCoNCkmkl58XGxK
 tF7pp1sdv5yA==
X-IronPort-AV: E=McAfee;i="6200,9189,9956"; a="191906415"
X-IronPort-AV: E=Sophos;i="5.82,228,1613462400"; d="scan'208";a="191906415"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2021 12:39:27 -0700
IronPort-SDR: TgYFmc1TUDQHE1/z0EdC61yKFSvMHL4BM/zw1xlFAfqE10/PxRQ7Cr3rgOxqfx8BZJ4e0upa3K
 azOAIRmfVJ2Q==
X-IronPort-AV: E=Sophos;i="5.82,228,1613462400"; d="scan'208";a="453452132"
Received: from ganeshsu-mobl.amr.corp.intel.com (HELO [10.254.191.217])
 ([10.254.191.217])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2021 12:39:27 -0700
Subject: Re: [RFC PATCH 0/3] Separate BE DAI HW constraints from FE ones
To: Mark Brown <broonie@kernel.org>
References: <20210323114327.3969072-1-codrin.ciubotariu@microchip.com>
 <a0c862ec-44ba-52e0-551c-0347166ac4e9@perex.cz>
 <5e1fb981-48c1-7d5a-79a6-ba54bac26165@microchip.com>
 <4f401536-5a66-0d65-30cb-7ecf6b235539@microchip.com>
 <20210415161743.GH5514@sirena.org.uk>
 <1aff49d4-5691-67cb-3fe7-979d476f1edb@microchip.com>
 <20210415172554.GI5514@sirena.org.uk>
 <ad5d556b-601f-c6f6-347e-86a235237c02@microchip.com>
 <20210416163131.GI5560@sirena.org.uk>
 <79161044-26b2-729a-b831-b79cc238e239@linux.intel.com>
 <20210416185538.GK5560@sirena.org.uk>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <dfcf8b69-6ede-7344-79c0-cb572e03359c@linux.intel.com>
Date: Fri, 16 Apr 2021 14:39:25 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210416185538.GK5560@sirena.org.uk>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, gustavoars@kernel.org, lgirdwood@gmail.com,
 linux-kernel@vger.kernel.org, tiwai@suse.com, Codrin.Ciubotariu@microchip.com,
 mirq-linux@rere.qmqm.pl
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



On 4/16/21 1:55 PM, Mark Brown wrote:
> On Fri, Apr 16, 2021 at 11:47:01AM -0500, Pierre-Louis Bossart wrote:
>> On 4/16/21 11:31 AM, Mark Brown wrote:
> 
>>> Not really written down that I can think of.  I think the next steps
>>> that I can think of right now are unfortunately bigger and harder ones,
>>> mainly working out a way to represent digital configuration as a graph
>>> that can be attached to/run in parallel with DAPM other people might
>>> have some better ideas though.  Sorry, I appreciate that this isn't
>>> super helpful :/
> 
>> I see a need for this in our future SoundWire/SDCA work. So far I was
>> planning to model the entities as 'widgets' and lets DAPM propagate
>> activation information for power management, however there are also bits of
>> information in 'Clusters' (number of channels and spatial relationships)
>> that could change dynamically and would be interesting to propagate across
>> entities, so that when we get a stream of data on the bus we know what it
>> is.
> 
> Yes, I was thinking along similar lines last time I looked at it - I was
> using the term digital domains.  You'd need some impedence matching
> objects for things like SRCs, and the ability to flag which
> configuration matters within a domain (eg, a lot of things will covert
> to the maximum supported bit width for internal operation so bit width
> only matters on external interfaces) but I think for a first pass we can
> get away with forcing everything other than what DPCM has as front ends
> into static configurations.

You lost me on the last sentence. did you mean "forcing everything into 
static configurations except for what DPCM has as front-ends"?

It may already be too late for static configurations, Intel, NXP and 
others have started to enable cases where the dailink configuration varies.

FWIW both the USB and SDCA class document are very careful with the 
notion of constraints and whether an entity is implemented in the analog 
or digital domains. There are 'clock sources' that may be used in 
specific terminals but no notion of explicit SRC in the graph to leave 
implementers a lot of freedom. There is a notion of 'Usage' that 
describes e.g. FullBand or WideBand without defining what the 
representation is. The bit width is also not described except where 
necessary (history buffers and external bus-facing interfaces). Like you 
said it's mostly the boundaries of the domains that matter.
