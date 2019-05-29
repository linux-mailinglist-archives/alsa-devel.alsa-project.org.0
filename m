Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F7BE2D4D7
	for <lists+alsa-devel@lfdr.de>; Wed, 29 May 2019 06:44:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B31FB1677;
	Wed, 29 May 2019 06:43:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B31FB1677
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1559105051;
	bh=mgFY8n+V8oWPM3XVq8nb+Eh2GnBBUM+EjOF6/prL/2g=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Lrip3iKCJrrhSTDnHTr3GQr8SLoNzSXf/KpmhfR+Xx3bI97ZjW0+8NC9WmPcidyut
	 Rlbv6eVk6sfIR0UZ7TqX6ta2G9OMPpwgh/VMVCuoDh3lFxngNS63qiQ1/DpTdW6ovC
	 weLOP+Qbyu/yJ//GB4waMXyZRwznTsWhySF3kz6A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 53E92F89728;
	Wed, 29 May 2019 06:42:09 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 10AC6F896F7; Wed, 29 May 2019 06:42:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112]) (using TLSv1 with cipher AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 12D22F896E8
 for <alsa-devel@alsa-project.org>; Wed, 29 May 2019 06:42:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 12D22F896E8
Received: from [221.221.103.6] (helo=localhost.localdomain)
 by youngberry.canonical.com with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.76) (envelope-from <hui.wang@canonical.com>)
 id 1hVqPX-0003ho-EA; Wed, 29 May 2019 04:42:00 +0000
From: Hui Wang <hui.wang@canonical.com>
To: alsa-devel@alsa-project.org,
	tiwai@suse.de
Date: Wed, 29 May 2019 12:41:38 +0800
Message-Id: <20190529044138.778-1-hui.wang@canonical.com>
X-Mailer: git-send-email 2.17.1
Cc: kailang@realtek.com, chiu@endlessm.com, stable@vger.kernel.org,
 drake@endlessm.com
Subject: [alsa-devel] [PATCH] ALSA: hda/realtek - Improve the headset mic
	for Acer Aspire laptops
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

We met another Acer Aspire laptop which has the problem on the
headset-mic, the Pin 0x19 is not set the corret configuration for a
mic and the pin presence can't be detected too after plugging a
headset. Kailang suggested that we should set the coeff to enable the
mic and apply the ALC269_FIXUP_LIFEBOOK_EXTMIC. After doing that,
both headset-mic presence and headset-mic work well.

The existing ALC255_FIXUP_ACER_MIC_NO_PRESENCE set the headset-mic
jack to be a phantom jack. Now since the jack can support presence
unsol event, let us imporve it to set the jack to be a normal jack.

https://bugs.launchpad.net/bugs/1821269
Fixes: 5824ce8de7b1c ("ALSA: hda/realtek - Add support for Acer Aspire E5-475 headset mic")
Cc: Chris Chiu <chiu@endlessm.com>
CC: Daniel Drake <drake@endlessm.com>
Cc: <stable@vger.kernel.org>
Signed-off-by: Kailang Yang <kailang@realtek.com>
Signed-off-by: Hui Wang <hui.wang@canonical.com>
---
 sound/pci/hda/patch_realtek.c | 16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index f1bac03e954b..f42a097f2e16 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -6223,13 +6223,15 @@ static const struct hda_fixup alc269_fixups[] = {
 		.chain_id = ALC269_FIXUP_THINKPAD_ACPI,
 	},
 	[ALC255_FIXUP_ACER_MIC_NO_PRESENCE] = {
-		.type = HDA_FIXUP_PINS,
-		.v.pins = (const struct hda_pintbl[]) {
-			{ 0x19, 0x01a1913c }, /* use as headset mic, without its own jack detect */
-			{ }
+		.type = HDA_FIXUP_VERBS,
+		.v.verbs = (const struct hda_verb[]) {
+			/* Enable the Mic */
+			{ 0x20, AC_VERB_SET_COEF_INDEX, 0x45 },
+			{ 0x20, AC_VERB_SET_PROC_COEF, 0x5089 },
+                       {}
 		},
 		.chained = true,
-		.chain_id = ALC255_FIXUP_HEADSET_MODE
+		.chain_id = ALC269_FIXUP_LIFEBOOK_EXTMIC
 	},
 	[ALC255_FIXUP_ASUS_MIC_NO_PRESENCE] = {
 		.type = HDA_FIXUP_PINS,
@@ -7273,6 +7275,10 @@ static const struct snd_hda_pin_quirk alc269_pin_fixup_tbl[] = {
 		{0x18, 0x02a11030},
 		{0x19, 0x0181303F},
 		{0x21, 0x0221102f}),
+	SND_HDA_PIN_QUIRK(0x10ec0255, 0x1025, "Acer", ALC255_FIXUP_ACER_MIC_NO_PRESENCE,
+		{0x12, 0x90a60140},
+		{0x14, 0x90170120},
+		{0x21, 0x02211030}),
 	SND_HDA_PIN_QUIRK(0x10ec0255, 0x1025, "Acer", ALC255_FIXUP_ACER_MIC_NO_PRESENCE,
 		{0x12, 0x90a601c0},
 		{0x14, 0x90171120},
-- 
2.17.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
