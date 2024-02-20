Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A493485BCD6
	for <lists+alsa-devel@lfdr.de>; Tue, 20 Feb 2024 14:07:39 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5A675BC0;
	Tue, 20 Feb 2024 14:07:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5A675BC0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1708434459;
	bh=PSuwt8gUlDe7NzcuMHOSHhuplX4hK1PW0oy7ABkpxQk=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=Pjm8+hruhYscrIa780t4ZU2oxlfEiC1gET39yYDYz0Mb1ELmVb5QPixE1T0Kz9Uvt
	 9vOjrk3MYQGKUKsF/Jv7D8rXfLQ3zWzOodZEYjFLa2dsf18gV4kukSvhcJ8w5CZZia
	 GIbjVZaPfldheqzVosbsCGMYqthLa+RHo8w7RvPY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3F704F805AD; Tue, 20 Feb 2024 14:07:07 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1E778F8058C;
	Tue, 20 Feb 2024 14:07:07 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0D067F80579; Tue, 20 Feb 2024 14:03:48 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4DAC1F800ED
	for <alsa-devel@alsa-project.org>; Tue, 20 Feb 2024 14:03:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4DAC1F800ED
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=eoNWmD6o
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708434216; x=1739970216;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=PSuwt8gUlDe7NzcuMHOSHhuplX4hK1PW0oy7ABkpxQk=;
  b=eoNWmD6o6PhraXugTDqLOl/IUxHKOcwyzNjuw+Uf6uy+oqoMeNHHc+qR
   L9+HumfFuca+zgGGwJEh/AXNMiDDDQqbv2r5WTHE62yxl7PiLFEIiPY/i
   ABt0KAY+9JvLXDEYzZzz3B7Xa0bzy9MRXCGYxqlKXSjRqkGqWZwehZSm3
   9zNnTl2iymYwk+RsyU+NUhzXppy7HrRKzgmo4+Pj/BBwOZwKNQX3hN05P
   IZZKRdzJcxrmYYb/fUqtXCkZYayk581ruVDxlE8Lm87aRQXWLnTWJvNBA
   NBJ2nG2LN/Qa+uICtkmwrV00dsJvk3f2TrB5wVL0ILrLfCRuHprNO+UEU
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10989"; a="2988913"
X-IronPort-AV: E=Sophos;i="6.06,172,1705392000";
   d="scan'208";a="2988913"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2024 03:49:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,172,1705392000";
   d="scan'208";a="4750929"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
  by fmviesa010.fm.intel.com with ESMTP; 20 Feb 2024 03:49:13 -0800
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org
Cc: alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	tiwai@suse.com,
	perex@perex.cz,
	amadeuszx.slawinski@linux.intel.com,
	pierre-louis.bossart@linux.intel.com,
	hdegoede@redhat.com,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH 00/10] ASoC: Intel: avs: Fixes and new platforms support
Date: Tue, 20 Feb 2024 12:50:25 +0100
Message-Id: <20240220115035.770402-1-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 32LLHK24277QZP6LXXCX4ON3CAGS3TBN
X-Message-ID-Hash: 32LLHK24277QZP6LXXCX4ON3CAGS3TBN
X-MailFrom: cezary.rojewski@intel.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/32LLHK24277QZP6LXXCX4ON3CAGS3TBN/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The avs-driver continues to be utilized on more recent Intel machines.
As TGL-based (cAVS 2.5) e.g.: RPL, inherit most of the functionality
from previous platforms:

SKL <- APL <- CNL <- ICL <- TGL

rather than putting everything into a single file, the platform-specific
bits are split into cnl/icl/tgl.c files instead. Makes the division clear
and code easier to maintain.

Layout of the patchset:

First are two changes combined together address the sound-clipping
problem, present when only one stream is running - specifically one
CAPTURE stream.

Follow up is naming-scheme adjustment for some of the existing functions
what improves code incohesiveness. As existing IPC/IRQ code operates
solely on cAVS 1.5 architecture, it needs no abstraction. The situation
changes when newer platforms come into the picture. Thus the next two
patches abstract the existing IPC/IRQ handlers so that majority of the
common code can be re-used.

The ICCMAX change stands out a bit - the AudioDSP firmware loading
procedure differs on ICL-based platforms (and onwards) and having a
separate commit makes the situation clear to the developers who are
going to support the solution from LTS perspective. For that reason
I decided not to merge it into the commit introducing the icl.c file.

Cezary Rojewski (10):
  ASoC: Intel: avs: L1SEN reference counted
  ASoC: Intel: avs: Fix sound clipping in single capture scenario
  ASoC: Intel: avs: Prefix SKL/APL-specific members
  ASoC: Intel: avs: Abstract IPC handling
  ASoC: Intel: avs: Abstract IRQ handling
  ASoC: Intel: avs: CNL-based platforms support
  ASoC: Intel: avs: ICL-based platforms support
  ASoC: Intel: avs: TGL-based platforms support
  ASoC: Intel: avs: ICCMAX recommendations for ICL+ platforms
  ASoC: Intel: avs: Populate board selection with new I2S entries

 include/sound/hda_register.h          |   2 +
 sound/soc/intel/avs/Makefile          |   2 +-
 sound/soc/intel/avs/apl.c             |  58 ++++----
 sound/soc/intel/avs/avs.h             |  66 ++++++---
 sound/soc/intel/avs/board_selection.c |  85 +++++++++++
 sound/soc/intel/avs/cnl.c             |  61 ++++++++
 sound/soc/intel/avs/core.c            | 160 ++++++++++++++++++---
 sound/soc/intel/avs/icl.c             | 197 ++++++++++++++++++++++++++
 sound/soc/intel/avs/ipc.c             |  66 +++------
 sound/soc/intel/avs/loader.c          |   2 +-
 sound/soc/intel/avs/messages.c        |   1 +
 sound/soc/intel/avs/messages.h        |  38 ++++-
 sound/soc/intel/avs/pcm.c             |  77 +++++++++-
 sound/soc/intel/avs/registers.h       |  21 ++-
 sound/soc/intel/avs/skl.c             |  59 +++++---
 sound/soc/intel/avs/tgl.c             |  54 +++++++
 16 files changed, 807 insertions(+), 142 deletions(-)
 create mode 100644 sound/soc/intel/avs/cnl.c
 create mode 100644 sound/soc/intel/avs/icl.c
 create mode 100644 sound/soc/intel/avs/tgl.c

-- 
2.25.1

