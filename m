Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DE6E6F5B9B
	for <lists+alsa-devel@lfdr.de>; Wed,  3 May 2023 17:56:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 518BD12E6;
	Wed,  3 May 2023 17:55:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 518BD12E6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1683129396;
	bh=vLHOvyNtUNRswPzcuy6vcmkB/45CP06QMO3h5JOrA68=;
	h=From:To:Subject:Date:CC:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=Fd/l/iskpYqcm8O5Ry76N6N6Hdm8mqPcvPu5XmyAYJ6mTscdLB+NxrYymrPf/vZ7Z
	 2RMEu4Mc7NVzokQBpBeI2+GrxqQ50qWigLyCGuOwojhrOuoiwdEzt7dlvLGsTI6m4r
	 r8gkkdblDmzZcLA+pHWmtmMMIwhebfhIn/I7VoVg=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 90141F8032B;
	Wed,  3 May 2023 17:55:45 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7BC72F804B1; Wed,  3 May 2023 17:55:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from bluemchen.kde.org (bluemchen.kde.org
 [IPv6:2001:470:142:8::100])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id CC8C2F80087
	for <alsa-devel@alsa-project.org>; Wed,  3 May 2023 17:55:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CC8C2F80087
Received: from ugly.fritz.box (localhost [127.0.0.1])
	by bluemchen.kde.org (Postfix) with ESMTP id 0D89C2426C;
	Wed,  3 May 2023 11:55:31 -0400 (EDT)
Received: by ugly.fritz.box (masqmail 0.3.4, from userid 1000)
	id 1puEpG-tu9-00; Wed, 03 May 2023 17:55:30 +0200
From: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH] conf/emu10k1: remove compat with two decades old drivers
Date: Wed,  3 May 2023 17:55:30 +0200
Message-Id: <20230503155530.2121516-1-oswald.buddenhagen@gmx.de>
X-Mailer: git-send-email 2.40.0.152.g15d061e6df
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: CHAVSDZPE4ZS2XAXH4G6M5TQ3ZXODGKP
X-Message-ID-Hash: CHAVSDZPE4ZS2XAXH4G6M5TQ3ZXODGKP
X-MailFrom: ossi@kde.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Takashi Iwai <tiwai@suse.de>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/CHAVSDZPE4ZS2XAXH4G6M5TQ3ZXODGKP/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

There really isn't much of a point to clutter the files with this.

Signed-off-by: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
---
 src/conf/cards/Audigy.conf  | 65 ------------------------------
 src/conf/cards/Audigy2.conf | 79 -------------------------------------
 src/conf/cards/EMU10K1.conf | 48 ----------------------
 3 files changed, 192 deletions(-)

diff --git a/src/conf/cards/Audigy.conf b/src/conf/cards/Audigy.conf
index 1c924966..42692cfd 100644
--- a/src/conf/cards/Audigy.conf
+++ b/src/conf/cards/Audigy.conf
@@ -26,31 +26,14 @@ Audigy.pcm.front.0 {
 				optional true
 				value [ 255 255 0 0 0 0 0 0  255 0 0 0 0 0 0 0  0 255 0 0 0 0 0 0 ]
 			}
-			{
-				# for compatibility with older drivers
-				name "EMU10K1 PCM Send Volume"
-				index { @func private_pcm_subdevice }
-				lock true
-				optional true
-				value [ 255 255 0 0 0 0 0 0  255 0 0 0 0 0 0 0  0 255 0 0 0 0 0 0 ]
-			}
 			{
 				interface PCM
 				name "EMU10K1 PCM Send Routing"
 				index { @func private_pcm_subdevice }
 				lock true
 				optional true
 				value [ 8 9 0 0 0 0 0 0  8 9 0 0 0 0 0 0  8 9 0 0 0 0 0 0 ]
 			}
-			{
-				# for compatibility with older drivers
-				name "EMU10K1 PCM Send Routing"
-				index { @func private_pcm_subdevice }
-				lock true
-				optional true
-				value [ 8 9 0 0 0 0 0 0  8 9 0 0 0 0 0 0  8 9 0 0 0 0 0 0 ]
-			}
-
 		]
 	}
 }	
@@ -79,14 +62,6 @@ Audigy.pcm.rear.0 {
 				optional true
 				value [ 0 0 255 255 0 0 0 0  0 0 255 0 0 0 0 0  0 0 0 255 0 0 0 0 ]
 			}
