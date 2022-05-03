Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F11B519064
	for <lists+alsa-devel@lfdr.de>; Tue,  3 May 2022 23:43:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 761C6828;
	Tue,  3 May 2022 23:43:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 761C6828
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1651614237;
	bh=BFnMhiIujR06Yo+dgQjSD8SZE8xlB3tqzb38Wwf6hN4=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Bd0sNyQvXr9YHCaxBh00qUF2W2JDKJ1j67qpK/hqIg+eamT0gWzvCZwnzgEw9QAqU
	 uWo8DvszkZEKVYyMc2UVoN++rh0B0lonofznuVAIWC/YQBD6869IkSxsM3NmGDaBQq
	 Wp8RZgOnT7mBx65uZi9WLY+UnIhy/rE2+J9q8EoE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EC437F800D2;
	Tue,  3 May 2022 23:42:58 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AC8D4F800D2; Tue,  3 May 2022 23:42:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8AAC1F800D2
 for <alsa-devel@alsa-project.org>; Tue,  3 May 2022 23:42:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8AAC1F800D2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="dv1yBywZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1651614172; x=1683150172;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=BFnMhiIujR06Yo+dgQjSD8SZE8xlB3tqzb38Wwf6hN4=;
 b=dv1yBywZpASEEaolGgJg18U/PnnHMSdOphH+vhs/s4fnFpvG+Y3nbQir
 kFERsCr354kAoGufOGftsirK+8gH5hbz8qDSSAaXuFro6G1qp3Yhke3S6
 EaLbsJ7dLUq0AM48VgDqM1GNKiSRe86XMwY5rCUkbL9vqgR8VEER4Y/wp
 RPV4QGt8ZIMvFGcArN3+SEH8V7hCIftp16669X5Cq9YxhLYHIZJoyl+y9
 d8s7dpYWpKzweobKypc4fP2gz591Xt07TXf1hvfC6O0NCzB6n54gcf6kG
 hsIODUegUNHbCr+W5Y6NFC0vx1mDji78hhUmd3WE8F4+kdNKCnhSNMDL5 Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10336"; a="267190208"
X-IronPort-AV: E=Sophos;i="5.91,196,1647327600"; d="scan'208";a="267190208"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 May 2022 14:42:26 -0700
X-IronPort-AV: E=Sophos;i="5.91,196,1647327600"; d="scan'208";a="599245089"
Received: from karimmdr-mobl.amr.corp.intel.com (HELO [10.251.7.211])
 ([10.251.7.211])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 May 2022 14:42:25 -0700
Message-ID: <ff511a84-adac-1018-a934-2b8202c5a9fe@linux.intel.com>
Date: Tue, 3 May 2022 16:42:24 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.5.0
Subject: Re: ASoC component/card relationship
Content-Language: en-US
To: Mark Brown <broonie@kernel.org>
References: <d9c3fed4-de6a-2cd8-acb6-7f3d2ad46b70@linux.intel.com>
 <YnFwGJBjVGrsMJWR@sirena.org.uk>
 <6dea4606-cb5e-1224-bf98-d1da1484ebfd@linux.intel.com>
 <YnGRNfaempsFG9/M@sirena.org.uk>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <YnGRNfaempsFG9/M@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Curtis Malainey <cujomalainey@google.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 =?UTF-8?Q?Amadeusz_S=c5=82awi=c5=84ski?= <amadeuszx.slawinski@linux.intel.com>,
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



On 5/3/22 15:31, Mark Brown wrote:
> On Tue, May 03, 2022 at 01:59:54PM -0500, Pierre-Louis Bossart wrote:
> 
>>> This means we get back to the assumption we started off with - what are
>>> we gaining by partitioning things into cards when that's not really
>>> what's going on with the hardware?
> 
>> The main benefit is reuse of 'generic' cards.
> 
>> Take for example HDMI support, it's typically exactly the same from one
>> board to the other - it's completely standard. And yet, for every card,
>> we have to add a path in the topology and the machine driver to
>> represent exactly the same information multiple times. see below how
>> many times we add the same 'late_probe' callback for HDMI support in
>> machine drivers.
> 
>> BT audio is a similar case, the interface configuration and settings are
>> defined by profiles, so there's almost no variation from one board to
>> the other except for which I2S number is used.
> 
>> A peripheral directly attached to an SOC or chipset, such as digital
>> microphones, is a similar case.
> 
>> The point is really to try to split what will be variable from board to
>> board due to different choices of headset codecs, amplifiers,
>> microphones, from what is generic and reusable.
> 
> There's a reusability thing here which does seem somewhat valid, but it
> does feel to me like separate cards is a bit of a case of having a
> hammer so everything looks like a nail kind of solution to the issue.
> The issue you've got is not that these are disconnected bits of hardware
> which operate independently, it's that you don't have a good way of
> dropping the board variations into a template machine driver or
> otherwise customising one.
> 
> Off the top of my head you could probably get some way with this if
> there were a way to tell the core to skip over some links during
> instantiation, that might help keep a common core of these bits you wan
> to split out into cards more static.  Perhaps also being able to add
> multiple sets of DAIs to a component rather than having to compose the
> full list and then add everything in one shot?

