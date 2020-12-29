Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DE5812E7F8F
	for <lists+alsa-devel@lfdr.de>; Thu, 31 Dec 2020 12:04:14 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C00F61712;
	Thu, 31 Dec 2020 12:03:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C00F61712
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1609412653;
	bh=TVygn1kMAkZjkbayYXWi7Q+x1QP5VCMLKGF0lbOYMMk=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=jhUbP3OadJEn2g4P/LIX3brkkr6Aw6Ugi4C5k5tyFk0k+FKVvI1Npo+M9skQClrK4
	 Kho6Q1gsQXhKSFcpLEfu0QeMAryqI+6iZnJM4XrOi8FSX3aQhsOiZpIPDJ02xxDAiC
	 bZ4r8fFWZHTD6RCWkAzapUrTp7xeJaz/nInMFUd4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C9464F804CB;
	Thu, 31 Dec 2020 12:01:45 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6C628F8022B; Tue, 29 Dec 2020 04:52:42 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 UNPARSEABLE_RELAY,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from out28-122.mail.aliyun.com (out28-122.mail.aliyun.com
 [115.124.28.122])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0114AF80143
 for <alsa-devel@alsa-project.org>; Tue, 29 Dec 2020 04:52:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0114AF80143
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.109993|-1; CH=green; DM=|CONTINUE|false|;
 DS=CONTINUE|ham_system_inform|0.00600531-0.000138118-0.993857;
 FP=0|0|0|0|0|-1|-1|-1; HT=ay29a033018047208; MF=bo.liu@senarytech.com; NM=1;
 PH=DS; RN=8; RT=8; SR=0; TI=SMTPD_---.JCdxAfz_1609213946; 
Received: from localhost.localdomain(mailfrom:bo.liu@senarytech.com
 fp:SMTPD_---.JCdxAfz_1609213946)
 by smtp.aliyun-inc.com(10.194.99.21); Tue, 29 Dec 2020 11:52:28 +0800
From: bo.liu@senarytech.com
To: perex@perex.cz,
	tiwai@suse.com
Subject: [PATCH] sound: pci: hda: add a new hda codec
Date: Tue, 29 Dec 2020 11:52:26 +0800
Message-Id: <20201229035226.62120-1-bo.liu@senarytech.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 31 Dec 2020 12:01:40 +0100
Cc: alsa-devel@alsa-project.org, gustavoars@kernel.org, pegro@friiks.de,
 linux-kernel@vger.kernel.org, mirq-linux@rere.qmqm.pl, bo.liu@senarytech.com
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

From: bo liu <bo.liu@senarytech.com>

The current kernel does not support the cx11970 codec chip.
Add a codec configuration item to kernel.

Signed-off-by: bo liu <bo.liu@senarytech.com>

diff --git a/sound/pci/hda/patch_conexant.c b/sound/pci/hda/patch_conexant.c
index be5000dd1585..e80fe8ba537c 100644
--- a/sound/pci/hda/patch_conexant.c
+++ b/sound/pci/hda/patch_conexant.c
@@ -1070,6 +1070,7 @@ static int patch_conexant_auto(struct hda_codec *codec)
 static const struct hda_device_id snd_hda_id_conexant[] = {
 	HDA_CODEC_ENTRY(0x14f11f86, "CX8070", patch_conexant_auto),
 	HDA_CODEC_ENTRY(0x14f12008, "CX8200", patch_conexant_auto),
+	HDA_CODEC_ENTRY(0x14f120D0, "CX11970", patch_conexant_auto),
 	HDA_CODEC_ENTRY(0x14f15045, "CX20549 (Venice)", patch_conexant_auto),
 	HDA_CODEC_ENTRY(0x14f15047, "CX20551 (Waikiki)", patch_conexant_auto),
 	HDA_CODEC_ENTRY(0x14f15051, "CX20561 (Hermosa)", patch_conexant_auto),
---
 sound/pci/hda/patch_conexant.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/pci/hda/patch_conexant.c b/sound/pci/hda/patch_conexant.c
index be5000dd1585..e80fe8ba537c 100644
--- a/sound/pci/hda/patch_conexant.c
+++ b/sound/pci/hda/patch_conexant.c
@@ -1070,6 +1070,7 @@ static int patch_conexant_auto(struct hda_codec *codec)
 static const struct hda_device_id snd_hda_id_conexant[] = {
 	HDA_CODEC_ENTRY(0x14f11f86, "CX8070", patch_conexant_auto),
 	HDA_CODEC_ENTRY(0x14f12008, "CX8200", patch_conexant_auto),
+	HDA_CODEC_ENTRY(0x14f120D0, "CX11970", patch_conexant_auto),
 	HDA_CODEC_ENTRY(0x14f15045, "CX20549 (Venice)", patch_conexant_auto),
 	HDA_CODEC_ENTRY(0x14f15047, "CX20551 (Waikiki)", patch_conexant_auto),
 	HDA_CODEC_ENTRY(0x14f15051, "CX20561 (Hermosa)", patch_conexant_auto),
-- 
2.25.1

