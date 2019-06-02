Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 46FF03225F
	for <lists+alsa-devel@lfdr.de>; Sun,  2 Jun 2019 09:16:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 21B111695;
	Sun,  2 Jun 2019 09:15:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 21B111695
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1559459806;
	bh=OvzgzLlIfejuzxmIhhg+ebcZhSH6tEeaRUQNCZBNCY0=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jpBu00fmD/qOMSKuIWiu4WJ+XQk2DEbewA8/xKCBy9k0M5se8alsXmS9X3W17WyfV
	 Cro5q4UPBz4sZDTrs2OzmPdKHc2MlZE5hRQ/8b7vCpOipHAyV+Lft/Lf4t5R2k+Ol/
	 4VQf056MuG/TYfoBRTNCoVyGzmcKVva5C1/UFY80=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D435DF89738;
	Sun,  2 Jun 2019 09:13:20 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5411CF896F8; Sun,  2 Jun 2019 09:13:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.0
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 747FFF80C06
 for <alsa-devel@alsa-project.org>; Sun,  2 Jun 2019 09:13:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 747FFF80C06
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="AojAVCig"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="nYLmi4u3"
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id 7D8C8215B2;
 Sun,  2 Jun 2019 03:13:09 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Sun, 02 Jun 2019 03:13:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=S+OFGbH8svq+S
 CWgb0i7XENHyMfE4RE7DDZIMvK8y70=; b=AojAVCigD1DwwmdjruHe/GFDvgipX
 zQRNtJOZd6oTteHNg+/lF51+JR0njrmlBgK7n2DhI9KWKAtjNClARCwryeMHTMJy
 uVvmhSAbCjnZod+SOWyx25kHQl6W9HY7mmQKZw4BraOl8i8jR+RW/AggPHAqEZir
 wRWVteQcEhs9Mvcsmp0a2uQaU7G/8mspF/qep+os5uAEMVXfFFCQQNvnsvXsd9ZG
 ZhZ/8s1jHoEp5HfzY10pNwEjUrtFcdLzN8saF6hGB6f91tNwTEi7bCR+46fqay8f
 HPxyvlvjxMiPh/7O3upNM2YUb3/8H0xZ7Lr7XsNV7kmSbeA8lFytZCVig==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=S+OFGbH8svq+SCWgb0i7XENHyMfE4RE7DDZIMvK8y70=; b=nYLmi4u3
 8pberkgKTCi2KRMDPa7Sgz0EHMXRJ3Wz4D88p8UBk5MlWDOXUkGOTDuB1GOYmquC
 7u0aCQAbpU5ICrenV0NysNJEWHIWI3ifpuuVsNwQyrPy89S5SlTCZFY2WiNT9TlP
 HFndUJad/YWEApEaZRjHZLUj1Ff/4Q2Ga3p8MxWajFVDAMrgLQC7JBadsOkezPui
 UCN038u7jU9oR3iTZdDoUVR2j2IaRhYMJuWDRhIFq35QwJDmWV9vy/VHSO6BBq1r
 kDQyC8Z310h19pFr3izAGryBU3Gedtaq8XD3bFVI2NgX3TL/7vGVo3/I1YxClIKB
 SONAdsjTouKyHQ==
X-ME-Sender: <xms:BXfzXIyYxlW0SNDSHsNyvLeuxUQ1cBhs12ZLLP_xEN1YZkXTLd_oLg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduuddrudefgedguddukecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtke
 ertdertddtnecuhfhrohhmpefvrghkrghshhhiucfurghkrghmohhtohcuoehoqdhtrghk
 rghshhhisehsrghkrghmohgttghhihdrjhhpqeenucfkphepudegrdefrdejhedrudekud
 enucfrrghrrghmpehmrghilhhfrhhomhepohdqthgrkhgrshhhihesshgrkhgrmhhotggt
 hhhirdhjphenucevlhhushhtvghrufhiiigvpedt
