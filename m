Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 012493CB837
	for <lists+alsa-devel@lfdr.de>; Fri, 16 Jul 2021 15:57:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 59B751688;
	Fri, 16 Jul 2021 15:56:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 59B751688
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1626443862;
	bh=XnDBWC66bWhfa8Cw5nzxQR4RJmo2A07oBvMx7X9WUTQ=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=WB4U5SSmCddfOuCShVRsgFgQ49xc5n0wGWkV3NUWqZjBzLjOdSsPq7a1KRNVNCIJV
	 atOu45k22OtBh6TdGKnoaAz+fLcNny/F3L3DQpUkzXxVhE2ns/u6jjPh/2SI6ph9nG
	 8qH3Wk9T1l65vzyc9GAxE26x0/3zApZ9cSlDSNMk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C3E7EF800FE;
	Fri, 16 Jul 2021 15:56:10 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2F9F4F80254; Fri, 16 Jul 2021 15:56:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1AB41F800FE
 for <alsa-devel@alsa-project.org>; Fri, 16 Jul 2021 15:56:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1AB41F800FE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="EOCiWDcB"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="5bxAsP3k"
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id E54801FEA9
 for <alsa-devel@alsa-project.org>; Fri, 16 Jul 2021 13:56:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1626443760; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=AM/pohkhI1nBE4rTAgDlA2dyzKvouXvvew9BnRElBjI=;
 b=EOCiWDcBfHjHPjHNMVTeDG7CSc1RRifXXAE1bIGImVm8mMHnFlYNy4Th+lShhavmw5GPN0
 oqoBq4vNwbFveCwSBOPOiDl8zEpzjTS6VyD4rvDQ6mtHJZQQ/UMjlQfP+nK8NWwy1R7/3B
 CGGFZAniZ/0Lqv1dlRIJ4ZB3za3iHyw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1626443760;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=AM/pohkhI1nBE4rTAgDlA2dyzKvouXvvew9BnRElBjI=;
 b=5bxAsP3kfbNDzAw7mRy+c0gNiOTqzq7ZJZOZGpf1cm6j+Gqi7brxPRX+suJyrq8L6oDGuu
 8Kp3Q1OzymX6FDDg==
Received: from alsa1.nue.suse.com (alsa1.suse.de [10.160.4.42])
 by relay2.suse.de (Postfix) with ESMTP id D4F39A3BB8;
 Fri, 16 Jul 2021 13:56:00 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ALSA: hdmi: Expose all pins on MSI MS-7C94 board
Date: Fri, 16 Jul 2021 15:56:00 +0200
Message-Id: <20210716135600.24176-1-tiwai@suse.de>
X-Mailer: git-send-email 2.26.2
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

The BIOS on MSI Mortar B550m WiFi (MS-7C94) board with AMDGPU seems
disabling the other pins than HDMI although it has more outputs
including DP.

This patch adds the board to the allow list for enabling all pins.

Reported-by: Damjan Georgievski <gdamjan@gmail.com>
Cc: <stable@vger.kernel.org>
Link: https://lore.kernel.org/r/CAEk1YH4Jd0a8vfZxORVu7qg+Zsc-K+pR187ezNq8QhJBPW4gpw@mail.gmail.com
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/hda/patch_hdmi.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/pci/hda/patch_hdmi.c b/sound/pci/hda/patch_hdmi.c
index 4b2cc8cb55c4..84c088912b3c 100644
--- a/sound/pci/hda/patch_hdmi.c
+++ b/sound/pci/hda/patch_hdmi.c
@@ -1940,6 +1940,7 @@ static int hdmi_add_cvt(struct hda_codec *codec, hda_nid_t cvt_nid)
 static const struct snd_pci_quirk force_connect_list[] = {
 	SND_PCI_QUIRK(0x103c, 0x870f, "HP", 1),
 	SND_PCI_QUIRK(0x103c, 0x871a, "HP", 1),
+	SND_PCI_QUIRK(0x1462, 0xec94, "MS-7C94", 1),
 	{}
 };
 
-- 
2.26.2

