Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CBBC03C9A53
	for <lists+alsa-devel@lfdr.de>; Thu, 15 Jul 2021 10:15:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5343A171D;
	Thu, 15 Jul 2021 10:14:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5343A171D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1626336901;
	bh=j+3MgOZmZKVKtzbbjz1Mzbk9o2G4JAd+6kiHZ3MmcdQ=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hoAuTRKVmB2YAF++M5r9t6XJKXUEEm1ljYMDAKweL12Y+hiu6HWG5/ds/+o8mqpoI
	 og6X/XNVj/BZfCfvAJGMtEnoMzRllB1tCLS6A29X8vwalNMfkroktGnBrsY1ayzUe2
	 OUvhIWVIehu8BOy8FEtoBct1VapkiPrg4JYm5HTY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B7EF1F8065C;
	Thu, 15 Jul 2021 10:01:02 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0B60CF80638; Thu, 15 Jul 2021 10:00:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8C0F4F8051A
 for <alsa-devel@alsa-project.org>; Thu, 15 Jul 2021 10:00:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8C0F4F8051A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="MFYCCa73"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="NXcUJrcI"
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id 5CFDC22855
 for <alsa-devel@alsa-project.org>; Thu, 15 Jul 2021 08:00:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1626336008; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ua8gmzrmMRlKfY8bWvwnA52EO+DkpfM31m/tYg78vkQ=;
 b=MFYCCa73OMLNrqdD6KUl9wxKRWxSaKSrCCTrSSsbkJaZw+GMvmh1VHkz3FhLD56SucaVCP
 QdmN+BlHv25bjTDVbEyjMc4WJ6QM695BsN9aWGb/N3J01pi3iByLiej3Zck1sy8xqUPzNA
 7ukTnIzKKU6NFTcHMZywdnD52MUPbmo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1626336008;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ua8gmzrmMRlKfY8bWvwnA52EO+DkpfM31m/tYg78vkQ=;
 b=NXcUJrcI6wPbMYskkboBZLH3ieJVbXgnGHv0eiCYp4ysW/FR98iJvxmj9GMDxHTrik+Xao
 qZ/aQiHkxa0/GwCg==
Received: from alsa1.nue.suse.com (alsa1.suse.de [10.160.4.42])
 by relay2.suse.de (Postfix) with ESMTP id 4D428A3BB6;
 Thu, 15 Jul 2021 08:00:08 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH v2 38/79] ALSA: ice1724: Allocate resources with
 device-managed APIs
Date: Thu, 15 Jul 2021 09:59:00 +0200
Message-Id: <20210715075941.23332-39-tiwai@suse.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210715075941.23332-1-tiwai@suse.de>
References: <20210715075941.23332-1-tiwai@suse.de>
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

This patch converts the resource management in PCI ice1724 driver with
devres as a clean up.  Each manual resource management is converted
with the corresponding devres helper, and the card object release is
managed now via card->private_free instead of a lowlevel snd_device.
Along with it, the chip_exit callback chain is moved into the card's
private_free instead of the PCI remove callback, too.

This should give no user-visible functional changes.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/ice1712/ice1724.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/pci/ice1712/ice1724.c b/sound/pci/ice1712/ice1724.c
index 1cd84f9338f3..f6275868877a 100644
--- a/sound/pci/ice1712/ice1724.c
+++ b/sound/pci/ice1712/ice1724.c
@@ -2462,7 +2462,7 @@ static int snd_vt1724_create(struct snd_card *card,
 			     struct pci_dev *pci,
 			     const char *modelname)
 {
-	struct snd_ice1712 *ice;
+	struct snd_ice1712 *ice = card->private_data;
 	int err;
 
 	/* enable PCI device */
-- 
2.26.2

