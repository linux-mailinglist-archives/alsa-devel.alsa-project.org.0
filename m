Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AF28C8A371
	for <lists+alsa-devel@lfdr.de>; Wed, 26 Nov 2025 15:12:08 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 911F3601FC;
	Wed, 26 Nov 2025 15:11:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 911F3601FC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1764166323;
	bh=2meb8pMn/vUm+BH5jGUQ5bwKNjNmkPZApPN4wLKCVxY=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=moyMiAdfpUkjsxt5UX9u55tyKBGE6C+WSdM774LLTiLH9gq3lwT9e2/mqecsviFqX
	 j//ZwaOWEdeAI6Sgw9GGkdPbMRhZaDG2LR8TQwkYc8SwS8mShCE+usIuYBuhQXsnUL
	 3Rl6Fu3mOH7KFV03CHGlmlz9BM6DZQthAr7yT/ow=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4D49EF805C5; Wed, 26 Nov 2025 15:11:30 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 07003F805C7;
	Wed, 26 Nov 2025 15:11:30 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C61B1F80448; Fri, 21 Nov 2025 02:57:26 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.3 required=5.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,FREEMAIL_FROM,HELO_DYNAMIC_IPADDR,RDNS_DYNAMIC,
	SPOOFED_FREEMAIL,T_SPF_HELO_TEMPERROR,T_SPF_TEMPERROR shortcircuit=no
	autolearn=no autolearn_force=no version=3.4.6
