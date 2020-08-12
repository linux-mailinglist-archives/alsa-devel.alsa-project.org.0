Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D32642425C5
	for <lists+alsa-devel@lfdr.de>; Wed, 12 Aug 2020 09:04:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 831541669;
	Wed, 12 Aug 2020 09:03:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 831541669
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1597215887;
	bh=HPWdxI+V7rsSj87CosW2hF1q5Y+DRCM9KEHpT0WyBMs=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=GXMRFN40stpVqYf5+9pqBEZpPAXHhBnnnNOxwigsRlBXH5sZJhh3Fs6j9bwnXmc1m
	 FtdynB0cmkvU75IKPicCgHQuCqu6nJg8SFBw6MFrcVRSJSSEeA1W9zxJUgAqdn6n2r
	 Z+WAjFDm0sT4h6T1AEiMcYGpZF32XmZn3M/uY9O8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BE482F801DB;
	Wed, 12 Aug 2020 09:03:06 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8538EF8022D; Wed, 12 Aug 2020 09:03:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3A3BEF800F4
 for <alsa-devel@alsa-project.org>; Wed, 12 Aug 2020 09:02:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3A3BEF800F4
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id EF619B156;
 Wed, 12 Aug 2020 07:03:18 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ALSA: hda/realtek - Fix unused variable warning
Date: Wed, 12 Aug 2020 09:02:56 +0200
Message-Id: <20200812070256.32145-1-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
Cc: Hui Wang <hui.wang@canonical.com>, Stephen Rothwell <sfr@canb.auug.org.au>
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

The previous fix forgot to remove the unused variable that triggers a
compile warning now:
  sound/pci/hda/patch_realtek.c: In function 'alc285_fixup_hp_gpio_led':
  sound/pci/hda/patch_realtek.c:4163:19: warning: unused variable 'spec' [-Wunused-variable]

Fix it.

Fixes: 404690649e6a ("ALSA: hda - reverse the setting value in the micmute_led_set")
Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/hda/patch_realtek.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index 073029aeaf3c..7f9d35273734 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -4160,8 +4160,6 @@ static void alc269_fixup_hp_gpio_led(struct hda_codec *codec,
 static void alc285_fixup_hp_gpio_led(struct hda_codec *codec,
 				const struct hda_fixup *fix, int action)
 {
-	struct alc_spec *spec = codec->spec;
-
 	alc_fixup_hp_gpio_led(codec, action, 0x04, 0x01);
 }
 
-- 
2.16.4

