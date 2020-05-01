Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 58CE21C0EDA
	for <lists+alsa-devel@lfdr.de>; Fri,  1 May 2020 09:31:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C52CA1697;
	Fri,  1 May 2020 09:30:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C52CA1697
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1588318267;
	bh=rLlw8rMUAqeVweok2MD/3Z0Vz6as445kr1Je4wBunK4=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Xo3SE+EE03hI7nwAxrPtmN4KD9I5Tl710v7hdsd2pORtd4rTqd9qC5524qQS4EWNX
	 7eBYKzpJ0TsC9hEAyes5Cp5xRkBUOqb57dI++e6LLD/HgisxYcDA+PBX06EV+xayV5
	 WEdQiQc4eZtYq4aIl87n8AzuOOUMWUygmwf4dOzo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A7BEAF800B9;
	Fri,  1 May 2020 09:29:26 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 195E2F8022B; Fri,  1 May 2020 09:29:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E3CD7F800B9
 for <alsa-devel@alsa-project.org>; Fri,  1 May 2020 09:29:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E3CD7F800B9
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 10E3DAC37;
 Fri,  1 May 2020 07:29:09 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ALSA: hda/realtek - Fix unused variable warning w/o
 CONFIG_LEDS_TRIGGER_AUDIO
Date: Fri,  1 May 2020 09:28:56 +0200
Message-Id: <20200501072857.13720-1-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
 Kai-Heng Feng <kai.heng.feng@canonical.com>
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Cover with a proper ifdef around the variable declaration for fixing
the following compilation warning without CONFIG_LEDS_TRIGGER_AUDIO:
  sound/pci/hda/patch_realtek.c: In function 'alc_fixup_hp_gpio_led':
  sound/pci/hda/patch_realtek.c:4134:6: warning: unused variable 'err' [-Wunused-variable]

Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Fixes: 87dc36482cab ("ALSA: hda/realtek - Add LED class support for micmute LED")
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/hda/patch_realtek.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index b6a1c8b7f5d0..670e59b081d5 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -4131,7 +4131,9 @@ static void alc_fixup_hp_gpio_led(struct hda_codec *codec,
 				  unsigned int micmute_mask)
 {
 	struct alc_spec *spec = codec->spec;
+#if IS_REACHABLE(CONFIG_LEDS_TRIGGER_AUDIO)
 	int err;
+#endif
 
 	alc_fixup_gpio(codec, action, mute_mask | micmute_mask);
 
-- 
2.16.4

