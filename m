Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D388E6DF9D3
	for <lists+alsa-devel@lfdr.de>; Wed, 12 Apr 2023 17:23:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3F04A105F;
	Wed, 12 Apr 2023 17:22:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3F04A105F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1681313015;
	bh=GWxm8P+3Ri5Spbf8k+0TVoJwpCVsLbHE0FFcIy1IECU=;
	h=Date:From:To:Subject:References:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=oeOUCTttdo9VuXgQuV7dsZuxgfJbrRM3Q2DuAjJupi+gknfEX/zwBkhG4IJk0HjT7
	 g1+elU+zXmB4vhsexIqD40OEdrwEjLsabPS84lQoC/x5wBEIexF4rCwR0Es+XlWG1h
	 xfKxGSw9L+0G6c6uHl14oA7o9jzGuiozUFxfypdw=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9DFCFF8025E;
	Wed, 12 Apr 2023 17:22:44 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 81BE6F8032B; Wed, 12 Apr 2023 17:22:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 88954F80100
	for <alsa-devel@alsa-project.org>; Wed, 12 Apr 2023 17:22:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 88954F80100
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=gB6iZ//O
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id F3FDE6123F;
	Wed, 12 Apr 2023 15:22:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CBF49C433D2;
	Wed, 12 Apr 2023 15:22:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1681312955;
	bh=GWxm8P+3Ri5Spbf8k+0TVoJwpCVsLbHE0FFcIy1IECU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gB6iZ//OBzRXCmp4HY29Hj7DLDG6NFPgzgXKwSEpoRx1cfAvvBjlKxZZaB885ZCN3
	 Ejo6670fu8hEjq4YLGqsg0j039IGh9A6C62MrkYhqvefL1KzuSHLYfdlJEgDAu3N0o
	 PN7tY2DkX5zKHfaiIhk0xlbgoCJuMsGo3Cfb2XfRPI9a0VQdLapKVR2SK23RaoU+Hq
	 znG6UK36Q/Bc4YMBanB6pXj/JNZTsznvFNqg0LOvmp7j3NgB6ADSdv71GQtNc8RIKY
	 o7Cf5Fx2QKVyhK/1fs/p/DroDAMQwsnLRTLBeum6KDo3NB8aVC1Z2Xz7KLMnWF0jWA
	 nieeUnlhZdr5g==
Date: Wed, 12 Apr 2023 20:52:31 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH 00/20] ASoC/soundwire: add support for ACE2.x
Message-ID: <ZDbMt5BRrAV5UUEw@matsya>
References: <20230323054452.1543233-1-yung-chuan.liao@linux.intel.com>
 <ZDaC6D8yBiJ4GrXm@matsya>
 <27493df8-e1c7-1a8b-e77e-dc3bd495567b@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <27493df8-e1c7-1a8b-e77e-dc3bd495567b@linux.intel.com>
Message-ID-Hash: 7OVTFQSWVGTFUVY6APCWA74NLFMOWYIJ
X-Message-ID-Hash: 7OVTFQSWVGTFUVY6APCWA74NLFMOWYIJ
X-MailFrom: vkoul@kernel.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7OVTFQSWVGTFUVY6APCWA74NLFMOWYIJ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 12-04-23, 09:11, Pierre-Louis Bossart wrote:
> 
> 
> On 4/12/23 05:07, Vinod Koul wrote:
> > On 23-03-23, 13:44, Bard Liao wrote:
> >> This series uses the abstraction added in past kernel cycles to provide
> >> support for the ACE2.x integration. The existing SHIM and Cadence
> > 
> > ACE2..?
> 
> Not sure I get the comment, this refers to the IP version.

What does ACE mean, it should be expanded so that people know what it
might refer to..?

