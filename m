Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DBB3D8A9F2E
	for <lists+alsa-devel@lfdr.de>; Thu, 18 Apr 2024 17:54:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 571BBBC0;
	Thu, 18 Apr 2024 17:54:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 571BBBC0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1713455662;
	bh=S5SKxjqBLEazmK9VzoxpMLNUbW254TmsbmfvUiZKfkU=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=c+GCpu6Zo6fOP/F+ZFVVoouIgTVWuox6T9fOnPzX2K6UlBkkPQXIX2sk9fpyJ+CxM
	 0K78CgoS8Yj5CtWcdy4MByacabpSCoYPnY15AG8wI/DagkSmJCBtcVFujENUHddyLq
	 GzlAWXnqBb0/OLdP1fQso9yTVgdrPflCPWZXgOmw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 58F10F897A3; Thu, 18 Apr 2024 17:47:50 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 30C82F897AD;
	Thu, 18 Apr 2024 17:47:49 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DB82EF8026D; Sat, 13 Apr 2024 13:58:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: ***
X-Spam-Status: No, score=3.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	HELO_DYNAMIC_IPADDR,RDNS_DYNAMIC,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=no autolearn_force=no version=3.4.6
Received: from out162-62-57-252.mail.qq.com (out162-62-57-252.mail.qq.com
 [162.62.57.252])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with UTF8SMTPS id AC9A7F8013D
	for <alsa-devel@alsa-project.org>; Sat, 13 Apr 2024 13:58:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AC9A7F8013D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=qq.com header.i=@qq.com header.a=rsa-sha256
 header.s=s201512 header.b=qn2jeiFy
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1713009528; bh=buU/TI1ycm4oXmFV2yW1Moaxa/OBm98bV+Uw5KNRXxo=;
	h=From:To:Cc:Subject:Date;
	b=qn2jeiFyDV3AycY/18ImhPd/E6F2aNmnyEvdIr9b5ryEtNGVeQV64YeJIs3kLNwR/
	 LSfK6yTaZaxP2wHW9bfpg6A1dApDurdSfZl3GRNWacvXB6eAd2XokR/EkAxdMlwlpB
	 9IZMFZELCcbOQZySe5xRFuuEx+RvNBnWFoHZsQd0=
Received: from levi-pc.. ([61.186.29.10])
	by newxmesmtplogicsvrszc19-0.qq.com (NewEsmtp) with SMTP
	id A4B1F810; Sat, 13 Apr 2024 19:41:11 +0800
X-QQ-mid: xmsmtpt1713008471t21yb30x3
Message-ID: <tencent_37EB880C5E5BD99D21C16B288115C4545F06@qq.com>
X-QQ-XMAILINFO: Nx5llcX2zp4EfIlu/YnLYTHyOv1Fz6LhBZJqmmpegZxljWmX0TmL0/dPqaPKOS
	 KCFhD788ITjLkg61iwrr8vsW3z9pGQEH0s2IiGeMPKkxDlhcXN9fbH/AWLIx6nP607/KhafMaVZo
	 MHUBo11WDj+0ZvWJ4wxDm/MlkG+qvLzhxwPW8ofPDm+IcpnUlmN8qb+ak7+ujBeAn6kLPSZiHUfc
	 wsZNyZiyg6xjS9/7Xq0tu+WgxdJiRUfLtrgVFjm/eyJ487kQo8W7k+sFmFp9QhGX04j4mJ6rB+n1
	 9gyz365oK+LwYw3WGu/WFn1p39Zg3Hk7CON8d8g/zBrgkEjJIQq1zmcGnqksygIIQd+sS66X/wf2
	 XVV3doIuc/jeX5LfE6dqL/snOih5Ot1K8i2P01hFdGJMbhIrEedp9v6l7wQtAEA9HgOPHJzf85kt
	 160+8eW++m86PNawfVoEw+OVXVVroDOUVjtCzUU2qV9A3EQd3R9FYTbkUhjJX0fRsA2eNgYOlgtb
	 w9dHbvaBFPWn5fu3DPXx0ZLwG/FjshvTxm24MGDSQfU5xmecFTss6wJiTBntOt48pmLr9YP5srHc
	 AzZIU5pY8Xhct0mV9l5j7eHIaYqR4xiOspoLiD7Ng1z9/k7IbxuzWXcPNmH6/kVYvGqNqrsg8KC3
	 v3/feApTsq1UfjS6WavSkhI4dqUmOLgoMRPp+fVWgYOOlCTi55DSL6TF3syyP85oz2c9XICYm9c4
	 V04lVgwR7IfDJwz2MNb/5eXMVGNRS8FQP22PzgM/wUJDrFRhJ9TO5ThCenOQj89e1lEuuZZiz1aH
	 s4S88lU+cU9VUTaYndXFDvXnAlkgMEQUQRSo0T0HyIJDmvq70+TXPZUoZXLW2Dls9V+BZ8NWkpg1
	 RA2x5hjlxN1vBwIjYl5X/1tTGCy71Td+ILXxJtv4oL/JkbWrax89fcuSzH/6emOfU+onPOp5etGz
	 /2nuHsvo2DJzqQZS26Uxf+FOKeZy4ooF/IqJWR6sBGQsvRql+fHzlSLrXpmli0v+uUSHenu/7KGw
	 A8tIPQZmCXiMeGSUTHr8zKPDCXMVUpIxR0NwyGStAVLY44iA38rJ13EnmtrqAmrRwTZVTNW/Epma
	 uwVn+Kv6JlkR789QanGE2pnwfH3B+2ieq32BAV
