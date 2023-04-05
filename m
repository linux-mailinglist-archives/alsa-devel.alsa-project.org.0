Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A98E6D8805
	for <lists+alsa-devel@lfdr.de>; Wed,  5 Apr 2023 22:15:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 884897F4;
	Wed,  5 Apr 2023 22:15:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 884897F4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1680725754;
	bh=VLlA63/gmT1N9oIqk0Hzn12b8Df9wez7TtGPe9Gv+/s=;
	h=From:To:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=YwwRN2kA8HKmiwafyatRFXCIaT00B9LcXvUx77loe58YuF5AIXCdHZa+JMRtQkLO6
	 i3GgSbgpKW4bD3FHihFHRrSDD6EsJcPCgSKYb3WzQo/gR5abMlvaHTEU6gBAmOX4b/
	 hyY2mu5jvYQzHw3VzjMFpbmMay4Faebw3xb6Zb4Q=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id F135CF80571;
	Wed,  5 Apr 2023 22:12:55 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 26E3CF80563; Wed,  5 Apr 2023 22:12:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from bluemchen.kde.org (bluemchen.kde.org [209.51.188.41])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 03F01F80482
	for <alsa-devel@alsa-project.org>; Wed,  5 Apr 2023 22:12:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 03F01F80482
Received: from ugly.fritz.box (localhost [127.0.0.1])
	by bluemchen.kde.org (Postfix) with ESMTP id 1FF132425A
	for <alsa-devel@alsa-project.org>; Wed,  5 Apr 2023 16:12:21 -0400 (EDT)
Received: by ugly.fritz.box (masqmail 0.3.4, from userid 1000)
	id 1pk9US-DmH-00
	for <alsa-devel@alsa-project.org>; Wed, 05 Apr 2023 22:12:20 +0200
From: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ALSA: emu10k1: update label & help in config system
Date: Wed,  5 Apr 2023 22:12:20 +0200
Message-Id: <20230405201220.2197908-1-oswald.buddenhagen@gmx.de>
X-Mailer: git-send-email 2.40.0.152.g15d061e6df
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: FTHQNONNUCQSFIIAJL5RUQDDFTDWPE6I
X-Message-ID-Hash: FTHQNONNUCQSFIIAJL5RUQDDFTDWPE6I
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/FTHQNONNUCQSFIIAJL5RUQDDFTDWPE6I/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The newer E-MU cards weren't mentioned at all.

The "partially supported" is removed ahead of it becoming mostly untrue.

Signed-off-by: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
---
 sound/pci/Kconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/pci/Kconfig b/sound/pci/Kconfig
index a55836225401..861958451ef5 100644
--- a/sound/pci/Kconfig
+++ b/sound/pci/Kconfig
@@ -461,17 +461,17 @@ config SND_INDIGODJX
 	  will be called snd-indigodjx
 
 config SND_EMU10K1
-	tristate "Emu10k1 (SB Live!, Audigy, E-mu APS)"
+	tristate "Emu10k1 (SB Live!, Audigy, E-MU APS/0404/1010/1212/1616/1820)"
 	select FW_LOADER
 	select SND_HWDEP
 	select SND_RAWMIDI
 	select SND_AC97_CODEC
 	select SND_TIMER
 	select SND_SEQ_DEVICE if SND_SEQUENCER != n
 	depends on ZONE_DMA
 	help
 	  Say Y to include support for Sound Blaster PCI 512, Live!,
-	  Audigy and E-mu APS (partially supported) soundcards.
+	  Audigy and E-MU APS/0404/1010/1212/1616/1820 soundcards.
 
 	  The confusing multitude of mixer controls is documented in
 	  <file:Documentation/sound/cards/sb-live-mixer.rst> and
-- 
2.40.0.152.g15d061e6df

