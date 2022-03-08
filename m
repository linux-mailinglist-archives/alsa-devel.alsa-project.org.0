Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BEA3C4D21C9
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Mar 2022 20:43:52 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4F73618D7;
	Tue,  8 Mar 2022 20:43:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4F73618D7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646768632;
	bh=hOKBh5XuLDmZZlJFaJBqV0fyhMsLz64BTs3tYtHggDE=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=i4djluOmYUUEerYWkStaS+kcL0iI0pPBhfJBdGRtAYvqKfpv6jVjRKimnGH6/l/7e
	 StehuH8JfHIASG7TGmpvX+tLufnmmK55IE1yEsI+9T4nWi+kwhnB79bJmJdC81rIqh
	 ms9u/ZtnQMKhH9Xnh+6BuQfOol2JqSYHCw5dYITM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8C697F8025E;
	Tue,  8 Mar 2022 20:42:45 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2972DF800D2; Tue,  8 Mar 2022 20:42:43 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,PRX_BODY_72,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D6EB1F800D2
 for <alsa-devel@alsa-project.org>; Tue,  8 Mar 2022 20:42:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D6EB1F800D2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="gglfqPO5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646768561; x=1678304561;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=hOKBh5XuLDmZZlJFaJBqV0fyhMsLz64BTs3tYtHggDE=;
 b=gglfqPO57EGVbkvuYnMLSSzW/NcJMZQGC9gJwCMfChWLpJofDRZKD+GY
 t2NKXSq456eyBOCntk7qfAcTk/CwGMzT0aJXH7xd//7EuWnYI91uDjSEr
 Ag+M3ZHNTQSwhvxvEDPYuHB8owaqEINrMLtzj2RP4+wJV4g05DsNHVOc1
 xa5W03oyidjgs7ZTwcbDssbEkkAFDu2gXr6POcMEbwl+8EuPIfW0QgW8H
 +yw1EVDFTOpqWwrbzR9o1ENSgGC/z1C3IcNMb+iP+rPpSSk3heB0+FWXo
 Ce5Elb4IRq5wpu5R4pm/jiOw6XZMXAvNfsubL129N1MEwgdk1woV/0c3K Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10280"; a="254525626"
X-IronPort-AV: E=Sophos;i="5.90,165,1643702400"; d="scan'208";a="254525626"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2022 11:42:36 -0800
X-IronPort-AV: E=Sophos;i="5.90,165,1643702400"; d="scan'208";a="547383250"
Received: from jhaskins-mobl.amr.corp.intel.com (HELO [10.209.53.149])
 ([10.209.53.149])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2022 11:42:35 -0800
Message-ID: <269ceef4-2d86-8d52-6946-c69859e970c0@linux.intel.com>
Date: Tue, 8 Mar 2022 13:42:34 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.5.0
Subject: Re: [PATCH v3 11/17] ASoC: Intel: avs: Firmware resources management
 utilities
Content-Language: en-US
To: Cezary Rojewski <cezary.rojewski@intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 alsa-devel@alsa-project.org
References: <20220304145755.2844173-1-cezary.rojewski@intel.com>
 <20220304145755.2844173-12-cezary.rojewski@intel.com>
 <66e20563567955124488eb9f9b53ea6a2bc5d744.camel@linux.intel.com>
 <d7676598-27bc-fe5d-1167-c82795e533f7@intel.com>
 <a571f334944f3ae7762068572003299c34fd187a.camel@linux.intel.com>
 <f70be289-ee9c-51b5-4003-7bc567e87a54@intel.com>
 <9f4cbf5a720aa66d6a540092187ad88b3adb5525.camel@linux.intel.com>
 <4691b216-92f6-8d46-d3db-e302f5f21c34@intel.com>
 <3c79c158757bfd542747bcf7b4de73e4529ac4d5.camel@linux.intel.com>
 <361901b8-f8a5-7b27-ee44-872c4e10bc2c@intel.com>
 <e71e12e1af0b9af115410c8210f21f4e50a09e6f.camel@linux.intel.com>
 <6afef2db-724b-dc42-b6c2-b233c8ba72a7@intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <6afef2db-724b-dc42-b6c2-b233c8ba72a7@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Cc: upstream@semihalf.com, harshapriya.n@intel.com, rad@semihalf.com,
 tiwai@suse.com, hdegoede@redhat.com, broonie@kernel.org,
 amadeuszx.slawinski@linux.intel.com, cujomalainey@chromium.org,
 lma@semihalf.com
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



On 3/8/22 12:31, Cezary Rojewski wrote:
> On 2022-03-08 7:26 PM, Ranjani Sridharan wrote:
>> On Tue, 2022-03-08 at 19:07 +0100, Cezary Rojewski wrote:
>>>> Keeping in mind that this driver is meant for older platforms, how
>>>> likely are you to support multiple sound cards with those
>>>> topologies?
>>>
>>>
>>> Not sure what's the question here. Age of the platform has nothing to
>>> do
>>>
>>> with the subject. There is not a single DSP-capable platform that
>>> Intel
>>>
>>> has shipped that would not contain more one audio device onboard. At
>>>
>>> least I'm not aware of any.
>>
>> My question was related to your comment about multiple sound cards.
>> What I asked was do you plan to support multiple topologies with
>> modules spread across then with multiple sound component drivers with
>> the AVS driver and firmware? Does this mean you will need multiple
>> topology files and machine driver? And what is the rationale for this?
>>
>> If not, there's no need for the mutex.
> 
> Yes, avs-driver embraces granular sound card approach as opposed to 
> super card approach. There is one topology file per sound card.
> 
> That subject is not part of this patchset though.

You would still need to clarify how the same set of modules might be 
accessed or configured when different cards are created, or if there is 
a 'clean' split with a 1:1 mapping between module and cards.

The more I think of this the less practical this 'granular' approach 
looks, e.g. if you want to route the same stream to different interfaces 
handled by different cards. An example is playing a notification on 
local speakers controlled by HDaudio and a Bluetooth headset using I2S. 
This could be really fun to represent even basic volume control to 
users: controls are card-specific and some parts may be handled in 
different cards and thus different UCM files.

I really think the best split of a DSP topology is between orthogonal 
parts. When muxers/demux are used, or multi-input modules such as AEC, 
the routing complexity outweighs the benefits of a simpler card design.


