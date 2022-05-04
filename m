Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 18D1851A404
	for <lists+alsa-devel@lfdr.de>; Wed,  4 May 2022 17:27:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A1EB49F6;
	Wed,  4 May 2022 17:26:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A1EB49F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1651678041;
	bh=b6OSNvhzuIxX3mj7KS2BV/Aymvlqz6IxbCH1wHspm4k=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=DGqGMQsW+RQ8h8bx0BxWFWvGoDg/8CDPOSBWg6uqV1Q3/u8HYpvkpryqXQ+5Q/7JA
	 goifHOX0X0O4ZR1qX7snOWqsEiCOUHFOIJY0XAVnUSRi+p3RLYS/Om3fAzSrNAewNH
	 Vq+V/Y/fPO3Ef2nDeWzPgcn2VUyBFOANiYD15VDk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 194EAF80166;
	Wed,  4 May 2022 17:26:23 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E6932F80163; Wed,  4 May 2022 17:26:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=1.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,PRX_BODY_30,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 29610F80129
 for <alsa-devel@alsa-project.org>; Wed,  4 May 2022 17:26:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 29610F80129
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="kox/kGJR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1651677978; x=1683213978;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=b6OSNvhzuIxX3mj7KS2BV/Aymvlqz6IxbCH1wHspm4k=;
 b=kox/kGJRnVRcU5S6GEnlHLXIhgVP8Vy+3niUZfzeYYA+fJ9+DYMDbgZ8
 oM6yhBzbE9Z/yF6qiFbesBSH33xFQS4MMmqJqWcxWgyXX90HSE9CXv5Hp
 gtzmvOS+hTqUqCJKxIN+dE8EdCfiSH1klbed+DInL4imeRyTv4YVNg++N
 rGHdFu/dXJg6F1La0i9ubtqFWtT8gjpqyGq1y4X2tL9/zbser0SLVbdhc
 Coz/GSgIL/rw1QVRXZVuXPsOOjLqsKqo13pUNjKcp07YeyQgzrh9KgXPt
 p4Xy6ivII5DMF1yXNqrhpRT9VryRPTHyPc7kRu4ONQ3atogiR6KNDSv02 g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10337"; a="292987529"
X-IronPort-AV: E=Sophos;i="5.91,198,1647327600"; d="scan'208";a="292987529"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 May 2022 08:26:11 -0700
X-IronPort-AV: E=Sophos;i="5.91,198,1647327600"; d="scan'208";a="517071785"
Received: from iremsen-mobl.amr.corp.intel.com (HELO [10.212.200.96])
 ([10.212.200.96])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 May 2022 08:26:10 -0700
Message-ID: <2c2c1af4-9c40-841d-fc9e-486c3db482bd@linux.intel.com>
Date: Wed, 4 May 2022 10:26:09 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.5.0
Subject: Re: ASoC component/card relationship
Content-Language: en-US
To: =?UTF-8?Q?Amadeusz_S=c5=82awi=c5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>, Mark Brown <broonie@kernel.org>
References: <d9c3fed4-de6a-2cd8-acb6-7f3d2ad46b70@linux.intel.com>
 <YnFwGJBjVGrsMJWR@sirena.org.uk>
 <6dea4606-cb5e-1224-bf98-d1da1484ebfd@linux.intel.com>
 <YnGRNfaempsFG9/M@sirena.org.uk>
 <ff511a84-adac-1018-a934-2b8202c5a9fe@linux.intel.com>
 <6009dd4b-e5f3-78a6-eade-76c3f30a6d42@linux.intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <6009dd4b-e5f3-78a6-eade-76c3f30a6d42@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Curtis Malainey <cujomalainey@google.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 =?UTF-8?Q?P=c3=a9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>
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



