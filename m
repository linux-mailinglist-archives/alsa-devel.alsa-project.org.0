Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A2CA125CB83
	for <lists+alsa-devel@lfdr.de>; Thu,  3 Sep 2020 22:53:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3502F1AD7;
	Thu,  3 Sep 2020 22:52:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3502F1AD7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1599166414;
	bh=6NrrDRrG+QR1AyS27+BAoLfEakZO00c5QggxNCChDGI=;
	h=Date:From:To:Subject:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=COALbZAWL3avpbwukVoVtjCi6rK0DCJm0whryCgaLx51E3CdAA1G19NEUaT9vDAOs
	 lmFhD8xQ8utgxwqwUz4Y58/0wZEQyY9VUHFTcfyYA9RzrgtMQb9tlg3KyDonx3+VVh
	 tzL2WgVx24wvY9OjUfZ1KyyI1N257D1fpmrWiLI0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 69161F801DA;
	Thu,  3 Sep 2020 22:51:53 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4800DF80217; Thu,  3 Sep 2020 22:51:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 46226F800F0
 for <alsa-devel@alsa-project.org>; Thu,  3 Sep 2020 22:51:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 46226F800F0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="WHBYR61m"
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id E7C8BC76;
 Thu,  3 Sep 2020 16:51:38 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute4.internal (MEProxy); Thu, 03 Sep 2020 16:51:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:message-id
 :mime-version:subject:to:x-me-proxy:x-me-proxy:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm3; bh=ExkxkkSf/Cy704ti6IwTSYA7PbzUL
 csjAm5f46WdVlA=; b=WHBYR61mAOJr0v2lKbEUh2YlVBTrSNznOmGZkmUVbvurU
 UStlu39ZfAuJJHw8YWvLmFWYtld2QZn4Y8aXu3lS5RqkQkotNviRy1wmGyS8F4SJ
 WjLLVHG6Fd1vxyexbZPExnQt7u6BXzKVp94/5Z6EYukEWw2xoLaHo3lbNQDKPWlj
 b7SnloaAWQCZfy7hONVMEShaulNfiyhuWemYr3+ZGuhlmwCA5Z6j5sVg3IVLHUrX
 Y5IQTQLUcnvWxfSr4GS5Hqt592w97EyFotijJoqGIh2u8FVLTqdVpxQofFuBEHJ9
 KQoTKopcsO1caCePnUULj7yD9E0sFl0G1fcWrXmTw==
X-ME-Sender: <xms:WldRX5ONrRss36Qodx2wZxXH79bejQkUhNqR-ddqUgJCkqijzEH6hg>
 <xme:WldRX791kfuFTkypsfkxrxFtdYRqprChNcodl1uQCnum9VaZitQ4KmZ85gzMdM84Y
 2Ow97g61ZDk0hooPg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedrudeguddgudehiecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecunecujfgurhepofgfggfkfffhvffutgesthdtre
 dtreerjeenucfhrhhomhepfdflvghrvghmhicuufholhhlvghrfdcuoehjvghrvghmhies
 shihshhtvghmjeeirdgtohhmqeenucggtffrrghtthgvrhhnpedvffevleejieeludffge
 fghfekhfeivdfgtdduveeugedutdekiedvtdeuledtvdenucevlhhushhtvghrufhiiigv
 pedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehjvghrvghmhiesshihshhtvghmjeeird
 gtohhm
X-ME-Proxy: <xmx:WldRX4QULfIQwB-7kF4pkIVrQy0adTzaMm7uz1VUpqQftNUQmZ8rMw>
 <xmx:WldRX1vAM0ReWJrwmuzLInZR-Ty7BLSYtDEDddNU9OkO_PauN3_GLA>
 <xmx:WldRXxdtAgNm-_rYg2__6i6BLZwWpL2UXzmbXgkDThspYNK0cI56Hg>
 <xmx:WldRX3oBQdsP3qNN1lvYnz879mFR0GqpkkmlbS_R_vEU2CgaKkuP0Q>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id D9C7AE00EC; Thu,  3 Sep 2020 16:51:37 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.3.0-259-g88fbbfa-fm-20200903.003-g88fbbfa3
Mime-Version: 1.0
Message-Id: <86a53327-0c15-4ea7-a158-2c6eb61aaa85@www.fastmail.com>
Date: Thu, 03 Sep 2020 14:51:17 -0600
From: "Jeremy Soller" <jeremy@system76.com>
To: alsa-devel@alsa-project.org
Subject: =?UTF-8?Q?[PATCH_1/3]_ALSA:_hda/realtek:_Add_quirk_for_System76_Lemur_Pr?=
 =?UTF-8?Q?o_(lemp9)?=
Content-Type: text/plain
Cc: =?UTF-8?Q?Bj=C3=B6rn_Lindfors?= <productdev@system76.com>
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

The System76 Lemur Pro (lemp9) requires the
ALC269_FIXUP_HEADSET_MODE_NO_HP_MIC quirk for the headset microphone to
function.

Signed-off-by: Jeremy Soller <jeremy@system76.com>
Cc: alsa-devel@alsa-project.org
---
diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index a1fa983d2a94..58d5ebb6e196 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -7702,6 +7702,7 @@ static const struct snd_pci_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x1462, 0xb120, "MSI Cubi MS-B120", ALC283_FIXUP_HEADSET_MIC),
 	SND_PCI_QUIRK(0x1462, 0xb171, "Cubi N 8GL (MS-B171)", ALC283_FIXUP_HEADSET_MIC),
 	SND_PCI_QUIRK(0x1558, 0x1325, "System76 Darter Pro (darp5)", ALC293_FIXUP_SYSTEM76_MIC_NO_PRESENCE),
+	SND_PCI_QUIRK(0x1558, 0x1401, "System76 Lemur Pro (lemp9)", ALC269_FIXUP_HEADSET_MODE_NO_HP_MIC),
 	SND_PCI_QUIRK(0x1558, 0x8550, "System76 Gazelle (gaze14)", ALC293_FIXUP_SYSTEM76_MIC_NO_PRESENCE),
 	SND_PCI_QUIRK(0x1558, 0x8551, "System76 Gazelle (gaze14)", ALC293_FIXUP_SYSTEM76_MIC_NO_PRESENCE),
 	SND_PCI_QUIRK(0x1558, 0x8560, "System76 Gazelle (gaze14)", ALC269_FIXUP_HEADSET_MIC),
