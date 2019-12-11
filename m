Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4873F11A3AE
	for <lists+alsa-devel@lfdr.de>; Wed, 11 Dec 2019 06:15:35 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AD2A51657;
	Wed, 11 Dec 2019 06:14:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AD2A51657
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1576041334;
	bh=iQM968OY1e80AAlFmmRAKjvybr+byUzvy/K1dIW2u68=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Xrgrx0RXc/6O+yaCEjGXX2wDxUsgFQlbC5XtaiE46KCgKfk8EKOJdLHZW7YbC0MA0
	 8fbJNuOV6r2AgjQlWxcjxnN8v6zKvUWG6NROGq4Yyh8UXZX/khx2j+tzLYE/e4Q1WR
	 rfjL48HbW+JrRAYf+zfuQis+U7BHqpWHaJdAY2lQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7B26EF80234;
	Wed, 11 Dec 2019 06:13:51 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AE59CF801F4; Wed, 11 Dec 2019 06:13:45 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7112CF8011E
 for <alsa-devel@alsa-project.org>; Wed, 11 Dec 2019 06:13:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7112CF8011E
Received: from [125.35.49.90] (helo=localhost.localdomain)
 by youngberry.canonical.com with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <hui.wang@canonical.com>)
 id 1ieuJf-0008C7-PR; Wed, 11 Dec 2019 05:13:40 +0000
From: Hui Wang <hui.wang@canonical.com>
To: alsa-devel@alsa-project.org,
	tiwai@suse.de
Date: Wed, 11 Dec 2019 13:13:21 +0800
Message-Id: <20191211051321.5883-1-hui.wang@canonical.com>
X-Mailer: git-send-email 2.17.1
Cc: stable@vger.kernel.org
Subject: [alsa-devel] [PATCH] ALSA: hda/realtek - Line-out jack doesn't work
	on a Dell AIO
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

After applying the fixup ALC274_FIXUP_DELL_AIO_LINEOUT_VERB, the
Line-out jack works well. And instead of adding a new set of pin
definition in the pin_fixup_tbl, we put a more generic matching entry
in the fallback_pin_fixup_tbl.

Cc: <stable@vger.kernel.org>
Signed-off-by: Hui Wang <hui.wang@canonical.com>
---
 sound/pci/hda/patch_realtek.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index 6d6e34b3b3aa..dbfafee97931 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -7643,11 +7643,6 @@ static const struct snd_hda_pin_quirk alc269_pin_fixup_tbl[] = {
 		{0x1a, 0x90a70130},
 		{0x1b, 0x90170110},
 		{0x21, 0x03211020}),
-	SND_HDA_PIN_QUIRK(0x10ec0274, 0x1028, "Dell", ALC274_FIXUP_DELL_AIO_LINEOUT_VERB,
-		{0x12, 0xb7a60130},
-		{0x13, 0xb8a61140},
-		{0x16, 0x90170110},
-		{0x21, 0x04211020}),
 	SND_HDA_PIN_QUIRK(0x10ec0280, 0x103c, "HP", ALC280_FIXUP_HP_GPIO4,
 		{0x12, 0x90a60130},
 		{0x14, 0x90170110},
@@ -7841,6 +7836,9 @@ static const struct snd_hda_pin_quirk alc269_fallback_pin_fixup_tbl[] = {
 	SND_HDA_PIN_QUIRK(0x10ec0236, 0x1028, "Dell", ALC255_FIXUP_DELL1_MIC_NO_PRESENCE,
 		{0x19, 0x40000000},
 		{0x1a, 0x40000000}),
+	SND_HDA_PIN_QUIRK(0x10ec0274, 0x1028, "Dell", ALC274_FIXUP_DELL_AIO_LINEOUT_VERB,
+		{0x19, 0x40000000},
+		{0x1a, 0x40000000}),
 	{}
 };
 
-- 
2.17.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
