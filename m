Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D4E8C39F89D
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Jun 2021 16:12:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 748A416FE;
	Tue,  8 Jun 2021 16:11:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 748A416FE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1623161559;
	bh=trkAL7eUsNE+SkyVCNtBVgRXp7QQn5rzxlfgIsvBFKU=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=GiMmuxE9BX/zP3vu/qBcSL7ZbjzRDn0jBMDekSB/3ztIn+tBJmixVS8iTn/N7AM7F
	 ml+Echz8G54zYVopBTHMUi2RoaJYghXgSdP7RBBlAaiikPAr7sG7NIPglI2LKEkChq
	 dUC9Qdhz+QLnMs93D0SNm+jeOwdb2WGfWlgNueYI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9560DF805AB;
	Tue,  8 Jun 2021 16:06:24 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8213BF80588; Tue,  8 Jun 2021 16:06:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 44C4AF804CB
 for <alsa-devel@alsa-project.org>; Tue,  8 Jun 2021 16:05:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 44C4AF804CB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="P9KSBt4e"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="31qTBajV"
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id 954FA1FD5A
 for <alsa-devel@alsa-project.org>; Tue,  8 Jun 2021 14:05:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1623161143; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1PbQE6yZOFyrQdZlQGi34S+yclkwI3IT7sG59p/G+vA=;
 b=P9KSBt4eYfsJt9IyxfX6mtPvY+fUYVxIiHPuZprF+0eJp17jOQDyyibUSJFUMEx0y7+t1D
 XeWiurXm489Zxbz3fwJoyks7s/AHyS0MTtQM1CM8dqDXpxTtpkJR1v9N2J7VYibpUCCR0j
 X5ADVbLGk2u+izMsKc78U6ztwDcp+Fs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1623161143;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1PbQE6yZOFyrQdZlQGi34S+yclkwI3IT7sG59p/G+vA=;
 b=31qTBajVYcNiBMd5AQBdlXALm78n1GmjUUSmQW/bY/Ze/ggIS04F8ujl//D9fyYy0Vfuom
 pJxtlg3bj/ZVoSDA==
Received: from alsa1.nue.suse.com (alsa1.suse.de [10.160.4.42])
 by relay2.suse.de (Postfix) with ESMTP id 87193A3B84;
 Tue,  8 Jun 2021 14:05:43 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 20/66] ALSA: azt3328: Fix assignment in if condition
Date: Tue,  8 Jun 2021 16:04:54 +0200
Message-Id: <20210608140540.17885-21-tiwai@suse.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210608140540.17885-1-tiwai@suse.de>
References: <20210608140540.17885-1-tiwai@suse.de>
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

PCI AZT3328 driver code contains a few assignments in if condition,
which is a bad coding style that may confuse readers and occasionally
lead to bugs.

This patch is merely for coding-style fixes, no functional changes.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/azt3328.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/sound/pci/azt3328.c b/sound/pci/azt3328.c
index 51dcf1bc4c0c..4ee7ab409807 100644
--- a/sound/pci/azt3328.c
+++ b/sound/pci/azt3328.c
@@ -1194,7 +1194,8 @@ snd_azf3328_mixer_new(struct snd_azf3328 *chip)
 	sw = snd_azf3328_mixer_controls;
 	for (idx = 0; idx < ARRAY_SIZE(snd_azf3328_mixer_controls);
 			++idx, ++sw) {
-		if ((err = snd_ctl_add(chip->card, snd_ctl_new1(sw, chip))) < 0)
+		err = snd_ctl_add(chip->card, snd_ctl_new1(sw, chip));
+		if (err < 0)
 			return err;
 	}
 	snd_component_add(card, "AZF3328 mixer");
-- 
2.26.2

