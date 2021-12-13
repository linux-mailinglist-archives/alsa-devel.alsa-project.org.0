Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EB3D4730E9
	for <lists+alsa-devel@lfdr.de>; Mon, 13 Dec 2021 16:52:01 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0A05F181A;
	Mon, 13 Dec 2021 16:51:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0A05F181A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1639410721;
	bh=5DooJ+qeb9gmslIe+Kmv0PmzXyfDCkrx54j4w8we2hw=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=njOERZ3pefWVOcBh+sBYM3UhwaFlOZL/ElbV1kcU9i+2SNs17HmzxKyuEAlhnrJX+
	 OZfG7CM1MMg/PC8A/LzTX+6EQvzZEOGXa7VJDjWHdl1EIPqCGFAgBG2QT9UzMWXCX1
	 a0B7eClD36+c1Wbhc1Jto2g3DwP7Xc9Hvmqw8rp0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 60344F8025F;
	Mon, 13 Dec 2021 16:50:53 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 730F8F8025D; Mon, 13 Dec 2021 16:50:51 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from pmta31.teksavvy.com (pmta31.teksavvy.com [76.10.157.38])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0B980F8016A
 for <alsa-devel@alsa-project.org>; Mon, 13 Dec 2021 16:50:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0B980F8016A
IronPort-SDR: //Q99cuBkl4O2aGK59yq8XsjPqqMbuiTyWf20w/119Ts44Zd8EwbWGMieZmtKr3EsMA+1aiLDr
 lxZqnoeFiegA==
IronPort-Data: =?us-ascii?q?A9a23=3Avr3N4qoBQ1pR7RUH0IYJzmhfNmheBmLtZBIvg?=
 =?us-ascii?q?KrLsJaIsI4StFCztgarIBmOO/reNzPwf4t/Od608kxQ75PXz9dlTQJprCxkQ?=
 =?us-ascii?q?yMX85acVYWSI27OZC7DdceroGCLTyk9hngsFC29J5Pljk/F3oPJ8D8shclke?=
 =?us-ascii?q?pKmULSdY3ooHlc+IMscoUsLd9AR09YAbeeRXlvlVePa+6UzCXf9s9JGGjt8B?=
 =?us-ascii?q?5Gr8nuDiM/PVAYw5TTSUxzrUGj2zBH5BLpHTU24wuCRroN8RoZWTM6bpF21E?=
 =?us-ascii?q?/+wE77A17qYfrjHnk0iGtY+PCCkkHNaQJqIhR9B4Cc11KgmL/cVYk5LzTKTk?=
 =?us-ascii?q?Lidyv0X6drqEF1vZPSR3r1BAnG0EAknVUFC0JXdKHS7vN3V9EbBb2fE0fhkF?=
 =?us-ascii?q?khwNoodkgpyKTgRqKJJcWlSN3hvgMrzmtpXUNJEmsU8JcjDJ54EtzdswFnxF?=
 =?us-ascii?q?fs8TIDrW6jQ6M8e1yVYrtxPAv/fT9EEcjcpZxPFCzVEPU0dBY4WmPiuwH/yb?=
 =?us-ascii?q?1Vwql+PqK8mpXPB0SR62b7qNtvec9jMTsJQ9m6Yu2OA4G3/DTkRPdqYzzuO+?=
 =?us-ascii?q?3bqjejK9QvkQ486CKCo+/Jti1qW3nEPBQcNE1C8pJGRiUe/X9tZJGQO9yMqs?=
 =?us-ascii?q?aUxskesS7HVVBS9iHiJuVsOVt1WVeE3gCmWw6/VywKeAW4JCDBAAPQrsM4/S?=
 =?us-ascii?q?TE010OOt9zsDD1r9raSTBq1/7OPpHa+NDYYKUcLYTQNCBMf5Nvuq511iQjAJ?=
 =?us-ascii?q?v5nEaionpj5HjrY3T+Htm49iq8VgMpN0L+0lXjDgjSxtt3KQxQz6wH/QG2o9?=
 =?us-ascii?q?EV6aZSjaoju7kLUhd5qNo+VSlSQ+kMPnNSCxPIDB4uE0ieKRY0w8BuBjxqeG?=
 =?us-ascii?q?GeAxAQ2Rdx7rmnooiLyO4tZ6jVzYltkMd0NZyH4JkTUvGtsCFZoFCPCRcdKj?=
 =?us-ascii?q?0iZUKzGFZTdKOk=3D?=
