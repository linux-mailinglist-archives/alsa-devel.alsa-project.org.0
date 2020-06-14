Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CD701F892B
	for <lists+alsa-devel@lfdr.de>; Sun, 14 Jun 2020 16:14:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DF4A985D;
	Sun, 14 Jun 2020 16:13:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DF4A985D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1592144062;
	bh=fUk+Kt27qMSHRSmn2XLJU7cZm5EFE16JEFAsgMLBxLg=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=PyUkjY/W7/9IMaqoXWPGQquaTTuuvreDdLfBNRcPhqC5Ft2Rtpk34Rnzg+aPT5H2g
	 eKLupQaibN/IqCE0KnSvkbgsqifl7WK1hnriiDtxFOyYWOhzZpJ3CF0aIAckchjbNT
	 7eq7s9EFnRftIW6JJWXEKZBak+/mnWAPTMFSLuiw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0CCE5F80232;
	Sun, 14 Jun 2020 16:12:41 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8AA39F8022B; Sun, 14 Jun 2020 16:12:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com
 [64.147.123.19])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9BBEDF8013E
 for <alsa-devel@alsa-project.org>; Sun, 14 Jun 2020 16:12:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9BBEDF8013E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="jjfnwgSa"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="oipZRpWp"
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailout.west.internal (Postfix) with ESMTP id 8347D416;
 Sun, 14 Jun 2020 10:12:26 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Sun, 14 Jun 2020 10:12:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding; s=fm1; bh=nBIC+PLqwTkQrZ3gAHqy+pfmMU
 9RFLc9ILWtzzC9oh4=; b=jjfnwgSaCGh5ReqsNnf2MWheZdqq9QDJzXfqL67zUX
 buOGsKanOVjY8HlJmSVc+ISh70FSH8x9bZSVaVcSrVZ5TOgdP3WU2cP4R5cWQPYK
 eTTQJ+jBYJ70KGxjm09pDDyDljr3hMgmRvPMMe1Xb51sOYSkHGxBAHWEAr5wG5i1
 BrAqyUqcyqD7h2EEqnIFFqFtqsC04B10ApCI/rSLwlirYZBCE8xRC7vSH5Kz7BRm
 f9HIC4zEYYsZa5nC5IMzhbsoA1m9g78EFAvk3Mr3Pngz4w3FYjAqGUJsHdt+FLRp
 x33CuokUsczkkYk6odHfQu4UBklayFIrV6TMFAsN0wUQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=nBIC+PLqwTkQrZ3gA
 Hqy+pfmMU9RFLc9ILWtzzC9oh4=; b=oipZRpWp9g8sGO99T0H2XbX32O+Yh0i7X
 UTj4JsoNrNTkWTWHtW6I6CUBZDOaiP2qOee+z/Sb/+jQIDeO0ERitBUwROYirl2v
 hJLurJ9/k02mMJUTJwOmNYBkNksiqjRlSKpnUxIm0PdZrQ4h0H4CZVoHjqI6gmg/
 kRxmE4EkNURJerfRCQwzCSHKM92Pqx2c6K24QP12flactALZiEVVvCeH8PuYjvDl
 578plUGHv3dBYHg9A+31TUlcz+ctvhCMHrag/wYhQa1ZLNf+wPnLR7oYu3V5+NXm
 iPKo9kmp5EekYjwwi7/zTZ9DaW70+n4A0f1eQiWWh3YB4VcLptvpg==
X-ME-Sender: <xms:STDmXgR-5UsNkVehKPNz0oHZn4u6KRXa8viWWyT6605ChSb2VeM-Dg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrudeiiedgjeeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgggfestdekredtre
 dttdenucfhrhhomhepvfgrkhgrshhhihcuufgrkhgrmhhothhouceoohdqthgrkhgrshhh
 ihesshgrkhgrmhhotggthhhirdhjpheqnecuggftrfgrthhtvghrnhepudejteelhfdttd
 ekgfdtueeilefhgfetjeejheekgeevuddvveegieehueeukeejnecukfhppedukedtrddv
 feehrdefrdehgeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfh
 hrohhmpehoqdhtrghkrghshhhisehsrghkrghmohgttghhihdrjhhp
X-ME-Proxy: <xmx:STDmXtxblGv7lMDEtyi2E9omBIDvf4qr4PDIUQw67PRuoySb-4V_EQ>
 <xmx:STDmXt0c44aI_kEI8ozGIQ7HNowVa8TI29Jsm2VsSQj6NAhUk-v-lg>
 <xmx:STDmXkBEQQEirSyUj1d9vbGGD3f_-PtasV1kukDZrK4EpVovPqNbmQ>
 <xmx:SjDmXjeuvV1opyflP7Y6MsONxEaCnS_q7xXxy0q22uXbtorSuJZfrg>
Received: from workstation.flets-east.jp (ad003054.dynamic.ppp.asahi-net.or.jp
 [180.235.3.54])
 by mail.messagingengine.com (Postfix) with ESMTPA id 5DBFB328005E;
 Sun, 14 Jun 2020 10:12:24 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: tiwai@suse.de
Subject: [PATCH] ALSA: firewire-motu: wait for notification when changing
 clock configuration for protocol v3
Date: Sun, 14 Jun 2020 23:12:21 +0900
Message-Id: <20200614141221.53527-1-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, clemens@ladisch.de
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

This patch is for development period of v5.9 kernel.

It costs expensive to change clock configuration for models of protocol
version 3. In current implementation, speculative strategy is used to
finish the operation; just waiting for 4 seconds. As long as I investigate,
when accepting and changing clock status actually, the device sends
notification with mask.

This commit uses wise way to wait for the notification after changing
sampling clock rate during 4 seconds.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 sound/firewire/motu/motu-protocol-v3.c | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/sound/firewire/motu/motu-protocol-v3.c b/sound/firewire/motu/motu-protocol-v3.c
index 01a47ac7bb2d..4e6b0e449ee4 100644
--- a/sound/firewire/motu/motu-protocol-v3.c
+++ b/sound/firewire/motu/motu-protocol-v3.c
@@ -24,6 +24,9 @@
 #define  V3_NO_ADAT_OPT_OUT_IFACE_A	0x00040000
 #define  V3_NO_ADAT_OPT_OUT_IFACE_B	0x00400000
 
+#define V3_MSG_FLAG_CLK_CHANGED		0x00000002
+#define V3_CLK_WAIT_MSEC		4000
+
 int snd_motu_protocol_v3_get_clock_rate(struct snd_motu *motu,
 					unsigned int *rate)
 {
@@ -79,9 +82,16 @@ int snd_motu_protocol_v3_set_clock_rate(struct snd_motu *motu,
 		return err;
 
 	if (need_to_wait) {
-		/* Cost expensive. */
-		if (msleep_interruptible(4000) > 0)
-			return -EINTR;
+		int result;
+
+		motu->msg = 0;
+		result = wait_event_interruptible_timeout(motu->hwdep_wait,
+					motu->msg & V3_MSG_FLAG_CLK_CHANGED,
+					msecs_to_jiffies(V3_CLK_WAIT_MSEC));
+		if (result < 0)
+			return result;
+		if (result == 0)
+			return -ETIMEDOUT;
 	}
 
 	return 0;
-- 
2.25.1

