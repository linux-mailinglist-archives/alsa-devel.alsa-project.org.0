Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AEE74FD738
	for <lists+alsa-devel@lfdr.de>; Tue, 12 Apr 2022 12:27:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A9E3917F5;
	Tue, 12 Apr 2022 12:27:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A9E3917F5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1649759273;
	bh=NyEov76FVT6UM7O7IpOJPAzf+GugyNwr3F1P1SQndGU=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=if3wzPujlGqAzpd1b79Lx7hc5/WgKaXviMWWigIBq2RQG9gPef4me6CZwL2qxBd5E
	 Tft26gPIHtZ7cm0hKAAz+XoOPKSMD+mHCFRqqWw2uJnozyb9QWzKWT1QmwUnmFBSzM
	 UhhsvfH7zSIerlTa4IaRSrplzQ5HqJVJW5nGt7DY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1E674F80095;
	Tue, 12 Apr 2022 12:26:54 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 814C5F80549; Tue, 12 Apr 2022 12:26:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BFF9FF80109
 for <alsa-devel@alsa-project.org>; Tue, 12 Apr 2022 12:26:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BFF9FF80109
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="czCQbi73"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="bJPsd6Cc"
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id 49E1E1F868
 for <alsa-devel@alsa-project.org>; Tue, 12 Apr 2022 10:26:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1649759204; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CP5wgP1IcHIcszdlgLTcLAv5vs6xaFTXgSgrdXazqXA=;
 b=czCQbi73fbh+rRH3y/CYenjezzBUGiBCuvmwNZ7S1vbmgtR9gF1tPWk68TM5JGIUWZ6Sxn
 9RndRynlWwregyVACTO2C8OuKi7eUg+dqCkYAUFZ3a/w/CXV3NPO+z8hfqsNYfpakJxDAT
 E6fkFTutEa+bdm6wtOOfiVsrOe8ICLE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1649759204;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CP5wgP1IcHIcszdlgLTcLAv5vs6xaFTXgSgrdXazqXA=;
 b=bJPsd6CcsDnMFyynlx4NwXRejbEqrdTo/i91h9Av6p/BmGORUURi9OXeG7KRgECdIYs7Xr
 dnU4v8JKpG+giVAA==
Received: from alsa1.nue.suse.com (alsa1.suse.de [10.160.4.42])
 by relay2.suse.de (Postfix) with ESMTP id 45109A3B82;
 Tue, 12 Apr 2022 10:26:44 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 04/39] ALSA: ali5451: Fix the missing snd_card_free() call at
 probe error
Date: Tue, 12 Apr 2022 12:26:01 +0200
Message-Id: <20220412102636.16000-5-tiwai@suse.de>
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

The recent cleanup with devres may lead to the incorrect release
orders at the probe error handling due to the devres's nature.  Until
we register the card, snd_card_free() has to be called at first for
releasing the stuff properly when the driver tries to manage and
release the stuff via card->private_free().

This patch fixes it by calling snd_card_free() on the error from the
probe callback using a new helper function.

Fixes: 1f0819979248 ("ALSA: ali5451: Allocate resources with device-managed APIs")
Cc: <stable@vger.kernel.org>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/ali5451/ali5451.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/sound/pci/ali5451/ali5451.c b/sound/pci/ali5451/ali5451.c
index 92eb59db106d..2378a39abaeb 100644
--- a/sound/pci/ali5451/ali5451.c
+++ b/sound/pci/ali5451/ali5451.c
@@ -2124,8 +2124,8 @@ static int snd_ali_create(struct snd_card *card,
 	return 0;
 }
 
-static int snd_ali_probe(struct pci_dev *pci,
-			 const struct pci_device_id *pci_id)
+static int __snd_ali_probe(struct pci_dev *pci,
+			   const struct pci_device_id *pci_id)
 {
 	struct snd_card *card;
 	struct snd_ali *codec;
@@ -2170,6 +2170,12 @@ static int snd_ali_probe(struct pci_dev *pci,
 	return 0;
 }
 
+static int snd_ali_probe(struct pci_dev *pci,
+			 const struct pci_device_id *pci_id)
+{
+	return snd_card_free_on_error(&pci->dev, __snd_ali_probe(pci, pci_id));
+}
+
 static struct pci_driver ali5451_driver = {
 	.name = KBUILD_MODNAME,
 	.id_table = snd_ali_ids,
-- 
2.31.1

