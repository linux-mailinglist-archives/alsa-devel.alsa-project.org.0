Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A5E8C75C16A
	for <lists+alsa-devel@lfdr.de>; Fri, 21 Jul 2023 10:22:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3E40FEA9;
	Fri, 21 Jul 2023 10:21:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3E40FEA9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689927744;
	bh=gv4A6GoJm7cnDpvJiFK9UQAjcmo12Xqn3pFfl+YIi3Y=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=Ns4gEl5dVV/wglHmvtSOMPZ0UeWqv8++evqxgoc3zGcc/yEyMVhWu0DwrMjlPZqw5
	 UPgCn2LSoigXSwF9wH3wfAbrqS/ynRBsuHpz/B8O/oPJ7s8I+JCJrVlu/QEvjk9NhE
	 ZkL1JKZNebx51Jrd20dZSLeoEkUkVvx7fEyk1EOo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DAA82F804DA; Fri, 21 Jul 2023 10:18:18 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 648B7F8047D;
	Fri, 21 Jul 2023 10:18:18 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5731FF8047D; Fri, 21 Jul 2023 10:18:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	by alsa1.perex.cz (Postfix) with ESMTP id EF3C4F800D2
	for <alsa-devel@alsa-project.org>; Fri, 21 Jul 2023 10:18:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EF3C4F800D2
Authenticated-By: 
X-SpamFilter-By: ArmorX SpamTrap 5.77 with qID 36L8HoDA2028859,
 This message is accepted by code: ctloc85258
Received: from mail.realtek.com (rtexh36505.realtek.com.tw[172.21.6.25])
	by rtits2.realtek.com.tw (8.15.2/2.81/5.90) with ESMTPS id 36L8HoDA2028859
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=FAIL);
	Fri, 21 Jul 2023 16:17:50 +0800
Received: from RTEXMBS01.realtek.com.tw (172.21.6.94) by
 RTEXH36505.realtek.com.tw (172.21.6.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.32; Fri, 21 Jul 2023 16:18:00 +0800
Received: from ubuntu.localdomain (172.22.102.209) by RTEXMBS01.realtek.com.tw
 (172.21.6.94) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.7; Fri, 21 Jul
 2023 16:18:00 +0800
From: <shumingf@realtek.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>
CC: <alsa-devel@alsa-project.org>, <lars@metafoo.de>, <flove@realtek.com>,
        <oder_chiou@realtek.com>, <jack.yu@realtek.com>,
        <derek.fang@realtek.com>, <Vijendar.Mukunda@amd.com>,
        Shuming Fan <shumingf@realtek.com>
Subject: [PATCH 1/2] ASoC: rt1316: support the different base clock frequency
Date: Fri, 21 Jul 2023 16:17:51 +0800
Message-ID: <20230721081751.113106-1-shumingf@realtek.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.22.102.209]
X-ClientProxiedBy: RTEXH36505.realtek.com.tw (172.21.6.25) To
 RTEXMBS01.realtek.com.tw (172.21.6.94)
X-KSE-ServerInfo: RTEXMBS01.realtek.com.tw, 9
X-KSE-AntiSpam-Interceptor-Info: fallback
X-KSE-Antivirus-Interceptor-Info: fallback
X-KSE-AntiSpam-Interceptor-Info: fallback
X-KSE-ServerInfo: RTEXH36505.realtek.com.tw, 9
X-KSE-AntiSpam-Interceptor-Info: fallback
X-KSE-Antivirus-Interceptor-Info: fallback
X-KSE-AntiSpam-Interceptor-Info: fallback
Message-ID-Hash: 4OSPAE5ZZ3GRIYXS45L5K6VQAODJATA5
X-Message-ID-Hash: 4OSPAE5ZZ3GRIYXS45L5K6VQAODJATA5
X-MailFrom: shumingf@realtek.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4OSPAE5ZZ3GRIYXS45L5K6VQAODJATA5/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Shuming Fan <shumingf@realtek.com>

This patch configures all PLL settings to support the all of base clock frequencies.

Signed-off-by: Shuming Fan <shumingf@realtek.com>
---
 sound/soc/codecs/rt1316-sdw.c | 23 ++++++++++++++++++++++-
 1 file changed, 22 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/rt1316-sdw.c b/sound/soc/codecs/rt1316-sdw.c
index 721821d9e9af..ce2246a2591c 100644
--- a/sound/soc/codecs/rt1316-sdw.c
+++ b/sound/soc/codecs/rt1316-sdw.c
@@ -76,6 +76,27 @@ static const struct reg_sequence rt1316_blind_write[] = {
 	{ 0xc713, 0x06 },
 	{ 0xc714, 0x80 },
 	{ 0xc715, 0x06 },
+	{ 0xc720, 0x17 },
+	{ 0xc721, 0x00 },
+	{ 0xc722, 0x3e },
+	{ 0xc723, 0x06 },
+	{ 0xc724, 0x80 },
+	{ 0xc725, 0x06 },
+	{ 0xc730, 0x06 },
+	{ 0xc731, 0x00 },
+	{ 0xc732, 0x3E },
+	{ 0xc740, 0x13 },
+	{ 0xc741, 0x80 },
+	{ 0xc742, 0x30 },
+	{ 0xc743, 0x06 },
+	{ 0xc744, 0x05 },
+	{ 0xc745, 0x1E },
+	{ 0xc750, 0x17 },
+	{ 0xc751, 0x00 },
+	{ 0xc752, 0x2E },
+	{ 0xc753, 0x06 },
+	{ 0xc754, 0x80 },
+	{ 0xc755, 0x06 },
 	{ 0xc702, 0x0a },
 	{ 0xc703, 0x0a },
 	{ 0xc001, 0x45 },
@@ -88,7 +109,7 @@ static const struct reg_sequence rt1316_blind_write[] = {
 	{ 0xc008, 0x11 },
 	{ 0xc009, 0x00 },
 
-	{ 0x2f0a, 0x00 },
+	{ 0x2f0a, 0x01 },
 	{ 0xd101, 0xf0 },
 	{ 0xd103, 0x9b },
 	{ 0x2f36, 0x8e },
-- 
2.34.1

