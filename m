Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8935E90AEA7
	for <lists+alsa-devel@lfdr.de>; Mon, 17 Jun 2024 15:05:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D1472847;
	Mon, 17 Jun 2024 15:05:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D1472847
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1718629536;
	bh=t1pfuj6KVvbLIvCe/7uLuam0l8+uLeVGQbLwoJtYOoU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=hzWEopAt4JJzWFmaBsOHrb2DWlyhEserdcxkQ7GrTVxRWUH2jtWqmG9RxAQyV28o1
	 IiI4boesl8Y09iLFYrIXilZb27hlfN6BEQ9YdY7C8ILgCAxX1vg9mki0Wkhfs+sQcF
	 fxJIi1ZHKuOLyzSojBH4+xuGchbaHHwcMpmn0F5k=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 357A3F805FC; Mon, 17 Jun 2024 15:04:45 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 28FBAF80602;
	Mon, 17 Jun 2024 15:04:43 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2AF32F80587; Mon, 17 Jun 2024 15:04:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=unavailable autolearn_force=no version=3.4.6
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0159DF80154
	for <alsa-devel@alsa-project.org>; Mon, 17 Jun 2024 15:03:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0159DF80154
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=vbLo8h04
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-a6ef64b092cso523439766b.1
        for <alsa-devel@alsa-project.org>;
 Mon, 17 Jun 2024 06:03:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718629422; x=1719234222;
 darn=alsa-project.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8Jjsxg83yDBynROnukCqxVpZWsAhK7YKWQUi0g3IwVg=;
        b=vbLo8h04uxc6kyVn3Y0z8nMVGeN0rrfJQjX6oD0ecHxsiUJEb6T8SNWiU53UdmLLIZ
         xYUy101F1ootM/B59eMuOZTWVmFg/GX3+0B+UAHncTisTNrsMafDEP3LTQMANF3A+rpX
         huYt+BbjPc9w4s2p7wvz+3rV+xKcEbM3S2dW/oP4uqUiHoLuuF60ZkpRwQ2DNsNzrKKg
         E1gxd8Il/+e2x1cM/2M5EB4sfu+cW/3lJdmQa13sqgFZYC9xbNdmAn912yLEp/+oTmiJ
         UKAXTr8U7OtkmSCu2ps1VbaS6K0zZoYrvKHggXp5AXU8/hjrCJvVfTrCFwxYioVjWvCt
         TcpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718629422; x=1719234222;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8Jjsxg83yDBynROnukCqxVpZWsAhK7YKWQUi0g3IwVg=;
        b=W5+nb8TP99hBhZi6tpFz9jEpDiujC6be0VSf5CUGKp/+bMriU8wVdBlVrvlFvD4jdC
         dMk+BihnsNRne4Rk8sSpUQ4TvVnhEO5BDSuek3PLfhgT0irX9cjrC+Kdrxe2B2qcY4PZ
         ctZhSRD3CrKbB+huqhT8s3VbsogJimYHUUt5zm2dNIE2pnr3KK3cA3nyUNCeicSEXegt
         2cl6APvTGL0odtEfTfzdt6L7cqSiMNEifKitaMy79vNLNHBz/X4oGDUG7+cw2Z0lZw+Y
         zgQzjdo3CgZaL9GDWAaJZJLlVBmaeAwBa8kqv5iAJVfDFUKly4w2BQPM351WF6BZf1Ab
         Qp1Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCUGs7i9kuh9/9gEj2i5hJBhWQqthpwDl9VUMFzl5Ww/cwxorQbKZ2cZD30tUW/gWCNRQZoDQxz10wX7nhZ+xA4DwejTyMvDZotMsvE=
X-Gm-Message-State: AOJu0YxoqFwe5xW/LV4653zE6IzIlHxTG48ROqi2+ARJR8ltUdMg5UJz
	r0eo6ahYSN0Pewc722mxWrILLscUaKe9I1iKVNI87idbsHsVqEMraG1ntZPdjho=
X-Google-Smtp-Source: 
 AGHT+IHxFIGbMKiomDDLiUlqvxSJuE8E8yc0Q5eLstEjkRUInd4amrOMmgw5O7yl2zWNO8kXeIXMcQ==
X-Received: by 2002:a17:906:7fda:b0:a6f:173d:36b9 with SMTP id
 a640c23a62f3a-a6f60cef626mr624278066b.16.1718629422302;
        Mon, 17 Jun 2024 06:03:42 -0700 (PDT)
Received: from [127.0.1.1] ([78.10.207.147])
        by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-57cb72daa67sm6404349a12.38.2024.06.17.06.03.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Jun 2024 06:03:41 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Mon, 17 Jun 2024 15:03:24 +0200
Subject: [PATCH 6/6] ALSA: Cleanup trailing white-spaces
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: 
 <20240617-n-asoc-const-auto-selectable-formats-v1-6-8004f346ee38@linaro.org>
References: 
 <20240617-n-asoc-const-auto-selectable-formats-v1-0-8004f346ee38@linaro.org>
