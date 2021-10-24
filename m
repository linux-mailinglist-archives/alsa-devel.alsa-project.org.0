Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 28F3B4387A9
	for <lists+alsa-devel@lfdr.de>; Sun, 24 Oct 2021 10:33:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 960671676;
	Sun, 24 Oct 2021 10:33:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 960671676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1635064433;
	bh=HktbUeovVsKMDmAdvisTSWNPLwNFJlsv3taz6KIBtt8=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=vVSsHDskTjV4TPQYSJ9PNJWo6h1ovaZv/S1YZF4MeyV1pcSe77CkBioJ1m1Ob1bs8
	 6YgBg/7XdhLOCrowr6mX/PGJMw2S8MK5OOSE6TMHlP0Q38/R7rXlPiqTYuN+vLoLXy
	 iDrp4LV0f1IYVJWKXAHlTIuggiTrYskPxL1Wt0zc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4C09FF804AE;
	Sun, 24 Oct 2021 10:32:17 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D31FEF802C8; Sun, 24 Oct 2021 10:32:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from cable.insite.cz (cable.insite.cz [84.242.75.189])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8E731F80269
 for <alsa-devel@alsa-project.org>; Sun, 24 Oct 2021 10:32:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8E731F80269
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=ivitera.com header.i=@ivitera.com
 header.b="YiPaUYDM"; 
 dkim=pass (1024-bit key) header.d=ivitera.com header.i=@ivitera.com
 header.b="RttRpydY"
Received: from localhost (localhost [127.0.0.1])
 by cable.insite.cz (Postfix) with ESMTP id 70B93A1A3D403;
 Sun, 24 Oct 2021 10:32:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
 t=1635064322; bh=HktbUeovVsKMDmAdvisTSWNPLwNFJlsv3taz6KIBtt8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=YiPaUYDMHYXPIz2LIrMQqrnhzP3Evn63PTms2nOcdqHdB7EcyTDHrX7KUlLCN5APA
 YrQfffnIOxjSXIrlVr2vEJJl+SfoLrXn4reErNVLRU76LN5Pv2AxVZIoCdUoB4TqGR
 x7PrPnznoLp2culc2QtIPvoHQAo0LGfouHh0nu5s=
Received: from cable.insite.cz ([84.242.75.189])
 by localhost (server.insite.cz [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dRrWICkiPkSU; Sun, 24 Oct 2021 10:31:57 +0200 (CEST)
Received: from precision.doma (ip28.insite.cz [81.0.237.28])
 (Authenticated sender: pavel)
 by cable.insite.cz (Postfix) with ESMTPSA id 00595A1A3D404;
 Sun, 24 Oct 2021 10:31:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
 t=1635064317; bh=HktbUeovVsKMDmAdvisTSWNPLwNFJlsv3taz6KIBtt8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=RttRpydYc1ZCXHdlq/zKR3rCNAjOWTbnv8jl7oDZetH6tlQ7i8Ib6jq8UeZADPnaz
 8CMhk3PC69+OorFhC3QD25yjL/TcpyaCBBuHwU5IhUCbTX2xxyW8v23YQMOACGNsz9
 nKiXbwPqbIE56qxEP3+2Zg1PDOyPXL50P3Cjyoa4=
From: Pavel Hofman <pavel.hofman@ivitera.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 2/2] alsaloop: Support "Playback Pitch 1000000" rate shift
Date: Sun, 24 Oct 2021 10:31:55 +0200
Message-Id: <20211024083156.4743-2-pavel.hofman@ivitera.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211024083156.4743-1-pavel.hofman@ivitera.com>
References: <20211024083156.4743-1-pavel.hofman@ivitera.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Pavel Hofman <pavel.hofman@ivitera.com>
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

Linux 5.15 will introduce a new control element "Playback Pitch 1000000"
(commit 6fec018 ("usb: gadget: u_audio.c: Adding Playback Pitch ctl for
sync playback") which provides feedback mechanism for playback direction
of USB Audio Gadget. The control operates in the same way as the
existing control element "Capture Pitch 1000000".

This patch adds support for this feature.

Signed-off-by: Pavel Hofman <pavel.hofman@ivitera.com>
---
 alsaloop/pcmjob.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/alsaloop/pcmjob.c b/alsaloop/pcmjob.c
index 7b47c40..59ca0ff 100644
--- a/alsaloop/pcmjob.c
+++ b/alsaloop/pcmjob.c
@@ -1064,6 +1064,7 @@ static int set_rate_shift(struct loopback_handle *lhandle, double pitch)
 		snd_ctl_elem_value_set_integer(lhandle->ctl_rate_shift, 0, pitch * 100000);
 		err = snd_ctl_elem_write(lhandle->ctl, lhandle->ctl_rate_shift);
 	} else if (lhandle->ctl_pitch) {
+		// 'Playback/Capture Pitch 1000000' requires reciprocal to pitch
 		snd_ctl_elem_value_set_integer(lhandle->ctl_pitch, 0, (1 / pitch) * 1000000);
 		err = snd_ctl_elem_write(lhandle->ctl, lhandle->ctl_pitch);
 	} else {
@@ -1241,7 +1242,10 @@ static int openctl(struct loopback_handle *lhandle, int device, int subdevice)
 						lhandle->prateshift_name);
 				exit(EXIT_FAILURE);
 			}
-		}
+		} else
+			openctl_elem(lhandle, device, subdevice, "Playback Pitch 1000000",
+					&lhandle->ctl_pitch);
+		set_rate_shift(lhandle, 1);
 		if (lhandle->loopback->controls)
 			goto __events;
 		return 0;
@@ -1388,7 +1392,7 @@ int pcmjob_init(struct loopback *loop)
 	loop->id = strdup(id);
 	if (loop->sync == SYNC_TYPE_AUTO && (loop->capt->ctl_rate_shift || loop->capt->ctl_pitch))
 		loop->sync = SYNC_TYPE_CAPTRATESHIFT;
-	if (loop->sync == SYNC_TYPE_AUTO && loop->play->ctl_rate_shift)
+	if (loop->sync == SYNC_TYPE_AUTO && (loop->play->ctl_rate_shift || loop->play->ctl_pitch))
 		loop->sync = SYNC_TYPE_PLAYRATESHIFT;
 #ifdef USE_SAMPLERATE
 	if (loop->sync == SYNC_TYPE_AUTO && loop->src_enable)
-- 
2.25.1

