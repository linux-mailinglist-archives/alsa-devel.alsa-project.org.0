Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D00F36DF1A9
	for <lists+alsa-devel@lfdr.de>; Wed, 12 Apr 2023 12:09:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C0D0510CF;
	Wed, 12 Apr 2023 12:08:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C0D0510CF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1681294142;
	bh=oOr8C2bRUEwOvdemN/ff1MHd4s8nq+oCfQiiIfYJ4/A=;
	h=Date:From:To:Subject:References:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=p0b3MWJ6CcMbhkINbw5vwWSa+XrS5odiRdfOPRbl4zggATjrp2NiTpD4F6C/AfOA8
	 U4ch6X212Xeymxp/k86HgvI3tHoM1JIwO4VGC2ezOO9QMDkYNsIs1RLP3qcPQJtCFn
	 27RXxjT7Sed9JX0dYFmhKUNJbWteq2OlnxfYAG+E=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 85196F804F2;
	Wed, 12 Apr 2023 12:07:47 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 62BB3F8051F; Wed, 12 Apr 2023 12:07:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 18610F8049C
	for <alsa-devel@alsa-project.org>; Wed, 12 Apr 2023 12:07:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 18610F8049C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=FdGB488Y
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id AEFF0632A8;
	Wed, 12 Apr 2023 10:07:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E839C433EF;
	Wed, 12 Apr 2023 10:07:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1681294060;
	bh=oOr8C2bRUEwOvdemN/ff1MHd4s8nq+oCfQiiIfYJ4/A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FdGB488YPHNMZaMwEjj0FfGAeg5D826+VfitkQHwsU81FCnn9puaWoI7h2TW7FjTk
	 5WszIKG8qNSzt5vEQ1edO847iTKHs1JWBFad0t4S0dBMyok5DMcPZ0EEy7D23K+srp
	 DtW0HIlFQDSe2XTjGTDaObT4gvzxEEj0VmMFJd7yudOe9XH9fGZxxNIwFUbtRjalCx
	 Z7MxEHy1bEX/2ImQnT1BTHBue8urDNZKKMH/OYfFrAF9nZjvaI8RVIG79Br7jk3hR6
	 iV6SNnCWBLhiaZM81QM2ril/eec9qxNSTScaBOia6d525t5N3uXnUbPENAQkVCk0dp
	 //vOZbg0EY4qQ==
Date: Wed, 12 Apr 2023 15:37:36 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Bard Liao <yung-chuan.liao@linux.intel.com>
Subject: Re: [PATCH 00/20] ASoC/soundwire: add support for ACE2.x
Message-ID: <ZDaC6D8yBiJ4GrXm@matsya>
References: <20230323054452.1543233-1-yung-chuan.liao@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230323054452.1543233-1-yung-chuan.liao@linux.intel.com>
Message-ID-Hash: 6A5JF7XU6RLU77R5JH4XD2UHW3AB6P6S
X-Message-ID-Hash: 6A5JF7XU6RLU77R5JH4XD2UHW3AB6P6S
X-MailFrom: vkoul@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, broonie@kernel.org,
 linux-kernel@vger.kernel.org, pierre-louis.bossart@linux.intel.com,
 bard.liao@intel.com, tiwai@suse.de
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6A5JF7XU6RLU77R5JH4XD2UHW3AB6P6S/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 23-03-23, 13:44, Bard Liao wrote:
> This series uses the abstraction added in past kernel cycles to provide
> support for the ACE2.x integration. The existing SHIM and Cadence

ACE2..?

> registers are now split in 3 (SHIM, IP, SHIM vendor-specific), with some
> parts also moved to the HDaudio Extended Multi link structures. Nothing
> fundamentally different except for the register map.
> 
> This series only provides the basic mechanisms to expose SoundWire-based
> DAIs. The PCI parts and DSP management will be contributed later, and the
> DAI ops are now empty as well.
> 
> The change is mainly on SoundWire. It would be better to go through
> SoundWire tree.
> 
> Pierre-Louis Bossart (20):
>   ASoC: SOF: Intel: shim: add enum for ACE 2.0 IP used in LunarLake
>   soundwire: intel: add ACE2.x SHIM definitions
>   soundwire: intel_ace2x: add empty new ops for LunarLake
>   soundwire/ASOC: Intel: update offsets for LunarLake
>   soundwire: intel/cadence: set ip_offset at run-time
>   ASoC/soundwire: intel: pass hdac_bus pointer for link management
>   soundwire: intel: add eml_lock in the interface for new platforms
>   ASoC: SOF: Intel: hda: retrieve SoundWire eml_lock and pass pointer
>   soundwire: intel_init: use eml_lock parameter
>   soundwire: intel_ace2x: add debugfs support
>   soundwire: intel_ace2x: add link power-up/down helpers
>   soundwire: intel_ace2x: set SYNCPRD before powering-up
>   soundwire: intel_ace2x: configure link PHY
>   soundwire: intel_ace2x: add DAI registration
>   soundwire: intel_ace2x: add sync_arm/sync_go helpers
>   soundwire: intel_ace2x: use common helpers for bus start/stop
>   soundwire: intel_ace2x: enable wake support
>   soundwire: intel_ace2x: add check_cmdsync_unlocked helper
>   soundwire: bus: add new manager callback to deal with peripheral
>     enumeration
>   soundwire: intel_ace2x: add new_peripheral_assigned callback
> 
>  drivers/soundwire/Makefile              |   3 +-
>  drivers/soundwire/bus.c                 |   3 +
>  drivers/soundwire/cadence_master.h      |   2 +
>  drivers/soundwire/intel.h               |  16 +
>  drivers/soundwire/intel_ace2x.c         | 390 ++++++++++++++++++++++++
>  drivers/soundwire/intel_ace2x_debugfs.c | 147 +++++++++
>  drivers/soundwire/intel_auxdevice.c     |  17 ++
>  drivers/soundwire/intel_init.c          |  21 +-
>  include/linux/soundwire/sdw.h           |   3 +-
>  include/linux/soundwire/sdw_intel.h     |  88 ++++++
>  sound/soc/sof/intel/hda.c               |  31 +-
>  sound/soc/sof/intel/shim.h              |   1 +
>  12 files changed, 711 insertions(+), 11 deletions(-)
>  create mode 100644 drivers/soundwire/intel_ace2x.c
>  create mode 100644 drivers/soundwire/intel_ace2x_debugfs.c
> 
> -- 
> 2.25.1

-- 
~Vinod