In-Reply-To: 
 <20240617-n-asoc-const-auto-selectable-formats-v1-0-8004f346ee38@linaro.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=27231;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=t1pfuj6KVvbLIvCe/7uLuam0l8+uLeVGQbLwoJtYOoU=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmcDQj7GbDiQ+OBCaHLiN6Im1kLT8emHhLTQPWy
 etkaEJr/niJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZnA0IwAKCRDBN2bmhouD
 15fcD/9bZu2gXq97yhhAQjudvJ+6D4YuUeP7m0IS04krE5/7KOexG+1+dZz5Ozr8PfOFoW+v9w4
 pdt2q2skPIKItN7X3h7m/qVachcfjlPWarrmNsd9KtIssL+ZuhjJfisiiXWVeNQ7XQSOyI+YG6n
 Z5ZqR91WJoBa9P5D4+2a9uhclQVakr3VkIn6Xy8McO1s3tkW6e2wLAfKRQJ1IbMvrnUSw8cANMH
 nFWsIp5hxKK+dZg0SEt3QiHeMVHTtOuYvDzLeIRilgq0A54oPtdNzSW8ZwKjLkNDRUGKEF9sSGX
 1dEChlfi28LV6hhmwj0ovu915701YzjY14+yqGlaacc4fYIIr1Vp9nCrIwFt+WCr/GojKqAjtkH
 c/terRBaiZGCqPs/mhg6vJuCFNSoSqCsKkcWDK2ql3OVwqCuwVufZKfOHqH9yLy+Ck9vEBHzic9
 MwjyvlMxMtTBv34ybu9OQvaH4fYQckh1Ft2uxmKH9gPWfiz+uWzVbnYbX6zJ+xWrn7LXJiQ7Bf1
 W0dJZfR7beACcM6RHdAH5lfK0Zm/51mgQFn5OBIiKgqEaChKHqZGsOA3jHNc5fey5dyhsSrcCr1
 tvCD2aJ6JoJ1eHFdBNcDa4McbnmvZDrow5AjdOyoFNIv/c7D/RKtXyzKgQlmC/qpoNe6O7EFEKU
 QCyHVuDG3mr38QA==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Message-ID-Hash: 7J4VRVWOU6YQIP5H5YLKVA23ROMUXX5Z
X-Message-ID-Hash: 7J4VRVWOU6YQIP5H5YLKVA23ROMUXX5Z
X-MailFrom: krzysztof.kozlowski@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7J4VRVWOU6YQIP5H5YLKVA23ROMUXX5Z/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Remove trailing white-spaces.  No functional changes.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 sound/core/control_compat.c |  2 +-
 sound/core/device.c         |  4 +--
 sound/core/hwdep.c          | 10 +++---
 sound/core/init.c           |  3 +-
 sound/core/memalloc.c       |  2 +-
 sound/core/memory.c         |  2 +-
 sound/core/pcm.c            | 22 ++++++-------
 sound/core/pcm_compat.c     |  2 +-
 sound/core/pcm_lib.c        | 41 ++++++++++++------------
 sound/core/pcm_misc.c       |  2 +-
 sound/core/pcm_native.c     | 76 ++++++++++++++++++++++-----------------------
 sound/core/seq_device.c     |  2 +-
 12 files changed, 83 insertions(+), 85 deletions(-)

diff --git a/sound/core/control_compat.c b/sound/core/control_compat.c
index 934bb945e702..27bd813d47ff 100644
--- a/sound/core/control_compat.c
+++ b/sound/core/control_compat.c
@@ -387,7 +387,7 @@ static int snd_ctl_elem_add_compat(struct snd_ctl_file *file,
 		break;
 	}
 	return snd_ctl_elem_add(file, data, replace);
