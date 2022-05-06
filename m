Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E3FC351DDA1
	for <lists+alsa-devel@lfdr.de>; Fri,  6 May 2022 18:30:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4D75A184C;
	Fri,  6 May 2022 18:29:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4D75A184C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1651854615;
	bh=vDNROlLZAA4ZSpk03g8p1Y947qtXsNhpnuVKUqbLCR0=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Wo/lkyOBO9TdLqI1t+Rx/Usv4zJykuI+/H8eu1l69HerXROPyO1kWP9IxXmrZ65Bv
	 0VSjaES/FUpnSk8ydWjCHSHfskG8h2ncMJG+5KbaPef5AwznhMQ7NsoAbesG0kJvt8
	 MjpYr16K40npqdi/u7p+OlY148IAVqP1OKPLyQRI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A6BD0F80171;
	Fri,  6 May 2022 18:29:16 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 53486F8014B; Fri,  6 May 2022 18:29:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=1.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,PRX_BODY_30,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 06CA0F800D3
 for <alsa-devel@alsa-project.org>; Fri,  6 May 2022 18:29:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 06CA0F800D3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="MKqIwmF4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1651854550; x=1683390550;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=vDNROlLZAA4ZSpk03g8p1Y947qtXsNhpnuVKUqbLCR0=;
 b=MKqIwmF4lteR89lRAxoPS0+plKRaLfvXVR1josdVlg0rulUrP7h+Iep6
 l0A0B7liiSX4nmHa/d8Ook1FkSw75OsfRuivg4SRzN+ZEBggCN9uEgESr
 BB76YDq4RiMfSbfuipklUPDQTDD6MMoKrg3xQGJEsQrFTu0bj0zs+RgG9
 v3nFUmH1BFHhOVYbC4hlyHJtWeQlUnrQk/w2KDwtmMjapQOXJw1Bx1BlA
 gFSJFO30BJfDT2BXP8w6K015XKzUsaNRglYJV5rUy4WUFVK0fW3ZZRkVI
 QBWm28OV81GI1htr+DIROux4zi7w5ukTsC4RvkrGCF9gGrGMjrBJWP4VG g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10339"; a="268120053"
X-IronPort-AV: E=Sophos;i="5.91,203,1647327600"; d="scan'208";a="268120053"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2022 09:17:08 -0700
X-IronPort-AV: E=Sophos;i="5.91,203,1647327600"; d="scan'208";a="654754530"
Received: from ysomasun-mobl1.amr.corp.intel.com (HELO [10.209.0.67])
 ([10.209.0.67])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2022 09:17:06 -0700
Message-ID: <53557182-a2c5-a280-8887-bdb8a71dfd94@linux.intel.com>
Date: Fri, 6 May 2022 11:17:05 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.5.0
Subject: Re: [PATCH 02/14] ASoC: codecs: Add HD-Audio codec driver
Content-Language: en-US
To: Cezary Rojewski <cezary.rojewski@intel.com>,
 Mark Brown <broonie@kernel.org>
References: <20220427081902.3525183-1-cezary.rojewski@intel.com>
 <20220427081902.3525183-3-cezary.rojewski@intel.com>
 <7bc3a92e-8bd1-c1d0-5610-af40dbb8fb7a@linux.intel.com>
 <YnUev8Rs42xLLE6Z@sirena.org.uk>
 <4a808f4c-83fc-747d-1536-d276138e57b8@intel.com>
 <2849fc32-83b8-4727-0aea-aa20b4d3557a@linux.intel.com>
 <28e7b768-dfa4-eca4-9d7a-5e8c6f54bc27@intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <28e7b768-dfa4-eca4-9d7a-5e8c6f54bc27@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, upstream@semihalf.com,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, harshapriya.n@intel.com,
 rad@semihalf.com, tiwai@suse.com, hdegoede@redhat.com,
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



