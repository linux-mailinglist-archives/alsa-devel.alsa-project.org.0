Return-Path: <alsa-devel-bounces@alsa-project.org>
Delivered-To: lists+alsa-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id VRgmFenhimmTOgAAu9opvQ
	(envelope-from <alsa-devel-bounces@alsa-project.org>)
	for <lists+alsa-devel@lfdr.de>; Tue, 10 Feb 2026 08:44:41 +0100
X-Original-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D6D88118048
	for <lists+alsa-devel@lfdr.de>; Tue, 10 Feb 2026 08:44:40 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E6035601AF;
	Tue, 10 Feb 2026 08:44:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E6035601AF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1770709480;
	bh=VTeyvXtIr0ei7nbiJ0E5uYCjbmgKy8bz3CVeqNS0HRI=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=kJtZr5AOABaU0SznqdzaeP33kl1zBWKA9RnzkH2DqnF52vDAGJXC9Mi0FF8+gztJM
	 enAKuq5m2TftR9bi2yafO+ke6uEZNNKTEaWf44Zvvzvr5uN8OcC08/Us1ymyLKBFBB
	 lGLRc4hOQcV//0JO0iYeLXEDxa+Sga8Bk+kyv5w8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 82376F805EA; Tue, 10 Feb 2026 08:44:07 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 16723F805E5;
	Tue, 10 Feb 2026 08:44:07 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 31C00F801F7; Tue, 10 Feb 2026 08:43:58 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 730E0F80087
	for <alsa-devel@alsa-project.org>; Tue, 10 Feb 2026 08:43:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 730E0F80087
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256
 header.s=dkim header.b=YCDz49D9
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 61A7hdKR33295320,
 This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1770709419; bh=qIGkj9YdG7HxXAYAUuLKy1zy3WCVSP+8nAg6IGn9sTc=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:
	 Content-Transfer-Encoding:Content-Type;
	b=YCDz49D9OAbL44j6VQfGn5FjcyO64wsZZNJ5kFM30nBRukUfdQLcEONIPJIQCyEi8
	 PJyL1zscc3I860YpSoNm4PWtbCP21JUjW/JpGUWAR8bhvwEX3hZ17VEFWjjU1Swnxy
	 /8JmehQhGhgvUz6sVcTlAX6ksXD6om4CCE9dH0rG75M80IfvBZofAyW2UKdrrWyb9q
	 O0WhaIb7yvc0ivrsWWSOGha2oMC3psTZ6RyJAFspzKlG0mCWsqRZ/EI6Zz43VlvWgY
	 cux96OsVCSgRx4jgD+NdA3KpJN6qgy8lJtETvrqSdhLGHSIiqSBY6FIIC7cxqgsLj1
	 Yyp9pyvEqSvjQ==
Received: from mail.realtek.com (rtkexhmbs03.realtek.com.tw[10.21.1.53])
	by rtits2.realtek.com.tw (8.15.2/3.21/5.94) with ESMTPS id 61A7hdKR33295320
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 10 Feb 2026 15:43:39 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS03.realtek.com.tw (10.21.1.53) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Tue, 10 Feb 2026 15:43:38 +0800
Received: from RTKEXHMBS04.realtek.com.tw (10.21.1.54) by
 RTKEXHMBS06.realtek.com.tw (10.21.1.56) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Tue, 10 Feb 2026 15:43:38 +0800
Received: from sw-server.localdomain (172.24.54.4) by
 RTKEXHMBS04.realtek.com.tw (10.21.1.54) with Microsoft SMTP Server id
 15.2.1748.10 via Frontend Transport; Tue, 10 Feb 2026 15:43:38 +0800
From: <jack.yu@realtek.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>
CC: <alsa-devel@alsa-project.org>, <lars@metafoo.de>, <flove@realtek.com>,
        <oder_chiou@realtek.com>, <shumingf@realtek.com>,
        <derek.fang@realtek.com>, Jack Yu <jack.yu@realtek.com>
