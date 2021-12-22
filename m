Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 07CC547D3FE
	for <lists+alsa-devel@lfdr.de>; Wed, 22 Dec 2021 15:55:16 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 864E117A6;
	Wed, 22 Dec 2021 15:54:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 864E117A6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1640184915;
	bh=bAseApf6JW1lbHQZ+HyK2OYNwYtMAdNiHOC3b7ofL/8=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=ttdIkyiGGjtblm5HBQa+6Ee5TWFPpVnuC1BYWmy3U/zKvd+O2kcovBr2iFUpqL5l0
	 9XDqULwDdeOCbsnGEdBCv+ixZP4/b6+NepYS0fqbBgZSsXFZXd6baBWFeSqPabA5FV
	 Rb0FLAwTHRALEuMLO/eKaw42/e78XVAbrl4Uxwcs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DFFAEF80111;
	Wed, 22 Dec 2021 15:54:09 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B3F28F80109; Wed, 22 Dec 2021 15:54:07 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8D8D3F80084
 for <alsa-devel@alsa-project.org>; Wed, 22 Dec 2021 15:53:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8D8D3F80084
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="Qyxr1AiY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1640184842; x=1671720842;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=bAseApf6JW1lbHQZ+HyK2OYNwYtMAdNiHOC3b7ofL/8=;
 b=Qyxr1AiY45A8EkR0T8JsunfP5oX4XQSQDzK7i8YdGsb8HGUaWbPsfoNY
 8MtFc0jXO1xYrfRqJrFm4awvbH9zSsqCN4bNF7mdsUI+LsS1ASobcwvbL
 MNINUCl7ahmtSTSHe78YygSXCiMCwNQXtKdlqb5ajusMb0YxTjH3rO9kh
 g1JgHBxP1GVFg/xBBm2x4RhXVlIhCmRh2VB1FmClio8+j9bYIeGC8lZLN
 o5Kje4qgUky9nEVJExEDJYy8Zd2Azq9aNynymRFO0eqSTs2TmAHB/3qEI
 dnSPhxOzdIbILAfFEmsY+r1ZJ0mEsyLV2s5hf8hY4JRoE8yT2GindTpDf g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10205"; a="227479497"
X-IronPort-AV: E=Sophos;i="5.88,226,1635231600"; d="scan'208";a="227479497"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Dec 2021 06:53:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,226,1635231600"; d="scan'208";a="549456049"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.147])
 by orsmga001.jf.intel.com with SMTP; 22 Dec 2021 06:53:50 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Wed, 22 Dec 2021 16:53:50 +0200
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ALSA: hda/hdmi: Disable silent stream on GLK
Date: Wed, 22 Dec 2021 16:53:50 +0200
Message-Id: <20211222145350.24342-1-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Harsha Priya <harshapriya.n@intel.com>, intel-gfx@lists.freedesktop.org,
 stable@vger.kernel.org, Emmanuel Jillela <emmanuel.jillela@intel.com>,
 Takashi Iwai <tiwai@suse.de>
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

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

The silent stream stuff recurses back into i915 audio
component .get_power() from the .pin_eld_notify() hook.
On GLK this will deadlock as i915 may already be holding
the relevant modeset locks during .pin_eld_notify() and
the GLK audio vs. CDCLK workaround will try to grab the
same locks from .get_power().

Until someone comes up with a better fix just disable the
silent stream support on GLK.

Cc: stable@vger.kernel.org
Cc: Harsha Priya <harshapriya.n@intel.com>
Cc: Emmanuel Jillela <emmanuel.jillela@intel.com>
Cc: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Cc: Takashi Iwai <tiwai@suse.de>
Closes: https://gitlab.freedesktop.org/drm/intel/-/issues/2623
Fixes: 951894cf30f4 ("ALSA: hda/hdmi: Add Intel silent stream support")
Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 sound/pci/hda/patch_hdmi.c | 21 +++++++++++++++------
 1 file changed, 15 insertions(+), 6 deletions(-)

diff --git a/sound/pci/hda/patch_hdmi.c b/sound/pci/hda/patch_hdmi.c
index 415701bd10ac..ffcde7409d2a 100644
--- a/sound/pci/hda/patch_hdmi.c
+++ b/sound/pci/hda/patch_hdmi.c
@@ -2947,7 +2947,8 @@ static int parse_intel_hdmi(struct hda_codec *codec)
 
 /* Intel Haswell and onwards; audio component with eld notifier */
 static int intel_hsw_common_init(struct hda_codec *codec, hda_nid_t vendor_nid,
-				 const int *port_map, int port_num, int dev_num)
+				 const int *port_map, int port_num, int dev_num,
+				 bool send_silent_stream)
 {
 	struct hdmi_spec *spec;
 	int err;
@@ -2980,7 +2981,7 @@ static int intel_hsw_common_init(struct hda_codec *codec, hda_nid_t vendor_nid,
 	 * Enable silent stream feature, if it is enabled via
 	 * module param or Kconfig option
 	 */
-	if (enable_silent_stream)
+	if (send_silent_stream)
 		spec->send_silent_stream = true;
 
 	return parse_intel_hdmi(codec);
@@ -2988,12 +2989,18 @@ static int intel_hsw_common_init(struct hda_codec *codec, hda_nid_t vendor_nid,
 
 static int patch_i915_hsw_hdmi(struct hda_codec *codec)
 {
-	return intel_hsw_common_init(codec, 0x08, NULL, 0, 3);
+	return intel_hsw_common_init(codec, 0x08, NULL, 0, 3,
+				     enable_silent_stream);
 }
 
 static int patch_i915_glk_hdmi(struct hda_codec *codec)
 {
-	return intel_hsw_common_init(codec, 0x0b, NULL, 0, 3);
+	/*
+	 * Silent stream calls audio component .get_power() from
+	 * .pin_eld_notify(). On GLK this will deadlock in i915 due
+	 * to the audio vs. CDCLK workaround.
+	 */
+	return intel_hsw_common_init(codec, 0x0b, NULL, 0, 3, false);
 }
 
 static int patch_i915_icl_hdmi(struct hda_codec *codec)
@@ -3004,7 +3011,8 @@ static int patch_i915_icl_hdmi(struct hda_codec *codec)
 	 */
 	static const int map[] = {0x0, 0x4, 0x6, 0x8, 0xa, 0xb};
 
-	return intel_hsw_common_init(codec, 0x02, map, ARRAY_SIZE(map), 3);
+	return intel_hsw_common_init(codec, 0x02, map, ARRAY_SIZE(map), 3,
+				     enable_silent_stream);
 }
 
 static int patch_i915_tgl_hdmi(struct hda_codec *codec)
@@ -3016,7 +3024,8 @@ static int patch_i915_tgl_hdmi(struct hda_codec *codec)
 	static const int map[] = {0x4, 0x6, 0x8, 0xa, 0xb, 0xc, 0xd, 0xe, 0xf};
 	int ret;
 
-	ret = intel_hsw_common_init(codec, 0x02, map, ARRAY_SIZE(map), 4);
+	ret = intel_hsw_common_init(codec, 0x02, map, ARRAY_SIZE(map), 4,
+				    enable_silent_stream);
 	if (!ret) {
 		struct hdmi_spec *spec = codec->spec;
 
-- 
2.32.0

