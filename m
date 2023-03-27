Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FB3B6CA26B
	for <lists+alsa-devel@lfdr.de>; Mon, 27 Mar 2023 13:31:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AB12386E;
	Mon, 27 Mar 2023 13:30:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AB12386E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1679916675;
	bh=sgWAGpUpuULR9ufUWY8Fv4poewr+OpDHDk3bXhgKmJI=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=PIca7NaMw2jzh4t4wqN8dOUAJL9pmoDf6s6msF0dnItlmaGSqfaJWon8OyceFic7I
	 y9n9PF5ULsPj3flPXlbMMyRK51EYdkfWzZpCFbqcc/7XpT2YAfry8sQwsm4CbXU7km
	 5BpOu1UH6xsxcKPTmWGiOwPbfXw3ErVqBO2DMBs8=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id DDD68F8052E;
	Mon, 27 Mar 2023 13:29:31 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1DB27F80527; Mon, 27 Mar 2023 13:29:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 39361F80272
	for <alsa-devel@alsa-project.org>; Mon, 27 Mar 2023 13:29:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 39361F80272
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=CwOI367R
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679916551; x=1711452551;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=sgWAGpUpuULR9ufUWY8Fv4poewr+OpDHDk3bXhgKmJI=;
  b=CwOI367RnReX8Mw8XJzmZ6E2Spr8i/BrUii41I53hzVrfzkh35NR7K/+
   v6xhGPtp83yUZRGrlcV9ZWMJ3V5nrjdhlJ5+T1KVkBUTkxO+siMgTm4VE
   u2g+fSZAp3bvnFEzgguQUJrdg/HyOlfWkBx8fdZHzkvwvmgWgiSdJ0UyZ
   V7FgHRKf7PPqCVjHBM19Ey9nF3AwyhMF52EaoQsl8djaw9IRcfuuVGjf+
   ArUi5hOfv0tSanyX1UXSqKu4GhQ+7LLrOiq/bWwZixdBF+pi+Oq1jNKYU
   MVOvbYm05p1MNZDbfB4QMr1B4hRFLBNBCeaClDR73CjzSBtKrK4u2JlQH
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10661"; a="367986887"
X-IronPort-AV: E=Sophos;i="5.98,294,1673942400";
   d="scan'208";a="367986887"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2023 04:29:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10661"; a="857620370"
X-IronPort-AV: E=Sophos;i="5.98,294,1673942400";
   d="scan'208";a="857620370"
Received: from asebenix-mobl1.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.251.223.110])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2023 04:29:04 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	tiwai@suse.de,
	perex@perex.cz
Subject: [PATCH 02/18] ALSA: hda: add HDaudio Extended link definitions
Date: Mon, 27 Mar 2023 14:29:15 +0300
Message-Id: <20230327112931.23411-3-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230327112931.23411-1-peter.ujfalusi@linux.intel.com>
References: <20230327112931.23411-1-peter.ujfalusi@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 2VGMSXLZDRHL4JPDVMWGUR23F73BOS6I
X-Message-ID-Hash: 2VGMSXLZDRHL4JPDVMWGUR23F73BOS6I
X-MailFrom: peter.ujfalusi@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, pierre-louis.bossart@linux.intel.com,
 ranjani.sridharan@linux.intel.com, kai.vehmanen@linux.intel.com,
 rander.wang@intel.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2VGMSXLZDRHL4JPDVMWGUR23F73BOS6I/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

Add new definitions for the HDaudio Extended link support,
specifically new registers for SoundWire, Intel DMIC and INTEL SSP
interfaces.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 include/sound/hda_register.h | 40 ++++++++++++++++++++++++++++++++++--
 1 file changed, 38 insertions(+), 2 deletions(-)

diff --git a/include/sound/hda_register.h b/include/sound/hda_register.h
index d37cf43546eb..9c7872c0ca79 100644
--- a/include/sound/hda_register.h
+++ b/include/sound/hda_register.h
@@ -258,14 +258,27 @@ enum { SDI0, SDI1, SDI2, SDI3, SDO0, SDO1, SDO2, SDO3 };
 #define AZX_ML_BASE			0x40
 #define AZX_ML_INTERVAL			0x40
 