-			{
-				# for compatibility with older drivers
-				name "EMU10K1 PCM Send Volume"
-				index { @func private_pcm_subdevice }
-				lock true
-				optional true
-				value [ 0 0 255 255 0 0 0 0  0 0 255 0 0 0 0 0  0 0 0 255 0 0 0 0 ]
-			}
 		]
 	}
 }	
@@ -115,30 +90,14 @@ Audigy.pcm.center_lfe.0 {
 				optional true
 				value [ 255 255 0 0 0 0 0 0  255 0 0 0 0 0 0 0  0 255 0 0 0 0 0 0 ]
 			}
-			{
-				# for compatibility with older drivers
-				name "EMU10K1 PCM Send Volume"
-				index { @func private_pcm_subdevice }
-				lock true
-				optional true
-				value [ 255 255 0 0 0 0 0 0  255 0 0 0 0 0 0 0  0 255 0 0 0 0 0 0 ]
-			}
 			{
 				interface PCM
 				name "EMU10K1 PCM Send Routing"
 				index { @func private_pcm_subdevice }
 				lock true
 				optional true
 				value [ 6 7 0 0 0 0 0 0  6 7 0 0 0 0 0 0  6 7 0 0 0 0 0 0 ]
 			}
-			{
-				# for compatibility with older drivers
-				name "EMU10K1 PCM Send Routing"
-				index { @func private_pcm_subdevice }
-				lock true
-				optional true
-				value [ 6 7 0 0 0 0 0 0  6 7 0 0 0 0 0 0  6 7 0 0 0 0 0 0 ]
-			}
 		]
 	}
 }	
@@ -265,14 +224,6 @@ Audigy.pcm.iec958.0 {
 				optional true
 				value [ $AES0 $AES1 $AES2 $AES3 ]
 			}
-			{
-				# for compatibility with older drivers
-				name "IEC958 Playback Default"
-				lock true
-				preserve true
-				optional true
-				value [ $AES0 $AES1 $AES2 $AES3 ]
-			}
 			{
 				name "IEC958 Optical Raw Playback Switch"
 				lock true
@@ -287,30 +238,14 @@ Audigy.pcm.iec958.0 {
 				optional true
 				value [ 255 255 0 0 0 0 0 0  255 0 0 0 0 0 0 0  0 255 0 0 0 0 0 0 ]
 			}
-			{
-				# for compatibility with older drivers
-				name "EMU10K1 PCM Send Volume"
-				index { @func private_pcm_subdevice }
-				lock true
-				optional true
-				value [ 255 255 0 0 0 0 0 0  255 0 0 0 0 0 0 0  0 255 0 0 0 0 0 0 ]
-			}
 			{
 				interface PCM
 				name "EMU10K1 PCM Send Routing"
 				index { @func private_pcm_subdevice }
 				lock true
 				optional true
 				value [ 20 21 0 0 0 0 0 0  20 21 0 0 0 0 0 0   20 21 0 0 0 0 0 0 ]
 			}
-			{
-				# for compatibility with older drivers
-				name "EMU10K1 PCM Send Routing"
-				index { @func private_pcm_subdevice }
-				lock true
-				optional true
-				value [ 20 21 0 0 0 0 0 0  20 21 0 0 0 0 0 0   20 21 0 0 0 0 0 0 ]
-			}
 			{
 				name "Audigy Analog/Digital Output Jack"
 				lock true
diff --git a/src/conf/cards/Audigy2.conf b/src/conf/cards/Audigy2.conf
index cbec7835..35126d23 100644
--- a/src/conf/cards/Audigy2.conf
+++ b/src/conf/cards/Audigy2.conf
@@ -26,30 +26,14 @@ Audigy2.pcm.front.0 {
 				optional true
 				value [ 255 255 0 0 0 0 0 0  255 0 0 0 0 0 0 0  0 255 0 0 0 0 0 0 ]
 			}
-			{
-				# for compatibility with older drivers
-				name "EMU10K1 PCM Send Volume"
-				index { @func private_pcm_subdevice }
-				lock true
-				optional true
-				value [ 255 255 0 0 0 0 0 0  255 0 0 0 0 0 0 0  0 255 0 0 0 0 0 0 ]
-			}
 			{
 				interface PCM
 				name "EMU10K1 PCM Send Routing"
 				index { @func private_pcm_subdevice }
 				lock true
 				optional true
 				value [ 8 9 0 0 0 0 0 0  8 9 0 0 0 0 0 0  8 9 0 0 0 0 0 0 ]
 			}
-			{
-				# for compatibility with older drivers
-				name "EMU10K1 PCM Send Routing"
-				index { @func private_pcm_subdevice }
-				lock true
-				optional true
-				value [ 8 9 0 0 0 0 0 0  8 9 0 0 0 0 0 0  8 9 0 0 0 0 0 0 ]
-			}
 
 		]
 	}