Subject: [PATCH] ASoC: rt721-sdca: Fix issue of fail to detect OMTP jack type
Date: Tue, 10 Feb 2026 15:43:35 +0800
Message-ID: <20260210074335.2337830-1-jack.yu@realtek.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Message-ID-Hash: GBLTV63L63B2CCSMZIV2BGZH47CVI22E
X-Message-ID-Hash: GBLTV63L63B2CCSMZIV2BGZH47CVI22E
X-MailFrom: jack.yu@realtek.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/GBLTV63L63B2CCSMZIV2BGZH47CVI22E/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.29 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[realtek.com,none];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[alsa-project.org:s=default,realtek.com:s=dkim];
	R_SPF_ALLOW(-0.20)[+mx];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:broonie@kernel.org,m:lgirdwood@gmail.com,m:alsa-devel@alsa-project.org,m:lars@metafoo.de,m:flove@realtek.com,m:oder_chiou@realtek.com,m:shumingf@realtek.com,m:derek.fang@realtek.com,m:jack.yu@realtek.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com];
	FORGED_SENDER(0.00)[jack.yu@realtek.com,alsa-devel-bounces@alsa-project.org];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[alsa-devel@alsa-project.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[alsa-devel@alsa-project.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[alsa-project.org:dkim,realtek.com:mid,realtek.com:dkim,realtek.com:email,alsa0.perex.cz:helo,alsa0.perex.cz:rdns];
	FROM_NEQ_ENVFROM(0.00)[jack.yu@realtek.com,alsa-devel-bounces@alsa-project.org];
	DKIM_TRACE(0.00)[alsa-project.org:+,realtek.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[alsa-devel];
	RCPT_COUNT_SEVEN(0.00)[9];
	FROM_NO_DN(0.00)[];
	ASN(0.00)[asn:16019, ipnet:77.48.128.0/17, country:CZ];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: D6D88118048
X-Rspamd-Action: no action

From: Jack Yu <jack.yu@realtek.com>

Add related HP-JD settings to fix issue of fail to detect
OMTP jack type.

Signed-off-by: Jack Yu <jack.yu@realtek.com>
---
 sound/soc/codecs/rt721-sdca.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/rt721-sdca.c b/sound/soc/codecs/rt721-sdca.c
index 8233532a1752..35960c225224 100644
--- a/sound/soc/codecs/rt721-sdca.c
+++ b/sound/soc/codecs/rt721-sdca.c
@@ -245,12 +245,12 @@ static void rt721_sdca_jack_preset(struct rt721_sdca_priv *rt721)
 	regmap_write(rt721->mbq_regmap, 0x5b10007, 0x2000);
 	regmap_write(rt721->mbq_regmap, 0x5B10017, 0x1b0f);
 	rt_sdca_index_write(rt721->mbq_regmap, RT721_CBJ_CTRL,
-		RT721_CBJ_A0_GAT_CTRL1, 0x2a02);
+		RT721_CBJ_A0_GAT_CTRL1, 0x2205);
 	rt_sdca_index_write(rt721->mbq_regmap, RT721_CAP_PORT_CTRL,
 		RT721_HP_AMP_2CH_CAL4, 0xa105);
 	rt_sdca_index_write(rt721->mbq_regmap, RT721_VENDOR_ANA_CTL,
 		RT721_UAJ_TOP_TCON14, 0x3b33);
-	regmap_write(rt721->mbq_regmap, 0x310400, 0x3023);
+	regmap_write(rt721->mbq_regmap, 0x310400, 0x3043);
 	rt_sdca_index_write(rt721->mbq_regmap, RT721_VENDOR_ANA_CTL,
 		RT721_UAJ_TOP_TCON14, 0x3f33);
 	rt_sdca_index_write(rt721->mbq_regmap, RT721_VENDOR_ANA_CTL,
-- 
2.52.0