> 
> ACE 2.0 IP used in LunarLake, x refers to future TDB versions.
> 
> BTW this depends on the series "[PATCH v2 00/18] ASoC: SOF: Intel:
> hda-mlink: HDaudio multi-link extension update" applied yesterday by
> Mark. It'd be really nice if we can have this in 6.4-rc1 to continue
> adding the rest of the Lunar Lake patches.

That should be mentioned in cover, I can ack this if okay and Mark might
apply..? or u folks have something else in mind?

> 
> We tried to limit the number of changes impacting both ASoC and
> SoundWire subsystems but there's mechanically 2 merges needed (ASoC ->
> SoundWire for the hda-mlink dependency and SoundWire->ASoC for the
> interface changes below).
> 
> > 
> >> registers are now split in 3 (SHIM, IP, SHIM vendor-specific), with some
> >> parts also moved to the HDaudio Extended Multi link structures. Nothing
> >> fundamentally different except for the register map.
> >>
> >> This series only provides the basic mechanisms to expose SoundWire-based
> >> DAIs. The PCI parts and DSP management will be contributed later, and the
> >> DAI ops are now empty as well.
> >>
> >> The change is mainly on SoundWire. It would be better to go through
> >> SoundWire tree.
> >>
> >> Pierre-Louis Bossart (20):
> >>   ASoC: SOF: Intel: shim: add enum for ACE 2.0 IP used in LunarLake
> >>   soundwire: intel: add ACE2.x SHIM definitions
> >>   soundwire: intel_ace2x: add empty new ops for LunarLake
> >>   soundwire/ASOC: Intel: update offsets for LunarLake
> >>   soundwire: intel/cadence: set ip_offset at run-time
> >>   ASoC/soundwire: intel: pass hdac_bus pointer for link management
> >>   soundwire: intel: add eml_lock in the interface for new platforms
> >>   ASoC: SOF: Intel: hda: retrieve SoundWire eml_lock and pass pointer
> >>   soundwire: intel_init: use eml_lock parameter
> >>   soundwire: intel_ace2x: add debugfs support
> >>   soundwire: intel_ace2x: add link power-up/down helpers
> >>   soundwire: intel_ace2x: set SYNCPRD before powering-up
> >>   soundwire: intel_ace2x: configure link PHY
> >>   soundwire: intel_ace2x: add DAI registration
> >>   soundwire: intel_ace2x: add sync_arm/sync_go helpers
> >>   soundwire: intel_ace2x: use common helpers for bus start/stop
> >>   soundwire: intel_ace2x: enable wake support
> >>   soundwire: intel_ace2x: add check_cmdsync_unlocked helper
> >>   soundwire: bus: add new manager callback to deal with peripheral
> >>     enumeration
> >>   soundwire: intel_ace2x: add new_peripheral_assigned callback
> >>
> >>  drivers/soundwire/Makefile              |   3 +-
> >>  drivers/soundwire/bus.c                 |   3 +
> >>  drivers/soundwire/cadence_master.h      |   2 +
> >>  drivers/soundwire/intel.h               |  16 +
> >>  drivers/soundwire/intel_ace2x.c         | 390 ++++++++++++++++++++++++
> >>  drivers/soundwire/intel_ace2x_debugfs.c | 147 +++++++++
> >>  drivers/soundwire/intel_auxdevice.c     |  17 ++
> >>  drivers/soundwire/intel_init.c          |  21 +-
> >>  include/linux/soundwire/sdw.h           |   3 +-
> >>  include/linux/soundwire/sdw_intel.h     |  88 ++++++
> >>  sound/soc/sof/intel/hda.c               |  31 +-
> >>  sound/soc/sof/intel/shim.h              |   1 +
> >>  12 files changed, 711 insertions(+), 11 deletions(-)
> >>  create mode 100644 drivers/soundwire/intel_ace2x.c
> >>  create mode 100644 drivers/soundwire/intel_ace2x_debugfs.c
> >>
> >> -- 
> >> 2.25.1
> > 

-- 
~Vinod
