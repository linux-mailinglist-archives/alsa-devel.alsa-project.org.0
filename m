Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ECE06A2DB
	for <lists+alsa-devel@lfdr.de>; Tue, 16 Jul 2019 09:23:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E4423168D;
	Tue, 16 Jul 2019 09:22:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E4423168D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1563261811;
	bh=yv3N2SZSyz8yGdreDAbtZClh9RIIOv3m0B++6hdO9Yk=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=AcElVuiTGga1/p7Zu/yHFjDkSnybsbaTO8xVR1Yr/jvWR/+orKRDPVGHne30jg4dd
	 g79D/jVzF6BrbSJ5u8xpnJJobpJ+UFAHlMyt3xtJC17q8giL/3NCiVV8g+oTn+Z5sA
	 s2NRwYwuc8ggHiCl3Q8ZB9jkr6ezwvEzxo5Otnos=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 04D0AF80376;
	Tue, 16 Jul 2019 09:21:47 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5C827F80376; Tue, 16 Jul 2019 09:21:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112]) (using TLSv1 with cipher AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BE9F1F802BC
 for <alsa-devel@alsa-project.org>; Tue, 16 Jul 2019 09:21:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BE9F1F802BC
Received: from 61-220-137-37.hinet-ip.hinet.net ([61.220.137.37]
 helo=hwang4-Vostro-5390.taipei.internal)
 by youngberry.canonical.com with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.76) (envelope-from <hui.wang@canonical.com>)
 id 1hnHmN-0004Rx-Jx; Tue, 16 Jul 2019 07:21:40 +0000
From: Hui Wang <hui.wang@canonical.com>
To: alsa-devel@alsa-project.org,
	tiwai@suse.de
Date: Tue, 16 Jul 2019 15:21:34 +0800
Message-Id: <20190716072134.10009-1-hui.wang@canonical.com>
X-Mailer: git-send-email 2.17.1
Cc: stable@vger.kernel.org
Subject: [alsa-devel] [PATCH] ALSA: hda/realtek: apply ALC891 headset fixup
	to one Dell machine
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

Without this patch, the headset-mic and headphone-mic don't work.

Cc: <stable@vger.kernel.org>
Signed-off-by: Hui Wang <hui.wang@canonical.com>
---
 sound/pci/hda/patch_realtek.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index 1c84c12b39b3..de224cbea7a0 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -8803,6 +8803,11 @@ static const struct snd_hda_pin_quirk alc662_pin_fixup_tbl[] = {
 		{0x18, 0x01a19030},
 		{0x1a, 0x01813040},
 		{0x21, 0x01014020}),
+	SND_HDA_PIN_QUIRK(0x10ec0867, 0x1028, "Dell", ALC891_FIXUP_DELL_MIC_NO_PRESENCE,
+		{0x16, 0x01813030},
+		{0x17, 0x02211010},
+		{0x18, 0x01a19040},
+		{0x21, 0x01014020}),
 	SND_HDA_PIN_QUIRK(0x10ec0662, 0x1028, "Dell", ALC662_FIXUP_DELL_MIC_NO_PRESENCE,
 		{0x14, 0x01014010},
 		{0x18, 0x01a19020},
-- 
2.17.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
