Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A9E1D6DF819
	for <lists+alsa-devel@lfdr.de>; Wed, 12 Apr 2023 16:12:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5830FFC7;
	Wed, 12 Apr 2023 16:11:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5830FFC7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1681308755;
	bh=rFb8LUdOar1rVBoFs0RRiVet8qUiYYkcQuG9p1x2yPY=;
	h=Date:Subject:To:References:From:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=smVJ5F3LdLErq0TMby7odcyT93MG2xy3YUwxnDPbg2Ue+nJ2JS3zR3sKKxcEWiDjl
	 MW4Y0hUDq8RBOGjcwiNOFak2djZW8Dk7BBu8jY4lgCfK+3PuwaYZZ/jV0n5XIzfm1d
	 XWPHPSa/zd05jczhiG1yAf0S/uc5H92xp3jU2Myo=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B6610F8025E;
	Wed, 12 Apr 2023 16:11:44 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AA1B4F8032B; Wed, 12 Apr 2023 16:11:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A297FF800E5
	for <alsa-devel@alsa-project.org>; Wed, 12 Apr 2023 16:11:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A297FF800E5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=ZkECYyMk
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681308679; x=1712844679;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=rFb8LUdOar1rVBoFs0RRiVet8qUiYYkcQuG9p1x2yPY=;
  b=ZkECYyMk2M9S7kT0mmPSw3DdFBmdsQU1xCRldc1B8xd7d08KPEVIZRbK
   eEi4Y1SQra2mAg/0hcFG5xG/xUJLpVZyYpUTSgwwVqeAyniYL/+XP+QDT
   D8i6JkZuWeG6mglntbv0SkvbSsgSr6ediYDdHCD8YsW2xM3lDUfR/Cj6Z
   PaMjf+GD0Qu2Z1r/meBjjDWVjeL9BmvivzjuinJXQTJ8ZPwr7yBz8xNBT
   waCeMUlMYYnOwGEXmhzrkFL4PVCJzzWSixVqRrjbFdaG+h9dt7uT0841M
   StkjT6sGHslQVUu9wYwbnxp1kWS2U0BP07GQ29+PY6/79FxncBiNvU9pw
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10678"; a="409045920"
X-IronPort-AV: E=Sophos;i="5.98,339,1673942400";
   d="scan'208";a="409045920"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2023 07:11:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10678"; a="682480424"
X-IronPort-AV: E=Sophos;i="5.98,339,1673942400";
   d="scan'208";a="682480424"
Received: from mdhabibh-mobl.amr.corp.intel.com (HELO [10.209.99.121])
 ([10.209.99.121])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2023 07:11:10 -0700
Message-ID: <27493df8-e1c7-1a8b-e77e-dc3bd495567b@linux.intel.com>
Date: Wed, 12 Apr 2023 09:11:09 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.9.0
Subject: Re: [PATCH 00/20] ASoC/soundwire: add support for ACE2.x
Content-Language: en-US
To: Vinod Koul <vkoul@kernel.org>, Bard Liao <yung-chuan.liao@linux.intel.com>
References: <20230323054452.1543233-1-yung-chuan.liao@linux.intel.com>
 <ZDaC6D8yBiJ4GrXm@matsya>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <ZDaC6D8yBiJ4GrXm@matsya>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: 6WDXWEF7FS6VUIS65QEGFESNR7YU6VWM
X-Message-ID-Hash: 6WDXWEF7FS6VUIS65QEGFESNR7YU6VWM
X-MailFrom: pierre-louis.bossart@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, broonie@kernel.org,
 linux-kernel@vger.kernel.org, bard.liao@intel.com, tiwai@suse.de
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6WDXWEF7FS6VUIS65QEGFESNR7YU6VWM/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 4/12/23 05:07, Vinod Koul wrote:
> On 23-03-23, 13:44, Bard Liao wrote:
>> This series uses the abstraction added in past kernel cycles to provide
>> support for the ACE2.x integration. The existing SHIM and Cadence
> 
> ACE2..?