@@ -79,14 +63,6 @@ Audigy2.pcm.rear.0 {
 				optional true
 				value [ 0 0 255 255 0 0 0 0  0 0 255 0 0 0 0 0  0 0 0 255 0 0 0 0 ]
 			}
-			{
-				# for compatibility with older drivers
-				name "EMU10K1 PCM Send Volume"
-				index { @func private_pcm_subdevice }
-				lock true
-				optional true
-				value [ 0 0 255 255 0 0 0 0  0 0 255 0 0 0 0 0  0 0 0 255 0 0 0 0 ]
-			}
 		]
 	}
 }	
@@ -115,30 +91,14 @@ Audigy2.pcm.center_lfe.0 {
 				optional true
 				value [ 255 255 0 0 0 0 0 0  255 0 0 0 0 0 0 0  0 255 0 0 0 0 0 0 ]
 			}
-			{
-				# for compatibility with older drivers
-				name "EMU10K1 PCM Send Volume"
-				index { @func private_pcm_subdevice }
-				lock true
-				optional true
-				value [ 255 255 0 0 0 0 0 0  255 0 0 0 0 0 0 0  0 255 0 0 0 0 0 0 ]
-			}
 			{
 				interface PCM
 				name "EMU10K1 PCM Send Routing"
 				index { @func private_pcm_subdevice }
 				lock true
 				optional true
 				value [ 6 7 0 0 0 0 0 0  6 7 0 0 0 0 0 0  6 7 0 0 0 0 0 0 ]
 			}
-			{
-				# for compatibility with older drivers
-				name "EMU10K1 PCM Send Routing"
-				index { @func private_pcm_subdevice }
-				lock true
-				optional true
-				value [ 6 7 0 0 0 0 0 0  6 7 0 0 0 0 0 0  6 7 0 0 0 0 0 0 ]
-			}
 		]
 	}
 }
@@ -167,30 +127,14 @@ Audigy2.pcm.side.0 {
 				optional true
 				value [ 255 255 0 0 0 0 0 0  255 0 0 0 0 0 0 0  0 255 0 0 0 0 0 0 ]
 			}
-			{
-				# for compatibility with older drivers
-				name "EMU10K1 PCM Send Volume"
-				index { @func private_pcm_subdevice }
-				lock true
-				optional true
-				value [ 255 255 0 0 0 0 0 0  255 0 0 0 0 0 0 0  0 255 0 0 0 0 0 0 ]
-			}
 			{
 				interface PCM
 				name "EMU10K1 PCM Send Routing"
 				index { @func private_pcm_subdevice }
 				lock true
 				optional true
 				value [ 14 15 0 0 0 0 0 0  14 15 0 0 0 0 0 0  14 15 0 0 0 0 0 0 ]
 			}
-			{
-				# for compatibility with older drivers
-				name "EMU10K1 PCM Send Routing"
-				index { @func private_pcm_subdevice }
-				lock true
-				optional true
-				value [ 14 15 0 0 0 0 0 0  14 15 0 0 0 0 0 0  14 15 0 0 0 0 0 0 ]
-			}
 		]
 	}
 }
@@ -374,13 +318,6 @@ Audigy2.pcm.iec958.0 {
 				optional true
 				value [ $AES0 $AES1 $AES2 $AES3 ]
 			}
