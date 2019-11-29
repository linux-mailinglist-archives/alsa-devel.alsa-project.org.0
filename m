Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0801C10D729
	for <lists+alsa-devel@lfdr.de>; Fri, 29 Nov 2019 15:39:58 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 786FA16CC;
	Fri, 29 Nov 2019 15:39:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 786FA16CC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1575038397;
	bh=zNSabYgrIDYG1NDLUp4+BcuV3ChR1ts+PrDvPw20AQ0=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=EXlFW0CX5Go5PFCFXqWFXUHnyAGYtVYtpM74nx4nGNlwdLOMqiPZ9BNzSDov5GznD
	 8bLesmY5uWaxKGA7cj2c8c2Rf5MKIhrEIegRefvf+6M3UMrrmDg7OGIrYvxFprJoAK
	 P0B/uajLI3SG0JXy4aw17FxfSvGDQMKZF4EUDWyY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E1773F8016F;
	Fri, 29 Nov 2019 15:38:13 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4C315F80141; Fri, 29 Nov 2019 15:38:09 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0EF1DF800C2
 for <alsa-devel@alsa-project.org>; Fri, 29 Nov 2019 15:38:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0EF1DF800C2
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 29 Nov 2019 06:38:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,257,1571727600"; d="scan'208";a="199826083"
Received: from zeliteleevi.tm.intel.com ([10.237.55.130])
 by orsmga007.jf.intel.com with ESMTP; 29 Nov 2019 06:38:00 -0800
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
To: alsa-devel@alsa-project.org, tiwai@suse.de,
 Nikhil Mahale <nmahale@nvidia.com>
Date: Fri, 29 Nov 2019 16:37:55 +0200
Message-Id: <20191129143756.23941-1-kai.vehmanen@linux.intel.com>
X-Mailer: git-send-email 2.17.1
Cc: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Subject: [alsa-devel] [PATCH 1/2] ALSA: hda: hdmi - fix kernel oops caused
	by invalid PCM idx
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

Add additional check in hdmi_find_pcm_slot() to not return
a pcm index that points to unallocated pcm. This could happen
if codec driver is set up in codec->mst_no_extra_pcms mode.
On some platforms, this leads to a kernel oops in snd_ctl_notify(),
called via update_eld().

BugLink: https://github.com/thesofproject/linux/issues/1536
Fixes: 5398e94fb753 ALSA: hda - Add DP-MST support for NVIDIA codecs
Signed-off-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
---
 sound/pci/hda/patch_hdmi.c | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/sound/pci/hda/patch_hdmi.c b/sound/pci/hda/patch_hdmi.c
index 373ca99b7a2f..c3940c197122 100644
--- a/sound/pci/hda/patch_hdmi.c
+++ b/sound/pci/hda/patch_hdmi.c
@@ -1335,24 +1335,24 @@ static int hdmi_find_pcm_slot(struct hdmi_spec *spec,
 	int i;
 
 	/*
-	 * generic_hdmi_build_pcms() allocates (num_nids + dev_num - 1)
-	 * number of pcms.
+	 * generic_hdmi_build_pcms() may allocate extra PCMs on some
+	 * platforms (with maximum of 'num_nids + dev_num - 1')
 	 *
 	 * The per_pin of pin_nid_idx=n and dev_id=m prefers to get pcm-n
 	 * if m==0. This guarantees that dynamic pcm assignments are compatible
-	 * with the legacy static per_pin-pmc assignment that existed in the
+	 * with the legacy static per_pin-pcm assignment that existed in the
 	 * days before DP-MST.
 	 *
 	 * per_pin of m!=0 prefers to get pcm=(num_nids + (m - 1)).
 	 */
-	if (per_pin->dev_id == 0 &&
-	    !test_bit(per_pin->pin_nid_idx, &spec->pcm_bitmap))
-		return per_pin->pin_nid_idx;
-
-	if (per_pin->dev_id != 0 &&
-	    !(test_bit(spec->num_nids + (per_pin->dev_id - 1),
-		&spec->pcm_bitmap))) {
-		return spec->num_nids + (per_pin->dev_id - 1);
+
+	if (per_pin->dev_id == 0) {
+		if (!test_bit(per_pin->pin_nid_idx, &spec->pcm_bitmap))
+			return per_pin->pin_nid_idx;
+	} else {
+		i = spec->num_nids + (per_pin->dev_id - 1);
+		if (i < spec->pcm_used && !(test_bit(i, &spec->pcm_bitmap)))
+			return i;
 	}
 
 	/* have a second try; check the area over num_nids */
-- 
2.17.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
