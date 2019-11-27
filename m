Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A1C1410AEAD
	for <lists+alsa-devel@lfdr.de>; Wed, 27 Nov 2019 12:27:39 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1615D1707;
	Wed, 27 Nov 2019 12:26:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1615D1707
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1574854059;
	bh=LJfncsi5BPVABgsXXOt4W9k03A5P6X8uBB1Qb0lhCtQ=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=DDOUEVCM6M4B+ScOpUTCej3luN38kmBhyDuQtJuBJaqoghus1Z6PIUaK+pwYlnDJK
	 xy2LGGTEe4iJ+QmuVKZgwkuTATZXuPyN9/X2NjBIk5jZNcvXoc1OVH7YhHS8jc7cF3
	 a6ottzHIAw+XfwgVP+yuJAXBwOMOLuHVKEl30Z20=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7DAE8F8013B;
	Wed, 27 Nov 2019 12:25:55 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 97853F8014D; Wed, 27 Nov 2019 12:25:52 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 SURBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7F575F800CE
 for <alsa-devel@alsa-project.org>; Wed, 27 Nov 2019 12:25:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7F575F800CE
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 27 Nov 2019 03:25:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,249,1571727600"; d="scan'208";a="383474353"
Received: from zeliteleevi.tm.intel.com ([10.237.55.130])
 by orsmga005.jf.intel.com with ESMTP; 27 Nov 2019 03:25:45 -0800
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
To: alsa-devel@alsa-project.org,
	tiwai@suse.de
Date: Wed, 27 Nov 2019 13:25:36 +0200
Message-Id: <20191127112536.28791-1-kai.vehmanen@linux.intel.com>
X-Mailer: git-send-email 2.17.1
Cc: Nikhil Mahale <nmahale@nvidia.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>
Subject: [alsa-devel] [PATCH] ALSA: hda: hdmi - fix regression in connect
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

Move intel_haswell_fixup_connect_list() call to hda_read_pin_conn()
as it's not used elsewhere.

Fixes: 9c32fea83692 ("ALSA: hda - Add DP-MST support for non-acomp codecs")
BugLink: https://github.com/thesofproject/linux/issues/1537
Cc: Nikhil Mahale <nmahale@nvidia.com>
Signed-off-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
---
 sound/pci/hda/patch_hdmi.c | 24 ++++++++++++++++--------
 1 file changed, 16 insertions(+), 8 deletions(-)

diff --git a/sound/pci/hda/patch_hdmi.c b/sound/pci/hda/patch_hdmi.c
index 55d20e40a195..c111bdd566c9 100644
--- a/sound/pci/hda/patch_hdmi.c
+++ b/sound/pci/hda/patch_hdmi.c
@@ -1293,6 +1293,9 @@ static int hdmi_pcm_open(struct hda_pcm_stream *hinfo,
 	return err;
 }
 
+static void intel_haswell_fixup_connect_list(struct hda_codec *codec,
+					     hda_nid_t nid);
+
 /*
  * HDA/HDMI auto parsing
  */
@@ -1302,6 +1305,7 @@ static int hdmi_read_pin_conn(struct hda_codec *codec, int pin_idx)
 	struct hdmi_spec_per_pin *per_pin = get_pin(spec, pin_idx);
 	hda_nid_t pin_nid = per_pin->pin_nid;
 	int dev_id = per_pin->dev_id;
+	int conns;
 
 	if (!(get_wcaps(codec, pin_nid) & AC_WCAP_CONN_LIST)) {
 		codec_warn(codec,
@@ -1312,10 +1316,19 @@ static int hdmi_read_pin_conn(struct hda_codec *codec, int pin_idx)
 
 	snd_hda_set_dev_select(codec, pin_nid, dev_id);
 
+	if (spec->intel_hsw_fixup) {
+		intel_haswell_fixup_connect_list(codec, pin_nid);
+		conns = snd_hda_get_connections(codec, pin_nid,
+						per_pin->mux_nids,
+						HDA_MAX_CONNECTIONS);
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
@@ -1713,9 +1726,6 @@ static void hdmi_repoll_eld(struct work_struct *work)
 	mutex_unlock(&spec->pcm_lock);
 }
 
-static void intel_haswell_fixup_connect_list(struct hda_codec *codec,
-					     hda_nid_t nid);
-
 static int hdmi_add_pin(struct hda_codec *codec, hda_nid_t pin_nid)
 {
 	struct hdmi_spec *spec = codec->spec;
@@ -1790,8 +1800,6 @@ static int hdmi_add_pin(struct hda_codec *codec, hda_nid_t pin_nid)
 		per_pin->dev_id = i;
 		per_pin->non_pcm = false;
 		snd_hda_set_dev_select(codec, pin_nid, i);
-		if (spec->intel_hsw_fixup)
-			intel_haswell_fixup_connect_list(codec, pin_nid);
 		err = hdmi_read_pin_conn(codec, pin_idx);
 		if (err < 0)
 			return err;
-- 
2.17.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
