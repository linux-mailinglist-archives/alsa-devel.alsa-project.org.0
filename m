Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D32884FD7E1
	for <lists+alsa-devel@lfdr.de>; Tue, 12 Apr 2022 12:33:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5EE8D1914;
	Tue, 12 Apr 2022 12:32:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5EE8D1914
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1649759607;
	bh=KgnKYQN1NBErWZfx8oulLJCih2HJ5OxRfnqTpYRLhxw=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=eLcgFn4E1CealT0laXOSa86a4JOXv31ksIarvr2QP9YGZpKvGlGIi5zLmmz311R3a
	 jIyGg5Dh40bcKRdUD0zLwUcjy9br+8mYkDxwlzpWInwY5aXhJwn4Yh2jim2vu7V8mM
	 qXOtzzSe62d1b5IYNamA3JmJ5Thr8pvzVl48asBY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D1205F805CB;
	Tue, 12 Apr 2022 12:27:32 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DDC52F805B5; Tue, 12 Apr 2022 12:27:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A3C43F80527
 for <alsa-devel@alsa-project.org>; Tue, 12 Apr 2022 12:26:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A3C43F80527
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="oFToAMZB"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="bviP9ZGs"
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id 743D21FD06
 for <alsa-devel@alsa-project.org>; Tue, 12 Apr 2022 10:26:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1649759204; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XuhCRLRYjLB3evYOFD8r7tVwyNZ3T1P/oUtkHvEqbjE=;
 b=oFToAMZBMNEoDvP9/15ndNXz+mfeygQgNDELTImM4cfBuyfgE6H5oN/X71uwQJgGs1w1yh
 I1I/f4weKw/przVaQLoSm5ao6Itcdzo7wejINEiW7eEcifPqcCw8oRWSwPPowRF91VEtrS
 Vz0rHqV7dL+1yO00fQVlTCsNYxBmzTU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1649759204;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XuhCRLRYjLB3evYOFD8r7tVwyNZ3T1P/oUtkHvEqbjE=;
 b=bviP9ZGsiYCWe27jtoPHc30DAOiuNNMD/Dci4v7PMbDWflhgEn4zWzyp9QLY9+RHOMm114
 11EK8CxEX6FIDZDg==
Received: from alsa1.nue.suse.com (alsa1.suse.de [10.160.4.42])
 by relay2.suse.de (Postfix) with ESMTP id 70E05A3B89;
 Tue, 12 Apr 2022 10:26:44 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 16/39] ALSA: fm801: Fix the missing snd_card_free() call at
 probe error
Date: Tue, 12 Apr 2022 12:26:13 +0200
Message-Id: <20220412102636.16000-17-tiwai@suse.de>
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

The previous cleanup with devres may lead to the incorrect release
orders at the probe error handling due to the devres's nature.  Until
we register the card, snd_card_free() has to be called at first for
releasing the stuff properly when the driver tries to manage and
release the stuff via card->private_free().

This patch fixes it by calling snd_card_free() on the error from the
probe callback using a new helper function.

Fixes: 47c413395376 ("ALSA: fm801: Allocate resources with device-managed APIs")
Cc: <stable@vger.kernel.org>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/fm801.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/sound/pci/fm801.c b/sound/pci/fm801.c
index 9c22ff19e56d..62b3cb126c6d 100644
--- a/sound/pci/fm801.c
+++ b/sound/pci/fm801.c
@@ -1268,8 +1268,8 @@ static int snd_fm801_create(struct snd_card *card,
 	return 0;
 }
 
-static int snd_card_fm801_probe(struct pci_dev *pci,
-				const struct pci_device_id *pci_id)
+static int __snd_card_fm801_probe(struct pci_dev *pci,
+				  const struct pci_device_id *pci_id)
 {
 	static int dev;
 	struct snd_card *card;
@@ -1333,6 +1333,12 @@ static int snd_card_fm801_probe(struct pci_dev *pci,
 	return 0;
 }
 
+static int snd_card_fm801_probe(struct pci_dev *pci,
+				const struct pci_device_id *pci_id)
+{
+	return snd_card_free_on_error(&pci->dev, __snd_card_fm801_probe(pci, pci_id));
+}
+
 #ifdef CONFIG_PM_SLEEP
 static const unsigned char saved_regs[] = {
 	FM801_PCM_VOL, FM801_I2S_VOL, FM801_FM_VOL, FM801_REC_SRC,
-- 
2.31.1

