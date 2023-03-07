Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DB466AF6E4
	for <lists+alsa-devel@lfdr.de>; Tue,  7 Mar 2023 21:45:00 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3CF221599;
	Tue,  7 Mar 2023 21:44:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3CF221599
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678221899;
	bh=NuO8UAZcKVDSwoFoeZu9FBy6Ay4iiw09tdqRjBF8Ies=;
	h=From:To:Subject:Date:CC:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=t5OSnzuyxc6hY+juXISSGgkk8NqaesSE4gC3qwqqucX4A9H+/q9bxckR903I9TKj7
	 RRN6kvEGXhs3cZBA4CbeEUsorKza9WT9s+RCjM5goBaJ012QLh8XEIvHvnZOuvtUcZ
	 Hmq+F1iBCQgwKn5oE69s1E2I9b4yQ9FUri60qFoU=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9A8EDF80236;
	Tue,  7 Mar 2023 21:44:08 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3F813F8042F; Tue,  7 Mar 2023 17:40:37 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,RCVD_IN_MSPIKE_H2,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mout01.posteo.de (mout01.posteo.de [185.67.36.65])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C30BBF800DF
	for <alsa-devel@alsa-project.org>; Tue,  7 Mar 2023 17:40:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C30BBF800DF
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=posteo.net header.i=@posteo.net header.a=rsa-sha256
 header.s=2017 header.b=D26WLG0/
Received: from submission (posteo.de [185.67.36.169])
	by mout01.posteo.de (Postfix) with ESMTPS id 266D5240540
	for <alsa-devel@alsa-project.org>; Tue,  7 Mar 2023 17:40:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.net; s=2017;
	t=1678207229; bh=NuO8UAZcKVDSwoFoeZu9FBy6Ay4iiw09tdqRjBF8Ies=;
	h=From:To:Cc:Subject:Date:From;
	b=D26WLG0/L6TQuTI+MRYCsOI6ePQjCzQ3YOKIaJKeNyT1+ls/gowd/1N2v8uu1W0Ch
	 wW9JSzkZ9lDYn37n3ecJIa9UpjuD8cTmV5QNRl6ksWCji0Ggd8sXu+0Z98FjpfEnO/
	 KL3PTnT2/INqeEwHmbyC2oTOxUAWkB3VsVUCqZYfOFUPEFTkdMz6FHpwsaocOOHN0W
	 K+FDCNih5W+1TKVygc0Jv9FoCu5TzeadVJhu+QTDSV3GSq2TImf9escB8WEPMqWoRL
	 ozMtjvHUao+0WC0KIM9+AsGFjPV91BoeLDrG2W+QD8SVgQlzsUWfVB3UWJWvuLl/W7
	 HhwuOLLnOng7Q==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4PWLlv686Dz9rxD;
	Tue,  7 Mar 2023 17:40:27 +0100 (CET)
From: "Hamidreza H. Fard" <nitocris@posteo.net>
To: tiwai@suse.com
Subject: [PATCH] ALSA: hda/realtek: Fix the speaker output on Samsung Galaxy
 Book2 Pro
Date: Tue,  7 Mar 2023 16:37:41 +0000
Message-Id: <20230307163741.3878-1-nitocris@posteo.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MailFrom: nitocris@posteo.net
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: O42VMA663KW44TELGOMSNZA7NJUC25KB
X-Message-ID-Hash: O42VMA663KW44TELGOMSNZA7NJUC25KB
X-Mailman-Approved-At: Tue, 07 Mar 2023 20:44:06 +0000
CC: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 "Hamidreza H. Fard" <nitocris@posteo.net>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/O42VMA663KW44TELGOMSNZA7NJUC25KB/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Samsung Galaxy Book2 Pro (13" 2022 NP930XED-KA1DE) with codec SSID
144d:c868 requires the same workaround for enabling the speaker amp
like other Samsung models with ALC298 code.

Signed-off-by: Hamidreza H. Fard <nitocris@posteo.net>
---
 sound/pci/hda/patch_realtek.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index 3c629f4ae080..ef78553fe6f0 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -9539,6 +9539,7 @@ static const struct snd_pci_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x144d, 0xc830, "Samsung Galaxy Book Ion (NT950XCJ-X716A)", ALC298_FIXUP_SAMSUNG_AMP),
 	SND_PCI_QUIRK(0x144d, 0xc832, "Samsung Galaxy Book Flex Alpha (NP730QCJ)", ALC256_FIXUP_SAMSUNG_HEADPHONE_VERY_QUIET),
 	SND_PCI_QUIRK(0x144d, 0xca03, "Samsung Galaxy Book2 Pro 360 (NP930QED)", ALC298_FIXUP_SAMSUNG_AMP),
+	SND_PCI_QUIRK(0x144d, 0xc868, "Samsung Galaxy Book2 Pro (NP930XED)", ALC298_FIXUP_SAMSUNG_AMP),
 	SND_PCI_QUIRK(0x1458, 0xfa53, "Gigabyte BXBT-2807", ALC283_FIXUP_HEADSET_MIC),
 	SND_PCI_QUIRK(0x1462, 0xb120, "MSI Cubi MS-B120", ALC283_FIXUP_HEADSET_MIC),
 	SND_PCI_QUIRK(0x1462, 0xb171, "Cubi N 8GL (MS-B171)", ALC283_FIXUP_HEADSET_MIC),

base-commit: a1eeed68b1f1d23ed05f66f43058988ba734ba8f
-- 
2.39.2

