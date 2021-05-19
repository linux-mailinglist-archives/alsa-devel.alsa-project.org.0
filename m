Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 06E9E389463
	for <lists+alsa-devel@lfdr.de>; Wed, 19 May 2021 19:06:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6F430167E;
	Wed, 19 May 2021 19:05:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6F430167E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1621443984;
	bh=gpYlq4IwvVKYFy8eIqFYQPEdYX8F/9PhIPTVGPR3u7I=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bWY2eSflIj3jpKPoY1XZ3h7Fznbud+uO2qUda4d4n1pFGsp1mQIDbrc6thmzmLorc
	 1rLZXpFSfKC5HYPGMNZ7wiZc00saIBNubByoQYHTHpoa67SizLW6xxPcmvLvAPdEov
	 NxAFaRSEPHHRhNnp3pr5uH5M77lO2xxCNt07OMLM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 223A0F8016E;
	Wed, 19 May 2021 19:04:55 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 73FA8F8014C; Wed, 19 May 2021 19:04:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 54D57F8014C
 for <alsa-devel@alsa-project.org>; Wed, 19 May 2021 19:04:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 54D57F8014C
Received: from 61-220-137-34.hinet-ip.hinet.net ([61.220.137.34]
 helo=localhost) by youngberry.canonical.com with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.93)
 (envelope-from <jeremy.szu@canonical.com>)
 id 1ljPca-0004J4-3A; Wed, 19 May 2021 17:04:36 +0000
From: Jeremy Szu <jeremy.szu@canonical.com>
To: tiwai@suse.com
Subject: [PATCH 2/4] ALSA: hda/realtek: fix mute/micmute LEDs and speaker for
 HP Zbook G8
Date: Thu, 20 May 2021 01:03:54 +0800
Message-Id: <20210519170357.58410-2-jeremy.szu@canonical.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210519170357.58410-1-jeremy.szu@canonical.com>
References: <20210519170357.58410-1-jeremy.szu@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: "moderated list:SOUND" <alsa-devel@alsa-project.org>,
 Kailang Yang <kailang@realtek.com>, Jeremy Szu <jeremy.szu@canonical.com>,
 open list <linux-kernel@vger.kernel.org>, Huacai Chen <chenhuacai@kernel.org>,
 Jian-Hong Pan <jhp@endlessos.org>, Hui Wang <hui.wang@canonical.com>,
 PeiSen Hou <pshou@realtek.com>
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

The HP ZBook Studio 15.6 Inch G8 is using ALC285 codec which is
using 0x04 to control mute LED and 0x01 to control micmute LED.
In the other hand, there is no output from right channel of speaker.
Therefore, add a quirk to make it works.

Signed-off-by: Jeremy Szu <jeremy.szu@canonical.com>
---
 sound/pci/hda/patch_realtek.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index 9d68f591c6bf..8d1c18843758 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -8291,6 +8291,7 @@ static const struct snd_pci_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x103c, 0x87f7, "HP Spectre x360 14", ALC245_FIXUP_HP_X360_AMP),
 	SND_PCI_QUIRK(0x103c, 0x8846, "HP EliteBook 850 G8 Notebook PC", ALC285_FIXUP_HP_GPIO_LED),
 	SND_PCI_QUIRK(0x103c, 0x884c, "HP EliteBook 840 G8 Notebook PC", ALC285_FIXUP_HP_GPIO_LED),
+	SND_PCI_QUIRK(0x103c, 0x8873, "HP ZBook Studio 15.6 Inch G8 Mobile Workstation PC", ALC285_FIXUP_HP_GPIO_AMP_INIT),
 	SND_PCI_QUIRK(0x103c, 0x8896, "HP EliteBook 855 G8 Notebook PC", ALC285_FIXUP_HP_MUTE_LED),
 	SND_PCI_QUIRK(0x103c, 0x8898, "HP EliteBook 845 G8 Notebook PC", ALC285_FIXUP_HP_LIMIT_INT_MIC_BOOST),
 	SND_PCI_QUIRK(0x1043, 0x103e, "ASUS X540SA", ALC256_FIXUP_ASUS_MIC),
-- 
2.31.1

