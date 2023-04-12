Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C98AC6DFADF
	for <lists+alsa-devel@lfdr.de>; Wed, 12 Apr 2023 18:10:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BE9981085;
	Wed, 12 Apr 2023 18:09:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BE9981085
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1681315822;
	bh=u6EFeKZbn8HI0fUEkD9VQ43Ja+SJCIDHmkLxpj+imoo=;
	h=Date:Subject:To:References:From:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=WdqfPmteAoO9X4KoNkZ+hrIABmHPesZPRvn6AzkB8+fxPy2o+mpSIoKHDU+1uN8zK
	 5Dd3XSoRIe3PSpVG98RloKSHQs235IYY730bL5IZKAz2/70wbjKziTVGLM52r/TumB
	 DARchHAHtQymmy1RirM50jxYSQE+sMtDlM7zy3rw=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1C76EF8025E;
	Wed, 12 Apr 2023 18:09:32 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E74DFF8032B; Wed, 12 Apr 2023 18:09:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 701EDF800E5
	for <alsa-devel@alsa-project.org>; Wed, 12 Apr 2023 18:09:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 701EDF800E5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=KtEP+xUB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681315765; x=1712851765;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=u6EFeKZbn8HI0fUEkD9VQ43Ja+SJCIDHmkLxpj+imoo=;
  b=KtEP+xUBXojHCeOluajQtDPgAZlakgkavpWg2H/v2ur+0Jn1aDBGBPJe
   JA1ZqwsQ60ZkVzAGUseiTye/jdzBst16Gulw/dgEgaTqr0Ge11+I5bciW
   on4ud2JLKsHE/0DTo5AulwvAB+fC4UbNnMqxcwphqyDw1pX/5tkmJ96ky
   gcsjPZPhLq4Ry8R77llmbdvI9yrb1PFNtA+mv7l7Fj+uepsPFF/nu4l7P
   lR/oHHLRIIkbuQ6URMqwEjz3ajuXv8Z+XMHj9R0AV4B8gSEhBvDI16DQI
   Y9acqawPvQow18s5jgRyn1H1C1jvyiWWFwiNI4S338ozx3h/K3Krf8fCj
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10678"; a="332641652"
X-IronPort-AV: E=Sophos;i="5.98,339,1673942400";
   d="scan'208";a="332641652"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2023 09:06:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10678"; a="639279410"
X-IronPort-AV: E=Sophos;i="5.98,339,1673942400";
   d="scan'208";a="639279410"
Received: from mdhabibh-mobl.amr.corp.intel.com (HELO [10.209.99.121])
 ([10.209.99.121])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2023 09:06:43 -0700
Message-ID: <ddd0eb0a-d1f8-4d41-9820-663010e95437@linux.intel.com>
Date: Wed, 12 Apr 2023 11:06:42 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.9.0
Subject: Re: [PATCH 00/20] ASoC/soundwire: add support for ACE2.x
Content-Language: en-US
To: Vinod Koul <vkoul@kernel.org>
References: <20230323054452.1543233-1-yung-chuan.liao@linux.intel.com>
 <ZDaC6D8yBiJ4GrXm@matsya>
 <27493df8-e1c7-1a8b-e77e-dc3bd495567b@linux.intel.com>
 <ZDbMt5BRrAV5UUEw@matsya>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <ZDbMt5BRrAV5UUEw@matsya>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: R7UAFAQ5WUSVPGENEX425BIUJUCZLOAN
X-Message-ID-Hash: R7UAFAQ5WUSVPGENEX425BIUJUCZLOAN
X-MailFrom: pierre-louis.bossart@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Bard Liao <yung-chuan.liao@linux.intel.com>, alsa-devel@alsa-project.org,
 broonie@kernel.org, linux-kernel@vger.kernel.org, bard.liao@intel.com,
 tiwai@suse.de
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/R7UAFAQ5WUSVPGENEX425BIUJUCZLOAN/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 4/12/23 10:22, Vinod Koul wrote:
> On 12-04-23, 09:11, Pierre-Louis Bossart wrote:
>>
>>
>> On 4/12/23 05:07, Vinod Koul wrote:
>>> On 23-03-23, 13:44, Bard Liao wrote:
>>>> This series uses the abstraction added in past kernel cycles to provide
>>>> support for the ACE2.x integration. The existing SHIM and Cadence
>>>
>>> ACE2..?
>>
>> Not sure I get the comment, this refers to the IP version.
> 
> What does ACE mean, it should be expanded so that people know what it
> might refer to..?

I think at one point it stood for "Audio Converged Engine", which
doesn't really clarify anything, does it? It's easier for most people to
just refer to cAVS or ACE as a type of IP followed by a version number,
and use the mapping between the IP version and end-user device in the
PCI descriptors.

