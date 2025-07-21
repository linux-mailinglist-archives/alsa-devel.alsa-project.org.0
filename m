Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2978EB0BB84
	for <lists+alsa-devel@lfdr.de>; Mon, 21 Jul 2025 05:48:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 561D5601F5;
	Mon, 21 Jul 2025 05:48:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 561D5601F5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1753069726;
	bh=7Rm57k7veSjdFO+a4h/wJrro/UFyvV0kiCpihtzRLNo=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=JWsR9YpoxyBfvI3L4HtwYLzyC1mJ6sTOMhJ6QgV885IXIHLt8TAh/wtXfc3b9mrTt
	 YJF8Nc/tF3FvCDN5D1ZXiz/UxeT0c9e86CJnsbVBCiODd5v0H7IwBYHSnOvNCcizVg
	 MtHaYjKbR78btO74AchVLLIObMfvWYfPKFtycoh4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0E8F5F805C5; Mon, 21 Jul 2025 05:48:22 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 96E31F8052D;
	Mon, 21 Jul 2025 05:48:22 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4C77AF8025F; Mon, 21 Jul 2025 05:47:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	RCVD_IN_MSPIKE_H2,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id CE02CF800AC
	for <alsa-devel@alsa-project.org>; Mon, 21 Jul 2025 05:47:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CE02CF800AC
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256
 header.s=dkim header.b=KTygal08
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 56L3lboR71918134,
 This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1753069658; bh=K5njW+HHNFQpe615bI1y8J4R5fmwrGlCWaIW0ZLlUe0=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:
	 Content-Transfer-Encoding:Content-Type;
	b=KTygal08rnsGhyrR4c++WI8bIzmMqnZ1OI7gQGkJQYQ6OsFFvmaxNmwISMfl5ZRYX
	 GkMl8YULQTSi92QFL6/eKmIufgwEAwnfHt6pC25GNK+iuhRYD0/ZzYo6ftCXJ7/qam
	 Wwf4PydFxx/P7adb1tcSCHR9tKwt9/Nlk8GgW6QOizq2DhEud9v6tcnlzk4tJ37dbB
	 CTippfO0EBK1JEfybUPWRw/3RjKlgYxDG+HlQsBak01lmvo529HPt3g2c5qPNUqyte
	 bvMlLMMlKtfQfDmge0P8rB3SRty+oPvL1Kq4ejL3ZUEYdEcb9hZc2jfGOSI4GaMOvv
	 YmrhHcFjAU80w==
Received: from mail.realtek.com (rtkexhmbs03.realtek.com.tw[10.21.1.53])
	by rtits2.realtek.com.tw (8.15.2/3.13/5.93) with ESMTPS id 56L3lboR71918134
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 21 Jul 2025 11:47:37 +0800
Received: from RTEXMBS01.realtek.com.tw (172.21.6.94) by
 RTKEXHMBS03.realtek.com.tw (10.21.1.53) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Mon, 21 Jul 2025 11:47:38 +0800
Received: from localhost.localdomain (172.22.102.113) by
 RTEXMBS01.realtek.com.tw (172.21.6.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 21 Jul 2025 11:47:37 +0800
From: <derek.fang@realtek.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>
CC: <alsa-devel@alsa-project.org>, <lars@metafoo.de>, <flove@realtek.com>,
        <oder_chiou@realtek.com>, <jack.yu@realtek.com>,
        <shumingf@realtek.com>, Derek Fang <derek.fang@realtek.com>
Subject: [PATCH RESEND] ASoC: rt5650: Eliminate the high frequency glitch
Date: Mon, 21 Jul 2025 11:47:28 +0800
Message-ID: <20250721034728.1396238-1-derek.fang@realtek.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.22.102.113]
X-ClientProxiedBy: RTEXH36505.realtek.com.tw (172.21.6.25) To
 RTEXMBS01.realtek.com.tw (172.21.6.94)
X-KSE-ServerInfo: RTEXMBS01.realtek.com.tw, 9
X-KSE-AntiSpam-Interceptor-Info: fallback
X-KSE-Antivirus-Interceptor-Info: fallback
X-KSE-AntiSpam-Interceptor-Info: fallback
Message-ID-Hash: RI544XUYEISKMTMDZEPYLE5NXSABUM7H
X-Message-ID-Hash: RI544XUYEISKMTMDZEPYLE5NXSABUM7H
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/RI544XUYEISKMTMDZEPYLE5NXSABUM7H/>
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

