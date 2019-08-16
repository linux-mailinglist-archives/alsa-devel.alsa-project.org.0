Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ECCC28FB11
	for <lists+alsa-devel@lfdr.de>; Fri, 16 Aug 2019 08:30:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7BDF41654;
	Fri, 16 Aug 2019 08:29:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7BDF41654
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565937042;
	bh=DnaL1vTwjJ8FtGCVEv3YGa8wbC48Hpg3r95CCYM33rk=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=XKY4pkk37VvCVqG2Y7L2PID2vUST7gm2qIOqwvIqQ1PgAT9KBnFF1Q4loPsd6uBf4
	 SxlnX9EqXM6qC4Hc9GbgV6Yaas/OYFOgwZdvYGqoicLmQnbRE0AacRu3dI85SmOOaj
	 IIZ4jhxj7Cg0Wxbrk7PZMuYMEaL/4Vv4wLsfZPJE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C7619F805E1;
	Fri, 16 Aug 2019 08:28:13 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DFF0AF805AA; Fri, 16 Aug 2019 08:28:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112]) (using TLSv1 with cipher AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 39200F80446
 for <alsa-devel@alsa-project.org>; Fri, 16 Aug 2019 08:28:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 39200F80446
Received: from [114.252.209.139] (helo=localhost.localdomain)
 by youngberry.canonical.com with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.76) (envelope-from <hui.wang@canonical.com>)
 id 1hyViU-0001eO-5Q; Fri, 16 Aug 2019 06:28:02 +0000
From: Hui Wang <hui.wang@canonical.com>
To: alsa-devel@alsa-project.org,
	tiwai@suse.de
Date: Fri, 16 Aug 2019 14:27:39 +0800
Message-Id: <20190816062740.5059-1-hui.wang@canonical.com>
X-Mailer: git-send-email 2.17.1
Subject: [alsa-devel] [PATCH v3 1/2] ALSA: hda - Expand pin_match function
	to match upcoming new tbls
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

With the existing pintbl, we already have many entries in it. it is
better to figure out a new way to reduce the size of the pintbl.

We plan to define a new tbl which will match more machines with a
single tbl, To do that, this function doesn't need to match all valid
pins between machine and tbl, it just needs to match all pins defined
in the tbl with the machine.

And the plan is to move some tbls from pin_fixup_tbl to
fallback_pin_fixup_tbl gradually.

Signed-off-by: Hui Wang <hui.wang@canonical.com>
---
 sound/pci/hda/hda_auto_parser.c | 12 ++++++++----
 sound/pci/hda/hda_local.h       |  3 ++-
 sound/pci/hda/patch_realtek.c   |  4 ++--
 3 files changed, 12 insertions(+), 7 deletions(-)

diff --git a/sound/pci/hda/hda_auto_parser.c b/sound/pci/hda/hda_auto_parser.c
index 92390d457567..8a134f750bae 100644
--- a/sound/pci/hda/hda_auto_parser.c
+++ b/sound/pci/hda/hda_auto_parser.c
@@ -884,7 +884,8 @@ EXPORT_SYMBOL_GPL(snd_hda_apply_fixup);
 #define IGNORE_SEQ_ASSOC (~(AC_DEFCFG_SEQUENCE | AC_DEFCFG_DEF_ASSOC))
 
 static bool pin_config_match(struct hda_codec *codec,
-			     const struct hda_pintbl *pins)
+			     const struct hda_pintbl *pins,
+			     bool match_all_pins)
 {
 	const struct hda_pincfg *pin;
 	int i;
@@ -908,7 +909,8 @@ static bool pin_config_match(struct hda_codec *codec,
 					return false;
 			}
 		}
-		if (!found && (cfg & 0xf0000000) != 0x40000000)
+		if (match_all_pins &&
+		    !found && (cfg & 0xf0000000) != 0x40000000)
 			return false;
 	}
 
@@ -920,10 +922,12 @@ static bool pin_config_match(struct hda_codec *codec,
  * @codec: the HDA codec
  * @pin_quirk: zero-terminated pin quirk list
  * @fixlist: the fixup list
+ * @match_all_pins: all valid pins must match with the table entries
  */
 void snd_hda_pick_pin_fixup(struct hda_codec *codec,
 			    const struct snd_hda_pin_quirk *pin_quirk,
-			    const struct hda_fixup *fixlist)
+			    const struct hda_fixup *fixlist,
+			    bool match_all_pins)
 {
 	const struct snd_hda_pin_quirk *pq;
 
@@ -935,7 +939,7 @@ void snd_hda_pick_pin_fixup(struct hda_codec *codec,
 			continue;
 		if (codec->core.vendor_id != pq->codec)
 			continue;
-		if (pin_config_match(codec, pq->pins)) {
+		if (pin_config_match(codec, pq->pins, match_all_pins)) {
 			codec->fixup_id = pq->value;
 #ifdef CONFIG_SND_DEBUG_VERBOSE
 			codec->fixup_name = pq->name;
diff --git a/sound/pci/hda/hda_local.h b/sound/pci/hda/hda_local.h
index 349a8312d06a..3942e1b528d8 100644
--- a/sound/pci/hda/hda_local.h
+++ b/sound/pci/hda/hda_local.h
@@ -361,7 +361,8 @@ void snd_hda_pick_fixup(struct hda_codec *codec,
 			const struct hda_fixup *fixlist);
 void snd_hda_pick_pin_fixup(struct hda_codec *codec,
 			    const struct snd_hda_pin_quirk *pin_quirk,
-			    const struct hda_fixup *fixlist);
+			    const struct hda_fixup *fixlist,
+			    bool match_all_pins);
 
 /* helper macros to retrieve pin default-config values */
 #define get_defcfg_connect(cfg) \
diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index ac7177ce67eb..2fa03fb6bd9e 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -7950,7 +7950,7 @@ static int patch_alc269(struct hda_codec *codec)
 
 	snd_hda_pick_fixup(codec, alc269_fixup_models,
 		       alc269_fixup_tbl, alc269_fixups);
-	snd_hda_pick_pin_fixup(codec, alc269_pin_fixup_tbl, alc269_fixups);
+	snd_hda_pick_pin_fixup(codec, alc269_pin_fixup_tbl, alc269_fixups, true);
 	snd_hda_pick_fixup(codec, NULL,	alc269_fixup_vendor_tbl,
 			   alc269_fixups);
 	snd_hda_apply_fixup(codec, HDA_FIXUP_ACT_PRE_PROBE);
@@ -8935,7 +8935,7 @@ static int patch_alc662(struct hda_codec *codec)
 
 	snd_hda_pick_fixup(codec, alc662_fixup_models,
 		       alc662_fixup_tbl, alc662_fixups);
-	snd_hda_pick_pin_fixup(codec, alc662_pin_fixup_tbl, alc662_fixups);
+	snd_hda_pick_pin_fixup(codec, alc662_pin_fixup_tbl, alc662_fixups, true);
 	snd_hda_apply_fixup(codec, HDA_FIXUP_ACT_PRE_PROBE);
 
 	alc_auto_parse_customize_define(codec);
-- 
2.17.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
