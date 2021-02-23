Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6424B322A72
	for <lists+alsa-devel@lfdr.de>; Tue, 23 Feb 2021 13:24:48 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F144C1678;
	Tue, 23 Feb 2021 13:23:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F144C1678
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1614083088;
	bh=Dhj77MmbvlQWyszPVYi9vzwlD5bTebrxbrSUuH3agyc=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Naepriugdw5RdVPU3FZ3l3AqyvGPPhKbfQZ38CW/b8SqxT2D+xc2y4TEOkq+83261
	 ObZNGa1S6FyGh3prXKtGp1kHd2B1ji14gwukR28AwjD9PxVWFHWoHcVYqpVsNg05Xa
	 KuFNrbaqflqRBqUfO0cfMcM6eX2GAchyDLVcw0qM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3C649F8016D;
	Tue, 23 Feb 2021 13:23:17 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A94D8F8016A; Tue, 23 Feb 2021 13:23:15 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CF9F6F80129
 for <alsa-devel@alsa-project.org>; Tue, 23 Feb 2021 13:23:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CF9F6F80129
Received: from [123.112.65.229] (helo=localhost.localdomain)
 by youngberry.canonical.com with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <hui.wang@canonical.com>)
 id 1lEWiY-0002hq-Ib; Tue, 23 Feb 2021 12:23:07 +0000
From: Hui Wang <hui.wang@canonical.com>
To: alsa-devel@alsa-project.org, tiwai@suse.de, kai.vehmanen@linux.intel.com
Subject: [PATCH] ALSA: hda/hdmi: let new platforms assign the pcm slot
 dynamically
Date: Tue, 23 Feb 2021 20:22:05 +0800
Message-Id: <20210223122205.233701-1-hui.wang@canonical.com>
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

Signed-off-by: Hui Wang <hui.wang@canonical.com>
---
 sound/pci/hda/patch_hdmi.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/sound/pci/hda/patch_hdmi.c b/sound/pci/hda/patch_hdmi.c
index e405be7929e3..379a4d786b3b 100644
--- a/sound/pci/hda/patch_hdmi.c
+++ b/sound/pci/hda/patch_hdmi.c
@@ -157,6 +157,7 @@ struct hdmi_spec {
 
 	bool dyn_pin_out;
 	bool dyn_pcm_assign;
+	bool no_fixed_assign;
 	bool intel_hsw_fixup;	/* apply Intel platform-specific fixups */
 	/*
 	 * Non-generic VIA/NVIDIA specific
@@ -1345,6 +1346,12 @@ static int hdmi_find_pcm_slot(struct hdmi_spec *spec,
 {
 	int i;
 
+	/* on the new machines, try to assign the pcm slot dynamically,
+	 * not use the preferred fixed map anymore.
+	 */
+	if (spec->no_fixed_assign)
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
@@ -2937,6 +2945,9 @@ static int intel_hsw_common_init(struct hda_codec *codec, hda_nid_t vendor_nid,
 	spec->port_num = port_num;
 	spec->intel_hsw_fixup = true;
 
+	if (port_num > 6)
+		spec->no_fixed_assign = true;
+
 	intel_haswell_enable_all_pins(codec, true);
 	intel_haswell_fixup_enable_dp12(codec);
 
-- 
2.25.1

