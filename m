Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BC1E91F764C
	for <lists+alsa-devel@lfdr.de>; Fri, 12 Jun 2020 11:57:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6CAE21682;
	Fri, 12 Jun 2020 11:56:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6CAE21682
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1591955842;
	bh=DtTyOfjrYJsDGllZ2sJffzlpvAFG2F9/qO6reMvLYQY=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LieTe1dMt7dD/GmB9OK3nPUUMtT5FvMtrvMBkSnzZb01yL86VJDnjhchJE4MYK88j
	 T1ZtXt4ypllVgAau9reMfGzqAQSgz4PD0/vnGEIkEqIIg3lf0ueob6flbScNkrdN9P
	 gSYcmVh6aUVq2m88W2pm6ETAXe75gzk96hgMvYNE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CBC53F80252;
	Fri, 12 Jun 2020 11:55:43 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A39B4F802A7; Fri, 12 Jun 2020 11:55:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from jazz.pogo.org.uk (jazz.pogo.org.uk [213.138.114.167])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8A7CBF801F7
 for <alsa-devel@alsa-project.org>; Fri, 12 Jun 2020 11:55:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8A7CBF801F7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=pogo.org.uk header.i=@pogo.org.uk
 header.b="0Bg70Qpk"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=pogo.org.uk
 ; s=a;
 h=References:In-Reply-To:Message-Id:Date:Subject:To:From:Sender:
 Reply-To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=AnrtO05T6/s7qGFpQKo6mDx183ZPFUUarYztePbdS48=; b=0Bg70QpkHjW1+jYHmATlH+PZ/e
 dn9DJRxe5SAuAveVA9kSmda2ed250p9KmQFK/N6lrb79tI3VyPZN2ezQJGsEst2qpKAYRs4bt/N0U
 Kn9ilopUQ3E2Kv7moK1M44gADoiY3tjBmredbsYFzD5QsjHojy3TJncxtE2U8kLzEtg25DntNm5Ye
 UL5Po8qpilWUJhSGt448EHZm+rnt8wRmyd5lJRd+1v2rdqgvbyL+MMw5W01ubVgKBQW/zA3bL9i3F
 +Wb+ADcYkFMNU2xPVAT9HSAXd/UBXm4dTEqUm9a27d4Ahlb88mj2y4oM6NN0I3fqewes+aG1sc9UN
 xNnKk9+A==;
Received: from cpc1-hari17-2-0-cust102.20-2.cable.virginm.net ([86.18.4.103]
 helo=stax.localdomain) by jazz.pogo.org.uk with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.93.0.4 (FreeBSD))
 (envelope-from <mark@xwax.org>)
 id 1jjgPK-000ATa-K4; Fri, 12 Jun 2020 10:55:30 +0100
Received: from mark by stax.localdomain with local (Exim 4.84)
 (envelope-from <mark@stax.localdomain>)
 id 1jjgPK-00013A-8Z; Fri, 12 Jun 2020 10:55:30 +0100
From: Mark Hills <mark@xwax.org>
To: alsa-devel@alsa-project.org
Subject: [RFC PATCH 7/9] dsnoop: Another bug where the empty, not full,
 part of the ringbuffer was observed
Date: Fri, 12 Jun 2020 10:55:28 +0100
Message-Id: <20200612095530.3970-7-mark@xwax.org>
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

This looks like a simple mistake dating back to 2003 (commit 7470a5b9)
where code originated from dmix.
---
 src/pcm/pcm_dsnoop.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/src/pcm/pcm_dsnoop.c b/src/pcm/pcm_dsnoop.c
index 790d944c..3588eb91 100644
--- a/src/pcm/pcm_dsnoop.c
+++ b/src/pcm/pcm_dsnoop.c
@@ -241,7 +241,7 @@ static int snd_pcm_dsnoop_delay(snd_pcm_t *pcm, snd_pcm_sframes_t *delayp)
 		/* Fall through */
 	case SNDRV_PCM_STATE_PREPARED:
 	case SNDRV_PCM_STATE_SUSPENDED:
-		*delayp = snd_pcm_mmap_capture_hw_avail(pcm);
+		*delayp = snd_pcm_mmap_capture_avail(pcm);
 		return 0;
 	case SNDRV_PCM_STATE_XRUN:
 		return -EPIPE;
-- 
2.17.5

