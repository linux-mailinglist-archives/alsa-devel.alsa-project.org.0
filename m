Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 23DFF519B80
	for <lists+alsa-devel@lfdr.de>; Wed,  4 May 2022 11:22:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B39D583D;
	Wed,  4 May 2022 11:21:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B39D583D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1651656151;
	bh=i9fLxi6Z7/f45IhPF6AnOmG+NoIXc9+8EbkGp2bPTDE=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Is80nCnbWsj/RFidVdKwCErkvapEQaFdwYY4xuh81hXZ0quNi9k5PKFRaR1mECN6w
	 rEZJ35+8kw30e10hFBatF6sl5XkvtDQLqZo+0xxpz/YQqbRrm61Vh9t89/qSOJkODJ
	 wfHl1PTSxMPkrtjzmRrkODd5M8CkxpSMi2RGC5YI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1EA31F800D3;
	Wed,  4 May 2022 11:21:33 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D6D59F80163; Wed,  4 May 2022 11:21:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=1.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,PRX_BODY_30,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B566DF800D3
 for <alsa-devel@alsa-project.org>; Wed,  4 May 2022 11:21:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B566DF800D3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="JvjJfDbK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1651656087; x=1683192087;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=i9fLxi6Z7/f45IhPF6AnOmG+NoIXc9+8EbkGp2bPTDE=;
 b=JvjJfDbKfDCSGBZn7gIwJ19ERCX+v6KkhQCvZuTvwbSmFOuzc5d9ck0K
 +TqFs0A9bcc8SauoL0nJOlOru2GPHHWwQ+TjuzELPm9c5S+EXFzBbdsyN
 +XkBfohdnNhcWPqQCDyhxgtuF5aCJrZgayR2A+SBxhBQklpWZZO7LqeO5
 ehu5RruD4M5JadlUlp/DHuSJzst3Fx78Bdl6WbGKUCDNPW7g/sCWpZ0So
 bbznaxCTp3u3qOXVa2QzIprmK8eT1TpaA/UD+VrpKq35xP+w8O5MgZ0eO
 UO4SZykRFrjcdXXk2oGJ+5pApArATmGGZQlRxMfg2DjjqwsMvsupSsjVt A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10336"; a="248251620"
X-IronPort-AV: E=Sophos;i="5.91,197,1647327600"; d="scan'208";a="248251620"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 May 2022 02:21:22 -0700
X-IronPort-AV: E=Sophos;i="5.91,197,1647327600"; d="scan'208";a="734314950"
Received: from aslawinx-mobl.ger.corp.intel.com (HELO [10.99.241.121])
 ([10.99.241.121])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 May 2022 02:21:19 -0700
Message-ID: <6009dd4b-e5f3-78a6-eade-76c3f30a6d42@linux.intel.com>
Date: Wed, 4 May 2022 11:21:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: ASoC component/card relationship
Content-Language: en-US
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Mark Brown <broonie@kernel.org>
References: <d9c3fed4-de6a-2cd8-acb6-7f3d2ad46b70@linux.intel.com>
 <YnFwGJBjVGrsMJWR@sirena.org.uk>
 <6dea4606-cb5e-1224-bf98-d1da1484ebfd@linux.intel.com>
 <YnGRNfaempsFG9/M@sirena.org.uk>
 <ff511a84-adac-1018-a934-2b8202c5a9fe@linux.intel.com>
From: =?UTF-8?Q?Amadeusz_S=c5=82awi=c5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
In-Reply-To: <ff511a84-adac-1018-a934-2b8202c5a9fe@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Curtis Malainey <cujomalainey@google.com>,
 =?UTF-8?Q?P=c3=a9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>,
 ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>
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

