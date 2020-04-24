Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 116931B6B51
	for <lists+alsa-devel@lfdr.de>; Fri, 24 Apr 2020 04:26:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 97CA9169A;
	Fri, 24 Apr 2020 04:25:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 97CA9169A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1587695203;
	bh=NUMO7Ih2K+A56N3vpctIjx/6gFISqAk7kvsTZrnuofE=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Qjy2pBkpOq2iwMoOmcuNtK80bJ5vRzAgkO6YlIVxJZ41v1bJ1ezNTFTgw1rORuikS
	 BdgpemIOF006StRYmxtpxR8N5s+f8N+Kw9a8br3qawPBakPJTXzH4hfWy4TgrUl5IZ
	 K6czAAMDr0jGA8xNm4kBXfcXcsaMck2UmLq0iqNg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 88C7CF80121;
	Fri, 24 Apr 2020 04:25:02 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 17089F80121; Fri, 24 Apr 2020 04:24:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_PASS,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from puleglot.ru (puleglot.ru [IPv6:2a01:4f8:1c0c:58e8::2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 03B6DF80121
 for <alsa-devel@alsa-project.org>; Fri, 24 Apr 2020 04:24:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 03B6DF80121
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=tsoy.me header.i=@tsoy.me
 header.b="U+08DUsy"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tsoy.me;
 s=mymail; h=Sender:Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=y+8vI6JEwOUt5HBMOjjj12KHdpl6prl8nORF/oKMq3w=; b=U+08DUsyn6Gs6x7m+MRHckT+kp
 tILrPODU5jIXx3+fAKgWyxlxh7ftcaftiZOWRtCfY+KDk/iDR4mbFDiEVjDCZlblT8gWOMd5EpyTa
 nSSDy/e29U6eFslacl1DnGmkIYMGGq05Ee9+YqjHy06mNnPnhXwB40ovaa+s3Ld6WJTU=;
Received: from [2a00:1370:8125:3f98:890:f100:d37d:7ada] (helo=home.puleglot.ru)
 by puleglot.ru with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
 (Exim 4.92.3) (envelope-from <puleglot@puleglot.ru>)
 id 1jRo1L-0001hb-5i; Fri, 24 Apr 2020 05:24:51 +0300
From: Alexander Tsoy <alexander@tsoy.me>
To: alsa-devel@alsa-project.org
Subject: [PATCH 2/2] ALSA: usb-audio: Remove async workaround for Scarlett 2nd
 gen
Date: Fri, 24 Apr 2020 05:24:49 +0300
Message-Id: <20200424022449.14972-2-alexander@tsoy.me>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200424022449.14972-1-alexander@tsoy.me>
References: <20200424022449.14972-1-alexander@tsoy.me>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Takashi Iwai <tiwai@suse.de>, Gregor Pintar <grpintar@gmail.com>,
 Roope Salmi <rpsalmi@gmail.com>
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

Frame size computation has been fixed and the workaround is no longer
needed.

Signed-off-by: Alexander Tsoy <alexander@tsoy.me>
---
 sound/usb/quirks.c | 14 --------------
 1 file changed, 14 deletions(-)

diff --git a/sound/usb/quirks.c b/sound/usb/quirks.c
index 351ba214a9d3..a8ece1701068 100644
--- a/sound/usb/quirks.c
+++ b/sound/usb/quirks.c
@@ -1806,20 +1806,6 @@ void snd_usb_audioformat_attributes_quirk(struct snd_usb_audio *chip,
 		 */
 		fp->attributes &= ~UAC_EP_CS_ATTR_FILL_MAX;
 		break;
-	case USB_ID(0x1235, 0x8200):  /* Focusrite Scarlett 2i4 2nd gen */
-	case USB_ID(0x1235, 0x8202):  /* Focusrite Scarlett 2i2 2nd gen */
-	case USB_ID(0x1235, 0x8205):  /* Focusrite Scarlett Solo 2nd gen */
-		/*
-		 * Reports that playback should use Synch: Synchronous
-		 * while still providing a feedback endpoint.
-		 * Synchronous causes snapping on some sample rates.
-		 * Force it to use Synch: Asynchronous.
-		 */
-		if (stream == SNDRV_PCM_STREAM_PLAYBACK) {
-			fp->ep_attr &= ~USB_ENDPOINT_SYNCTYPE;
-			fp->ep_attr |= USB_ENDPOINT_SYNC_ASYNC;
-		}
-		break;
 	}
 }
 
-- 
2.26.2

