Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AC33A720A33
	for <lists+alsa-devel@lfdr.de>; Fri,  2 Jun 2023 22:24:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C8CED208;
	Fri,  2 Jun 2023 22:23:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C8CED208
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1685737450;
	bh=puRIGYDStI6pmeTJ3DaD0hpjAZZsD8qmO3oCoOQ8KoI=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=SghimtH35vxZbgCGaSi3pBn/QBEvZqqsRiBjn63DKd7U7ouZUc5WQcIci5ZUL2lMH
	 FfuQf35QLM/xeE6iEF7quJTmRjOJAild4/QZpqMSDwjgmNpN6rk4C1RW17qgWbhWPm
	 FDFrokf+F3ZPzfqBw2oNlbx8VScxaAOCXBAmmvD4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EA273F80578; Fri,  2 Jun 2023 22:23:19 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id EBB3FF80571;
	Fri,  2 Jun 2023 22:23:18 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B317DF8055A; Fri,  2 Jun 2023 22:23:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 56C94F800BD
	for <alsa-devel@alsa-project.org>; Fri,  2 Jun 2023 22:23:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 56C94F800BD
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=NLv0OHaf
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685737383; x=1717273383;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=puRIGYDStI6pmeTJ3DaD0hpjAZZsD8qmO3oCoOQ8KoI=;
  b=NLv0OHaf0h0H32X5B8ey4ONWjeGydI+Zc5nnaLP+eW3lSUqVYMtwmJIP
   KKyPMcyCdlPlecFQz9DY08paz9QhwBkVA15BejG8+JoTMbYEPk+IlJypD
   vn02Kts2fBhhFdzfW2MjOjiCJ0Dnwhsuc+bdqZx37RT0M+4ieCmdsJlIU
   Qo57N3oiqDRJP9doYn1WlGGQcSZ0+vYzTzovnc08xDfD05UTodz2nC54U
   QM2gLClm0Xc8vp+GK0R1P43I6wtrMh2oKljB8ipmaMNzadJQwtJkvvcqo
   PUEXMCGd2F5pHLMHYw0kPt6NEh5jsoU6WcZQzAr/IBDkPu4E6PYs8aW1G
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10729"; a="354811191"
X-IronPort-AV: E=Sophos;i="6.00,214,1681196400";
   d="scan'208";a="354811191"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2023 13:22:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10729"; a="773020000"
X-IronPort-AV: E=Sophos;i="6.00,214,1681196400";
   d="scan'208";a="773020000"
Received: from clatorre-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.212.190.110])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2023 13:22:42 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Cc: tiwai@suse.de,
	broonie@kernel.org,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 00/28] ASoC: Intel: machine driver updates for 6.5
Date: Fri,  2 Jun 2023 15:21:57 -0500
Message-Id: <20230602202225.249209-1-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 2OWRNVERN4M55KFTOYMVCUPXGZAHMTLJ
X-Message-ID-Hash: 2OWRNVERN4M55KFTOYMVCUPXGZAHMTLJ
X-MailFrom: pierre-louis.bossart@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2OWRNVERN4M55KFTOYMVCUPXGZAHMTLJ/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

An unusually large set of patches to deal with new SoundWire-based
platforms.

The bulk of the patches addresses support for MTL using RT712, RT713,
MAX98363, CS42L42 jack codec and amplifiers. The sof_sdw machine
driver had to be updated to remove limitations on number of codecs per
links, dai types, dai naming, etc. We also moved parts of the Realtek
and Maxim support in common code to avoid duplication.

Community users also reported two Dell SKUs which were not supported
in the mainline due to hardware permutations.

Balamurugan C (3):
  ASoC: Intel: ADL: Enable HDMI-In capture feature support for non-I2S
    codec boards.
  ASoC: Intel: ADL: Moving amp only boards into end of the table.
  ASoC: Intel: Sof_ssp_amp: Correcting author name.

