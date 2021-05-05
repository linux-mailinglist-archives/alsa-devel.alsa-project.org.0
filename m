Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 28E3C3740A4
	for <lists+alsa-devel@lfdr.de>; Wed,  5 May 2021 18:35:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 80D3C16D7;
	Wed,  5 May 2021 18:34:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 80D3C16D7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1620232545;
	bh=U8rsntay85eppEKTFN+l4F5otujEXnDUOLfZdQ9xdp8=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HRYds3+eMb+DWlnoseBC/44h7SX5jwT5OLPqHFaCB74aV/nPBCTI39s7c2zYlfRqO
	 QpHH79qgX99Gc0Gjd7eH2jRwYjhbyY4+Z31ht7mBS8xW06qJaqRXdUK6GEFVxHI4k2
	 72BncbeiWKRXf75KtqP4VsdVJMafvpyvSSTNjBdg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D2509F804D9;
	Wed,  5 May 2021 18:32:13 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6917CF804DF; Wed,  5 May 2021 18:32:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2BBF9F804D8
 for <alsa-devel@alsa-project.org>; Wed,  5 May 2021 18:32:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2BBF9F804D8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="OTY2GtNd"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8DF6E613FC;
 Wed,  5 May 2021 16:32:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1620232326;
 bh=U8rsntay85eppEKTFN+l4F5otujEXnDUOLfZdQ9xdp8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=OTY2GtNdzYcwXD3vo7XEh3kvnNmnrRWY8S/PfWuUjq39WHava+kPhbW73iFkiqEZG
 82VElNVPfTgHQlID4n0ekXaQ8jzXNjrGL4Aqnt3NrXSf27Y/0fK2OqqsbTct/r+VFz
 EiXJn1hYSZPyydNP1S2Ut28UlSOqCKrJnsbbo/+HqT4QtB+995rMgWt8p8Wiz3A6ID
 w07bpNoPSbPmOBcNoBpYAP/w4EGIVFqSon28vDyqhBhO+fqzZ/hqmcobp0bJK2gAEK
 7yuJ9s4QYYO2aFVAZ5xJrzfVLeXhD0n/UiqZagMcE7Ep5H7q+bPHKPlvK1N986klK0
 dOKrF5onisRzQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.12 030/116] ALSA: hda/hdmi: fix max DP-MST dev_num
 for Intel TGL+ platforms
Date: Wed,  5 May 2021 12:29:58 -0400
Message-Id: <20210505163125.3460440-30-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210505163125.3460440-1-sashal@kernel.org>
References: <20210505163125.3460440-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Cc: Sasha Levin <sashal@kernel.org>,
 Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 alsa-devel@alsa-project.org, Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Takashi Iwai <tiwai@suse.de>,
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

From: Kai Vehmanen <kai.vehmanen@linux.intel.com>

[ Upstream commit e839fbed26e8b8713803b8ac73da92fd2b0c7594 ]

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
Link: https://lore.kernel.org/r/20210324172337.51730-1-kai.vehmanen@linux.intel.com
Signed-off-by: Takashi Iwai <tiwai@suse.de>
Signed-off-by: Sasha Levin <sashal@kernel.org>
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
 
-- 
2.30.2

