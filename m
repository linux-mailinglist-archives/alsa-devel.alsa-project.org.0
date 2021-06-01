Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 535EB396EC2
	for <lists+alsa-devel@lfdr.de>; Tue,  1 Jun 2021 10:20:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CFDE71687;
	Tue,  1 Jun 2021 10:19:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CFDE71687
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1622535630;
	bh=9yvMBG5oFKT8YeuOVfokISRRbHro4pltS34PkEYzmMc=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=tKPu773weEN66XqnubzwvxJ/LITLEmEAjYO6PcW3y2ExfJdqZq9TcNlIZ5Ki1bovV
	 Eht3X9nmWEI6XkmFIlmociIYykTCcO+fvrxqwpWOYozu/8tZ+n2gkWrt34wQL9sGGN
	 lfTSyyjZJaRwBMQ/vzvSSe9nTs465XxbJmd4EcFI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 671E2F804CC;
	Tue,  1 Jun 2021 10:18:16 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E6BA4F804BC; Tue,  1 Jun 2021 10:18:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C5AE5F80254
 for <alsa-devel@alsa-project.org>; Tue,  1 Jun 2021 10:18:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C5AE5F80254
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="fToYdgO/"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="sESNmrmY"
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id 26201FB3;
 Tue,  1 Jun 2021 04:18:04 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Tue, 01 Jun 2021 04:18:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=H5MiTz3LfDSdm
 QBvn+iXd+60xSUYfu5ActVJDrDBqG4=; b=fToYdgO/7qhsjW4B8YYFAVAjjJ1WQ
 Vc7fkScoMPF8rvTqPIVHlsU50/MKS+Isy8KjH0ihXcx7N34bWTkSdDAeoeWBJ6QM
 kpvzMPrAOJCYX6LZwiw/aD7qtOcA9nExlvuE1ZI5xW3U+fhidnllFGeLGLKjTbdn
 Ic+HAHhxiScM448sGSzbBUckeZ05YZL57qNWuMsZXqseQBvWUvtfh8b1R1WEEBH0
 8lNJl+AeEqn78Jp9TLajTWLLCzS8WSx8EkByStUFIOFv5hSec5Juz0RgxSkgo1ja
 j94x7q5Ub2KtCYxgxNCiCP5IC3YZ2sgpMhq4SIh9JMJdCWEM30P09lbNw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=H5MiTz3LfDSdmQBvn+iXd+60xSUYfu5ActVJDrDBqG4=; b=sESNmrmY
 60SIT2kcxtapDFbeDpeOMTaueWtyuepomajfVHon1E90teo3PCn4ocEGd0gn2s6h
 xvaQza1BHL665fSPVZcjhUMR2dcihxdG9QZR0vWypSKoMg6oIfT6UamMVExMtMUM
 Mqi/KDruS+XJUv+PIOuikFlzZGBZJi9wwOXRwyvJzonEYo2NK3DtSoV+MSpDoeTq
 +FYsldDgAie9np8/c0wfuOwMt+QS/lK3GzJClFS2xzXZ0oyJ6Ghr3fsgsYP7nAID
 aQ4+oxmPARacA86lByMaRXw6WZpdfvzsp/pmptUt/QZIFCUFSGA6ngDz88sUaLWc
 pbFxtXwoaeGhuA==
X-ME-Sender: <xms:O-21YLrVcfde7G6WUGrLtdodX4_k1m35DbW4MUSJfOji09tZDCHm8g>
 <xme:O-21YFo46zxIKJ3zEKDEJjq7SbN61ckko9-imZ5OoIaHRxMpMAkyBiIZWMohVlP9y
 dbAse-qJ0tzRuZaqKI>
X-ME-Received: <xmr:O-21YIMyIDvXeWVr_eh-ZQeefvvNPk_MWFoQ_f11-yMHNq2Pm2TL8RzN8hsw7D6G8FkOzV8KiizQFVX-XhlN-pug2X_WkhosehZiVlYomeYYrOAlfuE_>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdelhedgtdduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
 dtredttdenucfhrhhomhepvfgrkhgrshhhihcuufgrkhgrmhhothhouceoohdqthgrkhgr
 shhhihesshgrkhgrmhhotggthhhirdhjpheqnecuggftrfgrthhtvghrnhepveefffefke
 etgfevgeefleehfffhueejtdejveethfekveektdejjedvtdejhfejnecuvehluhhsthgv
 rhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepohdqthgrkhgrshhhihessh
 grkhgrmhhotggthhhirdhjph
