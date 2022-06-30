Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 82B445620A0
	for <lists+alsa-devel@lfdr.de>; Thu, 30 Jun 2022 18:56:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0ACD51DD;
	Thu, 30 Jun 2022 18:55:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0ACD51DD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1656608177;
	bh=VYUv5F/6dQrMw7e9kEwRECpmAyBEtzt7vUnfzQFpo2U=;
	h=Date:From:To:Subject:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=cKxsqTbXCtWlOslVE/kdVU9JUMyQAK8Ovr5VaV3Mwb0xl0KJovvIrfyD2aRPQ+2Zl
	 E98UXaxQsc/B4UrY+BgXuhOzovDZ0E7vU29OWMN0jIQWYixfzhkKCS/iE/8mfxIce9
	 0ulFz8Wq+W2tSNBDBsapH6lJTdBydxovz+ZYP10I=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5B8EDF804DA;
	Thu, 30 Jun 2022 18:55:18 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D9FF4F800F5; Thu, 30 Jun 2022 18:55:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.thepaulodoom.com (www.thepaulodoom.com [45.77.108.202])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 67BE8F800F5
 for <alsa-devel@alsa-project.org>; Thu, 30 Jun 2022 18:55:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 67BE8F800F5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (4096-bit key) header.d=thepaulodoom.com header.i=@thepaulodoom.com
 header.b="GAcHJcBb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=thepaulodoom.com;
 s=mail; t=1656608105;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
 bh=XsVkb/AD52GAZHCvQYNJpcreeFW5ZkqKXR8WqydymBA=;
 b=GAcHJcBbku7uBN+7/GlX1bnbw8CNMPJwePabDOfezaeLWa5XOTseKo/YKdktH4DTKUggD1
 AqwogUfMk2HDon7tMFBNwH9xhQRbCBTmhED+WlP9zSeR4le2q0uzAwvtYh8bR5CmNXaxe0
 6V/xmYtE/OCrnbBsQUPISm+cOnWxhTt9NWNXyHG+1X26jcj+21nr8OczB/iWUFE35rifNq
 7Rn9dcO0SpuTvf2FPmeAD3j0uKEuhdcqcLHU+JCk+HXF/6deg5UG7qp66ZHrEx9a/7peTg
 yfmTBVTDW87YCl7ceMPaxiV1GTc9/UCO9jJVMOBlI41QllhIYvhb1aT1NMn3YkZ7Gpcv6S
 H9HearwePg7Nt6erhoxu6yBVr31skBqTX5JeoiiLNQlZW571HJD6bFdt025MaucRyyQLzV
 7XWPgO4nmYV+CZv5uKFRsCcq2TetLaSXAgbrED6lXZgDB1P0sanO4I5Si3grJFn0rZq2Wc
 E9uXj8we465dnwpBxLOK1Fmvhs92x3Ljl4JJTir9SCJsQXrUpViEtrpG3l3w/8wuu9P6FB
 6J24N9ztbOg9LSwk1ezeCXv2H5ifL4Pp2pRLJsFHhrT5DzWmbAWpmt54BaErsRK4pfdf2b
 KtWhPuE3NNJSfbXihW1beDe2SKbW/8fcewT+PFhCP3lIE1LNek2zs=
Received: from paul-debian-hp (c-98-240-189-147.hsd1.mn.comcast.net
 [98.240.189.147]) by vultr.guest (OpenSMTPD) with ESMTPSA id 77301d97
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO); 
 Thu, 30 Jun 2022 16:55:05 +0000 (UTC)
Date: Thu, 30 Jun 2022 11:55:02 -0500
From: Paul Lemmermann <thepaulodoom@thepaulodoom.com>
To: perex@perex.cz
Subject: [PATCH] sound: arm: aaci: fixed formatting
Message-ID: <20220630165502.l4bb7ov3c3fhuvey@paul-debian-hp>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 notify@kernel.org
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

added proper spacing before parenthesis and around 'or' operator.

Signed-off-by: Paul Lemmermann <thepaulodoom@thepaulodoom.com>
---
 sound/arm/aaci.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/arm/aaci.c b/sound/arm/aaci.c
index 0817ad21a..724a1d50b 100644
--- a/sound/arm/aaci.c
+++ b/sound/arm/aaci.c
@@ -239,7 +239,7 @@ static void aaci_fifo_irq(struct aaci *aaci, int channel, u32 mask)
 			aacirun->bytes -= len;
 
 			/* reading 16 bytes at a time */
-			for( ; len > 0; len -= 16) {
+			for ( ; len > 0; len -= 16) {
 				asm(
 					"ldmia	%1, {r0, r1, r2, r3}\n\t"
 					"stmia	%0!, {r0, r1, r2, r3}"
@@ -250,7 +250,7 @@ static void aaci_fifo_irq(struct aaci *aaci, int channel, u32 mask)
 				if (ptr >= aacirun->end)
 					ptr = aacirun->start;
 			}
-		} while(1);
+		} while (1);
 
 		aacirun->ptr = ptr;
 
@@ -662,7 +662,7 @@ static void aaci_pcm_capture_start(struct aaci_runtime *aacirun)
 	writel(aacirun->cr, aacirun->base + AACI_RXCR);
 
 	ie = readl(aacirun->base + AACI_IE);
-	ie |= IE_ORIE |IE_RXIE; // overrun and rx interrupt -- half full
+	ie |= IE_ORIE | IE_RXIE; // overrun and rx interrupt -- half full
 	writel(ie, aacirun->base + AACI_IE);
 }
 
-- 
2.36.1

