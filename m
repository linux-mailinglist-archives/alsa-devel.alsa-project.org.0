Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 380B911DFF5
	for <lists+alsa-devel@lfdr.de>; Fri, 13 Dec 2019 09:53:52 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A1F16176A;
	Fri, 13 Dec 2019 09:53:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A1F16176A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1576227231;
	bh=naiIj3iC5ax8J12A0MTj4nQ7LQ3t7PIyiskL3g/YAFA=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=MXAqSPp216M1mstxBqLmKZHyVbRaXs2/8leaF3RzgJXUWfpJkn0Hvre6lBkiGeSEF
	 5JOueASbw8wTNCalGqtolkg1qVOyOXnkiN6VEJKBRRpeGVUXVDMa/E7sSPXPxlNbP3
	 oyieyUvykIUbp3v6trKgARb9xOOwlSX2voNGlc1E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AB75BF8025A;
	Fri, 13 Dec 2019 09:51:24 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7CE8BF8021E; Fri, 13 Dec 2019 09:51:19 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7C05AF8019B
 for <alsa-devel@alsa-project.org>; Fri, 13 Dec 2019 09:51:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7C05AF8019B
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 653EFAEFB
 for <alsa-devel@alsa-project.org>; Fri, 13 Dec 2019 08:51:13 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Date: Fri, 13 Dec 2019 09:51:11 +0100
Message-Id: <20191213085111.22855-4-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20191213085111.22855-1-tiwai@suse.de>
References: <20191213085111.22855-1-tiwai@suse.de>
Subject: [alsa-devel] [PATCH 3/3] ALSA: hda/ca0132 - Fix work handling in
	delayed HP detection
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

CA0132 has the delayed HP jack detection code that is invoked from the
unsol handler, but it does a few weird things: it contains the cancel
of a work inside the work handler, and yet it misses the cancel-sync
call at (runtime-)suspend.  This patch addresses those issues.

Fixes: 15c2b3cc09a3 ("ALSA: hda/ca0132 - Fix possible workqueue stall")
Cc: <stable@vger.kernel.org>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/hda/patch_ca0132.c | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/sound/pci/hda/patch_ca0132.c b/sound/pci/hda/patch_ca0132.c
index 8d0209fff8f5..32ed46464af7 100644
--- a/sound/pci/hda/patch_ca0132.c
+++ b/sound/pci/hda/patch_ca0132.c
@@ -7607,11 +7607,10 @@ static void hp_callback(struct hda_codec *codec, struct hda_jack_callback *cb)
 	/* Delay enabling the HP amp, to let the mic-detection
 	 * state machine run.
 	 */
-	cancel_delayed_work(&spec->unsol_hp_work);
-	schedule_delayed_work(&spec->unsol_hp_work, msecs_to_jiffies(500));
 	tbl = snd_hda_jack_tbl_get(codec, cb->nid);
 	if (tbl)
 		tbl->block_report = 1;
+	schedule_delayed_work(&spec->unsol_hp_work, msecs_to_jiffies(500));
 }
 
 static void amic_callback(struct hda_codec *codec, struct hda_jack_callback *cb)
@@ -8457,12 +8456,25 @@ static void ca0132_reboot_notify(struct hda_codec *codec)
 	codec->patch_ops.free(codec);
 }
 
+#ifdef CONFIG_PM
+static int ca0132_suspend(struct hda_codec *codec)
+{
+	struct ca0132_spec *spec = codec->spec;
+
+	cancel_delayed_work_sync(&spec->unsol_hp_work);
+	return 0;
+}
+#endif
+
 static const struct hda_codec_ops ca0132_patch_ops = {
 	.build_controls = ca0132_build_controls,
 	.build_pcms = ca0132_build_pcms,
 	.init = ca0132_init,
 	.free = ca0132_free,
 	.unsol_event = snd_hda_jack_unsol_event,
+#ifdef CONFIG_PM
+	.suspend = ca0132_suspend,
+#endif
 	.reboot_notify = ca0132_reboot_notify,
 };
 
-- 
2.16.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
