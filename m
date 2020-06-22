Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BEB52037D5
	for <lists+alsa-devel@lfdr.de>; Mon, 22 Jun 2020 15:21:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 36C4416D7;
	Mon, 22 Jun 2020 15:21:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 36C4416D7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1592832110;
	bh=l1gZqnBDPEgRgG6VPKUlnuRh8mioWgeTUdgREpPEXQk=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HVz+/7aJO2DID+LISxS+o4Q85oPo/FLw1J1lBJGvoLYRtSddsZdycYnv6Xtrqrsra
	 OmcRYzNICgP+AzTxo76r4l6bBaG9kL//whUMhZWVq8XSuK5HT4w91HRrfQWDuIZqJ6
	 D5I2hJ+PperewbF+KqSMTKQYCth32LY1CXiXbIZ4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9003DF802FD;
	Mon, 22 Jun 2020 15:16:22 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 21999F802A0; Mon, 22 Jun 2020 15:16:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from jazz.pogo.org.uk (jazz.pogo.org.uk [213.138.114.167])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7B3CBF802A0
 for <alsa-devel@alsa-project.org>; Mon, 22 Jun 2020 15:15:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7B3CBF802A0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=pogo.org.uk header.i=@pogo.org.uk
 header.b="xJRWm/W9"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=pogo.org.uk
 ; s=a;
 h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:
 Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=mgHkLLSwxX2bsoTwh7T6kbqlwvmX5Q6zaDcW8z23lxw=; b=xJRWm/W909aqO0OIQoDqSGhNsx
 54Bi4Q6A4QjFLbe8mOndqv5Xxy/JNe37CDn+zNheYXBkM1edSO1DJVbfg3uxpKCBl7n1o650EbksI
 ahDqimBuQa3z2NFw9WuAF7tzpDNWao9zjOvTrGrFqiqBJDeZU6qPXSCmVvdSwGe4eVZB72rJtWHLU
 8of+0UAKpZgUbn6++OvYbqMTFY6y1UWxn66PGee8FhT1DO7/daQluF4aZA/7eP0aQhXhs5nHyxFow
 9Vt8QvkOG5N2oiFTajghb07Qo7DmHn1xHkuHBRJzYHbjbLpATUNTu/EOha6qSWFNkq47eWUR+mPEj
 5pYR45Tw==;
Received: from cpc1-hari17-2-0-cust102.20-2.cable.virginm.net ([86.18.4.103]
 helo=stax.localdomain) by jazz.pogo.org.uk with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94 (FreeBSD))
 (envelope-from <mark@xwax.org>)
 id 1jnMI7-000BwL-HL; Mon, 22 Jun 2020 14:15:15 +0100
Received: from mark by stax.localdomain with local (Exim 4.84)
 (envelope-from <mark@stax.localdomain>)
 id 1jnMI7-000663-4y; Mon, 22 Jun 2020 14:15:15 +0100
From: Mark Hills <mark@xwax.org>
To: Jaroslav Kysela <perex@perex.cz>
Subject: [PATCH 4/9] dsnoop: The delay presented to snd_pcm_status_delay() was
 incorrect
Date: Mon, 22 Jun 2020 14:15:10 +0100
Message-Id: <20200622131515.23385-4-mark@xwax.org>
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

This was the original bug that caused me to start looking at the
ring buffer functions.

In the API this is documented as:

  "Delay is distance between current application frame position and
   sound frame position. It's positive and less than buffer size in
   normal situation, negative on playback underrun and greater than
   buffer size on capture overrun. "

Because dsnoop was returning the buffer space available to the hardware
the return value was always quite large, and moved in the wrong
direction.

With this patch, dsnoop now gives results which are comparable to using
the "hw" device directly. My test case was with snd-echo3g (Layla3G).

Signed-off-by: Mark Hills <mark@xwax.org>
---
 src/pcm/pcm_local.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/src/pcm/pcm_local.h b/src/pcm/pcm_local.h
index 89d4125b..1fa8e61d 100644
--- a/src/pcm/pcm_local.h
+++ b/src/pcm/pcm_local.h
@@ -589,7 +589,7 @@ static inline snd_pcm_uframes_t snd_pcm_mmap_playback_delay(snd_pcm_t *pcm)
 
 static inline snd_pcm_uframes_t snd_pcm_mmap_capture_delay(snd_pcm_t *pcm)
 {
-	return snd_pcm_mmap_capture_hw_avail(pcm);
+	return snd_pcm_mmap_capture_avail(pcm);
 }
 
 static inline snd_pcm_sframes_t snd_pcm_mmap_delay(snd_pcm_t *pcm)
-- 
2.17.5

