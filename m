Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D86381A33FB
	for <lists+alsa-devel@lfdr.de>; Thu,  9 Apr 2020 14:24:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5C5D4166D;
	Thu,  9 Apr 2020 14:23:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5C5D4166D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1586435044;
	bh=zyko2dMtIuiDFgoNXei9YB2XqCuvrhnXemqjZtUDAmc=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=JjbeGK20cylsjalXWnzIxIiZX5+dlVyc3Yj4GlsejnwnCJoHEbAfDbAYPliXTUmpG
	 xH8xieDRaF0g+qc8mZ6j9EwDf1k9Vy1Oy5KwbFIuP0gg/N66D7vqU8qNFa6L7T0R3E
	 L8eyOIM3U66ulO2Zp6Y4ydq5ore8bSpvG55AveSo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 787E5F801F9;
	Thu,  9 Apr 2020 14:22:23 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 94767F800CB; Thu,  9 Apr 2020 14:22:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from imap3.hz.codethink.co.uk (imap3.hz.codethink.co.uk [176.9.8.87])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4BB74F800CB
 for <alsa-devel@alsa-project.org>; Thu,  9 Apr 2020 14:22:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4BB74F800CB
Received: from 79-69-55-226.dynamic.dsl.as9105.com ([79.69.55.226]
 helo=localhost.localdomain)
 by imap3.hz.codethink.co.uk with esmtpsa  (Exim 4.92 #3 (Debian))
 id 1jMWCF-000293-EA; Thu, 09 Apr 2020 13:22:15 +0100
From: Tom Eccles <tom.eccles@codethink.co.uk>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ASoC: soc-core: Remove name length truncation
Date: Thu,  9 Apr 2020 13:21:50 +0100
Message-Id: <20200409122150.15473-1-tom.eccles@codethink.co.uk>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.com, Tom Eccles <tom.eccles@codethink.co.uk>
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

snd_soc_dai.name and snd_soc_component.name are a simplified version of
the parent device's name, truncated to NAME_SIZE characters (see
fmt_single_name). NAME_SIZE was 32 characters.

Some device names may share a common prefix longer than 32 characters,
which leads to non-unique snd_soc_dai.name and snd_soc_component.name.
When these are added to debugfs, the .name is used for the file. If the
names are not unique, adding to debugfs fails.

Instead, dynamically allocate name buffers to be as long as needed.

Signed-off-by: Tom Eccles <tom.eccles@codethink.co.uk>
---
 sound/soc/soc-core.c | 21 ++++++++++++---------
 1 file changed, 12 insertions(+), 9 deletions(-)

diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index 843b8b1c89d4..7803222ede54 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -43,8 +43,6 @@
 #define CREATE_TRACE_POINTS
 #include <trace/events/asoc.h>
 
-#define NAME_SIZE	32
-
 static DEFINE_MUTEX(client_mutex);
 static LIST_HEAD(component_list);
 static LIST_HEAD(unbind_card_list);
@@ -2291,13 +2289,15 @@ EXPORT_SYMBOL_GPL(snd_soc_unregister_card);
  */
 static char *fmt_single_name(struct device *dev, int *id)
 {
-	char *found, name[NAME_SIZE];
+	char *found, *name;
 	int id1, id2;
 
 	if (dev_name(dev) == NULL)
 		return NULL;
 
-	strlcpy(name, dev_name(dev), NAME_SIZE);
+	name = devm_kstrdup(dev, dev_name(dev), GFP_KERNEL);
+	if (!name)
+		return NULL;
 
 	/* are we a "%s.%d" name (platform and SPI components) */
 	found = strstr(name, dev->driver->name);
@@ -2313,20 +2313,23 @@ static char *fmt_single_name(struct device *dev, int *id)
 	} else {
 		/* I2C component devices are named "bus-addr" */
 		if (sscanf(name, "%x-%x", &id1, &id2) == 2) {
-			char tmp[NAME_SIZE];
+			char *tmp;
 
 			/* create unique ID number from I2C addr and bus */
 			*id = ((id1 & 0xffff) << 16) + id2;
 
 			/* sanitize component name for DAI link creation */
-			snprintf(tmp, NAME_SIZE, "%s.%s", dev->driver->name,
-				 name);
-			strlcpy(name, tmp, NAME_SIZE);
+			tmp = devm_kasprintf(dev, GFP_KERNEL, "%s.%s",
+				 dev->driver->name, name);
+			devm_kfree(dev, name);
+			if (!tmp)
+				return NULL;
+			name = tmp;
 		} else
 			*id = 0;
 	}
 
-	return devm_kstrdup(dev, name, GFP_KERNEL);
+	return name;
 }
 
 /*

base-commit: fff876253c1e1b329257ba33045195c93e25adcd
-- 
2.20.1

