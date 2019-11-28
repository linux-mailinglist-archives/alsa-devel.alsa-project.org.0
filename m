Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DA0A810CF3E
	for <lists+alsa-devel@lfdr.de>; Thu, 28 Nov 2019 21:28:24 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 210DD16DD;
	Thu, 28 Nov 2019 21:27:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 210DD16DD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1574972904;
	bh=mydFtl4zJnC7ybCEFtVH1rWCn7YobdBZ9VyipX2B0kI=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=dlW2cWty3Sl+jiQ91t7mFQYsKK/Kc8kooJvUj9qR12uTtiICg6SkzRCrOtRS8rveA
	 0thE3kPox3zw/aoQa1Ks5uy8Sh11dBIM+aQBEo/sXf2zJlQqDxkSYbH8QZ128mvr6i
	 jM2XGmoN6hAZOSuH9zlX1g1gzHECkJtrj5EOnAvI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7121EF801DA;
	Thu, 28 Nov 2019 21:26:40 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3D82AF80149; Thu, 28 Nov 2019 21:26:37 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9CC32F800CB
 for <alsa-devel@alsa-project.org>; Thu, 28 Nov 2019 21:26:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9CC32F800CB
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id C8C93ABC7;
 Thu, 28 Nov 2019 20:26:32 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Date: Thu, 28 Nov 2019 21:26:30 +0100
Message-Id: <20191128202630.6626-1-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
Cc: Sergey 'Jin' Bostandzhyan <jin@mediatomb.cc>
Subject: [alsa-devel] [PATCH] ALSA: hda/realtek - Fix inverted bass GPIO pin
	on Acer 8951G
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

We've added the bass speaker support on Acer 8951G by the commit
00066e9733f6 ("Add Acer Aspire Ethos 8951G model quirk"), but it seems
that the GPIO pin was wrongly set: while the commit turns off the bit
to power up the amp, the actual hardware reacts other way round,
i.e. GPIO bit on = amp on.

So this patch fixes the bug, turning on the GPIO bit 0x02 as default.
Since turning on the GPIO bit can be more easily managed with
alc_setup_gpio() call, we simplify the quirk code by integrating the
GPIO setup into the existing alc662_fixup_aspire_ethos_hp() and
dropping the whole ALC669_FIXUP_ACER_ASPIRE_ETHOS_SUBWOOFER quirk.

Fixes: 00066e9733f6 ("Add Acer Aspire Ethos 8951G model quirk")
Reported-and-tested-by: Sergey 'Jin' Bostandzhyan <jin@mediatomb.cc>
Cc: <stable@vger.kernel.org>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/hda/patch_realtek.c | 17 +++--------------
 1 file changed, 3 insertions(+), 14 deletions(-)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index 9f355b2f7d7b..c7a232fd5a5b 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -8427,6 +8427,8 @@ static void alc662_fixup_aspire_ethos_hp(struct hda_codec *codec,
 	case HDA_FIXUP_ACT_PRE_PROBE:
 		snd_hda_jack_detect_enable_callback(codec, 0x1b,
 				alc662_aspire_ethos_mute_speakers);
+		/* subwoofer needs an extra GPIO setting to become audible */
+		alc_setup_gpio(codec, 0x02);
 		break;
 	case HDA_FIXUP_ACT_INIT:
 		/* Make sure to start in a correct state, i.e. if
@@ -8509,7 +8511,6 @@ enum {
 	ALC662_FIXUP_USI_HEADSET_MODE,
 	ALC662_FIXUP_LENOVO_MULTI_CODECS,
 	ALC669_FIXUP_ACER_ASPIRE_ETHOS,
-	ALC669_FIXUP_ACER_ASPIRE_ETHOS_SUBWOOFER,
 	ALC669_FIXUP_ACER_ASPIRE_ETHOS_HEADSET,
 };
 
@@ -8841,18 +8842,6 @@ static const struct hda_fixup alc662_fixups[] = {
 		.type = HDA_FIXUP_FUNC,
 		.v.func = alc662_fixup_aspire_ethos_hp,
 	},
-	[ALC669_FIXUP_ACER_ASPIRE_ETHOS_SUBWOOFER] = {
-		.type = HDA_FIXUP_VERBS,
-		/* subwoofer needs an extra GPIO setting to become audible */
-		.v.verbs = (const struct hda_verb[]) {
-			{0x01, AC_VERB_SET_GPIO_MASK, 0x02},
-			{0x01, AC_VERB_SET_GPIO_DIRECTION, 0x02},
-			{0x01, AC_VERB_SET_GPIO_DATA, 0x00},
-			{ }
-		},
-		.chained = true,
-		.chain_id = ALC669_FIXUP_ACER_ASPIRE_ETHOS_HEADSET
-	},
 	[ALC669_FIXUP_ACER_ASPIRE_ETHOS] = {
 		.type = HDA_FIXUP_PINS,
 		.v.pins = (const struct hda_pintbl[]) {
@@ -8862,7 +8851,7 @@ static const struct hda_fixup alc662_fixups[] = {
 			{ }
 		},
 		.chained = true,
-		.chain_id = ALC669_FIXUP_ACER_ASPIRE_ETHOS_SUBWOOFER
+		.chain_id = ALC669_FIXUP_ACER_ASPIRE_ETHOS_HEADSET
 	},
 };
 
-- 
2.16.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
