Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 695CC8E8DC
	for <lists+alsa-devel@lfdr.de>; Thu, 15 Aug 2019 12:16:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1296786E;
	Thu, 15 Aug 2019 12:15:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1296786E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565864186;
	bh=HpJs5+UntA0/INf3few4gOuhjviYCfWlzFB7KkFOWdk=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=GQPwMCPer1cstdU2rHvPVJv1MA479q9b79RM2EoDTK39mPtlHZySgeBeolJCOFcVJ
	 9R93o5mZlewYqpsJKuM1IN0fM/vLgdxfME7m+TUVZ6XMNiYz1Gow9CarHSJlX+FWct
	 DffE3EM9BGvXD3oPlkqNtUROugTCHP5B88JA3f8M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4D7FEF80290;
	Thu, 15 Aug 2019 12:14:42 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4C277F80290; Thu, 15 Aug 2019 12:14:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112]) (using TLSv1 with cipher AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 94401F801DF
 for <alsa-devel@alsa-project.org>; Thu, 15 Aug 2019 12:14:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 94401F801DF
Received: from [114.252.209.139] (helo=localhost.localdomain)
 by youngberry.canonical.com with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.76) (envelope-from <hui.wang@canonical.com>)
 id 1hyCm9-0005vm-P5; Thu, 15 Aug 2019 10:14:34 +0000
From: Hui Wang <hui.wang@canonical.com>
To: alsa-devel@alsa-project.org,
	tiwai@suse.de
Date: Thu, 15 Aug 2019 18:14:14 +0800
Message-Id: <20190815101415.4169-1-hui.wang@canonical.com>
X-Mailer: git-send-email 2.17.1
Subject: [alsa-devel] [PATCH v2 1/2] ALSA: hda - Add a new match function
	for only undef configurations
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
better to figure out a new match to reduce the size of the pintbl.

For example, there are over 10 entries in the pintbl for:
0x10ec0255, 0x1028, "Dell", ALC255_FIXUP_DELL1_MIC_NO_PRESENCE

If we define a new tbl like below, and with the new adding match
function, we can remove those over 10 entries:
SND_HDA_PIN_QUIRK(0x10ec0255, 0x1028, "Dell", ALC255_FIXUP_DELL1_MIC_NO_PRESENCE,
	{0x19, 0x40000000},
	{0x1a, 0x40000000},),

Here we put 0x19 and 0x1a in the tbl just because these two pins are
undefined on Dell laptops with the codec alc255, and these two pins
will be overwritten by ALC255_FIXUP_DELL1_MIC_NO_PRESENCE.

In summary: the new match will check vendor id and codec id first,
then check the pin_cfg defined in the tbl, only all pin_cfgs in the
tbl are undef and the corresponding pin_cfgs on the laptop are undef
too, this match returns true.

This new match function has lower priority than existing match
functions, so the existing tbls still work as before after applying this
patch.

And for the same vendor and same codec, we could define at most one
undef tbl for it, for example for the Dell laptops with alc255 codec,
some of them need to apply DELL1_MIC, the rest need to apply DELL2_MIC,
here we could only define undef tbl for DELL1_MIC or DELL2_MIC, we could
not define undef tbls for both of them.

My plan is to change the existing tbl to undef tbl for MIC_NO_PRESENCE
fixups gradually.

Signed-off-by: Hui Wang <hui.wang@canonical.com>
---
 sound/pci/hda/hda_auto_parser.c | 62 ++++++++++++++++++++++++++++-----
 1 file changed, 54 insertions(+), 8 deletions(-)

diff --git a/sound/pci/hda/hda_auto_parser.c b/sound/pci/hda/hda_auto_parser.c
index 92390d457567..9bc2bfa0128c 100644
--- a/sound/pci/hda/hda_auto_parser.c
+++ b/sound/pci/hda/hda_auto_parser.c
@@ -915,6 +915,53 @@ static bool pin_config_match(struct hda_codec *codec,
 	return true;
 }
 
+/* Match the undef tbl with the initial verb table on the machine.
+ * Two nitices here:
+ *  - define 1 undef tbl at most for the same vendor and same codec
+ *  - the undef tbl has lower priority than normal tbls for matching
+ */
+static bool pin_config_match_undef(struct hda_codec *codec,
+				   const struct hda_pintbl *pins)
+{
+	bool match = false;
+
+	for (; pins->nid; pins++) {
+		const struct hda_pincfg *pin;
+		int i;
+
+		if ((pins->val & 0xf0000000) != 0x40000000)
+			return false;
+
+		match = false;
+		snd_array_for_each(&codec->init_pins, i, pin) {
+			if (pin->nid != pins->nid)
+				continue;
+			if ((pin->cfg & 0xf0000000) != 0x40000000)
+				return false;
+			match = true;
+			break;
+		}
+
+		if (match == false)
+			return false;
+	}
+
+	return match;
+}
+
+static void snd_hda_set_found_fixup(struct hda_codec *codec,
+				    const struct snd_hda_pin_quirk *pq,
+				    const struct hda_fixup *fixlist)
+{
+	codec->fixup_id = pq->value;
+#ifdef CONFIG_SND_DEBUG_VERBOSE
+	codec->fixup_name = pq->name;
+	codec_dbg(codec, "%s: picked fixup %s (pin match)\n",
+		  codec->core.chip_name, codec->fixup_name);
+#endif
+	codec->fixup_list = fixlist;
+}
+
 /**
  * snd_hda_pick_pin_fixup - Pick up a fixup matching with the pin quirk list
  * @codec: the HDA codec
@@ -925,7 +972,7 @@ void snd_hda_pick_pin_fixup(struct hda_codec *codec,
 			    const struct snd_hda_pin_quirk *pin_quirk,
 			    const struct hda_fixup *fixlist)
 {
-	const struct snd_hda_pin_quirk *pq;
+	const struct snd_hda_pin_quirk *pq, *undef_bak_pq = NULL;
 
 	if (codec->fixup_id != HDA_FIXUP_ID_NOT_SET)
 		return;
@@ -936,16 +983,15 @@ void snd_hda_pick_pin_fixup(struct hda_codec *codec,
 		if (codec->core.vendor_id != pq->codec)
 			continue;
 		if (pin_config_match(codec, pq->pins)) {
-			codec->fixup_id = pq->value;
-#ifdef CONFIG_SND_DEBUG_VERBOSE
-			codec->fixup_name = pq->name;
-			codec_dbg(codec, "%s: picked fixup %s (pin match)\n",
-				  codec->core.chip_name, codec->fixup_name);
-#endif
-			codec->fixup_list = fixlist;
+			snd_hda_set_found_fixup(codec, pq, fixlist);
 			return;
 		}
+		if (pin_config_match_undef(codec, pq->pins))
+			undef_bak_pq = pq;
 	}
+
+	if (undef_bak_pq != NULL)
+		snd_hda_set_found_fixup(codec, undef_bak_pq, fixlist);
 }
 EXPORT_SYMBOL_GPL(snd_hda_pick_pin_fixup);
 
-- 
2.17.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
