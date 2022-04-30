Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4607C515E30
	for <lists+alsa-devel@lfdr.de>; Sat, 30 Apr 2022 16:30:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BEC91827;
	Sat, 30 Apr 2022 16:29:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BEC91827
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1651329014;
	bh=/nFvPbzI2vAbgw2il1NPgItYfCZhoXqLSXmtSHCGB6A=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=eoKoqZShCRzBSb9Kva+MZr37wI2p0miTEKeKPt1qDsDpgPZ+MUWs16mQSIb6OurHg
	 MHVICWCbhAoMmQNSXTJwwfxB0X13gC0R+1qSDi0Vnpz057Q0yYT9Oc4PRfQd4jiv2A
	 VFePnhzyTb7SoBxQhqXfDpZGlHYQ3h84LUaPiCe0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 353D9F8012B;
	Sat, 30 Apr 2022 16:29:16 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 64229F8012A; Sat, 30 Apr 2022 16:29:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.horus.com (mail.horus.com [78.46.148.228])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9EDEFF800E9
 for <alsa-devel@alsa-project.org>; Sat, 30 Apr 2022 16:29:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9EDEFF800E9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=horus.com header.i=@horus.com
 header.b="BtQDyv6s"
Received: from lenny.lan (62-47-207-181.adsl.highway.telekom.at
 [62.47.207.181])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits)
 client-signature RSA-PSS (2048 bits))
 (Client CN "E-Mail Matthias Reichl lenny",
 Issuer "HiassofT CA 2014" (verified OK))
 by mail.horus.com (Postfix) with ESMTPSA id 6A195640D1;
 Sat, 30 Apr 2022 16:29:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=horus.com;
 s=20180324; t=1651328942;
 bh=inHahK7Af/g/iCtESVaQ83VvpBe+PvmQEDnb1T/D1qU=;
 h=From:To:Cc:Subject:Date:From;
 b=BtQDyv6sKYRMhcHXIFH5IL7FLBMMWcBAYdM8mRheawaIew3G2pjO4xfyQwMy/HDU7
 3XLaYhkMlpzgPN83hBJYgspkChlCCJFwLGLW7vkPNDPmpXhnKiKoP6eeRUfGMOVYvv
 1jX8ktClOnNZCQrx2jYTuUt9B5W9RshMgW8PLGd8=
Received: by lenny.lan (Postfix, from userid 1000)
 id E8BF8200912; Sat, 30 Apr 2022 16:29:01 +0200 (CEST)
From: Matthias Reichl <hias@horus.com>
To: Takashi Iwai <tiwai@suse.de>,
	Jaroslav Kysela <perex@perex.cz>
Subject: [PATCH] conf: vc4-hdmi: use a proper hdmi pcm, fix broken default pcm
Date: Sat, 30 Apr 2022 16:28:45 +0200
Message-Id: <20220430142845.229409-1-hias@horus.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Dom Cobley <popcornmix@gmail.com>, Serge Schneider <serge@raspberrypi.com>,
 alsa-devel@alsa-project.org, Matthias Reichl <hias@horus.com>
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

Userspace expects to see a HDMI pcm, so remove the somewhat broken
front and iec958 pcms and add a proper hdmi pcm instead.

The hdmi pcm supports HD/HBR audio passthrough and relays the IEC958
status bits on to the kernel driver so it can switch to HBR audio
packets if needed. The control hook is marked optional because kernels
before 5.14 didn't expose the IEC958 controls.

The default pcm never worked as dmix doesn't support the iec958 format.
So drop dmix, only use plug and softvol, and use the hdmi pcm for
iec958 formatting.

Signed-off-by: Matthias Reichl <hias@horus.com>
---
 src/conf/cards/vc4-hdmi.conf | 78 ++++++++++++++++++++++--------------
 1 file changed, 48 insertions(+), 30 deletions(-)

diff --git a/src/conf/cards/vc4-hdmi.conf b/src/conf/cards/vc4-hdmi.conf
index 027804a1..af87b3a8 100644
--- a/src/conf/cards/vc4-hdmi.conf
+++ b/src/conf/cards/vc4-hdmi.conf
@@ -3,36 +3,9 @@
 # subframe conversion
 #
 
-<confdir:pcm/front.conf>
+<confdir:pcm/hdmi.conf>
 
-vc4-hdmi.pcm.front.0 {
-	@args [ CARD ]
-	@args.CARD {
-		type string
-	}
-	type hw
-	card $CARD
-}
-
-# default with dmix
-vc4-hdmi.pcm.default {
-	@args [ CARD ]
-	@args.CARD {
-		type string
-	}
-	type asym
-	playback.pcm {
-		type plug
-		slave.pcm {
-			@func concat
-			strings [ "dmix:" $CARD ]
-		}
-	}
-}
-
-<confdir:pcm/iec958.conf>
-
-vc4-hdmi.pcm.iec958.0 {
+vc4-hdmi.pcm.hdmi.0 {
 	@args [ CARD AES0 AES1 AES2 AES3 ]
 	@args.CARD {
 		type string
@@ -53,12 +26,57 @@ vc4-hdmi.pcm.iec958.0 {
 	slave {
 		format IEC958_SUBFRAME_LE
 		pcm {
-			type plug
+			type hooks
 			slave.pcm {
 				type hw
 				card $CARD
+				device 0
+			}
+			hooks.0 {
+				type ctl_elems
+				hook_args [
+				{
+					name "IEC958 Playback Default"
+					interface PCM
+					optional true
+					lock true
+					preserve true
+					value [ $AES0 $AES1 $AES2 $AES3 ]
+				}
+				]
 			}
 		}
 	}
 	status [ $AES0 $AES1 $AES2 $AES3 ]
+	hdmi_mode true
+}
+
+# default with plug and softvol
+vc4-hdmi.pcm.default {
+	@args [ CARD ]
+	@args.CARD {
+		type string
+	}
+	type asym
+	playback.pcm {
+		type plug
+		slave.pcm {
+			type softvol
+			slave.pcm {
+				@func concat
+				strings [
+					"cards.vc4-hdmi.pcm.hdmi.0:"
+					"CARD=" $CARD ","
+					"AES0=0x04,"	# IEC958_AES0_CON_NOT_COPYRIGHT | IEC958_AES0_CON_EMPHASIS_NONE
+					"AES1=0x82,"	# IEC958_AES1_CON_ORIGINAL | IEC958_AES1_CON_PCM_CODER
+					"AES2=0x00,"	# IEC958_AES2_CON_SOURCE_UNSPEC | IEC958_AES2_CON_CHANNEL_UNSPEC
+					"AES3=0x01"	# IEC958_AES3_CON_FS_NOTID (iec958 plugin will fill in actual rate)
+				]
+			}
+			control {
+				name "PCM Playback Volume"
+				card $CARD
+			}
+		}
+	}
 }
-- 
2.30.2

