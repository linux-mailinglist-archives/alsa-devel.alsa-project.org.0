Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A06120CBFF
	for <lists+alsa-devel@lfdr.de>; Mon, 29 Jun 2020 05:01:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 11B5C1665;
	Mon, 29 Jun 2020 05:00:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 11B5C1665
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1593399692;
	bh=MxHRlK1OfzRCHUNsTXLjfSYz1JTNNESMrUGlaxh/tBs=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NXHUbNkyotOSduICtHfVVtJo/SiJd6VxpdFYoXZGopIWdBZV8uQNV9ExhORbAIonJ
	 7px0yY2iEY3nm5oMf5oSQXA7vRzZgXbM5h9sRF+G0eNuKLaeEZmoFwQKpIfBDxtmzp
	 yK4F2iNi/Rbofopr/wU7kBCWAa8Qf65wYIv9vcPw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 47238F801F8;
	Mon, 29 Jun 2020 04:59:51 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id ACDF9F80217; Mon, 29 Jun 2020 04:59:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_PASS,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from puleglot.ru (puleglot.ru [IPv6:2a01:4f8:1c0c:58e8::2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A2007F801F8
 for <alsa-devel@alsa-project.org>; Mon, 29 Jun 2020 04:59:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A2007F801F8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=tsoy.me header.i=@tsoy.me
 header.b="Uc8mcBSt"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tsoy.me;
 s=mymail; h=Sender:Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=lM8J2mfTKi7US1ytGYTIVFlcxo6kmMRpQh1QH2TdnvA=; b=Uc8mcBStMgySh/NnX7/t1NAVdf
 xbRqest1s760W5rTFJmFIP+xT9ybDwDAyPBVS0fOzuu72e2dJMV3Al+1HCrJwwMNe4kukms8v2+Jj
 YcEXLjgLWh++5E2NW1tbdA4HEVXCujm0IA1HqR+/VgPDZfSnFf6gTjbM87c21C9ZUR68=;
Received: from [2a00:1370:8125:614e:c510:d933:d0ef:dfce]
 (helo=home.puleglot.ru)
 by puleglot.ru with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
 (Exim 4.93.0.4) (envelope-from <puleglot@puleglot.ru>)
 id 1jpk1A-000nGE-Fk; Mon, 29 Jun 2020 05:59:36 +0300
From: Alexander Tsoy <alexander@tsoy.me>
To: alsa-devel@alsa-project.org
Subject: [PATCH 2/2] ALSA: usb-audio: Replace s/frame/packet/ where appropriate
Date: Mon, 29 Jun 2020 05:59:34 +0300
Message-Id: <20200629025934.154288-2-alexander@tsoy.me>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200629025934.154288-1-alexander@tsoy.me>
References: <20200629025934.154288-1-alexander@tsoy.me>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Takashi Iwai <tiwai@suse.de>, Peter Bui <pbui@kernel.bx612.space>
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

Replace several occurences of "frame" with a "packet" where appropriate.

Signed-off-by: Alexander Tsoy <alexander@tsoy.me>
---
 sound/usb/card.h     |  6 +++---
 sound/usb/endpoint.c | 19 +++++++++----------
 2 files changed, 12 insertions(+), 13 deletions(-)

diff --git a/sound/usb/card.h b/sound/usb/card.h
index d6219fba9699..de43267b9c8a 100644
--- a/sound/usb/card.h
+++ b/sound/usb/card.h
@@ -84,10 +84,10 @@ struct snd_usb_endpoint {
 	dma_addr_t sync_dma;		/* DMA address of syncbuf */
 
 	unsigned int pipe;		/* the data i/o pipe */
-	unsigned int framesize[2];	/* small/large frame sizes in samples */
-	unsigned int sample_rem;	/* remainder from division fs/fps */
+	unsigned int packsize[2];	/* small/large packet sizes in samples */
+	unsigned int sample_rem;	/* remainder from division fs/pps */
 	unsigned int sample_accum;	/* sample accumulator */
-	unsigned int fps;		/* frames per second */
+	unsigned int pps;		/* packets per second */
 	unsigned int freqn;		/* nominal sampling rate in fs/fps in Q16.16 format */
 	unsigned int freqm;		/* momentary sampling rate in fs/fps in Q16.16 format */
 	int	   freqshift;		/* how much to shift the feedback value to get Q16.16 */
diff --git a/sound/usb/endpoint.c b/sound/usb/endpoint.c
index 11f23778f0a5..88760268fb55 100644
--- a/sound/usb/endpoint.c
+++ b/sound/usb/endpoint.c
@@ -159,11 +159,11 @@ int snd_usb_endpoint_next_packet_size(struct snd_usb_endpoint *ep)
 		return ep->maxframesize;
 
 	ep->sample_accum += ep->sample_rem;
-	if (ep->sample_accum >= ep->fps) {
-		ep->sample_accum -= ep->fps;
-		ret = ep->framesize[1];
+	if (ep->sample_accum >= ep->pps) {
+		ep->sample_accum -= ep->pps;
+		ret = ep->packsize[1];
 	} else {
-		ret = ep->framesize[0];
+		ret = ep->packsize[0];
 	}
 
 	return ret;
@@ -1088,16 +1088,15 @@ int snd_usb_endpoint_set_params(struct snd_usb_endpoint *ep,
 
 	if (snd_usb_get_speed(ep->chip->dev) == USB_SPEED_FULL) {
 		ep->freqn = get_usb_full_speed_rate(rate);
-		ep->fps = 1000;
+		ep->pps = 1000 >> ep->datainterval;
 	} else {
 		ep->freqn = get_usb_high_speed_rate(rate);
-		ep->fps = 8000;
+		ep->pps = 8000 >> ep->datainterval;
 	}
-	ep->fps >>= ep->datainterval;
 
-	ep->sample_rem = rate % ep->fps;
-	ep->framesize[0] = rate / ep->fps;
-	ep->framesize[1] = (rate + (ep->fps - 1)) / ep->fps;
+	ep->sample_rem = rate % ep->pps;
+	ep->packsize[0] = rate / ep->pps;
+	ep->packsize[1] = (rate + (ep->pps - 1)) / ep->pps;
 
 	/* calculate the frequency in 16.16 format */
 	ep->freqm = ep->freqn;
-- 
2.26.2

