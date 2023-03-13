Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BEDE06B754B
	for <lists+alsa-devel@lfdr.de>; Mon, 13 Mar 2023 12:06:56 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E10FA1497;
	Mon, 13 Mar 2023 12:06:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E10FA1497
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678705616;
	bh=ZGlrIUicnrkERPLScFLntHNgZ/+KopN6pBA+3AA0q2w=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=vKM3JgbkoUlOmxm5z1QvfPkbeF75siy0Y5qxOj6d+ej8cMcklUUHH+XNMq79RZk+/
	 MtnJX1szPxAtwpnIWeDir+hlNut/3EBVK8khXfXzL3QFm/5sEBhAShsCxWSn27V5Ft
	 QuAra8AcJjwR+gajuS/gs8763qIUuGE1tigpOl+4=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A189AF8055C;
	Mon, 13 Mar 2023 12:04:44 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 13E15F8051B; Mon, 13 Mar 2023 12:04:39 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7700EF80425
	for <alsa-devel@alsa-project.org>; Mon, 13 Mar 2023 12:03:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7700EF80425
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=PE/2hGhQ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678705419; x=1710241419;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ZGlrIUicnrkERPLScFLntHNgZ/+KopN6pBA+3AA0q2w=;
  b=PE/2hGhQyU+YSARa1Y9CR9v6rAxDbXFdZ23n31ineC9fv17/TlKHzqp2
   +yYwugnOEDDbonjWlz6MEXeLkhJzP6RkG89eJByXWFmmStK/pSBchfwzy
   9chcgCv4yyMkFR4tmGjmQheBC87EzSmluzbEYuvtnQPnCKbuZuMXfV5tQ
   MTwXr3mtwjif0XyRHlQm1+HhUAVpeK2kl+PfqrJnNG76pjqkdMEDRuT2R
   eJ4mbEjXZbgw2YLTaMhj7aBLfI8PKPFa9Z0GjAhah2CdwVlcXVEMxavv2
   p3nsjrl+OIhi/IXU0wvDSypDkkH9r3ntn9VvmSPKir5SNrMgGme95tMNS
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10647"; a="423384108"
X-IronPort-AV: E=Sophos;i="5.98,256,1673942400";
   d="scan'208";a="423384108"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2023 04:03:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10647"; a="655939081"
X-IronPort-AV: E=Sophos;i="5.98,256,1673942400";
   d="scan'208";a="655939081"
Received: from tchambon-mobl.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.249.43.68])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2023 04:03:29 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Subject: [PATCH 3/7] ASoC: SOF: uapi: header: Convert sof_abi_hdr comments to
 kernel style
Date: Mon, 13 Mar 2023 13:03:40 +0200
Message-Id: <20230313110344.16644-4-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230313110344.16644-1-peter.ujfalusi@linux.intel.com>
References: <20230313110344.16644-1-peter.ujfalusi@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: NA2YW7OIUXEKYYVCLB7PPHMXEW6EXPTG
X-Message-ID-Hash: NA2YW7OIUXEKYYVCLB7PPHMXEW6EXPTG
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/NA2YW7OIUXEKYYVCLB7PPHMXEW6EXPTG/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Replace the comments for sof_abi_hdr to kernel style.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Jaska Uimonen <jaska.uimonen@linux.intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 include/uapi/sound/sof/header.h | 22 ++++++++++++++--------
 1 file changed, 14 insertions(+), 8 deletions(-)

diff --git a/include/uapi/sound/sof/header.h b/include/uapi/sound/sof/header.h
index e9bba93a5399..e53b62b9e2c5 100644
--- a/include/uapi/sound/sof/header.h
+++ b/include/uapi/sound/sof/header.h
@@ -11,19 +11,25 @@
 
 #include <linux/types.h>
 
-/*
- * Header for all non IPC ABI data.
+/**
+ * struct sof_abi_hdr - Header for all non IPC ABI data.
+ * @magic: Magic number for validation: 0x00464F53 ('S', 'O', 'F', '\0')
+ * @type: Component specific type
+ * @size: The size in bytes of the data, excluding this struct
+ * @abi: SOF ABI version
+ * @reserved: Reserved for future use
+ * @data: Component data - opaque to core
  *
  * Identifies data type, size and ABI.
  * Used by any bespoke component data structures or binary blobs.
  */
 struct sof_abi_hdr {
-	__u32 magic;		/**< 'S', 'O', 'F', '\0' */
-	__u32 type;		/**< component specific type */
-	__u32 size;		/**< size in bytes of data excl. this struct */
-	__u32 abi;		/**< SOF ABI version */
-	__u32 reserved[4];	/**< reserved for future use */
-	__u32 data[];		/**< Component data - opaque to core */
+	__u32 magic;
+	__u32 type;
+	__u32 size;
+	__u32 abi;
+	__u32 reserved[4];
+	__u32 data[];
 }  __packed;
 
 #define SOF_MANIFEST_DATA_TYPE_NHLT 1
-- 
2.39.2

