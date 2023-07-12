Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B70374FF27
	for <lists+alsa-devel@lfdr.de>; Wed, 12 Jul 2023 08:27:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DD5136C1;
	Wed, 12 Jul 2023 08:26:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DD5136C1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689143250;
	bh=00+0Gxd8duQ6wfhtDxedJdodzB3i5sTRwhMxsdEfHMA=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=rOfAd8bA3/AYwS3x0Wi0wyLqihk4JH2Y8x2COPXtwP27z6CzbXr6dQZ6an4N0kiEc
	 /dDOPN3vQCP53/XJNdGysDloXfDhcgQaxFE37B2cFX9wPgqzkVQqnpb72JqAhJU+/r
	 XAzn7v4C/7KBauWPXUsgdDKzlE4bnZsEFtkfbooc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 577FDF800D2; Wed, 12 Jul 2023 08:26:19 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D6D4BF80153;
	Wed, 12 Jul 2023 08:26:18 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 772D2F80236; Wed, 12 Jul 2023 08:26:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	by alsa1.perex.cz (Postfix) with ESMTP id 911F1F80093
	for <alsa-devel@alsa-project.org>; Wed, 12 Jul 2023 08:26:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 911F1F80093
Authenticated-By: 
X-SpamFilter-By: ArmorX SpamTrap 5.77 with qID 36C6Ps3A2020614,
 This message is accepted by code: ctloc85258
Received: from mail.realtek.com (rtexh36505.realtek.com.tw[172.21.6.25])
	by rtits2.realtek.com.tw (8.15.2/2.81/5.90) with ESMTPS id 36C6Ps3A2020614
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=FAIL);
	Wed, 12 Jul 2023 14:25:54 +0800
Received: from RTEXMBS01.realtek.com.tw (172.21.6.94) by
 RTEXH36505.realtek.com.tw (172.21.6.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.32; Wed, 12 Jul 2023 14:26:00 +0800
Received: from localhost.localdomain (172.22.102.115) by
 RTEXMBS01.realtek.com.tw (172.21.6.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.7; Wed, 12 Jul 2023 14:25:59 +0800
From: <derek.fang@realtek.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>
CC: <alsa-devel@alsa-project.org>, <lars@metafoo.de>, <flove@realtek.com>,
        <oder_chiou@realtek.com>, <jack.yu@realtek.com>,
        <shumingf@realtek.com>, <albertchen@realtek.com>,
        <wen_chun@realtek.com>, Derek Fang
	<derek.fang@realtek.com>
Subject: [PATCH] ASoC: rt5640: Fix the issue of speaker noise
Date: Wed, 12 Jul 2023 14:25:53 +0800
Message-ID: <20230712062553.31066-1-derek.fang@realtek.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [172.22.102.115]
X-ClientProxiedBy: RTEXH36506.realtek.com.tw (172.21.6.27) To
 RTEXMBS01.realtek.com.tw (172.21.6.94)
X-KSE-ServerInfo: RTEXMBS01.realtek.com.tw, 9
X-KSE-AntiSpam-Interceptor-Info: fallback
X-KSE-Antivirus-Interceptor-Info: fallback
X-KSE-AntiSpam-Interceptor-Info: fallback
X-KSE-ServerInfo: RTEXH36505.realtek.com.tw, 9
X-KSE-AntiSpam-Interceptor-Info: fallback
X-KSE-Antivirus-Interceptor-Info: fallback
X-KSE-AntiSpam-Interceptor-Info: fallback
Message-ID-Hash: IAEBJBGGB6JZPWSL5E7D6ARE7OTCK426
X-Message-ID-Hash: IAEBJBGGB6JZPWSL5E7D6ARE7OTCK426
X-MailFrom: derek.fang@realtek.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/IAEBJBGGB6JZPWSL5E7D6ARE7OTCK426/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Derek Fang <derek.fang@realtek.com>

Remove the class-D internal register setting during initialization
to be compatible with most speaker designs to avoid noise.

Signed-off-by: Derek Fang <derek.fang@realtek.com>
---
 sound/soc/codecs/rt5640.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/sound/soc/codecs/rt5640.c b/sound/soc/codecs/rt5640.c
index e24ed754ac56..eceed8209787 100644
--- a/sound/soc/codecs/rt5640.c
+++ b/sound/soc/codecs/rt5640.c
@@ -53,7 +53,6 @@ static const struct reg_sequence init_list[] = {
 	{RT5640_PR_BASE + 0x3d,	0x3600},
 	{RT5640_PR_BASE + 0x12,	0x0aa8},
 	{RT5640_PR_BASE + 0x14,	0x0aaa},
-	{RT5640_PR_BASE + 0x20,	0x6110},
 	{RT5640_PR_BASE + 0x21,	0xe0e0},
 	{RT5640_PR_BASE + 0x23,	0x1804},
 };
-- 
2.17.1

