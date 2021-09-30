Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A785941D922
	for <lists+alsa-devel@lfdr.de>; Thu, 30 Sep 2021 13:55:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3DBAD16A9;
	Thu, 30 Sep 2021 13:54:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3DBAD16A9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1633002901;
	bh=Se+UIpv39a+292cKNbIYfp0bybdm3t9KNThx10lQq1M=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=R+b2ucQAma9ftejJx5cBqevcDghzlibN45/n5rmPiau0d/8zUCs9PcFOmRnsGoJdg
	 rAHhM4dSJ4cwR8MuhqUh/tO5e+ifAlqRwRjc+SX8ou58RwCR2JOufls2zMUXyzFjj8
	 BihFBepSAUUBS1cl60WOpx9Rh75Ii5p/YrM4hU7g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CC42BF800F3;
	Thu, 30 Sep 2021 13:53:44 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4D641F804AD; Thu, 30 Sep 2021 13:53:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B3860F80218
 for <alsa-devel@alsa-project.org>; Thu, 30 Sep 2021 13:53:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B3860F80218
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="qTlNs9uI"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="sgWyWAAW"
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id 70EBD1FE47
 for <alsa-devel@alsa-project.org>; Thu, 30 Sep 2021 11:53:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1633002810; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=vesisrUpMRY23dkeCD0GB06G4ySn5POLcBJJFI3dhgI=;
 b=qTlNs9uIv5CcdQ704sp4MNJmaMWkWOxgEh+rW7DmvWhc7VAfNpKd4IAHwUN21rbO8E7R//
 O3uhbsMfVhMD1/yIlEJKuUK/KtSYkXun34fg2i1pvm9sa95WOSgL3rASsSf2VdT63t15qz
 P51UdYfM2SqHUeufBN7hxS03lqhhdZ4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1633002810;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=vesisrUpMRY23dkeCD0GB06G4ySn5POLcBJJFI3dhgI=;
 b=sgWyWAAWj2Wj7uva+RGOnTApxN0vqJiCCiL6b/oRt2fLk2+d6Uhuso4rol/6B4qX66kM3b
 UJ3eYi1l0cZQCNCg==
Received: from alsa1.nue.suse.com (alsa1.suse.de [10.160.4.42])
 by relay2.suse.de (Postfix) with ESMTP id 6BC5AA3B89;
 Thu, 30 Sep 2021 11:53:30 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ALSA: hda/realtek: Enable 4-speaker output for Dell Precision
 5560 laptop
Date: Thu, 30 Sep 2021 13:53:16 +0200
Message-Id: <20210930115316.659-1-tiwai@suse.de>
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

From: John Liu <johnliu55tw@gmail.com>

The Dell Precision 5560 laptop appears to use the 4-speakers-on-ALC289
audio just like its sibling product XPS 9510, so it requires the same
quirk to enable woofer output. Tested on my Dell Precision 5560.

Signed-off-by: John Liu <johnliu55tw@gmail.com>
Cc: <stable@vger.kernel.org>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/hda/patch_realtek.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index 4407f7da57c4..f17bfc6007d3 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -8452,6 +8452,7 @@ static const struct snd_pci_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x1028, 0x0a30, "Dell", ALC236_FIXUP_DELL_AIO_HEADSET_MIC),
 	SND_PCI_QUIRK(0x1028, 0x0a58, "Dell", ALC255_FIXUP_DELL_HEADSET_MIC),
 	SND_PCI_QUIRK(0x1028, 0x0a61, "Dell XPS 15 9510", ALC289_FIXUP_DUAL_SPK),
+	SND_PCI_QUIRK(0x1028, 0x0a62, "Dell Precision 5560", ALC289_FIXUP_DUAL_SPK),
 	SND_PCI_QUIRK(0x1028, 0x164a, "Dell", ALC293_FIXUP_DELL1_MIC_NO_PRESENCE),
 	SND_PCI_QUIRK(0x1028, 0x164b, "Dell", ALC293_FIXUP_DELL1_MIC_NO_PRESENCE),
 	SND_PCI_QUIRK(0x103c, 0x1586, "HP", ALC269_FIXUP_HP_MUTE_LED_MIC2),
-- 
2.26.2

