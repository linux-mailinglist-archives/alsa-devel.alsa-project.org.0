Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 411A37C7697
	for <lists+alsa-devel@lfdr.de>; Thu, 12 Oct 2023 21:21:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EB45EE7D;
	Thu, 12 Oct 2023 21:20:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EB45EE7D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1697138462;
	bh=fVn8aBtUfBcF9VuXI/kyyxyc9Q98uFbk1/cGlBPYfoA=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=j3CeFMG9hUZwS6W3sMsN/cUV8r4Dl/J3ek+OFqVJwivXa31U0u96sGRSBDmtiXmnx
	 ogNfitelbeqP6KRS+TPNnTK3yQtxoAWJ2PViWzJNyTOV7G0DvgonmtIyS3+kj4jqtn
	 4tcL/qUaLT3fWhZU+n9YOxPg4u9KzV2cb1vFR6HM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6DA4FF8055C; Thu, 12 Oct 2023 21:19:23 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CDD8DF8055B;
	Thu, 12 Oct 2023 21:19:22 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 19A6BF80536; Thu, 12 Oct 2023 21:19:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D5197F8015B
	for <alsa-devel@alsa-project.org>; Thu, 12 Oct 2023 21:19:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D5197F8015B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=mQ/FZ4rx
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697138355; x=1728674355;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=fVn8aBtUfBcF9VuXI/kyyxyc9Q98uFbk1/cGlBPYfoA=;
  b=mQ/FZ4rxBcOSygT1tgVT4lE7zkFPiVkdrypLcOjgpZKjcruv9qxWZYTk
   zj+S8XfoCJ7Zrirr65B+3O8UEB7DYmoPxyrSLX0eiafX04nJtDaWNXXYO
   N0yOt1BbjtZd0gWonDIAdngdQTXJJooDsNuO11ChZWqbFXjSM0PcOBSjE
   x2lgzcy4DAmvZDGhdooy0WRLyQn/53KXmqhkLgtsZpL0pAoFereuE9/LI
   iySJwcvgxFWii9eqI1tAbfF6PJMibqP3hGo7wFoquy/D+es/BB95EQW5e
   cRVaWZBjF8pp5/IscO/KBXL5sPUrm4/2S0Y+5D5M3eI92I2Aq8BQLEgis
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="383875342"
X-IronPort-AV: E=Sophos;i="6.03,219,1694761200";
   d="scan'208";a="383875342"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2023 12:18:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="1001627997"
X-IronPort-AV: E=Sophos;i="6.03,219,1694761200";
   d="scan'208";a="1001627997"
Received: from gchoudha-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.hsd1.md.comcast.net) ([10.212.114.241])
  by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2023 12:18:58 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Cc: tiwai@suse.de,
	broonie@kernel.org,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 0/4] ASoC: SOF: misc updates for 6.7
Date: Thu, 12 Oct 2023 15:18:46 -0400
Message-Id: <20231012191850.147140-1-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: CEERHYO2NCO2WPC5JAD5Q4WTFXERLUVJ
X-Message-ID-Hash: CEERHYO2NCO2WPC5JAD5Q4WTFXERLUVJ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/CEERHYO2NCO2WPC5JAD5Q4WTFXERLUVJ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

New PCI ID, one fix for a delayed IRQ thread causing issues, one
update for debug and one follow-up cleanup for the .remove callback.

Arun T (1):
  ASoC: SOF: Intel: pci-mtl: use ARL specific firmware definitions

Peter Ujfalusi (2):
  ASoC: SOF: Intel: hda-dsp: Make sure that no irq handler is pending
    before suspend
  ASoC: SOF: ipc4: Dump the notification payload

Pierre-Louis Bossart (1):
  ASoC: SOF: make .remove callback return void

 sound/soc/sof/amd/acp.c                |  4 ++--
 sound/soc/sof/amd/acp.h                |  2 +-
 sound/soc/sof/imx/imx8.c               |  4 +---
 sound/soc/sof/imx/imx8m.c              |  4 +---
 sound/soc/sof/imx/imx8ulp.c            |  4 +---
 sound/soc/sof/intel/byt.c              |  4 +---
 sound/soc/sof/intel/hda-dsp.c          |  3 +++
 sound/soc/sof/intel/hda.c              |  4 +---
 sound/soc/sof/intel/hda.h              |  2 +-
 sound/soc/sof/intel/pci-mtl.c          | 31 ++++++++++++++++++++++++++
 sound/soc/sof/ipc4.c                   |  4 ++++
 sound/soc/sof/mediatek/mt8186/mt8186.c |  4 +---
 sound/soc/sof/mediatek/mt8195/mt8195.c |  4 +---
 sound/soc/sof/ops.h                    |  6 ++---
 sound/soc/sof/sof-priv.h               |  2 +-
 15 files changed, 52 insertions(+), 30 deletions(-)

-- 
2.39.2

