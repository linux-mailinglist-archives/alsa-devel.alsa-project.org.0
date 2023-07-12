Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EC89750B8C
	for <lists+alsa-devel@lfdr.de>; Wed, 12 Jul 2023 16:58:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 28B7A203;
	Wed, 12 Jul 2023 16:58:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 28B7A203
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689173934;
	bh=RdZeJ/UP1LWVaczymMvQu+9W3rmY3uLEAYswcc3cUnI=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=KMvzemzGxBSmGPTXwkuajAo1cR4emFAhPEBgNVuk66wf4l7UIIXPYCIstsl1XZ17I
	 SkjtfgivEXE7HIuZuHirm2v4KQZ9/AnL6G2NUu3Nt0ouX9olJy1SWjIh/FdL9Ih/Pq
	 R2xolPIeMnquKN8Cn+xCTN6JB79tXHA/5pHZJAB0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 68C2DF80236; Wed, 12 Jul 2023 16:58:03 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 18B47F8024E;
	Wed, 12 Jul 2023 16:58:03 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 845F8F8027B; Wed, 12 Jul 2023 16:57:57 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 84D6DF80236
	for <alsa-devel@alsa-project.org>; Wed, 12 Jul 2023 16:57:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 84D6DF80236
Received: from ugly.fritz.box (localhost [127.0.0.1])
	by bluemchen.kde.org (Postfix) with ESMTP id 5DA4D2408D;
	Wed, 12 Jul 2023 10:57:50 -0400 (EDT)
Received: by ugly.fritz.box (masqmail 0.3.6-dev, from userid 1000)
	id 1qJbHq-WXh-00; Wed, 12 Jul 2023 16:57:50 +0200
From: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
To: alsa-devel@alsa-project.org
Cc: Takashi Iwai <tiwai@suse.de>,
	Jaroslav Kysela <perex@perex.cz>
Subject: [PATCH 1/3] ALSA: emu10k1: fix return value of
 snd_emu1010_adc_pads_put()
Date: Wed, 12 Jul 2023 16:57:48 +0200
Message-Id: <20230712145750.125086-1-oswald.buddenhagen@gmx.de>
X-Mailer: git-send-email 2.40.0.152.g15d061e6df
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: JAICFUZWW7A4JTOJ7BLBFVCAQPH2RQR3
X-Message-ID-Hash: JAICFUZWW7A4JTOJ7BLBFVCAQPH2RQR3
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JAICFUZWW7A4JTOJ7BLBFVCAQPH2RQR3/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

It returned zero even if the value had changed.

Signed-off-by: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>

---
this should have been in cc766807a2 (fix return value of
snd_emu1010_dac_pads_put()), but, well.
---
 sound/pci/emu10k1/emumixer.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/sound/pci/emu10k1/emumixer.c b/sound/pci/emu10k1/emumixer.c
index f9500cd50a4b..573e1c7c5e50 100644
--- a/sound/pci/emu10k1/emumixer.c
+++ b/sound/pci/emu10k1/emumixer.c
@@ -770,18 +770,21 @@ static int snd_emu1010_adc_pads_put(struct snd_kcontrol *kcontrol, struct snd_ct
 	struct snd_emu10k1 *emu = snd_kcontrol_chip(kcontrol);
 	unsigned int mask = snd_emu1010_adc_pad_regs[kcontrol->private_value];
 	unsigned int val, cache;
+	int change;
+
 	val = ucontrol->value.integer.value[0];
 	cache = emu->emu1010.adc_pads;
 	if (val == 1) 
 		cache = cache | mask;
 	else
 		cache = cache & ~mask;
-	if (cache != emu->emu1010.adc_pads) {
+	change = (cache != emu->emu1010.adc_pads);
+	if (change) {
 		snd_emu1010_fpga_write(emu, EMU_HANA_ADC_PADS, cache );
 	        emu->emu1010.adc_pads = cache;
 	}
 
-	return 0;
+	return change;
 }
 
 static const struct snd_kcontrol_new emu1010_adc_pads_ctl = {
-- 
2.40.0.152.g15d061e6df

