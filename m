Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C224E3C9A57
	for <lists+alsa-devel@lfdr.de>; Thu, 15 Jul 2021 10:15:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5198A1745;
	Thu, 15 Jul 2021 10:14:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5198A1745
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1626336946;
	bh=NcxQpu8wBNQJ2essY+Ipq0ApuQvhPxzrAmJfslflcyE=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WFhhfnzE4yAav1ajnhVO+59YeBDYCIiN9XioOW8594tnbwlBFWITYx6wkW4Ic69Im
	 Pj5RIJ8FfhnMsGzmmoZbc31VPOZjEq2rzwKzQ/tw99MBBZpnUBBPAsqgobO0W5VsG6
	 FYMQjfJ1CTtjkOmV2TYWdDObT6o36LeQIZjYsNB4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A8444F80675;
	Thu, 15 Jul 2021 10:01:05 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 02A50F80637; Thu, 15 Jul 2021 10:00:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 37592F80517
 for <alsa-devel@alsa-project.org>; Thu, 15 Jul 2021 10:00:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 37592F80517
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="ZiCMYKGw"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="9QQOJS9h"
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id 04E4422854
 for <alsa-devel@alsa-project.org>; Thu, 15 Jul 2021 08:00:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1626336008; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5gPueraixoIVM02jU0IW2XB+HujyRxzkBWSTfK1cBgE=;
 b=ZiCMYKGwe7VykGtA07lIRw4k8sHYDlRxyzx0KTl4XmuScat/cowuqDomPGxq3gG6smnK9c
 L+6oEyG3IgGwUCQRPkpBXx8exDW2m9/9k7/Edrao20tqc2Ak+YL1+pWzEtZfAfxTFd1K0t
 azzveMJtPm+bcfz6Ff/DcU2WQFGCQrs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1626336008;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5gPueraixoIVM02jU0IW2XB+HujyRxzkBWSTfK1cBgE=;
 b=9QQOJS9hhNEJ90c8Fc6l93MABa5NMxb2CPIuC9KSvs9Hhxmo2odcUxn7qJUxkn64x4mQLp
 UuHnrWkBQvfX/aDw==
Received: from alsa1.nue.suse.com (alsa1.suse.de [10.160.4.42])
 by relay2.suse.de (Postfix) with ESMTP id E9336A3BB0;
 Thu, 15 Jul 2021 08:00:07 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH v2 37/79] ALSA: ali5451: Allocate resources with
 device-managed APIs
Date: Thu, 15 Jul 2021 09:58:59 +0200
Message-Id: <20210715075941.23332-38-tiwai@suse.de>
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

This patch converts the resource management in PCI ali5451 driver with
devres as a clean up.  Each manual resource management is converted
with the corresponding devres helper, and the card object release is
managed now via card->private_free instead of a lowlevel snd_device.

This should give no user-visible functional changes.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/ali5451/ali5451.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/pci/ali5451/ali5451.c b/sound/pci/ali5451/ali5451.c
index ccbf9e2c72d6..92eb59db106d 100644
--- a/sound/pci/ali5451/ali5451.c
+++ b/sound/pci/ali5451/ali5451.c
@@ -2026,7 +2026,7 @@ static int snd_ali_create(struct snd_card *card,
 			  int pcm_streams,
 			  int spdif_support)
 {
-	struct snd_ali *codec;
+	struct snd_ali *codec = card->private_data;
 	int i, err;
 	unsigned short cmdw;
 
-- 
2.26.2

