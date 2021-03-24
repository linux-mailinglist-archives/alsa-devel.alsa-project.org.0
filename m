Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CC9A347F56
	for <lists+alsa-devel@lfdr.de>; Wed, 24 Mar 2021 18:29:23 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 154DA1655;
	Wed, 24 Mar 2021 18:28:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 154DA1655
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1616606963;
	bh=k1Wr2Bnj3PVMFXqHqTdeGfWV61AuxymsEJnP8LxB9rc=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=LziJLiKzOZCyFEjPus1dZEXl3FtTWLYXcA5uWLzo7omjO7OC6xat5C4SfP374A2bd
	 X2OC3xSbgcgQaydxCSppqxd41vJtiBG7eGdwA07LGUjxZu6QM4krzilTAJp+y1P8Kx
	 YBsFg59rLNDpEdCf5pHfYubhJJMg7/M57LgrgcnA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 370BAF80156;
	Wed, 24 Mar 2021 18:27:56 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 43F27F8016B; Wed, 24 Mar 2021 18:27:54 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 611C7F800FF
 for <alsa-devel@alsa-project.org>; Wed, 24 Mar 2021 18:27:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 611C7F800FF
IronPort-SDR: rS4rS14m8HTDmmmUCH3X8V2oolrYt2Wgu0U7yKn+DQA+nx2LhVtW8zc04YcnO3F4SqFLXWI9ke
 5bkK3uxpooGQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9933"; a="188455613"
X-IronPort-AV: E=Sophos;i="5.81,275,1610438400"; d="scan'208";a="188455613"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2021 10:27:39 -0700
IronPort-SDR: Yym6OAZFhldX12hyhNekIJiyNW8RR44OPbYhDz7ZykVzdVu2iEgW6pLEivQbaULu/0LD/bMipG
 pyoPWh1fu77w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,275,1610438400"; d="scan'208";a="442330622"
Received: from eliteleevi.tm.intel.com ([10.237.54.20])
 by fmsmga002.fm.intel.com with ESMTP; 24 Mar 2021 10:27:37 -0700
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
To: alsa-devel@alsa-project.org,
	tiwai@suse.de
Subject: [PATCH] ALSA: hda/hdmi: fix max DP-MST dev_num for Intel TGL+
 platforms
Date: Wed, 24 Mar 2021 19:23:37 +0200
Message-Id: <20210324172337.51730-1-kai.vehmanen@linux.intel.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 pierre-louis.bossart@linux.intel.com, kai.vehmanen@linux.intel.com,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
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

Increase the device select range to 4 on platforms supporting
4 concurrent displays.

This fixes a problem in scenario where total of 4 displays are active,
and 3 of these are audio capable DP receivers and connected to a DP-MST
hub. Due to incorrect range for device select, audio could not be played
to the 3rd monitor in DP-MST hub.

BugLink: https://github.com/thesofproject/linux/issues/2798
Signed-off-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
---
 sound/pci/hda/patch_hdmi.c | 25 +++++++++++--------------
 1 file changed, 11 insertions(+), 14 deletions(-)

diff --git a/sound/pci/hda/patch_hdmi.c b/sound/pci/hda/patch_hdmi.c
index 45ae845e82df..5de3666a7101 100644
--- a/sound/pci/hda/patch_hdmi.c
+++ b/sound/pci/hda/patch_hdmi.c
@@ -1848,16 +1848,12 @@ static int hdmi_add_pin(struct hda_codec *codec, hda_nid_t pin_nid)
 	 */
 	if (spec->intel_hsw_fixup) {
 		/*
-		 * On Intel platforms, device entries number is
-		 * changed dynamically. If there is a DP MST
-		 * hub connected, the device entries number is 3.
-		 * Otherwise, it is 1.
-		 * Here we manually set dev_num to 3, so that
-		 * we can initialize all the device entries when
-		 * bootup statically.
+		 * On Intel platforms, device entries count returned
+		 * by AC_PAR_DEVLIST_LEN is dynamic, and depends on
+		 * the type of receiver that is connected. Allocate pin
+		 * structures based on worst case.
 		 */
-		dev_num = 3;
-		spec->dev_num = 3;
+		dev_num = spec->dev_num;
 	} else if (spec->dyn_pcm_assign && codec->dp_mst) {
 		dev_num = snd_hda_get_num_devices(codec, pin_nid) + 1;
 		/*
@@ -2942,7 +2938,7 @@ static int parse_intel_hdmi(struct hda_codec *codec)
 
 /* Intel Haswell and onwards; audio component with eld notifier */
 static int intel_hsw_common_init(struct hda_codec *codec, hda_nid_t vendor_nid,
-				 const int *port_map, int port_num)
+				 const int *port_map, int port_num, int dev_num)
 {
 	struct hdmi_spec *spec;
 	int err;
@@ -2957,6 +2953,7 @@ static int intel_hsw_common_init(struct hda_codec *codec, hda_nid_t vendor_nid,
 	spec->port_map = port_map;
 	spec->port_num = port_num;
 	spec->intel_hsw_fixup = true;
+	spec->dev_num = dev_num;
 
 	intel_haswell_enable_all_pins(codec, true);
 	intel_haswell_fixup_enable_dp12(codec);
@@ -2982,12 +2979,12 @@ static int intel_hsw_common_init(struct hda_codec *codec, hda_nid_t vendor_nid,
 
 static int patch_i915_hsw_hdmi(struct hda_codec *codec)
 {
-	return intel_hsw_common_init(codec, 0x08, NULL, 0);
+	return intel_hsw_common_init(codec, 0x08, NULL, 0, 3);
 }
 
 static int patch_i915_glk_hdmi(struct hda_codec *codec)
 {
-	return intel_hsw_common_init(codec, 0x0b, NULL, 0);
+	return intel_hsw_common_init(codec, 0x0b, NULL, 0, 3);
 }
 
 static int patch_i915_icl_hdmi(struct hda_codec *codec)
@@ -2998,7 +2995,7 @@ static int patch_i915_icl_hdmi(struct hda_codec *codec)
 	 */
 	static const int map[] = {0x0, 0x4, 0x6, 0x8, 0xa, 0xb};
 
-	return intel_hsw_common_init(codec, 0x02, map, ARRAY_SIZE(map));
+	return intel_hsw_common_init(codec, 0x02, map, ARRAY_SIZE(map), 3);
 }
 
 static int patch_i915_tgl_hdmi(struct hda_codec *codec)
@@ -3010,7 +3007,7 @@ static int patch_i915_tgl_hdmi(struct hda_codec *codec)
 	static const int map[] = {0x4, 0x6, 0x8, 0xa, 0xb, 0xc, 0xd, 0xe, 0xf};
 	int ret;
 
-	ret = intel_hsw_common_init(codec, 0x02, map, ARRAY_SIZE(map));
+	ret = intel_hsw_common_init(codec, 0x02, map, ARRAY_SIZE(map), 4);
 	if (!ret) {
 		struct hdmi_spec *spec = codec->spec;
 

base-commit: 950dc7fe37b99e77160154f6ce767b987816deaf
-- 
2.29.2

