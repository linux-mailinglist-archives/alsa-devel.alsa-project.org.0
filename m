Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F4473143B1
	for <lists+alsa-devel@lfdr.de>; Tue,  9 Feb 2021 00:26:05 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9721016B0;
	Tue,  9 Feb 2021 00:25:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9721016B0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1612826764;
	bh=TFQiXPSankAwSS8DA04/59zaydqTzWqf6yIR6B04/Ec=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=h+n88tiTE7RDgoXac+d3C3enP/W++gzX/80EyXamyAAtOkjlmBUdAt8r6u1iv/0g2
	 24W5ExipS+T6ladVu0mVR9uNqBWqhatDI7ILeRGa7t8VHWwLRRJMf4lDn/J6jlvNNo
	 PSG5ji1XIDt02k8eNcqehIqQP4yNk24q1yRQcxjw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 71113F80240;
	Tue,  9 Feb 2021 00:23:49 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E95CDF8028B; Tue,  9 Feb 2021 00:23:47 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 16C58F80240
 for <alsa-devel@alsa-project.org>; Tue,  9 Feb 2021 00:23:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 16C58F80240
IronPort-SDR: 9tP5bqo4C56OGRRro2uWskG5UXCXcfudDs/oRvBFlaoTPVaDh6ytggcgrGXlFXKs2XO/e9+AFx
 aJ7j2xmroLHA==
X-IronPort-AV: E=McAfee;i="6000,8403,9889"; a="243295587"
X-IronPort-AV: E=Sophos;i="5.81,163,1610438400"; d="scan'208";a="243295587"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Feb 2021 15:22:16 -0800
IronPort-SDR: tDKVb/LPrsOuCRZ/orn9fqpTHSNkwBWzqVmghl56dbD2OLQwPLjK9f8fguzdeHquncEU+nvMF5
 mHxyZBGJ2zmg==
X-IronPort-AV: E=Sophos;i="5.81,163,1610438400"; d="scan'208";a="585854674"
Received: from pmane-mobl.amr.corp.intel.com (HELO pbossart-mobl3.intel.com)
 ([10.209.145.183])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Feb 2021 15:22:15 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 1/5] ASoC: SOF: add missing pm debug
Date: Mon,  8 Feb 2021 17:21:45 -0600
Message-Id: <20210208232149.58899-2-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210208232149.58899-1-pierre-louis.bossart@linux.intel.com>
References: <20210208232149.58899-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, Curtis Malainey <cujomalainey@chromium.org>,
 broonie@kernel.org, Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
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

From: Curtis Malainey <cujomalainey@chromium.org>

Type is not part of debugging parse code. Add it so unknown types don't
show up while debugging

Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Curtis Malainey <cujomalainey@chromium.org>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/ipc.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/soc/sof/ipc.c b/sound/soc/sof/ipc.c
index fc13bb06dbf3..1bc3d6282f16 100644
--- a/sound/soc/sof/ipc.c
+++ b/sound/soc/sof/ipc.c
@@ -106,6 +106,8 @@ static void ipc_log_header(struct device *dev, u8 *text, u32 cmd)
 			str2 = "CLK_REQ"; break;
 		case SOF_IPC_PM_CORE_ENABLE:
 			str2 = "CORE_ENABLE"; break;
+		case SOF_IPC_PM_GATE:
+			str2 = "GATE"; break;
 		default:
 			str2 = "unknown type"; break;
 		}
-- 
2.25.1