On 5/4/22 04:21, Amadeusz Sławiński wrote:
> On 5/3/2022 11:42 PM, Pierre-Louis Bossart wrote:
>>
>>
>> On 5/3/22 15:31, Mark Brown wrote:
>>> On Tue, May 03, 2022 at 01:59:54PM -0500, Pierre-Louis Bossart wrote:
>>>
>>>>> This means we get back to the assumption we started off with - what
>>>>> are
>>>>> we gaining by partitioning things into cards when that's not really
>>>>> what's going on with the hardware?
>>>
>>>> The main benefit is reuse of 'generic' cards.
>>>
>>>> Take for example HDMI support, it's typically exactly the same from one
>>>> board to the other - it's completely standard. And yet, for every card,
>>>> we have to add a path in the topology and the machine driver to
>>>> represent exactly the same information multiple times. see below how
>>>> many times we add the same 'late_probe' callback for HDMI support in
>>>> machine drivers.
>>>
>>>> BT audio is a similar case, the interface configuration and settings
>>>> are
>>>> defined by profiles, so there's almost no variation from one board to
>>>> the other except for which I2S number is used.
>>>
>>>> A peripheral directly attached to an SOC or chipset, such as digital
>>>> microphones, is a similar case.
>>>
>>>> The point is really to try to split what will be variable from board to
>>>> board due to different choices of headset codecs, amplifiers,
>>>> microphones, from what is generic and reusable.
>>>
>>> There's a reusability thing here which does seem somewhat valid, but it
>>> does feel to me like separate cards is a bit of a case of having a
>>> hammer so everything looks like a nail kind of solution to the issue.
>>> The issue you've got is not that these are disconnected bits of hardware
>>> which operate independently, it's that you don't have a good way of
>>> dropping the board variations into a template machine driver or
>>> otherwise customising one.
>>>
>>> Off the top of my head you could probably get some way with this if
>>> there were a way to tell the core to skip over some links during
>>> instantiation, that might help keep a common core of these bits you wan
>>> to split out into cards more static.  Perhaps also being able to add
>>> multiple sets of DAIs to a component rather than having to compose the
>>> full list and then add everything in one shot?
>>
>> Indeed, if we could tell that a BE does not exist on a specific board
>> without having to create a topology without said BE that would help
>> immensely.
>>
> 
> Assuming you want one monolithic topology I guess we could unregister
> FEs exposed by topology when there is no full route to BE? This will be
> bit weird as first you need to load full topology to decide if routing
> is possible and then either keep or remove FEs and associated widgets, etc.

That's right, there will be both a need to prune parts of the topology
that are not supported in hardware, or conversely mark them as
conditional and only load them if there is a clear hardware support for
the resources exposed.

But it's not just a filter or conditional addition, we have to be able
to remap an index and modify clock values. It's really important to
avoid maintaining different topologies for the same platform, just
because one hardware designer used SSP0 and another used SSP1.

> The reason why we split boards in AVS driver to be per codec is that we
> observed that it is mostly copy and paste code between multiple boards
> in various permutations, where some auxiliary codecs are present and
> some are not. This allows us to provide per codec topology.
> 
>> See more comments below, if we could provide to the topology loading
>> sequence that a BE is not present, or remap it to use a different
>> hardware interface (e.g. use SSP2 instead of default SSP0, or number of
>> microphones in hardware) that would address most of the concerns we face
>> today.
>>
> 
> I'll just note that it isn't impossible to do with current topologies
> and is in fact what we do allow in AVS driver for topologies describing
> connection to single i2s codec:
> https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git/tree/sound/soc/intel/avs/topology.c#n375
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git/tree/sound/soc/intel/avs/topology.c#n1354
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git/tree/sound/soc/intel/avs/topology.c#n1386
> 
> Of course this still requires driver to decide which machine board to
> use and topology to load based on ACPI information, as we use
> snd_soc_acpi_mach struct as data source.
> Do note that in case of machine board and topology describing board with
> multiple i2s endpoints on one card we require hard coding the values as
> we can't make a guess how endpoints are connected.

That's the point, the topology doesn't know so we will duplicate the
same stuff to cover all possible hardware variations.

The machine driver knows that information, when you create the BE
dailink you have to say, e.g. SSP #2 is connect to AIF #1.