X-ME-Proxy: <xmx:O-21YO6fvokxB_V1L5qXAMA3n6ktUqfWGeGU0bIN69MwyshpfbD3lA>
 <xmx:O-21YK6whfmqRLvenxQU3gocWiHdbZml-aoeKK0pw13EhEYeTN_bkA>
 <xmx:O-21YGgq959Oj-Es3aJlLDY3MEAvkQTDhCP4NkGziK9Ad2WKwn6n3A>
 <xmx:O-21YAR7pDGXNhBwkxyxPTZ-TfYkmY3lsTZgOlzCi3rozUjlRekjTQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 1 Jun 2021 04:18:02 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: tiwai@suse.de
Subject: [PATCH 2/3] ALSA: dice: perform sequence replay for media clock
 recovery
Date: Tue,  1 Jun 2021 17:17:52 +0900
Message-Id: <20210601081753.9191-3-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210601081753.9191-1-o-takashi@sakamocchi.jp>
References: <20210601081753.9191-1-o-takashi@sakamocchi.jp>
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

This commit takes ALSA dice driver to perform sequence replay for media
clock recovery.

Unlike the other types of device, DICE-based devices interpret the value
of syt field of CIP header in rx packets as presentation time for audio
playback, thus it's required for driver to compute value for outgoing
packet adequate to the device. It's done by media clock recovery by
handling tx packets.

The device starts packet transmission immediately at operation to
GLOBAL_ENABLE thus on-the-fly mode is not required.

DICE ASICs supports several pairs of isochronous packet streams.
Actually, maximum two pairs of streams are supported by devices.
We have three cases regarding to the number of streams:

1. a pair of streams
2. two tx packet streams and one rx packet streams
3. one tx packet streams and two rx packet streams
4. two pair of streams

The decision of playback timing is slightly different in the four cases.

In the case 1, sequence replay in the pair results in suitable playback
timing.

In the case 2, sequence replay from the first tx packet stream to rx
packet stream results in suitable playback timing.

In the case 3, sequence replay from tx packet stream to all of rx packet
stream results in suitable playback timing. Furthermore, the cycle to
start receiving packets should be the same between all rx packet streams.

In the case 4, sequence replay in each pair results in suitable playback
timing. Furthermore, the cycle to start receiving packets should be the
same between all rx packet streams.

The sequence replay is tested with below models:

* For case 1:
  * TC Electronic Konnekt 24d (DiceII)
  * TC Electronic Konnekt 8 (DiceII)
  * TC Electronic Konnekt Live (DiceII)
  * TC Electronic Impact Twin (DiceII)
  * TC Electronic Digital Konnekt X32 (DiceII)
  * TC Electronic Desktop Konnekt 6 (TCD2220)
  * Solid State Logic Duende Classic (DiceII)
  * Solid State Logic Duende Mini (DiceII)
  * PreSonus FireStudio Project (TCD2210)
  * PreSonus FireStudio Mobile (TCD2210)
  * Lexicon I-ONIX FW810s (TCD2220)
  * Avid Mbox 3 Pro (TCD2220)

* For case 2 (but case 1 depends on sampling transfer frequency):
  * Alesis iO 26 (DiceII)
  * Alesis iO 14 (DiceII)
  * Alesis MultiMix 12 FireWire (DiceII)
  * Focusrite Saffire Pro 26 (TCD2220)

* For case 3 (but case 1 depends on sampling transfer frequency):
  * M-Audio Profire 610 (TCD2220)
  * Loud Technology Mackie Onyx Blackbird (TCD2210)

* For case 4:
  * TC Electronic Studio Konnekt 48 (DiceII + TCD2220)
  * PreSonus FireStudio (DiceII)
  * M-Audio Profire 2626 (TCD2220)
  * Focusrite Liquid Saffire 56 (TCD2220)
  * Focusrite Saffire Pro 40 (TCD2220)

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 sound/firewire/dice/dice-stream.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/sound/firewire/dice/dice-stream.c b/sound/firewire/dice/dice-stream.c
index d7220160c778..f99e00083141 100644
--- a/sound/firewire/dice/dice-stream.c
+++ b/sound/firewire/dice/dice-stream.c
@@ -444,7 +444,11 @@ int snd_dice_stream_start_duplex(struct snd_dice *dice)
 			goto error;
 		}
 
-		err = amdtp_domain_start(&dice->domain, 0, false, false);
+		// MEMO: The device immediately starts packet transmission when enabled. Some
+		// devices are strictly to generate any discontinuity in the sequence of tx packet
+		// when they receives invalid sequence of presentation time in CIP header. The
+		// sequence replay for media clock recovery can suppress the behaviour.
+		err = amdtp_domain_start(&dice->domain, 0, true, false);
 		if (err < 0)
 			goto error;
 
-- 
2.27.0

