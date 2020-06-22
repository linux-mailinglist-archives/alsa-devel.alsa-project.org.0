Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 84C3B2037CC
	for <lists+alsa-devel@lfdr.de>; Mon, 22 Jun 2020 15:21:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2532416D3;
	Mon, 22 Jun 2020 15:20:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2532416D3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1592832077;
	bh=5DUZPgwn/zwalRpur+X/AsGfwRNlBanJL2WtFf/8TYs=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=iPXYMnPpS4ThSWiO0xnAK328yG61d0oOgD3V75+vLSFq8gbciUfvNgSOJugiCi0kb
	 TNQuXpBaxQ/Wbo8d4s9PB7IzYVep4dKh50bSq0mUZrBoOCCBATmUHkwG9fDbrcddKS
	 IbAspKlw/n7kIUTHx2QOJWpfV5ZPNTK4937aQKTk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 45EDEF8015B;
	Mon, 22 Jun 2020 15:16:21 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 17832F8015A; Mon, 22 Jun 2020 15:16:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from jazz.pogo.org.uk (jazz.pogo.org.uk [213.138.114.167])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8C71AF801F2
 for <alsa-devel@alsa-project.org>; Mon, 22 Jun 2020 15:15:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8C71AF801F2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=pogo.org.uk header.i=@pogo.org.uk
 header.b="sviGoMOM"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=pogo.org.uk
 ; s=a;
 h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:
 Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=8cU1UkvPEE3dgwW86w1iNdExXcQr4WWcypzmRmDBv5Q=; b=sviGoMOMegrdJ7ZQeI5lxm0gBE
 BwxBgKcRPXKxyZy25cOFKNXhLS8WvROI9QaQraJQKg0VPg/gBGumstQbSSt3Z1ueSfYhSst51m9Lw
 hZdoWWasM2FuxkoHrBy8pMEcxS4T0p14r5etVdgcgcVtkElBFryWyIJvUPWj6mOcI9zBZRx1z9Cmk
 xT5Bf2Poo5vC7egrL9dX/5wm85SkgTZhtkUR7taVpSWqEWBTomILIlchgO3l2We1YDLK7XI4rpF78
 x/AlrBSku26Dp5sKKcRwAkCZAl7Fv7TipjWl1kKQEdONW6CYDy1pBTpcC490gcIRkMzG4LLFqoMhO
 lM/dhPvA==;
Received: from cpc1-hari17-2-0-cust102.20-2.cable.virginm.net ([86.18.4.103]
 helo=stax.localdomain) by jazz.pogo.org.uk with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94 (FreeBSD))
 (envelope-from <mark@xwax.org>)
 id 1jnMI7-000BwO-IC; Mon, 22 Jun 2020 14:15:15 +0100
Received: from mark by stax.localdomain with local (Exim 4.84)
 (envelope-from <mark@stax.localdomain>)
 id 1jnMI7-00066I-6K; Mon, 22 Jun 2020 14:15:15 +0100
From: Mark Hills <mark@xwax.org>
To: Jaroslav Kysela <perex@perex.cz>
Subject: [PATCH 7/9] dsnoop: Another bug where the empty, not full,
 part of the ringbuffer was observed
Date: Mon, 22 Jun 2020 14:15:13 +0100
Message-Id: <20200622131515.23385-7-mark@xwax.org>
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

This looks like a simple mistake dating back to 2003 (commit 7470a5b9)
where code originated from dmix.

Signed-off-by: Mark Hills <mark@xwax.org>
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

