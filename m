Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 426432037B7
	for <lists+alsa-devel@lfdr.de>; Mon, 22 Jun 2020 15:17:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7DC1416B5;
	Mon, 22 Jun 2020 15:17:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7DC1416B5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1592831875;
	bh=7rCpMp9Rp+FqySWIb7GWHLRiPGRWfT1zUsHrHxzex4U=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Lzk8yoaJ04KTG6uCGab49w5BZSQcero8YcUY2BOCfhCr1XeZrlBEmw1RfMfKH8Yvk
	 AVgqqjNk9ILq8sIdLEr4u5NPakPuKD90sEc0QV+XOdL+zZMC2fyb0rbgtVgDXzp9Wk
	 RLOq+3RW2POxTZ5sjnaZnMxtmNE+iIBYPX0Dmke0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F28B7F802A7;
	Mon, 22 Jun 2020 15:15:34 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2DD04F802A2; Mon, 22 Jun 2020 15:15:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from jazz.pogo.org.uk (jazz.pogo.org.uk [213.138.114.167])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A4538F8015B
 for <alsa-devel@alsa-project.org>; Mon, 22 Jun 2020 15:15:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A4538F8015B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=pogo.org.uk header.i=@pogo.org.uk
 header.b="0WDHvl7W"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=pogo.org.uk
 ; s=a;
 h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:
 Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=vEejpRzBFTJ0ZNMAC69VSODSqA0qVvaW7DAqw5N5mBo=; b=0WDHvl7Wt5BXpFAgIcG6+ENy3r
 UMvtFXYBv1EkkBwUfa0N9i0pSU7Lv2h/nfmwHdmy+Vbs/AmHxDoZp0a4XWsh9y7089LNC1fojqSL7
 Ity7/g9R7uShg7iLXl3ku2w2H5n9wqJk79itGNzNa1UDSr1KElYqR+KLxTI7d65Z+QXQfGf5+VRLe
 p9HNzFJl52KMSa3+D296p0+AxoLG7aiAzIN1vKVVmDEdrWYIs2WcMzCKQQwF8EXf4FXjjBlV/jVl/
 6M4IUw2XuZqEgRnq72kbzu36Wi33K2uB2PA7madjWLG8UpjvcpS3nFr3vow31DcP51qGaloVJMDTs
 LG8U+BsA==;
Received: from cpc1-hari17-2-0-cust102.20-2.cable.virginm.net ([86.18.4.103]
 helo=stax.localdomain) by jazz.pogo.org.uk with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94 (FreeBSD))
 (envelope-from <mark@xwax.org>)
 id 1jnMI7-000BwP-GW; Mon, 22 Jun 2020 14:15:15 +0100
Received: from mark by stax.localdomain with local (Exim 4.84)
 (envelope-from <mark@stax.localdomain>)
 id 1jnMI7-00066N-6h; Mon, 22 Jun 2020 14:15:15 +0100
From: Mark Hills <mark@xwax.org>
To: Jaroslav Kysela <perex@perex.cz>
Subject: [PATCH 8/9] dsnoop: Make use of the (previously unused) function
Date: Mon, 22 Jun 2020 14:15:14 +0100
Message-Id: <20200622131515.23385-8-mark@xwax.org>
X-Mailer: git-send-email 2.17.5
In-Reply-To: <2006221356390.20421@stax.localdomain>
References: <2006221356390.20421@stax.localdomain>
Cc: alsa-devel@alsa-project.org
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

Match the equivalent funciton for playback. This is on the assumption
that values should be capped at zero, which is what _rewindable()
implements.

Signed-off-by: Mark Hills <mark@xwax.org>
---
 src/pcm/pcm_dsnoop.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/src/pcm/pcm_dsnoop.c b/src/pcm/pcm_dsnoop.c
index 3588eb91..7904314c 100644
--- a/src/pcm/pcm_dsnoop.c
+++ b/src/pcm/pcm_dsnoop.c
@@ -352,7 +352,7 @@ static int snd_pcm_dsnoop_pause(snd_pcm_t *pcm ATTRIBUTE_UNUSED, int enable ATTR
 
 static snd_pcm_sframes_t snd_pcm_dsnoop_rewindable(snd_pcm_t *pcm)
 {
-	return snd_pcm_mmap_capture_hw_avail(pcm);
+	return snd_pcm_mmap_capture_hw_rewindable(pcm);
 }
 
 static snd_pcm_sframes_t snd_pcm_dsnoop_rewind(snd_pcm_t *pcm, snd_pcm_uframes_t frames)
-- 
2.17.5

