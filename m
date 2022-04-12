Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 31E064FD81A
	for <lists+alsa-devel@lfdr.de>; Tue, 12 Apr 2022 12:35:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BD262193F;
	Tue, 12 Apr 2022 12:34:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BD262193F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1649759711;
	bh=nXPT4FsOx4P9S+mCoAJsjODqLtzWta+fW+65FNk0X2E=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=FmGU5PUDkIvav9fKj6X8QGo38n9TBl6OGkV8hL/S5PtAMh1L4A3lDu6kYPaX71fuO
	 IanDK4O7E2bJGDtwdTtFXmIthqIabBjTrsIKFZPt2WZ/VjDOX7+qu+ZUfP4ph/X4qp
	 Z/XgP+Upi60aRzIhLkOBUIRFTieZR2teo3WstL9U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5A8A5F805ED;
	Tue, 12 Apr 2022 12:27:43 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9B25DF805C5; Tue, 12 Apr 2022 12:27:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0376CF80533
 for <alsa-devel@alsa-project.org>; Tue, 12 Apr 2022 12:26:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0376CF80533
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="n8UW825T"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="/RF7fEj8"
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id B5CAC2160C
 for <alsa-devel@alsa-project.org>; Tue, 12 Apr 2022 10:26:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1649759204; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=P9363mVAO43lU2rEf0MaglZeHy5p2XxAOfQpKlRDPpk=;
 b=n8UW825Tu7l6ABF4mJA9muurnC5nYB0F4nQvsEaVdatuwgRvwHBsKnnPbs+CmwKm+QDa/m
 hcR0sTB4NbC6TANdKAMkp/Yk+ds/857xUO5cEEmBB9wqZD6TzSAo8X6KqRsWi4AsSWRYGE
 K6jkzQKWwalayj2A4978px9kTg0DQX0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1649759204;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=P9363mVAO43lU2rEf0MaglZeHy5p2XxAOfQpKlRDPpk=;
 b=/RF7fEj8naJccB8PXZvMyxJSn1WNh6x3pdPipWWj4Xyu03e27D9cCKAq1OCPc3ajO6jl4p
 Xvz0oINTtUXXqmAg==
Received: from alsa1.nue.suse.com (alsa1.suse.de [10.160.4.42])
 by relay2.suse.de (Postfix) with ESMTP id A57F6A3B87;
 Tue, 12 Apr 2022 10:26:44 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 27/39] ALSA: sis7019: Fix the missing error handling
Date: Tue, 12 Apr 2022 12:26:24 +0200
Message-Id: <20220412102636.16000-28-tiwai@suse.de>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220412102636.16000-1-tiwai@suse.de>
References: <20220412102636.16000-1-tiwai@suse.de>
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

The previous cleanup with devres forgot to replace the snd_card_free()
call with the devm version.  Moreover, it still needs the manual call
of snd_card_free() at the probe error path, otherwise the reverse
order of the releases may happen.  This patch addresses those issues.

Fixes: 499ddc16394c ("ALSA: sis7019: Allocate resources with device-managed APIs")
Cc: <stable@vger.kernel.org>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/sis7019.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/sound/pci/sis7019.c b/sound/pci/sis7019.c
index 0b722b0e0604..fabe393607f8 100644
--- a/sound/pci/sis7019.c
+++ b/sound/pci/sis7019.c
@@ -1331,8 +1331,8 @@ static int sis_chip_create(struct snd_card *card,
 	return 0;
 }
 
-static int snd_sis7019_probe(struct pci_dev *pci,
-			     const struct pci_device_id *pci_id)
+static int __snd_sis7019_probe(struct pci_dev *pci,
+			       const struct pci_device_id *pci_id)
 {
 	struct snd_card *card;
 	struct sis7019 *sis;
@@ -1352,8 +1352,8 @@ static int snd_sis7019_probe(struct pci_dev *pci,
 	if (!codecs)
 		codecs = SIS_PRIMARY_CODEC_PRESENT;
 
-	rc = snd_card_new(&pci->dev, index, id, THIS_MODULE,
-			  sizeof(*sis), &card);
+	rc = snd_devm_card_new(&pci->dev, index, id, THIS_MODULE,
+			       sizeof(*sis), &card);
 	if (rc < 0)
 		return rc;
 
@@ -1386,6 +1386,12 @@ static int snd_sis7019_probe(struct pci_dev *pci,
 	return 0;
 }
 
+static int snd_sis7019_probe(struct pci_dev *pci,
+			     const struct pci_device_id *pci_id)
+{
+	return snd_card_free_on_error(&pci->dev, __snd_sis7019_probe(pci, pci_id));
+}
+
 static struct pci_driver sis7019_driver = {
 	.name = KBUILD_MODNAME,
 	.id_table = snd_sis7019_ids,
-- 
2.31.1

