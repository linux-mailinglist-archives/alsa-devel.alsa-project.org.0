Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 68166509A3A
	for <lists+alsa-devel@lfdr.de>; Thu, 21 Apr 2022 10:09:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 16BFF189D;
	Thu, 21 Apr 2022 10:09:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 16BFF189D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1650528597;
	bh=qUYOKsebMFguufgi4WAPHyB3Ulr8kj3Ba2P/I08SErY=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=lombfSmzbIpy229i3h3llQDji4TzpFZdEEw8WMEQhdIKSdgN5BZXFDizxLtmAGKqm
	 tCrNwBx71zmMjl1OKTAIqjmqvOZGT6Kfkpv1uLBp+FDC/vDdtGLBIuua6ZR5NeJoH/
	 2aDUPglB93/CGFqG0qVIR888Xu+g6VSuPe5xFjSY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 64ABAF80535;
	Thu, 21 Apr 2022 10:07:38 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7AD31F80534; Thu, 21 Apr 2022 10:07:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 43632F80516
 for <alsa-devel@alsa-project.org>; Thu, 21 Apr 2022 10:07:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 43632F80516
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="WoTyheFx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1650528451; x=1682064451;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=qUYOKsebMFguufgi4WAPHyB3Ulr8kj3Ba2P/I08SErY=;
 b=WoTyheFxiKUYNNwDGK1DCPw+LExQmZGXqElxidecZFHrKHmrRnO00ZUD
 NN7talP34XVt56br/hw71NzsF5XFL30eLckOBlUMQ25jSDfJwnin9IuoD
 jJ0Ym4XTVxGjduPwS/vrlBZr/8NPjXP6gnD2yXusKqngujZpLo7YCT3OA
 tj56iQDp2mjAZgzPkt7df/lbICXLNu0eYbycHBKmO8S4XBUsl9myoHCOz
 NLl6pHHeFIuYQaiUtIVAZypnw8FGy3KnNag6hAGhREB7mPVrLDRQ+G3SJ
 pjMFHEojY/4o++pLW2T7J59M3JG8ouey5IZBZNcvD5/EkXB9edY2SKm+W Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10323"; a="324718797"
X-IronPort-AV: E=Sophos;i="5.90,278,1643702400"; d="scan'208";a="324718797"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2022 01:07:28 -0700
X-IronPort-AV: E=Sophos;i="5.90,278,1643702400"; d="scan'208";a="577087149"
Received: from dchirca-mobl4.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.251.215.207])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2022 01:07:25 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com, broonie@kernel.org,
 pierre-louis.bossart@linux.intel.com, AjitKumar.Pandey@amd.com,
 daniel.baluta@nxp.com
Subject: [PATCH 5/6] ASoC: SOF: Intel: Do not set fw_ready callback
Date: Thu, 21 Apr 2022 11:07:34 +0300
Message-Id: <20220421080735.31698-6-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220421080735.31698-1-peter.ujfalusi@linux.intel.com>
References: <20220421080735.31698-1-peter.ujfalusi@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, ranjani.sridharan@linux.intel.com,
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

The fw_ready is handled internally to ipc3 and the callback no longer in
use.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Ajit Pandey <ajitkumar.pandey@amd.com>
Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
---
 sound/soc/sof/intel/bdw.c            | 1 -
 sound/soc/sof/intel/byt.c            | 2 --
 sound/soc/sof/intel/hda-common-ops.c | 1 -
 sound/soc/sof/intel/pci-tng.c        | 1 -
 4 files changed, 5 deletions(-)

diff --git a/sound/soc/sof/intel/bdw.c b/sound/soc/sof/intel/bdw.c
index 73a20172bf77..c0a1d4ae8c68 100644
--- a/sound/soc/sof/intel/bdw.c
+++ b/sound/soc/sof/intel/bdw.c
@@ -591,7 +591,6 @@ static struct snd_sof_dsp_ops sof_bdw_ops = {
 
 	/* ipc */
 	.send_msg	= bdw_send_msg,
-	.fw_ready	= sof_fw_ready,
 	.get_mailbox_offset = bdw_get_mailbox_offset,
 	.get_window_offset = bdw_get_window_offset,
 
diff --git a/sound/soc/sof/intel/byt.c b/sound/soc/sof/intel/byt.c
index 08376e8fdc61..0fd5edb1bdbc 100644
--- a/sound/soc/sof/intel/byt.c
+++ b/sound/soc/sof/intel/byt.c
@@ -245,7 +245,6 @@ static struct snd_sof_dsp_ops sof_byt_ops = {
 
 	/* ipc */
 	.send_msg	= atom_send_msg,
-	.fw_ready	= sof_fw_ready,
 	.get_mailbox_offset = atom_get_mailbox_offset,
 	.get_window_offset = atom_get_window_offset,
 
@@ -328,7 +327,6 @@ static struct snd_sof_dsp_ops sof_cht_ops = {
 
 	/* ipc */
 	.send_msg	= atom_send_msg,
-	.fw_ready	= sof_fw_ready,
 	.get_mailbox_offset = atom_get_mailbox_offset,
 	.get_window_offset = atom_get_window_offset,
 
diff --git a/sound/soc/sof/intel/hda-common-ops.c b/sound/soc/sof/intel/hda-common-ops.c
index 257eace4a563..b2326396c870 100644
--- a/sound/soc/sof/intel/hda-common-ops.c
+++ b/sound/soc/sof/intel/hda-common-ops.c
@@ -34,7 +34,6 @@ struct snd_sof_dsp_ops sof_hda_common_ops = {
 	.mailbox_write	= sof_mailbox_write,
 
 	/* ipc */
-	.fw_ready	= sof_fw_ready,
 	.get_mailbox_offset = hda_dsp_ipc_get_mailbox_offset,
 	.get_window_offset = hda_dsp_ipc_get_window_offset,
 
diff --git a/sound/soc/sof/intel/pci-tng.c b/sound/soc/sof/intel/pci-tng.c
index 14f11528f069..f1aae9667834 100644
--- a/sound/soc/sof/intel/pci-tng.c
+++ b/sound/soc/sof/intel/pci-tng.c
@@ -164,7 +164,6 @@ struct snd_sof_dsp_ops sof_tng_ops = {
 
 	/* ipc */
 	.send_msg	= atom_send_msg,
-	.fw_ready	= sof_fw_ready,
 	.get_mailbox_offset = atom_get_mailbox_offset,
 	.get_window_offset = atom_get_window_offset,
 
-- 
2.35.3

