Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 957AC24EC08
	for <lists+alsa-devel@lfdr.de>; Sun, 23 Aug 2020 09:57:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 06BC3167E;
	Sun, 23 Aug 2020 09:56:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 06BC3167E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1598169457;
	bh=DYp5v9nrohWmjfwYzQCAEU7t8LNfeBwRO8Wh+RHizLc=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=RxCKbmJYafzKnyNrQ5/mUbKIgq6mknzzP/+l53o9+rHycaqb/B2CRuY+osTwLnWPL
	 4QZk0Y+uqydkpFaeHeJhLOraLoDdGhvaPQKSu/BsAeTq7EZNYWPwKcrEVZx9C0/XjP
	 MtYzHLRPOxHTK9n0W1aX6+j0sdzv9F9KhzOiJdpA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 315DFF800C0;
	Sun, 23 Aug 2020 09:55:56 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5DF4BF80260; Sun, 23 Aug 2020 09:55:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F154CF800C0
 for <alsa-devel@alsa-project.org>; Sun, 23 Aug 2020 09:55:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F154CF800C0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="SZi+TmXq"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="Hutrz1rk"
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailout.west.internal (Postfix) with ESMTP id 31C189D2;
 Sun, 23 Aug 2020 03:55:42 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Sun, 23 Aug 2020 03:55:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding; s=fm2; bh=IrCmyO1hiKxuQwf57QOo9Vtkr+
 OdE2H1gJdT+fs0D3Q=; b=SZi+TmXqBxOFRSCCXqRQBaQwv8aBg6Il4ZIofNBb+Z
 CErQDF5DtvFL+veg8Y/ZlL0flhY+w3uk4EsYD/iL/PUfBqR4zw93UCy8g43MfInC
 2vSP1log1c7UA86N+bz7b2FLRnoy5yP12KkwXbLG+54Vcd/dkaBDqYwbPo/8NDpg
 uvjCyfGr7S7Ibr7wbQbixG+sBBmkL/XoleuGE3kKLWitXkIJIuTbOeiyxSmzymo0
 jOKb2NVVEWFXcVrdAjk04U+dDjxPSNzEhFnbZVqEjiSbbEIHXLxKODFsL7+IfXJG
 eZ8E0U0NJr6L8vsfFSYcjvJTMsOOch7I35g68u2N1Dog==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=IrCmyO1hiKxuQwf57
 QOo9Vtkr+OdE2H1gJdT+fs0D3Q=; b=Hutrz1rkwwyr92LT4otnbPa+58tjvFoFl
 IN2JEfinigdF72tWNcmBajZlpSv2uouDwL94TOKlI4NMHeRbcGXteeSMJ96Hc7Ul
 0VlcJ+3zgheWoyjMboIRQOdYVosqsuaS9GKJx0HfH0W7/OD4acYjzuzsqDLkqhQU
 3eFWZDnNYzmiFMrDJUodM2dOAhXxHQDxEiv0RxWQFIvVRYaZ7KZ3FYDWH199o8Le
 13Xr3Zt7kN9mATvkWLuzkUTMS04aIP2mTius0l6FKkC2QlEkYwxAktcYoiDjyQS5
 UhEOtr8RhGTrpOXsAvkA96+7n0ATgR8TWSpr1GiMKSFUf3efM+JGw==
X-ME-Sender: <xms:_CBCXxRQ33Xh_NDDy3jSxy191B6T_OZZL5J-kroeTwYPg1nFAra8SA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedrudduhedguddvvdcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffoggfgsedtkeertd
 ertddtnecuhfhrohhmpefvrghkrghshhhiucfurghkrghmohhtohcuoehoqdhtrghkrghs
 hhhisehsrghkrghmohgttghhihdrjhhpqeenucggtffrrghtthgvrhhnpedujeetlefhtd
 dtkefgtdeuieelhffgteejjeehkeegveduvdevgeeiheeuueekjeenucfkphepudektddr
 vdefhedrfedrheegnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilh
 hfrhhomhepohdqthgrkhgrshhhihesshgrkhgrmhhotggthhhirdhjph
