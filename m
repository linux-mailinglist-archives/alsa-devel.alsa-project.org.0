Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4680637F850
	for <lists+alsa-devel@lfdr.de>; Thu, 13 May 2021 15:00:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C282C17CA;
	Thu, 13 May 2021 14:59:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C282C17CA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1620910827;
	bh=gOpjejZQiJFm4CqA1dQ+WTExQrGL5eWyeDbqrUKWI2Q=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=R9x+NUDyFAjt0Z0RLu5lTrWXFcm8ndMlvZi5ZAc+/hAA6C7HGtGOW1JUydxjLcsej
	 +bNfjkyjx/tuVP3Zu5ORXCSO8wGzFAUOlCPV4UIW38DAsQWbmL5VmW14YaBmwg1Ayz
	 1DfMRPa5VZFcPNx4+17rv4R7qxa2d+JGfCuYBr7U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EC9EAF804B1;
	Thu, 13 May 2021 14:57:18 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E1675F804AE; Thu, 13 May 2021 14:57:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 08CB5F8012E
 for <alsa-devel@alsa-project.org>; Thu, 13 May 2021 14:57:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 08CB5F8012E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="ZfgjOlnI"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="IvO94Jyt"
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 3A9405C015B;
 Thu, 13 May 2021 08:57:04 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Thu, 13 May 2021 08:57:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=SiO+pcMbXuqv/
 hZDxQNoTDJaePDS0BK45FBgOaKHkO8=; b=ZfgjOlnIFq2XKoKgC/RLXTEH2HlP+
 ElYAi0sA46POLCRCzyr7Yv34m13+kc3llxeCq8nvaI7gMFBTAz03EA9sz1vkOjSr
 x+EpR5UDN0i+y91ZcXV39ox30YfgH2JQ63rY63Gl96fsPPpsd05drmtM9OIgPwBp
 ZG7fPt9DxkQU+oSuGdPAvqW47RuYV6cf5a+nTa6TodehYVnNggNcud25rantFefr
 CwYfEg/Q1PPmDBfv4oEmXq+2EHaM+PcXbo0A0m+vv5bJY4XTs7isXk4Ehx7SybMY
 a7AyfcHwJiTMp4qXudcJL3cqI/+3X4D6VzrEBAq4JSbkkTmcL4AuJ10tQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=SiO+pcMbXuqv/hZDxQNoTDJaePDS0BK45FBgOaKHkO8=; b=IvO94Jyt
 aOibRRVNPpiMC6ddlbAuJ8LPhg0TvZBrx+fd7+37NIeSTEgukTvNvikWtlBo6jy2
 xTmbyBXS7KYbLhUVmMVEbPwmotsYWkRqk0IOT1IFggnNDIt+RJCUYWAsuJoGuK2N
 myfHQeYPSA2Q3/g4ToUxjwrwZd76WlwKdZcjBbePioj0m3vokcdWf/iREAJIycrr
 brG98PI8dH/JduMLGZy+QjCzcAwaPfGsapQEavQuq02eaNb9aJdaq0F+pI9pnQ+R
 QeU/AT8C5dNaOqf4UNUtwvls9w13k/EcVmZKBPt+tcMg/2vxcUs0wpD88MdLENFc
 KllaFok+GuO4qA==
X-ME-Sender: <xms:ICKdYN6TyQS4H_-tG0YfVP-vHoKLssTy6UlwuTrlH-G6mCpMBDx9sQ>
 <xme:ICKdYK6FS0GKx2oHVtxTSwH5AJtzdtDY0ARsH67uFmsdgBYEI4clfvG7y2SlTXXKt
 0g8fAASXi6W-CTK17Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdehgedgheelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
 dtredttdenucfhrhhomhepvfgrkhgrshhhihcuufgrkhgrmhhothhouceoohdqthgrkhgr
 shhhihesshgrkhgrmhhotggthhhirdhjpheqnecuggftrfgrthhtvghrnhepveefffefke
 etgfevgeefleehfffhueejtdejveethfekveektdejjedvtdejhfejnecukfhppedugedr
 fedrieehrddujeehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilh
 hfrhhomhepohdqthgrkhgrshhhihesshgrkhgrmhhotggthhhirdhjph
X-ME-Proxy: <xmx:ICKdYEeXCr-rjkeuyANvqX2aMdqa3OfPgNrc3JzjjJZwccPoN9Yc3w>
 <xmx:ICKdYGKfwyf1A9pLB_sbweopJ3OEZsrocBDhTBIDwwVt5RSTsusXLQ>
 <xmx:ICKdYBKtGNahp-Lv4ODpKg4FQJ4VpeJGXg4_0NWlOViZQg7zkOp8wQ>
 <xmx:ICKdYPh0tqKokmvoKguMSjjedclh0a2QEa13Z4HdoffMEB769mJXlw>
Received: from workstation.flets-east.jp (ae065175.dynamic.ppp.asahi-net.or.jp
 [14.3.65.175]) by mail.messagingengine.com (Postfix) with ESMTPA;
 Thu, 13 May 2021 08:57:02 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: tiwai@suse.de
Subject: [PATCH 4/5] ALSA: firewire-lib: fix calculation for size of IR
 context payload
Date: Thu, 13 May 2021 21:56:51 +0900
Message-Id: <20210513125652.110249-5-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210513125652.110249-1-o-takashi@sakamocchi.jp>
References: <20210513125652.110249-1-o-takashi@sakamocchi.jp>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, clemens@ladisch.de, stable@vger.kernel.org
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

The quadlets for CIP header is handled as a part of IR context header,
thus it doesn't join in IR context payload. However current calculation
includes the quadlets in IR context payload.

Cc: <stable@vger.kernel.org>
Fixes: f11453c7cc01 ("ALSA: firewire-lib: use 16 bytes IR context header to separate CIP header")
Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 sound/firewire/amdtp-stream.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/sound/firewire/amdtp-stream.c b/sound/firewire/amdtp-stream.c
index b53971bf4b90..73aff017dc9a 100644
--- a/sound/firewire/amdtp-stream.c
+++ b/sound/firewire/amdtp-stream.c
@@ -1071,23 +1071,22 @@ static int amdtp_stream_start(struct amdtp_stream *s, int channel, int speed,
 		s->data_block_counter = 0;
 	}
 
-	/* initialize packet buffer */
+	// initialize packet buffer.
+	max_ctx_payload_size = amdtp_stream_get_max_payload(s);
 	if (s->direction == AMDTP_IN_STREAM) {
 		dir = DMA_FROM_DEVICE;
 		type = FW_ISO_CONTEXT_RECEIVE;
-		if (!(s->flags & CIP_NO_HEADER))
+		if (!(s->flags & CIP_NO_HEADER)) {
+			max_ctx_payload_size -= 8;
 			ctx_header_size = IR_CTX_HEADER_SIZE_CIP;
-		else
+		} else {
 			ctx_header_size = IR_CTX_HEADER_SIZE_NO_CIP;
-
-		max_ctx_payload_size = amdtp_stream_get_max_payload(s) -
-				       ctx_header_size;
+		}
 	} else {
 		dir = DMA_TO_DEVICE;
 		type = FW_ISO_CONTEXT_TRANSMIT;
 		ctx_header_size = 0;	// No effect for IT context.
 
-		max_ctx_payload_size = amdtp_stream_get_max_payload(s);
 		if (!(s->flags & CIP_NO_HEADER))
 			max_ctx_payload_size -= IT_PKT_HEADER_SIZE_CIP;
 	}
-- 
2.27.0

