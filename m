Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B794812F56D
	for <lists+alsa-devel@lfdr.de>; Fri,  3 Jan 2020 09:27:45 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5181F172A;
	Fri,  3 Jan 2020 09:26:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5181F172A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1578040065;
	bh=uwzZFnEA0o96aUoO8tYqvxkBMdczH0830PIzQ8o+Ax0=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=k8LFIQ9NaOrLJ/ixe1U92Gf+Dl8ZcGPGlG2ZGlZ7Q089i5KuR46ar7j3Ae5Imq4tV
	 N5ZYGefWjQ/SS4cCz40dwqRp6aHSxX5oVCKTDoKsd2TraRCYRh+3dCaHVf63KA2w8n
	 eDChksKK1lIfwhCtEPmfvad/SdAZYHJhgiXgWqlo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 909E6F8029A;
	Fri,  3 Jan 2020 09:18:14 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DB757F80328; Fri,  3 Jan 2020 09:17:47 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_DNSWL_BLOCKED,
 RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3BD95F80277
 for <alsa-devel@alsa-project.org>; Fri,  3 Jan 2020 09:17:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3BD95F80277
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 60E0EB263
 for <alsa-devel@alsa-project.org>; Fri,  3 Jan 2020 08:17:20 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Date: Fri,  3 Jan 2020 09:16:32 +0100
Message-Id: <20200103081714.9560-17-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20200103081714.9560-1-tiwai@suse.de>
References: <20200103081714.9560-1-tiwai@suse.de>
Subject: [alsa-devel] [PATCH 16/58] ALSA: sparc: Constify snd_device_ops
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
 sound/sparc/amd7930.c | 2 +-
 sound/sparc/cs4231.c  | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/sparc/amd7930.c b/sound/sparc/amd7930.c
index df1b16c97d16..916bed46be06 100644
--- a/sound/sparc/amd7930.c
+++ b/sound/sparc/amd7930.c
@@ -912,7 +912,7 @@ static int snd_amd7930_dev_free(struct snd_device *device)
 	return snd_amd7930_free(amd);
 }
 
-static struct snd_device_ops snd_amd7930_dev_ops = {
+static const struct snd_device_ops snd_amd7930_dev_ops = {
 	.dev_free	=	snd_amd7930_dev_free,
 };
 
diff --git a/sound/sparc/cs4231.c b/sound/sparc/cs4231.c
index 1676d44769ad..476ffaa413d9 100644
--- a/sound/sparc/cs4231.c
+++ b/sound/sparc/cs4231.c
@@ -1771,7 +1771,7 @@ static int snd_cs4231_sbus_dev_free(struct snd_device *device)
 	return snd_cs4231_sbus_free(cp);
 }
 
-static struct snd_device_ops snd_cs4231_sbus_dev_ops = {
+static const struct snd_device_ops snd_cs4231_sbus_dev_ops = {
 	.dev_free	=	snd_cs4231_sbus_dev_free,
 };
 
@@ -1937,7 +1937,7 @@ static int snd_cs4231_ebus_dev_free(struct snd_device *device)
 	return snd_cs4231_ebus_free(cp);
 }
 
-static struct snd_device_ops snd_cs4231_ebus_dev_ops = {
+static const struct snd_device_ops snd_cs4231_ebus_dev_ops = {
 	.dev_free	=	snd_cs4231_ebus_dev_free,
 };
 
-- 
2.16.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