With the current solution we have to create one topology for each
possible SSP connection, and modify the ACPI tables to specify a
different topology name. What we need instead is a new callback to tell
the topology that the 'cpu dai' is #2.

You have exactly the same problem with your ssp test cases, since we
have up to 6 SSPs you will need to maintain and load 6 different
topology files that differ only by the SSP index.

My take is that the topology should not make any hard-coded assumptions
on the hardware connection to the codecs but be given the information
before the topology is loaded.


>> b) the hardware/board level parts. That is a weak part of the topology
>> today, it should come from a hardware description instead of being
>> hard-coded in each topology. We must have dozens of identical topology
>> files that differ only because of the SSP index or SoundWire link ID
>> used on specific board. There should be a way to 'remap' BEs for
>> specific boards.
>>
>> It doesn't mean we should toss the topology and redo everything, the
>> latter part can be addressed by providing the 'real' hardware
>> information to the topology and dynamically modify defaults.
>>
> 
> I already showed how we tried to solve this for i2s use cases in links
> above.

You still have N identical topologies, completely identical with the
exception of 1 SSP index to maintain.

Just to make this point stronger, with the recent support of the ES8336
codecs, we had to generate the following topologies to account for all
permutations:

sof-apl-es8336-ssp0.tplg
sof-apl-es8336-ssp2.tplg
sof-cml-es8336-dmic2ch-ssp0.tplg
sof-cml-es8336-dmic2ch-ssp2.tplg
sof-cml-es8336-dmic4ch-ssp0.tplg
sof-cml-es8336-dmic4ch-ssp2.tplg
sof-cml-es8336-ssp0.tplg
sof-cml-es8336-ssp2.tplg
sof-glk-es8336-ssp0.tplg
sof-glk-es8336-ssp2.tplg
sof-jsl-es8336-dmic2ch-ssp0.tplg
sof-jsl-es8336-dmic2ch-ssp2.tplg
sof-jsl-es8336-dmic4ch-ssp0.tplg
sof-jsl-es8336-dmic4ch-ssp2.tplg
sof-jsl-es8336-ssp0.tplg
sof-jsl-es8336-ssp2.tplg
sof-tgl-es8336-dmic2ch-ssp0.tplg
sof-tgl-es8336-dmic2ch-ssp2.tplg
sof-tgl-es8336-dmic4ch-ssp0.tplg
sof-tgl-es8336-dmic4ch-ssp2.tplg
sof-tgl-es8336-ssp0.tplg
sof-tgl-es8336-ssp2.tplg

All these topologies come from the same file, and generated using
macros. That makes no sense to me, this should be the same topology that
is remapped at run-time.


>> If we had a better mechanism at the ASoC level to expose what the
>> hardware actually is, and ways to remap the BE and topology definitions
>> that would indeed remove most of the motivations for exposing multiple
>> cards.
>>
> 
> Well, in AVS we solved this partially by just using snd_soc_acpi_mach in
> topology parser - using it as configuration, with topology being a
> template (once again see links above ;). Of course this still assumes
> that machine board matches the topology, but it is a lot easier to
> achieve when there is one machine board handling a codec type, instead
> of multiple of them with slight differences. If you look at patchset
> where we add machine boards you will probably notice that, we don't
> hardcode i2s port in any of i2s boards - assumption being that it is
> configured on probe by using passed port id.
> https://lore.kernel.org/alsa-devel/20220427081902.3525183-1-cezary.rojewski@intel.com/T/#mad2c35c57d016b7223650dae55b379b81d4607b7
> 
> 
> I won't claim that we solved everything you mention above in AVS driver,
> but most of it looks like things we already have some solutions for.

It's easier because you have limited numbers of Chromebooks to handle.
See above what happened with the same ES8336 codec used on multiple
platforms, with the same ACPI HID, the permutations quickly become
completely unmanageable.

I forget that it's not just the SSP index that should be passed at run
time, if we wanted to have more generic topologies the assumptions of
clocking should be provided at run time. That's the main reason why we
have different topologies for GLK, CML and TGL, even though it's the
same pipeline and capabilities provided in the rest of the topology.
