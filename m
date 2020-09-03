Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D80125CB85
	for <lists+alsa-devel@lfdr.de>; Thu,  3 Sep 2020 22:54:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9D5721AE1;
	Thu,  3 Sep 2020 22:53:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9D5721AE1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1599166458;
	bh=P6N6+5KICFwN7b8Wl5qbvJBR+tVQ0/ySUWzHHQVAd3w=;
	h=In-Reply-To:References:Date:From:To:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=SqpU8yzoBX/aR8ZlZCS8qQrYO7WnT9SKxoBJLULZHjYKZjQqWPOkN47tww5mofPWK
	 ZlswQCHgwJqkuyameHRVIV+ZQ+kb5sAZliFAN6MCQOuUixyjEoSvF86MGgZ2OGj4iX
	 87QJwsg1oOCnSk0MWNJzefeM+uteu1q9Ph9BYWKg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8027FF8020D;
	Thu,  3 Sep 2020 22:53:26 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4AD8CF8025F; Thu,  3 Sep 2020 22:53:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1CE52F8020D
 for <alsa-devel@alsa-project.org>; Thu,  3 Sep 2020 22:53:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1CE52F8020D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="TwQIoLoM"
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 1ABCFE4E;
 Thu,  3 Sep 2020 16:53:16 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute4.internal (MEProxy); Thu, 03 Sep 2020 16:53:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=YsSulu
 E+04xGireAGGB+bGcHbXuRGMPqLYQaOPu/qp0=; b=TwQIoLoMlwqUY1Uu+lL17T
 TWVFxgaRMoIOEZuoCQff6EgiUwOLnDp6DiOD9CBsbNLtj7sy2hr8LnDYgCbTeKtn
 V/3juEygLbnNT0G6nkVIU2jUM55rNkQXH3TS9ah0uX0UlZCfeMA97Zm4jwoPAeWl
 SuFGhrg4WSi9r5shoWGXQ5xJU2Kk7/yA2ROPQeKyvBW8cxlY/51r4pgeT/GeMAWv
 ZurYaFgilKs/RXcB7UjO3j0PuApwXYtzTu75ry/EW0ZF3UBuUz3Fy3R/dMbKIBtn
 9enPQ+3RZWfXr9Ob1Vyv/JLqG7C0Q+YykTSjEedtLOaaXN8xdsQ2C5iSH/J74Zeg
 ==
X-ME-Sender: <xms:u1dRX-BN0O8ssXxaAoNJGr1FUOsNUHXuQcOR_N56oSECOqBqlQf0WQ>
 <xme:u1dRX4iEHpQafPVTzZW5TbQUJKPlpTXKAb8aAir2SRy3k7dFWP3CqVHk6TyyfrPpx
 7a_jIimLh4Ygz6Q5w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedrudeguddgudehiecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecunecujfgurhepofgfggfkjghffffhvffutgesth
 dtredtreerjeenucfhrhhomhepfdflvghrvghmhicuufholhhlvghrfdcuoehjvghrvghm
 hiesshihshhtvghmjeeirdgtohhmqeenucggtffrrghtthgvrhhnpedthfeuhfehteeihf
 efgeejjeduhfehjedvveejteegffekgfeggeefuefhkeeitdenucevlhhushhtvghrufhi
 iigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehjvghrvghmhiesshihshhtvghmje
 eirdgtohhm
X-ME-Proxy: <xmx:u1dRXxn20JBdH1Yr5sJmLWcf8dHZSWnutOV1yNxlDJulbBwmOJMhFA>
 <xmx:u1dRX8yqAjiz1fBetSjp_jWwTFIxywhucvFY_V-dTPQtxo59uJFFRQ>
 <xmx:u1dRXzTF6dbEe9m6JqKSVbKBnFlFC2TTiY3KBCVVi7MYoERDUpP26w>
 <xmx:u1dRX2PAqxuildT4tVJYCgSuSmZO-jlFrf0uepUKzKn3p7oooWlceA>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 4ED3EE00EC; Thu,  3 Sep 2020 16:53:15 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.3.0-259-g88fbbfa-fm-20200903.003-g88fbbfa3
Mime-Version: 1.0
Message-Id: <624b02a6-d3a3-4717-aaf9-dada14df421a@www.fastmail.com>
In-Reply-To: <86a53327-0c15-4ea7-a158-2c6eb61aaa85@www.fastmail.com>
References: <86a53327-0c15-4ea7-a158-2c6eb61aaa85@www.fastmail.com>
Date: Thu, 03 Sep 2020 14:52:55 -0600
From: "Jeremy Soller" <jeremy@system76.com>
To: alsa-devel@alsa-project.org
Subject: =?UTF-8?Q?[PATCH_2/3]_ALSA:_hda/realtek:_Add_quirks_for_System76_Gazelle?=
 =?UTF-8?Q?_(gaze15)?=
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

The System76 Gazelle (gaze15) requires the
ALC293_FIXUP_SYSTEM76_MIC_NO_PRESENCE quirk for the headset microphone
to function. There are four variants, depending on the discrete GPU, and
all variants are added here.

Signed-off-by: Jeremy Soller <jeremy@system76.com>
---
diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index 58d5ebb6e196..de880eb92d95 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -7703,6 +7703,10 @@ static const struct snd_pci_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x1462, 0xb171, "Cubi N 8GL (MS-B171)", ALC283_FIXUP_HEADSET_MIC),
 	SND_PCI_QUIRK(0x1558, 0x1325, "System76 Darter Pro (darp5)", ALC293_FIXUP_SYSTEM76_MIC_NO_PRESENCE),
 	SND_PCI_QUIRK(0x1558, 0x1401, "System76 Lemur Pro (lemp9)", ALC269_FIXUP_HEADSET_MODE_NO_HP_MIC),
+	SND_PCI_QUIRK(0x1558, 0x8520, "System76 Gazelle (gaze15)", ALC293_FIXUP_SYSTEM76_MIC_NO_PRESENCE),
+	SND_PCI_QUIRK(0x1558, 0x8521, "System76 Gazelle (gaze15)", ALC293_FIXUP_SYSTEM76_MIC_NO_PRESENCE),
+	SND_PCI_QUIRK(0x1558, 0x8535, "System76 Gazelle (gaze15)", ALC293_FIXUP_SYSTEM76_MIC_NO_PRESENCE),
+	SND_PCI_QUIRK(0x1558, 0x8536, "System76 Gazelle (gaze15)", ALC293_FIXUP_SYSTEM76_MIC_NO_PRESENCE),
 	SND_PCI_QUIRK(0x1558, 0x8550, "System76 Gazelle (gaze14)", ALC293_FIXUP_SYSTEM76_MIC_NO_PRESENCE),
 	SND_PCI_QUIRK(0x1558, 0x8551, "System76 Gazelle (gaze14)", ALC293_FIXUP_SYSTEM76_MIC_NO_PRESENCE),
 	SND_PCI_QUIRK(0x1558, 0x8560, "System76 Gazelle (gaze14)", ALC269_FIXUP_HEADSET_MIC),