IronPort-HdrOrdr: =?us-ascii?q?A9a23=3Aj/jgFKCyaUX8lrXlHem155DYdb4zR+YMi2?=
 =?us-ascii?q?TDGXoddfUzSL36qynAppsmPHPP4wr5O0tBpTn/Ase9qBrnnPZICOIqUYtKMj?=
 =?us-ascii?q?ONhILRFuBf0bc=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A2FoBADSardh/5XX1BhagRKBUIMPbGy?=
 =?us-ascii?q?NS4hLAZwOgXwLAQEBAQEBAQEBCUEEAQGFAAQCgyYmNgcOAQIEAQEBEgEBAQU?=
 =?us-ascii?q?BAQEBAQYEAgKBGIV1hwQBIAMjKSZvE4JxgxiyVoEBiBaBY4E6iSyFPYFVRIE?=
 =?us-ascii?q?VgnpuikIEkneBDpgUAYxCnTQzB4NDgTsLnUgaM6dQliymSYFoAoIMMxojgzl?=
 =?us-ascii?q?RGQ+OLBaOTCYwOAIGCwEBAwmQcAEB?=
X-IPAS-Result: =?us-ascii?q?A2FoBADSardh/5XX1BhagRKBUIMPbGyNS4hLAZwOgXwLA?=
 =?us-ascii?q?QEBAQEBAQEBCUEEAQGFAAQCgyYmNgcOAQIEAQEBEgEBAQUBAQEBAQYEAgKBG?=
 =?us-ascii?q?IV1hwQBIAMjKSZvE4JxgxiyVoEBiBaBY4E6iSyFPYFVRIEVgnpuikIEkneBD?=
 =?us-ascii?q?pgUAYxCnTQzB4NDgTsLnUgaM6dQliymSYFoAoIMMxojgzlRGQ+OLBaOTCYwO?=
 =?us-ascii?q?AIGCwEBAwmQcAEB?=
X-IronPort-AV: E=Sophos;i="5.88,202,1635220800"; d="scan'208";a="175691171"
Received: from 24-212-215-149.cable.teksavvy.com (HELO
 BradsZBook.confuseacat.org) ([24.212.215.149])
 by smtp13.teksavvy.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 13 Dec 2021 10:50:42 -0500
From: Bradley Scott <Bradley.Scott@zebra.com>
To: Takashi Iwai <tiwai@suse.de>
Subject: [PATCH v2] ALSA: hda/realtek: Amp init fixup for HP ZBook 15 G6
Date: Mon, 13 Dec 2021 10:49:39 -0500
Message-Id: <20211213154938.503201-1-Bradley.Scott@zebra.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Kailang Yang <kailang@realtek.com>,
 Bradley Scott <Bradley.Scott@zebra.com>, Jonathan Corbet <corbet@lwn.net>,
 linux-kernel@vger.kernel.org, Jeremy Szu <jeremy.szu@canonical.com>,
 linux-doc@vger.kernel.org, Takashi Iwai <tiwai@suse.com>,
 Werner Sembach <wse@tuxedocomputers.com>, Hui Wang <hui.wang@canonical.com>,
 Sami Loone <sami@loone.fi>, Cameron Berkenpas <cam@neo-zeon.de>,
 Elia Devito <eliadevito@gmail.com>
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

HP ZBook 15 G6 (SSID 103c:860f) needs the same speaker amplifier
initialization as used on several other HP laptops using ALC285.

Signed-off-by: Bradley Scott <Bradley.Scott@zebra.com>
---
 sound/pci/hda/patch_realtek.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index 3599f4c85ebf..d162662fe684 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -8660,6 +8660,7 @@ static const struct snd_pci_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x103c, 0x84da, "HP OMEN dc0019-ur", ALC295_FIXUP_HP_OMEN),
 	SND_PCI_QUIRK(0x103c, 0x84e7, "HP Pavilion 15", ALC269_FIXUP_HP_MUTE_LED_MIC3),
 	SND_PCI_QUIRK(0x103c, 0x8519, "HP Spectre x360 15-df0xxx", ALC285_FIXUP_HP_SPECTRE_X360),
+	SND_PCI_QUIRK(0x103c, 0x860f, "HP ZBook 15 G6", ALC285_FIXUP_HP_GPIO_AMP_INIT),
 	SND_PCI_QUIRK(0x103c, 0x861f, "HP Elite Dragonfly G1", ALC285_FIXUP_HP_GPIO_AMP_INIT),
 	SND_PCI_QUIRK(0x103c, 0x869d, "HP", ALC236_FIXUP_HP_MUTE_LED),
 	SND_PCI_QUIRK(0x103c, 0x86c7, "HP Envy AiO 32", ALC274_FIXUP_HP_ENVY_GPIO),
-- 
2.25.1

