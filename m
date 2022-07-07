Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C096956A20C
	for <lists+alsa-devel@lfdr.de>; Thu,  7 Jul 2022 14:34:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 536CC15CA;
	Thu,  7 Jul 2022 14:33:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 536CC15CA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657197240;
	bh=T2E0Q5fFnkdrzMkBZrVO1W+FKXmZjaVF5kOzboU7Is8=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dW8pQnlP+dZu+WGoBQoOgYFa09FoLwJVCHNcGps3zkbFdNwzZfWc82FicDum9WrEN
	 F4tH5z+98X2HuQBvGXuC7NkWRreL+D+Q70zlkRRemcvVjlMs5hH7pVPRYKxsoMK/TF
	 wtUa9yJNvZj/exAtSj00xzkx0P7xSiXAdrox3Zuk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DE9AFF80543;
	Thu,  7 Jul 2022 14:32:08 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 872B1F800DF; Thu,  7 Jul 2022 14:32:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C9AADF800DF
 for <alsa-devel@alsa-project.org>; Thu,  7 Jul 2022 14:31:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C9AADF800DF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="mzF8mQpx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1657197119; x=1688733119;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=T2E0Q5fFnkdrzMkBZrVO1W+FKXmZjaVF5kOzboU7Is8=;
 b=mzF8mQpxoLWm4yORtmr/TFncpxawIYVG6/6aZZyAqcuV5YuJ8ZnMbVk2
 LygaSO3LLCw4oebvha6zpGgXb2bbx8H+cJp93LoGPlNGXAvwG1jqVCRgw
 5mHsx9hbiD2xVVFa9fdWeZ1RObUDmoe2EG7ln5MA2UVv+JOfQSmmusTmA
 atEKbAMVUVb85nDpxuUF2M8nfYvxAL0m+km4Dr7rXJEjRB/H2c4Jpn6ZY
 tU0CAV68cPeUrHM0rNzEUxADywOAuX8Pr/zgugGEjoq9ocsaTwhgoaJC7
 UXZC/6vQlu3rr0dPmkLt5xViQUv129/jgRcByi6asp6KWTj26XL80pnJ0 g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10400"; a="272805907"
X-IronPort-AV: E=Sophos;i="5.92,252,1650956400"; d="scan'208";a="272805907"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2022 05:31:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,252,1650956400"; d="scan'208";a="593720576"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by orsmga002.jf.intel.com with ESMTP; 07 Jul 2022 05:31:54 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Subject: [PATCH 04/12] ASoC: Intel: avs: Copy only as many RX bytes as
 necessary
Date: Thu,  7 Jul 2022 14:41:45 +0200
Message-Id: <20220707124153.1858249-5-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220707124153.1858249-1-cezary.rojewski@intel.com>
References: <20220707124153.1858249-1-cezary.rojewski@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
 pierre-louis.bossart@linux.intel.com, tiwai@suse.com, hdegoede@redhat.com,
 amadeuszx.slawinski@linux.intel.com
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

There is no need to copy number of bytes specified by IPC message caller
if DSP firmware returned lower number. In consequence, LARGE_CONFIG_GET
handler is simplified.

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/avs/ipc.c      | 1 +
 sound/soc/intel/avs/messages.c | 6 ++----
 2 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/sound/soc/intel/avs/ipc.c b/sound/soc/intel/avs/ipc.c
index d755ba8b8518..020d85c7520d 100644
--- a/sound/soc/intel/avs/ipc.c
+++ b/sound/soc/intel/avs/ipc.c
@@ -480,6 +480,7 @@ static int avs_dsp_do_send_msg(struct avs_dev *adev, struct avs_ipc_msg *request
 	ret = ipc->rx.rsp.status;
 	if (reply) {
 		reply->header = ipc->rx.header;
+		reply->size = ipc->rx.size;
 		if (reply->data && ipc->rx.size)
 			memcpy(reply->data, ipc->rx.data, reply->size);
 	}
diff --git a/sound/soc/intel/avs/messages.c b/sound/soc/intel/avs/messages.c
index 6404fce8cde4..3559fb496e0b 100644
--- a/sound/soc/intel/avs/messages.c
+++ b/sound/soc/intel/avs/messages.c
@@ -378,7 +378,6 @@ int avs_ipc_get_large_config(struct avs_dev *adev, u16 module_id, u8 instance_id
 	union avs_module_msg msg = AVS_MODULE_REQUEST(LARGE_CONFIG_GET);
 	struct avs_ipc_msg request;
 	struct avs_ipc_msg reply = {{0}};
-	size_t size;
 	void *buf;
 	int ret;
 
@@ -406,15 +405,14 @@ int avs_ipc_get_large_config(struct avs_dev *adev, u16 module_id, u8 instance_id
 		return ret;
 	}
 
-	size = reply.rsp.ext.large_config.data_off_size;
-	buf = krealloc(reply.data, size, GFP_KERNEL);
+	buf = krealloc(reply.data, reply.size, GFP_KERNEL);
 	if (!buf) {
 		kfree(reply.data);
 		return -ENOMEM;
 	}
 
 	*reply_data = buf;
-	*reply_size = size;
+	*reply_size = reply.size;
 
 	return 0;
 }
-- 
2.25.1