Indeed, if we could tell that a BE does not exist on a specific board
without having to create a topology without said BE that would help
immensely.

See more comments below, if we could provide to the topology loading
sequence that a BE is not present, or remap it to use a different
hardware interface (e.g. use SSP2 instead of default SSP0, or number of
microphones in hardware) that would address most of the concerns we face
today.

>> The logic can be pushed further, as done in the AVS patch series, to
>> split the card by codec type. This would avoid having to deal with the
>> permutations that we have to handle in machine drivers. See e.g. how
>> complicated the initially generic sof-rt5682 machine driver has become,
>> it now supports rt5682s, rt1011, rt1015, rt1015p, max98373 and
>> max98360a. I will accept this comes from ACPI limitations, but if we
>> could split cards it would also reduce the machine driver complexity.
> 
> If you want to split the cards up more as things stand there's nothing
> really standing in your way there.  As you say though I do think this is
> just that your firmware doesn't describe most of the hardware and so you
> end up with a large element of bikeshedding the deckchairs on the Titanic
> which limits how good things can get.  I do wonder what happens if we
> split things into cards and then get better at letting userspace
> dynamically manage what the DSP is doing rather than relying so much on
> fixed topologies...

Parts of the problem is that the topology as currently defined is across
two 'domains' and doesn't do a great job in either case:

a) the DSP processing parts which should be programmable/reconfigurable
at will depending on the needs of userspace. Other OSes do not rely on
fixed topologies indeed and will have higher-level logic to deal with
pipeline creation. One example here is that the fixed topology forces us
to make worst case assumptions of concurrency between usages. There
could be more dynamic decisions with more intelligence on routing and
resource management in userspace.

b) the hardware/board level parts. That is a weak part of the topology
today, it should come from a hardware description instead of being
hard-coded in each topology. We must have dozens of identical topology
files that differ only because of the SSP index or SoundWire link ID
used on specific board. There should be a way to 'remap' BEs for
specific boards.

It doesn't mean we should toss the topology and redo everything, the
latter part can be addressed by providing the 'real' hardware
information to the topology and dynamically modify defaults.

>> In terms of functionality, I don't think there will be any performance
>> or power improvement coming from a multi-card solution, it's mostly a
>> maintenance simplification: less duplicated code, more reuse.
> 
>> One key point is "who defines the split". That's really one of the main
>> problems and different people could have different opinions - Cezary and
>> I have a shared goal of enabling multiple cards but different takes on
>> what the 'optimal' split might be.
> 
>> My take is that the integrator for a given hardware is responsible for
>> making the decision - not the provider of a DSP driver. In case you have
>> coupling between interfaces, playback or capture, it can become really
>> difficult to define a split that will work for all cases, or conversely
>> if you don't have 'self-contained' cards that can be tested
>> independently then splitting the functionality was probably a really bad
>> idea. If one needs to add dependencies and quirks for a local device,
> 
> Looks like something got dropped here.  It does sound a bit concerning
> that the split into machine drivers could be done using quirks.

that's not what I meant. I was more concerned about quirks that would be
required by the hardware or board, but cannot be added because of the
split in independent cards.

>> In other words, I think we need to agree on the means to create and
>> expose multiple cards, and agree not to debate on what the functionality
>> of individual cards might be.
> 
>> Hope this helps clarify the ask?
> 
> It's still not clear to me if the problem you're facing couldn't be
> addressed as well with better interfaces for adding dai_links to the
> card, that (mainly around BEs) seems to be the main thing you're having
> trouble with as far as I can see?

You are not wrong indeed. Splitting a monolithic card is a mechanism to
work-around the hassle of coupling BE and topology definitions, which in
practice results in duplication of machine drivers and topologies.

To be clearer, we currently describe BEs in the machine driver and
topology, and all the definitions have to match exactly. That's really
wrong, and goes boink every time an index or stream name is wrong on
either side, or if the topology makes a reference to a non-existent BE
in the machine driver. We should have a single definition that is used
by the topology and machine driver, and hopefully some day have that
definition come from ACPI (hope springs eternal).

If we had a better mechanism at the ASoC level to expose what the
hardware actually is, and ways to remap the BE and topology definitions
that would indeed remove most of the motivations for exposing multiple
cards.

Good feedback indeed, much appreciated!


