Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D01541F765D
	for <lists+alsa-devel@lfdr.de>; Fri, 12 Jun 2020 12:00:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 67EA71692;
	Fri, 12 Jun 2020 11:59:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 67EA71692
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1591956003;
	bh=nsN8fCemAH+WcDCT9loe3ECwPl0eMRgJBRqf0DXppXA=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=GrLWZFFRvG7BU2W87/2bngVl2mjfdGSDROKNeLjX+CRA3+klNGTwVlquMmwXzDefq
	 cVlHUtI8lZkYXvW4bHXazgvqHbUAFrisuqy53TwRrDIMUqDhF2DBr4S4bOnyB9+XiU
	 2TJApc6Lo7m6qzEgdxREWHDn+B4U+xlc9j3zbIMY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D2770F802EC;
	Fri, 12 Jun 2020 11:55:50 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7214BF8024A; Fri, 12 Jun 2020 11:55:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from jazz.pogo.org.uk (jazz.pogo.org.uk [213.138.114.167])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B548BF80259
 for <alsa-devel@alsa-project.org>; Fri, 12 Jun 2020 11:55:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B548BF80259
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=pogo.org.uk header.i=@pogo.org.uk
 header.b="JhuMNGgi"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=pogo.org.uk
 ; s=a;
 h=References:In-Reply-To:Message-Id:Date:Subject:To:From:Sender:
 Reply-To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=HwKcLDGWAXzt3VBFo8XMOt4Vue2M0edhij5fu6Xpw+U=; b=JhuMNGgiyiktb2HsZbB/0rY58h
 v+wMNrWRQIMQtM8hUSUj6mqPJgxHqsd+SeVlZIHIzZqK8bxGBl0l5AyUonptQwLoZ8cb6evWf6e/g
 psmSInokYGgvWwMS3r0hxBypbCbqSQ/bSW2yhIW2dxpkD4omDMbHZR2IUgT+ERGHc1ODNpqCS7nUw
 YFNjcJG3IUDLKI1tS3TwOP4DCM6bCzsJQhMjLCZVYcoZmjXH4cssT+Vcl1JFhnrEY0AhvJBbXmFjl
 73zMBMr7UyTFC8fjzwasNrMkE9WBRt69VijjGe2M0yWRlD58JQ5JCjo51oyJfZKzMrM9AS1joOslB
 AghWwqdA==;
Received: from cpc1-hari17-2-0-cust102.20-2.cable.virginm.net ([86.18.4.103]
 helo=stax.localdomain) by jazz.pogo.org.uk with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.93.0.4 (FreeBSD))
 (envelope-from <mark@xwax.org>)
 id 1jjgPK-000ATZ-K5; Fri, 12 Jun 2020 10:55:30 +0100
Received: from mark by stax.localdomain with local (Exim 4.84)
 (envelope-from <mark@stax.localdomain>)
 id 1jjgPK-000135-8G; Fri, 12 Jun 2020 10:55:30 +0100
From: Mark Hills <mark@xwax.org>
To: alsa-devel@alsa-project.org
Subject: [RFC PATCH 6/9] dsnoop: The stop threshold was not implemented
 correctly
Date: Fri, 12 Jun 2020 10:55:27 +0100
Message-Id: <20200612095530.3970-6-mark@xwax.org>
X-Mailer: git-send-email 2.17.5
In-Reply-To: <2006121020220.23374@stax.localdomain>
References: <2006121020220.23374@stax.localdomain>
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

The previous implementation would mean that stop_threshold behaved
erratically. The intent is to detect that the buffer is too full,
and stop.

In practice, I don't think this was a bug in practice for applications
which don't adjust the stop_threshold. The line above catches those cases.
---
 src/pcm/pcm_dsnoop.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/src/pcm/pcm_dsnoop.c b/src/pcm/pcm_dsnoop.c
index c64df381..790d944c 100644
--- a/src/pcm/pcm_dsnoop.c
+++ b/src/pcm/pcm_dsnoop.c
@@ -165,7 +165,7 @@ static int snd_pcm_dsnoop_sync_ptr(snd_pcm_t *pcm)
 	// printf("sync ptr diff = %li\n", diff);
 	if (pcm->stop_threshold >= pcm->boundary)	/* don't care */
 		return 0;
-	if ((avail = snd_pcm_mmap_capture_hw_avail(pcm)) >= pcm->stop_threshold) {
+	if ((avail = snd_pcm_mmap_capture_avail(pcm)) >= pcm->stop_threshold) {
 		gettimestamp(&dsnoop->trigger_tstamp, pcm->tstamp_type);
 		dsnoop->state = SND_PCM_STATE_XRUN;
 		dsnoop->avail_max = avail;
-- 
2.17.5

