Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (unknown [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5199C9446F9
	for <lists+alsa-devel@lfdr.de>; Thu,  1 Aug 2024 10:49:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 357EF36B3;
	Thu,  1 Aug 2024 10:49:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 357EF36B3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1722502163;
	bh=HERPiHbx3A4hByltQLkNK9jn34tqESU7rbfEF6bfiMk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Eaw1Pd+5Jdx6yw4id7qrU2wVljeRAW4DlPnK6kircqhE+n4HMi9UHQZ8CFv+VhOh4
	 OOuyQtt/iTQafgAu8aRMM1jX0Czu64dgm+7ROnokMk6sxVs3TmKR8OadKSmR4AcISz
	 L3wwk5cZ7Xw0WXOGagmtds+Ua/c4I4l+84mSg7Mk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9674CF805AF; Thu,  1 Aug 2024 10:49:01 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9A70EF805D7;
	Thu,  1 Aug 2024 10:49:01 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CAD63F8026A; Thu,  1 Aug 2024 08:56:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C7A83F8007E
	for <alsa-devel@alsa-project.org>; Thu,  1 Aug 2024 08:56:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C7A83F8007E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=emhlG/2b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722495391; x=1754031391;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=HERPiHbx3A4hByltQLkNK9jn34tqESU7rbfEF6bfiMk=;
  b=emhlG/2bxIsI6r+4l4DoTwkHUz1Kz8/Nqb5sfYMNaMpV1ucwIMmQHzkJ
   7G5R3SRIeR5TJk34l6prckHdqsMptbKvLRTy+ttLCH4jnEY9FA3bPessL
   Lc+7RkfptNMhS69gW6XZy1otrseuVhNxdlUaY8APNxWLhw01m1nq5of9A
   QxA1dU29uWxWAOCnR037XsbSrqV8FdRDsuFBJdjj5EgRJ/5R/rMWzlHU/
   RQ6FnB/bUiaJhxovQYqQUesHdmTSOK1vWpeqJv+prQxw8//TZJRofZ4Tx
   h0oLswj7nd+Sz/yww/9I4k9EyUApy2osaFNpkgO4YRmR5HmTN+55lmtPf
   A==;
X-CSE-ConnectionGUID: EoJCa3AVRgi0S/N0jmjE9g==
X-CSE-MsgGUID: YcpknORqTw2geaypg8zVtA==
X-IronPort-AV: E=McAfee;i="6700,10204,11150"; a="31006974"
X-IronPort-AV: E=Sophos;i="6.09,253,1716274800";
   d="scan'208";a="31006974"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2024 23:56:22 -0700
X-CSE-ConnectionGUID: 7/0Gzlc1S6OhSDi9d5HGvA==
X-CSE-MsgGUID: wIliyWA/QL+GAhR7o8qbtA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,253,1716274800";
   d="scan'208";a="59970227"
Received: from lfiedoro-mobl.ger.corp.intel.com (HELO [10.245.246.220])
 ([10.245.246.220])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2024 23:56:19 -0700
Message-ID: <d009de01-ebb6-4962-a32f-ca78c351e659@linux.intel.com>
Date: Thu, 1 Aug 2024 08:56:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/31] AMD SOF based generic SoundWire machine driver
To: Vijendar Mukunda <Vijendar.Mukunda@amd.com>, broonie@kernel.org
Cc: alsa-devel@alsa-project.org, yung-chuan.liao@linux.intel.com,
 Basavaraj.Hiregoudar@amd.com, Sunil-kumar.Dommati@amd.com,
 venkataprasad.potturu@amd.com
References: <20240801062416.2203673-1-Vijendar.Mukunda@amd.com>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20240801062416.2203673-1-Vijendar.Mukunda@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: MDSQWGWR44NEQ5DJ53GAZVBPDLGXEWFH
X-Message-ID-Hash: MDSQWGWR44NEQ5DJ53GAZVBPDLGXEWFH
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MDSQWGWR44NEQ5DJ53GAZVBPDLGXEWFH/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 8/1/24 08:23, Vijendar Mukunda wrote:
> This patch series majorly consists of below changes.
> - Rename structures, macros and codec helper names used in Intel
> SoundWire generic driver to make it generic.
> - Move Intel SoundWire driver common structures, macros and codec
> helper functions to common placeholder so that it can be used by
> other platform machine driver.
> - Refactor few SoundWire common codec helper functions.
> - AMD SOF based generic SoundWire machine driver for ACP 6.3 variant
> 
> Link: https://github.com/thesofproject/linux/pull/5068
> Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
> Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

For more context, this work started a couple of months ago to avoid
duplication of code that wasn't really Intel-specific in the "sof_sdw"
machine driver. The code went through multiple iterations, was tested
for multiple weeks and a couple of build issues reported by the Intel
kbuild bots were corrected.

It's my understanding that additional refactoring will happen on the AMD
side in a second step.

> Vijendar Mukunda (31):
>   ASoC: intel: rename codec_info and dai_info structures names
>   ASoC: intel: rename soundwire common header macros
>   ASoC: intel: rename soundwire machine driver soc ops
>   ASoC: intel: rename soundwire codec helper functions
>   ASoC: intel: rename maxim codec macros
>   ASoC: intel: rename ignore_pch_dmic variable name
>   ASoC: intel/sdw-utils: move soundwire machine driver soc ops
>   ASoC: intel: move soundwire machine driver common structures
>   ASoC: intel/sdw_utils: move soundwire machine driver helper functions
>   ASoC: intel/sdw_utils: move dmic codec helper function
>   ASoC: intel/sdw_utils: move rtk dmic helper functions
>   ASoC: intel/sdw_utils: move rt712 sdca helper functions
>   ASoC: intel/sdw_utils: move rt722 sdca helper functions
>   ASoC: intel: split soundwire machine driver private data
>   ASoC: intel/sdw_utils: move rt5682 codec helper function
>   ASoC: intel/sdw_utils: move rtk jack common helper functions
>   ASoC: intel/sdw_utils: move rt700 and rt711 codec helper functions
>   ASoC: intel/sdw_utils: move rtk amp codec helper functions
>   ASoC: intel/sdw_utils: move cirrus soundwire codec helper functions
>   ASoC: intel/sdw_utils: move maxim codec helper functions
>   ASoC: intel/sdw_utils: move dai id common macros
>   ASoC: intel/sdw_utils: move soundwire dai type macros
>   ASoC: intel/sdw_utils: move soundwire codec_info_list structure
>   ASoC: intel/sdw_utils: move machine driver dai link helper functions
>   ASoC: sdw_utils: refactor sof_sdw_card_late_probe function
>   ASoC: intel/sdw_utils: refactor init_dai_link() and
>     init_simple_dai_link()
>   ASoC: soc-acpi: add pci revision id field in mach params structure
>   ASoC: amd: acp: add soundwire machines for acp6.3 based platform
>   ASoC: SOF: amd: add alternate machines for acp6.3 based platform
>   ASoC: SOF: amd: update mach params subsystem_rev variable
>   ASoC: amd/sdw_utils: add sof based soundwire generic machine driver
> 
>  include/sound/soc-acpi.h                      |    2 +
>  include/sound/soc_sdw_utils.h                 |  216 ++++
>  sound/soc/Kconfig                             |    2 +
>  sound/soc/Makefile                            |    1 +
>  sound/soc/amd/acp/Kconfig                     |   22 +
>  sound/soc/amd/acp/Makefile                    |    4 +
>  sound/soc/amd/acp/acp-sdw-sof-mach.c          |  742 +++++++++++
>  sound/soc/amd/acp/amd-acp63-acpi-match.c      |   90 ++
>  sound/soc/amd/acp/soc_amd_sdw_common.h        |   44 +
>  sound/soc/amd/mach-config.h                   |    1 +
>  sound/soc/intel/boards/Kconfig                |    1 +
>  sound/soc/intel/boards/Makefile               |    9 -
>  sound/soc/intel/boards/sof_sdw.c              | 1142 ++---------------
>  sound/soc/intel/boards/sof_sdw_common.h       |  166 +--
>  sound/soc/intel/boards/sof_sdw_hdmi.c         |   14 +-
>  sound/soc/sdw_utils/Kconfig                   |    6 +
>  sound/soc/sdw_utils/Makefile                  |   11 +
>  .../soc_sdw_bridge_cs35l56.c}                 |   56 +-
>  .../soc_sdw_cs42l42.c}                        |   13 +-
>  .../soc_sdw_cs42l43.c}                        |   38 +-
>  .../soc_sdw_cs_amp.c}                         |   18 +-
>  .../soc_sdw_dmic.c}                           |   10 +-
>  .../soc_sdw_maxim.c}                          |   56 +-
>  .../soc_sdw_rt5682.c}                         |   12 +-
>  .../soc_sdw_rt700.c}                          |   12 +-
>  .../soc_sdw_rt711.c}                          |   38 +-
>  .../soc_sdw_rt712_sdca.c}                     |   10 +-
>  .../soc_sdw_rt722_sdca.c}                     |   10 +-
>  .../soc_sdw_rt_amp.c}                         |   32 +-
>  .../soc_sdw_rt_amp_coeff_tables.h}            |    6 +-
>  .../soc_sdw_rt_dmic.c}                        |   11 +-
>  .../soc_sdw_rt_sdca_jack_common.c}            |   40 +-
>  sound/soc/sdw_utils/soc_sdw_utils.c           |  990 ++++++++++++++
>  sound/soc/sof/amd/Kconfig                     |    1 +
>  sound/soc/sof/amd/acp-common.c                |    3 +
>  sound/soc/sof/amd/acp.c                       |    1 +
>  sound/soc/sof/amd/acp.h                       |    1 +
>  sound/soc/sof/amd/pci-acp63.c                 |    1 +
>  38 files changed, 2475 insertions(+), 1357 deletions(-)
>  create mode 100644 include/sound/soc_sdw_utils.h
>  create mode 100644 sound/soc/amd/acp/acp-sdw-sof-mach.c
>  create mode 100644 sound/soc/amd/acp/amd-acp63-acpi-match.c
>  create mode 100644 sound/soc/amd/acp/soc_amd_sdw_common.h
>  create mode 100644 sound/soc/sdw_utils/Kconfig
>  create mode 100644 sound/soc/sdw_utils/Makefile
>  rename sound/soc/{intel/boards/bridge_cs35l56.c => sdw_utils/soc_sdw_bridge_cs35l56.c} (63%)
>  rename sound/soc/{intel/boards/sof_sdw_cs42l42.c => sdw_utils/soc_sdw_cs42l42.c} (82%)
>  rename sound/soc/{intel/boards/sof_sdw_cs42l43.c => sdw_utils/soc_sdw_cs42l43.c} (73%)
>  rename sound/soc/{intel/boards/sof_sdw_cs_amp.c => sdw_utils/soc_sdw_cs_amp.c} (66%)
>  rename sound/soc/{intel/boards/sof_sdw_dmic.c => sdw_utils/soc_sdw_dmic.c} (71%)
>  rename sound/soc/{intel/boards/sof_sdw_maxim.c => sdw_utils/soc_sdw_maxim.c} (63%)
>  rename sound/soc/{intel/boards/sof_sdw_rt5682.c => sdw_utils/soc_sdw_rt5682.c} (82%)
>  rename sound/soc/{intel/boards/sof_sdw_rt700.c => sdw_utils/soc_sdw_rt700.c} (81%)
>  rename sound/soc/{intel/boards/sof_sdw_rt711.c => sdw_utils/soc_sdw_rt711.c} (70%)
>  rename sound/soc/{intel/boards/sof_sdw_rt712_sdca.c => sdw_utils/soc_sdw_rt712_sdca.c} (74%)
>  rename sound/soc/{intel/boards/sof_sdw_rt722_sdca.c => sdw_utils/soc_sdw_rt722_sdca.c} (68%)
>  rename sound/soc/{intel/boards/sof_sdw_rt_amp.c => sdw_utils/soc_sdw_rt_amp.c} (87%)
>  rename sound/soc/{intel/boards/sof_sdw_amp_coeff_tables.h => sdw_utils/soc_sdw_rt_amp_coeff_tables.h} (97%)
>  rename sound/soc/{intel/boards/sof_sdw_rt_dmic.c => sdw_utils/soc_sdw_rt_dmic.c} (70%)
>  rename sound/soc/{intel/boards/sof_sdw_rt_sdca_jack_common.c => sdw_utils/soc_sdw_rt_sdca_jack_common.c} (78%)
>  create mode 100644 sound/soc/sdw_utils/soc_sdw_utils.c
> 

