Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 45EBA7F9E5A
	for <lists+alsa-devel@lfdr.de>; Mon, 27 Nov 2023 12:17:13 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5604ADE;
	Mon, 27 Nov 2023 12:17:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5604ADE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1701083832;
	bh=lA8iSC11t/qCDgrhQUX1hbGfoJqeDeJfPPSOKZHaay4=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=OY8JGlBamtXtAOqKPJAOXwr07688RI8dkYk6QR/NRDgAIKGXdWlaHRDGLDiupx3RE
	 wiU46VKbvF5rL/YT449aOiwpDyWT9/uPeEtgftsiL3ptGYInU46J12Udhuz1b7S37F
	 tvuDucojgaL0eLC4LDZqdzYij8IiFiyDnMgo8NOA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8A135F80571; Mon, 27 Nov 2023 12:16:40 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id EDB5EF8025A;
	Mon, 27 Nov 2023 12:16:39 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A1B07F801D5; Mon, 27 Nov 2023 12:16:36 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9BDBBF80104
	for <alsa-devel@alsa-project.org>; Mon, 27 Nov 2023 12:16:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9BDBBF80104
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=BxXuqqoU
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701083791; x=1732619791;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=lA8iSC11t/qCDgrhQUX1hbGfoJqeDeJfPPSOKZHaay4=;
  b=BxXuqqoUibpoUFBDZaHp3lI1/lB2trJ7Z4vp8xQPKJq9Kx9J2nyiCyyA
   2JR+0Vi6e7fgTiotIeXMGSf2MJyowZUJbfmlS9q5fan+j1dPeFDckW+2g
   MzNSRjveY9AM6NBFzP3PF0ytjqHjThsMIq4HtUoiErY97z52/LhilYseG
   jqgOyZYoms8YM0xwu21dmsZtZooG673TAnow2tZ7cn0jyeWACfjHxpMKX
   HFnLVz8Uaq/5cfVHtRxmbP3hKuXa58MPlNnM44uWDm7PnAl4SsjUoRLCe
   1A1Y78GHfhA1SzrJ8W2pABRjj42zv5eYDrxE8WLDmVnJoqCBevmB8IWSm
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10906"; a="459175130"
X-IronPort-AV: E=Sophos;i="6.04,230,1695711600";
   d="scan'208";a="459175130"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2023 03:16:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10906"; a="1099749602"
X-IronPort-AV: E=Sophos;i="6.04,230,1695711600";
   d="scan'208";a="1099749602"
Received: from acornagl-mobl.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.252.58.144])
  by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2023 03:16:23 -0800
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: perex@perex.cz,
	tiwai@suse.com
Cc: alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.intel.com,
	kai.vehmanen@linux.intel.com,
	ranjani.sridharan@linux.intel.com
Subject: [PATCH] ALSA: hda: intel-nhlt: Ignore vbps when looking for DMIC 32
 bps format
Date: Mon, 27 Nov 2023 13:16:58 +0200
Message-ID: <20231127111658.17275-1-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: GDCR2QHBDB7POMU44UXJTLV5QTMRE222
X-Message-ID-Hash: GDCR2QHBDB7POMU44UXJTLV5QTMRE222
X-MailFrom: peter.ujfalusi@linux.intel.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/GDCR2QHBDB7POMU44UXJTLV5QTMRE222/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

When looking up DMIC blob from the NHLT table and the format is 32 bits,
ignore the vbps matching for 32 bps for DMIC since some NHLT table have
the vbps as 24, some have it as 32.
The DMIC hardware supports only one type of 32 bit sample size, which is
24 bit sampling on the MSB side and bits[1:0] is used for indicating the
channel number.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
---
 sound/hda/intel-nhlt.c | 33 +++++++++++++++++++++++++++++----
 1 file changed, 29 insertions(+), 4 deletions(-)

