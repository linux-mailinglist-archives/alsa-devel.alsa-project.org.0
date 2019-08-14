Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 70F378DDFF
	for <lists+alsa-devel@lfdr.de>; Wed, 14 Aug 2019 21:42:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AC3BE1661;
	Wed, 14 Aug 2019 21:41:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AC3BE1661
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565811766;
	bh=kJ8iywFh3DgLf+GlcOXYROBoMI5uHJz8I1q8bxaoS8g=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mqYT4gndEOlwMVvI3/eaaw4PS0ttINTs3ruHIk81R4EaSTLOmr7dwS1txgJ7g9GOO
	 Z/uWZ5flRJA+2Y1D5QOO/RAPGX2zm1XuwUvBZB3nXTn7+CeJDLkhn+86Ltk4IAWGiF
	 0Yitzr8eyiu+FZZUqgTiS9mthPGNNz8lbBsjzwbI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 452DEF805F9;
	Wed, 14 Aug 2019 21:39:25 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9E313F805A0; Wed, 14 Aug 2019 21:39:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=5.0 tests=RCVD_IN_DNSWL_MED,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2121DF80213
 for <alsa-devel@alsa-project.org>; Wed, 14 Aug 2019 21:39:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2121DF80213
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id A7E81ACC2
 for <alsa-devel@alsa-project.org>; Wed, 14 Aug 2019 19:39:09 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Date: Wed, 14 Aug 2019 21:39:02 +0200
Message-Id: <20190814193905.5530-2-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20190814193905.5530-1-tiwai@suse.de>
References: <20190814193905.5530-1-tiwai@suse.de>
Subject: [alsa-devel] [PATCH 1/4] ALSA: hda - Drop unsol event handler for
	Intel HDMI codecs
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

We don't need to deal with the unsol events for Intel chips that are
tied with the graphics via audio component notifier.  Although the
presence of the audio component is checked at the beginning of
hdmi_unsol_event(), better to short cut by dropping unsol_event ops.

BugLink: https://bugzilla.kernel.org/show_bug.cgi?id=204565
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/hda/patch_hdmi.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/sound/pci/hda/patch_hdmi.c b/sound/pci/hda/patch_hdmi.c
index 2096993eaf28..933c7bf47ef6 100644
--- a/sound/pci/hda/patch_hdmi.c
+++ b/sound/pci/hda/patch_hdmi.c
@@ -2760,6 +2760,8 @@ static void i915_pin_cvt_fixup(struct hda_codec *codec,
 /* precondition and allocation for Intel codecs */
 static int alloc_intel_hdmi(struct hda_codec *codec)
 {
+	int err;
+
 	/* requires i915 binding */
 	if (!codec->bus->core.audio_component) {
 		codec_info(codec, "No i915 binding for Intel HDMI/DP codec\n");
@@ -2768,7 +2770,12 @@ static int alloc_intel_hdmi(struct hda_codec *codec)
 		return -ENODEV;
 	}
 
-	return alloc_generic_hdmi(codec);
+	err = alloc_generic_hdmi(codec);
+	if (err < 0)
+		return err;
+	/* no need to handle unsol events */
+	codec->patch_ops.unsol_event = NULL;
+	return 0;
 }
 
 /* parse and post-process for Intel codecs */
-- 
2.16.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