+/* HDaudio registers valid for HDaudio and HDaudio extended links */
 #define AZX_REG_ML_LCAP			0x00
-#define AZX_REG_ML_LCTL			0x04
 
+#define AZX_ML_HDA_LCAP_ALT		BIT(28)
+#define AZX_ML_HDA_LCAP_ALT_HDA		0x0
+#define AZX_ML_HDA_LCAP_ALT_HDA_EXT	0x1
+
+#define AZX_ML_HDA_LCAP_INTC		BIT(27)		/* only used if ALT == 1 */
+#define AZX_ML_HDA_LCAP_OFLS		BIT(26)		/* only used if ALT == 1 */
+#define AZX_ML_HDA_LCAP_LSS		BIT(23)		/* only used if ALT == 1 */
+#define AZX_ML_HDA_LCAP_SLCOUNT		GENMASK(22, 20)	/* only used if ALT == 1 */
+
+#define AZX_REG_ML_LCTL			0x04
+#define AZX_ML_LCTL_INTSTS		BIT(31)		/* only used if ALT == 1 */
 #define AZX_ML_LCTL_CPA			BIT(23)
 #define AZX_ML_LCTL_CPA_SHIFT		23
 #define AZX_ML_LCTL_SPA			BIT(16)
 #define AZX_ML_LCTL_SPA_SHIFT		16
-#define AZX_ML_LCTL_SCF			GENMASK(3, 0)
+#define AZX_ML_LCTL_INTEN		BIT(5)		/* only used if ALT == 1 */
+#define AZX_ML_LCTL_OFLEN		BIT(4)		/* only used if ALT == 1 */
+#define AZX_ML_LCTL_SCF			GENMASK(3, 0)	/* only used if ALT == 0 */
 
 #define AZX_REG_ML_LOSIDV		0x08
 
@@ -273,12 +286,35 @@ enum { SDI0, SDI1, SDI2, SDI3, SDO0, SDO1, SDO2, SDO3 };
 #define AZX_ML_LOSIDV_STREAM_MASK	0xFFFE
 
 #define AZX_REG_ML_LSDIID		0x0C
+#define AZX_REG_ML_LSDIID_OFFSET(x)	(0x0C + (x) * 0x02)	/* only used if ALT == 1 */
+
+/* HDaudio registers only valid if LCAP.ALT == 0 */
 #define AZX_REG_ML_LPSOO		0x10
 #define AZX_REG_ML_LPSIO		0x12
 #define AZX_REG_ML_LWALFC		0x18
 #define AZX_REG_ML_LOUTPAY		0x20
 #define AZX_REG_ML_LINPAY		0x30
 
+/* HDaudio Extended link registers only valid if LCAP.ALT == 1 */
+#define AZX_REG_ML_LSYNC		0x1C
+
+#define AZX_REG_ML_LSYNC_CMDSYNC	BIT(24)
+#define AZX_REG_ML_LSYNC_CMDSYNC_SHIFT	24
+#define AZX_REG_ML_LSYNC_SYNCGO		BIT(23)
+#define AZX_REG_ML_LSYNC_SYNCPU		BIT(20)
+#define AZX_REG_ML_LSYNC_SYNCPRD	GENMASK(19, 0)
+
+#define AZX_REG_ML_LEPTR		0x20
+
+#define AZX_REG_ML_LEPTR_ID		GENMASK(31, 24)
+#define AZX_REG_ML_LEPTR_ID_SHIFT	24
+#define AZX_REG_ML_LEPTR_ID_SDW		0x00
+#define AZX_REG_ML_LEPTR_ID_INTEL_SSP	0xC0
+#define AZX_REG_ML_LEPTR_ID_INTEL_DMIC  0xC1
+#define AZX_REG_ML_LEPTR_ID_INTEL_UAOL  0xC2
+#define AZX_REG_ML_LEPTR_VER		GENMASK(23, 20)
+#define AZX_REG_ML_LEPTR_PTR		GENMASK(19, 0)
+
 /* registers for DMA Resume Capability Structure */
 #define AZX_DRSM_CAP_ID			0x5
 #define AZX_REG_DRSM_CTL		0x4
-- 
2.40.0

