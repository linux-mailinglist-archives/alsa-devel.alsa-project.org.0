Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CD264FD8A1
	for <lists+alsa-devel@lfdr.de>; Tue, 12 Apr 2022 12:37:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2AE5118B0;
	Tue, 12 Apr 2022 12:36:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2AE5118B0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1649759839;
	bh=xCZ+4fZ8xZExf4Aql2gsVOm1fQI2QAHIrYECt3sC4iA=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=sRGnoxIbpRueJj3lFrrCoxxQ93F2T58/7j+DkBxgBGDgfhZn3ZQ8+ftkwWozbEGP+
	 1uw+XLlsXHSVTmVuS/ZQTG11XGLRtcG915I6MF6bifJv/yxS+Gp4SuukAzOm8PHYNx
	 4kEi093zbIZ3cQkUE2jJG8WyaqaKFDv8P5RRt7kw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 81DA6F80609;
	Tue, 12 Apr 2022 12:27:49 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1E6DCF805E3; Tue, 12 Apr 2022 12:27:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1451EF8053C
 for <alsa-devel@alsa-project.org>; Tue, 12 Apr 2022 12:26:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1451EF8053C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="r2TjCwNC"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="C5q7Y75F"
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id B88711FD11
 for <alsa-devel@alsa-project.org>; Tue, 12 Apr 2022 10:26:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1649759204; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yTRz9w0+2BwzdW2kURkmLq+QBcI3dur4zsEOff0jXrY=;
 b=r2TjCwNChjXnI0eDzBgD7zIrGNrJNTLsm4NTBWz9FGD4LfcYpiOls2WEDGEgeI2dgk4MYs
 nPwPPyaELMY8c/Prc8kR7VIJ+DIa3VNMXzk4aK7lvSpcVKY0dcgbDY4tvplq7pcoBIzARN
 xeCDtpS9aYQNR074lBOOMqxys+wOkTU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1649759204;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yTRz9w0+2BwzdW2kURkmLq+QBcI3dur4zsEOff0jXrY=;
 b=C5q7Y75Fhg/DQy3toluuBrwniqIPrPm6RiVOC1IRk4EL5VdT8W4KOswQXhUeM7ItdoXpvo
 r3XOUVAYQmUqgpCQ==
Received: from alsa1.nue.suse.com (alsa1.suse.de [10.160.4.42])
 by relay2.suse.de (Postfix) with ESMTP id B3984A3B82;
 Tue, 12 Apr 2022 10:26:44 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 28/39] ALSA: bt87x: Fix the missing snd_card_free() call at
 probe error
Date: Tue, 12 Apr 2022 12:26:25 +0200
Message-Id: <20220412102636.16000-29-tiwai@suse.de>
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

Fixes: 9e80ed64a006 ("ALSA: bt87x: Allocate resources with device-managed APIs")
Cc: <stable@vger.kernel.org>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/bt87x.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/sound/pci/bt87x.c b/sound/pci/bt87x.c
index d23f93163841..621985bfee5d 100644
--- a/sound/pci/bt87x.c
+++ b/sound/pci/bt87x.c
@@ -805,8 +805,8 @@ static int snd_bt87x_detect_card(struct pci_dev *pci)
 	return SND_BT87X_BOARD_UNKNOWN;
 }
 
-static int snd_bt87x_probe(struct pci_dev *pci,
-			   const struct pci_device_id *pci_id)
+static int __snd_bt87x_probe(struct pci_dev *pci,
+			     const struct pci_device_id *pci_id)
 {
 	static int dev;
 	struct snd_card *card;
@@ -889,6 +889,12 @@ static int snd_bt87x_probe(struct pci_dev *pci,
 	return 0;
 }
 
+static int snd_bt87x_probe(struct pci_dev *pci,
+			   const struct pci_device_id *pci_id)
+{
+	return snd_card_free_on_error(&pci->dev, __snd_bt87x_probe(pci, pci_id));
+}
+
 /* default entries for all Bt87x cards - it's not exported */
 /* driver_data is set to 0 to call detection */
 static const struct pci_device_id snd_bt87x_default_ids[] = {
-- 
2.31.1

