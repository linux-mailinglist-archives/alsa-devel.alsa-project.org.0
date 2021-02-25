Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D763324DF0
	for <lists+alsa-devel@lfdr.de>; Thu, 25 Feb 2021 11:23:13 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 003E91657;
	Thu, 25 Feb 2021 11:22:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 003E91657
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1614248593;
	bh=Mt3wPpETXxMyt16qhDz+HNQLYO0RYq7JTvd9YBq7qyc=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=f80dfTjqquWOYo8jJGMvGlt2qcGT6NCVeECPnZDsztMCdENHcsE4/lvc3+yIzf99m
	 vPuXxQavhe9vFFNGW/R8B//5ByQHkI0eWtDYBu30UnwZ4h1bmrGoRaCjDRZ0eNvtCv
	 ptGpAJuJPbSo/+XvvAgODD5KDA8nllq8VHfnc3YY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 50514F8016D;
	Thu, 25 Feb 2021 11:21:42 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 346B4F8016A; Thu, 25 Feb 2021 11:21:40 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 07847F80159
 for <alsa-devel@alsa-project.org>; Thu, 25 Feb 2021 11:21:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 07847F80159
Received: from [123.112.65.122] (helo=localhost.localdomain)
 by youngberry.canonical.com with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <hui.wang@canonical.com>)
 id 1lFDly-0003Cy-Bh; Thu, 25 Feb 2021 10:21:31 +0000
From: Hui Wang <hui.wang@canonical.com>
To: alsa-devel@alsa-project.org, tiwai@suse.de, kai.vehmanen@linux.intel.com
Subject: [PATCH v2] ALSA: hda/hdmi: let new platforms assign the pcm slot
 dynamically
Date: Thu, 25 Feb 2021 18:20:28 +0800
Message-Id: <20210225102028.41769-1-hui.wang@canonical.com>
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
Did the test with this patch on 2 TGL machines, and with both legacy
HDA driver and sof driver, plug 1 monitor into the machine, plug 2
monitors into the machine and plug 2 monitors into a dp-mst hub, they
all worked as expcted, the first 2 pcm slots was assigned to monitors,
and playback worked well.

 sound/pci/hda/patch_hdmi.c | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/sound/pci/hda/patch_hdmi.c b/sound/pci/hda/patch_hdmi.c
index 97adff0cbcab..1aca815b920d 100644
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
@@ -2988,8 +2996,16 @@ static int patch_i915_tgl_hdmi(struct hda_codec *codec)
 	 * the index indicate the port number.
 	 */
 	static const int map[] = {0x4, 0x6, 0x8, 0xa, 0xb, 0xc, 0xd, 0xe, 0xf};
+	int ret;
 
-	return intel_hsw_common_init(codec, 0x02, map, ARRAY_SIZE(map));
+	ret = intel_hsw_common_init(codec, 0x02, map, ARRAY_SIZE(map));
+	if (!ret) {
+		struct hdmi_spec *spec = codec->spec;
+
+		spec->no_fixed_assign = true;
+	}
+
+	return ret;
 }
 
 /* Intel Baytrail and Braswell; with eld notifier */
-- 
2.25.1

