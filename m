Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DC488465EC5
	for <lists+alsa-devel@lfdr.de>; Thu,  2 Dec 2021 08:36:04 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5581F2459;
	Thu,  2 Dec 2021 08:35:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5581F2459
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1638430564;
	bh=gKdSC1IMxkGrpuEBbzAIqUn1qALu8KCYfv7jQxTPq5A=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=egrdH/2S82sdi40LD2t+PqQ8jJZQ3BnT9JF8egwT1SiD9Kt/eQK0Vkr63sNIqhtVk
	 jDg76MZYl8uk+9PxWPEYvt9wAj5EzPawPV8kbKmYI1noO2rOpcEXNljA6k0t0UMQXX
	 DR1NN/xwqYAnRdncLFqL0Rov8UEpxQS544eRj9Lw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C635CF802E0;
	Thu,  2 Dec 2021 08:34:47 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BCE42F802A0; Thu,  2 Dec 2021 08:34:36 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from smtp-relay-canonical-0.canonical.com
 (smtp-relay-canonical-0.canonical.com [185.125.188.120])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 62735F800CE
 for <alsa-devel@alsa-project.org>; Thu,  2 Dec 2021 08:34:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 62735F800CE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com
 header.b="Y9JzoMKt"
Received: from localhost.localdomain (unknown [10.101.196.174])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-canonical-0.canonical.com (Postfix) with ESMTPSA id 4BE0140078; 
 Thu,  2 Dec 2021 07:34:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1638430466;
 bh=daGfkCmFd2T/mh9PjPT6uP/gwdzM5b89BaR4Dee9AME=;
 h=From:To:Cc:Subject:Date:Message-Id:MIME-Version;
 b=Y9JzoMKtUSVYu7DWExsE8O7aCVt5r9gqMeOMA14v4kdvgJ1dHQavtfbv2KNN/d4XI
 hZ/CCtgN5EVwSapE6+KdCO7ekaEQgBZEQl6q7v9xrMSiKoPneeX9ndOaDxPdipbZJl
 R/NvmazaFiTCNPxbpjCpglLBD8KQpSiX912SL1o9FCmSMaHesXmBiR5RoOPXZ3ldWg
 3UsjIzIw84hwjp/lFSphRMD8d85/xmHJCiqrL42lIaOEfHDH5t3xCyaOciNeTTkMDD
 KCcxS0T18DZpkIBzffcKGHpqboQTAjj7H1dlvbxwEfO4LSSFtTUmv3zIE+ucXVbr9Z
 WFOaABUwDfMgg==
From: Kai-Heng Feng <kai.heng.feng@canonical.com>
To: tiwai@suse.com
Subject: [PATCH] ALSA: hda/hdmi: Consider ELD is invalid when no SAD is present
Date: Thu,  2 Dec 2021 15:33:35 +0800
Message-Id: <20211202073338.1384768-1-kai.heng.feng@canonical.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 alsa-devel@alsa-project.org, Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 linux-kernel@vger.kernel.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Hui Wang <hui.wang@canonical.com>, Kai-Heng Feng <kai.heng.feng@canonical.com>
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

There's a system that reports a bogus HDMI audio interface:
$ cat eld#2.0
monitor_present         1
eld_valid               1
monitor_name
connection_type         DisplayPort
eld_version             [0x2] CEA-861D or below
edid_version            [0x3] CEA-861-B, C or D
manufacture_id          0xe430
product_id              0x690
port_id                 0x0
support_hdcp            0
support_ai              0
audio_sync_delay        0
speakers                [0xffff] FL/FR LFE FC RL/RR RC FLC/FRC RLC/RRC FLW/FRW FLH/FRH TC FCH
sad_count               0

Since playing audio is not possible without SAD, also consider ELD is
invalid for this case.

Signed-off-by: Kai-Heng Feng <kai.heng.feng@canonical.com>
---
 sound/pci/hda/patch_hdmi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/pci/hda/patch_hdmi.c b/sound/pci/hda/patch_hdmi.c
index 415701bd10ac8..e7c2f3167f311 100644
--- a/sound/pci/hda/patch_hdmi.c
+++ b/sound/pci/hda/patch_hdmi.c
@@ -1535,7 +1535,7 @@ static void update_eld(struct hda_codec *codec,
 		}
 	}
 
-	if (!eld->eld_valid || eld->eld_size <= 0) {
+	if (!eld->eld_valid || eld->eld_size <= 0 || eld->info.sad_count <= 0) {
 		eld->eld_valid = false;
 		eld->eld_size = 0;
 	}
-- 
2.32.0