X-ME-Proxy: <xmx:_CBCX6wsbURYJ6DPbb3RJo1YxuCAQQs6GdGLrV_lp66dCR2ZE9JyDg>
 <xmx:_CBCX23ljoavcrHw3iZkmpts2GXLPhSWpR3X9Bdy9HU7oFZ44W6EqQ>
 <xmx:_CBCX5AJV_gakP_psrEqecn7KnCL8u0I4yVa7u1ikSAi5whjpOBQWw>
 <xmx:_SBCXyJj-Bz1xJ61wpTf9nej-aV5PSALdvNT-xL3oIwf8YokSePrYA>
Received: from workstation.flets-east.jp (ad003054.dynamic.ppp.asahi-net.or.jp
 [180.235.3.54])
 by mail.messagingengine.com (Postfix) with ESMTPA id DE58A30600A3;
 Sun, 23 Aug 2020 03:55:39 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: tiwai@suse.de
Subject: [PATCH 1/2] ALSA; firewire-tascam: exclude Tascam FE-8 from detection
Date: Sun, 23 Aug 2020 16:55:37 +0900
Message-Id: <20200823075537.56255-1-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, clemens@ladisch.de, stable@vger.kernel.org
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

Tascam FE-8 is known to support communication by asynchronous transaction
only. The support can be implemented in userspace application and
snd-firewire-ctl-services project has the support. However, ALSA
firewire-tascam driver is bound to the model.

This commit changes device entries so that the model is excluded. In a
commit 53b3ffee7885 ("ALSA: firewire-tascam: change device probing
processing"), I addressed to the concern that version field in
configuration differs depending on installed firmware. However, as long
as I checked, the version number is fixed. It's safe to return version
number back to modalias.

Fixes: 53b3ffee7885 ("ALSA: firewire-tascam: change device probing processing")
Cc: <stable@vger.kernel.org> # 4.4+
Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 sound/firewire/tascam/tascam.c | 33 +++++++++++++++++++++++++++++----
 1 file changed, 29 insertions(+), 4 deletions(-)

diff --git a/sound/firewire/tascam/tascam.c b/sound/firewire/tascam/tascam.c
index 5dac0d9fc58e..75f2edd8e78f 100644
--- a/sound/firewire/tascam/tascam.c
+++ b/sound/firewire/tascam/tascam.c
@@ -39,9 +39,6 @@ static const struct snd_tscm_spec model_specs[] = {
 		.midi_capture_ports = 2,
 		.midi_playback_ports = 4,
 	},
-	// This kernel module doesn't support FE-8 because the most of features
-	// can be implemented in userspace without any specific support of this
-	// module.
 };
 
 static int identify_model(struct snd_tscm *tscm)
@@ -211,11 +208,39 @@ static void snd_tscm_remove(struct fw_unit *unit)
 }
 
 static const struct ieee1394_device_id snd_tscm_id_table[] = {
+	// Tascam, FW-1884.
+	{
+		.match_flags = IEEE1394_MATCH_VENDOR_ID |
+			       IEEE1394_MATCH_SPECIFIER_ID |
+			       IEEE1394_MATCH_VERSION,
+		.vendor_id = 0x00022e,
+		.specifier_id = 0x00022e,
+		.version = 0x800000,
+	},
+	// Tascam, FE-8 (.version = 0x800001)
+	// This kernel module doesn't support FE-8 because the most of features
+	// can be implemented in userspace without any specific support of this
+	// module.
+	//
+	// .version = 0x800002 is unknown.
+	//
+	// Tascam, FW-1082.
+	{
+		.match_flags = IEEE1394_MATCH_VENDOR_ID |
+			       IEEE1394_MATCH_SPECIFIER_ID |
+			       IEEE1394_MATCH_VERSION,
+		.vendor_id = 0x00022e,
+		.specifier_id = 0x00022e,
+		.version = 0x800003,
+	},
+	// Tascam, FW-1804.
 	{
 		.match_flags = IEEE1394_MATCH_VENDOR_ID |
-			       IEEE1394_MATCH_SPECIFIER_ID,
+			       IEEE1394_MATCH_SPECIFIER_ID |
+			       IEEE1394_MATCH_VERSION,
 		.vendor_id = 0x00022e,
 		.specifier_id = 0x00022e,
+		.version = 0x800004,
 	},
 	{}
 };
-- 
2.25.1

