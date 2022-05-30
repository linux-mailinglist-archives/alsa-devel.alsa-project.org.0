Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EFEB2537E0C
	for <lists+alsa-devel@lfdr.de>; Mon, 30 May 2022 15:48:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9ED111F3A;
	Mon, 30 May 2022 15:47:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9ED111F3A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1653918510;
	bh=yYvAGK+jRj/Zget7GkGjcBBHehLh7eTbDAzE1XmmZrc=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=sehxrCyG/4J6qIFiHrDxealhmaw9s+/AUr1y1uBsEw+msrHiEACaN8f+1hB1DLPWx
	 ml/14Iqc0T6d+9TcbyGsVeCOQ+EmFL1wrWtQCDx/VdEcI3GSUsKYnw0Ps3bTzPMuLu
	 /9X5dHseo7cfAsxNfvKET+m1jZHWPK0ttZsSgGbQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 43765F804BD;
	Mon, 30 May 2022 15:47:40 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 706F5F804B4; Mon, 30 May 2022 15:47:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9E141F800E5
 for <alsa-devel@alsa-project.org>; Mon, 30 May 2022 15:47:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9E141F800E5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="cFURGLVa"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id B5BFBB80DB9;
 Mon, 30 May 2022 13:47:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65694C3411C;
 Mon, 30 May 2022 13:47:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1653918449;
 bh=yYvAGK+jRj/Zget7GkGjcBBHehLh7eTbDAzE1XmmZrc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=cFURGLVab6uFck4Sijs1Xf1kfl5YBpTU9ZzTyV8F7fW3PHdrFwkEUZ0qZsck/WsDA
 OecNNQ8rkAQrztL7NizcF1mijiR0XOWqWdglIws8UkUBarrUwslJi+Ppc+WQTTvScm
 AGIHyC2ac0/CBCAt+f65VXQQiL7gZFYkfyi2dXD0VrTswS9WmIdfgOJJE7MFgK6DQF
 9+1REB+dPsGscZGhW53C/i2auV/kJwU6L15YLFTtpNtYWU+i6S8xrZeeO+iHsIXMwj
 m3tC0r53zWO60H2rHBtYqrp2CpO7NeT8dDpLNMw0FDnhws0Agio8zHlmdztaRkn8Mu
 M+CEh5Fg5sKqg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.4 10/55] ALSA: jack: Access input_dev under mutex
Date: Mon, 30 May 2022 09:46:16 -0400
Message-Id: <20220530134701.1935933-10-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220530134701.1935933-1-sashal@kernel.org>
References: <20220530134701.1935933-1-sashal@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Cc: Sasha Levin <sashal@kernel.org>,
 Cezary Rojewski <cezary.rojewski@intel.com>, alsa-devel@alsa-project.org,
 Takashi Iwai <tiwai@suse.de>, tiwai@suse.com,
 =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>, xkernel.wang@foxmail.com
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

From: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>

[ Upstream commit 1b6a6fc5280e97559287b61eade2d4b363e836f2 ]

It is possible when using ASoC that input_dev is unregistered while
calling snd_jack_report, which causes NULL pointer dereference.
In order to prevent this serialize access to input_dev using mutex lock.

Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
Reviewed-by: Cezary Rojewski <cezary.rojewski@intel.com>
Link: https://lore.kernel.org/r/20220412091628.3056922-1-amadeuszx.slawinski@linux.intel.com
Signed-off-by: Takashi Iwai <tiwai@suse.de>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 include/sound/jack.h |  1 +
 sound/core/jack.c    | 34 +++++++++++++++++++++++++++-------
 2 files changed, 28 insertions(+), 7 deletions(-)

diff --git a/include/sound/jack.h b/include/sound/jack.h
index 9eb2b5ec1ec4..78f3619f3de9 100644
--- a/include/sound/jack.h
+++ b/include/sound/jack.h
@@ -62,6 +62,7 @@ struct snd_jack {
 	const char *id;
 #ifdef CONFIG_SND_JACK_INPUT_DEV
 	struct input_dev *input_dev;
+	struct mutex input_dev_lock;
 	int registered;
 	int type;
 	char name[100];
diff --git a/sound/core/jack.c b/sound/core/jack.c
index b00ae6f39f05..e7ac82d46821 100644
--- a/sound/core/jack.c
+++ b/sound/core/jack.c
@@ -34,8 +34,11 @@ static int snd_jack_dev_disconnect(struct snd_device *device)
 #ifdef CONFIG_SND_JACK_INPUT_DEV
 	struct snd_jack *jack = device->device_data;
 
-	if (!jack->input_dev)
+	mutex_lock(&jack->input_dev_lock);
+	if (!jack->input_dev) {
+		mutex_unlock(&jack->input_dev_lock);
 		return 0;
+	}
 
 	/* If the input device is registered with the input subsystem
 	 * then we need to use a different deallocator. */
@@ -44,6 +47,7 @@ static int snd_jack_dev_disconnect(struct snd_device *device)
 	else
 		input_free_device(jack->input_dev);
 	jack->input_dev = NULL;
+	mutex_unlock(&jack->input_dev_lock);
 #endif /* CONFIG_SND_JACK_INPUT_DEV */
 	return 0;
 }
