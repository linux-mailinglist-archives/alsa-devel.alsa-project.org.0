Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D810605FE8
	for <lists+alsa-devel@lfdr.de>; Thu, 20 Oct 2022 14:15:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F3FC04994;
	Thu, 20 Oct 2022 14:14:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F3FC04994
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666268148;
	bh=R8JozkiKpCIDL6DTAfnCV94Gczf2QS9j/Vvdd+j3VKk=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Immd4fObHlvECL9tcU4dXf+7jpMKEk4sj3HoquxDdT0C5ftGKFfE5ksQNbnHdfgw0
	 ojt5mXDucHHy16n35jhO6PcSbIQPEy4gS0aPjTyZuBBRjUlZGvPhaRUNrGtFDinTI+
	 fubOYflO6bnj4YYPJruNBJNuh+1TwZzEl1gEYTYQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 43577F805A1;
	Thu, 20 Oct 2022 14:12:49 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DC5E3F8059F; Thu, 20 Oct 2022 14:12:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6419DF80564
 for <alsa-devel@alsa-project.org>; Thu, 20 Oct 2022 14:12:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6419DF80564
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="PngyoSAQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666267962; x=1697803962;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=R8JozkiKpCIDL6DTAfnCV94Gczf2QS9j/Vvdd+j3VKk=;
 b=PngyoSAQtrUhzMGrSJzMGlltfwO+LXyCe3tk5hAUOukPWi4OKFh1t8qM
 2f37X3APDzzIe/aO86xYzfv+Nw6MPWuP0YLaOBWwQ0BwIisU/eu+1H14R
 pbYA5ZTgnNyYlqttHReyo35LSwgTJ0XwYenAEKvPzBhJ1rjNctO3u3i60
 hlRNxW55yzrxB9lPX+9fRwd6/CLiibCNnEaVcMrmV8UuSMHkwdgcoN8BI
 xiTsxBIL/QL0gnlYNIM+orD1Z1xZcqBqzq+1A0jmvHjik9OtdzX6l5Bhr
 E5K3hv39Ue6FFh5LwGCsHXuuzDvj35PS+ljKrkQz3ke5j+fKZCFOJi19K w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10505"; a="333256355"
X-IronPort-AV: E=Sophos;i="5.95,198,1661842800"; d="scan'208";a="333256355"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2022 05:12:39 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10505"; a="663009996"
X-IronPort-AV: E=Sophos;i="5.95,198,1661842800"; d="scan'208";a="663009996"
Received: from awrynn-mobl.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.252.12.86])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2022 05:12:36 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Subject: [PATCH v2 08/19] ASoC: SOF: ipc4-loader: Save the maximum number of
 libraries supported
Date: Thu, 20 Oct 2022 15:12:27 +0300
Message-Id: <20221020121238.18339-9-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221020121238.18339-1-peter.ujfalusi@linux.intel.com>
References: <20221020121238.18339-1-peter.ujfalusi@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, kai.vehmanen@linux.intel.com,
 cezary.rojewski@intel.com, pierre-louis.bossart@linux.intel.com,
 ranjani.sridharan@linux.intel.com, amadeuszx.slawinski@linux.intel.com,
 chao.song@intel.com
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

The firmware supports external libraries (containing modules) to be loaded
runtime.
The firmware configuration contains the maximum number of libraries
supported, including the base firmware (which is library 0).

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Chao Song <chao.song@intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
---
 sound/soc/sof/ipc4-loader.c | 7 +++++++
 sound/soc/sof/ipc4-priv.h   | 3 +++
 2 files changed, 10 insertions(+)

diff --git a/sound/soc/sof/ipc4-loader.c b/sound/soc/sof/ipc4-loader.c
index 9f433e9b4cd3..2495a205ef78 100644
--- a/sound/soc/sof/ipc4-loader.c
+++ b/sound/soc/sof/ipc4-loader.c
@@ -202,6 +202,13 @@ static int sof_ipc4_query_fw_configuration(struct snd_sof_dev *sdev)
 			trace_sof_ipc4_fw_config(sdev, "Trace log size", *tuple->value);
 			ipc4_data->mtrace_log_bytes = *tuple->value;
 			break;
+		case SOF_IPC4_FW_CFG_MAX_LIBS_COUNT:
+			trace_sof_ipc4_fw_config(sdev, "maximum number of libraries",
+						 *tuple->value);
+			ipc4_data->max_libs_count = *tuple->value;
+			if (!ipc4_data->max_libs_count)
+				ipc4_data->max_libs_count = 1;
+			break;
 		default:
 			break;
 		}
diff --git a/sound/soc/sof/ipc4-priv.h b/sound/soc/sof/ipc4-priv.h
index e3b8484a2f1f..7f5c7a47b3a7 100644
--- a/sound/soc/sof/ipc4-priv.h
+++ b/sound/soc/sof/ipc4-priv.h
@@ -32,6 +32,8 @@ enum sof_ipc4_mtrace_type {
  * @nhlt: NHLT table either from the BIOS or the topology manifest
  * @mtrace_type: mtrace type supported on the booted platform
  * @mtrace_log_bytes: log bytes as reported by the firmware via fw_config reply
+ * @max_libs_count: Maximum number of libraries support by the FW including the
+ *		    base firmware
  */
 struct sof_ipc4_fw_data {
 	u32 manifest_fw_hdr_offset;
@@ -40,6 +42,7 @@ struct sof_ipc4_fw_data {
 	void *nhlt;
 	enum sof_ipc4_mtrace_type mtrace_type;
 	u32 mtrace_log_bytes;
+	u32 max_libs_count;
 };
 
 /**
-- 
2.38.1

