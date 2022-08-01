Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EB8CD586F1C
	for <lists+alsa-devel@lfdr.de>; Mon,  1 Aug 2022 18:59:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 857B31E2;
	Mon,  1 Aug 2022 18:58:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 857B31E2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1659373162;
	bh=QcMc9dsuiImCG9KV6Oc9hFaGn0gaUlJvn84yoBLN2f0=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=df1qWzZfX6rtlZMpJqYt0RUQUIn6xxkjCkzd0P0/pnQ5gOyyVXUMIdRiTVSeQ1FUf
	 wVqLJ/FpTPTSdQtRSn5e+ADW21FAYr6pSViYdRzvSYiLAr9Zdo8+xwrx96I4YPJuMq
	 du+UuOudENssZdN3rDDRGuneW+b9rHT/W99zI/BQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E32D8F80566;
	Mon,  1 Aug 2022 18:57:03 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 47ACCF802DB; Mon,  1 Aug 2022 18:56:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NO_DNS_FOR_FROM,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 23993F80543
 for <alsa-devel@alsa-project.org>; Mon,  1 Aug 2022 18:56:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 23993F80543
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="kCowJgmf"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="RUrHO2zB"
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 406A44D844;
 Mon,  1 Aug 2022 16:56:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1659373003; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QmWWJhqS7XW5k3QO+2OS2cKY/x986gmeNg6L6vMhi0k=;
 b=kCowJgmfvPshf0APHc/eUn/UR5/+jxJYNm7xy1cCR+oJZ6ZzHB8/mjNYi4yEwgwN25Beab
 ea0mXzvbtgcd0hronRMuNsacwlhnPeJPxmUGCppS6SWhzxTYQ2en7oVWVRkRMUkrhBrDff
 BmcJzfYoAbbTO4S0ksIO1a+yuoq7XKM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1659373003;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QmWWJhqS7XW5k3QO+2OS2cKY/x986gmeNg6L6vMhi0k=;
 b=RUrHO2zBBuR/DjYqdXM2bVruMNOXdIw+zuxYyqmWFZ8aih8gKHxc/zm3mYVLgry3OV2C+y
 lcQ6/y4/NsxgJnAQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 2225913AAE;
 Mon,  1 Aug 2022 16:56:43 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id UB6zBssF6GLXGgAAMHmgww
 (envelope-from <tiwai@suse.de>); Mon, 01 Aug 2022 16:56:43 +0000
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 4/7] ALSA: core: Replace scnprintf() with sysfs_emit()
Date: Mon,  1 Aug 2022 18:56:36 +0200
Message-Id: <20220801165639.26030-5-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220801165639.26030-1-tiwai@suse.de>
References: <20220801165639.26030-1-tiwai@suse.de>
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

sysfs_emit() is a new helper to simplify the sysfs string output.
Replace the open-code with this new helper.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/core/init.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/core/init.c b/sound/core/init.c
index 3ac95c66a4b5..193dae361fac 100644
--- a/sound/core/init.c
+++ b/sound/core/init.c
@@ -784,7 +784,7 @@ static ssize_t id_show(struct device *dev,
 		       struct device_attribute *attr, char *buf)
 {
 	struct snd_card *card = container_of(dev, struct snd_card, card_dev);
-	return scnprintf(buf, PAGE_SIZE, "%s\n", card->id);
+	return sysfs_emit(buf, "%s\n", card->id);
 }
 
 static ssize_t id_store(struct device *dev, struct device_attribute *attr,
@@ -822,7 +822,7 @@ static ssize_t number_show(struct device *dev,
 			   struct device_attribute *attr, char *buf)
 {
 	struct snd_card *card = container_of(dev, struct snd_card, card_dev);
-	return scnprintf(buf, PAGE_SIZE, "%i\n", card->number);
+	return sysfs_emit(buf, "%i\n", card->number);
 }
 
 static DEVICE_ATTR_RO(number);
-- 
2.35.3

