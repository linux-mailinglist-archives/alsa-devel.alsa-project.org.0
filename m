Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BA1254FD7C2
	for <lists+alsa-devel@lfdr.de>; Tue, 12 Apr 2022 12:31:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 65FB01849;
	Tue, 12 Apr 2022 12:30:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 65FB01849
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1649759484;
	bh=Kop0a4hq5FEJi3I45TCPhBbOL26Se9/YXC5l58ncIQM=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JbqP7TRisRYAvHoJMX0wyUYtJgWlQ3o5VSCWIgf641HWtPQW+PE6G7MPCwNYdHxR7
	 u2/kr4R9f/P+T24rWovzyGNhWPLtuNPutE+tsDyHPm8NgPC+fVVdze/k/0TxE4GxoP
	 mzywDNgiXsTs9NGmOybIf7RrnKGxqztyZTUxAz/k=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7EC39F805A9;
	Tue, 12 Apr 2022 12:27:19 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B89D5F80506; Tue, 12 Apr 2022 12:27:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 27E86F804FC
 for <alsa-devel@alsa-project.org>; Tue, 12 Apr 2022 12:26:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 27E86F804FC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="HsnQIHee"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="/svRIxDr"
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id 63D731FD01
 for <alsa-devel@alsa-project.org>; Tue, 12 Apr 2022 10:26:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1649759204; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MAZ9NWjtLiL1pyWL/57uD5CkyvSqLZz92QwDqO+9+T4=;
 b=HsnQIHeebyXoHn/o2Rtc4jfB36Elh7eGVAyfSUUGYAgV5415NfY4DR1Ms3ghwsVbH4r8JG
 SoVm37IFfnhb+fc1B14rYY4D0LpYK4E+cjKNkQbhk3wvsWYdozcIr10cVALAXdST6DP8Wy
 tEChXf/3INAaKUZaFABKJm3xi/H29Yw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1649759204;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MAZ9NWjtLiL1pyWL/57uD5CkyvSqLZz92QwDqO+9+T4=;
 b=/svRIxDrnUmiVsnBWlp98C5iN8R0nHWxBEvkzlPVt/Blg+dVHfm3C33ocxFWCxhDrkxWhY
 llfLRrTd8bvojADw==
Received: from alsa1.nue.suse.com (alsa1.suse.de [10.160.4.42])
 by relay2.suse.de (Postfix) with ESMTP id 607E0A3B82;
 Tue, 12 Apr 2022 10:26:44 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 10/39] ALSA: cs4281: Fix the missing snd_card_free() call at
 probe error
Date: Tue, 12 Apr 2022 12:26:07 +0200
Message-Id: <20220412102636.16000-11-tiwai@suse.de>
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

Fixes: 99041fea70d0 ("ALSA: cs4281: Allocate resources with device-managed APIs")
Cc: <stable@vger.kernel.org>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/cs4281.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/sound/pci/cs4281.c b/sound/pci/cs4281.c
index e7367402b84a..0c9cadf7b3b8 100644
--- a/sound/pci/cs4281.c
+++ b/sound/pci/cs4281.c
@@ -1827,8 +1827,8 @@ static void snd_cs4281_opl3_command(struct snd_opl3 *opl3, unsigned short cmd,
 	spin_unlock_irqrestore(&opl3->reg_lock, flags);
 }
 
-static int snd_cs4281_probe(struct pci_dev *pci,
-			    const struct pci_device_id *pci_id)
+static int __snd_cs4281_probe(struct pci_dev *pci,
+			      const struct pci_device_id *pci_id)
 {
 	static int dev;
 	struct snd_card *card;
@@ -1888,6 +1888,12 @@ static int snd_cs4281_probe(struct pci_dev *pci,
 	return 0;
 }
 
+static int snd_cs4281_probe(struct pci_dev *pci,
+			    const struct pci_device_id *pci_id)
+{
+	return snd_card_free_on_error(&pci->dev, __snd_cs4281_probe(pci, pci_id));
+}
+
 /*
  * Power Management
  */
-- 
2.31.1

