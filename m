Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 36D7551DB80
	for <lists+alsa-devel@lfdr.de>; Fri,  6 May 2022 17:04:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C85351867;
	Fri,  6 May 2022 17:03:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C85351867
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1651849448;
	bh=6TnTTuiRAb+S2cr8w34zjNv3M0cTTz23RMZWWoKyB2w=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=GChsERyxNjnWiNYpCw54Y7AlOFrUjijFGWBKwUwWuY3Y1wQp7LAohUwLc28iAeCsb
	 2kYplhvcW9AiaIA53bioVTbbZlfXkx6UsJgPmJfex/rn9CtlVxdVORABP10eUFyBkU
	 tJMMVMXCoK/Y+ha2atqHDoIvME/BelRxpnDRMTPM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CC2AAF80510;
	Fri,  6 May 2022 17:02:47 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E1C62F800D3; Fri,  6 May 2022 17:02:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 37FD4F800D3
 for <alsa-devel@alsa-project.org>; Fri,  6 May 2022 17:02:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 37FD4F800D3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="mU6edXlG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1651849361; x=1683385361;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=6TnTTuiRAb+S2cr8w34zjNv3M0cTTz23RMZWWoKyB2w=;
 b=mU6edXlGFiem2xpuS27I+kgPyWkxdU2lzZFUL4uFqV4PQEyD1cq7Hnpm
 RMIvc21vrzOZHlks2HafKjtaUrgixZIhKQ50dE2W3x6EyDk2QeL66csZP
 NfgBbUMgslHIAX5SSk8pgcfBVTWf1cncW6kywdUesbk3tQC4mT8fiUgZy
 D68l9gglsUX5kFBjcYeV1afyK3pUop+yOb0XbuaTeC1xzY6tEgB51X3zI
 Ondu952LmFK60UnosO4DJPazrxAKO2/HQ0ZtmLlyXA0hcp4E6FlHPRbZr
 yYf099T6LeAZvu+djQDnpBl1gasm63EwwNmR8sOkgXIGeYU+HmvHEM/u6 w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10339"; a="255972916"
X-IronPort-AV: E=Sophos;i="5.91,203,1647327600"; d="scan'208";a="255972916"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2022 08:02:29 -0700
X-IronPort-AV: E=Sophos;i="5.91,203,1647327600"; d="scan'208";a="654729261"
Received: from ysomasun-mobl1.amr.corp.intel.com (HELO [10.209.0.67])
 ([10.209.0.67])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2022 08:02:25 -0700
Message-ID: <2849fc32-83b8-4727-0aea-aa20b4d3557a@linux.intel.com>
Date: Fri, 6 May 2022 09:56:55 -0500
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
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <4a808f4c-83fc-747d-1536-d276138e57b8@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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



On 5/6/22 08:39, Cezary Rojewski wrote:
> On 2022-05-06 3:12 PM, Mark Brown wrote:
>> On Wed, Apr 27, 2022 at 10:47:12AM -0500, Pierre-Louis Bossart wrote:
>>> On 4/27/22 03:18, Cezary Rojewski wrote:
>>
>>>> Add generic ASoC equivalent of ALSA HD-Audio codec. This codec is
>>>> designed to follow HDA_DEV_LEGACY convention. Driver wrapps existing
>>>> hda_codec.c handlers to prevent code duplication within the newly added
>>
>>> I am surprised the explanations don't even mention the existence of
>>> hdac_hda.c
>>
>>> I thought the series was about adding machine drivers, but this
>>> also adds code on the sound/soc/codecs/ side which I didn't see
>>> coming.
>>
>>> I am not qualified to review this part of the code, I just
>>> wonder about duplication of functionality.
>>
>>> At the very least an explanation on why you decided to NOT use
>>> hdac_hda.c would be useful to reviewers and maintainers.
>>
>> Right, why the duplication here?  Can't we fix or extend the
>> existing code to do whatever it's not currently doing which
>> compels reimplementation?
> 
> Sorry for the late response, did not realize there is an unanswered
> comment here.
> 
> So, the rough list goes as:
> - hdac_hda.c hardcodes codec capabilities rather than aligning with what
> sound/pci/hda/ code does
> - merges HDMI (i.e. Intel i915 audio component) and HDA DAIs together
> whereas these are two separate devices
> - because of above, implements custom search/matching mechanism for PCM/DAI
> - cont. because of above, its header hosts private data struct,
> unnecessary complication
> - follows HDA_DEV_ASOC convention rather than HDA_DEV_LEGACY causing
> misalignments between sound/pci/hda and sound/soc/ behaviour
> - has basic PM runtime support and does not survive scenarios where
> resume/suspend + denylist + rmmod/modprobe are mixed together or invoked
> in unordered fashion between this module and several others in the audio
> stack
> 
> My suggestion is different: have all HD-Audio ASoC users switch to this
> implementation when possible and remove the existing code along with
> skylake-driver.

I am not against change and will agree that HDaudio support is far from
perfect, but it's been released for multiple generations from dozens of
OEMs and mostly works. All the issues reported to us are related to
codec configurations that also don't work with the legacy HDaudio
driver, DMIC configurations, CSME authentication or system hangs that
have not been root-caused [1]. HDaudio/ASoC interfaces are not on our
radar as problematic.

Disrupting basic HDaudio support to do things better has to be handled
with extreme caution and a ton of testing involving distro maintainers
and community members, so we are talking about an opt-in transition, not
an immediate switch. We've done a similar transition in the past to stop
using a dedicated hdac_hdmi.c codec, see all references to the
'use_common_hdmi' parameter in the SOF code. That transition seems to go
exactly against your second point above on HDMI and HDA being different
devices, so this could be an interesting debate.

Changes to the HDAudio/ASoC support would need to be handled with a
separate patchset anyways, and the SOF side changes done after we are
finished with the IPC4 and MeteorLake upstreaming. No one in our team
has any bandwidth to help with reviews or tests on this topic at the moment.

I will also re-state that the removal of the skylake driver can only
happen after a long period of deprecation, when firmware and topologies
have been picked by distributions and all users are known to have
switched, so it's very likely that any alignment between "all HD-Audio
ASoC users" mentioned above does include the Skylake driver, doesn't it?

So to circle back: is there anything preventing the use of the existing
hdac_hda.c codec in this "ASoC: Intel: avs: Machine boards and HDA codec
support" series and can the HDaudio codec change be done "later" in a
more organized way?

Thanks!
-Pierre

[1]
https://github.com/thesofproject/linux/issues?q=is%3Aissue+is%3Aopen+label%3ACommunity+-label%3A%22codec+ES8336%22
