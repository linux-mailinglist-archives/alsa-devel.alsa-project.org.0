Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DEDB881B047
	for <lists+alsa-devel@lfdr.de>; Thu, 21 Dec 2023 09:27:58 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 18F1883E;
	Thu, 21 Dec 2023 09:27:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 18F1883E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1703147278;
	bh=WsOb+Z+gtGMhX5eWfhVgXqF3hmRlu3ZR3WsZXfkaZwU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=G7LuRENTJ7kmswuie2Jbp3Lz2NZOlmVjV8hgQ8SBhsiMJAVOXqTz/v6GRRtCn2SmL
	 7Ywadfr0/rLhJK+OVbSAXcp3IglZCOhbBrlkZrSz5Lhm8KFlMWS4jnXPykWeu36doN
	 +s/6oSDE7+pa8E8F79+36j2U74J5/DNWMxBMlKwA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4F363F8057C; Thu, 21 Dec 2023 09:27:27 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id BEFE2F80578;
	Thu, 21 Dec 2023 09:27:26 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 08A66F80212; Thu, 21 Dec 2023 09:27:22 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A5CCEF800BD
	for <alsa-devel@alsa-project.org>; Thu, 21 Dec 2023 09:27:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A5CCEF800BD
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=VjyUFu6i
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1703147238; x=1734683238;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=WsOb+Z+gtGMhX5eWfhVgXqF3hmRlu3ZR3WsZXfkaZwU=;
  b=VjyUFu6igrnQV47W27IT3BAJs4ST0JGwnSkj2ofQop/tuXhOCo4BnLO7
   HgGqVw9Urwe4JVJW/O17wtvvAz5qhDWcpT6Sn/tc3KKQ7buIrubmDLYLH
   uwC9h6mBbolMHfTyrpUXtf5Ct7qwj/ZyysjXYwWBllLegkl/WihMcLlGx
   44L8A7mdDuPokn7tzXKVPTECfk6fXILi+G/C/KwD2UeWcXTvI36jEpJMN
   Wf7yYCWPZ8GI6ohe7LtwDcB/M8C85CHi43C5QAMqTSxtgaz+mQFhvYD5b
   uCIMlcZNCCtXou3PU3OOWMuFWfPDTI9lNvXFrRGrcE7c9ZLr/hCtnDxWJ
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10930"; a="376091138"
X-IronPort-AV: E=Sophos;i="6.04,293,1695711600";
   d="scan'208";a="376091138"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Dec 2023 00:27:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,293,1695711600";
   d="scan'208";a="24884879"
Received: from wdangelo-mobl.ger.corp.intel.com (HELO [10.252.51.4])
 ([10.252.51.4])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Dec 2023 00:27:13 -0800
Message-ID: <6ad68d6a-335c-45cb-97a0-7d4ef16f5c6d@linux.intel.com>
Date: Thu, 21 Dec 2023 09:27:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/12] soundwire/SOF: add SoundWire Interface support for
 AMD SOF stack
Content-Language: en-US
To: Vijendar Mukunda <Vijendar.Mukunda@amd.com>, broonie@kernel.org,
 vkoul@kernel.org
Cc: alsa-devel@alsa-project.org, Basavaraj.Hiregoudar@amd.com,
 Sunil-kumar.Dommati@amd.com, venkataprasad.potturu@amd.com
References: <20231221073558.3181911-1-Vijendar.Mukunda@amd.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20231221073558.3181911-1-Vijendar.Mukunda@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: 3UP5V2TOVCKMPEPQNGF27NO7YTPPAHBZ
X-Message-ID-Hash: 3UP5V2TOVCKMPEPQNGF27NO7YTPPAHBZ
X-MailFrom: pierre-louis.bossart@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3UP5V2TOVCKMPEPQNGF27NO7YTPPAHBZ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 12/21/23 08:35, Vijendar Mukunda wrote:
> This patch series is to redesign existing platform device
> creation logic for SoundWire managers and Implement generic
> functions for SoundWire manager probe, start and exit sequence
> which are common for both Legacy(NO DSP enabled) and SOF stack,
> and add SoundWire Interface support for AMD SOF stack
> (ACP 6.3 based platforms).
> 
> Vijendar Mukunda (12):
>   ASoC/soundwire: implement generic api for scanning amd soundwire
>     controller
>   drivers: soundwire: refactor amd soundwire manager device node
>     creation
>   drivers: soundwire: implement function to extract slave information
>   drivers: soundwire: refactor soundwire pads enable
>   drivers: soundwire: refactor register mask structure
>   ASoC: SOF: amd: add code for invoking soundwire manager helper
>     functions
>   ASoC: SOF: amd: add interrupt handling for SoundWire manager devices
>   ASoC: SOF: amd: Add Soundwire DAI configuration support for AMD
>     platforms
>   ASoC: SOF: amd: add machine select logic for soundwire based platforms
>   ASoC: SOF: amd: update descriptor fields for acp6.3 based platform
>   ASoC: SOF: amd: select soundwire dependency flag for acp6.3 based
>     platform
>   ASoC: SOF: amd: refactor acp driver pm ops

This patchset was reviewed by Bard and I in
https://github.com/thesofproject/linux/pull/4699

That said, my recommendation was to wait 2024 to send those patches,
it's rather late for code across two subsystems to be added.

>  drivers/soundwire/Makefile         |   2 +-
>  drivers/soundwire/amd_init.c       | 235 +++++++++++++++++++++++++++++
>  drivers/soundwire/amd_init.h       |  13 ++
>  drivers/soundwire/amd_manager.c    |  41 +----
>  drivers/soundwire/amd_manager.h    |  12 +-
>  include/linux/soundwire/sdw_amd.h  |  79 ++++++++--
>  include/sound/sof/dai-amd.h        |   7 +
>  include/sound/sof/dai.h            |   2 +
>  include/uapi/sound/sof/tokens.h    |   4 +
>  sound/soc/amd/acp/Kconfig          |   7 +
>  sound/soc/amd/acp/Makefile         |   2 +
>  sound/soc/amd/acp/amd-sdw-acpi.c   |  62 ++++++++
>  sound/soc/sof/amd/Kconfig          |  18 +++
>  sound/soc/sof/amd/acp-common.c     |  65 +++++++-
>  sound/soc/sof/amd/acp-dsp-offset.h |  10 ++
>  sound/soc/sof/amd/acp.c            | 202 ++++++++++++++++++++++++-
>  sound/soc/sof/amd/acp.h            |  26 +++-
>  sound/soc/sof/amd/pci-acp63.c      |   7 +
>  sound/soc/sof/ipc3-pcm.c           |  25 +++
>  sound/soc/sof/ipc3-topology.c      |  40 +++++
>  sound/soc/sof/sof-audio.h          |   1 +
>  sound/soc/sof/topology.c           |   5 +
>  22 files changed, 798 insertions(+), 67 deletions(-)
>  create mode 100644 drivers/soundwire/amd_init.c
>  create mode 100644 drivers/soundwire/amd_init.h
>  create mode 100644 sound/soc/amd/acp/amd-sdw-acpi.c
> 
