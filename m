Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A05EDB0009F
	for <lists+alsa-devel@lfdr.de>; Thu, 10 Jul 2025 13:35:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F282760176;
	Thu, 10 Jul 2025 13:35:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F282760176
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1752147318;
	bh=7Rm57k7veSjdFO+a4h/wJrro/UFyvV0kiCpihtzRLNo=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=H3lGe3T1OIiOkBkLs/QLktFibyxmU1V3szKQ1jP82fai61hXFHo/PQuZHnryN0Fgz
	 /o9ewkKEaxgiR2ANzvPZu2U0qiRwMY4amYV9/jVusLrb7N1llsldntKE0Z4nQ+Ul6A
	 xvOmgREt6ASTs5NtE1YofG+QoAuNyKUo50C5Fx/E=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9D4A7F805C3; Thu, 10 Jul 2025 13:34:42 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 76883F80527;
	Thu, 10 Jul 2025 13:34:41 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4715EF80526; Thu, 10 Jul 2025 13:34:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0E5C1F804B2
	for <alsa-devel@alsa-project.org>; Thu, 10 Jul 2025 13:34:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0E5C1F804B2
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256
 header.s=dkim header.b=eBprP0A/
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 56ABYC2H02949641,
 This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1752147252; bh=K5njW+HHNFQpe615bI1y8J4R5fmwrGlCWaIW0ZLlUe0=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:
	 Content-Transfer-Encoding:Content-Type;
	b=eBprP0A/XdmnO5+cHOWHLri62bqMBD9lHU7vYrdFvn2XDj8cXjU7Li0gWRMms7aXb
	 dAurUG99blS+BpfAGm2E5Km+9E9QRbimgx64cp3Tz3jQo6k/KDHFUBP8XjLgysLktO
	 ikT+BRj+UeCt02XAm2bhhUTRFAIcVVmb37FfYngpgJsTahYS0R3wB/1kgHvO5BMgNk
	 XKdpxqIvxHfQG9sRm1QlY1kgm77zs14uFxkZVKHmQ73b/tVwWv1CeYuJ/0Np6OGt+A
	 PzwYwOZxWQIxn1pT6WfO3PN+ytlKuE/YMSaO2yOf2dezxuFrhHOmlrx3ZoavUpeZAF
	 wb0Al20syUgiw==
Received: from mail.realtek.com (rtkexhmbs03.realtek.com.tw[10.21.1.53])
	by rtits2.realtek.com.tw (8.15.2/3.13/5.93) with ESMTPS id 56ABYC2H02949641
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 10 Jul 2025 19:34:12 +0800
Received: from RTEXMBS01.realtek.com.tw (172.21.6.94) by
 RTKEXHMBS03.realtek.com.tw (10.21.1.53) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Thu, 10 Jul 2025 19:34:12 +0800
Received: from localhost.localdomain (172.22.102.113) by
 RTEXMBS01.realtek.com.tw (172.21.6.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 10 Jul 2025 19:34:11 +0800
From: <derek.fang@realtek.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>
CC: <alsa-devel@alsa-project.org>, <lars@metafoo.de>, <flove@realtek.com>,
        <oder_chiou@realtek.com>, <jack.yu@realtek.com>,
        <shumingf@realtek.com>, <albertchen@realtek.com>,
        <nico_cui@realsil.com.cn>, Derek Fang
	<derek.fang@realtek.com>
Subject: [PATCH] ASoC: rt5650: Eliminate the high frequency glitch
Date: Thu, 10 Jul 2025 19:34:02 +0800
Message-ID: <20250710113402.23334-1-derek.fang@realtek.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.22.102.113]
X-ClientProxiedBy: RTEXH36506.realtek.com.tw (172.21.6.27) To
 RTEXMBS01.realtek.com.tw (172.21.6.94)
X-KSE-ServerInfo: RTEXMBS01.realtek.com.tw, 9
X-KSE-AntiSpam-Interceptor-Info: fallback
X-KSE-Antivirus-Interceptor-Info: fallback
X-KSE-AntiSpam-Interceptor-Info: fallback
Message-ID-Hash: T5ITXCSSNQWYBJBUZQCEAW7DVZQTRON5
X-Message-ID-Hash: T5ITXCSSNQWYBJBUZQCEAW7DVZQTRON5
X-MailFrom: derek.fang@realtek.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/T5ITXCSSNQWYBJBUZQCEAW7DVZQTRON5/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Derek Fang <derek.fang@realtek.com>

The glitch was detected in the high frequency of the HP playback.
This patch adjusts the DAC dither setting to avoid this situation
for almost all cases.

Signed-off-by: Derek Fang <derek.fang@realtek.com>
---
 sound/soc/codecs/rt5645.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/codecs/rt5645.c b/sound/soc/codecs/rt5645.c
index 08df87238..29a403526 100644
--- a/sound/soc/codecs/rt5645.c
+++ b/sound/soc/codecs/rt5645.c
@@ -82,6 +82,7 @@ static const struct reg_sequence rt5650_init_list[] = {
 	{0xf6,	0x0100},
 	{RT5645_PWR_ANLG1, 0x02},
 	{RT5645_IL_CMD3, 0x6728},
+	{RT5645_PR_BASE + 0x3a,	0x0000},
 };
 
 static const struct reg_default rt5645_reg[] = {
-- 
2.34.1

