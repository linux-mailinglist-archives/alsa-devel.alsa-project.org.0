Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 52C36253776
	for <lists+alsa-devel@lfdr.de>; Wed, 26 Aug 2020 20:47:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DC71D1795;
	Wed, 26 Aug 2020 20:46:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DC71D1795
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1598467653;
	bh=EJzvZi9Tib+4BBvmAWvZNL6vX6Cmhm2lOpgoeDwYNrQ=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=B2gSxOrVG7Tr7jSQKaZr6Lj9Jekw02jAnknpi9QDvQHmpMKSNesTYZfJmuNSFKNKb
	 sW++DmKrd08Yyj06lnXo+oWkSQgb4eTpw95PR/MoilZR3pBQsE9sgkn1ot+p7hxgPn
	 XjsULF0edDk5EIl0fMA+Zl11KgRIuaYuGKd1Ug/k=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A1CF9F802C2;
	Wed, 26 Aug 2020 20:45:52 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1715AF8020C; Wed, 26 Aug 2020 20:45:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5C6E7F80105
 for <alsa-devel@alsa-project.org>; Wed, 26 Aug 2020 20:45:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5C6E7F80105
IronPort-SDR: hX22tD1W3S7hOFrvGI9e1mDqcmXpwmXmZNAiRaAFZ8N0rFz+0Eikb8Qe3X21G8uRr3OVMMZ4IY
 UxYjkuobtXSw==
X-IronPort-AV: E=McAfee;i="6000,8403,9725"; a="174418606"
X-IronPort-AV: E=Sophos;i="5.76,356,1592895600"; d="scan'208";a="174418606"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2020 11:45:41 -0700
IronPort-SDR: mtOjzStZGBHF3EUILItc9Wp8+w5NTTx4679DMkjVmVvHzAxBbhrdYS0C5LO+SypxqA8oJpmT2Y
 zQtL+ea46Ueg==
X-IronPort-AV: E=Sophos;i="5.76,356,1592895600"; d="scan'208";a="500347320"
Received: from sghoshal-mobl.amr.corp.intel.com (HELO localhost.localdomain)
 ([10.209.145.101])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2020 11:45:41 -0700
From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 0/8] SOF fixes and updates for FW boot
Date: Wed, 26 Aug 2020 11:45:24 -0700
Message-Id: <20200826184532.1612070-1-ranjani.sridharan@linux.intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, broonie@kernel.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
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

This series includes fixes and updates for the FW boot sequence for
Intel platforms.

Ranjani Sridharan (7):
  ALSA: hda: fix VS_LTRC register name
  ASoC: SOF: Intel: hda: Add helper function to program ICCMAX stream
  ASoC: SOF: Intel: hda: modify the signature of get_stream_with_tag()
  ASoC: SOF: Intel: hda: define macro for code loader stream format
  ASoC: SOF: Intel: hda: Define FW boot sequence with ICCMAX
  ASoC: SOF: Intel: hda: Add sof_tgl_ops for TGL platforms
  ASoC: SOF: Intel: hda: Simplify error handling during FW boot

Yong Zhi (1):
  ASoC: SOF: Intel: hda: Remove unused parameters in cl_dsp_init()

 include/sound/hda_register.h     |   2 +-
 sound/soc/sof/intel/Makefile     |   2 +-
 sound/soc/sof/intel/cnl.c        |  23 +----
 sound/soc/sof/intel/hda-ipc.h    |   4 +
 sound/soc/sof/intel/hda-loader.c | 145 ++++++++++++++++++-------------
 sound/soc/sof/intel/hda-stream.c |  69 +++++++++++++++
 sound/soc/sof/intel/hda.h        |   6 ++
 sound/soc/sof/intel/tgl.c        | 137 +++++++++++++++++++++++++++++
 sound/soc/sof/sof-pci-dev.c      |   2 +-
 9 files changed, 306 insertions(+), 84 deletions(-)
 create mode 100644 sound/soc/sof/intel/tgl.c

-- 
2.25.1

