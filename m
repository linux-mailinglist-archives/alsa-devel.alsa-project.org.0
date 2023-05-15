Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C538702559
	for <lists+alsa-devel@lfdr.de>; Mon, 15 May 2023 08:51:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D05AE822;
	Mon, 15 May 2023 08:50:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D05AE822
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684133491;
	bh=1oo0XsT3nA10k1WbskK/cxU0CChuvZrvYt+c1bbAmtk=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=JgBIZfToj3A7s1zGQ+gx/Z5keNhNyt8a7SjMUN3gi+2+ShnBEGVp3P6f1C+W4ZsWI
	 9MUsB3aDAaA6KEszHvh+OsLYxoE0mGcnYoF6OoTy5z0UdDFp/ApxrUXW2T5r+FKXG9
	 27ApLtWrNCEQGi+4ll4S2duBGOfyNQiwYL83MDSE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CAFD2F80542; Mon, 15 May 2023 08:50:39 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 07CA7F80272;
	Mon, 15 May 2023 08:50:39 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 59733F8053D; Mon, 15 May 2023 08:50:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D55EBF8016A
	for <alsa-devel@alsa-project.org>; Mon, 15 May 2023 08:50:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D55EBF8016A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=BpNqkbGW
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1684133426; x=1715669426;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=1oo0XsT3nA10k1WbskK/cxU0CChuvZrvYt+c1bbAmtk=;
  b=BpNqkbGWBPD94ewMqaK6tBtKjMfCOMo8nhVu2XTlgGFkJOs1O0oAEVl8
   E9eiVQG8r7xDXRJCnGVxAjVTom1hsbiAOZaEVAcXjt5NfeIPjI3rrWmZ4
   UzGUyj1kY/DAIGf+mH0t/qCvrIDjxSbcsfk/g39mGTksaK5ZCvJMIVr36
   iOnApYXOF2H/nPI0pOUugOLpgN/ONxLHSV5Q39+H4ZGpQJUPFkozxI6hQ
   GqpjuSdbSBFYu6p9zP8vi5klOH6MOo6MUggOjwuOQhUNvH8yNphIHumCl
   WbMqPECy6KIST5VQ4VCBpHXAw+oARFRIyFYCjiddmjRuo6i7j93t5o6jE
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10710"; a="349966235"
X-IronPort-AV: E=Sophos;i="5.99,275,1677571200";
   d="scan'208";a="349966235"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2023 23:50:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10710"; a="694908559"
X-IronPort-AV: E=Sophos;i="5.99,275,1677571200";
   d="scan'208";a="694908559"
Received: from bard-ubuntu.sh.intel.com ([10.239.185.57])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2023 23:50:18 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: alsa-devel@alsa-project.org,
	vkoul@kernel.org,
	broonie@kernel.org,
	tiwai@suse.de
Cc: linux-kernel@vger.kernel.org,
	vinod.koul@linaro.org,
	pierre-louis.bossart@linux.intel.com,
	bard.liao@intel.com
Subject: [PATCH v2 00/26] ASoC/soundwire: add support for ACE2.x
Date: Mon, 15 May 2023 15:10:16 +0800
Message-Id: <20230515071042.2038-1-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: TDFCERMPKMCZ5Y76MIGH6JTTV6RCT6AH
X-Message-ID-Hash: TDFCERMPKMCZ5Y76MIGH6JTTV6RCT6AH
X-MailFrom: yung-chuan.liao@linux.intel.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/TDFCERMPKMCZ5Y76MIGH6JTTV6RCT6AH/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

This series uses the abstraction added in past kernel cycles to provide
support for the ACE2.x integration. The existing SHIM and Cadence
registers are now split in 3 (SHIM, IP, SHIM vendor-specific), with some
parts also moved to the HDaudio Extended Multi link structures. Nothing
fundamentally different except for the register map.

This series only provides the basic mechanisms to expose SoundWire-based
DAIs. The PCI parts and DSP management will be contributed later, and the
DAI ops are now empty as well.

The change is mainly on SoundWire. It would be better to go through
SoundWire tree.

v2:
 - Some cleanup for free, trigger, hw_params callbacks before introducing
   ACE2.x callbacks.

Pierre-Louis Bossart (26):
  ASoC: SOF: Intel: shim: add enum for ACE 2.0 IP used in LunarLake
  soundwire: intel: add ACE2.x SHIM definitions
  soundwire: intel_ace2x: add empty new ops for LunarLake
  soundwire/ASOC: Intel: update offsets for LunarLake
  soundwire: intel/cadence: set ip_offset at run-time
  ASoC/soundwire: intel: pass hdac_bus pointer for link management
  soundwire: intel: add eml_lock in the interface for new platforms
  ASoC: SOF: Intel: hda: retrieve SoundWire eml_lock and pass pointer
  soundwire: intel_init: use eml_lock parameter
  soundwire: intel_ace2x: add debugfs support
  soundwire: intel_ace2x: add link power-up/down helpers
  soundwire: intel_ace2x: set SYNCPRD before powering-up
  soundwire: intel_ace2x: configure link PHY
  soundwire: intel_ace2x: add DAI registration
  soundwire: intel_ace2x: add sync_arm/sync_go helpers
  soundwire: intel_ace2x: use common helpers for bus start/stop
  soundwire: intel_ace2x: enable wake support
  soundwire: intel_ace2x: add check_cmdsync_unlocked helper
  soundwire: bus: add new manager callback to deal with peripheral
    enumeration
  soundwire: intel_ace2x: add new_peripheral_assigned callback
  soundwire: intel_ace2x: add pre/post bank switch callbacks
  ASoC: SOF/soundwire: re-add substream in params_stream structure
  soundwire: intel: remove .trigger callback implementation
  soundwire: intel: use substream for .trigger callback
  soundwire: intel: remove .free callback implementation
  soundwire: intel: use substream for .free callback

 drivers/soundwire/Makefile              |   3 +-
 drivers/soundwire/bus.c                 |   3 +
 drivers/soundwire/cadence_master.h      |   2 +
 drivers/soundwire/intel.c               |  54 +---
 drivers/soundwire/intel.h               |  16 +
 drivers/soundwire/intel_ace2x.c         | 393 ++++++++++++++++++++++++
 drivers/soundwire/intel_ace2x_debugfs.c | 147 +++++++++
 drivers/soundwire/intel_auxdevice.c     |  17 +
 drivers/soundwire/intel_init.c          |  21 +-
 include/linux/soundwire/sdw.h           |   3 +-
 include/linux/soundwire/sdw_intel.h     |  94 +++++-
 sound/soc/sof/intel/hda.c               |  33 +-
 sound/soc/sof/intel/shim.h              |   1 +
 13 files changed, 723 insertions(+), 64 deletions(-)
 create mode 100644 drivers/soundwire/intel_ace2x.c
 create mode 100644 drivers/soundwire/intel_ace2x_debugfs.c

-- 
2.25.1

