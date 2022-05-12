Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 047F052547F
	for <lists+alsa-devel@lfdr.de>; Thu, 12 May 2022 20:11:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 92A971AC5;
	Thu, 12 May 2022 20:10:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 92A971AC5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1652379066;
	bh=lnzILpdh2K8lGWVaQPF3fcRFvtUVSxBJPnRKUuK178o=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=nFTkGjSU4oRxJZTZUD1j/96VYdfJU53G5Tx4X2xxX8SJOpBfqKchOv6b/ZzrNnpGh
	 DVlw21tbRMettwivrP7NfumZUb+dE4C5JiWD82KSaOqKS8a+Ia9UiQP3GDbiSAT8f3
	 wr/PxowD17Wjq8QEGAbSi2fxfTvtuds6E5fimzCo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1CB13F80249;
	Thu, 12 May 2022 20:10:08 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BCA54F8010B; Thu, 12 May 2022 20:10:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from srv6.fidu.org (srv6.fidu.org [159.69.62.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 36EF7F8010B
 for <alsa-devel@alsa-project.org>; Thu, 12 May 2022 20:10:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 36EF7F8010B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=tuxedocomputers.com
 header.i=@tuxedocomputers.com header.b="V9vBq+2A"
Received: from localhost (localhost.localdomain [127.0.0.1])
 by srv6.fidu.org (Postfix) with ESMTP id B7584C800A0;
 Thu, 12 May 2022 20:09:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 tuxedocomputers.com; h=content-transfer-encoding:mime-version
 :x-mailer:message-id:date:date:subject:subject:from:from; s=
 default; t=1652378999; x=1654193400; bh=lnzILpdh2K8lGWVaQPF3fcRF
 vtUVSxBJPnRKUuK178o=; b=V9vBq+2AoWAORWo09hcDuIxXZ2KL8nvT/vS28wQ1
 gbqzm5HsslAad7b7vFdOySu/UK/LrRBOkWi1EIID+Rk6wsJZ9lZgt77deuD5dOsA
 jXIKjag/acvjqqnIpagdDJeYR8qURO3+DawvndbSD9L0p10zjac5a2V1xs+g332B
 hbw=
X-Virus-Scanned: Debian amavisd-new at srv6.fidu.org
Received: from srv6.fidu.org ([127.0.0.1])
 by localhost (srv6.fidu.org [127.0.0.1]) (amavisd-new, port 10026)
 with LMTP id njhnehTx8C5h; Thu, 12 May 2022 20:09:59 +0200 (CEST)
Received: from wsembach-tuxedo.fritz.box
 (host-212-18-30-247.customer.m-online.net [212.18.30.247])
 (Authenticated sender: wse@tuxedocomputers.com)
 by srv6.fidu.org (Postfix) with ESMTPA id 1615BC8009E;
 Thu, 12 May 2022 20:09:59 +0200 (CEST)
From: Werner Sembach <wse@tuxedocomputers.com>
To: perex@perex.cz, tiwai@suse.com, kai.vehmanen@linux.intel.com,
 pierre-louis.bossart@linux.intel.com, imre.deak@intel.com,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2] ALSA: hda/realtek: Add quirk for TongFang devices with pop
 noise
Date: Thu, 12 May 2022 20:09:56 +0200
Message-Id: <20220512180956.281804-1-wse@tuxedocomputers.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

When audio stops playing there is an audible "pop"-noise when using
headphones on the TongFang GMxMRxx, GKxNRxx, GMxZGxx, GMxTGxx and GMxAGxx.

This quirk fixes this mostly.

Signed-off-by: Werner Sembach <wse@tuxedocomputers.com>
Cc: stable@vger.kernel.org
---
 sound/pci/hda/patch_realtek.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index cf531c1efa132..8003bf7441d6d 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -9290,6 +9290,14 @@ static const struct snd_pci_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x1c06, 0x2013, "Lemote A1802", ALC269_FIXUP_LEMOTE_A1802),
 	SND_PCI_QUIRK(0x1c06, 0x2015, "Lemote A190X", ALC269_FIXUP_LEMOTE_A190X),
 	SND_PCI_QUIRK(0x1d05, 0x1132, "TongFang PHxTxX1", ALC256_FIXUP_SET_COEF_DEFAULTS),
+	SND_PCI_QUIRK(0x1d05, 0x1096, "TongFang GMxMRxx", ALC269_FIXUP_NO_SHUTUP),
+	SND_PCI_QUIRK(0x1d05, 0x1100, "TongFang GKxNRxx", ALC269_FIXUP_NO_SHUTUP),
+	SND_PCI_QUIRK(0x1d05, 0x1111, "TongFang GMxZGxx", ALC269_FIXUP_NO_SHUTUP),
+	SND_PCI_QUIRK(0x1d05, 0x1119, "TongFang GMxZGxx", ALC269_FIXUP_NO_SHUTUP),
+	SND_PCI_QUIRK(0x1d05, 0x1129, "TongFang GMxZGxx", ALC269_FIXUP_NO_SHUTUP),
+	SND_PCI_QUIRK(0x1d05, 0x1147, "TongFang GMxTGxx", ALC269_FIXUP_NO_SHUTUP),
+	SND_PCI_QUIRK(0x1d05, 0x115c, "TongFang GMxTGxx", ALC269_FIXUP_NO_SHUTUP),
+	SND_PCI_QUIRK(0x1d05, 0x121b, "TongFang GMxAGxx", ALC269_FIXUP_NO_SHUTUP),
 	SND_PCI_QUIRK(0x1d72, 0x1602, "RedmiBook", ALC255_FIXUP_XIAOMI_HEADSET_MIC),
 	SND_PCI_QUIRK(0x1d72, 0x1701, "XiaomiNotebook Pro", ALC298_FIXUP_DELL1_MIC_NO_PRESENCE),
 	SND_PCI_QUIRK(0x1d72, 0x1901, "RedmiBook 14", ALC256_FIXUP_ASUS_HEADSET_MIC),
-- 
2.25.1