Received: from out203-205-221-173.mail.qq.com (out203-205-221-173.mail.qq.com
 [203.205.221.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with UTF8SMTPS id 259BEF80072
	for <alsa-devel@alsa-project.org>; Fri, 21 Nov 2025 02:57:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 259BEF80072
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=qq.com header.i=@qq.com header.a=rsa-sha256
 header.s=s201512 header.b=dd/win98
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1763690236; bh=luUWJdPyDDlmLhkwshIANIGBtW5CwN/9s4jwfNPVnRU=;
	h=From:To:Cc:Subject:Date;
	b=dd/win98CROQyWgFXS0pLWJNWJP53HofLoIjQVICJtUbsqmF6q2fXvVJ4fDXxorwp
	 nJjpIXmJY6u+WNGBCjgogYNyMPO46OaFe+h19IeHFhj2LJ+6xs4nyiGV6aSR3bvzlP
	 6yWrOphBcFCCUipci6ypmwBUazGnTL5tzlOK4jc0=
Received: from pop-os.. ([124.70.231.7])
	by newxmesmtplogicsvrszc43-0.qq.com (NewEsmtp) with SMTP
	id E4E07043; Fri, 21 Nov 2025 09:57:14 +0800
X-QQ-mid: xmsmtpt1763690234tk9y60bwl
Message-ID: <tencent_E2DFA33EFDF39E0517A94FA8FF06C05C0709@qq.com>
X-QQ-XMAILINFO: NC4p7XQIBeahJedhrkGRBh57pm9nhJoXHz+YkRRJ7aFtWz6qnL3PbU5UfoVJEk
	 triZ3lE5Di+ImNSa1qv4On+d5puMCXZgIkE5ZkyKuIF7HSAqdsm8zvzJQ+4E8/IGV4LpNpr3bvYZ
	 NLNu1s66GZ+5txNWoFMoG4JYo+HbQAq/wYHv2KvRMXbkV11iRgRI2Vj0WQZ+pPf76njicEOG4WrY
	 NPZAJxDNKAUAG9Q11qXuSIFMs+Wa25lVhM66rvnbd0G7l52LxRWba+CGOTiYfOAwP2y9cACyqnQ3
	 bAN2TlkgbG8BLs6XLKtEC9XbLj9t09YR5pZskPrHZtMGs3W3PbOkDEgHMAge82o1nEpOupECtS+R
	 Ez+adF1+LYjJM6yeooZFuUBi4Md0EJW3hNdd7ComHjNq4O1uLluGEj2lVBmUMNvrLlcKRRFNeRMY
	 zzPqaTrgfFIbXTfUdqD3X1aNpzHx1NFnIfTRrRIHSWPg/edf87MYXxDQwpDI6Od+zpCq7m6/QmQS
	 bxQN27lp4XJv3hBlALGsQ8LRRuFbY8bhxgIDlWOMmmnc+jM2aJxqqMz2InnvgSNepxyUZzu8V2l0
	 xkE2gBDjRr5rv7A9CDph8XHQr/VaEZJyJ8uo8VolhiX1f4yI7J3fS16GMeLuWm1tHq/ny6eZyZTS
	 r3KXHw1uMy7+itVE5Ut3L0QxfmxNrFMmB987BjxCiz3lBcRRexkajpgStBxOZ9RIUhGAZ+/ofG7s
	 SKLiVXlzcytsUaKLDSjYLHgXn5Hr+dfuNdBabrwzZLhmbyYftlliUYAmtKaDmNGI0jKCm9wzG9Vb
	 30aN2tk/cs2wZNV70TZZh3CyA2BQVAQjCEWRbNk7vXcCKSWxz2NRH4CI4Q8RGZCO4TTKcYCLRx4Q
	 i7/XOrnuHK40LGuGYcF6qIfnDVB5KMk3B/lxcUTFbVB/PXfyjjGCG/afsvs+YuiA5UzfSIdLWxwR
	 xdOScxE8V0dh2lXDwHmuWDMIrzNZAfSyd16luOmbUkHCH/poeCRy4ofFS7f+DOCSfrSO3q6MBGLF
	 jzUm9yMIZOjUrCcuQOHVYafBhIRfUm+DiFpZ/UZ9PLSSZjaGsZoQdWTlUYWTX/KvKamsTyemER7M
	 a8kcuG
X-QQ-XMRINFO: Nq+8W0+stu50PRdwbJxPCL0=
From: Jacob Zhong <cmpute@qq.com>
To: tiwai@suse.com
Cc: alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org,
	Jacob Zhong <cmpute@qq.com>
Subject: [PATCH] add the SND quirk for HP pavilion aero laptop 13z-be200
Date: Fri, 21 Nov 2025 09:57:12 +0800
X-OQ-MSGID: <20251121015712.17516-1-cmpute@qq.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MailFrom: cmpute@qq.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: GLMIMJ5HHV6A5QSTIFUMXUFBRF6C7GZB
X-Message-ID-Hash: GLMIMJ5HHV6A5QSTIFUMXUFBRF6C7GZB
X-Mailman-Approved-At: Wed, 26 Nov 2025 14:11:21 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/GLMIMJ5HHV6A5QSTIFUMXUFBRF6C7GZB/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The laptop uses ALC287 chip (as shown in /proc/asound/card1/codec#0).
It seems that every HP pavilion laptop in the table uses the same quirk,
so I just copied them. I have verified that the mute LED on my laptop
works with this patch.

For reference, here's the alsa-info of my laptop:
https://alsa-project.org/db/?f=2d5f297087708610bc01816ab12052abdd4a17c0

Signed-off-by: Jacob Zhong <cmpute@qq.com>
---
 sound/hda/codecs/realtek/alc269.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek/alc269.c
index 269b6c1e3b6d..b18777c09d9c 100644
--- a/sound/hda/codecs/realtek/alc269.c
+++ b/sound/hda/codecs/realtek/alc269.c
@@ -6572,6 +6572,7 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x103c, 0x8bc8, "HP Victus 15-fa1xxx", ALC245_FIXUP_HP_MUTE_LED_COEFBIT),
 	SND_PCI_QUIRK(0x103c, 0x8bcd, "HP Omen 16-xd0xxx", ALC245_FIXUP_HP_MUTE_LED_V1_COEFBIT),
 	SND_PCI_QUIRK(0x103c, 0x8bd4, "HP Victus 16-s0xxx (MB 8BD4)", ALC245_FIXUP_HP_MUTE_LED_COEFBIT),
+	SND_PCI_QUIRK(0x103c, 0x8bd6, "HP Pavilion Aero Laptop 13z-be200", ALC287_FIXUP_HP_GPIO_LED),
 	SND_PCI_QUIRK(0x103c, 0x8bdd, "HP Envy 17", ALC287_FIXUP_CS35L41_I2C_2),
 	SND_PCI_QUIRK(0x103c, 0x8bde, "HP Envy 17", ALC287_FIXUP_CS35L41_I2C_2),
 	SND_PCI_QUIRK(0x103c, 0x8bdf, "HP Envy 15", ALC287_FIXUP_CS35L41_I2C_2),
-- 
2.43.0

