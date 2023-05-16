Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F241F70498A
	for <lists+alsa-devel@lfdr.de>; Tue, 16 May 2023 11:41:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0B36011C;
	Tue, 16 May 2023 11:40:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0B36011C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684230086;
	bh=5eUwfx0tOHHmaQEq4NJ69d6MMlXx54PagM7Ba1Z7nFs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=BYHlDivFskQwq6eapjehrHpwmEoPHvFiX1psLek6X8IrYMQmXX3sTbAGnHtqomu67
	 MUFJXXKvXWNK/mCsMxtAc1gMWsoM7AHujmdh6CgYQ6X1oYL8J1VgZE86Oci0qwADTQ
	 x9Syf/YIz4xdp0AWPAnf6n3erWOQaSMjqj0lQQgA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0B648F8061E; Tue, 16 May 2023 11:37:14 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A6B32F80610;
	Tue, 16 May 2023 11:37:13 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 80FC4F805FB; Tue, 16 May 2023 11:37:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from bluemchen.kde.org (bluemchen.kde.org [209.51.188.41])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B76FDF8016A
	for <alsa-devel@alsa-project.org>; Tue, 16 May 2023 11:36:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B76FDF8016A
Received: from ugly.fritz.box (localhost [127.0.0.1])
	by bluemchen.kde.org (Postfix) with ESMTP id 3B0B82429E;
	Tue, 16 May 2023 05:36:13 -0400 (EDT)
Received: by ugly.fritz.box (masqmail 0.3.4, from userid 1000)
	id 1pyr6K-q1j-00; Tue, 16 May 2023 11:36:12 +0200
From: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
To: alsa-devel@alsa-project.org
Cc: Takashi Iwai <tiwai@suse.de>,
	Jaroslav Kysela <perex@perex.cz>
Subject: [PATCH 10/10] ALSA: emu10k1: make struct snd_emu1010 less wasteful
Date: Tue, 16 May 2023 11:36:12 +0200
Message-Id: <20230516093612.3536508-11-oswald.buddenhagen@gmx.de>
X-Mailer: git-send-email 2.40.0.152.g15d061e6df
In-Reply-To: <20230516093612.3536508-1-oswald.buddenhagen@gmx.de>
References: <20230516093612.3536508-1-oswald.buddenhagen@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 4WGVP4ZKQIIXF554VGPRNU5HY2ZX2ARH
X-Message-ID-Hash: 4WGVP4ZKQIIXF554VGPRNU5HY2ZX2ARH
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4WGVP4ZKQIIXF554VGPRNU5HY2ZX2ARH/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Shrink the {in,out}put_source arrays and their data type to what is
actually necessary.

To be still on the safe side, add some static asserts.

Signed-off-by: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
---
 include/sound/emu10k1.h      | 7 +++++--
 sound/pci/emu10k1/emumixer.c | 5 +++++
 2 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/include/sound/emu10k1.h b/include/sound/emu10k1.h
index c6f1d17a797f..c9fbf76b7719 100644
--- a/include/sound/emu10k1.h
+++ b/include/sound/emu10k1.h
@@ -1626,9 +1626,12 @@ struct snd_emu_chip_details {
 	const char *id;		/* for backward compatibility - can be NULL if not needed */
 };
 
+#define NUM_OUTPUT_DESTS 28
+#define NUM_INPUT_DESTS 22
+
 struct snd_emu1010 {
-	unsigned int output_source[64];
-	unsigned int input_source[64];
+	unsigned char output_source[NUM_OUTPUT_DESTS];
+	unsigned char input_source[NUM_INPUT_DESTS];
 	unsigned int adc_pads; /* bit mask */
 	unsigned int dac_pads; /* bit mask */
 	unsigned int internal_clock; /* 44100 or 48000 */
diff --git a/sound/pci/emu10k1/emumixer.c b/sound/pci/emu10k1/emumixer.c
index 16970bb0012b..9318888b524d 100644
--- a/sound/pci/emu10k1/emumixer.c
+++ b/sound/pci/emu10k1/emumixer.c
@@ -273,6 +273,7 @@ static const char * const emu1010_output_texts[] = {
 	LR_CTLS("1010 SPDIF"),
 	ADAT_CTLS("1010 "),
 };
+static_assert(ARRAY_SIZE(emu1010_output_texts) <= NUM_OUTPUT_DESTS);
 
 static const unsigned short emu1010_output_dst[] = {
 	LR_REGS(EMU_DST_DOCK_DAC1),
@@ -313,6 +314,7 @@ static const char * const snd_emu1010b_output_texts[] = {
 	LR_CTLS("1010 SPDIF"),
 	ADAT_CTLS("1010 "),
 };
+static_assert(ARRAY_SIZE(snd_emu1010b_output_texts) <= NUM_OUTPUT_DESTS);
 
 static const unsigned short emu1010b_output_dst[] = {
 	LR_REGS(EMU_DST_DOCK_DAC1),
@@ -349,6 +351,7 @@ static const char * const snd_emu1616_output_texts[] = {
 	ADAT_CTLS("Dock "),
 	LR_CTLS("Mana DAC"),
 };
+static_assert(ARRAY_SIZE(snd_emu1616_output_texts) <= NUM_OUTPUT_DESTS);
 
 static const unsigned short emu1616_output_dst[] = {
 	LR_REGS(EMU_DST_DOCK_DAC1),
@@ -377,6 +380,7 @@ static const char * const snd_emu0404_output_texts[] = {
 	LR_CTLS("DAC"),
 	LR_CTLS("SPDIF"),
 };
+static_assert(ARRAY_SIZE(snd_emu0404_output_texts) <= NUM_OUTPUT_DESTS);
 
 static const unsigned short emu0404_output_dst[] = {
 	LR_REGS(EMU_DST_HAMOA_DAC),
@@ -421,6 +425,7 @@ static const char * const emu1010_input_texts[] = {
 	"DSP 14 Capture Enum",
 	"DSP 15 Capture Enum",
 };
+static_assert(ARRAY_SIZE(emu1010_input_texts) <= NUM_INPUT_DESTS);
 
 static const unsigned short emu1010_input_dst[] = {
 	EMU_DST_ALICE2_EMU32_0,
-- 
2.40.0.152.g15d061e6df

