Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 204704FD769
	for <lists+alsa-devel@lfdr.de>; Tue, 12 Apr 2022 12:28:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B6DA4188A;
	Tue, 12 Apr 2022 12:28:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B6DA4188A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1649759335;
	bh=njAoagun8JDqCoy9wCTL9urIYtZlSomJ+5b4yeU8SR8=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fhToUM9uIeqOaa0kVdExApjMpg7KgMk+1KzDAegjwp0r0rVrO4d03JbmeaoVi5xVU
	 1FmHKlYCX3A6syZhWaHJi/AZoebUgcXXhGR9jy7HYgi0ZU+JXfJSqr6z4xvIs2vTwh
	 VDHOzjPR7kbNh1keZt1YyvP9lZqWh/DU+wECIT1c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 89120F80154;
	Tue, 12 Apr 2022 12:27:02 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 99BF6F80559; Tue, 12 Apr 2022 12:26:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D9720F80134
 for <alsa-devel@alsa-project.org>; Tue, 12 Apr 2022 12:26:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D9720F80134
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="KPMHiHgU"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="UZYL9lrN"
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id 8602B2160B
 for <alsa-devel@alsa-project.org>; Tue, 12 Apr 2022 10:26:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1649759204; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xTh4slqrdHVfRLdHGuV2xKtzClg1VRRWXHIGxbCMQtw=;
 b=KPMHiHgUtNZIEx9KaVxDK9fBOk4bz68SlOeTQbMad0lSV7LS/JM5rHLZk67LulcBd+AwXn
 k56VvfE57uDCOaM3JHZsm4X/Jh/LBjdScCfUaM1V4fgwCNuv8L/h3eVpFDJcLCXHv3nY/n
 oVj97sGJP/yobS9gPAXkwP72ZrrGNJ0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1649759204;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xTh4slqrdHVfRLdHGuV2xKtzClg1VRRWXHIGxbCMQtw=;
 b=UZYL9lrNF9CL42OhPa0sr5paZiBrnwGb2EpxeiBxhyBmycSXeiRfFJOOYEWSwuiAIIPwTy
 rU8n19kIFzYJXHCQ==
Received: from alsa1.nue.suse.com (alsa1.suse.de [10.160.4.42])
 by relay2.suse.de (Postfix) with ESMTP id 75E6FA3B8A;
 Tue, 12 Apr 2022 10:26:44 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 18/39] ALSA: intel8x0: Fix the missing snd_card_free() call at
 probe error
Date: Tue, 12 Apr 2022 12:26:15 +0200
Message-Id: <20220412102636.16000-19-tiwai@suse.de>
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

Fixes: 7835e0901e24 ("ALSA: intel8x0: Allocate resources with device-managed APIs")
Cc: <stable@vger.kernel.org>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/intel8x0.c  | 10 ++++++++--
 sound/pci/intel8x0m.c | 10 ++++++++--
 2 files changed, 16 insertions(+), 4 deletions(-)

diff --git a/sound/pci/intel8x0.c b/sound/pci/intel8x0.c
index a51032b3ac4d..ae285c0a629c 100644
--- a/sound/pci/intel8x0.c
+++ b/sound/pci/intel8x0.c
@@ -3109,8 +3109,8 @@ static int check_default_spdif_aclink(struct pci_dev *pci)
 	return 0;
 }
 
-static int snd_intel8x0_probe(struct pci_dev *pci,
-			      const struct pci_device_id *pci_id)
+static int __snd_intel8x0_probe(struct pci_dev *pci,
+				const struct pci_device_id *pci_id)
 {
 	struct snd_card *card;
 	struct intel8x0 *chip;
@@ -3189,6 +3189,12 @@ static int snd_intel8x0_probe(struct pci_dev *pci,
 	return 0;
 }
 
+static int snd_intel8x0_probe(struct pci_dev *pci,
+			      const struct pci_device_id *pci_id)
+{
+	return snd_card_free_on_error(&pci->dev, __snd_intel8x0_probe(pci, pci_id));
+}
+
 static struct pci_driver intel8x0_driver = {
 	.name = KBUILD_MODNAME,
 	.id_table = snd_intel8x0_ids,
diff --git a/sound/pci/intel8x0m.c b/sound/pci/intel8x0m.c
index 7de3cb2f17b5..2845cc006d0c 100644
--- a/sound/pci/intel8x0m.c
+++ b/sound/pci/intel8x0m.c
@@ -1178,8 +1178,8 @@ static struct shortname_table {
 	{ 0 },
 };
 
-static int snd_intel8x0m_probe(struct pci_dev *pci,
-			       const struct pci_device_id *pci_id)
+static int __snd_intel8x0m_probe(struct pci_dev *pci,
+				 const struct pci_device_id *pci_id)
 {
 	struct snd_card *card;
 	struct intel8x0m *chip;
@@ -1225,6 +1225,12 @@ static int snd_intel8x0m_probe(struct pci_dev *pci,
 	return 0;
 }
 
+static int snd_intel8x0m_probe(struct pci_dev *pci,
+			       const struct pci_device_id *pci_id)
+{
+	return snd_card_free_on_error(&pci->dev, __snd_intel8x0m_probe(pci, pci_id));
+}
+
 static struct pci_driver intel8x0m_driver = {
 	.name = KBUILD_MODNAME,
 	.id_table = snd_intel8x0m_ids,
-- 
2.31.1

