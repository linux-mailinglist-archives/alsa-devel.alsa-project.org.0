Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 34092537E2B
	for <lists+alsa-devel@lfdr.de>; Mon, 30 May 2022 15:52:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AD7731F7B;
	Mon, 30 May 2022 15:51:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AD7731F7B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1653918734;
	bh=tlTUH1dsjMTE2GgTuQ6cQeF+qzMwp+Na8MzUcVDio9s=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qu7LzeQXzEaTIL5xCOkT7VB7ornMN3FslTBgwfjhyFTlZ3mcEdZyoPJ9qbW/cPPL7
	 SkuI84zt7ob7V8domrNRyWKCJAUMgCwFGJW+fQo7Qw4M+zsj7khAcjjyiax5bjuCt0
	 YIynTmLwz82eo0thPmS6o+ZUFFEaiawoKa36LvWc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 40BECF804EC;
	Mon, 30 May 2022 15:51:24 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DD6C1F804EC; Mon, 30 May 2022 15:51:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 12F76F80124
 for <alsa-devel@alsa-project.org>; Mon, 30 May 2022 15:51:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 12F76F80124
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="hGp0TLzA"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 74E15B80DAB;
 Mon, 30 May 2022 13:51:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 301E0C385B8;
 Mon, 30 May 2022 13:51:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1653918675;
 bh=tlTUH1dsjMTE2GgTuQ6cQeF+qzMwp+Na8MzUcVDio9s=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=hGp0TLzAiTZmXzn7lO6y1mGurp+k1EB2n4AqT7V/wwG7nd2s3Rhfe3dw93ZBpe1iu
 EFMdXqKPRV2/fo7sxFOwnNRrGpL+M52as3/Xx+9yzZmQVEIIToqrPiDd8GapB2Vart
 xDCmlOcUCddYUPt5oPwkzw4cmKK2e2asKWTPeeozraWr/b1RFnzmon/W+fXSm9nOUh
 fPlPGBduz5Hrt+B0nnRmWd1kiNmiIeaR0ANltd6fxUSBuYxRhsVRAf87Wo0V8blhod
 NZjHYL2eTKSTG9x/KypFZ8vO2jhWwJ7IpNPlkQRCg5iu7LXK4RXjAp7iwhxvSpdqBx
 m2vUuKXOk+F4Q==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.14 07/29] ALSA: jack: Access input_dev under mutex
Date: Mon, 30 May 2022 09:50:34 -0400
Message-Id: <20220530135057.1937286-7-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220530135057.1937286-1-sashal@kernel.org>
References: <20220530135057.1937286-1-sashal@kernel.org>
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
index 1e84bfb553cf..4742f842b457 100644
--- a/include/sound/jack.h
+++ b/include/sound/jack.h
@@ -77,6 +77,7 @@ struct snd_jack {
 	const char *id;
 #ifdef CONFIG_SND_JACK_INPUT_DEV
 	struct input_dev *input_dev;
+	struct mutex input_dev_lock;
 	int registered;
 	int type;
 	char name[100];
diff --git a/sound/core/jack.c b/sound/core/jack.c
index 36cfe1c54109..d2f9a92453f2 100644
--- a/sound/core/jack.c
+++ b/sound/core/jack.c
@@ -48,8 +48,11 @@ static int snd_jack_dev_disconnect(struct snd_device *device)
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
@@ -58,6 +61,7 @@ static int snd_jack_dev_disconnect(struct snd_device *device)
 	else
 		input_free_device(jack->input_dev);
 	jack->input_dev = NULL;
+	mutex_unlock(&jack->input_dev_lock);
 #endif /* CONFIG_SND_JACK_INPUT_DEV */
 	return 0;
 }
@@ -96,8 +100,11 @@ static int snd_jack_dev_register(struct snd_device *device)
 	snprintf(jack->name, sizeof(jack->name), "%s %s",
 		 card->shortname, jack->id);
 
-	if (!jack->input_dev)
+	mutex_lock(&jack->input_dev_lock);
+	if (!jack->input_dev) {
+		mutex_unlock(&jack->input_dev_lock);
 		return 0;
+	}
 
 	jack->input_dev->name = jack->name;
 
@@ -122,6 +129,7 @@ static int snd_jack_dev_register(struct snd_device *device)
 	if (err == 0)
 		jack->registered = 1;
 
+	mutex_unlock(&jack->input_dev_lock);
 	return err;
 }
 #endif /* CONFIG_SND_JACK_INPUT_DEV */
@@ -242,9 +250,11 @@ int snd_jack_new(struct snd_card *card, const char *id, int type,
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
@@ -262,8 +272,8 @@ int snd_jack_new(struct snd_card *card, const char *id, int type,
 				input_set_capability(jack->input_dev, EV_SW,
 						     jack_switch_types[i]);
 
-#endif /* CONFIG_SND_JACK_INPUT_DEV */
 	}
+#endif /* CONFIG_SND_JACK_INPUT_DEV */
 
 	err = snd_device_new(card, SNDRV_DEV_JACK, jack, &ops);
 	if (err < 0)
@@ -303,10 +313,14 @@ EXPORT_SYMBOL(snd_jack_new);
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
 
@@ -354,6 +368,8 @@ EXPORT_SYMBOL(snd_jack_set_key);
 
 /**
  * snd_jack_report - Report the current status of a jack
+ * Note: This function uses mutexes and should be called from a
+ * context which can sleep (such as a workqueue).
  *
  * @jack:   The jack to report status for
  * @status: The current status of the jack
@@ -373,8 +389,11 @@ void snd_jack_report(struct snd_jack *jack, int status)
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
@@ -393,6 +412,7 @@ void snd_jack_report(struct snd_jack *jack, int status)
 	}
 
 	input_sync(jack->input_dev);
+	mutex_unlock(&jack->input_dev_lock);
 #endif /* CONFIG_SND_JACK_INPUT_DEV */
 }
 EXPORT_SYMBOL(snd_jack_report);
-- 
2.35.1

