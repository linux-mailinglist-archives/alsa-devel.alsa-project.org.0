Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E1A5969DDC7
	for <lists+alsa-devel@lfdr.de>; Tue, 21 Feb 2023 11:23:54 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B9B80886;
	Tue, 21 Feb 2023 11:23:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B9B80886
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1676975033;
	bh=Vut8IgxXVczlLcf3yd/QYMFK2S2FM+mN2NpTfN4rpp8=;
	h=From:To:Subject:Date:CC:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=KhDCMr60tydVVqUxsL/Mu1LTTOrpE0vXtzbVOz+vnZ8DocFTm71vYcMrM37KGAC0S
	 FYbRpjEOeSt2J/Sr/n+fFEwUyHA3V0C2Kb012nakSXUDw/IfBfsr8DZ6E9kG81xsyh
	 08A2HJQYcaZqxKlGCpx5Eyt2TPEg2B73o9gCaIG0=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E4E07F8025A;
	Tue, 21 Feb 2023 11:23:02 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A0A7AF80266; Tue, 21 Feb 2023 11:22:14 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 1A26DF800B6
	for <alsa-devel@alsa-project.org>; Tue, 21 Feb 2023 11:22:07 +0100 (CET)
Received: from mail1.perex.cz (localhost [127.0.0.1])
	by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id AFD3511C5;
	Tue, 21 Feb 2023 11:22:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz AFD3511C5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
	t=1676974926; bh=pBHQUWTN8f4VddNlruXB6JVuIIiLIg61dorwl+2+uYc=;
	h=From:To:Cc:Subject:Date:From;
	b=cCPSJcFbhhlZHsHk6aAM35g/6FQphmj//V1ifMPRy8lYnT3xMv2BMpFRSQtE2PIB/
	 fMTOSRrEB0NL3ceiXdnCyVaKFSRS5/qO80MemYU3oafEyxSVZ++zKGqVSC//zTyzfp
	 COZNOmzi1fme+QkpcHOi8O+j1ZA/Louohb3f9ww4=
Received: from p1gen2.perex-int.cz (unknown [192.168.100.98])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	(Authenticated sender: perex)
	by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
	Tue, 21 Feb 2023 11:22:02 +0100 (CET)
From: Jaroslav Kysela <perex@perex.cz>
To: ALSA development <alsa-devel@alsa-project.org>
Subject: [PATCH] ALSA: hda/realtek: Improve support for Dell Precision 3260
Date: Tue, 21 Feb 2023 11:21:57 +0100
Message-Id: <20230221102157.515852-1-perex@perex.cz>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: ZOOZVCYSQII2SGQKEZRWRXFHLQY43Q7Q
X-Message-ID-Hash: ZOOZVCYSQII2SGQKEZRWRXFHLQY43Q7Q
X-MailFrom: perex@perex.cz
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Takashi Iwai <tiwai@suse.de>, steven_wu2@dell.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZOOZVCYSQII2SGQKEZRWRXFHLQY43Q7Q/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The headset jack works better with model=alc283-dac-wcaps. Without this
option, the headset insertion (separate physical jack) may not be handled
correctly (re-insertion is required).

It seems that it follows the "Intel Reference Board" defaults.

Reported-by: steven_wu2@dell.com
Signed-off-by: Jaroslav Kysela <perex@perex.cz>
---
 sound/pci/hda/patch_realtek.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index e103bb3693c0..7afbb708b705 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -9260,6 +9260,7 @@ static const struct snd_pci_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x1028, 0x0a62, "Dell Precision 5560", ALC289_FIXUP_DUAL_SPK),
 	SND_PCI_QUIRK(0x1028, 0x0a9d, "Dell Latitude 5430", ALC269_FIXUP_DELL4_MIC_NO_PRESENCE),
 	SND_PCI_QUIRK(0x1028, 0x0a9e, "Dell Latitude 5430", ALC269_FIXUP_DELL4_MIC_NO_PRESENCE),
+	SND_PCI_QUIRK(0x1028, 0x0ac9, "Dell Precision 3260", ALC295_FIXUP_CHROME_BOOK),
 	SND_PCI_QUIRK(0x1028, 0x0b19, "Dell XPS 15 9520", ALC289_FIXUP_DUAL_SPK),
 	SND_PCI_QUIRK(0x1028, 0x0b1a, "Dell Precision 5570", ALC289_FIXUP_DUAL_SPK),
 	SND_PCI_QUIRK(0x1028, 0x0b37, "Dell Inspiron 16 Plus 7620 2-in-1", ALC295_FIXUP_DELL_INSPIRON_TOP_SPEAKERS),
-- 
2.39.0