Bard Liao (14):
  ASoC: Intel: sof_sdw: add missing exit callback
  ASoC: Intel: sof_sdw: add dai info
  ASoC: Intel: sof_sdw: use predefine dailink id
  ASoC: Intel: sof_sdw: add codec_info pointer
  ASoC: Intel: sdw_sof: append dai_type and remove codec_type
  ASoC: Intel: sof_sdw: add multi dailink support for a codec
  ASoC: Intel: sof_sdw_rt_sdca_jack_common: test SOF_JACK_JDSRC in _exit
  ASoC: Intel: sof_sdw: rename SOF_RT711_JDSRC to SOF_JACK_JDSRC
  ASoC: Intel: sof_sdw: make rt711_sdca be generic
  ASoC: Intel: sof_sdw: add rt712 support
  ASoC: Intel: soc-acpi-intel-tgl-match: add rt712 ID
  ASoC: Intel: soc-acpi-intel-mtl-match: add rt712 ID
  ASoC: Intel: sof_sdw: add rt713 support
  ASoC: Intel: sof_sdw: increase sdw pin index for each sdw link

Pierre-Louis Bossart (4):
  ASoC: Intel: soc-acpi: add table for RPL Dell SKU 0BDA
  ASoC: Intel: sof_sdw: add quick for Dell SKU 0BDA
  ASoC: Intel: soc-acpi: add tables for Dell SKU 0B34
  ASoC: Intel: sof-sdw: add Dell SKU 0B34

Terry Cheong (1):
  ASoC: Intel: Add rpl_rt1019_rt5682 driver

Uday M Bhat (6):
  ASoC: Intel: sof_sdw: Add helper function for cs42l42 codec
  ASoC: Intel: sof_sdw: Rename sof_sdw_max98373.c file to
    sof_sdw_maxim.c
  ASoC: Intel: sof_sdw: Modify maxim helper functions and structure
    names
  ASoC: Intel: sof_sdw: Add support for MAX98363 codec
  ASoC: Intel: sof_sdw: Add support for Rex soundwire
  ASoC: Intel: soc-acpi: add Rex CS42l42 and MAX98363 SoundWire entries

 sound/soc/intel/boards/Kconfig                |   4 +
 sound/soc/intel/boards/Makefile               |  10 +-
 sound/soc/intel/boards/sof_rt5682.c           |  11 +
 sound/soc/intel/boards/sof_sdw.c              | 542 +++++++++++++-----
 sound/soc/intel/boards/sof_sdw_common.h       |  86 ++-
 sound/soc/intel/boards/sof_sdw_cs42l42.c      | 131 +++++
 .../{sof_sdw_max98373.c => sof_sdw_maxim.c}   |  58 +-
 sound/soc/intel/boards/sof_sdw_rt711.c        |   4 +-
 sound/soc/intel/boards/sof_sdw_rt712_sdca.c   | 102 ++++
 ...1_sdca.c => sof_sdw_rt_sdca_jack_common.c} |  73 ++-
 sound/soc/intel/boards/sof_ssp_amp.c          |  11 +-
 .../intel/common/soc-acpi-intel-adl-match.c   |  46 +-
 .../intel/common/soc-acpi-intel-mtl-match.c   |  98 ++++
 .../intel/common/soc-acpi-intel-rpl-match.c   |  42 ++
 .../intel/common/soc-acpi-intel-tgl-match.c   |  53 ++
 15 files changed, 1045 insertions(+), 226 deletions(-)
 create mode 100644 sound/soc/intel/boards/sof_sdw_cs42l42.c
 rename sound/soc/intel/boards/{sof_sdw_max98373.c => sof_sdw_maxim.c} (66%)
 create mode 100644 sound/soc/intel/boards/sof_sdw_rt712_sdca.c
 rename sound/soc/intel/boards/{sof_sdw_rt711_sdca.c => sof_sdw_rt_sdca_jack_common.c} (61%)

-- 
2.37.2

