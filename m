Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B91B54FD852
	for <lists+alsa-devel@lfdr.de>; Tue, 12 Apr 2022 12:35:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 66BE11957;
	Tue, 12 Apr 2022 12:35:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 66BE11957
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1649759758;
	bh=Tr8ZspZh5zuasphvzs/ZUFLjLdR7S6mjyF/LcZjQ9G0=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=l/ePP2MlfJYukUA0Ehe1iHkwN+uRdgpW/aDBVmZi1Ic3t2denJgfOkJApyzUZ32g7
	 9RVGxPBAjzs0u3ZNYsuGSl1CJydSG5IUZHna5UawC9r+bBz8NNjZ4Iau0+xg3+GByg
	 wgA7tnZGIahVvPr2uixThnVR1+NmJoAoLKlyXc5s=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 85BB2F80543;
	Tue, 12 Apr 2022 12:27:45 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D3821F805C9; Tue, 12 Apr 2022 12:27:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B0C2EF80537
 for <alsa-devel@alsa-project.org>; Tue, 12 Apr 2022 12:26:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B0C2EF80537
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="BrAXuGe4"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="IgNDNLb5"
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id A3FD51FD0F
 for <alsa-devel@alsa-project.org>; Tue, 12 Apr 2022 10:26:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1649759204; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Dd7/QsxKov5Wb3F3VhBS0FpeLv2uhXIS4qee59ep5g0=;
 b=BrAXuGe4EXJKE/SGYFkC4uVT9G/ABGZzzXGkFW6n47UFwHNZNukC0hon/g9RvTtekbrfY0
 YU6Qrtuszgmb/jdtTL/ybB7jvZjCG1hpnTxdabPCULeYd3h9gK9OaxJgV3Zm80JMHvQorE
 /MK8xSjYGtvxyubetXyq3nBoGqGOy3g=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1649759204;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Dd7/QsxKov5Wb3F3VhBS0FpeLv2uhXIS4qee59ep5g0=;
 b=IgNDNLb5U1UqGOV+pPj2aIcFBI/P8cmjl/BQnEyVxxhXgCs9clj7xFKW4z9WGxKZuY7bA5
 roHyOL+NwAtPBkBA==
Received: from alsa1.nue.suse.com (alsa1.suse.de [10.160.4.42])
 by relay2.suse.de (Postfix) with ESMTP id 94B9AA3B82;
 Tue, 12 Apr 2022 10:26:44 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 25/39] ALSA: via82xx: Fix the missing snd_card_free() call at
 probe error
Date: Tue, 12 Apr 2022 12:26:22 +0200
Message-Id: <20220412102636.16000-26-tiwai@suse.de>
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

Fixes: afaf99751d0c ("ALSA: via82xx: Allocate resources with device-managed APIs")
Cc: <stable@vger.kernel.org>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/via82xx.c       | 10 ++++++++--
 sound/pci/via82xx_modem.c | 10 ++++++++--
 2 files changed, 16 insertions(+), 4 deletions(-)

diff --git a/sound/pci/via82xx.c b/sound/pci/via82xx.c
index 65514f7e42d7..361b83fd721e 100644
--- a/sound/pci/via82xx.c
+++ b/sound/pci/via82xx.c
@@ -2458,8 +2458,8 @@ static int check_dxs_list(struct pci_dev *pci, int revision)
 	return VIA_DXS_48K;
 };
 
-static int snd_via82xx_probe(struct pci_dev *pci,
-			     const struct pci_device_id *pci_id)
+static int __snd_via82xx_probe(struct pci_dev *pci,
+			       const struct pci_device_id *pci_id)
 {
 	struct snd_card *card;
 	struct via82xx *chip;
@@ -2569,6 +2569,12 @@ static int snd_via82xx_probe(struct pci_dev *pci,
 	return 0;
 }
 
+static int snd_via82xx_probe(struct pci_dev *pci,
+			     const struct pci_device_id *pci_id)
+{
+	return snd_card_free_on_error(&pci->dev, __snd_via82xx_probe(pci, pci_id));
+}
+
 static struct pci_driver via82xx_driver = {
 	.name = KBUILD_MODNAME,
 	.id_table = snd_via82xx_ids,
diff --git a/sound/pci/via82xx_modem.c b/sound/pci/via82xx_modem.c
index 234f7fbed236..ca7f024bf8ec 100644
--- a/sound/pci/via82xx_modem.c
+++ b/sound/pci/via82xx_modem.c
@@ -1103,8 +1103,8 @@ static int snd_via82xx_create(struct snd_card *card,
 }
 
 
-static int snd_via82xx_probe(struct pci_dev *pci,
-			     const struct pci_device_id *pci_id)
+static int __snd_via82xx_probe(struct pci_dev *pci,
+			       const struct pci_device_id *pci_id)
 {
 	struct snd_card *card;
 	struct via82xx_modem *chip;
@@ -1157,6 +1157,12 @@ static int snd_via82xx_probe(struct pci_dev *pci,
 	return 0;
 }
 
+static int snd_via82xx_probe(struct pci_dev *pci,
+			     const struct pci_device_id *pci_id)
+{
+	return snd_card_free_on_error(&pci->dev, __snd_via82xx_probe(pci, pci_id));
+}
+
 static struct pci_driver via82xx_modem_driver = {
 	.name = KBUILD_MODNAME,
 	.id_table = snd_via82xx_modem_ids,
-- 
2.31.1