On 5/6/22 10:28, Cezary Rojewski wrote:
> On 2022-05-06 4:56 PM, Pierre-Louis Bossart wrote:
>> On 5/6/22 08:39, Cezary Rojewski wrote:
> 
> ...
> 
>>> Sorry for the late response, did not realize there is an unanswered
>>> comment here.
>>>
>>> So, the rough list goes as:
>>> - hdac_hda.c hardcodes codec capabilities rather than aligning with what
>>> sound/pci/hda/ code does
>>> - merges HDMI (i.e. Intel i915 audio component) and HDA DAIs together
>>> whereas these are two separate devices
>>> - because of above, implements custom search/matching mechanism for
>>> PCM/DAI
>>> - cont. because of above, its header hosts private data struct,
>>> unnecessary complication
>>> - follows HDA_DEV_ASOC convention rather than HDA_DEV_LEGACY causing
>>> misalignments between sound/pci/hda and sound/soc/ behaviour
>>> - has basic PM runtime support and does not survive scenarios where
>>> resume/suspend + denylist + rmmod/modprobe are mixed together or invoked
>>> in unordered fashion between this module and several others in the audio
>>> stack
>>>
>>> My suggestion is different: have all HD-Audio ASoC users switch to this
>>> implementation when possible and remove the existing code along with
>>> skylake-driver.
>>
>> I am not against change and will agree that HDaudio support is far from
>> perfect, but it's been released for multiple generations from dozens of
>> OEMs and mostly works. All the issues reported to us are related to
>> codec configurations that also don't work with the legacy HDaudio
>> driver, DMIC configurations, CSME authentication or system hangs that
>> have not been root-caused [1]. HDaudio/ASoC interfaces are not on our
>> radar as problematic.
> 
> 
> That's why aligning with sound/pci/hda behavior is better for both, ALSA
> and ASoC users -> one place to fix the problems, both clients happy.
> 
>> Disrupting basic HDaudio support to do things better has to be handled
>> with extreme caution and a ton of testing involving distro maintainers
>> and community members, so we are talking about an opt-in transition, not
>> an immediate switch. We've done a similar transition in the past to stop
>> using a dedicated hdac_hdmi.c codec, see all references to the
>> 'use_common_hdmi' parameter in the SOF code. That transition seems to go
>> exactly against your second point above on HDMI and HDA being different
>> devices, so this could be an interesting debate.
>>
>> Changes to the HDAudio/ASoC support would need to be handled with a
>> separate patchset anyways, and the SOF side changes done after we are
>> finished with the IPC4 and MeteorLake upstreaming. No one in our team
>> has any bandwidth to help with reviews or tests on this topic at the
>> moment.
> 
> 
> Agree. This won't be forced on anyone and that's why separate
> implementation needed to be provided. There is too much to cover if we
> were to refactor hdac_hda.c
> 
>> I will also re-state that the removal of the skylake driver can only
>> happen after a long period of deprecation, when firmware and topologies
>> have been picked by distributions and all users are known to have
>> switched, so it's very likely that any alignment between "all HD-Audio
>> ASoC users" mentioned above does include the Skylake driver, doesn't it?
> 
> 
> Nah, I don't believe we need to be saving skylake-driver here. By "all
> HD-Audio ASoC users" I meant sof-driver as it isn't going anywhere -
> what cannot be said about the skylake-driver :)
> 
>> So to circle back: is there anything preventing the use of the existing
>> hdac_hda.c codec in this "ASoC: Intel: avs: Machine boards and HDA codec
>> support" series and can the HDaudio codec change be done "later" in a
>> more organized way?
> 
> 
> Yeah, all the pm scenarios will fail when paired with the avs-driver.
> The expectations are different. We'd have to fix probe() and remove()
> (and related) sequences for the hdac_hda.c, and given that its users did
> not notice prompts further problems with the refactor. This is very
> similar to the skylake-driver vs avs-driver case. We could have applied
> ~300 patches we had internally that prepare skylake-driver to be
> re-modeled and then apply patchsets which look more or less like the
> avs-driver series instead of providing a parallel driver.
> 
> But the reality shows that such approach applies too much pressure on
> the reviewers and leaves no fallback option for the end users if
> anything fails along the way.

I will stop commenting here to let others chime in, I don't have the
background to provide useful technical feedback on this complicated
HDaudio/ASoC interface.

I am however concerned about the lack of long-term plans and confusion
coming having 3 different ways of dealing with HDaudio codecs on the
same hardware platform (legacy, ASoC/SOF-Skylake, ASoC-AVS). 2 was
already bad, I don't see how 3 is better?
