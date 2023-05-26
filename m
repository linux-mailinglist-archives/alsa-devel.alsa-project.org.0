Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 226B7712467
	for <lists+alsa-devel@lfdr.de>; Fri, 26 May 2023 12:18:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 40186200;
	Fri, 26 May 2023 12:18:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 40186200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1685096330;
	bh=TdXy+uSNAz7WbPmVOkrCU54v213KFBeGFQGa1MMqN0E=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=OxUmv4WnZ70H58OAj4/jL91QNg60yod1szAMz1XaYgVcIEoNDA9oEO+zhiXjSmezV
	 KvnexPmUzs8+o0ZFH7RrFppMi7l4vYJrU4xuKnwLPAGxKCRsQOYS8SWvucQJ3yIh3s
	 fEm2CSRIU7BsAFEBE3VOooCM7ybjvj0PVrqqnC3I=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 22010F80558; Fri, 26 May 2023 12:17:11 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CC600F80549;
	Fri, 26 May 2023 12:17:10 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5F9A2F80249; Fri, 26 May 2023 12:17:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from bluemchen.kde.org (bluemchen.kde.org
 [IPv6:2001:470:142:8::100])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3DDA0F80086
	for <alsa-devel@alsa-project.org>; Fri, 26 May 2023 12:17:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3DDA0F80086
Received: from ugly.fritz.box (localhost [127.0.0.1])
	by bluemchen.kde.org (Postfix) with ESMTP id CA31A2425A;
	Fri, 26 May 2023 06:16:59 -0400 (EDT)
Received: by ugly.fritz.box (masqmail 0.3.4, from userid 1000)
	id 1q2UVH-pwe-00; Fri, 26 May 2023 12:16:59 +0200
From: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
To: alsa-devel@alsa-project.org
Cc: Takashi Iwai <tiwai@suse.de>,
	Jaroslav Kysela <perex@perex.cz>
Subject: [PATCH 4/6] ALSA: emu10k1: include FX send amounts in /proc output
Date: Fri, 26 May 2023 12:16:57 +0200
Message-Id: <20230526101659.437969-5-oswald.buddenhagen@gmx.de>
X-Mailer: git-send-email 2.40.0.152.g15d061e6df
In-Reply-To: <20230526101659.437969-1-oswald.buddenhagen@gmx.de>
References: <20230526101659.437969-1-oswald.buddenhagen@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: PI7CMRU2X2DBGDUNTSGPXUUPB2IQG4MF
X-Message-ID-Hash: PI7CMRU2X2DBGDUNTSGPXUUPB2IQG4MF
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/PI7CMRU2X2DBGDUNTSGPXUUPB2IQG4MF/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

It seems to make little sense to include the FX send routing, but not
the amounts.

This also simplifies the code somewhat, and lines up the output.

Signed-off-by: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
---
 sound/pci/emu10k1/emuproc.c | 49 +++++++++++++++++++------------------
 1 file changed, 25 insertions(+), 24 deletions(-)

diff --git a/sound/pci/emu10k1/emuproc.c b/sound/pci/emu10k1/emuproc.c
index 68a4c1a851a4..0ab7dc92c0f8 100644
--- a/sound/pci/emu10k1/emuproc.c
+++ b/sound/pci/emu10k1/emuproc.c
@@ -170,44 +170,45 @@ static void snd_emu10k1_proc_read(struct snd_info_entry *entry,
 	};
 
 	struct snd_emu10k1 *emu = entry->private_data;
-	unsigned int val, val1;
+	unsigned int val, val1, ptrx, psst, dsl, snda;
 	int nefx = emu->audigy ? 64 : 32;
 	const char * const *outputs = emu->audigy ? audigy_outs : creative_outs;
 	int idx;
 	
 	snd_iprintf(buffer, "EMU10K1\n\n");
 	snd_iprintf(buffer, "Card                  : %s\n",
 		    emu->audigy ? "Audigy" : (emu->card_capabilities->ecard ? "EMU APS" : "Creative"));
 	snd_iprintf(buffer, "Internal TRAM (words) : 0x%x\n", emu->fx8010.itram_size);
 	snd_iprintf(buffer, "External TRAM (words) : 0x%x\n", (int)emu->fx8010.etram_pages.bytes / 2);
