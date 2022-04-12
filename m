Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3963B4FD7C1
	for <lists+alsa-devel@lfdr.de>; Tue, 12 Apr 2022 12:31:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DB28118AB;
	Tue, 12 Apr 2022 12:30:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DB28118AB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1649759462;
	bh=iqh48JKpIai8r6FEqZ5erUd42kU8XJHco8YUTKTZOF0=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=p7z6dUKMRqtfo9MlTWPXaMMzYDGzznywMu84Iq1n8uqhcoJ7q7JlqynTY6HuUCZQf
	 UnHJLy6+lQ4E+HeMx2FiJd3RvaclwD8tREp+XncZbQ4DuYLgxOr+7/9RnpLkH8FU7k
	 XIfDU2UgkZTz6svHMzMT5or9URWP89t8PiNTiUR8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 53822F80589;
	Tue, 12 Apr 2022 12:27:17 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 652E8F8056F; Tue, 12 Apr 2022 12:27:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 36872F80506
 for <alsa-devel@alsa-project.org>; Tue, 12 Apr 2022 12:26:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 36872F80506
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="etaZ5viv"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="1eLsLsle"
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id 66FCF1FD02
 for <alsa-devel@alsa-project.org>; Tue, 12 Apr 2022 10:26:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1649759204; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qVAYNsL7ePHzsADD4iBWp9Y0yaUujcJib3/ATtFcymE=;
 b=etaZ5vivRTvWDtN5TcorckSnikFww9GMidzEMkY8jzvIIkqsz4PogLDQ/1MfCxWzL7H/G6
 GjrknLqIYzZ7h43HRwlofCNq+BHpufN3Sh9bPlNufsZl4u7d4vfZckjq5aT/WUt/xe7TMd
 YmHuJ4I52xRQWyiJfSxlcT0HNPskLac=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1649759204;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qVAYNsL7ePHzsADD4iBWp9Y0yaUujcJib3/ATtFcymE=;
 b=1eLsLslemUQjVCU9+KHghiZX6xs5IJu3nJBq2IK+k0BG8R+9sejV5soA4+o8zxDiyH+CmA
 COLeo0LU+zN74rDQ==
Received: from alsa1.nue.suse.com (alsa1.suse.de [10.160.4.42])
 by relay2.suse.de (Postfix) with ESMTP id 62FCAA3B83;
 Tue, 12 Apr 2022 10:26:44 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 11/39] ALSA: cs5535audio: Fix the missing snd_card_free() call
 at probe error
Date: Tue, 12 Apr 2022 12:26:08 +0200
Message-Id: <20220412102636.16000-12-tiwai@suse.de>
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

Fixes: 5eba4c646dfe ("ALSA: cs5535audio: Allocate resources with device-managed APIs")
Cc: <stable@vger.kernel.org>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/cs5535audio/cs5535audio.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/sound/pci/cs5535audio/cs5535audio.c b/sound/pci/cs5535audio/cs5535audio.c
index 499fa0148f9a..440b8f9b40c9 100644
--- a/sound/pci/cs5535audio/cs5535audio.c
+++ b/sound/pci/cs5535audio/cs5535audio.c
@@ -281,8 +281,8 @@ static int snd_cs5535audio_create(struct snd_card *card,
 	return 0;
 }
 
-static int snd_cs5535audio_probe(struct pci_dev *pci,
-				 const struct pci_device_id *pci_id)
+static int __snd_cs5535audio_probe(struct pci_dev *pci,
+				   const struct pci_device_id *pci_id)
 {
 	static int dev;
 	struct snd_card *card;
@@ -331,6 +331,12 @@ static int snd_cs5535audio_probe(struct pci_dev *pci,
 	return 0;
 }
 
+static int snd_cs5535audio_probe(struct pci_dev *pci,
+				 const struct pci_device_id *pci_id)
+{
+	return snd_card_free_on_error(&pci->dev, __snd_cs5535audio_probe(pci, pci_id));
+}
+
 static struct pci_driver cs5535audio_driver = {
 	.name = KBUILD_MODNAME,
 	.id_table = snd_cs5535audio_ids,
-- 
2.31.1

