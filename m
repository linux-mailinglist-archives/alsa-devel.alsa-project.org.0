Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C4D7A10AF9E
	for <lists+alsa-devel@lfdr.de>; Wed, 27 Nov 2019 13:37:56 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 55646172F;
	Wed, 27 Nov 2019 13:37:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 55646172F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1574858276;
	bh=yzAMB9vOh66bgH0xnl9HzjutexUsV25TeYZW7PrvBt8=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=W7TxXyc9EEDE/V9hMXobeZuwyHynKru1IagStDBSYlZ4QWIiL6MsxStKcKoJqBXtp
	 HIhr3lEcqYOpSjdDA3LHGT0/ED8use5hEF2jsJFAFlYNn1tFyJ4+YzK1XQZCH/oR4e
	 ciDhMPFKIZwlAB687gipsimLHzGDNtD8S8vHq7mM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 44D65F80171;
	Wed, 27 Nov 2019 13:36:13 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EDF72F8014D; Wed, 27 Nov 2019 13:36:10 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5CEECF800CE
 for <alsa-devel@alsa-project.org>; Wed, 27 Nov 2019 13:36:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5CEECF800CE
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 27 Nov 2019 04:36:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,249,1571727600"; d="scan'208";a="199173519"
Received: from zeliteleevi.tm.intel.com ([10.237.55.130])
 by orsmga007.jf.intel.com with ESMTP; 27 Nov 2019 04:36:03 -0800
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
To: alsa-devel@alsa-project.org,
	tiwai@suse.de
Date: Wed, 27 Nov 2019 14:35:57 +0200
Message-Id: <20191127123557.15583-1-kai.vehmanen@linux.intel.com>
X-Mailer: git-send-email 2.17.1
Cc: Nikhil Mahale <nmahale@nvidia.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>
Subject: [alsa-devel] [PATCH v2] ALSA: hda: hdmi - fix regression in connect
	list handling
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Fix regression in how intel_haswell_fixup_connect_list()
results are used in hda_read_pin_conn(). Use of
snd_hda_get_raw_connections() in hda_read_pin_conn() bypasses
the cache and thus also bypasses the overridden pin connection
list. On platforms that require the connection list fixup,
mux list will be empty and HDMI playback will fail to -EBUSY
at open.

Fix the regression in hda_read_pinn_conn(). Simplify code
as suggested by Takashi Iwai to remove old
intel_haswell_fixup_connect_list() and copy the cvt_nid list
directly and not use snd_hda_override_conn_list() at all.

Fixes: 9c32fea83692 ("ALSA: hda - Add DP-MST support for non-acomp codecs")
BugLink: https://github.com/thesofproject/linux/issues/1537
Cc: Nikhil Mahale <nmahale@nvidia.com>
Signed-off-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
---
 sound/pci/hda/patch_hdmi.c | 42 +++++++++++---------------------------
 1 file changed, 12 insertions(+), 30 deletions(-)

diff --git a/sound/pci/hda/patch_hdmi.c b/sound/pci/hda/patch_hdmi.c
index 55d20e40a195..cad99e1f9222 100644
--- a/sound/pci/hda/patch_hdmi.c
+++ b/sound/pci/hda/patch_hdmi.c
@@ -1302,6 +1302,7 @@ static int hdmi_read_pin_conn(struct hda_codec *codec, int pin_idx)
 	struct hdmi_spec_per_pin *per_pin = get_pin(spec, pin_idx);
 	hda_nid_t pin_nid = per_pin->pin_nid;
 	int dev_id = per_pin->dev_id;
+	int conns;
 
 	if (!(get_wcaps(codec, pin_nid) & AC_WCAP_CONN_LIST)) {
 		codec_warn(codec,
@@ -1312,10 +1313,18 @@ static int hdmi_read_pin_conn(struct hda_codec *codec, int pin_idx)
 
 	snd_hda_set_dev_select(codec, pin_nid, dev_id);
 
+	if (spec->intel_hsw_fixup) {
+		conns = spec->num_cvts;
+		memcpy(per_pin->mux_nids, spec->cvt_nids,
+		       sizeof(hda_nid_t) * conns);
+	} else {
+		conns = snd_hda_get_raw_connections(codec, pin_nid,
+						    per_pin->mux_nids,
+						    HDA_MAX_CONNECTIONS);
+	}
+
 	/* all the device entries on the same pin have the same conn list */
-	per_pin->num_mux_nids =
-		snd_hda_get_raw_connections(codec, pin_nid, per_pin->mux_nids,
-					    HDA_MAX_CONNECTIONS);
+	per_pin->num_mux_nids = conns;
 
 	return 0;
 }
@@ -1713,9 +1722,6 @@ static void hdmi_repoll_eld(struct work_struct *work)
 	mutex_unlock(&spec->pcm_lock);
 }
 
-static void intel_haswell_fixup_connect_list(struct hda_codec *codec,
-					     hda_nid_t nid);
-
 static int hdmi_add_pin(struct hda_codec *codec, hda_nid_t pin_nid)
 {
 	struct hdmi_spec *spec = codec->spec;
@@ -1790,8 +1796,6 @@ static int hdmi_add_pin(struct hda_codec *codec, hda_nid_t pin_nid)
 		per_pin->dev_id = i;
 		per_pin->non_pcm = false;
 		snd_hda_set_dev_select(codec, pin_nid, i);
-		if (spec->intel_hsw_fixup)
-			intel_haswell_fixup_connect_list(codec, pin_nid);
 		err = hdmi_read_pin_conn(codec, pin_idx);
 		if (err < 0)
 			return err;
@@ -2599,28 +2603,6 @@ static void generic_acomp_init(struct hda_codec *codec,
 	}
 }
 
-/*
- * Intel codec parsers and helpers
- */
-
-static void intel_haswell_fixup_connect_list(struct hda_codec *codec,
-					     hda_nid_t nid)
-{
-	struct hdmi_spec *spec = codec->spec;
-	hda_nid_t conns[4];
-	int nconns;
-
-	nconns = snd_hda_get_raw_connections(codec, nid, conns,
-					     ARRAY_SIZE(conns));
-	if (nconns == spec->num_cvts &&
-	    !memcmp(conns, spec->cvt_nids, spec->num_cvts * sizeof(hda_nid_t)))
-		return;
-
-	/* override pins connection list */
-	codec_dbg(codec, "hdmi: haswell: override pin connection 0x%x\n", nid);
-	snd_hda_override_conn_list(codec, nid, spec->num_cvts, spec->cvt_nids);
-}
-
 #define INTEL_GET_VENDOR_VERB	0xf81
 #define INTEL_SET_VENDOR_VERB	0x781
 #define INTEL_EN_DP12		0x02	/* enable DP 1.2 features */
-- 
2.17.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
