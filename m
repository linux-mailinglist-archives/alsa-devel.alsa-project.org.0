Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A67692C699D
	for <lists+alsa-devel@lfdr.de>; Fri, 27 Nov 2020 17:44:37 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3FB881854;
	Fri, 27 Nov 2020 17:43:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3FB881854
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1606495477;
	bh=NLzG1tJLKRancqNaNjIvyTPlRobpmcwTLHYZc2OIs+k=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=iGdy3qCNEDA1HgasHHElcTaC9x5wGrRoJeUo66/ParnMYPRjxcVejMIyiwc0j+OvB
	 r+mozVXJxLKvPhtKS5kbbhdX3oI5oeBdpZe4GafBgFFu7bpBQlODZgeo5SikISMFnf
	 rW5jcCMsbiwL9RIGQh+64Pbc+IYblM21v020k3Zo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B9364F80269;
	Fri, 27 Nov 2020 17:43:02 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1FAD8F80255; Fri, 27 Nov 2020 17:43:00 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H4,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 43764F800E0
 for <alsa-devel@alsa-project.org>; Fri, 27 Nov 2020 17:42:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 43764F800E0
IronPort-SDR: Rs1r/TcWjtiOFXw6stt239/ILYvijv1/z6xN2TRiNq4CKHPP+CryqnIoo5w3H7nwTXnYAQaHUe
 Ytqci+/itIwQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9818"; a="234020260"
X-IronPort-AV: E=Sophos;i="5.78,375,1599548400"; d="scan'208";a="234020260"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2020 08:42:50 -0800
IronPort-SDR: 9D73Z9X4ravdgeeixpZ/WI+4sYTjansCrWHAGrz/yufLAbAFzxy4RSNznPyUGTSQnrl1+qRXXF
 TwhX/DMf8ujw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,375,1599548400"; d="scan'208";a="403933339"
Received: from eliteleevi.tm.intel.com ([10.237.54.20])
 by orsmga001.jf.intel.com with ESMTP; 27 Nov 2020 08:42:48 -0800
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Subject: [PATCH 0/5] ASoC: SOF: Intel: fix ICL boot sequence
Date: Fri, 27 Nov 2020 18:40:17 +0200
Message-Id: <20201127164022.2498406-1-kai.vehmanen@linux.intel.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: lgirdwood@gmail.com, daniel.baluta@nxp.com,
 pierre-louis.bossart@linux.intel.com, kai.vehmanen@linux.intel.com,
 ranjani.sridharan@linux.intel.com
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Series introducing a modified boot sequence for the Intel Ice Lake
platform. While no bugs are currently open for this, the current
DSP boot implementation does not follow the full programming sequence.

This patchset is the first instance where SOF driver uses data in
the extended manifest (part of the firmware binary), to influence
the boot process. IPC cannot be used to get this information, as it
is already needed for early boot.

This change is backwards compatible with old firmware versions,
where extended manifest is not available.

Fred Oh (5):
  ASoC: SOF: ops: add parse_platform_ext_manifest() op
  ASoC: SOF: Intel: hda: define parse_platform_ext_manifest op
  ASoC: SOF: ext_manifest: parse cavs extra config data elem
  ASoC: SOF: ops: modify the signature of stall op
  ASoC: SOF: Intel: hda: add sof_icl_ops for ICL platforms

 include/sound/sof/ext_manifest.h   |   1 +
 sound/soc/sof/intel/Makefile       |   2 +-
 sound/soc/sof/intel/apl.c          |   3 +
 sound/soc/sof/intel/cnl.c          |  19 +---
 sound/soc/sof/intel/ext_manifest.h |  35 +++++++
 sound/soc/sof/intel/hda-loader.c   | 100 ++++++++++++++++++++
 sound/soc/sof/intel/hda.h          |  11 +++
 sound/soc/sof/intel/icl.c          | 145 +++++++++++++++++++++++++++++
 sound/soc/sof/intel/tgl.c          |   3 +
 sound/soc/sof/loader.c             |   3 +
 sound/soc/sof/ops.h                |  14 ++-
 sound/soc/sof/sof-pci-dev.c        |   2 +-
 sound/soc/sof/sof-priv.h           |   7 +-
 13 files changed, 324 insertions(+), 21 deletions(-)
 create mode 100644 sound/soc/sof/intel/ext_manifest.h
 create mode 100644 sound/soc/sof/intel/icl.c

-- 
2.28.0

