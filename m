Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BC322E34E2
	for <lists+alsa-devel@lfdr.de>; Mon, 28 Dec 2020 09:02:53 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D56721717;
	Mon, 28 Dec 2020 09:02:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D56721717
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1609142573;
	bh=BeN6tkAVYBBg3Gi7i3PsYukvsE0RdyyMq1RVcSGnQvQ=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=D99d7DCJEH4egMbphFPYZcSVXBiBfXaWYTAiscJdge8yrNRCknHJ/DrudCO1svH26
	 OI1vtD6+JGw6ue5ItOWnyGsgo/1agPXZf54um5joeEMIYz9nbi/Wlc61Z1rhxxiDgh
	 mhrbV2rD8fIJOlUdO2Z5UY7Mg6SKSqDb8JDWTsNw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 784C6F80143;
	Mon, 28 Dec 2020 09:00:32 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6A45DF80279; Mon, 28 Dec 2020 09:00:26 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 33852F80169
 for <alsa-devel@alsa-project.org>; Mon, 28 Dec 2020 09:00:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 33852F80169
Received: from [223.72.45.82] (helo=localhost.localdomain)
 by youngberry.canonical.com with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <hui.wang@canonical.com>)
 id 1ktnRy-0004UZ-N1; Mon, 28 Dec 2020 08:00:19 +0000
From: Hui Wang <hui.wang@canonical.com>
To: alsa-devel@alsa-project.org, tiwai@suse.de, perex@perex.cz,
 kai.vehmanen@linux.intel.com
Subject: [RFC][PATCH v3 2/4] alsa: jack: adjust jack_kctl debugfs folder's name
Date: Mon, 28 Dec 2020 16:00:01 +0800
Message-Id: <20201228080003.19127-3-hui.wang@canonical.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201228080003.19127-1-hui.wang@canonical.com>
References: <20201228080003.19127-1-hui.wang@canonical.com>
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

We used jack_kctl->kctl.id as the folder's name, but there are some
characters which are not suitable for foler's name, for example, a
HDMI/DP audio jack id contains '/', ',', '=' and ' ', this patch will
remove them from folder's name.

Before applying patch, the folders look like:
'HDMI!DP,pcm=3 Jack'  'Headphone Jack'  'Mic Jack'

After applying the patch, the folders look like:
HDMIDPpcm3Jack  HeadphoneJack  MicJack

Signed-off-by: Hui Wang <hui.wang@canonical.com>
---
 sound/core/jack.c | 26 ++++++++++++++++++++++----
 1 file changed, 22 insertions(+), 4 deletions(-)

diff --git a/sound/core/jack.c b/sound/core/jack.c
index 0f232a806c3a..62e9215fa0f0 100644
--- a/sound/core/jack.c
+++ b/sound/core/jack.c
@@ -242,18 +242,36 @@ static const struct file_operations jackin_inject_fops = {
 	.llseek = default_llseek,
 };
 
+/* The substrings in the jack's name but not suitable for folder's name */
+static const char * const dropped_chars[] = {
+	"/", "=", ",", " ",
+};
+
+static char *strremove(char *s, const char *c)
+{
+	char *p;
+
+	while ((p = strstr(s, c))) {
+		*p = '\0';
+		strcat(s, p+strlen(c));
+	}
+
+	return s;
+}
+
 static int snd_jack_debugfs_add_inject_node(struct snd_jack *jack,
 					    struct snd_jack_kctl *jack_kctl)
 {
 	char *tname;
+	int i;
 
-	/* the folder's name can't contains '/', need to replace it with '!'
-	 * as lib/kobject.c does
-	 */
 	tname = kstrdup(jack_kctl->kctl->id.name, GFP_KERNEL);
 	if (!tname)
 		return -ENOMEM;
-	strreplace(tname, '/', '!');
+
+	for (i = 0; i < ARRAY_SIZE(dropped_chars); i++)
+		tname = strremove(tname, dropped_chars[i]);
+
 	jack_kctl->jack_debugfs_root = debugfs_create_dir(tname, jack->card->debugfs_root);
 	kfree(tname);
 
-- 
2.25.1