Not sure I get the comment, this refers to the IP version.

ACE 2.0 IP used in LunarLake, x refers to future TDB versions.

BTW this depends on the series "[PATCH v2 00/18] ASoC: SOF: Intel:
hda-mlink: HDaudio multi-link extension update" applied yesterday by
Mark. It'd be really nice if we can have this in 6.4-rc1 to continue
adding the rest of the Lunar Lake patches.

We tried to limit the number of changes impacting both ASoC and
SoundWire subsystems but there's mechanically 2 merges needed (ASoC ->
SoundWire for the hda-mlink dependency and SoundWire->ASoC for the
interface changes below).

> 
>> registers are now split in 3 (SHIM, IP, SHIM vendor-specific), with some
>> parts also moved to the HDaudio Extended Multi link structures. Nothing
>> fundamentally different except for the register map.
>>
>> This series only provides the basic mechanisms to expose SoundWire-based
>> DAIs. The PCI parts and DSP management will be contributed later, and the
>> DAI ops are now empty as well.
>>
>> The change is mainly on SoundWire. It would be better to go through
>> SoundWire tree.
>>
>> Pierre-Louis Bossart (20):
>>   ASoC: SOF: Intel: shim: add enum for ACE 2.0 IP used in LunarLake
>>   soundwire: intel: add ACE2.x SHIM definitions
>>   soundwire: intel_ace2x: add empty new ops for LunarLake
>>   soundwire/ASOC: Intel: update offsets for LunarLake
>>   soundwire: intel/cadence: set ip_offset at run-time
>>   ASoC/soundwire: intel: pass hdac_bus pointer for link management
>>   soundwire: intel: add eml_lock in the interface for new platforms
>>   ASoC: SOF: Intel: hda: retrieve SoundWire eml_lock and pass pointer
>>   soundwire: intel_init: use eml_lock parameter
>>   soundwire: intel_ace2x: add debugfs support
>>   soundwire: intel_ace2x: add link power-up/down helpers
>>   soundwire: intel_ace2x: set SYNCPRD before powering-up
>>   soundwire: intel_ace2x: configure link PHY
>>   soundwire: intel_ace2x: add DAI registration
>>   soundwire: intel_ace2x: add sync_arm/sync_go helpers
>>   soundwire: intel_ace2x: use common helpers for bus start/stop
>>   soundwire: intel_ace2x: enable wake support
>>   soundwire: intel_ace2x: add check_cmdsync_unlocked helper
>>   soundwire: bus: add new manager callback to deal with peripheral
>>     enumeration
>>   soundwire: intel_ace2x: add new_peripheral_assigned callback
>>
>>  drivers/soundwire/Makefile              |   3 +-
>>  drivers/soundwire/bus.c                 |   3 +
>>  drivers/soundwire/cadence_master.h      |   2 +
>>  drivers/soundwire/intel.h               |  16 +
>>  drivers/soundwire/intel_ace2x.c         | 390 ++++++++++++++++++++++++
>>  drivers/soundwire/intel_ace2x_debugfs.c | 147 +++++++++
>>  drivers/soundwire/intel_auxdevice.c     |  17 ++
>>  drivers/soundwire/intel_init.c          |  21 +-
>>  include/linux/soundwire/sdw.h           |   3 +-
>>  include/linux/soundwire/sdw_intel.h     |  88 ++++++
>>  sound/soc/sof/intel/hda.c               |  31 +-
>>  sound/soc/sof/intel/shim.h              |   1 +
>>  12 files changed, 711 insertions(+), 11 deletions(-)
>>  create mode 100644 drivers/soundwire/intel_ace2x.c
>>  create mode 100644 drivers/soundwire/intel_ace2x_debugfs.c
>>
>> -- 
>> 2.25.1
> 
