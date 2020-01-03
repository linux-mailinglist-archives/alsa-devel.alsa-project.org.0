Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EDDC512F560
	for <lists+alsa-devel@lfdr.de>; Fri,  3 Jan 2020 09:24:31 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7DD3F1721;
	Fri,  3 Jan 2020 09:23:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7DD3F1721
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1578039871;
	bh=3BsQAaVylN6ek2fw8fraiX8iy9XK+A0hdxMuV6Ext0s=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JbJl8r7WqwVRVqD1TbU40YP/99lCuG1vKQJRPEhDU7MkJsODjeN36jiu05m7ya8CM
	 weMkV2BqNeKu7xJTThvaMpmQRv7Fu3FL3+5g09PQHN5Yi22rN0icYrane8OG3QJ+2k
	 1UEllLO7k6PRFhDJGVYV9LAMvms1DvWbUxrADJiw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6CEDBF8033F;
	Fri,  3 Jan 2020 09:18:00 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 094FEF80321; Fri,  3 Jan 2020 09:17:41 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4CC58F8026F
 for <alsa-devel@alsa-project.org>; Fri,  3 Jan 2020 09:17:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4CC58F8026F
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 2643DB248
 for <alsa-devel@alsa-project.org>; Fri,  3 Jan 2020 08:17:20 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Date: Fri,  3 Jan 2020 09:16:27 +0100
Message-Id: <20200103081714.9560-12-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20200103081714.9560-1-tiwai@suse.de>
References: <20200103081714.9560-1-tiwai@suse.de>
Subject: [alsa-devel] [PATCH 11/58] ALSA: aoa: Constify snd_device_ops
	definitions
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Now we may declare const for snd_device_ops definitions, so let's do
it for optimization.

There should be no functional changes by this patch.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/aoa/aoa.h           | 2 +-
 sound/aoa/codecs/onyx.c   | 2 +-
 sound/aoa/codecs/tas.c    | 2 +-
 sound/aoa/codecs/toonie.c | 2 +-
 sound/aoa/core/alsa.c     | 2 +-
 5 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/sound/aoa/aoa.h b/sound/aoa/aoa.h
index 60ce9dedc737..3d2d03ff6337 100644
--- a/sound/aoa/aoa.h
+++ b/sound/aoa/aoa.h
@@ -116,7 +116,7 @@ struct aoa_card {
 };
         
 extern int aoa_snd_device_new(enum snd_device_type type,
-	void * device_data, struct snd_device_ops * ops);
+	void *device_data, const struct snd_device_ops *ops);
 extern struct snd_card *aoa_get_card(void);
 extern int aoa_snd_ctl_add(struct snd_kcontrol* control);
 
diff --git a/sound/aoa/codecs/onyx.c b/sound/aoa/codecs/onyx.c
index 9827bee109c1..83ab3e58a0d3 100644
--- a/sound/aoa/codecs/onyx.c
+++ b/sound/aoa/codecs/onyx.c
@@ -97,7 +97,7 @@ static int onyx_dev_register(struct snd_device *dev)
 	return 0;
 }
 
-static struct snd_device_ops ops = {
+static const struct snd_device_ops ops = {
 	.dev_register = onyx_dev_register,
 };
 
diff --git a/sound/aoa/codecs/tas.c b/sound/aoa/codecs/tas.c
index 7af6129d1cd7..c60b78367fc9 100644
--- a/sound/aoa/codecs/tas.c
+++ b/sound/aoa/codecs/tas.c
@@ -217,7 +217,7 @@ static int tas_dev_register(struct snd_device *dev)
 	return 0;
 }
 
-static struct snd_device_ops ops = {
+static const struct snd_device_ops ops = {
 	.dev_register = tas_dev_register,
 };
 
diff --git a/sound/aoa/codecs/toonie.c b/sound/aoa/codecs/toonie.c
index b43469f43d2d..c2d014486c33 100644
--- a/sound/aoa/codecs/toonie.c
+++ b/sound/aoa/codecs/toonie.c
@@ -30,7 +30,7 @@ static int toonie_dev_register(struct snd_device *dev)
 	return 0;
 }
 
-static struct snd_device_ops ops = {
+static const struct snd_device_ops ops = {
 	.dev_register = toonie_dev_register,
 };
 
diff --git a/sound/aoa/core/alsa.c b/sound/aoa/core/alsa.c
index fcf30f0c3adb..b61081342266 100644
--- a/sound/aoa/core/alsa.c
+++ b/sound/aoa/core/alsa.c
@@ -59,7 +59,7 @@ void aoa_alsa_cleanup(void)
 }
 
 int aoa_snd_device_new(enum snd_device_type type,
-		       void * device_data, struct snd_device_ops * ops)
+		       void *device_data, const struct snd_device_ops *ops)
 {
 	struct snd_card *card = aoa_get_card();
 	int err;
-- 
2.16.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
