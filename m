Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EBC203F45E6
	for <lists+alsa-devel@lfdr.de>; Mon, 23 Aug 2021 09:39:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6B75815DC;
	Mon, 23 Aug 2021 09:38:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6B75815DC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1629704368;
	bh=zyTghKG8NAFs96bMg2Zxyun+K14x5NpU0q4RXxG6Juc=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=BR7CccEkCaIFqyEYUv3va2WCg/n9V3eRG1/Mmklsz3qNxtv+rZr71IzQFZ2yGMioL
	 j5fWTxkphpZeMYciTE6J3fiHU1zHDiPd7CVaQMHSVEoaiHvNpry7YKkLK6qETqP14E
	 y2ZU3qihWXhZJie32+PBmT6lZAo+V9lfqy0ZYQJ0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A7C70F804E7;
	Mon, 23 Aug 2021 09:37:43 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BFD3CF80430; Mon, 23 Aug 2021 09:37:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_FILL_THIS_FORM_SHORT,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9C14EF8020C
 for <alsa-devel@alsa-project.org>; Mon, 23 Aug 2021 09:37:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9C14EF8020C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="vJDm1X+V"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="rXCndptV"
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id DAE021FF7E
 for <alsa-devel@alsa-project.org>; Mon, 23 Aug 2021 07:37:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1629704248; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/hWMA697F2iS9+Er0toSJBgmPFJaKlMYY4uXEk4VWzA=;
 b=vJDm1X+VNb0s4mblNaHzV6F9JcOyVzZDRLFnl3mfFJHVMxE+tNDiWkrM/+Sa2W29i4lxI6
 85dpW/hVqNv9XsARklIb9taP6cg+i1Dfjya98a8UCQfwe0jC30tUDTl7+ywzOvCJhTuX1f
 cohKdp2qZXvoJB+jv6p0zD5NpaaZDck=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1629704248;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/hWMA697F2iS9+Er0toSJBgmPFJaKlMYY4uXEk4VWzA=;
 b=rXCndptV3NdjdsHr0E1lVzrIh0PkDeVp6yOrT2Gah2ucGg0vVOE0k9MvJRoFb+0f5q2RhE
 xxyNaTyZ+f9mxTAg==
Received: from alsa1.nue.suse.com (alsa1.suse.de [10.160.4.42])
 by relay2.suse.de (Postfix) with ESMTP id D4F35A3BB0;
 Mon, 23 Aug 2021 07:37:28 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 1/3] ALSA: hda: Code refactoring snd_hda_pick_fixup()
Date: Mon, 23 Aug 2021 09:37:20 +0200
Message-Id: <20210823073722.14873-2-tiwai@suse.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210823073722.14873-1-tiwai@suse.de>
References: <20210823073722.14873-1-tiwai@suse.de>
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

This contains a slight code refactoring of snd_hda_pick_fixup():
- Unify the ID setup
- Unify the debug print message
- Use snd_pci_quirk_lookup_id() for the codec SSID matching

Mostly for simplifying the code flow but also it makes easier to add
the codec alias handling in the upcoming patch.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/hda/hda_auto_parser.c | 75 +++++++++++++++++----------------
 1 file changed, 38 insertions(+), 37 deletions(-)

diff --git a/sound/pci/hda/hda_auto_parser.c b/sound/pci/hda/hda_auto_parser.c
index 1a001ecf7f63..dd050be7aefa 100644
--- a/sound/pci/hda/hda_auto_parser.c
+++ b/sound/pci/hda/hda_auto_parser.c
@@ -982,65 +982,66 @@ void snd_hda_pick_fixup(struct hda_codec *codec,
 	const struct snd_pci_quirk *q;
 	int id = HDA_FIXUP_ID_NOT_SET;
 	const char *name = NULL;
+	const char *type = NULL;
 
 	if (codec->fixup_id != HDA_FIXUP_ID_NOT_SET)
 		return;
 
 	/* when model=nofixup is given, don't pick up any fixups */
 	if (codec->modelname && !strcmp(codec->modelname, "nofixup")) {
-		codec->fixup_list = NULL;
-		codec->fixup_name = NULL;
-		codec->fixup_id = HDA_FIXUP_ID_NO_FIXUP;
+		id = HDA_FIXUP_ID_NO_FIXUP;
+		fixlist = NULL;
 		codec_dbg(codec, "%s: picked no fixup (nofixup specified)\n",
 			  codec->core.chip_name);
-		return;
+		goto found;
 	}
 
+	/* match with the model name string */
 	if (codec->modelname && models) {
 		while (models->name) {
 			if (!strcmp(codec->modelname, models->name)) {
-				codec->fixup_id = models->id;
-				codec->fixup_name = models->name;
-				codec->fixup_list = fixlist;
+				id = models->id;
+				name = models->name;
 				codec_dbg(codec, "%s: picked fixup %s (model specified)\n",
 					  codec->core.chip_name, codec->fixup_name);
-				return;
+				goto found;
 			}
 			models++;
 		}
 	}
-	if (quirk) {
-		q = snd_pci_quirk_lookup(codec->bus->pci, quirk);
-		if (q) {
-			id = q->value;
-#ifdef CONFIG_SND_DEBUG_VERBOSE
-			name = q->name;
-			codec_dbg(codec, "%s: picked fixup %s (PCI SSID%s)\n",
-				  codec->core.chip_name, name, q->subdevice_mask ? "" : " - vendor generic");
-#endif
-		}
+
+	if (!quirk)
+		return;
+
+	/* match with the PCI SSID */
+	q = snd_pci_quirk_lookup(codec->bus->pci, quirk);
+	if (q) {
+		type = "PCI SSID";
+		goto found_device;
 	}
-	if (id < 0 && quirk) {
-		for (q = quirk; q->subvendor || q->subdevice; q++) {
-			unsigned int vendorid =
-				q->subdevice | (q->subvendor << 16);
-			unsigned int mask = 0xffff0000 | q->subdevice_mask;
-			if ((codec->core.subsystem_id & mask) == (vendorid & mask)) {
-				id = q->value;
-#ifdef CONFIG_SND_DEBUG_VERBOSE
-				name = q->name;
-				codec_dbg(codec, "%s: picked fixup %s (codec SSID)\n",
-					  codec->core.chip_name, name);
-#endif
-				break;
-			}
-		}
+
+	/* match with the codec SSID */
+	q = snd_pci_quirk_lookup_id(codec->core.subsystem_id >> 16,
+				    codec->core.subsystem_id & 0xffff,
+				    quirk);
+	if (q) {
+		type = "codec SSID";
+		goto found_device;
 	}
 
+	return; /* no matching */
+
+ found_device:
+	id = q->value;
+#ifdef CONFIG_SND_DEBUG_VERBOSE
+	name = q->name;
+#endif
+	codec_dbg(codec, "%s: picked fixup %s for %s %04x:%04x\n",
+		  codec->core.chip_name, name ? name : "",
+		  type, q->subvendor, q->subdevice);
+ found:
 	codec->fixup_id = id;
-	if (id >= 0) {
-		codec->fixup_list = fixlist;
-		codec->fixup_name = name;
-	}
+	codec->fixup_list = fixlist;
+	codec->fixup_name = name;
 }
 EXPORT_SYMBOL_GPL(snd_hda_pick_fixup);
-- 
2.26.2

