Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EADA327FC4
	for <lists+alsa-devel@lfdr.de>; Mon,  1 Mar 2021 14:44:01 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CC4FB1685;
	Mon,  1 Mar 2021 14:43:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CC4FB1685
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1614606239;
	bh=h/lOeyaudXPDsVEdZCw3KM3ie0eUjDX+SvVcdoAc0/Q=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=ZUxX4uQHMJgk3w7QkZAuLyv2uUmXWMovVV6W8ABGXnfr0ZOnCDiB5cmS791r7BTTd
	 ypduTREPAXR6gO2SDoroGVC8IpQsl7wC8eq9QS99H6qoaFSyuGM6aj3rITbot7J2nw
	 ZrL98LkvIq2q5UZ6+Fvvjp4TbcvYkbJpYDPv+j38=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 747E9F804F3;
	Mon,  1 Mar 2021 12:13:14 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9342BF804F3; Mon,  1 Mar 2021 12:13:12 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CBD25F804F1
 for <alsa-devel@alsa-project.org>; Mon,  1 Mar 2021 12:13:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CBD25F804F1
Received: from 1.general.hwang4.uk.vpn ([10.172.195.16]
 helo=localhost.localdomain) by youngberry.canonical.com with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <hui.wang@canonical.com>)
 id 1lGgU3-0008T4-KR; Mon, 01 Mar 2021 11:13:04 +0000
From: Hui Wang <hui.wang@canonical.com>
To: alsa-devel@alsa-project.org, tiwai@suse.de, kai.vehmanen@linux.intel.com
Subject: [PATCH v3] ALSA: hda/hdmi: let new platforms assign the pcm slot
 dynamically
Date: Mon,  1 Mar 2021 19:12:02 +0800
Message-Id: <20210301111202.2684-1-hui.wang@canonical.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

If the platform set the dyn_pcm_assign to true, it will call
hdmi_find_pcm_slot() to find a pcm slot when hdmi/dp monitor is
connected and need to create a pcm.

So far only intel_hsw_common_init() and patch_nvhdmi() set the
dyn_pcm_assign to true, here we let tgl platforms assign the pcm slot
dynamically first, if the driver runs for a period of time and there
is no regression reported, we could set no_fixed_assgin to true in
the intel_hsw_common_init(), and then set it to true in the
patch_nvhdmi().

This change comes from the discussion between Takashi and
Kai Vehmanen. Please refer to:
https://github.com/alsa-project/alsa-lib/pull/118

Suggested-and-reviewed-by: Takashi Iwai <tiwai@suse.de>
Suggested-and-reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Signed-off-by: Hui Wang <hui.wang@canonical.com>
---
 sound/pci/hda/patch_hdmi.c | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/sound/pci/hda/patch_hdmi.c b/sound/pci/hda/patch_hdmi.c
index e405be7929e3..e6d0843ee9df 100644
--- a/sound/pci/hda/patch_hdmi.c
+++ b/sound/pci/hda/patch_hdmi.c
@@ -157,6 +157,7 @@ struct hdmi_spec {
 
 	bool dyn_pin_out;
 	bool dyn_pcm_assign;
+	bool dyn_pcm_no_legacy;
 	bool intel_hsw_fixup;	/* apply Intel platform-specific fixups */
 	/*
 	 * Non-generic VIA/NVIDIA specific
@@ -1345,6 +1346,12 @@ static int hdmi_find_pcm_slot(struct hdmi_spec *spec,
 {
 	int i;
 
+	/* on the new machines, try to assign the pcm slot dynamically,
+	 * not use the preferred fixed map (legacy way) anymore.
+	 */
+	if (spec->dyn_pcm_no_legacy)
+		goto last_try;
+
 	/*
 	 * generic_hdmi_build_pcms() may allocate extra PCMs on some
 	 * platforms (with maximum of 'num_nids + dev_num - 1')
@@ -1374,6 +1381,7 @@ static int hdmi_find_pcm_slot(struct hdmi_spec *spec,
 			return i;
 	}
 
+ last_try:
 	/* the last try; check the empty slots in pins */
 	for (i = 0; i < spec->num_nids; i++) {
 		if (!test_bit(i, &spec->pcm_bitmap))
@@ -2987,8 +2995,16 @@ static int patch_i915_tgl_hdmi(struct hda_codec *codec)
 	 * the index indicate the port number.
 	 */
 	static const int map[] = {0x4, 0x6, 0x8, 0xa, 0xb, 0xc, 0xd, 0xe, 0xf};
+	int ret;
 
-	return intel_hsw_common_init(codec, 0x02, map, ARRAY_SIZE(map));
+	ret = intel_hsw_common_init(codec, 0x02, map, ARRAY_SIZE(map));
+	if (!ret) {
+		struct hdmi_spec *spec = codec->spec;
+
+		spec->dyn_pcm_no_legacy = true;
+	}
+
+	return ret;
 }
 
 /* Intel Baytrail and Braswell; with eld notifier */
-- 
2.25.1

