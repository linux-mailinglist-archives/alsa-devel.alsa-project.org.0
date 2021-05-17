Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FFD4382D3A
	for <lists+alsa-devel@lfdr.de>; Mon, 17 May 2021 15:18:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9EABE1663;
	Mon, 17 May 2021 15:18:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9EABE1663
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1621257535;
	bh=YFWu2Y5PESW2sRpRLsKxWB51Jyqi3EgNI8gU2zkOmiQ=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WLB2I1lf8Gf4KcumenHNMrnG2a2wc8YONOfVX3KirL5G/kCpInNWHLx5oUHjRh1GQ
	 LEfW5VL4g1QigcCo7cEwoAMOIdH6ylX23pDlU6S7f9fjPo33aSxHOsjaCPRh2Hdw+m
	 hURKkPSBj4iI1qbsxsMNUr3YWNYDcGeo36IjBjZg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 63EC2F80425;
	Mon, 17 May 2021 15:16:12 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6F41EF804AD; Mon, 17 May 2021 15:16:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 22678F80246
 for <alsa-devel@alsa-project.org>; Mon, 17 May 2021 15:15:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 22678F80246
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 83698B1E1
 for <alsa-devel@alsa-project.org>; Mon, 17 May 2021 13:15:52 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 05/11] ALSA: usx2y: Avoid self-killing
Date: Mon, 17 May 2021 15:15:39 +0200
Message-Id: <20210517131545.27252-6-tiwai@suse.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210517131545.27252-1-tiwai@suse.de>
References: <20210517131545.27252-1-tiwai@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

The initialization os usx2y driver is multi-staged, and the PCM and
other device creations are done after the DSP is loaded and
initialized.  Upon the initialization, when an error happens, the
driver tries to call snd_card_free().  But this is dangerous, and in
general, the driver cannot kill itself during its operation.
Hence better to drop the snd_card_free() call from there.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/usb/usx2y/usX2Yhwdep.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/sound/usb/usx2y/usX2Yhwdep.c b/sound/usb/usx2y/usX2Yhwdep.c
index 0ed50be89271..ec7e3beed4f9 100644
--- a/sound/usb/usx2y/usX2Yhwdep.c
+++ b/sound/usb/usx2y/usX2Yhwdep.c
@@ -220,7 +220,6 @@ static int snd_usx2y_hwdep_dsp_load(struct snd_hwdep *hw,
 		err = usx2y_create_alsa_devices(hw->card);
 		if (err) {
 			snd_printk(KERN_ERR "usx2y_create_alsa_devices error %i\n", err);
-			snd_card_free(hw->card);
 			return err;
 		}
 		priv->chip_status |= USX2Y_STAT_CHIP_INIT;
-- 
2.26.2