-	snd_iprintf(buffer, "\n");
-	snd_iprintf(buffer, "Effect Send Routing   :\n");
+
+	snd_iprintf(buffer, "\nEffect Send Routing & Amounts:\n");
 	for (idx = 0; idx < NUM_G; idx++) {
-		val = emu->audigy ?
-			snd_emu10k1_ptr_read(emu, A_FXRT1, idx) :
-			snd_emu10k1_ptr_read(emu, FXRT, idx);
-		val1 = emu->audigy ?
-			snd_emu10k1_ptr_read(emu, A_FXRT2, idx) :
-			0;
+		ptrx = snd_emu10k1_ptr_read(emu, PTRX, idx);
+		psst = snd_emu10k1_ptr_read(emu, PSST, idx);
+		dsl = snd_emu10k1_ptr_read(emu, DSL, idx);
 		if (emu->audigy) {
-			snd_iprintf(buffer, "Ch%i: A=%i, B=%i, C=%i, D=%i, ",
+			val = snd_emu10k1_ptr_read(emu, A_FXRT1, idx);
+			val1 = snd_emu10k1_ptr_read(emu, A_FXRT2, idx);
+			snda = snd_emu10k1_ptr_read(emu, A_SENDAMOUNTS, idx);
+			snd_iprintf(buffer, "Ch%-2i: A=%2i:%02x, B=%2i:%02x, C=%2i:%02x, D=%2i:%02x, ",
 				idx,
-				val & 0x3f,
-				(val >> 8) & 0x3f,
-				(val >> 16) & 0x3f,
-				(val >> 24) & 0x3f);
-			snd_iprintf(buffer, "E=%i, F=%i, G=%i, H=%i\n",
-				val1 & 0x3f,
-				(val1 >> 8) & 0x3f,
-				(val1 >> 16) & 0x3f,
-				(val1 >> 24) & 0x3f);
+				val & 0x3f, REG_VAL_GET(PTRX_FXSENDAMOUNT_A, ptrx),
+				(val >> 8) & 0x3f, REG_VAL_GET(PTRX_FXSENDAMOUNT_B, ptrx),
+				(val >> 16) & 0x3f, REG_VAL_GET(PSST_FXSENDAMOUNT_C, psst),
+				(val >> 24) & 0x3f, REG_VAL_GET(DSL_FXSENDAMOUNT_D, dsl));
+			snd_iprintf(buffer, "E=%2i:%02x, F=%2i:%02x, G=%2i:%02x, H=%2i:%02x\n",
+				val1 & 0x3f, (snda >> 24) & 0xff,
+				(val1 >> 8) & 0x3f, (snda >> 16) & 0xff,
+				(val1 >> 16) & 0x3f, (snda >> 8) & 0xff,
+				(val1 >> 24) & 0x3f, snda & 0xff);
 		} else {
-			snd_iprintf(buffer, "Ch%i: A=%i, B=%i, C=%i, D=%i\n",
+			val = snd_emu10k1_ptr_read(emu, FXRT, idx);
+			snd_iprintf(buffer, "Ch%-2i: A=%2i:%02x, B=%2i:%02x, C=%2i:%02x, D=%2i:%02x\n",
 				idx,
-				(val >> 16) & 0x0f,
-				(val >> 20) & 0x0f,
-				(val >> 24) & 0x0f,
-				(val >> 28) & 0x0f);
+				(val >> 16) & 0x0f, REG_VAL_GET(PTRX_FXSENDAMOUNT_A, ptrx),
+				(val >> 20) & 0x0f, REG_VAL_GET(PTRX_FXSENDAMOUNT_B, ptrx),
+				(val >> 24) & 0x0f, REG_VAL_GET(PSST_FXSENDAMOUNT_C, psst),
+				(val >> 28) & 0x0f, REG_VAL_GET(DSL_FXSENDAMOUNT_D, dsl));
 		}
 	}
 	snd_iprintf(buffer, "\nCaptured FX Outputs   :\n");
-- 
2.40.0.152.g15d061e6df

