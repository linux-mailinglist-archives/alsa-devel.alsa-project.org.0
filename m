Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DA5DD6D5DC5
	for <lists+alsa-devel@lfdr.de>; Tue,  4 Apr 2023 12:42:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C82881FE;
	Tue,  4 Apr 2023 12:42:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C82881FE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1680604973;
	bh=sgWAGpUpuULR9ufUWY8Fv4poewr+OpDHDk3bXhgKmJI=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=FENZyVkv4MP/hiJLAnO0gJvOLYJUcwmJbXzQStSH6j/JjmetDtndcddDp+MhNKpcz
	 sMDPGPvRRYMnqG7cFQKr16PJ1UJraYY5fBhQJAX5IqtUAXeCnZE5kle8amufal4zs9
	 Z3zB5BFJgtkqbXVC+9dlh7a7qTFFLYvNUVudHJVA=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 86924F80529;
	Tue,  4 Apr 2023 12:41:15 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C081EF801C0; Tue,  4 Apr 2023 12:41:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id CE6B0F801C0
	for <alsa-devel@alsa-project.org>; Tue,  4 Apr 2023 12:41:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CE6B0F801C0
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=fR575bja
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680604864; x=1712140864;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=sgWAGpUpuULR9ufUWY8Fv4poewr+OpDHDk3bXhgKmJI=;
  b=fR575bja49/P6edGTqcv/m/oD5GlPsb6cxBGOIS0goJCTgxCOyBES/6+
   0rrQsMiB1y7FJzM/lcuNAuMJ1STZ9APXA3UtqAL3eammduB+UwRdrkZvX
   Wsh2qMTRtSoARJEpKgs7Tqq3nC7nQKT4dG0/Wneg0Y3rDqoX6UgGtPvpD
   GHfTMzfjAS6QIwnO95HnZbI967UhvmGLDy1wodhvCXiHN7Q28ykZ+VRFL
   Goc9rWjRCJg5DgT1RPB7LH1AbPTO7WpuF8HZV+lG1jrfWunm5DsVsGWPe
   r4EnMUiccz8uciCJbEfS+dm41QgNr3RgT4eK2RbWHJF3ZzICOLsh92G/g
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10669"; a="340877940"
X-IronPort-AV: E=Sophos;i="5.98,317,1673942400";
   d="scan'208";a="340877940"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Apr 2023 03:41:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10669"; a="829930117"
X-IronPort-AV: E=Sophos;i="5.98,317,1673942400";
   d="scan'208";a="829930117"
Received: from vsysoevx-mobl.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.249.33.42])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Apr 2023 03:40:57 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	tiwai@suse.de,
	perex@perex.cz
Subject: [PATCH v2 02/18] ALSA: hda: add HDaudio Extended link definitions
Date: Tue,  4 Apr 2023 13:41:11 +0300
Message-Id: <20230404104127.5629-3-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230404104127.5629-1-peter.ujfalusi@linux.intel.com>
References: <20230404104127.5629-1-peter.ujfalusi@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: RD64KAJ5A6LAJFVJRSKW5SI26BFE4357
X-Message-ID-Hash: RD64KAJ5A6LAJFVJRSKW5SI26BFE4357
X-MailFrom: peter.ujfalusi@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, pierre-louis.bossart@linux.intel.com,
 ranjani.sridharan@linux.intel.com, kai.vehmanen@linux.intel.com,
 rander.wang@intel.com, amadeuszx.slawinski@linux.intel.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/RD64KAJ5A6LAJFVJRSKW5SI26BFE4357/>
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

