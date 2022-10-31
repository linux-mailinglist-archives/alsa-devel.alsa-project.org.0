Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D71AC613411
	for <lists+alsa-devel@lfdr.de>; Mon, 31 Oct 2022 11:55:50 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 713D3166A;
	Mon, 31 Oct 2022 11:55:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 713D3166A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1667213750;
	bh=UC5mDH+uEgevyO8fmL3/GjnP3isreYyN/UK7jN0m8kQ=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=N2Ddt7ZF3d1OBkbnTVFlzhou6T3Hary88g1r8k2/9y2oQYgnyhjSITJkvVcOURb/Q
	 XDSuQ8WNf9/NAVQCiiuGI8xUug/wDrbx6+jvoRmUzg1gQd5MoMdrslTzAAo5/daGXK
	 nBxV+No3UN7OYYq2x1MwzqBV0wlBX3RbEJQQOt1c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9DEC1F80551;
	Mon, 31 Oct 2022 11:54:36 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D2C3AF80549; Mon, 31 Oct 2022 11:54:34 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3DF6EF800F3
 for <alsa-devel@alsa-project.org>; Mon, 31 Oct 2022 11:54:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3DF6EF800F3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="Mq2cSYKS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1667213669; x=1698749669;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=UC5mDH+uEgevyO8fmL3/GjnP3isreYyN/UK7jN0m8kQ=;
 b=Mq2cSYKSlz+Oyb3wdIF4d/KLm7ezBFbr+Cx7SHvUgL/MtIV/8ZIzEqrS
 nvPdwkgwjYXB6miU7Or8j/+ZTP0y16h+UVx4QBFn8s0N/A0Ej+rvbFV83
 H3zcEQ0Jt0BpjoB/JsgEeyXXNVPVZlMJDBtiLKIKg98WcVUXrLjhEqA2P
 +gV7iUjkKXp3J8X6H88gr+GVGLGZeynxgr9Iiq7SJ9i6op208vnoAobxr
 zoDF05lTMxyqM6aoLjDgycUqlucm/mnhZwDXBnRah7Vq3HPbbQ0w6kQpo
 bs0Zu/62VbLJNAjImKDO0uIRFiQoSUUTVEFF0ajxKqQLydxUk0yunQXV1 g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10516"; a="308868383"
X-IronPort-AV: E=Sophos;i="5.95,227,1661842800"; d="scan'208";a="308868383"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2022 03:51:18 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10516"; a="633487945"
X-IronPort-AV: E=Sophos;i="5.95,227,1661842800"; d="scan'208";a="633487945"
Received: from vbhutani-mobl2.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.252.13.109])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2022 03:51:16 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	jyri.sarha@intel.com
Subject: [PATCH 1/5] ASoC: SOF: probes: Replace [0] union members with
 DECLARE_FLEX_ARRAY()
Date: Mon, 31 Oct 2022 12:51:37 +0200
Message-Id: <20221031105141.19037-2-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221031105141.19037-1-peter.ujfalusi@linux.intel.com>
References: <20221031105141.19037-1-peter.ujfalusi@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, pierre-louis.bossart@linux.intel.com,
 kai.vehmanen@linux.intel.com, ranjani.sridharan@linux.intel.com
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

From: Jyri Sarha <jyri.sarha@intel.com>

Replace probes related [0] arrays, all found within unions, with
DECLARE_FLEX_ARRAY() declarations.

Signed-off-by: Jyri Sarha <jyri.sarha@intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/sof/sof-client-probes.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/sound/soc/sof/sof-client-probes.c b/sound/soc/sof/sof-client-probes.c
index ddeabbb5580e..e767e53f53d1 100644
--- a/sound/soc/sof/sof-client-probes.c
+++ b/sound/soc/sof/sof-client-probes.c
@@ -13,6 +13,7 @@
 #include <linux/module.h>
 #include <linux/pm_runtime.h>
 #include <linux/string_helpers.h>
+#include <linux/stddef.h>
 
 #include <sound/soc.h>
 #include <sound/sof/header.h>
@@ -59,8 +60,8 @@ struct sof_ipc_probe_info_params {
 	struct sof_ipc_reply rhdr;
 	unsigned int num_elems;
 	union {
-		struct sof_probe_dma dma[0];
-		struct sof_probe_point_desc desc[0];
+		DECLARE_FLEX_ARRAY(struct sof_probe_dma, dma);
+		DECLARE_FLEX_ARRAY(struct sof_probe_point_desc, desc);
 	};
 } __packed;
 
-- 
2.38.1

