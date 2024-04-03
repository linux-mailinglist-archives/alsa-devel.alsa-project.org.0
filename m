Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E50A1896AAD
	for <lists+alsa-devel@lfdr.de>; Wed,  3 Apr 2024 11:33:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7838F2C63;
	Wed,  3 Apr 2024 11:32:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7838F2C63
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1712136789;
	bh=Uf61lRVj55WHImUiBlCNQuyLIKLzrbNeeTxDN7YZoBI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=LKHvAUslUIP1ICbxcnajcctGNTBVa1O7if6GzgVggbm3Rmts9VYm4pICpyKdR2xke
	 8eXS9b68iiWy2wzkpe0DCYSEmV7MCoC9aCBZ7SrSz0zGIyURTxDQf62XifCPsZlSlz
	 1bXTdtifP/Cz1IT0RDa236zdZU6di9IatFYddcSA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C8092F8065A; Wed,  3 Apr 2024 11:31:41 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B6514F8064F;
	Wed,  3 Apr 2024 11:31:40 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DE6C7F805B2; Wed,  3 Apr 2024 11:31:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E3096F8020D
	for <alsa-devel@alsa-project.org>; Wed,  3 Apr 2024 11:31:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E3096F8020D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=NjvORwxD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712136679; x=1743672679;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Uf61lRVj55WHImUiBlCNQuyLIKLzrbNeeTxDN7YZoBI=;
  b=NjvORwxDO2IjfRSPF3jWTqknNW2QdIpctKgokz6vIdRTq2uuXTSZXbYi
   vDmVRf2LZqL1wJU3l5877ZF7g59gmci8yVGJzR7mPCBbgEvMlLefTYLLU
   kW4heFlxF6RCOu/py6glLa0J7QlMTe80KEfGCbdQCdEs+h1HkgWMBoJmO
   2o7hOLy6niI2/8lblGqOt2/r2xdl0hmpeIGYZ3p1F+aRtX6Ox8EQ3KJGR
   OdgqptGBfk5y2GEl1h4GVV0QPtiZr7Pc7KoRWL6F00lJrKcom09iMeAw8
   XZsvFNnqRi1xwof8fyw7GizYlDQW+QhXOfTwlAZZRUd/u7sQytbkEGGez
   w==;
X-CSE-ConnectionGUID: jTFmdanRTWuik2YLU+gzPw==
X-CSE-MsgGUID: 4GnvQMn2SaubWgGTt/WdnA==
X-IronPort-AV: E=McAfee;i="6600,9927,11032"; a="7218683"
X-IronPort-AV: E=Sophos;i="6.07,177,1708416000";
   d="scan'208";a="7218683"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2024 02:31:17 -0700
X-CSE-ConnectionGUID: k/r99CPlRYqUchUEr9fhxQ==
X-CSE-MsgGUID: XpQjvu2fTWScFgk96aZwEA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,177,1708416000";
   d="scan'208";a="18797538"
Received: from dev2 (HELO DEV2.igk.intel.com) ([10.237.148.94])
  by orviesa007.jf.intel.com with ESMTP; 03 Apr 2024 02:31:15 -0700
From: =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
To: Mark Brown <broonie@kernel.org>
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
	Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	=?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
Subject: [PATCH 02/10] ASoC: Intel: avs: Use devm_kstrdup_const
Date: Wed,  3 Apr 2024 11:31:37 +0200
Message-Id: <20240403093145.3375857-3-amadeuszx.slawinski@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240403093145.3375857-1-amadeuszx.slawinski@linux.intel.com>
References: <20240403093145.3375857-1-amadeuszx.slawinski@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: JKMKKXLZVL75C4OQRPG6JVO4UPE7BYCF
X-Message-ID-Hash: JKMKKXLZVL75C4OQRPG6JVO4UPE7BYCF
X-MailFrom: amadeuszx.slawinski@linux.intel.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JKMKKXLZVL75C4OQRPG6JVO4UPE7BYCF/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

FW name is constant and we just duplicate it, use const variant of
devm_kstrdup to possibly save a bit of memory.

Reviewed-by: Cezary Rojewski <cezary.rojewski@intel.com>
Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
---
 sound/soc/intel/avs/avs.h   | 2 +-
 sound/soc/intel/avs/utils.c | 8 ++++----
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/sound/soc/intel/avs/avs.h b/sound/soc/intel/avs/avs.h
index f80f79415344a..9a02e2b528bc5 100644
--- a/sound/soc/intel/avs/avs.h
+++ b/sound/soc/intel/avs/avs.h
@@ -107,7 +107,7 @@ struct avs_spec {
 };
 
 struct avs_fw_entry {
-	char *name;
+	const char *name;
 	const struct firmware *fw;
 
 	struct list_head node;
diff --git a/sound/soc/intel/avs/utils.c b/sound/soc/intel/avs/utils.c
index 82416b86662d8..8100c2fa0a7ed 100644
--- a/sound/soc/intel/avs/utils.c
+++ b/sound/soc/intel/avs/utils.c
@@ -250,7 +250,7 @@ int avs_request_firmware(struct avs_dev *adev, const struct firmware **fw_p, con
 	if (!entry)
 		return -ENOMEM;
 
-	entry->name = kstrdup(name, GFP_KERNEL);
+	entry->name = kstrdup_const(name, GFP_KERNEL);
 	if (!entry->name) {
 		kfree(entry);
 		return -ENOMEM;
@@ -258,7 +258,7 @@ int avs_request_firmware(struct avs_dev *adev, const struct firmware **fw_p, con
 
 	ret = request_firmware(&entry->fw, name, adev->dev);
 	if (ret < 0) {
-		kfree(entry->name);
+		kfree_const(entry->name);
 		kfree(entry);
 		return ret;
 	}
@@ -282,7 +282,7 @@ void avs_release_last_firmware(struct avs_dev *adev)
 
 	list_del(&entry->node);
 	release_firmware(entry->fw);
-	kfree(entry->name);
+	kfree_const(entry->name);
 	kfree(entry);
 }
 
@@ -296,7 +296,7 @@ void avs_release_firmwares(struct avs_dev *adev)
 	list_for_each_entry_safe(entry, tmp, &adev->fw_list, node) {
 		list_del(&entry->node);
 		release_firmware(entry->fw);
-		kfree(entry->name);
+		kfree_const(entry->name);
 		kfree(entry);
 	}
 }
-- 
2.34.1

