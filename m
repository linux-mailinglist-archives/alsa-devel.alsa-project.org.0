Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 761B63EE63E
	for <lists+alsa-devel@lfdr.de>; Tue, 17 Aug 2021 07:26:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 14BC9950;
	Tue, 17 Aug 2021 07:25:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 14BC9950
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1629177964;
	bh=6kkPEe5F4hBmSPuO1w513PZNKSjsbZ5OZVQKU8ee2Io=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=h5cpl9I3EyaRq5ZeBjXEWEwpNdZTY7KEVI4pcZ8DfIRYiaxW9BgvkYjJ5o5QQwMna
	 tPy6WKv3Uyo57pOs18HF2+SzdgbmatkGIGwcKFO8ArpCeyKpvQEfZWMp52l7Obgl6Q
	 IHWTu0DxqFZ9NbSE6QdzgJUfhhCxtE7uZJTU9r68=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 72E81F802C4;
	Tue, 17 Aug 2021 07:24:47 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D0D27F80272; Tue, 17 Aug 2021 07:24:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A7C95F80134
 for <alsa-devel@alsa-project.org>; Tue, 17 Aug 2021 07:24:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A7C95F80134
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="0ZX14dGY"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="Iit5hZ01"
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id 179CE1FF04;
 Tue, 17 Aug 2021 05:24:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1629177877; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=5k1bqG/gHqH1Y8/sQNd0HN1KooKZXR3h/xBeJbis910=;
 b=0ZX14dGYyxQwsnVgdO/N3OCcqNSziLqAa2Z/vT1Q56D/YsxUD+xGx6jdYjpYKqc4Ln9zy4
 EGW6iwVIuNwtOlEWY+ZrvG6dKZrdFWdBFQSgGnhSrs4mfs+iu8VzrZ71TjBXMuAWeMMXqu
 GqusCUnTeP/6VNOJkDq0Ksk2614AmI8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1629177877;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=5k1bqG/gHqH1Y8/sQNd0HN1KooKZXR3h/xBeJbis910=;
 b=Iit5hZ01gbykm2s++BzZbyGLJUBDkBJ6lT5tydDjs1Pabk9iYaMSODfXhTqINXVBwutD5Q
 ImVT+OevlBOy4kCQ==
Received: from alsa1.nue.suse.com (alsa1.suse.de [10.160.4.42])
 by relay2.suse.de (Postfix) with ESMTP id 06B72A3B8F;
 Tue, 17 Aug 2021 05:24:37 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ALSA: hda/via: Apply runtime PM workaround for ASUS B23E
Date: Tue, 17 Aug 2021 07:24:32 +0200
Message-Id: <20210817052432.14751-1-tiwai@suse.de>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: =?UTF-8?q?=E8=97=8D=E6=8C=BA=E7=91=8B?= <lantw44@gmail.com>
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

ASUS B23E requires the same workaround like other machines with
VT1802, otherwise it looses the codec power on a few nodes and the
sound kept silence.

Fixes: a0645daf1610 ("ALSA: HDA: Early Forbid of runtime PM")
Link: https://lore.kernel.org/r/ac2232f142efcd67fe6ac38897f704f7176bd200.camel@gmail.com
Cc: <stable@vger.kernel.org>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/hda/patch_via.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/pci/hda/patch_via.c b/sound/pci/hda/patch_via.c
index a5c1a2c4eae4..773a136161f1 100644
--- a/sound/pci/hda/patch_via.c
+++ b/sound/pci/hda/patch_via.c
@@ -1041,6 +1041,7 @@ static const struct hda_fixup via_fixups[] = {
 };
 
 static const struct snd_pci_quirk vt2002p_fixups[] = {
+	SND_PCI_QUIRK(0x1043, 0x13f7, "Asus B23E", VIA_FIXUP_POWER_SAVE),
 	SND_PCI_QUIRK(0x1043, 0x1487, "Asus G75", VIA_FIXUP_ASUS_G75),
 	SND_PCI_QUIRK(0x1043, 0x8532, "Asus X202E", VIA_FIXUP_INTMIC_BOOST),
 	SND_PCI_QUIRK_VENDOR(0x1558, "Clevo", VIA_FIXUP_POWER_SAVE),
-- 
2.26.2

