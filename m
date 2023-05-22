Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 34D5B70B9B7
	for <lists+alsa-devel@lfdr.de>; Mon, 22 May 2023 12:14:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7C1FE82A;
	Mon, 22 May 2023 12:13:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7C1FE82A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684750456;
	bh=gu+eRRLBq7aMAlpE2mqbyY40m0PwMmVEEluUXfRSgfk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=X1ECmJno13S3SE3UWKLdna1v4mSh+gRB0IvlUT4xSPB2mhtqjIKlaWcU85/Kz7Fyd
	 OyFuWxISRjERvF+LshtGaQindDaE5h2l1wc9pI7dxAc3E9w6qWGX1wRI1sGlb1rdmZ
	 C6IFRsNQoSOXoaLHBz+2PBouud7kVnA9O5Va3bsc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 449AFF80567; Mon, 22 May 2023 12:12:39 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 13370F80553;
	Mon, 22 May 2023 12:12:38 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AC9BBF80542; Mon, 22 May 2023 12:12:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id BEEC5F80249
	for <alsa-devel@alsa-project.org>; Mon, 22 May 2023 12:12:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BEEC5F80249
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=jIPAZlKI
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1684750342; x=1716286342;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=gu+eRRLBq7aMAlpE2mqbyY40m0PwMmVEEluUXfRSgfk=;
  b=jIPAZlKIVMbArfpAGpiKaW+5xpklTjy08XhlVHXYFf/DXj8LV2ACd+cF
   yijpdTDPup002ofxeBNtWKuLrkUm0p5mQr69quiThpa+1LmSEMFhk0OeQ
   LOiNyLj96ggdZ1fmr4pLP9aMbQ88cXLOUZTYgPZ+YDIEHW1GWXuY58E90
   gzWaSSUeYqnH7LwewiTByqWvRFdlBmXa6AcwZzp05OLAniz0F8lxVeC7y
   q8nItsi8rPpehWhMP68hI8JgNdgti5monzqLghOwJTfaS5ohps9g6VRrG
   My2Pfcuc//KY6eJZiSoHm0Vs2cmlARoTwUauW9+z/xLSQ8NlX2AhRpYCF
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10717"; a="350390654"
X-IronPort-AV: E=Sophos;i="6.00,184,1681196400";
   d="scan'208";a="350390654"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2023 03:12:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10717"; a="736365226"
X-IronPort-AV: E=Sophos;i="6.00,184,1681196400";
   d="scan'208";a="736365226"
Received: from bbattach-mobl.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.251.220.157])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2023 03:12:17 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: alsa-devel@alsa-project.org,
	pierre-louis.bossart@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	kai.vehmanen@linux.intel.com
Subject: [PATCH 1/5] ASoC: SOF: ipc4-loader: Drop unused bss_size from struct
 sof_ipc4_fw_module
Date: Mon, 22 May 2023 13:13:09 +0300
Message-Id: <20230522101313.12519-2-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230522101313.12519-1-peter.ujfalusi@linux.intel.com>
References: <20230522101313.12519-1-peter.ujfalusi@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: IITOOCJBPTXEFDCQHCZUNTQFYMKXAUJV
X-Message-ID-Hash: IITOOCJBPTXEFDCQHCZUNTQFYMKXAUJV
X-MailFrom: peter.ujfalusi@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/IITOOCJBPTXEFDCQHCZUNTQFYMKXAUJV/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The bss_size is only set, but not used by the code, remove it.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
---
 sound/soc/sof/ipc4-loader.c | 6 +-----
 sound/soc/sof/ipc4-priv.h   | 2 --
 2 files changed, 1 insertion(+), 7 deletions(-)

diff --git a/sound/soc/sof/ipc4-loader.c b/sound/soc/sof/ipc4-loader.c
index 1321acc402fd..bb215d33d455 100644
--- a/sound/soc/sof/ipc4-loader.c
+++ b/sound/soc/sof/ipc4-loader.c
@@ -112,16 +112,12 @@ static ssize_t sof_ipc4_fw_parse_ext_man(struct snd_sof_dev *sdev,
 				return -EINVAL;
 			}
 
-			/* a module's config is always the same size */
-			fw_module->bss_size = fm_config[fm_entry->cfg_offset].is_bytes;
 
 			dev_dbg(sdev->dev,
 				"module %s: UUID %pUL cfg_count: %u, bss_size: %#x\n",
 				fm_entry->name, &fm_entry->uuid, fm_entry->cfg_count,
-				fw_module->bss_size);
+				fm_config[fm_entry->cfg_offset].is_bytes);
 		} else {
-			fw_module->bss_size = 0;
-
 			dev_dbg(sdev->dev, "module %s: UUID %pUL\n", fm_entry->name,
 				&fm_entry->uuid);
 		}
diff --git a/sound/soc/sof/ipc4-priv.h b/sound/soc/sof/ipc4-priv.h
index f461b8c70df3..546e52746276 100644
--- a/sound/soc/sof/ipc4-priv.h
+++ b/sound/soc/sof/ipc4-priv.h
@@ -29,13 +29,11 @@ enum sof_ipc4_mtrace_type {
  * struct sof_ipc4_fw_module - IPC4 module info
  * @sof_man4_module: Module info
  * @m_ida: Module instance identifier
- * @bss_size: Module object size
  * @private: Module private data
  */
 struct sof_ipc4_fw_module {
 	struct sof_man4_module man4_module_entry;
 	struct ida m_ida;
-	u32 bss_size;
 	void *private;
 };
 
-- 
2.40.1

