Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C9B906D8803
	for <lists+alsa-devel@lfdr.de>; Wed,  5 Apr 2023 22:15:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1157A7F8;
	Wed,  5 Apr 2023 22:14:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1157A7F8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1680725724;
	bh=hVPTjmzbrsunMG+QzLk/IKPx1LfN8ZKm18jelFcBa2M=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=Gc7Mv2DZwg8GHlE6VLOkvK1zsUlHXXQlzsY8XtBNPblJJw3GBJuTYtulblnzijKYy
	 ZZiqv/Fg34XRuII3J1ivYf6OjJPwSpW2Xno+QZQB37OoIjH2ipwgrcFs4kKthmTu18
	 qNTW1petI0C+YUaWBW4lnz6+/JenpDTH2KuxF+4c=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B6C02F80578;
	Wed,  5 Apr 2023 22:12:51 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D942FF8055B; Wed,  5 Apr 2023 22:12:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from bluemchen.kde.org (bluemchen.kde.org [209.51.188.41])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 37577F8026D
	for <alsa-devel@alsa-project.org>; Wed,  5 Apr 2023 22:12:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 37577F8026D
Received: from ugly.fritz.box (localhost [127.0.0.1])
	by bluemchen.kde.org (Postfix) with ESMTP id 5FB9E24252
	for <alsa-devel@alsa-project.org>; Wed,  5 Apr 2023 16:12:20 -0400 (EDT)
Received: by ugly.fritz.box (masqmail 0.3.4, from userid 1000)
	id 1pk9US-Dl4-00
	for <alsa-devel@alsa-project.org>; Wed, 05 Apr 2023 22:12:20 +0200
From: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 2/2] ALSA: hda/sigmatel: fix S/PDIF out on Intel D*45*
 motherboards
Date: Wed,  5 Apr 2023 22:12:20 +0200
Message-Id: <20230405201220.2197826-2-oswald.buddenhagen@gmx.de>
X-Mailer: git-send-email 2.40.0.152.g15d061e6df
In-Reply-To: <20230405201220.2197826-1-oswald.buddenhagen@gmx.de>
References: <20230405201220.2197826-1-oswald.buddenhagen@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: VIKSJYZHCZ5L5D7V4DGHMO7ABLMWZ2VS
X-Message-ID-Hash: VIKSJYZHCZ5L5D7V4DGHMO7ABLMWZ2VS
X-MailFrom: ossi@kde.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VIKSJYZHCZ5L5D7V4DGHMO7ABLMWZ2VS/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The BIOS botches this one completely - it says the 2nd S/PDIF output is
used, while in fact it's the 1st one. This is tested on DP45SG, but I'm
assuming it's valid for the other boards in the series as well.

Also add some comments regarding the pins.
FWIW, the codec is apparently still sold by Tempo Semiconductor, Inc.,
where one can download the documentation.

Signed-off-by: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
---
 sound/pci/hda/patch_sigmatel.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/sound/pci/hda/patch_sigmatel.c b/sound/pci/hda/patch_sigmatel.c
index 64a97d8c1b03..61258b0aac8d 100644
--- a/sound/pci/hda/patch_sigmatel.c
+++ b/sound/pci/hda/patch_sigmatel.c
@@ -1707,17 +1707,21 @@ static const struct snd_pci_quirk stac925x_fixup_tbl[] = {
 };
 
 static const struct hda_pintbl ref92hd73xx_pin_configs[] = {
+	// Port A-H
 	{ 0x0a, 0x02214030 },
 	{ 0x0b, 0x02a19040 },
 	{ 0x0c, 0x01a19020 },
 	{ 0x0d, 0x02214030 },
 	{ 0x0e, 0x0181302e },
 	{ 0x0f, 0x01014010 },
 	{ 0x10, 0x01014020 },
 	{ 0x11, 0x01014030 },
+	// CD in
 	{ 0x12, 0x02319040 },
+	// Digial Mic ins
 	{ 0x13, 0x90a000f0 },
 	{ 0x14, 0x90a000f0 },
+	// Digital outs
 	{ 0x22, 0x01452050 },
 	{ 0x23, 0x01452050 },
 	{}
@@ -1758,13 +1762,17 @@ static const struct hda_pintbl alienware_m17x_pin_configs[] = {
 };
 
 static const struct hda_pintbl intel_dg45id_pin_configs[] = {
+	// Analog outputs
 	{ 0x0a, 0x02214230 },
 	{ 0x0b, 0x02A19240 },
 	{ 0x0c, 0x01013214 },
 	{ 0x0d, 0x01014210 },
 	{ 0x0e, 0x01A19250 },
 	{ 0x0f, 0x01011212 },
 	{ 0x10, 0x01016211 },
+	// Digital output
+	{ 0x22, 0x01451380 },
+	{ 0x23, 0x40f000f0 },
 	{}
 };
 
-- 
2.40.0.152.g15d061e6df

