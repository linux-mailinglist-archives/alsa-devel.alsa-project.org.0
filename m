Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BD52E10D731
	for <lists+alsa-devel@lfdr.de>; Fri, 29 Nov 2019 15:40:44 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3EDF116D4;
	Fri, 29 Nov 2019 15:39:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3EDF116D4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1575038444;
	bh=64un+oTE0YGBCfVrFVKsdmdT/OP2UTCJ7E4Cj3edvIc=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=cTeSgLQk1PUxL522XfFzgTy1/vUI6603cGv8n4Q//EziR2/lLbVRQ6Q7ai/SUVYxN
	 mhQF5ubTPOS6mUvn8ckZDVK02FWrJ+2FbtGZyw9+C8jMhg4f9LbqsVbw6poyDN0WFO
	 KcUKLul5v8owg0OeUtRpLhVuENZhLp8j//9mpfG0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8B31BF801F5;
	Fri, 29 Nov 2019 15:38:19 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1186FF801DB; Fri, 29 Nov 2019 15:38:17 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5112BF8014D
 for <alsa-devel@alsa-project.org>; Fri, 29 Nov 2019 15:38:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5112BF8014D
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 29 Nov 2019 06:38:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,257,1571727600"; d="scan'208";a="199826139"
Received: from zeliteleevi.tm.intel.com ([10.237.55.130])
 by orsmga007.jf.intel.com with ESMTP; 29 Nov 2019 06:38:08 -0800
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
To: alsa-devel@alsa-project.org, tiwai@suse.de,
 Nikhil Mahale <nmahale@nvidia.com>
Date: Fri, 29 Nov 2019 16:37:56 +0200
Message-Id: <20191129143756.23941-2-kai.vehmanen@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191129143756.23941-1-kai.vehmanen@linux.intel.com>
References: <20191129143756.23941-1-kai.vehmanen@linux.intel.com>
Cc: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Subject: [alsa-devel] [PATCH 2/2] [RFC] ALSA: hda: hdmi - preserve non-MST
	PCM routing for Intel platforms
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

Commit 5398e94fb753 ("ALSA: hda - Add DP-MST support for NVIDIA codecs")
introduced a slight change of behaviour how non-MST monitors are
assigned to PCMs on Intel platforms.

In the drm_audio_component.h interface, the third parameter
to pin_eld_notify() is pipe number. On Intel platforms, this value
is -1 for MST. On other platforms, a non-zero pipe id is used to
signal MST use.

This difference leads to some subtle differences in hdmi_find_pcm_slot()
with regards to how non-MST monitors are assigned to PCMs.
This patch restores the original behaviour on Intel platforms while
keeping the new allocation policy on other platforms.

Signed-off-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
---
 sound/pci/hda/patch_hdmi.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/sound/pci/hda/patch_hdmi.c b/sound/pci/hda/patch_hdmi.c
index c3940c197122..1dd4c92254a4 100644
--- a/sound/pci/hda/patch_hdmi.c
+++ b/sound/pci/hda/patch_hdmi.c
@@ -1353,6 +1353,11 @@ static int hdmi_find_pcm_slot(struct hdmi_spec *spec,
 		i = spec->num_nids + (per_pin->dev_id - 1);
 		if (i < spec->pcm_used && !(test_bit(i, &spec->pcm_bitmap)))
 			return i;
+
+		/* keep legacy assignment for dev_id>0 on Intel platforms */
+		if (spec->intel_hsw_fixup)
+			if (!test_bit(per_pin->pin_nid_idx, &spec->pcm_bitmap))
+				return per_pin->pin_nid_idx;
 	}
 
 	/* have a second try; check the area over num_nids */
-- 
2.17.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
