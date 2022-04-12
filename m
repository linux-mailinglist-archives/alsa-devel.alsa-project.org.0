Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 035564FD78B
	for <lists+alsa-devel@lfdr.de>; Tue, 12 Apr 2022 12:29:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 97CA9187A;
	Tue, 12 Apr 2022 12:28:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 97CA9187A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1649759379;
	bh=X+n/Z3lM/jbnjcURIqe4SQx4wq7LZhg8RlIteL9kHOo=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pbxmpc6WgyXWkk7okTXw2wtGZv2y/Nqcx6y0bmWNZPFm1ovn45+fA3fIPBpyoY/wh
	 TeOcIET8aGNnWRwMq6ObRbITfSod0pCNIJumzSsFTvmHUWP+fOrn3qbnal3o88AE9X
	 CjXvUXcOqEc0DpfJpGhYkfauVw3e0Fy9dDS9SsVQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CA36EF80567;
	Tue, 12 Apr 2022 12:27:07 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1B31FF80553; Tue, 12 Apr 2022 12:26:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DEABEF80249
 for <alsa-devel@alsa-project.org>; Tue, 12 Apr 2022 12:26:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DEABEF80249
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="Hhs9dRT+"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="o8ALBO8H"
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id 47B2A1F864
 for <alsa-devel@alsa-project.org>; Tue, 12 Apr 2022 10:26:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1649759204; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HrXa9MDXNf6Zu4FLb+MGTqBqWONJpX9+BK4SwX53wqk=;
 b=Hhs9dRT+JEQDQWfDS+BAQHac9LgkQT5dGZMWpeTAVoZHDYDD+oIppjW7iDHzO8/nJVGerT
 A7ejP78crIjsx/+TNwaAwMHjNlYrhj6PQrSBsK4jt34rZtqRkxa5JL3+1qVz1jSdoOok3B
 dutsoZqQbewaceDFcDes3fA0f+qPfa4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1649759204;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HrXa9MDXNf6Zu4FLb+MGTqBqWONJpX9+BK4SwX53wqk=;
 b=o8ALBO8H0wJYn264LpAugpZCU7I5PKSw4X+E7lz/imvtSIeMyDc1df8Or/XJgUz/fM2f9X
 q9NmgrOhKBOAHRDw==
Received: from alsa1.nue.suse.com (alsa1.suse.de [10.160.4.42])
 by relay2.suse.de (Postfix) with ESMTP id 4233EA3B88;
 Tue, 12 Apr 2022 10:26:44 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 03/39] ALSA: ad1889: Fix the missing snd_card_free() call at
 probe error
Date: Tue, 12 Apr 2022 12:26:00 +0200
Message-Id: <20220412102636.16000-4-tiwai@suse.de>
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

Fixes: 567f58754109 ("ALSA: ad1889: Allocate resources with device-managed APIs")
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/ad1889.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/sound/pci/ad1889.c b/sound/pci/ad1889.c
index bba4dae8dcc7..50e30704bf6f 100644
--- a/sound/pci/ad1889.c
+++ b/sound/pci/ad1889.c
@@ -844,8 +844,8 @@ snd_ad1889_create(struct snd_card *card, struct pci_dev *pci)
 }
 
 static int
-snd_ad1889_probe(struct pci_dev *pci,
-		 const struct pci_device_id *pci_id)
+__snd_ad1889_probe(struct pci_dev *pci,
+		   const struct pci_device_id *pci_id)
 {
 	int err;
 	static int devno;
@@ -904,6 +904,12 @@ snd_ad1889_probe(struct pci_dev *pci,
 	return 0;
 }
 
+static int snd_ad1889_probe(struct pci_dev *pci,
+			    const struct pci_device_id *pci_id)
+{
+	return snd_card_free_on_error(&pci->dev, __snd_ad1889_probe(pci, pci_id));
+}
+
 static const struct pci_device_id snd_ad1889_ids[] = {
 	{ PCI_DEVICE(PCI_VENDOR_ID_ANALOG_DEVICES, PCI_DEVICE_ID_AD1889JS) },
 	{ 0, },
-- 
2.31.1