@@ -82,8 +86,11 @@ static int snd_jack_dev_register(struct snd_device *device)
 	snprintf(jack->name, sizeof(jack->name), "%s %s",
 		 card->shortname, jack->id);
 
-	if (!jack->input_dev)
+	mutex_lock(&jack->input_dev_lock);
+	if (!jack->input_dev) {
+		mutex_unlock(&jack->input_dev_lock);
 		return 0;
+	}
 
 	jack->input_dev->name = jack->name;
 
@@ -108,6 +115,7 @@ static int snd_jack_dev_register(struct snd_device *device)
 	if (err == 0)
 		jack->registered = 1;
 
+	mutex_unlock(&jack->input_dev_lock);
 	return err;
 }
 #endif /* CONFIG_SND_JACK_INPUT_DEV */
@@ -228,9 +236,11 @@ int snd_jack_new(struct snd_card *card, const char *id, int type,
 		return -ENOMEM;
 	}
 
-	/* don't creat input device for phantom jack */
-	if (!phantom_jack) {
 #ifdef CONFIG_SND_JACK_INPUT_DEV
+	mutex_init(&jack->input_dev_lock);
+
+	/* don't create input device for phantom jack */
+	if (!phantom_jack) {
 		int i;
 
 		jack->input_dev = input_allocate_device();
@@ -248,8 +258,8 @@ int snd_jack_new(struct snd_card *card, const char *id, int type,
 				input_set_capability(jack->input_dev, EV_SW,
 						     jack_switch_types[i]);
 
-#endif /* CONFIG_SND_JACK_INPUT_DEV */
 	}
+#endif /* CONFIG_SND_JACK_INPUT_DEV */
 
 	err = snd_device_new(card, SNDRV_DEV_JACK, jack, &ops);
 	if (err < 0)
@@ -289,10 +299,14 @@ EXPORT_SYMBOL(snd_jack_new);
 void snd_jack_set_parent(struct snd_jack *jack, struct device *parent)
 {
 	WARN_ON(jack->registered);
-	if (!jack->input_dev)
+	mutex_lock(&jack->input_dev_lock);
+	if (!jack->input_dev) {
+		mutex_unlock(&jack->input_dev_lock);
 		return;
+	}
 
 	jack->input_dev->dev.parent = parent;
+	mutex_unlock(&jack->input_dev_lock);
 }
 EXPORT_SYMBOL(snd_jack_set_parent);
 
@@ -340,6 +354,8 @@ EXPORT_SYMBOL(snd_jack_set_key);
 
 /**
  * snd_jack_report - Report the current status of a jack
+ * Note: This function uses mutexes and should be called from a
+ * context which can sleep (such as a workqueue).
  *
  * @jack:   The jack to report status for
  * @status: The current status of the jack
@@ -359,8 +375,11 @@ void snd_jack_report(struct snd_jack *jack, int status)
 					    status & jack_kctl->mask_bits);
 
 #ifdef CONFIG_SND_JACK_INPUT_DEV
-	if (!jack->input_dev)
+	mutex_lock(&jack->input_dev_lock);
+	if (!jack->input_dev) {
+		mutex_unlock(&jack->input_dev_lock);
 		return;
+	}
 
 	for (i = 0; i < ARRAY_SIZE(jack->key); i++) {
 		int testbit = SND_JACK_BTN_0 >> i;
@@ -379,6 +398,7 @@ void snd_jack_report(struct snd_jack *jack, int status)
 	}
 
 	input_sync(jack->input_dev);
+	mutex_unlock(&jack->input_dev_lock);
 #endif /* CONFIG_SND_JACK_INPUT_DEV */
 }
 EXPORT_SYMBOL(snd_jack_report);
-- 
2.35.1

