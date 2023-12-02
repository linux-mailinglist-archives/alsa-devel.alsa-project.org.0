Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A2FB6802C36
	for <lists+alsa-devel@lfdr.de>; Mon,  4 Dec 2023 08:40:44 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3B631DF0;
	Mon,  4 Dec 2023 08:40:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3B631DF0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1701675644;
	bh=UsPI8cJOwLhuVwmeo6wuXRWzRcBEhHjbgG8LyN1/awg=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=a7yIw/VMV6CeiQ0w4/Sk4kfzx88JFIReQy1/4EuFG231mI8JnoJFwYxs+0SYSm+WE
	 m6slfeC7tZHS5zpmhuQ69ZqvFZ/ngWIjxvDdgTcLePCZi5HcpowvhSgJmfj2UcdWHo
	 ZmMyw4SgLqIRxODihhP2f4bQX0qxRyOu/HFOh0r4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EFDF4F805E8; Mon,  4 Dec 2023 08:39:42 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0D387F805EF;
	Mon,  4 Dec 2023 08:39:42 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3FF49F8016E; Sat,  2 Dec 2023 02:39:16 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
	RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from sender4-of-o53.zoho.com (sender4-of-o53.zoho.com
 [136.143.188.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9E1DCF800AC
	for <alsa-devel@alsa-project.org>; Sat,  2 Dec 2023 02:39:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9E1DCF800AC
Delivered-To: pascal@pascalcompiles.com
ARC-Seal: i=1; a=rsa-sha256; t=1701481116; cv=none;
	d=zohomail.com; s=zohoarc;
	b=YcBAYq3xYJX8OxFwFbP8yxR5AdT4MoK6Q1gYtJ49FZtzq5NCKV5hVJSh+ZPmt3YHJlApsxpHBjNPMFIVLDc87apbfF5t+Ur7Xaj9xXnRZtv7L79d8sMTP7bUAjbxzc6iUgagMwjy8koqgY4xC31YZYADpjWI+9SiJ8ueG9bhD48=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc;
	t=1701481116;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To;
	bh=NG3fV4+q2+cTJrIUSZH6I9+RUkj3JuMjAS6T7Sh8Krc=;
	b=P+48ZMGkORilTtr0rY+ma+EuqL7L7ChAHXmHMvAvmEPKnP7XjEuUGwoSbXruxJ++BppQGqHRjvVAKJYoFPaWE2RnInOLC6vG6p+i4Z1gOcmQYInP1VnzqLr/clQIS5EfuqPoRkKURVhKwIEMJIbZqb04k6yaTptvHDeSKDIFDH0=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	spf=pass  smtp.mailfrom=pascal@pascalcompiles.com;
	dmarc=pass header.from=<pascal@pascalcompiles.com>
Received: from rebelrebel.vs.shawcable.net (S01068c763f5f99ac.vs.shawcable.net
 [96.55.45.185]) by mx.zohomail.com
	with SMTPS id 17014811156103.491290640252373;
 Fri, 1 Dec 2023 17:38:35 -0800 (PST)
From: =?UTF-8?q?Pascal=20No=C3=ABl?= <pascal@pascalcompiles.com>
To: perex@perex.cz,
	tiwai@suse.com
Cc: kailang@realtek.com,
	sbinding@opensource.cirrus.com,
	luke@ljones.dev,
	andy.chi@canonical.com,
	shenghao-ding@ti.com,
	l.guzenko@web.de,
	ruinairas1992@gmail.com,
	yangyuchi66@gmail.com,
	vitalyr@opensource.cirrus.com,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org,
	pascal@pascalcompiles.com
Subject: [PATCH] ALSA: hda/realtek: Apply quirk for ASUS UM3504DA
Date: Fri,  1 Dec 2023 17:37:44 -0800
Message-ID: <20231202013744.12369-1-pascal@pascalcompiles.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
X-MailFrom: pascal@pascalcompiles.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: GTFM2EY5NQJ6NTIKU77CWDUAFV4JPTIX
X-Message-ID-Hash: GTFM2EY5NQJ6NTIKU77CWDUAFV4JPTIX
X-Mailman-Approved-At: Mon, 04 Dec 2023 07:36:08 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/GTFM2EY5NQJ6NTIKU77CWDUAFV4JPTIX/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The ASUS UM3504DA uses a Realtek HDA codec and two CS35L41 amplifiers via I2C.
Apply existing quirk to model.

Signed-off-by: Pascal Noël <pascal@pascalcompiles.com>
---
 sound/pci/hda/patch_realtek.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index f9ddacfd9..ddd74f5d3 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -9963,6 +9963,7 @@ static const struct snd_pci_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x1043, 0x17f3, "ROG Ally RC71L_RC71L", ALC294_FIXUP_ASUS_ALLY),
 	SND_PCI_QUIRK(0x1043, 0x1881, "ASUS Zephyrus S/M", ALC294_FIXUP_ASUS_GX502_PINS),
 	SND_PCI_QUIRK(0x1043, 0x18b1, "Asus MJ401TA", ALC256_FIXUP_ASUS_HEADSET_MIC),
+	SND_PCI_QUIRK(0x1043, 0x18d3, "ASUS UM3504DA", ALC294_FIXUP_CS35L41_I2C_2),
 	SND_PCI_QUIRK(0x1043, 0x18f1, "Asus FX505DT", ALC256_FIXUP_ASUS_HEADSET_MIC),
 	SND_PCI_QUIRK(0x1043, 0x194e, "ASUS UX563FD", ALC294_FIXUP_ASUS_HPE),
 	SND_PCI_QUIRK(0x1043, 0x1970, "ASUS UX550VE", ALC289_FIXUP_ASUS_GA401),
-- 
2.43.0