diff --git a/sound/hda/intel-nhlt.c b/sound/hda/intel-nhlt.c
index 2c4dfc0b7e34..696a958d93e9 100644
--- a/sound/hda/intel-nhlt.c
+++ b/sound/hda/intel-nhlt.c
@@ -238,7 +238,7 @@ EXPORT_SYMBOL(intel_nhlt_ssp_mclk_mask);
 
 static struct nhlt_specific_cfg *
 nhlt_get_specific_cfg(struct device *dev, struct nhlt_fmt *fmt, u8 num_ch,
-		      u32 rate, u8 vbps, u8 bps)
+		      u32 rate, u8 vbps, u8 bps, bool ignore_vbps)
 {
 	struct nhlt_fmt_cfg *cfg = fmt->fmt_config;
 	struct wav_fmt *wfmt;
@@ -255,8 +255,12 @@ nhlt_get_specific_cfg(struct device *dev, struct nhlt_fmt *fmt, u8 num_ch,
 		dev_dbg(dev, "Endpoint format: ch=%d fmt=%d/%d rate=%d\n",
 			wfmt->channels, _vbps, _bps, wfmt->samples_per_sec);
 
+		/*
+		 * When looking for exact match of configuration ignore the vbps
+		 * from NHLT table when ignore_vbps is true
+		 */
 		if (wfmt->channels == num_ch && wfmt->samples_per_sec == rate &&
-		    vbps == _vbps && bps == _bps)
+		    (ignore_vbps || vbps == _vbps) && bps == _bps)
 			return &cfg->config;
 
 		cfg = (struct nhlt_fmt_cfg *)(cfg->config.caps + cfg->config.size);
@@ -289,6 +293,7 @@ intel_nhlt_get_endpoint_blob(struct device *dev, struct nhlt_acpi_table *nhlt,
 {
 	struct nhlt_specific_cfg *cfg;
 	struct nhlt_endpoint *epnt;
+	bool ignore_vbps = false;
 	struct nhlt_fmt *fmt;
 	int i;
 
@@ -298,7 +303,26 @@ intel_nhlt_get_endpoint_blob(struct device *dev, struct nhlt_acpi_table *nhlt,
 	dev_dbg(dev, "Looking for configuration:\n");
 	dev_dbg(dev, "  vbus_id=%d link_type=%d dir=%d, dev_type=%d\n",
 		bus_id, link_type, dir, dev_type);
-	dev_dbg(dev, "  ch=%d fmt=%d/%d rate=%d\n", num_ch, vbps, bps, rate);
+	if (link_type == NHLT_LINK_DMIC && bps == 32 && (vbps == 24 || vbps == 32)) {
+		/*
+		 * The DMIC hardware supports only one type of 32 bits sample
+		 * size, which is 24 bit sampling on the MSB side and bits[1:0]
+		 * are used for indicating the channel number.
+		 * It has been observed that some NHLT tables have the vbps
+		 * specified as 32 while some uses 24.
+		 * The format these variations describe are identical, the
+		 * hardware is configured and behaves the same way.
+		 * Note: when the samples assumed to be vbps=32 then the 'noise'
+		 * introduced by the lower two bits (channel number) have no
+		 * real life implication on audio quality.
+		 */
+		dev_dbg(dev,
+			"  ch=%d fmt=%d rate=%d (vbps is ignored for DMIC 32bit format)\n",
+			num_ch, bps, rate);
+		ignore_vbps = true;
+	} else {
+		dev_dbg(dev, "  ch=%d fmt=%d/%d rate=%d\n", num_ch, vbps, bps, rate);
+	}
 	dev_dbg(dev, "Endpoint count=%d\n", nhlt->endpoint_count);
 
 	epnt = (struct nhlt_endpoint *)nhlt->desc;
@@ -307,7 +331,8 @@ intel_nhlt_get_endpoint_blob(struct device *dev, struct nhlt_acpi_table *nhlt,
 		if (nhlt_check_ep_match(dev, epnt, bus_id, link_type, dir, dev_type)) {
 			fmt = (struct nhlt_fmt *)(epnt->config.caps + epnt->config.size);
 
-			cfg = nhlt_get_specific_cfg(dev, fmt, num_ch, rate, vbps, bps);
+			cfg = nhlt_get_specific_cfg(dev, fmt, num_ch, rate,
+						    vbps, bps, ignore_vbps);
 			if (cfg)
 				return cfg;
 		}
-- 
2.43.0

