Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 19ED57BE5AD
	for <lists+alsa-devel@lfdr.de>; Mon,  9 Oct 2023 17:59:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 65930EA3;
	Mon,  9 Oct 2023 17:58:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 65930EA3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1696867182;
	bh=ubNRAlRfoQPYsP0oYqhCk61aypjE1o7uIwUcDSiaXng=;
	h=Subject:From:To:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=eDhygaEZiiOsVNI9hId4NNjulEyRXfCiAk+9b3RShGtNoYgz9tgnAp4nbjdJMQ5CL
	 X1g4KOCKxCXs5bSuMpQtVUGtKbjE1ISUcNJVEn0zyhqIriDV4Suj7NecVyDqXZZqD/
	 FDI3Z5WV4nWzOdaBP9oEq+XGd2DGmYyOA2EssJ00=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B38AFF805B2; Mon,  9 Oct 2023 17:57:33 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0DBE9F8059F;
	Mon,  9 Oct 2023 17:57:33 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C6FFEF802BE; Sun,  8 Oct 2023 08:38:31 +0200 (CEST)
Received: from mailman-web.alsa-project.org (mailman-web.alsa-project.org
 [10.254.200.11])
	by alsa1.perex.cz (Postfix) with ESMTP id 080BCF8019B
	for <alsa-devel@alsa-project.org>; Sun,  8 Oct 2023 08:38:23 +0200 (CEST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [PATCH] hda/realtek: Add SND_PCI_QUIRK entry for the Dell XPS 9530
 laptop for
 dual speakers
From: brett@worth.au
To: alsa-devel@alsa-project.org
Date: Sun, 08 Oct 2023 06:38:23 -0000
Message-ID: 
 <169674710330.21.11445585266903972887@mailman-web.alsa-project.org>
User-Agent: HyperKitty on https://mailman.alsa-project.org/
X-MailFrom: brett@worth.au
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: I24RO4HYAYRDVRHM7S2SZK4KYLTDPSY2
X-Message-ID-Hash: I24RO4HYAYRDVRHM7S2SZK4KYLTDPSY2
X-Mailman-Approved-At: Mon, 09 Oct 2023 15:57:19 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/NP7WATQDDP3S4ANMNP253SZIHUZYWJWB/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The Dell XPS 9530, like previous XPS laptops like the 9520 and 9510 have dual speakers in each channel.

If the ALC289_FIXUP_DUAL_SPK flag is not set in sound/pci/hda/patch_realtek.c only the tweeter will work and therefore make the sound quality terrible.

This patch has not been tested but is derived from a previous patch attempt from a different user called Pentracillin which was rejected.

$ diff -r -up a b
diff -r -up a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
--- a/sound/pci/hda/patch_realtek.c     2023-10-07 22:16:36.129618972 +1100
+++ b/sound/pci/hda/patch_realtek.c     2023-10-07 22:16:52.645258218 +1100
@@ -9412,6 +9412,7 @@ static const struct snd_pci_quirk alc269
       SND_PCI_QUIRK(0x1028, 0x0b1a, "Dell Precision 5570", ALC289_FIXUP_DUAL_SPK),
       SND_PCI_QUIRK(0x1028, 0x0b37, "Dell Inspiron 16 Plus 7620 2-in-1", ALC295_FIXUP_DELL_INSPIRON_TOP_SPEAKERS),
       SND_PCI_QUIRK(0x1028, 0x0b71, "Dell Inspiron 16 Plus 7620", ALC295_FIXUP_DELL_INSPIRON_TOP_SPEAKERS),
+       SND_PCI_QUIRK(0x1028, 0x0beb, "Dell XPS 15 9530", ALC289_FIXUP_DUAL_SPK),
       SND_PCI_QUIRK(0x1028, 0x0c03, "Dell Precision 5340", ALC269_FIXUP_DELL4_MIC_NO_PRESENCE),
       SND_PCI_QUIRK(0x1028, 0x0c19, "Dell Precision 3340", ALC236_FIXUP_DELL_DUAL_CODECS),
       SND_PCI_QUIRK(0x1028, 0x0c1a, "Dell Precision 3340", ALC236_FIXUP_DELL_DUAL_CODECS),

Brett Worth
