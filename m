Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 87A981F7362
	for <lists+alsa-devel@lfdr.de>; Fri, 12 Jun 2020 07:18:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3AC5C1678;
	Fri, 12 Jun 2020 07:18:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3AC5C1678
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1591939138;
	bh=HLyQwD3CAKmly+k87Yd28TNCs7HKSIf7GvQkOuFhf7U=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=f6wmB1Zye1CndKCFaSLBFlAwu11Dt1RO5/WEqOFV4OpSwk5mI+X8QmhmywawlypFn
	 pDf4Olan/AMD8jYFmFbMJBJMvG9Ovq0/92VoCddsTmfcAOEOvERU7Oa0UuM+5ajk0h
	 2xW91R/jSoK8ycyVzsyJCouqL1BC8JMIgcfKWb0o=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 90F79F80228;
	Fri, 12 Jun 2020 07:16:19 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0F280F8021E; Fri, 12 Jun 2020 07:16:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9A3D2F8021E
 for <alsa-devel@alsa-project.org>; Fri, 12 Jun 2020 07:16:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9A3D2F8021E
Authenticated-By: 
X-SpamFilter-By: ArmorX SpamTrap 5.69 with qID 05C5FtvZ6027415,
 This message is accepted by code: ctloc85258
Received: from mail.realtek.com (rtexmb06.realtek.com.tw[172.21.6.99])
 by rtits2.realtek.com.tw (8.15.2/2.66/5.86) with ESMTPS id 05C5FtvZ6027415
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Fri, 12 Jun 2020 13:15:55 +0800
Received: from RTEXMB01.realtek.com.tw (172.21.6.94) by
 RTEXMB06.realtek.com.tw (172.21.6.99) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1779.2; Fri, 12 Jun 2020 13:15:55 +0800
Received: from derek-pvm.localdomain (172.22.234.205) by
 RTEXMB01.realtek.com.tw (172.21.6.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1779.2; Fri, 12 Jun 2020 13:15:54 +0800
From: <derek.fang@realtek.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>
Subject: [PATCH 2/5] ASoC: rl6231: Add new supports on rl6231
Date: Fri, 12 Jun 2020 13:15:22 +0800
Message-ID: <1591938925-1070-2-git-send-email-derek.fang@realtek.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1591938925-1070-1-git-send-email-derek.fang@realtek.com>
References: <1591938925-1070-1-git-send-email-derek.fang@realtek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [172.22.234.205]
X-ClientProxiedBy: RTEXMB05.realtek.com.tw (172.21.6.98) To
 RTEXMB01.realtek.com.tw (172.21.6.94)
Cc: oder_chiou@realtek.com, jack.yu@realtek.com, alsa-devel@alsa-project.org,
 lars@metafoo.de, albertchen@realtek.com, derek.fang@realtek.com,
 shumingf@realtek.com, flove@realtek.com
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

From: "derek.fang" <derek.fang@realtek.com>

Add pll preset maps for Realtek codecs' PLL2 freq conversions.

Signed-off-by: derek.fang <derek.fang@realtek.com>
---
 sound/soc/codecs/rl6231.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/soc/codecs/rl6231.c b/sound/soc/codecs/rl6231.c
index 8c9daf3..d1fc170 100644
--- a/sound/soc/codecs/rl6231.c
+++ b/sound/soc/codecs/rl6231.c
@@ -103,7 +103,9 @@ struct pll_calc_map {
 static const struct pll_calc_map pll_preset_table[] = {
 	{19200000,  4096000,  23, 14, 1, false, false},
 	{19200000,  24576000,  3, 30, 3, false, false},
+	{48000000,  3840000,  23,  2, 0, false, false},
 	{3840000,   24576000,  3, 30, 0, true, false},
+	{3840000,   22579200,  3,  5, 0, true, false},
 };
 
 static unsigned int find_best_div(unsigned int in,
-- 
2.7.4

