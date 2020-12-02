Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 59AF32CB2B0
	for <lists+alsa-devel@lfdr.de>; Wed,  2 Dec 2020 03:15:44 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EC2F71792;
	Wed,  2 Dec 2020 03:14:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EC2F71792
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1606875344;
	bh=CoEcFWRXktBqqOp91ap6kqh5CkhF3PoECmmKhRW0uGo=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=EM1RrC9BSWz8nBMGhDaIaq1OMewSbvflqQQPgYFq65WKwPfP0+KOwrZDMaMiMwMyK
	 bt+ungYUd+pNIT2Zr2izA9UxEaM5zh7+Ix2iz+iJQDBjhGoma8FUgsOC1Tp7TnhKY0
	 2C6LPtVFpNDKwzBJef0J5yTwQ6NhQ86aoPMaiDL8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A2093F804C3;
	Wed,  2 Dec 2020 03:13:59 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BB219F804C3; Wed,  2 Dec 2020 03:13:57 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 50CA5F8016C
 for <alsa-devel@alsa-project.org>; Wed,  2 Dec 2020 03:13:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 50CA5F8016C
Authenticated-By: 
X-SpamFilter-By: ArmorX SpamTrap 5.73 with qID 0B22DhnW6000791,
 This message is accepted by code: ctloc85258
Received: from mail.realtek.com (rtexmb06.realtek.com.tw[172.21.6.99])
 by rtits2.realtek.com.tw (8.15.2/2.70/5.88) with ESMTPS id 0B22DhnW6000791
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Wed, 2 Dec 2020 10:13:43 +0800
Received: from RTEXMBS01.realtek.com.tw (172.21.6.36) by
 RTEXMB06.realtek.com.tw (172.21.6.99) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2044.4; Wed, 2 Dec 2020 10:13:43 +0800
Received: from localhost.localdomain (172.22.102.1) by
 RTEXMBS01.realtek.com.tw (172.21.6.36) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Wed, 2 Dec 2020 10:13:42 +0800
From: <jack.yu@realtek.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>
Subject: [PATCH] ASoC: rt715: remove unused parameter
Date: Wed, 2 Dec 2020 10:13:36 +0800
Message-ID: <20201202021336.3591-1-jack.yu@realtek.com>
X-Mailer: git-send-email 2.29.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.22.102.1]
X-ClientProxiedBy: RTEXMB01.realtek.com.tw (172.21.6.94) To
 RTEXMBS01.realtek.com.tw (172.21.6.36)
Cc: oder_chiou@realtek.com, Jack Yu <jack.yu@realtek.com>,
 alsa-devel@alsa-project.org, lars@metafoo.de, derek.fang@realtek.com,
 flove@realtek.com, shumingf@realtek.com, bard.liao@intel.com
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

From: Jack Yu <jack.yu@realtek.com>

Remove unused parameter in rt715.h.

Signed-off-by: Jack Yu <jack.yu@realtek.com>
---
 sound/soc/codecs/rt715.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/sound/soc/codecs/rt715.h b/sound/soc/codecs/rt715.h
index d0d0fd2a6fdb..009a8266f606 100644
--- a/sound/soc/codecs/rt715.h
+++ b/sound/soc/codecs/rt715.h
@@ -207,7 +207,6 @@ struct sdw_stream_data {
 enum {
 	RT715_AIF1,
 	RT715_AIF2,
-	RT715_AIFS,
 };
 
 #define RT715_POWER_UP_DELAY_MS 400
-- 
2.29.0

