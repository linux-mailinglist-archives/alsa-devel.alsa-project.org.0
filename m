Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 531E135371E
	for <lists+alsa-devel@lfdr.de>; Sun,  4 Apr 2021 09:01:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DB36F16C3;
	Sun,  4 Apr 2021 09:00:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DB36F16C3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1617519674;
	bh=Dd+RKpOPVyWMDipcySpn6byFIGFFLibi4Q4LiTxqFZo=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Pd1YXss/G0P3l9IY2y0XjWMXsnFtI+xitzZTscg6ZSG/DhSAN5OkkCORNvFKszEiS
	 du9Cizl5aoysPcmuF6irHppoD/PDnytUhqKuA+MLB922czhUDgfzvCnzBqA8tswgLW
	 2FpupJhsgstigdypOxoqnE5w5wPyvFOGtKKHBlG4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 48F36F80249;
	Sun,  4 Apr 2021 08:59:47 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C2FACF8020B; Sun,  4 Apr 2021 08:59:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
 [64.147.123.25])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C3AB5F80127
 for <alsa-devel@alsa-project.org>; Sun,  4 Apr 2021 08:59:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C3AB5F80127
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="XMULJwNO"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="iT6jMs41"
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 973EB1393;
 Sun,  4 Apr 2021 02:59:34 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Sun, 04 Apr 2021 02:59:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:mime-version:content-type
 :content-transfer-encoding; s=fm1; bh=Zp7zH6uYtTkl1rf3pvszMN/8Oy
 IJW1DL2mt07sCCztU=; b=XMULJwNO65TFw11BtZ0385jLdpFfRhgCFd+RiTr6hT
 AOTHDWOZ+YTL/YCyRep5ABTOJs5bFBrD9+CXC5rHWafbXl1AzJnQf7UjXBCRFcx/
 Ij9ownZAJEdpGf+ZDMQD1614h9+BAMzeCBojxWCfVzPMWEOR026pDfhRLnlzOjZD
 FIq8IJ7xcRF125WXBe+Q7vrHI/t5bJF3ra6HZM0L+w4hZi0Ao4FcNIy8OrJv9daQ
 yCtvin3LnCGL8KR11bqBHzmF+vS4iWSISQlw2EEMjhHTsazYob7racqH55MLU3KN
 gedrKrPIyw1tMqHltDBtlIjB2q114leu+nhUK0t5IQGQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:message-id:mime-version:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=Zp7zH6
 uYtTkl1rf3pvszMN/8OyIJW1DL2mt07sCCztU=; b=iT6jMs413caIYuCq7AtE75
 MuTb9wyVZbOQWnq+ygE6+xaf0qfotXDaDItMdZSmSH4wIy9reaa0Rb36yjfAd7SA
 LUvS0fHXYk2HLPvMZIFB7bXZRoVeSuJBKIkZYZi2vGAtl2ZwNbuZCykgdCNIc14t
 8kuAr7bev1lS0bRfZ8QiPdLL/dZbVLlosGP8MHrDxNhGiNPjal6ATzS6iDyDxY7v
 sw1J+9wMXfQukWcrsCvoJ5JIJ/n38ftRCslI6eWUrI94tYOPfrs2QKswHhtAcig2
 g/vFjNDcXd+iSCjHH9Xa/vo040J8qWS2rguLeB+0WBFa3lIy5onOA64/DifdbtJA
 ==
X-ME-Sender: <xms:1WNpYKxRLZF1hB1gELQNC3UQTQVSeUTP25uhio7BUEkAIDzkOOSzCg>
 <xme:1WNpYGRqMkJsjz5uaUCcB3Fuyd4n6sOPvuswp94R5cYQahu5ml5mwRYgyfpwQVBvB
 hd-d_65Q-U8Ct7TUSM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudeiledguddukecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffogggtgfesthekre
 dtredtjeenucfhrhhomhepvfgrkhgrshhhihcuufgrkhgrmhhothhouceoohdqthgrkhgr
 shhhihesshgrkhgrmhhotggthhhirdhjpheqnecuggftrfgrthhtvghrnhepveefkedugf
 eliedtkedtjefgudfgveffkefgudektedtffdvieffhfduteevudetnecukfhppedugedr
 fedrieehrddujeehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilh
 hfrhhomhepohdqthgrkhgrshhhihesshgrkhgrmhhotggthhhirdhjph
X-ME-Proxy: <xmx:1WNpYMV8nT7HjaViyWMTrLFSZ0dxA3QLZGHYvx7v0pOcSK69BOew0w>
 <xmx:1WNpYAiKpkfuGO2mBtaD2LYS-o86f1VZwQVVtGkoIuvVrBai3ZEAGA>
 <xmx:1WNpYMC5j41L3mZsmDc9A2vqkYD8A-B5P8pAnfM0qk0p1qc6ROlGfQ>
 <xmx:1mNpYHqNkW7wO5_fYgNXq6CAFlEj3vuthbXRolCx88adkJUQ-uROUQ>
Received: from workstation.flets-east.jp (ae065175.dynamic.ppp.asahi-net.or.jp
 [14.3.65.175])
 by mail.messagingengine.com (Postfix) with ESMTPA id BD3AE1080054;
 Sun,  4 Apr 2021 02:59:32 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: tiwai@suse.de,
	perex@perex.cz
Subject: [PATCH] ALSA: control_led: fix stack frame usage over 1024 bytes in
 snd_ctl_led_get()
Date: Sun,  4 Apr 2021 15:59:29 +0900
Message-Id: <20210404065929.52501-1-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org
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

GCC warns that snd_ctl_led_get() uses stack frame over 1024 bytes.

