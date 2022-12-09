Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F4B26480D2
	for <lists+alsa-devel@lfdr.de>; Fri,  9 Dec 2022 11:20:36 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0352221AF;
	Fri,  9 Dec 2022 11:19:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0352221AF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1670581235;
	bh=ADEYj8kskGbNmo00w5Sm0GFF91EaWE2imwSisI+6PQk=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=kBce1JuWiSXeCQiM2545SPQRDjs3vps0uho0GoSxDHCSpt1SXVZ9D4kYhzpFR++Ff
	 C4l3tZKmBkTdQjU1cQSbZu3hKHd3RUk/a+J5o/c6TFNzpl2uQacOGeaoKeaUafPqwd
	 eNgSImy64Psid+9bJJfU5e1sFhcQrphqtGqb09sM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B71CEF8045D;
	Fri,  9 Dec 2022 11:18:56 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 15DB1F8025F; Fri,  9 Dec 2022 11:18:54 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
 version=3.4.6
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F15BFF8016E
 for <alsa-devel@alsa-project.org>; Fri,  9 Dec 2022 11:18:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F15BFF8016E
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=gjrBbdfg
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1670581133; x=1702117133;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ADEYj8kskGbNmo00w5Sm0GFF91EaWE2imwSisI+6PQk=;
 b=gjrBbdfgtxGmpG5qamKwU5aNGKGKfbpFoTPdgrMswIGIETiAnb3ZK2J6
 /+SPvVg3P3B1Gi3Ur07mMCFW8rj/dnaazqaawr3YdI0A6RGApB54kAKPJ
 8UWEvOBfIMMIMs9572YewKRJk2njw47oiTpsuQ4b4yScQovUyIoky3xF/
 nVgvD1IT4UVv6EXj6TA/rJZga6/DYHD0eRnC4/bGrdurZ+MTCiJYjC5K4
 20zZ8yTH3/k0z6jw8HJ9dBLk70FQEc7KaZBB7imGS7BLU0fsOChRdYINm
 qOJDMyGVPUL+A/YTxXkiF2rxHTFDOGmCsDYkWGlI/PhiDSCfWg0LtUR+8 Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10555"; a="316135190"
X-IronPort-AV: E=Sophos;i="5.96,230,1665471600"; d="scan'208";a="316135190"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2022 02:18:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10555"; a="649510766"
X-IronPort-AV: E=Sophos;i="5.96,230,1665471600"; d="scan'208";a="649510766"
Received: from eliteleevi.tm.intel.com ([10.237.54.20])
 by fmsmga007.fm.intel.com with ESMTP; 09 Dec 2022 02:18:46 -0800
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
To: alsa-devel@alsa-project.org,
	tiwai@suse.de
Subject: [PATCH v2 1/3] ALSA: hda/hdmi: fix i915 silent stream programming flow
Date: Fri,  9 Dec 2022 12:18:20 +0200
Message-Id: <20221209101822.3893675-2-kai.vehmanen@linux.intel.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221209101822.3893675-1-kai.vehmanen@linux.intel.com>
References: <20221209101822.3893675-1-kai.vehmanen@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: intel-gfx@lists.freedesktop.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 kai.vehmanen@linux.intel.com, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

The i915 display codec may not successfully transition to
normal audio streaming mode, if the stream id is programmed
while codec is actively transmitting data. This can happen
when silent stream is enabled in KAE mode.

Fix the issue by implementing a i915 specific programming
flow, where the silent streaming is temporarily stopped,
a small delay is applied to ensure display codec becomes
idle, and then proceed with reprogramming the stream ID.

Fixes: 15175a4f2bbb ("ALSA: hda/hdmi: add keep-alive support for ADL-P and DG2")
Link: https://gitlab.freedesktop.org/drm/intel/-/issues/7353
Signed-off-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Tested-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 sound/pci/hda/patch_hdmi.c | 28 ++++++++++++++++++++++++++--
 1 file changed, 26 insertions(+), 2 deletions(-)

diff --git a/sound/pci/hda/patch_hdmi.c b/sound/pci/hda/patch_hdmi.c
index 7a40ddfd695a..48bb23745ed3 100644
--- a/sound/pci/hda/patch_hdmi.c
+++ b/sound/pci/hda/patch_hdmi.c
@@ -2879,9 +2879,33 @@ static int i915_hsw_setup_stream(struct hda_codec *codec, hda_nid_t cvt_nid,
 				 hda_nid_t pin_nid, int dev_id, u32 stream_tag,
 				 int format)
 {
+	struct hdmi_spec *spec = codec->spec;
+	int pin_idx = pin_id_to_pin_index(codec, pin_nid, dev_id);
+	struct hdmi_spec_per_pin *per_pin;
+	int res;
+
+	if (pin_idx < 0)
+		per_pin = NULL;
+	else
+		per_pin = get_pin(spec, pin_idx);
+
 	haswell_verify_D0(codec, cvt_nid, pin_nid);
-	return hdmi_setup_stream(codec, cvt_nid, pin_nid, dev_id,
-				 stream_tag, format);
+
+	if (spec->silent_stream_type == SILENT_STREAM_KAE && per_pin && per_pin->silent_stream) {
+		silent_stream_set_kae(codec, per_pin, false);
+		/* wait for pending transfers in codec to clear */
+		usleep_range(100, 200);
+	}
+
+	res = hdmi_setup_stream(codec, cvt_nid, pin_nid, dev_id,
+				stream_tag, format);
+
+	if (spec->silent_stream_type == SILENT_STREAM_KAE && per_pin && per_pin->silent_stream) {
+		usleep_range(100, 200);
+		silent_stream_set_kae(codec, per_pin, true);
+	}
+
+	return res;
 }
 
 /* pin_cvt_fixup ops override for HSW+ and VLV+ */
-- 
2.38.1

