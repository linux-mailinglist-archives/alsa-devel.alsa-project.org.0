Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EDA33BBC0C
	for <lists+alsa-devel@lfdr.de>; Mon,  5 Jul 2021 13:16:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9DD8B82E;
	Mon,  5 Jul 2021 13:15:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9DD8B82E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1625483801;
	bh=+eBKkwCvfXAiqA6Mwszd1JqitQfcXOYJqCDZuK87G8o=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=l8wrX2K+nO+PZZrrb8uA+hepLOrh5tFxawV+uVAHORvVZAzYwxyL0lmSyQhPtResW
	 BOgjnq2vrfYw4bnEzzglkS5aqGlhZ1z0vlUYynpJywPb+BpJQ4HQVfUcfn4dUIadQ8
	 iJb3yB0Qwkuk3//g9s5uLHq1bvdFhJOd18noU8zo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0AF4DF8025C;
	Mon,  5 Jul 2021 13:15:14 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 95E2BF80224; Mon,  5 Jul 2021 13:15:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DAA5BF80124
 for <alsa-devel@alsa-project.org>; Mon,  5 Jul 2021 13:15:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DAA5BF80124
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="tqqZyg04"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="vuqsWsGK"
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailout.nyi.internal (Postfix) with ESMTP id 397665C011C;
 Mon,  5 Jul 2021 07:15:01 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Mon, 05 Jul 2021 07:15:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding; s=fm2; bh=etcupvTCwknVwkG/akvEy5P4A6
 MjyXXxVTmD20uM/8g=; b=tqqZyg046h0fHCsWeZGXCCyq6KuVFaHUBDSIIb89hL
 airBWdkfCT7DdhR8dLTzdruPodFGoo2aA+DJfRB81F8gzh4xf15grOxMDbS9roqw
 6G5ck0erXKDIMZyQ8iO4x/aYUrwnTvv+Eu2b9z19o5NTtOX9k/MnSAcFUHd+NTLw
 nr2G2//9m+LgWdyoJsF6/uKWpSkBepf3MqXyRw/zTtjx2Vsp8u4GdPXbetqUJgHg
 5Adx/tND6y09Bahi5lUTTI2e9+IcB96Mq5c6QPI2RjFE+vAmcnndEdac5wvqc5Bm
 psujJ8Tf9yxdmqIcBJj26CyKWER3WEO1FZF8ki61Rhwg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=etcupvTCwknVwkG/a
 kvEy5P4A6MjyXXxVTmD20uM/8g=; b=vuqsWsGK0QNqop5g8YFZu0jN2LFQ5d0VR
 Mfz17ZKA56c+Lh4mj8HnWxr4JyYav2Dh633DC5LFvOcvwzhsoqiXjaRArgPDHQSi
 1sJ4KHxi1JvoJ+xZcP8GdoMK+hPaG0OzoOtWRrZg3rPVTGFRw666VtG43zkRG3Wq
 XawEsCUttNO+ifdFfpftqqLbycKdnz9EdeBhQVMIr5elnvqLIKKGdHOXEP/7VmrJ
 40xuUw0HoovKhV57kaGvElLjvvYG5TphOBP6cAcEXiWA9cBudi8mSE1VrinckbE9
 JgC7xrOhw3rnkP6umG/MPcPo3cHMD132BMXJDxLSDDyyjbtzJlucA==
X-ME-Sender: <xms:tOniYIDnglLnNkxSoaZ853kJQhJ43soRW0dSv60AcMWCuwSaXcTx4w>
 <xme:tOniYKitr29hpUIOB1qSgNEaU8nD2_EqJM59D6wEWO_zdYjwHAGEi87vTSFWRYTdI
 Tfo-7uHRcFl--nflrU>
X-ME-Received: <xmr:tOniYLk4EiKmtdoRUjx6mH_lWUagh6BaV-ZiFAxRVOeYsaI-oOfXxUPKq65MmNQZesgwF2RbNcC4d13s8l9FjjDAOqWXSJICIAJjD5uq_t_DZexG8TK6>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrfeejgedgfeejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgggfestdekredtre
 dttdenucfhrhhomhepvfgrkhgrshhhihcuufgrkhgrmhhothhouceoohdqthgrkhgrshhh
 ihesshgrkhgrmhhotggthhhirdhjpheqnecuggftrfgrthhtvghrnhepffduleeuheejvd
 ejheelfeduueeftddthefghfekveekhefhkefgfedtteefteetnecuffhomhgrihhnpehs
 ohhurhgtvghfohhrghgvrdhnvghtnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrg
 hmpehmrghilhhfrhhomhepohdqthgrkhgrshhhihesshgrkhgrmhhotggthhhirdhjph
