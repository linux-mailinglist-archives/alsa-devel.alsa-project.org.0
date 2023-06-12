Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DA7872CF2C
	for <lists+alsa-devel@lfdr.de>; Mon, 12 Jun 2023 21:16:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 86A9C868;
	Mon, 12 Jun 2023 21:15:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 86A9C868
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686597379;
	bh=w6MjA353ytihUoUX5x4hK10iGuoWpblMXPXDrqNJZSY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=M9HYt5sMXVs4FyT3VYY0JYva6KBJLBzb8o1EPDItypiXbXK48aTHPLzfH6VLZJiUC
	 6voWMLSVGyo0Y8jEGFQ0s6fzxZ+aJO6E16wRMKz5bZKpsM63ncX51dOfUHyTsKmFm9
	 v+MKsZ+QtYuqdKywYTzvzvWib2l2etROXONcsfJ8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DBC2EF805B2; Mon, 12 Jun 2023 21:13:58 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 51C4FF805B4;
	Mon, 12 Jun 2023 21:13:58 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E01B7F8056F; Mon, 12 Jun 2023 21:13:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from bluemchen.kde.org (bluemchen.kde.org [209.51.188.41])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id ADC1BF80544
	for <alsa-devel@alsa-project.org>; Mon, 12 Jun 2023 21:13:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ADC1BF80544
Received: from ugly.fritz.box (localhost [127.0.0.1])
	by bluemchen.kde.org (Postfix) with ESMTP id EEE5424277;
	Mon, 12 Jun 2023 15:13:25 -0400 (EDT)
Received: by ugly.fritz.box (masqmail 0.3.4, from userid 1000)
	id 1q8myj-WKd-00; Mon, 12 Jun 2023 21:13:25 +0200
From: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
To: alsa-devel@alsa-project.org
Cc: Takashi Iwai <tiwai@suse.de>,
	Jaroslav Kysela <perex@perex.cz>
Subject: [PATCH 9/9] ALSA: emu10k1: actually show some S/PDIF status in /proc
 for E-MU cards
Date: Mon, 12 Jun 2023 21:13:25 +0200
Message-Id: <20230612191325.1315854-10-oswald.buddenhagen@gmx.de>
X-Mailer: git-send-email 2.40.0.152.g15d061e6df
In-Reply-To: <20230612191325.1315854-1-oswald.buddenhagen@gmx.de>
References: <20230612191325.1315854-1-oswald.buddenhagen@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: Z2JFDN2EALWHWBRUEN27Y6GV4NGMXB4U
X-Message-ID-Hash: Z2JFDN2EALWHWBRUEN27Y6GV4NGMXB4U
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/Z2JFDN2EALWHWBRUEN27Y6GV4NGMXB4U/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The file is called spdif-in, but we abused it to show only sample rates
from various sources. Rectify it as far as possible (the FPGA doesn't
give us a lot of information).

Signed-off-by: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>

---

FIXME: the polarity of "no copy" isn't clear - it could mean either "no
copyright asserted" or "no copies permitted". my attempts to test it
with an 0404b fed by an intel hda board went nowhere - the bit is never
set regardless of what i poke into the hda codec, and i don't know
whether the source or the card is to blame.
---
 sound/pci/emu10k1/emuproc.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/sound/pci/emu10k1/emuproc.c b/sound/pci/emu10k1/emuproc.c
index 993b35362499..7e2cc532471f 100644
--- a/sound/pci/emu10k1/emuproc.c
+++ b/sound/pci/emu10k1/emuproc.c
@@ -194,6 +194,14 @@ static void snd_emu10k1_proc_spdif_read(struct snd_info_entry *entry,
 		    emu->card_capabilities->emu_model == EMU_MODEL_EMU1010)
 			snd_iprintf(buffer, "BNC rate: %dHz\n",
 				    snd_emu1010_get_raw_rate(emu, EMU_HANA_WCLOCK_SYNC_BNC));
+
+		snd_emu1010_fpga_read(emu, EMU_HANA_SPDIF_MODE, &value);
+		if (value & EMU_HANA_SPDIF_MODE_RX_INVALID)
+			snd_iprintf(buffer, "\nS/PDIF input invalid\n");
+		else
+			snd_iprintf(buffer, "\nS/PDIF mode: %s%s\n",
+				    value & EMU_HANA_SPDIF_MODE_RX_PRO ? "professional" : "consumer",
+				    value & EMU_HANA_SPDIF_MODE_RX_NOCOPY ? ", no copy" : "");
 	} else {
 		snd_emu10k1_proc_spdif_status(emu, buffer, "CD-ROM S/PDIF In", CDCS, CDSRCS);
 		snd_emu10k1_proc_spdif_status(emu, buffer, "Optical or Coax S/PDIF In", GPSCS, GPSRCS);
-- 
2.40.0.152.g15d061e6df

