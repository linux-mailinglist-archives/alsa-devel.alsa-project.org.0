Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F360E74EFAF
	for <lists+alsa-devel@lfdr.de>; Tue, 11 Jul 2023 14:59:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 43D60AEA;
	Tue, 11 Jul 2023 14:58:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 43D60AEA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689080379;
	bh=vinqnO46VRRCtcTS7KWV2T0847JFuBFICYgZjG0DVDI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=isoHiekWA6Ggc8Leil/qt8dNsnfLwGOnnP7DeK6FdGNg6/lSUQAzLXjrN1xLMmh1u
	 ibixLjeR9bFOCWsrTDJwCPXZmNoSpKQCfsHVqUrZaVbeVu62sHRXgBat6umdo/LMpP
	 q2wW84E/L2rjm6QVfXyV0BlJJcMT2v1cjPTDYMsc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 26F1CF8059F; Tue, 11 Jul 2023 14:57:36 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7B190F8059F;
	Tue, 11 Jul 2023 14:57:35 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 37126F8057B; Tue, 11 Jul 2023 14:57:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2DDD7F8024E
	for <alsa-devel@alsa-project.org>; Tue, 11 Jul 2023 14:57:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2DDD7F8024E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=fBB6kDKw
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689080240; x=1720616240;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=vinqnO46VRRCtcTS7KWV2T0847JFuBFICYgZjG0DVDI=;
  b=fBB6kDKwbr+AaKByJB/kTjfxpuiV/n7Hr7i3ZGIQIMEpvXCvdmCrUvil
   bmHH4G3Wq4nz7D++XDF1pdz5wgKvjSfotZt6Cwp3XVeoqTXh4Rjsr5VVa
   8NvkxSe7YwUScfpS/RNFe2xFRLEJx9vjPDAIG7lSRq8llKsIolEzW3hgJ
   RIzKBjG2SCA+Nd1uY0xTN5oL1bMpnHyV85IsaQt/B/q0MK/hIvSWAMaYf
   SgS/mT0rCOku/Yl2fnlM8xS2+6VbxCEgorXnLERv3MyTeWAgJf7P1/qMo
   olDBvTPlIxMJOV2WvyXbPvguOtu25ngqRc8DRd8DICPA77Tb1iXNqykyA
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10768"; a="367187394"
X-IronPort-AV: E=Sophos;i="6.01,196,1684825200";
   d="scan'208";a="367187394"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jul 2023 05:57:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10768"; a="834666551"
X-IronPort-AV: E=Sophos;i="6.01,196,1684825200";
   d="scan'208";a="834666551"
Received: from dev2 (HELO DEV2.igk.intel.com) ([10.237.148.94])
  by fmsmga002.fm.intel.com with ESMTP; 11 Jul 2023 05:57:16 -0700
From: =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
To: Bjorn Helgaas <bhelgaas@google.com>,
	Mark Brown <broonie@kernel.org>,
	Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org,
	linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	Hans de Goede <hdegoede@redhat.com>,
	=?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
Subject: [PATCH 04/13] ALSA: hda: Use global PCI match macro
Date: Tue, 11 Jul 2023 14:57:17 +0200
Message-Id: <20230711125726.3509391-5-amadeuszx.slawinski@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230711125726.3509391-1-amadeuszx.slawinski@linux.intel.com>
References: <20230711125726.3509391-1-amadeuszx.slawinski@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: NTBQEXCUS2KB4TPS63PL7BP76UQUUD42
X-Message-ID-Hash: NTBQEXCUS2KB4TPS63PL7BP76UQUUD42
X-MailFrom: amadeuszx.slawinski@linux.intel.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/NTBQEXCUS2KB4TPS63PL7BP76UQUUD42/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Instead of using local macro to match PCI device, use global one.

Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
---
 sound/pci/hda/hda_intel.c | 20 ++++----------------
 1 file changed, 4 insertions(+), 16 deletions(-)

diff --git a/sound/pci/hda/hda_intel.c b/sound/pci/hda/hda_intel.c
index ef831770ca7d..143efa54b9bf 100644
--- a/sound/pci/hda/hda_intel.c
+++ b/sound/pci/hda/hda_intel.c
@@ -330,18 +330,6 @@ enum {
 #define needs_eld_notify_link(chip)	false
 #endif
 
-#define CONTROLLER_IN_GPU(pci) (((pci)->vendor == 0x8086) &&         \
-				       (((pci)->device == 0x0a0c) || \
-					((pci)->device == 0x0c0c) || \
-					((pci)->device == 0x0d0c) || \
-					((pci)->device == 0x160c) || \
-					((pci)->device == 0x490d) || \
-					((pci)->device == 0x4f90) || \
-					((pci)->device == 0x4f91) || \
-					((pci)->device == 0x4f92)))
-
-#define IS_BXT(pci) ((pci)->vendor == 0x8086 && (pci)->device == 0x5a98)
-
 static const char * const driver_short_names[] = {
 	[AZX_DRIVER_ICH] = "HDA Intel",
 	[AZX_DRIVER_PCH] = "HDA Intel PCH",
@@ -573,7 +561,7 @@ static void hda_intel_init_chip(struct azx *chip, bool full_reset)
 	snd_hdac_set_codec_wakeup(bus, false);
 
 	/* reduce dma latency to avoid noise */
-	if (IS_BXT(pci))
+	if (HDA_CONTROLLER_IS_APL(pci))
 		bxt_reduce_dma_latency(chip);
 
 	if (bus->mlcap != NULL)
@@ -2175,7 +2163,7 @@ static int azx_probe(struct pci_dev *pci,
 #endif /* CONFIG_SND_HDA_PATCH_LOADER */
 
 #ifndef CONFIG_SND_HDA_I915
-	if (CONTROLLER_IN_GPU(pci))
+	if (HDA_CONTROLLER_IN_GPU(pci))
 		dev_err(card->dev, "Haswell/Broadwell HDMI/DP must build in CONFIG_SND_HDA_I915\n");
 #endif
 
@@ -2283,7 +2271,7 @@ static int azx_probe_continue(struct azx *chip)
 			 * for other chips, still continue probing as other
 			 * codecs can be on the same link.
 			 */
-			if (CONTROLLER_IN_GPU(pci)) {
+			if (HDA_CONTROLLER_IN_GPU(pci)) {
 				dev_err(chip->card->dev,
 					"HSW/BDW HD-audio HDMI/DP requires binding with gfx driver\n");
 				goto out_free;
@@ -2294,7 +2282,7 @@ static int azx_probe_continue(struct azx *chip)
 		}
 
 		/* HSW/BDW controllers need this power */
-		if (CONTROLLER_IN_GPU(pci))
+		if (HDA_CONTROLLER_IN_GPU(pci))
 			hda->need_i915_power = true;
 	}
 
-- 
2.34.1

