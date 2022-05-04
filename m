Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DA9C8519CE9
	for <lists+alsa-devel@lfdr.de>; Wed,  4 May 2022 12:29:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6A145843;
	Wed,  4 May 2022 12:28:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6A145843
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1651660165;
	bh=Zrz9YcxXd/3poJYPmGb3xZOTZn6aFvekakisNlv7INc=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=cfvtdQREfmQVIAgiYxko4GFiQtlGMsV8Ze34zjostBVxcFipqmOBxagkHWrpAUVOf
	 HH6yKDiJuRcIhHvCMFfr/o/sqHVFR4zwFf1SiKGD5v5Q8FtaPMSGOCWuLnVpPkxmV4
	 4E9+zTFzDHRltCXbA9jtVxG+jnJy7twqng9/UZCA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CF83FF800BF;
	Wed,  4 May 2022 12:28:26 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2CCDDF80163; Wed,  4 May 2022 12:28:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id ACD1BF800BF
 for <alsa-devel@alsa-project.org>; Wed,  4 May 2022 12:28:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ACD1BF800BF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="Getms20+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1651660096; x=1683196096;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Zrz9YcxXd/3poJYPmGb3xZOTZn6aFvekakisNlv7INc=;
 b=Getms20+TSwlDeljGX0drkDYXIAzP9pbSXDgjZ68lTCmwYJ9WWo12o4B
 ulmwubIao4i1/fzlFAbz3Ej41920K69r3ZGU8Gna+m2RgeEdknkIlMLva
 wDkZayvnoPXMzG0jDKmtMfzk0KLcXrJWmH4cJXIs7WqN3fm30trflgzaK
 LmYv3vBp1h1Sh/sINjoasni3yte3IBimAkbCA7yK2XUxSU6XS9dnwTW3O
 tTb/p5JaAiLjPrMHoWAkC5tEeBUH1eRi7GODes21culKqJTD3aJYmgs2+
 vo7DWRMglwPsMMGxiUV6QnJFeI3VgGfXWLmd+q6F5KkI2EhFGr1WGCF7F A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10336"; a="248263905"
X-IronPort-AV: E=Sophos;i="5.91,197,1647327600"; d="scan'208";a="248263905"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 May 2022 03:28:10 -0700
X-IronPort-AV: E=Sophos;i="5.91,197,1647327600"; d="scan'208";a="536768385"
Received: from bstach-mobl1.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.251.219.140])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 May 2022 03:28:08 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com, broonie@kernel.org,
 pierre-louis.bossart@linux.intel.com
Subject: [PATCH] ASoC: SOF: ipc3: Remove the ipc3-ops.h header file
Date: Wed,  4 May 2022 13:28:31 +0300
Message-Id: <20220504102831.10071-1-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.36.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: daniel.baluta@nxp.com, alsa-devel@alsa-project.org,
 yung-chuan.liao@linux.intel.com, ranjani.sridharan@linux.intel.com,
 kai.vehmanen@linux.intel.com
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

Only the main IPC ops struct should be visible outside of IPC3 code to make
sure that the code is correctly abstracted.

Instead of keeping the ipc3-ops.h with only the high level ops struct
declaration, put the ipc3_ops to sof-priv.h and move all other ops struct
declaration into ipc3-priv.h

New IPC implementation should follow this route: the main IPC ops should be
declared in sof-priv.h and no other IPC version related header be used
for generic code.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 sound/soc/sof/ipc.c           |  1 -
 sound/soc/sof/ipc3-control.c  |  2 +-
 sound/soc/sof/ipc3-loader.c   |  1 -
 sound/soc/sof/ipc3-ops.h      | 21 ---------------------
 sound/soc/sof/ipc3-pcm.c      |  2 +-
 sound/soc/sof/ipc3-priv.h     |  3 +++
 sound/soc/sof/ipc3-topology.c |  2 +-
 sound/soc/sof/ipc3.c          |  1 -
 sound/soc/sof/sof-priv.h      |  3 +++
 9 files changed, 9 insertions(+), 27 deletions(-)
 delete mode 100644 sound/soc/sof/ipc3-ops.h

diff --git a/sound/soc/sof/ipc.c b/sound/soc/sof/ipc.c
index a6ec4b5a4923..41f3a217be5d 100644
--- a/sound/soc/sof/ipc.c
+++ b/sound/soc/sof/ipc.c
@@ -17,7 +17,6 @@
 #include "sof-priv.h"
 #include "sof-audio.h"
 #include "ops.h"
-#include "ipc3-ops.h"
 
 /**
  * sof_ipc_send_msg - generic function to prepare and send one IPC message
diff --git a/sound/soc/sof/ipc3-control.c b/sound/soc/sof/ipc3-control.c
index 4347adcc6543..3fdc0d854e65 100644
--- a/sound/soc/sof/ipc3-control.c
+++ b/sound/soc/sof/ipc3-control.c
@@ -9,7 +9,7 @@
 
 #include "sof-priv.h"
 #include "sof-audio.h"
-#include "ipc3-ops.h"
+#include "ipc3-priv.h"
 
 /* IPC set()/get() for kcontrols. */
 static int sof_ipc3_set_get_kcontrol_data(struct snd_sof_control *scontrol, bool set)
