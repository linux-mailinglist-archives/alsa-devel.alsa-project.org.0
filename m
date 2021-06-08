Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4014439F8A7
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Jun 2021 16:13:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CB0A71728;
	Tue,  8 Jun 2021 16:12:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CB0A71728
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1623161627;
	bh=7FfnBSDPYtjIjnG46xjLHewrKm2bmai/Y7TjGPVJFEY=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XcwZL/jhKwslqWt/qtUHdvWK/emS8HrGUng9ARIzbWvS8fwdwBQzhXTX9LaQwU/TZ
	 XgKa/35fgjZ5sVWFmoi4X48uEOYak+b8Eww353IXb6Xr1JrNs1z0AwSgPL1Yiorfg4
	 71tfoZmrFeZtyMvw+VqIHNexi4/emPDx9RDQFX8Q=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F1875F805B3;
	Tue,  8 Jun 2021 16:06:29 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DF3A1F805A1; Tue,  8 Jun 2021 16:06:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5B639F804CF
 for <alsa-devel@alsa-project.org>; Tue,  8 Jun 2021 16:05:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5B639F804CF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="UB7xBYv0"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="2EIMtmzP"
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id A253B1FD5B
 for <alsa-devel@alsa-project.org>; Tue,  8 Jun 2021 14:05:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1623161143; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vpWoq2DTY1aFd4D1w+V7LqrOsRz2kV+MlzhmWa4phyk=;
 b=UB7xBYv0oruPNe64Iwe6fXDNmKLUJNM1L5yijm67iaDLQ6lYdkNNJg+g4XxHCjYwCdtNTO
 ikvTdpGo0ZynO4DiE0N77ULYCTi8upU6bQZ4Vwk7cwKCTpJt4jGEq6tMQCNtLY19Rp+COa
 kuqDH0z+5mZXm+KPs55KC5IWfagFLTs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1623161143;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vpWoq2DTY1aFd4D1w+V7LqrOsRz2kV+MlzhmWa4phyk=;
 b=2EIMtmzPqQqyjIc58kWc85/a0HRUcMON4cAuTYE1lNxpEnx4z3YfUXciMoU6IXLw9hflzR
 Gk/t2n+fQqJqMhDA==
Received: from alsa1.nue.suse.com (alsa1.suse.de [10.160.4.42])
 by relay2.suse.de (Postfix) with ESMTP id 93876A3B88;
 Tue,  8 Jun 2021 14:05:43 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 21/66] ALSA: bt87x: Fix assignment in if condition
Date: Tue,  8 Jun 2021 16:04:55 +0200
Message-Id: <20210608140540.17885-22-tiwai@suse.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210608140540.17885-1-tiwai@suse.de>
References: <20210608140540.17885-1-tiwai@suse.de>
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

PCI BT87x driver code contains an assignments in if condition, which
is a bad coding style that may confuse readers and occasionally lead
to bugs.

This patch is merely for coding-style fixes, no functional changes.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/bt87x.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/sound/pci/bt87x.c b/sound/pci/bt87x.c
index 91512b345d19..39bcfb81e81c 100644
--- a/sound/pci/bt87x.c
+++ b/sound/pci/bt87x.c
@@ -719,7 +719,8 @@ static int snd_bt87x_create(struct snd_card *card,
 	chip->irq = -1;
 	spin_lock_init(&chip->reg_lock);
 
-	if ((err = pci_request_regions(pci, "Bt87x audio")) < 0) {
+	err = pci_request_regions(pci, "Bt87x audio");
+	if (err < 0) {
 		kfree(chip);
 		pci_disable_device(pci);
 		return err;
-- 
2.26.2

