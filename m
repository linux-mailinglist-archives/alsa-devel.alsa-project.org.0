Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C07B96C7506
	for <lists+alsa-devel@lfdr.de>; Fri, 24 Mar 2023 02:31:05 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3F0EAECF;
	Fri, 24 Mar 2023 02:30:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3F0EAECF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1679621465;
	bh=gcQ6UQrUlVVTApT6cZ2UZ1sHzf5CgvGiFtKMcNWJAD4=;
	h=From:To:Subject:Date:CC:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=Zv4fUv98oc2wZrJyRxe7enDCvey4w/ge8uvIpNoa22LnCv1fLY+NHwmd1uJ3Rr4om
	 nKWCvWbkDSxK0ayFl/i0MomDZ/S0nPJ/AkRpSTR1zCOpIjAFDZed8td1alzDAWyKnk
	 acO4AhnhWEsxp8FJzotKnKQBqdpIL7QXMd0pO1SE=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3C0FFF80542;
	Fri, 24 Mar 2023 02:29:24 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5ED0CF8052E; Fri, 24 Mar 2023 02:29:15 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H2,
	SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED shortcircuit=no
	autolearn=unavailable autolearn_force=no version=3.4.6
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7F85BF80093
	for <alsa-devel@alsa-project.org>; Fri, 24 Mar 2023 02:28:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7F85BF80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=JUJDiXcC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679621339; x=1711157339;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=gcQ6UQrUlVVTApT6cZ2UZ1sHzf5CgvGiFtKMcNWJAD4=;
  b=JUJDiXcC25GZTd8q0kxVe+j2EM74K6j0zlMPyIbFGY4cVX5JQbQs5PZN
   ElOpa9vBxuDpaRhkEMLvlA5vz6UbuU2Mx/nqxodUDcwcqARJZ6PO/Z756
   E3z1jhR/x50EZKYojbkQWns25UtpR+M3jshLhR4J8iCK6jc+39BdZdTdA
   zQMTiBPco2IBCnroOgPnSLSwnFok71+/zgtLCfmsssxLikb8Z/vwCaxnV
   GQnCAwz+M0w0XF5IVrtYiHxMVXl4/szQIELSt2NMvUW9agBEfVSMCVxvO
   HgLbYUoYNHl928JklTrZFM/z1KreUn9q2xNFbdvBire/gddZg1sJTZbAs
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10658"; a="404584840"
X-IronPort-AV: E=Sophos;i="5.98,286,1673942400";
   d="scan'208";a="404584840"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2023 18:28:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10658"; a="659872985"
X-IronPort-AV: E=Sophos;i="5.98,286,1673942400";
   d="scan'208";a="659872985"
Received: from bard-ubuntu.sh.intel.com ([10.239.185.57])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2023 18:28:51 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Subject: [PATCH 00/13] ASoC: SoundWire codecs: simplify/fix set_stream
Date: Fri, 24 Mar 2023 09:43:55 +0800
Message-Id: <20230324014408.1677505-1-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: PPMZPGTYNOVS5KTFECV7V6YYGZ55MGYU
X-Message-ID-Hash: PPMZPGTYNOVS5KTFECV7V6YYGZ55MGYU
X-MailFrom: yung-chuan.liao@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, pierre-louis.bossart@linux.intel.com,
 vkoul@kernel.org, bard.liao@intel.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/PPMZPGTYNOVS5KTFECV7V6YYGZ55MGYU/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Simplify set_stream in SoundWire codecs.

Pierre-Louis Bossart (13):
  ASoC: codecs: cs42l42-sdw: clear stream
  ASoC: codecs: sdw-mockup: simplify set_stream
  ASoC: codecs: max98373-sdw: simplify set_stream
  ASoC: codecs: rt1308-sdw: simplify set_stream
  ASoC: codecs: rt1316-sdw: simplify set_stream
  ASoC: codecs: rt1318-sdw: simplify set_stream
  ASoC: codecs: rt700-sdw: simplify set_stream
  ASoC: codecs: rt711-sdw: simplify set_stream
  ASoC: codecs: rt711-sdca: simplify set_stream
  ASoC: codecs: rt712-sdca: simplify set_stream
  ASoC: codecs: rt715: simplify set_stream
  ASoC: codecs: rt715-sdca: simplify set_stream
  ASoC: codecs: rt5682-sdw: simplify set_stream

 sound/soc/codecs/cs42l42-sdw.c  |  3 ---
 sound/soc/codecs/max98373-sdw.c | 34 +++++++--------------------------
 sound/soc/codecs/rt1308-sdw.c   | 30 +++++++----------------------
 sound/soc/codecs/rt1308-sdw.h   |  4 ----
 sound/soc/codecs/rt1316-sdw.c   | 30 +++++++----------------------
 sound/soc/codecs/rt1316-sdw.h   |  4 ----
 sound/soc/codecs/rt1318-sdw.c   | 30 +++++++----------------------
 sound/soc/codecs/rt1318-sdw.h   |  4 ----
 sound/soc/codecs/rt5682-sdw.c   | 34 +++++++--------------------------
 sound/soc/codecs/rt700.c        | 30 +++++++----------------------
 sound/soc/codecs/rt700.h        |  4 ----
 sound/soc/codecs/rt711-sdca.c   | 30 +++++++----------------------
 sound/soc/codecs/rt711-sdca.h   |  4 ----
 sound/soc/codecs/rt711.c        | 30 +++++++----------------------
 sound/soc/codecs/rt711.h        |  4 ----
 sound/soc/codecs/rt712-sdca.c   | 30 +++++++----------------------
 sound/soc/codecs/rt712-sdca.h   |  4 ----
 sound/soc/codecs/rt715-sdca.c   | 30 +++++++----------------------
 sound/soc/codecs/rt715-sdca.h   |  4 ----
 sound/soc/codecs/rt715.c        | 30 +++++++----------------------
 sound/soc/codecs/rt715.h        |  4 ----
 sound/soc/codecs/sdw-mockup.c   | 34 ++++++---------------------------
 22 files changed, 83 insertions(+), 328 deletions(-)

-- 
2.25.1