X-QQ-XMRINFO: Mp0Kj//9VHAxr69bL5MkOOs=
From: zhanghuayu1233@qq.com
To: perex@perex.cz,
	tiwai@suse.com,
	sbinding@opensource.cirrus.com
Cc: alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	patches@opensource.cirrus.com,
	zhanghuayu.dev@gmail.com,
	zhanghuayu1233@qq.com
Subject: [PATCH] Fix volumn control of ThinkBook 16P Gen4
Date: Sat, 13 Apr 2024 19:41:22 +0800
X-OQ-MSGID: <20240413114122.24524-1-zhanghuayu1233@qq.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MailFrom: zhanghuayu1233@qq.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: JNTWERKDKW5FKQES32XNAFBFX4SCMMKY
X-Message-ID-Hash: JNTWERKDKW5FKQES32XNAFBFX4SCMMKY
X-Mailman-Approved-At: Thu, 18 Apr 2024 15:47:17 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JNTWERKDKW5FKQES32XNAFBFX4SCMMKY/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Huayu Zhang <zhanghuayu1233@qq.com>

change HDA & AMP configuration from ALC287_FIXUP_CS35L41_I2C_2 to
ALC287_FIXUP_MG_RTKC_CSAMP_CS35L41_I2C_THINKPAD for ThinkBook 16P Gen4 models to fix volumn
control issue (cannot fully mute).

Signed-off-by: Huayu Zhang <zhanghuayu1233@qq.com>
---
 sound/pci/hda/patch_realtek.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index d6940bc4ec39..1aef223307bb 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -10396,8 +10396,8 @@ static const struct snd_pci_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x17aa, 0x3886, "Y780 VECO DUAL", ALC287_FIXUP_TAS2781_I2C),
 	SND_PCI_QUIRK(0x17aa, 0x38a7, "Y780P AMD YG dual", ALC287_FIXUP_TAS2781_I2C),
 	SND_PCI_QUIRK(0x17aa, 0x38a8, "Y780P AMD VECO dual", ALC287_FIXUP_TAS2781_I2C),
-	SND_PCI_QUIRK(0x17aa, 0x38a9, "Thinkbook 16P", ALC287_FIXUP_CS35L41_I2C_2),
-	SND_PCI_QUIRK(0x17aa, 0x38ab, "Thinkbook 16P", ALC287_FIXUP_CS35L41_I2C_2),
+	SND_PCI_QUIRK(0x17aa, 0x38a9, "Thinkbook 16P", ALC287_FIXUP_MG_RTKC_CSAMP_CS35L41_I2C_THINKPAD),
+	SND_PCI_QUIRK(0x17aa, 0x38ab, "Thinkbook 16P", ALC287_FIXUP_MG_RTKC_CSAMP_CS35L41_I2C_THINKPAD),
 	SND_PCI_QUIRK(0x17aa, 0x38b4, "Legion Slim 7 16IRH8", ALC287_FIXUP_CS35L41_I2C_2),
 	SND_PCI_QUIRK(0x17aa, 0x38b5, "Legion Slim 7 16IRH8", ALC287_FIXUP_CS35L41_I2C_2),
 	SND_PCI_QUIRK(0x17aa, 0x38b6, "Legion Slim 7 16APH8", ALC287_FIXUP_CS35L41_I2C_2),
-- 
2.34.1

