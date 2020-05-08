Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A7DE1CA253
	for <lists+alsa-devel@lfdr.de>; Fri,  8 May 2020 06:39:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2B2E8183C;
	Fri,  8 May 2020 06:38:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2B2E8183C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1588912761;
	bh=pKr6L2XaTOrLhn0/20UBxU7IzEmQMjk8Fc2/g+C9c4g=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=h2a/B2rzoaXEOfYDgkzASBaEM15CysxI54KCh0kNZPujNltiB3Xd6YnnDidWNxsPD
	 h5EuQ1Oxryz0sBVLuQKX2va1XynDzW96cjdsYs/ADg0VT1q73s/gRwOlhyUtadTtP/
	 NTgxacZZDVOLrdxEMjIFvAwB2KWy83WdTUzCDRbM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3EF43F80234;
	Fri,  8 May 2020 06:36:58 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D0F55F8027B; Fri,  8 May 2020 06:36:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CB3A1F8023E
 for <alsa-devel@alsa-project.org>; Fri,  8 May 2020 06:36:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CB3A1F8023E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="TZ9rK4p4"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="GwJSNunF"
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailout.west.internal (Postfix) with ESMTP id 15E0DAE3;
 Fri,  8 May 2020 00:36:41 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Fri, 08 May 2020 00:36:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=PRXd2/cuX0Crt
 uJcFv6qWBQBxO9uoAvlgC7Kuandmsc=; b=TZ9rK4p4DBejCr9qQNXuWtl1iV4ko
 jowqEzy1RTHpA33d6PAQkn2EwH2WX7CHhsCXBb6BbtiiZx8OWrEQlcmc/08peyBG
 TBSjAE5Z8L2hmLXNJWzXWU1/5ZFDZySyNFIzQxA2fRqXPkSQrEVVoz62sPovy0z3
 sjEqtFQ1ikxOObtaLeZAQfB/OdzvOUtubPfGOhr4Ach+XIfxbzskNGdBe2qIDtcN
 WHvBCtUmv8RJN+xoGQNkBomUCy7vq3waZNRpeNtxVL2mD3erFgBeIjtx/AsVPcRd
 yIKgZQdk2V9vBb5HmAjnp8DABorBf/E9PC5xKB3DeFryKkyAZxKtq+jXQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=PRXd2/cuX0CrtuJcFv6qWBQBxO9uoAvlgC7Kuandmsc=; b=GwJSNunF
 gmFg1V2zZ90FriI8u6Y+ZwrsXdsrKFLsyk/3C6ADiy4vpn1R2K6yuRsrAsyPZU2/
 lXv92TbZRqXfuFraN2psbA0gyph+H5qOVkJOxsE11J46eObwXjOuDCz9pT6waxgH
 dpsiO0uGWXqsx9NLVcqv53WUPkhx04ifkfqJFDSHvlWAxJPgHfl8MvrsyVSFAs1A
 r/n9E+yKu1o8wuK4+VWk0ps7vxJqCxW91paCmwTTf+4J3gB0VrRHuo3L/JI/BqUi
 YHdKEBAZuHekOQammT2tJ75sTgd6fa/VAJCMsDSZuZTROCNfTyb6qCSG7GogwGoJ
 UDnzkGU5AifqOA==
X-ME-Sender: <xms:2OG0XlqQarDkKn_HorSJ1vlwZ46DeyFliyB6cZOnUZG5DUiQFllx6w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrkedugdekvdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtkeertd
 ertddtnecuhfhrohhmpefvrghkrghshhhiucfurghkrghmohhtohcuoehoqdhtrghkrghs
 hhhisehsrghkrghmohgttghhihdrjhhpqeenucggtffrrghtthgvrhhnpeevfefffeekte
 fgveegfeelheffhfeujedtjeevtefhkeevkedtjeejvddtjefhjeenucfkphepudektddr
 vdefhedrfedrheegnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilh
 hfrhhomhepohdqthgrkhgrshhhihesshgrkhgrmhhotggthhhirdhjph
X-ME-Proxy: <xmx:2OG0XvwCVbak9XoVee5nVFXxf110s1jeq30x1x0_ZM2YjuO6WWffSw>
 <xmx:2OG0XlFhhX-KRDJxw-MWlhorANZyS5PaMkwaNPmq1lQhX1YdzUmKGQ>
 <xmx:2OG0XnI1dxH2CM1l57oazmAMFYPpMJ66pv3LgKP_EPRKasSKo-2WDA>
 <xmx:2OG0XncruKFMqU959gvHyawTcBC0Ok528DKRRPrye-Vu4prlKjaHhw>
Received: from workstation.flets-east.jp (ad003054.dynamic.ppp.asahi-net.or.jp
 [180.235.3.54])
 by mail.messagingengine.com (Postfix) with ESMTPA id BB5CB3280069;
 Fri,  8 May 2020 00:36:39 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: clemens@ladisch.de,
	tiwai@suse.de
Subject: [PATCH 02/10] ALSA: firewire-lib: use macro for maximum value of
 second in 1394 OHCI isoc descriptor
Date: Fri,  8 May 2020 13:36:27 +0900
Message-Id: <20200508043635.349339-3-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200508043635.349339-1-o-takashi@sakamocchi.jp>
References: <20200508043635.349339-1-o-takashi@sakamocchi.jp>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

In descriptor of isochronous context in 1394 OHCI, the field of second
has 3 bit, thus the maximum value is 8. The value is used for correct
cycle calculation.

This commit replaces hard-coded value with macro to obsolete magic
number.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 sound/firewire/amdtp-stream.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/sound/firewire/amdtp-stream.c b/sound/firewire/amdtp-stream.c
index 37d38efb4c87..fcde01b54d11 100644
--- a/sound/firewire/amdtp-stream.c
+++ b/sound/firewire/amdtp-stream.c
@@ -20,6 +20,8 @@
 #define CYCLES_PER_SECOND	8000
 #define TICKS_PER_SECOND	(TICKS_PER_CYCLE * CYCLES_PER_SECOND)
 
+#define OHCI_MAX_SECOND		8
+
 /* Always support Linux tracing subsystem. */
 #define CREATE_TRACE_POINTS
 #include "amdtp-stream-trace.h"
@@ -680,8 +682,8 @@ static inline u32 compute_cycle_count(__be32 ctx_header_tstamp)
 static inline u32 increment_cycle_count(u32 cycle, unsigned int addend)
 {
 	cycle += addend;
-	if (cycle >= 8 * CYCLES_PER_SECOND)
-		cycle -= 8 * CYCLES_PER_SECOND;
+	if (cycle >= OHCI_MAX_SECOND * CYCLES_PER_SECOND)
+		cycle -= OHCI_MAX_SECOND * CYCLES_PER_SECOND;
 	return cycle;
 }
 
-- 
2.25.1

