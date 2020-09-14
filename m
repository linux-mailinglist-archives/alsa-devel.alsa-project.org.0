Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 938DC268572
	for <lists+alsa-devel@lfdr.de>; Mon, 14 Sep 2020 09:04:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 113F31687;
	Mon, 14 Sep 2020 09:04:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 113F31687
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1600067095;
	bh=zHCFd02pgsZC9dd/maOlmsqoxE/VmY55M78MO6DYX5w=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=S06M4RmLgp2UvFAQZihHJ1YpTUQVZdiV4WEtUHEDdeItwdes8tdXv07B+K2YF98qZ
	 ldY06wAidKr6WlKIN/h6xsQNQKNo+R5WWVh33jV2VJltC00kQdwrWFSsoYvXiNR45a
	 FDKmHWp6mNYcNfi9veJ2gdD4ojdFFG+BWM4LPcY8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 15FF5F80105;
	Mon, 14 Sep 2020 09:03:14 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CC7E3F8015A; Mon, 14 Sep 2020 09:03:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.1 required=5.0 tests=AC_FROM_MANY_DOTS,
 RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 74F94F800F1
 for <alsa-devel@alsa-project.org>; Mon, 14 Sep 2020 09:03:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 74F94F800F1
Received: from 61-220-137-37.hinet-ip.hinet.net ([61.220.137.37]
 helo=localhost) by youngberry.canonical.com with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <kai.heng.feng@canonical.com>)
 id 1kHiVX-0002Tq-2H; Mon, 14 Sep 2020 07:02:35 +0000
From: Kai-Heng Feng <kai.heng.feng@canonical.com>
To: tiwai@suse.com
Subject: [PATCH] ALSA: hda/realtek: Enable front panel headset LED on Lenovo
 ThinkStation P520
Date: Mon, 14 Sep 2020 15:02:29 +0800
Message-Id: <20200914070231.13192-1-kai.heng.feng@canonical.com>
X-Mailer: git-send-email 2.17.1
Cc: "moderated list:SOUND" <alsa-devel@alsa-project.org>,
 Kailang Yang <kailang@realtek.com>, Thomas Hebb <tommyhebb@gmail.com>,
 open list <linux-kernel@vger.kernel.org>, Hui Wang <hui.wang@canonical.com>,
 Kai-Heng Feng <kai.heng.feng@canonical.com>, Huacai Chen <chenhc@lemote.com>,
 Jian-Hong Pan <jian-hong@endlessm.com>,
 =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>
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

On Lenovo P520, the front panel headset LED isn't lit up right now.

Realtek states that the LED needs to be enabled by ALC233's GPIO2, so
let's do it accordingly to light the LED up.

Signed-off-by: Kai-Heng Feng <kai.heng.feng@canonical.com>
---
 sound/pci/hda/patch_realtek.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index c521a1f17096..ba941bd0b792 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -6017,6 +6017,7 @@ static void alc_fixup_thinkpad_acpi(struct hda_codec *codec,
 #include "hp_x360_helper.c"
 
 enum {
+	ALC269_FIXUP_GPIO2,
 	ALC269_FIXUP_SONY_VAIO,
 	ALC275_FIXUP_SONY_VAIO_GPIO2,
 	ALC269_FIXUP_DELL_M101Z,
@@ -6194,6 +6195,10 @@ enum {
 };
 
 static const struct hda_fixup alc269_fixups[] = {
+	[ALC269_FIXUP_GPIO2] = {
+		.type = HDA_FIXUP_FUNC,
+		.v.func = alc_fixup_gpio2,
+	},
 	[ALC269_FIXUP_SONY_VAIO] = {
 		.type = HDA_FIXUP_PINCTLS,
 		.v.pins = (const struct hda_pintbl[]) {
@@ -7013,6 +7018,8 @@ static const struct hda_fixup alc269_fixups[] = {
 	[ALC233_FIXUP_LENOVO_MULTI_CODECS] = {
 		.type = HDA_FIXUP_FUNC,
 		.v.func = alc233_alc662_fixup_lenovo_dual_codecs,
+		.chained = true,
+		.chain_id = ALC269_FIXUP_GPIO2
 	},
 	[ALC233_FIXUP_ACER_HEADSET_MIC] = {
 		.type = HDA_FIXUP_VERBS,
-- 
2.17.1

