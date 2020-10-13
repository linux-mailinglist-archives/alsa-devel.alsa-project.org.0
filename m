Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3532628D14C
	for <lists+alsa-devel@lfdr.de>; Tue, 13 Oct 2020 17:30:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 81D3B16A2;
	Tue, 13 Oct 2020 17:29:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 81D3B16A2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1602603013;
	bh=m7KEjxg2JH3sMEFVsKN0jVXrovM12etBI/oIql5RhD4=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=PNXqzGdL4Efu+9zp1puIBUeLWiONP977gaXsmOdygKNJSMoa9tygPDyDh8c3nzXE5
	 gWiADtaoAcisGu33kWYu5wtnpPdt/+3+1yLWaGWrWD7Kbx/iSrorP3uaZiGj7ryhV0
	 urqC7/bsIZCayFJH/Ol07a4ad3WHMOI/PscZ9Wkg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EA058F8012C;
	Tue, 13 Oct 2020 17:28:32 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 37DC4F801A3; Tue, 13 Oct 2020 17:28:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 43E30F8012C
 for <alsa-devel@alsa-project.org>; Tue, 13 Oct 2020 17:28:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 43E30F8012C
IronPort-SDR: WW20+MtYCpQZoZbaHSsnheVSSkWN+ZFThapNyf2YV5kfP0Zi2hIVmr0ktMsj5gmrd/TDfL9mju
 35CpniWjO1Yg==
X-IronPort-AV: E=McAfee;i="6000,8403,9773"; a="183412104"
X-IronPort-AV: E=Sophos;i="5.77,371,1596524400"; d="scan'208";a="183412104"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2020 08:28:21 -0700
IronPort-SDR: AjleprcdKEDr50yzVD2oMEWiBk9wSuVt1i49HPTqr9ke7d9NJs1fhNJJSvn4Abn8Oo462gtWdb
 lw1nXMz1ieDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,371,1596524400"; d="scan'208";a="530434029"
Received: from eliteleevi.tm.intel.com ([10.237.54.20])
 by orsmga005.jf.intel.com with ESMTP; 13 Oct 2020 08:28:20 -0700
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
To: alsa-devel@alsa-project.org,
	tiwai@suse.de
Subject: [PATCH] ALSA: hda/hdmi: fix incorrect locking in hdmi_pcm_close
Date: Tue, 13 Oct 2020 18:26:28 +0300
Message-Id: <20201013152628.920764-1-kai.vehmanen@linux.intel.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Kai Vehmanen <kai.vehmanen@linux.intel.com>
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

A race exists between closing a PCM and update of ELD data. In
hdmi_pcm_close(), hinfo->nid value is modified without taking
spec->pcm_lock. If this happens concurrently while processing an ELD
update in hdmi_pcm_setup_pin(), converter assignment may be done
incorrectly.

This bug was found by hitting a WARN_ON in snd_hda_spdif_ctls_assign()
in a HDMI receiver connection stress test:

[2739.684569] WARNING: CPU: 5 PID: 2090 at sound/pci/hda/patch_hdmi.c:1898 check_non_pcm_per_cvt+0x41/0x50 [snd_hda_codec_hdmi]
...
[2739.684707] Call Trace:
[2739.684720]  update_eld+0x121/0x5a0 [snd_hda_codec_hdmi]
[2739.684736]  hdmi_present_sense+0x21e/0x3b0 [snd_hda_codec_hdmi]
[2739.684750]  check_presence_and_report+0x81/0xd0 [snd_hda_codec_hdmi]
[2739.684842]  intel_audio_codec_enable+0x122/0x190 [i915]

Fixes: 42b2987079ec ("ALSA: hda - hdmi playback without monitor in dynamic pcm bind mode")
Signed-off-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
---
 sound/pci/hda/patch_hdmi.c | 20 ++++++++++++--------
 1 file changed, 12 insertions(+), 8 deletions(-)

diff --git a/sound/pci/hda/patch_hdmi.c b/sound/pci/hda/patch_hdmi.c
index 0ffbfcb91256..ccd1df059654 100644
--- a/sound/pci/hda/patch_hdmi.c
+++ b/sound/pci/hda/patch_hdmi.c
@@ -2046,22 +2046,25 @@ static int hdmi_pcm_close(struct hda_pcm_stream *hinfo,
 	int pinctl;
 	int err = 0;
 
+	mutex_lock(&spec->pcm_lock);
 	if (hinfo->nid) {
 		pcm_idx = hinfo_to_pcm_index(codec, hinfo);
-		if (snd_BUG_ON(pcm_idx < 0))
-			return -EINVAL;
+		if (snd_BUG_ON(pcm_idx < 0)) {
+			err = -EINVAL;
+			goto unlock;
+		}
 		cvt_idx = cvt_nid_to_cvt_index(codec, hinfo->nid);
-		if (snd_BUG_ON(cvt_idx < 0))
-			return -EINVAL;
+		if (snd_BUG_ON(cvt_idx < 0)) {
+			err = -EINVAL;
+			goto unlock;
+		}
 		per_cvt = get_cvt(spec, cvt_idx);
-
 		snd_BUG_ON(!per_cvt->assigned);
 		per_cvt->assigned = 0;
 		hinfo->nid = 0;
 
 		azx_stream(get_azx_dev(substream))->stripe = 0;
 
-		mutex_lock(&spec->pcm_lock);
 		snd_hda_spdif_ctls_unassign(codec, pcm_idx);
 		clear_bit(pcm_idx, &spec->pcm_in_use);
 		pin_idx = hinfo_to_pin_index(codec, hinfo);
@@ -2091,10 +2094,11 @@ static int hdmi_pcm_close(struct hda_pcm_stream *hinfo,
 		per_pin->setup = false;
 		per_pin->channels = 0;
 		mutex_unlock(&per_pin->lock);
-	unlock:
-		mutex_unlock(&spec->pcm_lock);
 	}
 
+unlock:
+	mutex_unlock(&spec->pcm_lock);
+
 	return err;
 }
 
-- 
2.28.0