-			{
-				# for compatibility with older drivers
-				name "IEC958 Playback Default"
-				preserve true
-				optional true
-				value [ $AES0 $AES1 $AES2 $AES3 ]
-			}
 			{
 				name "IEC958 Optical Raw Playback Switch"
 				lock true
@@ -395,30 +332,14 @@ Audigy2.pcm.iec958.0 {
 				optional true
 				value [ 255 255 0 0 0 0 0 0  255 0 0 0 0 0 0 0  0 255 0 0 0 0 0 0 ]
 			}
-			{
-				# for compatibility with older drivers
-				name "EMU10K1 PCM Send Volume"
-				index { @func private_pcm_subdevice }
-				lock true
-				optional true
-				value [ 255 255 0 0 0 0 0 0  255 0 0 0 0 0 0 0  0 255 0 0 0 0 0 0 ]
-			}
 			{
 				interface PCM
 				name "EMU10K1 PCM Send Routing"
 				index { @func private_pcm_subdevice }
 				lock true
 				optional true
 				value [ 20 21 0 0 0 0 0 0  20 21 0 0 0 0 0 0   20 21 0 0 0 0 0 0 ]
 			}
-			{
-				# for compatibility with older drivers
-				name "EMU10K1 PCM Send Routing"
-				index { @func private_pcm_subdevice }
-				lock true
-				optional true
-				value [ 20 21 0 0 0 0 0 0  20 21 0 0 0 0 0 0   20 21 0 0 0 0 0 0 ]
-			}
 			{
 				name "Audigy Analog/Digital Output Jack"
 				lock true
diff --git a/src/conf/cards/EMU10K1.conf b/src/conf/cards/EMU10K1.conf
index ef193fe0..430926c7 100644
--- a/src/conf/cards/EMU10K1.conf
+++ b/src/conf/cards/EMU10K1.conf
@@ -28,30 +28,14 @@ EMU10K1.pcm.front.0 {
 					optional true
 					value [ 255 255 0 0 255 0 0 0 0 255 0 0 ]
 				}
-				{
-					# for compatibility with older drivers
-					name "EMU10K1 PCM Send Volume"
-					index { @func private_pcm_subdevice }
-					# lock true
-					optional true
-					value [ 255 255 0 0 255 0 0 0 0 255 0 0 ]
-				}
 				{
 					interface PCM
 					name "EMU10K1 PCM Send Routing"
 					index { @func private_pcm_subdevice }
 					# lock true
 					optional true
 					value [ 8 9 0 0 8 9 0 0 8 9 0 0 ]
 				}
-				{
-					# for compatibility with older drivers
-					name "EMU10K1 PCM Send Routing"
-					index { @func private_pcm_subdevice }
-					# lock true
-					optional true
-					value [ 8 9 0 0 8 9 0 0 8 9 0 0 ]
-				}
 			]
 		}
 	}
@@ -87,14 +71,6 @@ EMU10K1.pcm.rear.0 {
 					optional true
 					value [ 0 0 255 255 0 0 255 0 0 0 0 255 ]
 				}
-				{
-					# for compatibility with older drivers
-					name "EMU10K1 PCM Send Volume"
-					index { @func private_pcm_subdevice }
-					# lock true
-					optional true
-					value [ 0 0 255 255 0 0 255 0 0 0 0 255 ]
-				}
 			]
 		}
 	}
@@ -152,30 +128,14 @@ EMU10K1.pcm.center_lfe.0 {
 					optional true
 					value [ 255 255 0 0 255 0 0 0 0 255 0 0 ]
 				}
-				{
-					# for compatibility with older drivers
-					name "EMU10K1 PCM Send Volume"
-					index { @func private_pcm_subdevice }
-					# lock true
-					optional true
-					value [ 255 255 0 0 255 0 0 0 0 255 0 0 ]
-				}
 				{
 					interface PCM
 					name "EMU10K1 PCM Send Routing"
 					index { @func private_pcm_subdevice }
 					# lock true
 					optional true
 					value [ 6 7 0 0 6 7 0 0 6 7 0 0 ]
 				}
-				{
-					# for compatibility with older drivers
-					name "EMU10K1 PCM Send Routing"
-					index { @func private_pcm_subdevice }
-					# lock true
-					optional true
-					value [ 6 7 0 0 6 7 0 0 6 7 0 0 ]
-				}
 			]
 		}
 	}
@@ -304,14 +264,6 @@ EMU10K1.pcm.iec958.0 {
 				optional true
 				value [ $AES0 $AES1 $AES2 $AES3 ]
 			}
-			{
-				# for compatibility with older drivers
-				name "IEC958 Playback Default"
-				lock true
-				preserve true
-				optional true
-				value [ $AES0 $AES1 $AES2 $AES3 ]
-			}
 			{
 				name "IEC958 Optical Raw Playback Switch"
 				lock true
-- 
2.40.0.152.g15d061e6df