On 5/3/2022 11:42 PM, Pierre-Louis Bossart wrote:
> 
> 
> On 5/3/22 15:31, Mark Brown wrote:
>> On Tue, May 03, 2022 at 01:59:54PM -0500, Pierre-Louis Bossart wrote:
>>
>>>> This means we get back to the assumption we started off with - what are
>>>> we gaining by partitioning things into cards when that's not really
>>>> what's going on with the hardware?
>>
>>> The main benefit is reuse of 'generic' cards.
>>
>>> Take for example HDMI support, it's typically exactly the same from one
>>> board to the other - it's completely standard. And yet, for every card,
>>> we have to add a path in the topology and the machine driver to
>>> represent exactly the same information multiple times. see below how
>>> many times we add the same 'late_probe' callback for HDMI support in
>>> machine drivers.
>>
>>> BT audio is a similar case, the interface configuration and settings are
>>> defined by profiles, so there's almost no variation from one board to
>>> the other except for which I2S number is used.
>>
>>> A peripheral directly attached to an SOC or chipset, such as digital
>>> microphones, is a similar case.
>>
>>> The point is really to try to split what will be variable from board to
>>> board due to different choices of headset codecs, amplifiers,
>>> microphones, from what is generic and reusable.
>>
>> There's a reusability thing here which does seem somewhat valid, but it
>> does feel to me like separate cards is a bit of a case of having a
>> hammer so everything looks like a nail kind of solution to the issue.
>> The issue you've got is not that these are disconnected bits of hardware
>> which operate independently, it's that you don't have a good way of
>> dropping the board variations into a template machine driver or
>> otherwise customising one.
>>
>> Off the top of my head you could probably get some way with this if
>> there were a way to tell the core to skip over some links during
>> instantiation, that might help keep a common core of these bits you wan
>> to split out into cards more static.  Perhaps also being able to add
>> multiple sets of DAIs to a component rather than having to compose the
>> full list and then add everything in one shot?
> 
> Indeed, if we could tell that a BE does not exist on a specific board
> without having to create a topology without said BE that would help
> immensely.
> 

Assuming you want one monolithic topology I guess we could unregister 
FEs exposed by topology when there is no full route to BE? This will be 
bit weird as first you need to load full topology to decide if routing 
is possible and then either keep or remove FEs and associated widgets, etc.

The reason why we split boards in AVS driver to be per codec is that we 
observed that it is mostly copy and paste code between multiple boards 
in various permutations, where some auxiliary codecs are present and 
some are not. This allows us to provide per codec topology.

> See more comments below, if we could provide to the topology loading
> sequence that a BE is not present, or remap it to use a different
> hardware interface (e.g. use SSP2 instead of default SSP0, or number of
> microphones in hardware) that would address most of the concerns we face
> today.
> 

I'll just note that it isn't impossible to do with current topologies 
and is in fact what we do allow in AVS driver for topologies describing 
connection to single i2s codec:
https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git/tree/sound/soc/intel/avs/topology.c#n375
https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git/tree/sound/soc/intel/avs/topology.c#n1354
https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git/tree/sound/soc/intel/avs/topology.c#n1386
Of course this still requires driver to decide which machine board to 
use and topology to load based on ACPI information, as we use 
snd_soc_acpi_mach struct as data source.
Do note that in case of machine board and topology describing board with 
multiple i2s endpoints on one card we require hard coding the values as 
we can't make a guess how endpoints are connected.

>>> The logic can be pushed further, as done in the AVS patch series, to
>>> split the card by codec type. This would avoid having to deal with the
>>> permutations that we have to handle in machine drivers. See e.g. how
>>> complicated the initially generic sof-rt5682 machine driver has become,
>>> it now supports rt5682s, rt1011, rt1015, rt1015p, max98373 and
>>> max98360a. I will accept this comes from ACPI limitations, but if we
>>> could split cards it would also reduce the machine driver complexity.
>>
>> If you want to split the cards up more as things stand there's nothing
>> really standing in your way there.  As you say though I do think this is
>> just that your firmware doesn't describe most of the hardware and so you
>> end up with a large element of bikeshedding the deckchairs on the Titanic
>> which limits how good things can get.  I do wonder what happens if we
>> split things into cards and then get better at letting userspace
>> dynamically manage what the DSP is doing rather than relying so much on
>> fixed topologies...
> 
> Parts of the problem is that the topology as currently defined is across
> two 'domains' and doesn't do a great job in either case:
> 
> a) the DSP processing parts which should be programmable/reconfigurable
> at will depending on the needs of userspace. Other OSes do not rely on
> fixed topologies indeed and will have higher-level logic to deal with
> pipeline creation. One example here is that the fixed topology forces us
> to make worst case assumptions of concurrency between usages. There
> could be more dynamic decisions with more intelligence on routing and
> resource management in userspace.
> 

