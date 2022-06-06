Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3154B53DF1C
	for <lists+alsa-devel@lfdr.de>; Mon,  6 Jun 2022 02:32:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B89431A23;
	Mon,  6 Jun 2022 02:31:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B89431A23
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654475546;
	bh=/OoIvTGSZgbYrQpeg5t5CN+NkDgvhu+4V0X6+SRdVeY=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=W46vWIdjaxoby9cmSg589mhua8IQPXEDPASUv5O94VTMwpLcfkVe3mlAwNqlWtMRN
	 QgrAQyXDykbxO4sebnp7bMJfB1Xvy/pW/9RObNeOcLKWlu+MxRvekeJsfGlh5bld+k
	 6+gQ/kUUWRIuw7yn36xlhPdeU0Gom+9S0JzYiq4E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 337CAF8016C;
	Mon,  6 Jun 2022 02:31:28 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7DB79F80162; Mon,  6 Jun 2022 02:31:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from neo-zeon.de (neo-zeon.de [70.229.12.130])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4A7A2F80116
 for <alsa-devel@alsa-project.org>; Mon,  6 Jun 2022 02:31:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4A7A2F80116
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=neo-zeon.de header.i=@neo-zeon.de
 header.b="cP0g8p01"
Received: from neo-zeon.de (localhost [127.0.0.1])
 by neo-zeon.de (OpenSMTPD) with ESMTP id 74785451;
 Sun, 5 Jun 2022 17:24:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=neo-zeon.de; h=from:to:cc
 :subject:date:message-id:mime-version:content-transfer-encoding;
 s=1; bh=TjlQaViABde8WtBS7LK+iV0O8wY=; b=cP0g8p01cOgZgTNUl/Kf38B
 F0xclhtGy2JhsHyVZLnBzFAauN2YXljSLY0xEQltA9FpzqYT9B4z2pzE9D3km6L2
 tbku01vcxf4pBLDwW6mg2oyXXYCi83EuKGbogBpa2IpYXvWLeOAdaOSgDpW6hVh0
 utQxut+aaq7aZaqwX6i8=
Received: by neo-zeon.de (OpenSMTPD) with ESMTPSA id 38d4d4fd
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO); 
 Sun, 5 Jun 2022 17:24:35 -0700 (PDT)
From: Cameron Berkenpas <cam@neo-zeon.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ALSA: hda/realtek: Fix for quirk to enable speaker output on
 the Lenovo Yoga DuetITL 2021
Date: Sun,  5 Jun 2022 17:23:30 -0700
Message-Id: <20220606002329.215330-1-cam@neo-zeon.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, Cameron Berkenpas <cam@neo-zeon.de>,
 Songine <donglingluoying@gmail.com>
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

Enables the ALC287_FIXUP_YOGA7_14ITL_SPEAKERS quirk for the Lenovo Yoga DuetITL 2021 laptop to fix speaker output.

BugLink: https://bugzilla.kernel.org/show_bug.cgi?id=208555
Signed-off-by: Cameron Berkenpas <cam@neo-zeon.de>
Co-authored-by: Songine <donglingluoying@gmail.com>
---
 sound/pci/hda/patch_realtek.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index f3ad454b3fbf..2af5725dfca0 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -9262,6 +9262,7 @@ static const struct snd_pci_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x17aa, 0x3818, "Lenovo C940", ALC298_FIXUP_LENOVO_SPK_VOLUME),
 	SND_PCI_QUIRK(0x17aa, 0x3819, "Lenovo 13s Gen2 ITL", ALC287_FIXUP_13S_GEN2_SPEAKERS),
 	SND_PCI_QUIRK(0x17aa, 0x3820, "Yoga Duet 7 13ITL6", ALC287_FIXUP_YOGA7_14ITL_SPEAKERS),
+	SND_PCI_QUIRK(0x17aa, 0x3802, "Lenovo Yoga DuetITL 2021", ALC287_FIXUP_YOGA7_14ITL_SPEAKERS),
 	SND_PCI_QUIRK(0x17aa, 0x3824, "Legion Y9000X 2020", ALC285_FIXUP_LEGION_Y9000X_SPEAKERS),
 	SND_PCI_QUIRK(0x17aa, 0x3827, "Ideapad S740", ALC285_FIXUP_IDEAPAD_S740_COEF),
 	SND_PCI_QUIRK(0x17aa, 0x3834, "Lenovo IdeaPad Slim 9i 14ITL5", ALC287_FIXUP_YOGA7_14ITL_SPEAKERS),
-- 
2.34.1