-}  
+}
 
 enum {
 	SNDRV_CTL_IOCTL_ELEM_LIST32 = _IOWR('U', 0x10, struct snd_ctl_elem_list32),
diff --git a/sound/core/device.c b/sound/core/device.c
index b57d80a17052..e28260dde831 100644
--- a/sound/core/device.c
+++ b/sound/core/device.c
@@ -130,7 +130,7 @@ EXPORT_SYMBOL_GPL(snd_device_disconnect);
 void snd_device_free(struct snd_card *card, void *device_data)
 {
 	struct snd_device *dev;
-	
+
 	if (snd_BUG_ON(!card || !device_data))
 		return;
 	dev = look_for_dev(card, device_data);
@@ -190,7 +190,7 @@ int snd_device_register_all(struct snd_card *card)
 {
 	struct snd_device *dev;
 	int err;
-	
+
 	if (snd_BUG_ON(!card))
 		return -ENXIO;
 	list_for_each_entry(dev, &card->devices, list) {
diff --git a/sound/core/hwdep.c b/sound/core/hwdep.c
index 09200df2932c..7c61d5467bf5 100644
--- a/sound/core/hwdep.c
+++ b/sound/core/hwdep.c
@@ -53,7 +53,7 @@ static ssize_t snd_hwdep_read(struct file * file, char __user *buf,
 	struct snd_hwdep *hw = file->private_data;
 	if (hw->ops.read)
 		return hw->ops.read(hw, buf, count, offset);
-	return -ENXIO;	
+	return -ENXIO;
 }
 
 static ssize_t snd_hwdep_write(struct file * file, const char __user *buf,
@@ -62,7 +62,7 @@ static ssize_t snd_hwdep_write(struct file * file, const char __user *buf,
 	struct snd_hwdep *hw = file->private_data;
 	if (hw->ops.write)
 		return hw->ops.write(hw, buf, count, offset);
-	return -ENXIO;	
+	return -ENXIO;
 }
 
 static int snd_hwdep_open(struct inode *inode, struct file * file)
@@ -174,7 +174,7 @@ static int snd_hwdep_info(struct snd_hwdep *hw,
 			  struct snd_hwdep_info __user *_info)
 {
 	struct snd_hwdep_info info;
-	
+
 	memset(&info, 0, sizeof(info));
 	info.card = hw->card->number;
 	strscpy(info.id, hw->id, sizeof(info.id));
@@ -190,7 +190,7 @@ static int snd_hwdep_dsp_status(struct snd_hwdep *hw,
 {
 	struct snd_hwdep_dsp_status info;
 	int err;
-	
+
 	if (! hw->ops.dsp_status)
 		return -ENXIO;
 	memset(&info, 0, sizeof(info));
@@ -207,7 +207,7 @@ static int snd_hwdep_dsp_load(struct snd_hwdep *hw,
 			      struct snd_hwdep_dsp_image *info)
 {
 	int err;
-	
+
 	if (! hw->ops.dsp_load)
 		return -ENXIO;
 	if (info->index >= 32)
diff --git a/sound/core/init.c b/sound/core/init.c
index b9b708cf980d..000843e87844 100644
--- a/sound/core/init.c
+++ b/sound/core/init.c
@@ -708,7 +708,7 @@ static void snd_card_set_id_no_lock(struct snd_card *card, const char *src,
 	int len, loops;
 	bool is_default = false;
 	char *id;
-	
+
 	copy_valid_id_string(card, src, nid);
 	id = card->id;
 
@@ -1019,7 +1019,6 @@ int __init snd_card_info_init(void)
  *
  *  Return: Zero otherwise a negative error code.
  */
-  
 int snd_component_add(struct snd_card *card, const char *component)
 {
 	char *ptr;
diff --git a/sound/core/memalloc.c b/sound/core/memalloc.c
index f901504b5afc..87c0be5c76b4 100644
--- a/sound/core/memalloc.c
+++ b/sound/core/memalloc.c
@@ -2,7 +2,7 @@
 /*
  *  Copyright (c) by Jaroslav Kysela <perex@perex.cz>
  *                   Takashi Iwai <tiwai@suse.de>
- * 
+ *
  *  Generic memory allocators
  */
 
diff --git a/sound/core/memory.c b/sound/core/memory.c
index 2d2d0094c897..8705f20529dd 100644
--- a/sound/core/memory.c
+++ b/sound/core/memory.c
@@ -1,7 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0-or-later
 /*
  *  Copyright (c) by Jaroslav Kysela <perex@perex.cz>
- * 
+ *
  *  Misc memory accessors
  */
 
diff --git a/sound/core/pcm.c b/sound/core/pcm.c
index dc37f3508dc7..7c22ab40d4ed 100644
--- a/sound/core/pcm.c
+++ b/sound/core/pcm.c
@@ -137,7 +137,7 @@ static int snd_pcm_control_ioctl(struct snd_card *card,
 	case SNDRV_CTL_IOCTL_PCM_PREFER_SUBDEVICE:
 		{
 			int val;
-			
+
 			if (get_user(val, (int __user *)arg))
 				return -EFAULT;
 			control->preferred_subdevice[SND_CTL_SUBDEV_PCM] = val;
@@ -229,7 +229,7 @@ EXPORT_SYMBOL_GPL(snd_pcm_format_name);
 #define TSTAMP(v) [SNDRV_PCM_TSTAMP_##v] = #v
 #define ACCESS(v) [SNDRV_PCM_ACCESS_##v] = #v
 #define START(v) [SNDRV_PCM_START_##v] = #v
-#define SUBFORMAT(v) [SNDRV_PCM_SUBFORMAT_##v] = #v 
+#define SUBFORMAT(v) [SNDRV_PCM_SUBFORMAT_##v] = #v
 
 static const char * const snd_pcm_stream_names[] = {
 	STREAM(PLAYBACK),
@@ -249,7 +249,7 @@ static const char * const snd_pcm_state_names[] = {
 };
 
 static const char * const snd_pcm_access_names[] = {
-	ACCESS(MMAP_INTERLEAVED), 
+	ACCESS(MMAP_INTERLEAVED),
 	ACCESS(MMAP_NONINTERLEAVED),
 	ACCESS(MMAP_COMPLEX),
 	ACCESS(RW_INTERLEAVED),
@@ -257,7 +257,7 @@ static const char * const snd_pcm_access_names[] = {
 };
 
 static const char * const snd_pcm_subformat_names[] = {
-	SUBFORMAT(STD), 
+	SUBFORMAT(STD),
 	SUBFORMAT(MSBITS_MAX),
 	SUBFORMAT(MSBITS_20),
 	SUBFORMAT(MSBITS_24),
@@ -388,14 +388,14 @@ static void snd_pcm_substream_proc_hw_params_read(struct snd_info_entry *entry,
 	snd_iprintf(buffer, "access: %s\n", snd_pcm_access_name(runtime->access));
 	snd_iprintf(buffer, "format: %s\n", snd_pcm_format_name(runtime->format));
 	snd_iprintf(buffer, "subformat: %s\n", snd_pcm_subformat_name(runtime->subformat));
-	snd_iprintf(buffer, "channels: %u\n", runtime->channels);	
-	snd_iprintf(buffer, "rate: %u (%u/%u)\n", runtime->rate, runtime->rate_num, runtime->rate_den);	
-	snd_iprintf(buffer, "period_size: %lu\n", runtime->period_size);	
-	snd_iprintf(buffer, "buffer_size: %lu\n", runtime->buffer_size);	
+	snd_iprintf(buffer, "channels: %u\n", runtime->channels);
+	snd_iprintf(buffer, "rate: %u (%u/%u)\n", runtime->rate, runtime->rate_num, runtime->rate_den);
+	snd_iprintf(buffer, "period_size: %lu\n", runtime->period_size);
+	snd_iprintf(buffer, "buffer_size: %lu\n", runtime->buffer_size);
 #if IS_ENABLED(CONFIG_SND_PCM_OSS)
 	if (substream->oss.oss) {
 		snd_iprintf(buffer, "OSS format: %s\n", snd_pcm_oss_format_name(runtime->oss.format));
-		snd_iprintf(buffer, "OSS channels: %u\n", runtime->oss.channels);	
+		snd_iprintf(buffer, "OSS channels: %u\n", runtime->oss.channels);
 		snd_iprintf(buffer, "OSS rate: %u\n", runtime->oss.rate);
 		snd_iprintf(buffer, "OSS period bytes: %lu\n", (unsigned long)runtime->oss.period_bytes);
 		snd_iprintf(buffer, "OSS periods: %u\n", runtime->oss.periods);
@@ -496,7 +496,7 @@ static int snd_pcm_stream_proc_init(struct snd_pcm_str *pstr)
 	struct snd_info_entry *entry;
 	char name[16];
 
-	sprintf(name, "pcm%i%c", pcm->device, 
+	sprintf(name, "pcm%i%c", pcm->device,
 		pstr->stream == SNDRV_PCM_STREAM_PLAYBACK ? 'p' : 'c');
 	entry = snd_info_create_card_entry(pcm->card, name,
 					   pcm->card->proc_root);
@@ -690,7 +690,7 @@ int snd_pcm_new_stream(struct snd_pcm *pcm, int stream, int substream_count)
 		prev = substream;
 	}
 	return 0;
-}				
+}
 EXPORT_SYMBOL(snd_pcm_new_stream);
 
 static int _snd_pcm_new(struct snd_card *card, const char *id, int device,
diff --git a/sound/core/pcm_compat.c b/sound/core/pcm_compat.c
index a42ec7f5a1da..59cb9a49ff21 100644
--- a/sound/core/pcm_compat.c
+++ b/sound/core/pcm_compat.c
@@ -232,7 +232,7 @@ static int snd_pcm_status_user_compat64(struct snd_pcm_substream *substream,
 
 /* both for HW_PARAMS and HW_REFINE */
 static int snd_pcm_ioctl_hw_params_compat(struct snd_pcm_substream *substream,
-					  int refine, 
+					  int refine,
 					  struct snd_pcm_hw_params32 __user *data32)
 {
 	struct snd_pcm_hw_params *data __free(kfree) = NULL;
diff --git a/sound/core/pcm_lib.c b/sound/core/pcm_lib.c
index 6f73b3c2c205..8c099407c8ce 100644
--- a/sound/core/pcm_lib.c
+++ b/sound/core/pcm_lib.c
@@ -509,7 +509,7 @@ void snd_pcm_set_ops(struct snd_pcm *pcm, int direction,
 {
 	struct snd_pcm_str *stream = &pcm->streams[direction];
 	struct snd_pcm_substream *substream;
-	
+
 	for (substream = stream->substream; substream != NULL; substream = substream->next)
 		substream->ops = ops;
 }
@@ -524,7 +524,7 @@ EXPORT_SYMBOL(snd_pcm_set_ops);
 void snd_pcm_set_sync(struct snd_pcm_substream *substream)
 {
 	struct snd_pcm_runtime *runtime = substream->runtime;
-	
+
 	runtime->sync.id32[0] = substream->pcm->card->number;
 	runtime->sync.id32[1] = -1;
 	runtime->sync.id32[2] = -1;
@@ -536,7 +536,7 @@ EXPORT_SYMBOL(snd_pcm_set_sync);
  *  Standard ioctl routine
  */
 
-static inline unsigned int div32(unsigned int a, unsigned int b, 
+static inline unsigned int div32(unsigned int a, unsigned int b,
 				 unsigned int *r)
 {
 	if (b == 0) {
@@ -800,7 +800,7 @@ void snd_interval_mulkdiv(const struct snd_interval *a, unsigned int k,
 /**
  * snd_interval_ratnum - refine the interval value
  * @i: interval to refine
- * @rats_count: number of ratnum_t 
+ * @rats_count: number of ratnum_t
  * @rats: ratnum_t array
  * @nump: pointer to store the resultant numerator
  * @denp: pointer to store the resultant denominator
@@ -855,7 +855,7 @@ int snd_interval_ratnum(struct snd_interval *i,
 	}
 	t.min = div_down(best_num, best_den);
 	t.openmin = !!(best_num % best_den);
-	
+
 	result_num = best_num;
 	result_diff = best_diff;
 	result_den = best_den;
@@ -967,7 +967,7 @@ static int snd_interval_ratden(struct snd_interval *i,
 	}
 	t.min = div_down(best_num, best_den);
 	t.openmin = !!(best_num % best_den);
-	
+
 	best_num = best_den = best_diff = 0;
 	for (k = 0; k < rats_count; ++k) {
 		unsigned int num;
@@ -1255,7 +1255,7 @@ EXPORT_SYMBOL(snd_pcm_hw_constraint_integer);
  * @var: hw_params variable to apply the range
  * @min: the minimal value
  * @max: the maximal value
- * 
+ *
  * Apply the min/max range constraint to an interval parameter.
  *
  * Return: Positive if the value is changed, zero if it's not changed, or a
@@ -1279,8 +1279,7 @@ static int snd_pcm_hw_rule_list(struct snd_pcm_hw_params *params,
 {
 	struct snd_pcm_hw_constraint_list *list = rule->private;
 	return snd_interval_list(hw_param_interval(params, rule->var), list->count, list->list, list->mask);
-}		
-
+}
 
 /**
  * snd_pcm_hw_constraint_list - apply a list of constraints to a parameter
@@ -1288,7 +1287,7 @@ static int snd_pcm_hw_rule_list(struct snd_pcm_hw_params *params,
  * @cond: condition bits
  * @var: hw_params variable to apply the list constraint
  * @l: list
- * 
+ *
  * Apply the list of constraints to an interval parameter.
  *
  * Return: Zero if successful, or a negative error code on failure.
@@ -1359,7 +1358,7 @@ static int snd_pcm_hw_rule_ratnums(struct snd_pcm_hw_params *params,
  *
  * Return: Zero if successful, or a negative error code on failure.
  */
-int snd_pcm_hw_constraint_ratnums(struct snd_pcm_runtime *runtime, 
+int snd_pcm_hw_constraint_ratnums(struct snd_pcm_runtime *runtime,
 				  unsigned int cond,
 				  snd_pcm_hw_param_t var,
 				  const struct snd_pcm_hw_constraint_ratnums *r)
@@ -1393,7 +1392,7 @@ static int snd_pcm_hw_rule_ratdens(struct snd_pcm_hw_params *params,
  *
  * Return: Zero if successful, or a negative error code on failure.
  */
-int snd_pcm_hw_constraint_ratdens(struct snd_pcm_runtime *runtime, 
+int snd_pcm_hw_constraint_ratdens(struct snd_pcm_runtime *runtime,
 				  unsigned int cond,
 				  snd_pcm_hw_param_t var,
 				  const struct snd_pcm_hw_constraint_ratdens *r)
@@ -1437,7 +1436,7 @@ static int snd_pcm_hw_rule_msbits(struct snd_pcm_hw_params *params,
  *
  * Return: Zero if successful, or a negative error code on failure.
  */
-int snd_pcm_hw_constraint_msbits(struct snd_pcm_runtime *runtime, 
+int snd_pcm_hw_constraint_msbits(struct snd_pcm_runtime *runtime,
 				 unsigned int cond,
 				 unsigned int width,
 				 unsigned int msbits)
@@ -1471,7 +1470,7 @@ int snd_pcm_hw_constraint_step(struct snd_pcm_runtime *runtime,
 			       snd_pcm_hw_param_t var,
 			       unsigned long step)
 {
-	return snd_pcm_hw_rule_add(runtime, cond, var, 
+	return snd_pcm_hw_rule_add(runtime, cond, var,
 				   snd_pcm_hw_rule_step, (void *) step,
 				   var, -1);
 }
@@ -1487,7 +1486,7 @@ static int snd_pcm_hw_rule_pow2(struct snd_pcm_hw_params *params, struct snd_pcm
 	};
 	return snd_interval_list(hw_param_interval(params, rule->var),
 				 ARRAY_SIZE(pow2_sizes), pow2_sizes, 0);
-}		
+}
 
 /**
  * snd_pcm_hw_constraint_pow2 - add a hw constraint power-of-2 rule
@@ -1501,7 +1500,7 @@ int snd_pcm_hw_constraint_pow2(struct snd_pcm_runtime *runtime,
 			       unsigned int cond,
 			       snd_pcm_hw_param_t var)
 {
-	return snd_pcm_hw_rule_add(runtime, cond, var, 
+	return snd_pcm_hw_rule_add(runtime, cond, var,
 				   snd_pcm_hw_rule_pow2, NULL,
 				   var, -1);
 }
@@ -1644,8 +1643,8 @@ static int _snd_pcm_hw_param_first(struct snd_pcm_hw_params *params,
  *
  * Return: The minimum, or a negative error code on failure.
  */
-int snd_pcm_hw_param_first(struct snd_pcm_substream *pcm, 
-			   struct snd_pcm_hw_params *params, 
+int snd_pcm_hw_param_first(struct snd_pcm_substream *pcm,
+			   struct snd_pcm_hw_params *params,
 			   snd_pcm_hw_param_t var, int *dir)
 {
 	int changed = _snd_pcm_hw_param_first(params, var);
@@ -1690,7 +1689,7 @@ static int _snd_pcm_hw_param_last(struct snd_pcm_hw_params *params,
  *
  * Return: The maximum, or a negative error code on failure.
  */
-int snd_pcm_hw_param_last(struct snd_pcm_substream *pcm, 
+int snd_pcm_hw_param_last(struct snd_pcm_substream *pcm,
 			  struct snd_pcm_hw_params *params,
 			  snd_pcm_hw_param_t var, int *dir)
 {
@@ -1975,7 +1974,7 @@ static int wait_for_avail(struct snd_pcm_substream *substream,
 		case SNDRV_PCM_STATE_DRAINING:
 			if (is_playback)
 				err = -EPIPE;
-			else 
+			else
 				avail = 0; /* indicate draining */
 			goto _endloop;
 		case SNDRV_PCM_STATE_OPEN:
@@ -2000,7 +1999,7 @@ static int wait_for_avail(struct snd_pcm_substream *substream,
 	*availp = avail;
 	return err;
 }
-	
+
 typedef int (*pcm_transfer_f)(struct snd_pcm_substream *substream,
 			      int channel, unsigned long hwoff,
 			      struct iov_iter *iter, unsigned long bytes);
diff --git a/sound/core/pcm_misc.c b/sound/core/pcm_misc.c
index 5588b6a1ee8b..ec0872fb7736 100644
--- a/sound/core/pcm_misc.c
+++ b/sound/core/pcm_misc.c
@@ -18,7 +18,7 @@
  *   Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307 USA
  *
  */
-  
+
 #include <linux/time.h>
 #include <linux/export.h>
 #include <sound/core.h>
diff --git a/sound/core/pcm_native.c b/sound/core/pcm_native.c
index 521ba56392a0..13abcd5c37ba 100644
--- a/sound/core/pcm_native.c
+++ b/sound/core/pcm_native.c
@@ -1152,7 +1152,7 @@ static int snd_pcm_channel_info(struct snd_pcm_substream *substream,
 {
 	struct snd_pcm_runtime *runtime;
 	unsigned int channel;
-	
+
 	channel = info->channel;
 	runtime = substream->runtime;
 	scoped_guard(pcm_stream_lock_irq, substream) {
@@ -1171,7 +1171,7 @@ static int snd_pcm_channel_info_user(struct snd_pcm_substream *substream,
 {
 	struct snd_pcm_channel_info info;
 	int res;
-	
+
 	if (copy_from_user(&info, _info, sizeof(info)))
 		return -EFAULT;
 	res = snd_pcm_channel_info(substream, &info);
@@ -1280,7 +1280,7 @@ static int snd_pcm_action_single(const struct action_ops *ops,
 				 snd_pcm_state_t state)
 {
 	int res;
-	
+
 	res = ops->pre_action(substream, state);
 	if (res < 0)
 		return res;
@@ -1450,7 +1450,7 @@ static void snd_pcm_post_start(struct snd_pcm_substream *substream,
 	struct snd_pcm_runtime *runtime = substream->runtime;
 	snd_pcm_trigger_tstamp(substream);
 	runtime->hw_ptr_jiffies = jiffies;
-	runtime->hw_ptr_buffer_jiffies = (runtime->buffer_size * HZ) / 
+	runtime->hw_ptr_buffer_jiffies = (runtime->buffer_size * HZ) /
 							    runtime->rate;
 	__snd_pcm_set_state(runtime, state);
 	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK &&
@@ -2191,7 +2191,7 @@ static int snd_pcm_drop(struct snd_pcm_substream *substream)
 {
 	struct snd_pcm_runtime *runtime;
 	int result = 0;
-	
+
 	if (PCM_RUNTIME_CHECK(substream))
 		return -ENXIO;
 	runtime = substream->runtime;
@@ -2431,7 +2431,7 @@ static int snd_pcm_hw_rule_rate(struct snd_pcm_hw_params *params,
 	return snd_interval_list(hw_param_interval(params, rule->var),
 				 snd_pcm_known_rates.count,
 				 snd_pcm_known_rates.list, hw->rates);
-}		
+}
 
 static int snd_pcm_hw_rule_buffer_bytes_max(struct snd_pcm_hw_params *params,
 					    struct snd_pcm_hw_rule *rule)
@@ -2444,7 +2444,7 @@ static int snd_pcm_hw_rule_buffer_bytes_max(struct snd_pcm_hw_params *params,
 	t.openmax = 0;
 	t.integer = 1;
 	return snd_interval_refine(hw_param_interval(params, rule->var), &t);
-}		
+}
 
 static int snd_pcm_hw_rule_subformats(struct snd_pcm_hw_params *params,
 				      struct snd_pcm_hw_rule *rule)
@@ -2506,98 +2506,98 @@ static int snd_pcm_hw_constraints_init(struct snd_pcm_substream *substream)
 				   SNDRV_PCM_HW_PARAM_SAMPLE_BITS, -1);
 	if (err < 0)
 		return err;
-	err = snd_pcm_hw_rule_add(runtime, 0, SNDRV_PCM_HW_PARAM_SAMPLE_BITS, 
+	err = snd_pcm_hw_rule_add(runtime, 0, SNDRV_PCM_HW_PARAM_SAMPLE_BITS,
 				  snd_pcm_hw_rule_sample_bits, NULL,
-				  SNDRV_PCM_HW_PARAM_FORMAT, 
+				  SNDRV_PCM_HW_PARAM_FORMAT,
 				  SNDRV_PCM_HW_PARAM_SAMPLE_BITS, -1);
 	if (err < 0)
 		return err;
-	err = snd_pcm_hw_rule_add(runtime, 0, SNDRV_PCM_HW_PARAM_SAMPLE_BITS, 
+	err = snd_pcm_hw_rule_add(runtime, 0, SNDRV_PCM_HW_PARAM_SAMPLE_BITS,
 				  snd_pcm_hw_rule_div, NULL,
 				  SNDRV_PCM_HW_PARAM_FRAME_BITS, SNDRV_PCM_HW_PARAM_CHANNELS, -1);
 	if (err < 0)
 		return err;
-	err = snd_pcm_hw_rule_add(runtime, 0, SNDRV_PCM_HW_PARAM_FRAME_BITS, 
+	err = snd_pcm_hw_rule_add(runtime, 0, SNDRV_PCM_HW_PARAM_FRAME_BITS,
 				  snd_pcm_hw_rule_mul, NULL,
 				  SNDRV_PCM_HW_PARAM_SAMPLE_BITS, SNDRV_PCM_HW_PARAM_CHANNELS, -1);
 	if (err < 0)
 		return err;
-	err = snd_pcm_hw_rule_add(runtime, 0, SNDRV_PCM_HW_PARAM_FRAME_BITS, 
+	err = snd_pcm_hw_rule_add(runtime, 0, SNDRV_PCM_HW_PARAM_FRAME_BITS,
 				  snd_pcm_hw_rule_mulkdiv, (void*) 8,
 				  SNDRV_PCM_HW_PARAM_PERIOD_BYTES, SNDRV_PCM_HW_PARAM_PERIOD_SIZE, -1);
 	if (err < 0)
 		return err;
-	err = snd_pcm_hw_rule_add(runtime, 0, SNDRV_PCM_HW_PARAM_FRAME_BITS, 
+	err = snd_pcm_hw_rule_add(runtime, 0, SNDRV_PCM_HW_PARAM_FRAME_BITS,
 				  snd_pcm_hw_rule_mulkdiv, (void*) 8,
 				  SNDRV_PCM_HW_PARAM_BUFFER_BYTES, SNDRV_PCM_HW_PARAM_BUFFER_SIZE, -1);
 	if (err < 0)
 		return err;
-	err = snd_pcm_hw_rule_add(runtime, 0, SNDRV_PCM_HW_PARAM_CHANNELS, 
+	err = snd_pcm_hw_rule_add(runtime, 0, SNDRV_PCM_HW_PARAM_CHANNELS,
 				  snd_pcm_hw_rule_div, NULL,
 				  SNDRV_PCM_HW_PARAM_FRAME_BITS, SNDRV_PCM_HW_PARAM_SAMPLE_BITS, -1);
 	if (err < 0)
 		return err;
-	err = snd_pcm_hw_rule_add(runtime, 0, SNDRV_PCM_HW_PARAM_RATE, 
+	err = snd_pcm_hw_rule_add(runtime, 0, SNDRV_PCM_HW_PARAM_RATE,
 				  snd_pcm_hw_rule_mulkdiv, (void*) 1000000,
 				  SNDRV_PCM_HW_PARAM_PERIOD_SIZE, SNDRV_PCM_HW_PARAM_PERIOD_TIME, -1);
 	if (err < 0)
 		return err;
-	err = snd_pcm_hw_rule_add(runtime, 0, SNDRV_PCM_HW_PARAM_RATE, 
+	err = snd_pcm_hw_rule_add(runtime, 0, SNDRV_PCM_HW_PARAM_RATE,
 				  snd_pcm_hw_rule_mulkdiv, (void*) 1000000,
 				  SNDRV_PCM_HW_PARAM_BUFFER_SIZE, SNDRV_PCM_HW_PARAM_BUFFER_TIME, -1);
 	if (err < 0)
 		return err;
-	err = snd_pcm_hw_rule_add(runtime, 0, SNDRV_PCM_HW_PARAM_PERIODS, 
+	err = snd_pcm_hw_rule_add(runtime, 0, SNDRV_PCM_HW_PARAM_PERIODS,
 				  snd_pcm_hw_rule_div, NULL,
 				  SNDRV_PCM_HW_PARAM_BUFFER_SIZE, SNDRV_PCM_HW_PARAM_PERIOD_SIZE, -1);
 	if (err < 0)
 		return err;
-	err = snd_pcm_hw_rule_add(runtime, 0, SNDRV_PCM_HW_PARAM_PERIOD_SIZE, 
+	err = snd_pcm_hw_rule_add(runtime, 0, SNDRV_PCM_HW_PARAM_PERIOD_SIZE,
 				  snd_pcm_hw_rule_div, NULL,
 				  SNDRV_PCM_HW_PARAM_BUFFER_SIZE, SNDRV_PCM_HW_PARAM_PERIODS, -1);
 	if (err < 0)
 		return err;
-	err = snd_pcm_hw_rule_add(runtime, 0, SNDRV_PCM_HW_PARAM_PERIOD_SIZE, 
+	err = snd_pcm_hw_rule_add(runtime, 0, SNDRV_PCM_HW_PARAM_PERIOD_SIZE,
 				  snd_pcm_hw_rule_mulkdiv, (void*) 8,
 				  SNDRV_PCM_HW_PARAM_PERIOD_BYTES, SNDRV_PCM_HW_PARAM_FRAME_BITS, -1);
 	if (err < 0)
 		return err;
-	err = snd_pcm_hw_rule_add(runtime, 0, SNDRV_PCM_HW_PARAM_PERIOD_SIZE, 
+	err = snd_pcm_hw_rule_add(runtime, 0, SNDRV_PCM_HW_PARAM_PERIOD_SIZE,
 				  snd_pcm_hw_rule_muldivk, (void*) 1000000,
 				  SNDRV_PCM_HW_PARAM_PERIOD_TIME, SNDRV_PCM_HW_PARAM_RATE, -1);
 	if (err < 0)
 		return err;
-	err = snd_pcm_hw_rule_add(runtime, 0, SNDRV_PCM_HW_PARAM_BUFFER_SIZE, 
+	err = snd_pcm_hw_rule_add(runtime, 0, SNDRV_PCM_HW_PARAM_BUFFER_SIZE,
 				  snd_pcm_hw_rule_mul, NULL,
 				  SNDRV_PCM_HW_PARAM_PERIOD_SIZE, SNDRV_PCM_HW_PARAM_PERIODS, -1);
 	if (err < 0)
 		return err;
-	err = snd_pcm_hw_rule_add(runtime, 0, SNDRV_PCM_HW_PARAM_BUFFER_SIZE, 
+	err = snd_pcm_hw_rule_add(runtime, 0, SNDRV_PCM_HW_PARAM_BUFFER_SIZE,
 				  snd_pcm_hw_rule_mulkdiv, (void*) 8,
 				  SNDRV_PCM_HW_PARAM_BUFFER_BYTES, SNDRV_PCM_HW_PARAM_FRAME_BITS, -1);
 	if (err < 0)
 		return err;
-	err = snd_pcm_hw_rule_add(runtime, 0, SNDRV_PCM_HW_PARAM_BUFFER_SIZE, 
+	err = snd_pcm_hw_rule_add(runtime, 0, SNDRV_PCM_HW_PARAM_BUFFER_SIZE,
 				  snd_pcm_hw_rule_muldivk, (void*) 1000000,
 				  SNDRV_PCM_HW_PARAM_BUFFER_TIME, SNDRV_PCM_HW_PARAM_RATE, -1);
 	if (err < 0)
 		return err;
-	err = snd_pcm_hw_rule_add(runtime, 0, SNDRV_PCM_HW_PARAM_PERIOD_BYTES, 
+	err = snd_pcm_hw_rule_add(runtime, 0, SNDRV_PCM_HW_PARAM_PERIOD_BYTES,
 				  snd_pcm_hw_rule_muldivk, (void*) 8,
 				  SNDRV_PCM_HW_PARAM_PERIOD_SIZE, SNDRV_PCM_HW_PARAM_FRAME_BITS, -1);
 	if (err < 0)
 		return err;
-	err = snd_pcm_hw_rule_add(runtime, 0, SNDRV_PCM_HW_PARAM_BUFFER_BYTES, 
+	err = snd_pcm_hw_rule_add(runtime, 0, SNDRV_PCM_HW_PARAM_BUFFER_BYTES,
 				  snd_pcm_hw_rule_muldivk, (void*) 8,
 				  SNDRV_PCM_HW_PARAM_BUFFER_SIZE, SNDRV_PCM_HW_PARAM_FRAME_BITS, -1);
 	if (err < 0)
 		return err;
-	err = snd_pcm_hw_rule_add(runtime, 0, SNDRV_PCM_HW_PARAM_PERIOD_TIME, 
+	err = snd_pcm_hw_rule_add(runtime, 0, SNDRV_PCM_HW_PARAM_PERIOD_TIME,
 				  snd_pcm_hw_rule_mulkdiv, (void*) 1000000,
 				  SNDRV_PCM_HW_PARAM_PERIOD_SIZE, SNDRV_PCM_HW_PARAM_RATE, -1);
 	if (err < 0)
 		return err;
-	err = snd_pcm_hw_rule_add(runtime, 0, SNDRV_PCM_HW_PARAM_BUFFER_TIME, 
+	err = snd_pcm_hw_rule_add(runtime, 0, SNDRV_PCM_HW_PARAM_BUFFER_TIME,
 				  snd_pcm_hw_rule_mulkdiv, (void*) 1000000,
 				  SNDRV_PCM_HW_PARAM_BUFFER_SIZE, SNDRV_PCM_HW_PARAM_RATE, -1);
 	if (err < 0)
@@ -2661,7 +2661,7 @@ static int snd_pcm_hw_constraints_complete(struct snd_pcm_substream *substream)
 	if (err < 0)
 		return err;
 
-	err = snd_pcm_hw_rule_add(runtime, 0, SNDRV_PCM_HW_PARAM_BUFFER_BYTES, 
+	err = snd_pcm_hw_rule_add(runtime, 0, SNDRV_PCM_HW_PARAM_BUFFER_BYTES,
 				  snd_pcm_hw_rule_buffer_bytes_max, substream,
 				  SNDRV_PCM_HW_PARAM_BUFFER_BYTES, -1);
 	if (err < 0)
@@ -2675,7 +2675,7 @@ static int snd_pcm_hw_constraints_complete(struct snd_pcm_substream *substream)
 	}
 
 	if (!(hw->rates & (SNDRV_PCM_RATE_KNOT | SNDRV_PCM_RATE_CONTINUOUS))) {
-		err = snd_pcm_hw_rule_add(runtime, 0, SNDRV_PCM_HW_PARAM_RATE, 
+		err = snd_pcm_hw_rule_add(runtime, 0, SNDRV_PCM_HW_PARAM_RATE,
 					  snd_pcm_hw_rule_rate, hw,
 					  SNDRV_PCM_HW_PARAM_RATE, -1);
 		if (err < 0)
@@ -3022,7 +3022,7 @@ static int snd_pcm_delay(struct snd_pcm_substream *substream,
 
 	return err;
 }
-		
+
 static inline int snd_pcm_hwsync(struct snd_pcm_substream *substream)
 {
 	return snd_pcm_delay(substream, NULL);
@@ -3041,7 +3041,7 @@ static int snd_pcm_sync_ptr(struct snd_pcm_substream *substream,
 	if (get_user(sync_ptr.flags, (unsigned __user *)&(_sync_ptr->flags)))
 		return -EFAULT;
 	if (copy_from_user(&sync_ptr.c.control, &(_sync_ptr->c.control), sizeof(struct snd_pcm_mmap_control)))
-		return -EFAULT;	
+		return -EFAULT;
 	status = runtime->status;
 	control = runtime->control;
 	if (sync_ptr.flags & SNDRV_PCM_SYNC_PTR_HWSYNC) {
@@ -3185,7 +3185,7 @@ static int snd_pcm_tstamp(struct snd_pcm_substream *substream, int __user *_arg)
 {
 	struct snd_pcm_runtime *runtime = substream->runtime;
 	int arg;
-	
+
 	if (get_user(arg, _arg))
 		return -EFAULT;
 	if (arg < 0 || arg > SNDRV_PCM_TSTAMP_TYPE_LAST)
@@ -3417,7 +3417,7 @@ int snd_pcm_kernel_ioctl(struct snd_pcm_substream *substream,
 {
 	snd_pcm_uframes_t *frames = arg;
 	snd_pcm_sframes_t result;
-	
+
 	if (substream->runtime->state == SNDRV_PCM_STATE_DISCONNECTED)
 		return -EBADFD;
 
@@ -3641,7 +3641,7 @@ static vm_fault_t snd_pcm_mmap_status_fault(struct vm_fault *vmf)
 {
 	struct snd_pcm_substream *substream = vmf->vma->vm_private_data;
 	struct snd_pcm_runtime *runtime;
-	
+
 	if (substream == NULL)
 		return VM_FAULT_SIGBUS;
 	runtime = substream->runtime;
@@ -3679,7 +3679,7 @@ static vm_fault_t snd_pcm_mmap_control_fault(struct vm_fault *vmf)
 {
 	struct snd_pcm_substream *substream = vmf->vma->vm_private_data;
 	struct snd_pcm_runtime *runtime;
-	
+
 	if (substream == NULL)
 		return VM_FAULT_SIGBUS;
 	runtime = substream->runtime;
@@ -3771,7 +3771,7 @@ static vm_fault_t snd_pcm_mmap_data_fault(struct vm_fault *vmf)
 	unsigned long offset;
 	struct page * page;
 	size_t dma_bytes;
-	
+
 	if (substream == NULL)
 		return VM_FAULT_SIGBUS;
 	runtime = substream->runtime;
@@ -3906,9 +3906,9 @@ EXPORT_SYMBOL(snd_pcm_mmap_data);
 static int snd_pcm_mmap(struct file *file, struct vm_area_struct *area)
 {
 	struct snd_pcm_file * pcm_file;
-	struct snd_pcm_substream *substream;	
+	struct snd_pcm_substream *substream;
 	unsigned long offset;
-	
+
 	pcm_file = file->private_data;
 	substream = pcm_file->substream;
 	if (PCM_RUNTIME_CHECK(substream))
diff --git a/sound/core/seq_device.c b/sound/core/seq_device.c
index 654d620d0199..25e72b275410 100644
--- a/sound/core/seq_device.c
+++ b/sound/core/seq_device.c
@@ -234,7 +234,7 @@ int snd_seq_device_new(struct snd_card *card, int device, const char *id,
 		put_device(&dev->dev);
 		return err;
 	}
-	
+
 	if (result)
 		*result = dev;
 

-- 
2.43.0