control_led.c: In function ‘snd_ctl_led_get’:
control_led.c:128:1: warning: the frame size of 1504 bytes is larger than 1024 bytes [-Wframe-larger-than=]

When taking care of convension in Linux kernel development. it's preferable
to suppress too large usage of kernel stack, when the function call is not
in critical part.

This commit fixes the bug, including some minor code refactoring relevant
to variable names.

Fixes: 22d8de62f11b ("ALSA: control - add generic LED trigger module as the new control layer")
Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 sound/core/control_led.c | 68 ++++++++++++++++++++++++++--------------
 1 file changed, 44 insertions(+), 24 deletions(-)

diff --git a/sound/core/control_led.c b/sound/core/control_led.c
index b97f118cd54e..1be854a861f0 100644
--- a/sound/core/control_led.c
+++ b/sound/core/control_led.c
@@ -94,34 +94,35 @@ static struct snd_ctl_led *snd_ctl_led_get_by_access(unsigned int access)
 	return &snd_ctl_leds[group];
 }
 
-static int snd_ctl_led_get(struct snd_ctl_led_ctl *lctl)
+static int snd_ctl_led_get(struct snd_ctl_led_ctl *lctl, struct snd_ctl_elem_info *elem_info,
+			   struct snd_ctl_elem_value *elem_value)
 {
 	struct snd_kcontrol *kctl = lctl->kctl;
-	struct snd_ctl_elem_info info;
-	struct snd_ctl_elem_value value;
 	unsigned int i;
-	int result;
-
-	memset(&info, 0, sizeof(info));
-	info.id = kctl->id;
-	info.id.index += lctl->index_offset;
-	info.id.numid += lctl->index_offset;
-	result = kctl->info(kctl, &info);
-	if (result < 0)
+	int err;
+
+	memset(elem_info, 0, sizeof(*elem_info));
+	elem_info->id = kctl->id;
+	elem_info->id.index += lctl->index_offset;
+	elem_info->id.numid += lctl->index_offset;
+	err = kctl->info(kctl, elem_info);
+	if (err < 0)
 		return -1;
-	memset(&value, 0, sizeof(value));
-	value.id = info.id;
-	result = kctl->get(kctl, &value);
-	if (result < 0)
+
+	memset(elem_value, 0, sizeof(*elem_value));
+	elem_value->id = elem_info->id;
+	err = kctl->get(kctl, elem_value);
+	if (err < 0)
 		return -1;
-	if (info.type == SNDRV_CTL_ELEM_TYPE_BOOLEAN ||
-	    info.type == SNDRV_CTL_ELEM_TYPE_INTEGER) {
-		for (i = 0; i < info.count; i++)
-			if (value.value.integer.value[i] != info.value.integer.min)
+
+	if (elem_info->type == SNDRV_CTL_ELEM_TYPE_BOOLEAN ||
+	    elem_info->type == SNDRV_CTL_ELEM_TYPE_INTEGER) {
+		for (i = 0; i < elem_info->count; i++)
+			if (elem_value->value.integer.value[i] != elem_info->value.integer.min)
 				return 1;
-	} else if (info.type == SNDRV_CTL_ELEM_TYPE_INTEGER64) {
-		for (i = 0; i < info.count; i++)
-			if (value.value.integer64.value[i] != info.value.integer64.min)
+	} else if (elem_info->type == SNDRV_CTL_ELEM_TYPE_INTEGER64) {
+		for (i = 0; i < elem_info->count; i++)
+			if (elem_value->value.integer64.value[i] != elem_info->value.integer64.min)
 				return 1;
 	}
 	return 0;
@@ -132,6 +133,8 @@ static void snd_ctl_led_set_state(struct snd_card *card, unsigned int access,
 {
 	struct snd_ctl_led *led;
 	struct snd_ctl_led_ctl *lctl;
+	struct snd_ctl_elem_info *elem_info;
+	struct snd_ctl_elem_value *elem_value;
 	int route;
 	bool found;
 
@@ -146,10 +149,24 @@ static void snd_ctl_led_set_state(struct snd_card *card, unsigned int access,
 		mutex_unlock(&snd_ctl_led_mutex);
 		return;
 	}
+
+	elem_info = kmalloc(sizeof(*elem_info), GFP_KERNEL);
+	if (!elem_info) {
+		mutex_unlock(&snd_ctl_led_mutex);
+		return;
+	}
+
+	elem_value = kmalloc(sizeof(*elem_value), GFP_KERNEL);
+	if (!elem_value) {
+		kfree(elem_info);
+		mutex_unlock(&snd_ctl_led_mutex);
+		return;
+	}
+
 	list_for_each_entry(lctl, &led->controls, list) {
 		if (lctl->kctl == kctl && lctl->index_offset == ioff)
 			found = true;
-		UPDATE_ROUTE(route, snd_ctl_led_get(lctl));
+		UPDATE_ROUTE(route, snd_ctl_led_get(lctl, elem_info, elem_value));
 	}
 	if (!found && kctl && card) {
 		lctl = kzalloc(sizeof(*lctl), GFP_KERNEL);
@@ -159,10 +176,13 @@ static void snd_ctl_led_set_state(struct snd_card *card, unsigned int access,
 			lctl->kctl = kctl;
 			lctl->index_offset = ioff;
 			list_add(&lctl->list, &led->controls);
-			UPDATE_ROUTE(route, snd_ctl_led_get(lctl));
+			UPDATE_ROUTE(route, snd_ctl_led_get(lctl, elem_info, elem_value));
 		}
 		kfree(lctl);
 	}
+
+	kfree(elem_value);
+	kfree(elem_info);
 	mutex_unlock(&snd_ctl_led_mutex);
 	switch (led->mode) {
 	case MODE_OFF:		route = 1; break;
-- 
2.27.0

