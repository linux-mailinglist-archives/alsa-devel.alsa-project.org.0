Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E8C8989FCB
	for <lists+alsa-devel@lfdr.de>; Mon, 30 Sep 2024 12:51:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7FABC1933;
	Mon, 30 Sep 2024 12:51:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7FABC1933
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1727693496;
	bh=+xai4gwtOT427Gg41Zw6sDOYsdeNZOYwgv/CBvi2i74=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=ZBTvlkkVMbYe7cRc4rtsS+yT9VY73IjPJ6XMggCXbkhpa976LFZyT58sUYP2g7xhH
	 m5xhv0tGpgA4XeR1+zPn0qOKCl5UDtfT15KH/A1qkwzEzlKjVbfC8EqWiDm4tK3IpC
	 fsNMpkuDhJY189zbT59lATbi+67ItdeUbqmE8f7Q=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D17CFF805B0; Mon, 30 Sep 2024 12:51:05 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 27B84F805B0;
	Mon, 30 Sep 2024 12:51:05 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B9D6AF80517; Mon, 30 Sep 2024 12:50:57 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 08EEEF800FA
	for <alsa-devel@alsa-project.org>; Mon, 30 Sep 2024 12:50:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 08EEEF800FA
Authentication-Results: alsa1.perex.cz;
	dkim=temperror header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256
 header.s=dkim header.b=snTgEWLi
X-SpamFilter-By: ArmorX SpamTrap 5.78 with qID 48UAojLG33574721,
 This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=realtek.com; s=dkim;
	t=1727693445; bh=+xai4gwtOT427Gg41Zw6sDOYsdeNZOYwgv/CBvi2i74=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:
	 Content-Transfer-Encoding:Content-Type;
	b=snTgEWLiw6LEAYOL3v7AleErYi+jzkOWTgZLKsW+V+aC4O365UYK1SX1JidaOTDQ1
	 ORbgSoyq8JE+a4bYC1HXBZv3idSpDz5fZMlpN2/31cZo4Y9sPlaUdP6DAO/ucBUSqO
	 gRMEtRLyBtW59ozwl8gEibjCXt9ax9hTwfNeI7WxYFZAwGJEpZSJUZ5QO648WzWDoW
	 h3GRdmj0DYze/hw7j9HI7Ge09iJ2I1+6941acaeNeWkn9B7rOKGQsz6y2DX7u+wC+Q
	 gHXatxzSzrrlpExuTUovULQdmQu1R6CWl5M802en2OzBfvp+hzAsnOvtObO5eCJfaQ
	 HpAJQQEcIYeJg==
Received: from mail.realtek.com (rtexh36505.realtek.com.tw[172.21.6.25])
	by rtits2.realtek.com.tw (8.15.2/3.05/5.92) with ESMTPS id 48UAojLG33574721
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 30 Sep 2024 18:50:45 +0800
Received: from RTEXMBS01.realtek.com.tw (172.21.6.94) by
 RTEXH36505.realtek.com.tw (172.21.6.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 30 Sep 2024 18:50:45 +0800
Received: from sw-server.localdomain (172.22.102.1) by
 RTEXMBS01.realtek.com.tw (172.21.6.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 30 Sep 2024 18:50:44 +0800
From: Oder Chiou <oder_chiou@realtek.com>
To: <tiwai@suse.de>
CC: <alsa-devel@alsa-project.org>, <kailang@realtek.com>, <flove@realtek.com>,
        <jennifer_chen@realtek.com>, <geans_chen@realsil.com.cn>,
        Oder Chiou
	<oder_chiou@realtek.com>
Subject: [PATCH v2] ALSA: hda/realtek: Fix the push button function for the
 ALC257
Date: Mon, 30 Sep 2024 18:50:39 +0800
Message-ID: <20240930105039.3473266-1-oder_chiou@realtek.com>
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
Message-ID-Hash: 726WGRIDJ2EN225RTT6OBGTZ4POW7DJE
X-Message-ID-Hash: 726WGRIDJ2EN225RTT6OBGTZ4POW7DJE
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/726WGRIDJ2EN225RTT6OBGTZ4POW7DJE/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The headset push button cannot work properly in case of the ALC257.
This patch reverted the previous commit to correct the side effect.

Fixes: ef9718b3d54e ("ALSA: hda/realtek: Fix noise from speakers on Lenovo IdeaPad 3 15IAU7")
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