X-ME-Proxy: <xmx:tOniYOzIJ97zqEOxTUha3wTihEqibgsY7A-8vgwTZFjrsMA_BaNraQ>
 <xmx:tOniYNRYSHOeZQ7qJHv6mdJAp9uthCDzFv4Z1NCKbFfpxK2SbHffsQ>
 <xmx:tOniYJbm8lFtVcyI5pKsrxvNNAIlZR-yxi1lcDpi8-MaidOIxz9NsQ>
 <xmx:teniYMKFXhIFLNNS564vv4sJGxCl3w0-gg7CvbOg18FAti_1WXLWSQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 5 Jul 2021 07:14:59 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: tiwai@suse.de
Subject: [PATCH] ALSA: bebob: correct duplicated entries with TerraTec OUI
Date: Mon,  5 Jul 2021 20:14:55 +0900
Message-Id: <20210705111455.63788-1-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, clemens@ladisch.de
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

ALSA bebob driver has duplicated entries for modalias of
'ieee1394:ven00000AACmo00000002sp0000A02Dver00010001' since entries for
two devices below have the same parameters:

 * Acoustic Reality eAR Master One, Eroica, Figaro, and Ciaccona
 * TerraTec Aureon 7.1 FireWire

I relied on FFADO revision 737 to add the former entry, on the other hand,
the latter is based on message posted by actual user with information of
sysfs node:

 * https://sourceforge.net/p/ffado/mailman/ffado-user/thread/5743F969.2080204%40marcobaldo.ch/

It appears that they have OUI of Terratec Electronic GmbH (0x000aac) and
the same model ID, thus suffice to say that they have something common
in their internals.

Although it's not going to make a big difference, this commit arranges
the entries.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 sound/firewire/bebob/bebob.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/sound/firewire/bebob/bebob.c b/sound/firewire/bebob/bebob.c
index 42980da45fbf..06a7ced218e2 100644
--- a/sound/firewire/bebob/bebob.c
+++ b/sound/firewire/bebob/bebob.c
@@ -403,8 +403,6 @@ static const struct ieee1394_device_id bebob_id_table[] = {
 	SND_BEBOB_DEV_ENTRY(VEN_APOGEE, 0x01eeee, &spec_normal),
 	/* ESI, Quatafire610 */
 	SND_BEBOB_DEV_ENTRY(VEN_ESI, 0x00010064, &spec_normal),
-	// AcousticReality, eARMasterOne. Terratec OEM.
-	SND_BEBOB_DEV_ENTRY(VEN_TERRATEC, 0x00000002, &spec_normal),
 	/* CME, MatrixKFW */
 	SND_BEBOB_DEV_ENTRY(VEN_CME, 0x00030000, &spec_normal),
 	// Phonic Helix Board 12 FireWire MkII.
@@ -434,7 +432,8 @@ static const struct ieee1394_device_id bebob_id_table[] = {
 	SND_BEBOB_DEV_ENTRY(VEN_TERRATEC, 0x00000007, &yamaha_terratec_spec),
 	/* TerraTec Electronic GmbH, EWS MIC2/MIC8 */
 	SND_BEBOB_DEV_ENTRY(VEN_TERRATEC, 0x00000005, &spec_normal),
-	/* Terratec Electronic GmbH, Aureon 7.1 Firewire */
+	// Terratec Electronic GmbH, Aureon 7.1 Firewire.
+	// AcousticReality, eAR Master One, Eroica, Figaro, and Ciaccona. Perhaps Terratec OEM.
 	SND_BEBOB_DEV_ENTRY(VEN_TERRATEC, 0x00000002, &spec_normal),
 	/* Yamaha, GO44 */
 	SND_BEBOB_DEV_ENTRY(VEN_YAMAHA, 0x0010000b, &yamaha_terratec_spec),
-- 
2.30.2