diff --git a/sound/soc/sof/ipc3-loader.c b/sound/soc/sof/ipc3-loader.c
index 14158c52a2b7..f3c741b49519 100644
--- a/sound/soc/sof/ipc3-loader.c
+++ b/sound/soc/sof/ipc3-loader.c
@@ -9,7 +9,6 @@
 #include "sof-priv.h"
 #include "sof-audio.h"
 #include "ipc3-priv.h"
-#include "ipc3-ops.h"
 #include "ops.h"
 
 static int ipc3_fw_ext_man_get_version(struct snd_sof_dev *sdev,
diff --git a/sound/soc/sof/ipc3-ops.h b/sound/soc/sof/ipc3-ops.h
deleted file mode 100644
index a4784626a3d7..000000000000
--- a/sound/soc/sof/ipc3-ops.h
+++ /dev/null
@@ -1,21 +0,0 @@
-/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-3-Clause) */
-/*
- * This file is provided under a dual BSD/GPLv2 license.  When using or
- * redistributing this file, you may do so under either license.
- *
- * Copyright(c) 2021 Intel Corporation. All rights reserved.
- *
- * Author: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
- */
-
-#ifndef __SOUND_SOC_SOF_IPC3_OPS_H
-#define __SOUND_SOC_SOF_IPC3_OPS_H
-
-#include "sof-priv.h"
-
-extern const struct sof_ipc_tplg_ops ipc3_tplg_ops;
-extern const struct sof_ipc_ops ipc3_ops;
-extern const struct sof_ipc_tplg_control_ops tplg_ipc3_control_ops;
-extern const struct sof_ipc_pcm_ops ipc3_pcm_ops;
-
-#endif
diff --git a/sound/soc/sof/ipc3-pcm.c b/sound/soc/sof/ipc3-pcm.c
index d7b6c67b2180..c8774a891d6f 100644
--- a/sound/soc/sof/ipc3-pcm.c
+++ b/sound/soc/sof/ipc3-pcm.c
@@ -8,7 +8,7 @@
 //
 
 #include <sound/pcm_params.h>
-#include "ipc3-ops.h"
+#include "ipc3-priv.h"
 #include "ops.h"
 #include "sof-priv.h"
 #include "sof-audio.h"
diff --git a/sound/soc/sof/ipc3-priv.h b/sound/soc/sof/ipc3-priv.h
index a9b9201508a5..82f9d0cbfb93 100644
--- a/sound/soc/sof/ipc3-priv.h
+++ b/sound/soc/sof/ipc3-priv.h
@@ -12,6 +12,9 @@
 #include "sof-priv.h"
 
 /* IPC3 specific ops */
+extern const struct sof_ipc_pcm_ops ipc3_pcm_ops;
+extern const struct sof_ipc_tplg_ops ipc3_tplg_ops;
+extern const struct sof_ipc_tplg_control_ops tplg_ipc3_control_ops;
 extern const struct sof_ipc_fw_loader_ops ipc3_loader_ops;
 
 /* helpers for fw_ready and ext_manifest parsing */
diff --git a/sound/soc/sof/ipc3-topology.c b/sound/soc/sof/ipc3-topology.c
index 220ab6c6803f..043554d7cb4a 100644
--- a/sound/soc/sof/ipc3-topology.c
+++ b/sound/soc/sof/ipc3-topology.c
@@ -11,7 +11,7 @@
 #include <sound/pcm_params.h>
 #include "sof-priv.h"
 #include "sof-audio.h"
-#include "ipc3-ops.h"
+#include "ipc3-priv.h"
 #include "ops.h"
 
 /* Full volume for default values */
diff --git a/sound/soc/sof/ipc3.c b/sound/soc/sof/ipc3.c
index efcd201597fa..a8ffc4f99565 100644
--- a/sound/soc/sof/ipc3.c
+++ b/sound/soc/sof/ipc3.c
@@ -12,7 +12,6 @@
 #include "sof-priv.h"
 #include "sof-audio.h"
 #include "ipc3-priv.h"
-#include "ipc3-ops.h"
 #include "ops.h"
 
 typedef void (*ipc3_rx_callback)(struct snd_sof_dev *sdev, void *msg_buf);
diff --git a/sound/soc/sof/sof-priv.h b/sound/soc/sof/sof-priv.h
index a1141ea8d907..4801849cb2ab 100644
--- a/sound/soc/sof/sof-priv.h
+++ b/sound/soc/sof/sof-priv.h
@@ -763,4 +763,7 @@ static inline int sof_resume_clients(struct snd_sof_dev *sdev)
 }
 #endif /* CONFIG_SND_SOC_SOF_CLIENT */
 
+/* Main ops for IPC implementations */
+extern const struct sof_ipc_ops ipc3_ops;
+
 #endif
-- 
2.36.0

