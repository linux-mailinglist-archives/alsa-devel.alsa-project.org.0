Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B7EEC989D7A
	for <lists+alsa-devel@lfdr.de>; Mon, 30 Sep 2024 10:58:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4F82B14E7;
	Mon, 30 Sep 2024 10:58:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4F82B14E7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1727686708;
	bh=W8XTp08FkJEgVPYA3ozRqhIFE9JSq8BBURzZUzljAr0=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=mWPseT/NO3FBHl7+CeP5bYEzY2KLqvyLfF4LU7deZFO7JxAMwtqlJuve7lUPrsFWa
	 FvDJCc1mFAfjaSgcRqfc9WPCZkYd89IkHHVNfAlrYCWmBunWnMbXC8nsHXQK5zJGRA
	 RsNbY96uM2TxtgnZbcY2uTlVA6W3c03N3d/zJQWY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 77339F805AE; Mon, 30 Sep 2024 10:57:57 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B915DF8057A;
	Mon, 30 Sep 2024 10:57:56 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F1333F80517; Mon, 30 Sep 2024 10:57:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_INVALID,DKIM_SIGNED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,RCVD_IN_VALIDITY_SAFE_BLOCKED,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=no
	autolearn_force=no version=3.4.6
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 48F58F80074
	for <alsa-devel@alsa-project.org>; Mon, 30 Sep 2024 10:57:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 48F58F80074
Authentication-Results: alsa1.perex.cz;
	dkim=temperror header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256
 header.s=dkim header.b=ide1Cz9H
X-SpamFilter-By: ArmorX SpamTrap 5.78 with qID 48U8vduD73460527,
 This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=realtek.com; s=dkim;
	t=1727686659; bh=W8XTp08FkJEgVPYA3ozRqhIFE9JSq8BBURzZUzljAr0=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:
	 Content-Transfer-Encoding:Content-Type;
	b=ide1Cz9HvRfGzPTijaoFBl08nvh6JnoAJXxe6uJB06SSxf9qb7qHF+QXsGH7Gyuxw
	 XF9b2sfFCY42TnYOAksCaaOLXRrfygxyUuw3+ZaNmS67q86L4zPDOs8Qmnqv7How4z
	 QBt8Jmuo5iEKi5KY4Kv9dWr1VPxN0EBNFT0qK93C5bZLVv22HRrAeHtImH6+1YbsY3
	 N2B7SLv9tn/okIBCROQr8Y74Sel0X+iVtzzC1L6B/BIK7srhJSZ918Q8B0Mrj6FX9f
	 mrJP7HUAtoFi880yQd/+sXIUT/tQ6L+SYN+WsiXNgKcfCk/CPDjts5+PU4AoYTRzhy
	 +iEuhVvZvLbSg==
Received: from mail.realtek.com (rtexh36506.realtek.com.tw[172.21.6.27])
	by rtits2.realtek.com.tw (8.15.2/3.05/5.92) with ESMTPS id 48U8vduD73460527
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 30 Sep 2024 16:57:39 +0800
Received: from RTEXMBS01.realtek.com.tw (172.21.6.94) by
 RTEXH36506.realtek.com.tw (172.21.6.27) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 30 Sep 2024 16:57:39 +0800
Received: from sw-server.localdomain (172.22.102.1) by
 RTEXMBS01.realtek.com.tw (172.21.6.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 30 Sep 2024 16:57:37 +0800
From: Oder Chiou <oder_chiou@realtek.com>
To: <tiwai@suse.de>
CC: <alsa-devel@alsa-project.org>, <kailang@realtek.com>, <flove@realtek.com>,
        <jennifer_chen@realtek.com>, <geans_chen@realsil.com.cn>,
        Oder Chiou
	<oder_chiou@realtek.com>
Subject: [PATCH] ALSA: hda/realtek: Fix the push button function for the
 ALC257
Date: Mon, 30 Sep 2024 16:57:31 +0800
Message-ID: <20240930085731.2871700-1-oder_chiou@realtek.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.22.102.1]
X-ClientProxiedBy: RTEXH36505.realtek.com.tw (172.21.6.25) To
 RTEXMBS01.realtek.com.tw (172.21.6.94)
X-KSE-ServerInfo: RTEXMBS01.realtek.com.tw, 9
X-KSE-AntiSpam-Interceptor-Info: fallback
X-KSE-Antivirus-Interceptor-Info: fallback
X-KSE-AntiSpam-Interceptor-Info: fallback
Message-ID-Hash: HPGGDBSMUINYLVXENPVHGM4JQQIBLBIA
X-Message-ID-Hash: HPGGDBSMUINYLVXENPVHGM4JQQIBLBIA
X-MailFrom: oder_chiou@realtek.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/HPGGDBSMUINYLVXENPVHGM4JQQIBLBIA/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The patch "Fix noise from speakers on Lenovo IdeaPad 3 15IAU7" caused
that the headset push button cannot work properly in case of ALC257.
This patch reverted it to correct the side effect.

Signed-off-by: Oder Chiou <oder_chiou@realtek.com>
---
 sound/pci/hda/patch_realtek.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index f787ff4182d4..86db1a4ec24c 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -587,6 +587,7 @@ static void alc_shutup_pins(struct hda_codec *codec)
 	switch (codec->core.vendor_id) {
 	case 0x10ec0236:
 	case 0x10ec0256:
+	case 0x10ec0257:
 	case 0x19e58326:
 	case 0x10ec0283:
 	case 0x10ec0285:
-- 
2.34.1

