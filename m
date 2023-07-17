Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 420087561EE
	for <lists+alsa-devel@lfdr.de>; Mon, 17 Jul 2023 13:48:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2BE4AAE8;
	Mon, 17 Jul 2023 13:47:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2BE4AAE8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689594493;
	bh=xDZvjDAnmyr9idM4V2jRguD7382ptl0JEWF/BZWKdgo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=kX9kNw74QaBgu2rJVrKpEW9hXRzvfWjiX2MhFBIbTSRTpTqjgHwYK6m52sJbkNZPt
	 dvsNyb/83idjtycFaoBwa3p1M0Pc7Md+TvL5SV3YIIT4yNOkFlbyd74cWqUkyekuAt
	 LoeKFd8nYmMyd+xAkka4+bLr/aq9Ro55Iuoqc2gM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3C16CF805B1; Mon, 17 Jul 2023 13:46:03 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 88539F805A9;
	Mon, 17 Jul 2023 13:46:02 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DC37FF8056F; Mon, 17 Jul 2023 13:45:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=unavailable autolearn_force=no version=3.4.6
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id AD8B7F80520
	for <alsa-devel@alsa-project.org>; Mon, 17 Jul 2023 13:45:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AD8B7F80520
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=ReR3e816
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689594341; x=1721130341;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=xDZvjDAnmyr9idM4V2jRguD7382ptl0JEWF/BZWKdgo=;
  b=ReR3e816B2LQYR54gCMS3XC+x9lW/Y3xyh2ZZn1Sk7ejOi7MP4LwMgXz
   08eM6kvG3sstwlu9tHxFcUpdsdQJZxn4l8cxrwwPyTvKBVO3JlgKh/xKZ
   8Zi35hTpxDza8FLF7tawfnx08IRnrOxXFXL87PTjIj0jw0EAuFAWsbmil
   YEgj41tMpJpIVYtVstepH7s8M/vxsINPpL3AYL2ThFuIr+1sP/hxEvAuG
   Wuz/y9OPhUJ/IZHbliRg441KuFcv9Wu87euZ/4Ap2e5/PHXFHkuchl6X+
   b7Vqz3W19N3npUv0HfwHLdpCsjA2zlPbCfl9+1tvZTB4jlOtNqm+6wzZb
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10773"; a="363372835"
X-IronPort-AV: E=Sophos;i="6.01,211,1684825200";
   d="scan'208";a="363372835"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2023 04:45:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10773"; a="969856511"
X-IronPort-AV: E=Sophos;i="6.01,211,1684825200";
   d="scan'208";a="969856511"
Received: from dev2 (HELO DEV2.igk.intel.com) ([10.237.148.94])
  by fmsmga006.fm.intel.com with ESMTP; 17 Jul 2023 04:45:37 -0700
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
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Hans de Goede <hdegoede@redhat.com>,
	=?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v4 06/15] ALSA: hda: Use global PCI match macro
Date: Mon, 17 Jul 2023 13:45:02 +0200
Message-Id: <20230717114511.484999-7-amadeuszx.slawinski@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230717114511.484999-1-amadeuszx.slawinski@linux.intel.com>
References: <20230717114511.484999-1-amadeuszx.slawinski@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 3VMYTEKH3SOKNFIYVGBVJY2BAYZOLN5D
X-Message-ID-Hash: 3VMYTEKH3SOKNFIYVGBVJY2BAYZOLN5D
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3VMYTEKH3SOKNFIYVGBVJY2BAYZOLN5D/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Instead of using local macro to match PCI device, use global one. As
Apollolake is Broxton-P successor that made it to the market, be precise
and use APL shortcut.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Acked-by: Mark Brown <broonie@kernel.org>
Reviewed-by: Cezary Rojewski <cezary.rojewski@intel.com>
Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
---
 sound/pci/hda/hda_intel.c | 20 ++++----------------
 1 file changed, 4 insertions(+), 16 deletions(-)

diff --git a/sound/pci/hda/hda_intel.c b/sound/pci/hda/hda_intel.c
index 8f0cebb83302..5e59dcc35665 100644
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

