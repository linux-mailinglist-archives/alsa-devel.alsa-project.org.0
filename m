Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DB93F8E666
	for <lists+alsa-devel@lfdr.de>; Thu, 15 Aug 2019 10:32:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4F2B21662;
	Thu, 15 Aug 2019 10:31:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4F2B21662
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565857932;
	bh=/It1dp4mLdYOfYhPs+jvjDrXtjqPjnK/n2DlIsIODoQ=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=YrsVqlpSxivdQ90XxKSdf0SRxaZAc1wYpfEr9yvm3BAiJDE3NT1e5f/QWPbMRP4Mg
	 j9k7JwcCoh4WlSda6+MsO2/XkIVnO9/x6nAaWd7x+RiNNiTgik7/zgRhrDuiP5SHzI
	 ID1oZ54ewhjNWFoNioJXQ4PHYhE4HH3M6dOPcy6s=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 856DBF80274;
	Thu, 15 Aug 2019 10:30:28 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AFC9CF80274; Thu, 15 Aug 2019 10:30:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112]) (using TLSv1 with cipher AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C7F76F801DF
 for <alsa-devel@alsa-project.org>; Thu, 15 Aug 2019 10:30:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C7F76F801DF
Received: from [114.252.209.139] (helo=localhost.localdomain)
 by youngberry.canonical.com with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.76) (envelope-from <hui.wang@canonical.com>)
 id 1hyB9H-0005Ya-A0; Thu, 15 Aug 2019 08:30:19 +0000
From: Hui Wang <hui.wang@canonical.com>
To: alsa-devel@alsa-project.org,
	tiwai@suse.de
Date: Thu, 15 Aug 2019 16:30:00 +0800
Message-Id: <20190815083001.3793-1-hui.wang@canonical.com>
X-Mailer: git-send-email 2.17.1
Cc: stable@vger.kernel.org
Subject: [alsa-devel] [PATCH 1/2] ALSA: hda - Add a new match function for
	only undef configurations
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

My plan is to change the existing tbl to undef tbl for MIC_NO_PRESENCE
fixups gradually.

Signed-off-by: Hui Wang <hui.wang@canonical.com>
---
 sound/pci/hda/hda_auto_parser.c | 32 +++++++++++++++++++++++++++++++-
 1 file changed, 31 insertions(+), 1 deletion(-)

diff --git a/sound/pci/hda/hda_auto_parser.c b/sound/pci/hda/hda_auto_parser.c
index 92390d457567..cfada7401b86 100644
--- a/sound/pci/hda/hda_auto_parser.c
+++ b/sound/pci/hda/hda_auto_parser.c
@@ -915,6 +915,36 @@ static bool pin_config_match(struct hda_codec *codec,
 	return true;
 }
 
+/* match the pintbl which only contains specific pins with undef configuration */
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
 /**
  * snd_hda_pick_pin_fixup - Pick up a fixup matching with the pin quirk list
  * @codec: the HDA codec
@@ -935,7 +965,7 @@ void snd_hda_pick_pin_fixup(struct hda_codec *codec,
 			continue;
 		if (codec->core.vendor_id != pq->codec)
 			continue;
-		if (pin_config_match(codec, pq->pins)) {
+		if (pin_config_match(codec, pq->pins) || pin_config_match_undef(codec, pq->pins)) {
 			codec->fixup_id = pq->value;
 #ifdef CONFIG_SND_DEBUG_VERBOSE
 			codec->fixup_name = pq->name;
-- 
2.17.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