>> ACE 2.0 IP used in LunarLake, x refers to future TDB versions.
>>
>> BTW this depends on the series "[PATCH v2 00/18] ASoC: SOF: Intel:
>> hda-mlink: HDaudio multi-link extension update" applied yesterday by
>> Mark. It'd be really nice if we can have this in 6.4-rc1 to continue
>> adding the rest of the Lunar Lake patches.
> 
> That should be mentioned in cover, 

Yes the cover and some patches miss details, it's hard when you have
such a long series to be clear and avoid repetition at the same time...

> I can ack this if okay and Mark might apply..? or u folks have
something else in mind?

that would be ideal, but unfortunately this series will not apply as is
on Mark's for-next branch. I just checked, there are multiple conflicts
with the intel_bus_common stuff which is missing in Mark's tree.

Mark also provided his Acked-by tag already for patches 1/4/6/8, so I
was under the impression that these patches would be merged  through the
soundwire tree.

I think what's missing is a tag from Mark to make sure the hda-mlink
dependencies are in the soundwire tree?

>>
>> We tried to limit the number of changes impacting both ASoC and
>> SoundWire subsystems but there's mechanically 2 merges needed (ASoC ->
>> SoundWire for the hda-mlink dependency and SoundWire->ASoC for the
>> interface changes below).
>>
>>>
>>>> registers are now split in 3 (SHIM, IP, SHIM vendor-specific), with some
>>>> parts also moved to the HDaudio Extended Multi link structures. Nothing
>>>> fundamentally different except for the register map.
>>>>
>>>> This series only provides the basic mechanisms to expose SoundWire-based
>>>> DAIs. The PCI parts and DSP management will be contributed later, and the
>>>> DAI ops are now empty as well.
>>>>
>>>> The change is mainly on SoundWire. It would be better to go through
>>>> SoundWire tree.
>>>>
>>>> Pierre-Louis Bossart (20):
>>>>   ASoC: SOF: Intel: shim: add enum for ACE 2.0 IP used in LunarLake
>>>>   soundwire: intel: add ACE2.x SHIM definitions
>>>>   soundwire: intel_ace2x: add empty new ops for LunarLake
>>>>   soundwire/ASOC: Intel: update offsets for LunarLake
>>>>   soundwire: intel/cadence: set ip_offset at run-time
>>>>   ASoC/soundwire: intel: pass hdac_bus pointer for link management
>>>>   soundwire: intel: add eml_lock in the interface for new platforms
>>>>   ASoC: SOF: Intel: hda: retrieve SoundWire eml_lock and pass pointer
>>>>   soundwire: intel_init: use eml_lock parameter
>>>>   soundwire: intel_ace2x: add debugfs support
>>>>   soundwire: intel_ace2x: add link power-up/down helpers
>>>>   soundwire: intel_ace2x: set SYNCPRD before powering-up
>>>>   soundwire: intel_ace2x: configure link PHY
>>>>   soundwire: intel_ace2x: add DAI registration
>>>>   soundwire: intel_ace2x: add sync_arm/sync_go helpers
>>>>   soundwire: intel_ace2x: use common helpers for bus start/stop
>>>>   soundwire: intel_ace2x: enable wake support
>>>>   soundwire: intel_ace2x: add check_cmdsync_unlocked helper
>>>>   soundwire: bus: add new manager callback to deal with peripheral
>>>>     enumeration
>>>>   soundwire: intel_ace2x: add new_peripheral_assigned callback
>>>>
>>>>  drivers/soundwire/Makefile              |   3 +-
>>>>  drivers/soundwire/bus.c                 |   3 +
>>>>  drivers/soundwire/cadence_master.h      |   2 +
>>>>  drivers/soundwire/intel.h               |  16 +
>>>>  drivers/soundwire/intel_ace2x.c         | 390 ++++++++++++++++++++++++
>>>>  drivers/soundwire/intel_ace2x_debugfs.c | 147 +++++++++
>>>>  drivers/soundwire/intel_auxdevice.c     |  17 ++
>>>>  drivers/soundwire/intel_init.c          |  21 +-
>>>>  include/linux/soundwire/sdw.h           |   3 +-
>>>>  include/linux/soundwire/sdw_intel.h     |  88 ++++++
>>>>  sound/soc/sof/intel/hda.c               |  31 +-
>>>>  sound/soc/sof/intel/shim.h              |   1 +
>>>>  12 files changed, 711 insertions(+), 11 deletions(-)
>>>>  create mode 100644 drivers/soundwire/intel_ace2x.c
>>>>  create mode 100644 drivers/soundwire/intel_ace2x_debugfs.c
>>>>
>>>> -- 
>>>> 2.25.1
>>>
> 