I would say that currently this can be solved by providing custom per 
device topologies, not sure if anything better can be done here. Overall 
I suspect that it would require exposing some kind of new API allowing 
end user to decide what kind of modules they want.

> b) the hardware/board level parts. That is a weak part of the topology
> today, it should come from a hardware description instead of being
> hard-coded in each topology. We must have dozens of identical topology
> files that differ only because of the SSP index or SoundWire link ID
> used on specific board. There should be a way to 'remap' BEs for
> specific boards.
> 
> It doesn't mean we should toss the topology and redo everything, the
> latter part can be addressed by providing the 'real' hardware
> information to the topology and dynamically modify defaults.
> 

I already showed how we tried to solve this for i2s use cases in links 
above.

>>> In terms of functionality, I don't think there will be any performance
>>> or power improvement coming from a multi-card solution, it's mostly a
>>> maintenance simplification: less duplicated code, more reuse.
>>
>>> One key point is "who defines the split". That's really one of the main
>>> problems and different people could have different opinions - Cezary and
>>> I have a shared goal of enabling multiple cards but different takes on
>>> what the 'optimal' split might be.
>>
>>> My take is that the integrator for a given hardware is responsible for
>>> making the decision - not the provider of a DSP driver. In case you have
>>> coupling between interfaces, playback or capture, it can become really
>>> difficult to define a split that will work for all cases, or conversely
>>> if you don't have 'self-contained' cards that can be tested
>>> independently then splitting the functionality was probably a really bad
>>> idea. If one needs to add dependencies and quirks for a local device,
>>
>> Looks like something got dropped here.  It does sound a bit concerning
>> that the split into machine drivers could be done using quirks.
> 
> that's not what I meant. I was more concerned about quirks that would be
> required by the hardware or board, but cannot be added because of the
> split in independent cards.
> 
>>> In other words, I think we need to agree on the means to create and
>>> expose multiple cards, and agree not to debate on what the functionality
>>> of individual cards might be.
>>
>>> Hope this helps clarify the ask?
>>
>> It's still not clear to me if the problem you're facing couldn't be
>> addressed as well with better interfaces for adding dai_links to the
>> card, that (mainly around BEs) seems to be the main thing you're having
>> trouble with as far as I can see?
> 
> You are not wrong indeed. Splitting a monolithic card is a mechanism to
> work-around the hassle of coupling BE and topology definitions, which in
> practice results in duplication of machine drivers and topologies.
> 
> To be clearer, we currently describe BEs in the machine driver and
> topology, and all the definitions have to match exactly. That's really
> wrong, and goes boink every time an index or stream name is wrong on
> either side, or if the topology makes a reference to a non-existent BE
> in the machine driver. We should have a single definition that is used
> by the topology and machine driver, and hopefully some day have that
> definition come from ACPI (hope springs eternal).
> 
> If we had a better mechanism at the ASoC level to expose what the
> hardware actually is, and ways to remap the BE and topology definitions
> that would indeed remove most of the motivations for exposing multiple
> cards.
> 

Well, in AVS we solved this partially by just using snd_soc_acpi_mach in 
topology parser - using it as configuration, with topology being a 
template (once again see links above ;). Of course this still assumes 
that machine board matches the topology, but it is a lot easier to 
achieve when there is one machine board handling a codec type, instead 
of multiple of them with slight differences. If you look at patchset 
where we add machine boards you will probably notice that, we don't 
hardcode i2s port in any of i2s boards - assumption being that it is 
configured on probe by using passed port id.
https://lore.kernel.org/alsa-devel/20220427081902.3525183-1-cezary.rojewski@intel.com/T/#mad2c35c57d016b7223650dae55b379b81d4607b7

I won't claim that we solved everything you mention above in AVS driver, 
but most of it looks like things we already have some solutions for.

> Good feedback indeed, much appreciated!
> 
> 

