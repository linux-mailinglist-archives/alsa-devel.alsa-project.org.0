Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D98F46F9348
	for <lists+alsa-devel@lfdr.de>; Sat,  6 May 2023 19:17:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0A51D21B2;
	Sat,  6 May 2023 19:16:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0A51D21B2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1683393427;
	bh=uMcoI2DnS0NwiukUjF+ZiM2DidnKVWi9a0SbMENzikM=;
	h=From:To:Subject:Date:CC:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=n/E7/yyMHrFK/KK0BeRUeYmadZ4h2nBULzEO+CON+nj+NR5GryjMlCcznUTEtFLie
	 5dRo5LuPmbh7sVXYa/agUdybS3kXReCemeS+GMMO2Ly2aPy7qP/znq/95qaIyBafrM
	 boSsso8KkHabS7QBdmOh4NfBJd/TlylzSsiw76KY=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 70690F80529;
	Sat,  6 May 2023 19:16:16 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2ABA9F8052D; Sat,  6 May 2023 19:16:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from m12.mail.163.com (m12.mail.163.com [220.181.12.215])
	by alsa1.perex.cz (Postfix) with ESMTP id 8B9B4F80087
	for <alsa-devel@alsa-project.org>; Sat,  6 May 2023 19:16:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8B9B4F80087
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256
 header.s=s110527 header.b=Fks/akAA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=XDbPr
	foM+vd09SU0nLd9OpVWaVSYKPv82lGdDyy/2QU=; b=Fks/akAA1RFcj6Cav+w9B
	aD1FFWv2XtV6mwY7eHa4AklfcWIh1C8p+eMax+1GWRN/WqgWCgEcymKAVtPtSaUZ
	Ns72pw8ZiQZVsios5P/T1Ea0qdUa8BhU3pLzghZlGMIbrxvfsyqnluooirsVel+6
	AspOFQnyU6/+OAkTtNvyuY=
Received: from localhost.localdomain (unknown [111.43.134.127])
	by zwqz-smtp-mta-g2-2 (Coremail) with SMTP id
 _____wAH_qFKi1ZkAC2QBA--.41346S2;
	Sun, 07 May 2023 01:15:54 +0800 (CST)
From: frshuov@163.com
To: alsa-devel@alsa-project.org
Subject: [PATCH] ALSA: hda/realtek: Add quirk for ASUS GU603ZM
Date: Sun,  7 May 2023 01:15:46 +0800
Message-Id: <20230506171546.50815-1-frshuov@163.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wAH_qFKi1ZkAC2QBA--.41346S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrtr1fZr18AF4fXFW5WFWDtwb_yoWkuFb_Ar
	W3GFW5GF4UZwnrGFn3Grn5Ar4Iyrn8urZrXFyftFs8Jw4fKa109FnYkrnIkF1xXrW8ur15
	G3yYyrWrtry5KjkaLaAFLSUrUUUUbb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7sRCyxi3UUUUU==
X-Originating-IP: [111.43.134.127]
X-CM-SenderInfo: xiuvx3lry6il2tof0z/1tbisQtnCWMr+EtimQAAsU
Message-ID-Hash: UOLKBRCYG5LQAS3LNBBFPBTPUHE2YIJN
X-Message-ID-Hash: UOLKBRCYG5LQAS3LNBBFPBTPUHE2YIJN
X-MailFrom: frshuov@163.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: tiwai@suse.de, stable@vger.kernel.org, Larry Chi <frshuov@163.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/UOLKBRCYG5LQAS3LNBBFPBTPUHE2YIJN/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Larry Chi <frshuov@163.com>

ASUS ROG Zephyrus M16 2022 GU603ZM (1043:1c62)
added SND_PCI_QUIRK for speaker and headset-mic working properly

Signed-off-by: Larry Chi <frshuov@163.com>
---
 sound/pci/hda/patch_realtek.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index 172ffc2c332b..374a9755d19a 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -9522,6 +9522,7 @@ static const struct snd_pci_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x1043, 0x1b13, "Asus U41SV", ALC269_FIXUP_INV_DMIC),
 	SND_PCI_QUIRK(0x1043, 0x1bbd, "ASUS Z550MA", ALC255_FIXUP_ASUS_MIC_NO_PRESENCE),
 	SND_PCI_QUIRK(0x1043, 0x1c23, "Asus X55U", ALC269_FIXUP_LIMIT_INT_MIC_BOOST),
+    SND_PCI_QUIRK(0x1043, 0x1c62, "ASUS GU603ZM", ALC289_FIXUP_ASUS_GA401),
 	SND_PCI_QUIRK(0x1043, 0x1c92, "ASUS ROG Strix G15", ALC285_FIXUP_ASUS_G533Z_PINS),
 	SND_PCI_QUIRK(0x1043, 0x1ccd, "ASUS X555UB", ALC256_FIXUP_ASUS_MIC),
 	SND_PCI_QUIRK(0x1043, 0x1d42, "ASUS Zephyrus G14 2022", ALC289_FIXUP_ASUS_GA401),
-- 
2.40.1

