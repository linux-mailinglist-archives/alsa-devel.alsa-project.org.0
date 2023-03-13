Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EC196B7545
	for <lists+alsa-devel@lfdr.de>; Mon, 13 Mar 2023 12:06:24 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 646AA14A6;
	Mon, 13 Mar 2023 12:05:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 646AA14A6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678705583;
	bh=CCiur2tLL698axqnYuP9X//Owwgrw+C+vnxFz+5SzSA=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=CVJYuk28Y4tc8iiIb5Ssv+kzRVUVOHOCUgDS0G7lu0+opF3v/dHrhlSl8gCKgrA/z
	 5m3Bkgum8O1Jlqxng5fUXGpS3wy8Yr1g/hmit+zKu1cJzO2QB53jxAEvX/a1wrFsuf
	 zKkeeLgAmnEVmtO67/RB66Urz27j+h0oLzBtL5g0=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 89B11F804B1;
	Mon, 13 Mar 2023 12:04:40 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CEC15F8055C; Mon, 13 Mar 2023 12:04:36 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 81B40F80482
	for <alsa-devel@alsa-project.org>; Mon, 13 Mar 2023 12:03:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 81B40F80482
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=B+v3Lf1O
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678705419; x=1710241419;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=CCiur2tLL698axqnYuP9X//Owwgrw+C+vnxFz+5SzSA=;
  b=B+v3Lf1Oz4Htae9hEffK5OM4lieTzyuPpv/NtzdCmGvk1pg2c8qh/bRN
   Pu1Fp5Gr215vNmtgqjDToaASi/JGqjWZz3fEYobeykVQtTvkzfbejub3H
   FWxLJE57g4v6gshM6hb1ryMX7tXpGqsYxA4lVMDF7HVaTleOFKQN42grs
   LaTtimhKgbakdmXYBibukecAy4RSUBEmVcODin0/PLt8RE+Rw5EmkvuTQ
   oTr06cM+N3q4//ikHRBhWiQOuEutt3QswXtiIlAQe0PvclBgx1FSG8qK9
   lHrXx3dOdkkV/LOnCOImGBkcNs4JpnnfWGcKfRSMLjuCIP8RggkVahYzn
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10647"; a="423384122"
X-IronPort-AV: E=Sophos;i="5.98,256,1673942400";
   d="scan'208";a="423384122"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2023 04:03:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10647"; a="655939085"
X-IronPort-AV: E=Sophos;i="5.98,256,1673942400";
   d="scan'208";a="655939085"
Received: from tchambon-mobl.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.249.43.68])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2023 04:03:31 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Subject: [PATCH 4/7] ASoC: SOF: uapi: header: Update sof_abi_hdr doc for IPC4
 use
Date: Mon, 13 Mar 2023 13:03:41 +0200
Message-Id: <20230313110344.16644-5-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230313110344.16644-1-peter.ujfalusi@linux.intel.com>
References: <20230313110344.16644-1-peter.ujfalusi@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: QYPFIMK335CUTN7Y5CEYSC5PF64ACOQX
X-Message-ID-Hash: QYPFIMK335CUTN7Y5CEYSC5PF64ACOQX
X-MailFrom: peter.ujfalusi@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, pierre-louis.bossart@linux.intel.com,
 ranjani.sridharan@linux.intel.com, kai.vehmanen@linux.intel.com,
 yung-chuan.liao@linux.intel.com, libin.yang@intel.com,
 jaska.uimonen@linux.intel.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QYPFIMK335CUTN7Y5CEYSC5PF64ACOQX/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

With IPC4 the sof_abit_hdr is only used between user space
(and in topology) and kernel.
The same abi header is used with small differencies like different
magic number and the type field have slightly different name, but
similar function in IPC4 (param_id).

Update the kernel documentation to highlight the differences.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Jaska Uimonen <jaska.uimonen@linux.intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
---
 include/uapi/sound/sof/abi.h    |  2 ++
 include/uapi/sound/sof/header.h | 11 ++++++++---
 2 files changed, 10 insertions(+), 3 deletions(-)

diff --git a/include/uapi/sound/sof/abi.h b/include/uapi/sound/sof/abi.h
index 3566630ca965..45c657c3919e 100644
--- a/include/uapi/sound/sof/abi.h
+++ b/include/uapi/sound/sof/abi.h
@@ -60,5 +60,7 @@
 
 /* SOF ABI magic number "SOF\0". */
 #define SOF_ABI_MAGIC		0x00464F53
+/* SOF IPC4 ABI magic number "SOF4". */
+#define SOF_IPC4_ABI_MAGIC	0x34464F53
 
 #endif
diff --git a/include/uapi/sound/sof/header.h b/include/uapi/sound/sof/header.h
index e53b62b9e2c5..cb3c1ace69e3 100644
--- a/include/uapi/sound/sof/header.h
+++ b/include/uapi/sound/sof/header.h
@@ -13,10 +13,15 @@
 
 /**
  * struct sof_abi_hdr - Header for all non IPC ABI data.
- * @magic: Magic number for validation: 0x00464F53 ('S', 'O', 'F', '\0')
- * @type: Component specific type
+ * @magic: Magic number for validation
+ *	   for IPC3 data: 0x00464F53 ('S', 'O', 'F', '\0')
+ *	   for IPC4 data: 0x34464F53 ('S', 'O', 'F', '4')
+ * @type: module specific parameter
+ *	  for IPC3: Component specific type
+ *	  for IPC4: parameter ID (param_id) of the data
  * @size: The size in bytes of the data, excluding this struct
- * @abi: SOF ABI version
+ * @abi: SOF ABI version. The version is valid in scope of the 'magic', IPC3 and
+ *	 IPC4 ABI version numbers have no relationship.
  * @reserved: Reserved for future use
  * @data: Component data - opaque to core
  *
-- 
2.39.2

