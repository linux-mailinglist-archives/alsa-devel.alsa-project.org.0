Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 42ED970F644
	for <lists+alsa-devel@lfdr.de>; Wed, 24 May 2023 14:24:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 59C0C82C;
	Wed, 24 May 2023 14:23:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 59C0C82C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684931058;
	bh=OY/naGkjqjzlphaVJfpoNSmq9t9o3CLQbg2CqAjD9Rg=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=laGQwxjWAjbLNG/oJJLIY1kLggT8Ung2y81FWwts1hKKPI1LrCede4uCY2K/pgeDr
	 6zrcZi6q3/gvY8UVucYqKO/q1mB9KB5sIZITcuoLARxZlLwDAM5SAb+5gUm86bLgaJ
	 WCRBiwFrT57JiVhY7c2qx/5QFwtBQ7w8OiQsdZRc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BDF88F80563; Wed, 24 May 2023 14:22:41 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E33E6F80249;
	Wed, 24 May 2023 14:22:40 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C7032F80249; Wed, 24 May 2023 13:38:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from smtp-relay-canonical-0.canonical.com
 (smtp-relay-canonical-0.canonical.com [185.125.188.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 854F8F80053
	for <alsa-devel@alsa-project.org>; Wed, 24 May 2023 13:38:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 854F8F80053
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=canonical.com header.i=@canonical.com
 header.a=rsa-sha256 header.s=20210705 header.b=SPhKXur9
Received: from binli-ThinkPad-P17-Gen-1.. (unknown [103.229.218.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-relay-canonical-0.canonical.com (Postfix) with ESMTPSA id B1E943F323;
	Wed, 24 May 2023 11:37:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1684928280;
	bh=2jDYAyIQzR5LVpCJdbESJ5E/R1qgz1TuJsk+SSd1oFc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version;
	b=SPhKXur9CnyyHsd2Ke8nhTj2sAK8pioz4xCxoxDlYUAcevPF5j5JoYRXi2cbXoJxY
	 0ZH+Ucf/w2FayA1ji3QIBtnSmTaE2lgifFISZo+BTQLDIYRebiEWSauRqVCOQTboCe
	 4ZgnauPyzsMTu5BOwRF/h8Ouc1QSgNa73W3HlYv4Mwl61xh8YsWh+f7K4E8eY4jBp6
	 8TbRsC+TXXuAS1DSZi/Lj1I4BmPlXhCpGVIMgzLtZpqMZIesX3Fh7SZ0P9LU32C+dV
	 At5Ut5kkuZ1FcQKOmz8nYP1Yk8JY5G3QsRuSu4OY7qEIMxcKlp/95S5i2BwCNZ2hI3
	 nnSCLaMjEShjA==
From: Bin Li <bin.li@canonical.com>
To: tiwai@suse.com
Cc: libin.charles@gmail.com,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org,
	hui.wang@canonical.com,
	kailang@realtek.com
Subject: [PATCH] ALSA: hda/realtek: Enable headset onLenovo M70/M90
Date: Wed, 24 May 2023 19:37:55 +0800
Message-Id: <20230524113755.1346928-1-bin.li@canonical.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MailFrom: bin.li@canonical.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: WA5VU4SFGAMDK5JEBH6Z3GNWXEGF5WJ3
X-Message-ID-Hash: WA5VU4SFGAMDK5JEBH6Z3GNWXEGF5WJ3
X-Mailman-Approved-At: Wed, 24 May 2023 12:22:37 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/WA5VU4SFGAMDK5JEBH6Z3GNWXEGF5WJ3/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Lenovo M70/M90 Gen4 are equipped with ALC897, and they need
ALC897_FIXUP_HEADSET_MIC_PIN quirk to make its headset mic work.
The previous quirk for M70/M90 is for Gen3.

Signed-off-by: Bin Li <bin.li@canonical.com>
---
 sound/pci/hda/patch_realtek.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index a7e4765eff80..7b5f194513c7 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -11719,6 +11719,8 @@ static const struct snd_pci_quirk alc662_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x17aa, 0x32cb, "Lenovo ThinkCentre M70", ALC897_FIXUP_HEADSET_MIC_PIN),
 	SND_PCI_QUIRK(0x17aa, 0x32cf, "Lenovo ThinkCentre M950", ALC897_FIXUP_HEADSET_MIC_PIN),
 	SND_PCI_QUIRK(0x17aa, 0x32f7, "Lenovo ThinkCentre M90", ALC897_FIXUP_HEADSET_MIC_PIN),
+	SND_PCI_QUIRK(0x17aa, 0x3321, "Lenovo ThinkCentre M70 Gen4", ALC897_FIXUP_HEADSET_MIC_PIN),
+	SND_PCI_QUIRK(0x17aa, 0x331b, "Lenovo ThinkCentre M90 Gen4", ALC897_FIXUP_HEADSET_MIC_PIN),
 	SND_PCI_QUIRK(0x17aa, 0x3742, "Lenovo TianYi510Pro-14IOB", ALC897_FIXUP_HEADSET_MIC_PIN2),
 	SND_PCI_QUIRK(0x17aa, 0x38af, "Lenovo Ideapad Y550P", ALC662_FIXUP_IDEAPAD),
 	SND_PCI_QUIRK(0x17aa, 0x3a0d, "Lenovo Ideapad Y550", ALC662_FIXUP_IDEAPAD),
-- 
2.34.1