X-ME-Proxy: <xmx:BXfzXHTMiG3wBk71YzLBgR6vF8KQ7ni4J1f-futovTWqlVah7do82w>
 <xmx:BXfzXA-Yp2yeLsJSrRsEJC-l04P4BdVyTYXQAKre4JvcMZ1WAsJlIQ>
 <xmx:BXfzXEJKFgWWK5YmHg8XUt6wVXPha_-dhaCfu8viEG8rC0mu0Zeitg>
 <xmx:BXfzXDZIJddLY8yfCcAvwKdPmbi50dMNJnuXx3dOeG04D6lNchWG-g>
Received: from workstation.flets-east.jp (ae075181.dynamic.ppp.asahi-net.or.jp
 [14.3.75.181])
 by mail.messagingengine.com (Postfix) with ESMTPA id 1AD948005A;
 Sun,  2 Jun 2019 03:13:07 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: clemens@ladisch.de,
	tiwai@suse.de
Date: Sun,  2 Jun 2019 16:12:47 +0900
Message-Id: <20190602071259.21622-4-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190602071259.21622-1-o-takashi@sakamocchi.jp>
References: <20190602071259.21622-1-o-takashi@sakamocchi.jp>
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org
Subject: [alsa-devel] [PATCH 03/15] ALSA: firewire-tascam: code refactoring
	for release of isochronous resources
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

This commit is a part of preparation to perform allocation/release
of isochronous channels in pcm.hw_params/hw_free callbacks.

This commit obsoletes a helper function to release isochronous resources
for both direction.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 sound/firewire/tascam/tascam-stream.c | 18 ++++++++----------
 1 file changed, 8 insertions(+), 10 deletions(-)

diff --git a/sound/firewire/tascam/tascam-stream.c b/sound/firewire/tascam/tascam-stream.c
index fc963469f6b0..6ad149274050 100644
--- a/sound/firewire/tascam/tascam-stream.c
+++ b/sound/firewire/tascam/tascam-stream.c
@@ -269,13 +269,6 @@ static int begin_session(struct snd_tscm *tscm)
 				  &reg, sizeof(reg), 0);
 }
 
-static void release_resources(struct snd_tscm *tscm)
-{
-	// Release isochronous resources.
-	fw_iso_resources_free(&tscm->tx_resources);
-	fw_iso_resources_free(&tscm->rx_resources);
-}
-
 static int keep_resources(struct snd_tscm *tscm, unsigned int rate,
 			  struct amdtp_stream *stream)
 {
@@ -374,7 +367,8 @@ int snd_tscm_stream_start_duplex(struct snd_tscm *tscm, unsigned int rate)
 		amdtp_stream_stop(&tscm->rx_stream);
 		amdtp_stream_stop(&tscm->tx_stream);
 
-		release_resources(tscm);
+		fw_iso_resources_free(&tscm->tx_resources);
+		fw_iso_resources_free(&tscm->rx_resources);
 	}
 
 	if (!amdtp_stream_running(&tscm->rx_stream)) {
@@ -427,7 +421,9 @@ int snd_tscm_stream_start_duplex(struct snd_tscm *tscm, unsigned int rate)
 	amdtp_stream_stop(&tscm->tx_stream);
 
 	finish_session(tscm);
-	release_resources(tscm);
+
+	fw_iso_resources_free(&tscm->tx_resources);
+	fw_iso_resources_free(&tscm->rx_resources);
 
 	return err;
 }
@@ -441,7 +437,9 @@ void snd_tscm_stream_stop_duplex(struct snd_tscm *tscm)
 	amdtp_stream_stop(&tscm->rx_stream);
 
 	finish_session(tscm);
-	release_resources(tscm);
+
+	fw_iso_resources_free(&tscm->tx_resources);
+	fw_iso_resources_free(&tscm->rx_resources);
 }
 
 void snd_tscm_stream_lock_changed(struct snd_tscm *tscm)
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
