Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 94E4E952A6A
	for <lists+alsa-devel@lfdr.de>; Thu, 15 Aug 2024 10:27:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2FD242BD5;
	Thu, 15 Aug 2024 10:27:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2FD242BD5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1723710440;
	bh=3XkI4b92uJtcH/wkNHuOUJZhokFuyv930DI5WCjRN0I=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=AZFuVm0nyVtDtS0KTdWQ/bRjjyVSuk1GLCsTNL1YI+TSo8D4zf/a5tlAaly8QQi3m
	 XTxLI+piw+eNMPKcOZVYTrTGgT5Ddr/0ew8yqBNSegmfLGO0V/31R0heQBhkMiidyi
	 IOHsWBGM8Rgr7ZyZC+p/BMarf8TOk0WtB5ZKkMjg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2FC45F807DE; Thu, 15 Aug 2024 10:24:06 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 50D2FF805BE;
	Thu, 15 Aug 2024 10:24:05 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 370F1F802DB; Fri,  9 Aug 2024 16:07:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com
 [IPv6:2607:f8b0:4864:20::52d])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id BEAE8F800BF
	for <alsa-devel@alsa-project.org>; Fri,  9 Aug 2024 16:07:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BEAE8F800BF
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256
 header.s=google header.b=AUxBP7D5
Received: by mail-pg1-x52d.google.com with SMTP id
 41be03b00d2f7-7ae3d7222d4so1501298a12.3
        for <alsa-devel@alsa-project.org>;
 Fri, 09 Aug 2024 07:07:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1723212436; x=1723817236;
 darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=g2ubsNBkHICjAKnj3VJLgF6tvUYKGQaSXUZ9IHeUjTM=;
        b=AUxBP7D5A4M4nWSj6wdDak4icDqjtYKB5JwXL34dVtf1NlZS99aHAGv+1muOE/PMRI
         fE9ha8FgG7UDp5YXNQ619H4xavX1925aW0d9y6Zbp0z3NvOYJrgNGNDRV2uyaI/lBD4B
         6aILx5Fk8wQNuTiKyAIBzjk+2CVj6APGpDqsM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723212436; x=1723817236;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=g2ubsNBkHICjAKnj3VJLgF6tvUYKGQaSXUZ9IHeUjTM=;
        b=uEjtez7jiJ2Jddvgcd0cJUu7z0HM7gT7GayguGWA28kuZYTVCLYnYTxcIHjuGoMFe2
         rK1syIS0LUG5WXGYW2/T7knymrJY36uDNp52GlOKWQOQ6Vxhosq1NGahky3aTiaD8wz0
         prqQp/KXn34VXdbf+ylbWFlWoTM+O7yFPwFejNzN+Ax2KOm7ewyXx3wLElQ55Y3H7faF
         9dAFuXu3JHRZAESeLqRneo8GVBqcwoxJLT4gw78ElM7DZE1hGM2nW5lUOZvlKRUCSeX6
         l5g4hlvHEPUV8NEmFoweHKfrRm9R2HDLRDTskmb7M67VvqcuAw7N3Jq9Hd/AlXKjcP04
         6HKQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVkvBo2ZiXfff744Ds8yfzcoBFRRSbaYPRPnWtmlX6TZIWbnppCbQDVVahymIA4vRNYXf4Atulnu+3EMTfb49t3UaVAlki51LpX/+k=
X-Gm-Message-State: AOJu0YzMs+FFnG07huQssoZMfShVQT6+xZDLxTkoXDGR6lFrdjXKKzG6
	pxRK8TJ+hhMOmt5qRu328ySbLFFqIiliU14GJHqzFU13m/lvhUKSt9M0qc4rTQ==
X-Google-Smtp-Source: 
 AGHT+IHBh5T9/m4Bb3Mnijo58OaunbxzLHZGB7+5RnK6l5Z6jVFq/unajHaFdxGJkfXNRPo1eRsBIQ==
X-Received: by 2002:a17:90a:510e:b0:2cb:5128:efdd with SMTP id
 98e67ed59e1d1-2d1e7fb6373mr1812276a91.10.1723212435769;
        Fri, 09 Aug 2024 07:07:15 -0700 (PDT)
Received: from normanbt-p620.tpe.corp.google.com
 ([2401:fa00:1:17:86a2:9ae6:e93:3245])
        by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2d1c9c64b1fsm3262422a91.7.2024.08.09.07.07.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Aug 2024 07:07:15 -0700 (PDT)
From: Norman Bintang <normanbt@chromium.org>
To: LKML <linux-kernel@vger.kernel.org>
Cc: broonie@kernel.org,
	alsa-devel@alsa-project.org,
	Takashi Iwai <tiwai@suse.com>,
	cujomalainey@chromium.org,
	Norman Bintang <normanbt@chromium.org>,
	Chih-Yang Hsia <paulhsia@chromium.org>,
	David Riley <davidriley@chromium.org>
Subject: [PATCH] ALSA: pcm: Add xrun counter for snd_pcm_substream
Date: Fri,  9 Aug 2024 22:06:45 +0800
Message-ID: <20240809140648.3414349-1-normanbt@chromium.org>
X-Mailer: git-send-email 2.46.0.76.ge559c4bf1a-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MailFrom: normanbt@chromium.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: ZALWLOQASDMMAWMUFAR4HGRRIHUWWFQX
X-Message-ID-Hash: ZALWLOQASDMMAWMUFAR4HGRRIHUWWFQX
X-Mailman-Approved-At: Thu, 15 Aug 2024 08:23:16 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZALWLOQASDMMAWMUFAR4HGRRIHUWWFQX/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

This patch adds an xrun counter to snd_pcm_substream as an alternative
to using logs from XRUN_DEBUG_BASIC. The counter provides a way to track
the number of xrun occurences, accessible through the /proc interface.

The counter is enabled when CONFIG_SND_PCM_XRUN_DEBUG is set.

Example output:

$ cat /proc/asound/card0/pcm9p/sub0/status

owner_pid   : 1425
trigger_time: 235.248957291
tstamp      : 0.000000000
delay       : 1912
avail       : 480
avail_max   : 1920
-----
hw_ptr      : 672000
appl_ptr    : 673440
xrun_counter: 3  # (new row)

Signed-off-by: Norman Bintang <normanbt@chromium.org>
Reviewed-by: Chih-Yang Hsia <paulhsia@chromium.org>
Tested-by: Chih-Yang Hsia <paulhsia@chromium.org>
Reviewed-by: David Riley <davidriley@chromium.org>
---

 include/sound/pcm.h  | 3 +++
 sound/core/pcm.c     | 6 ++++++
 sound/core/pcm_lib.c | 3 +++
 3 files changed, 12 insertions(+)

diff --git a/include/sound/pcm.h b/include/sound/pcm.h
index ac8f3aef9205..384032b6c59c 100644
--- a/include/sound/pcm.h
+++ b/include/sound/pcm.h
@@ -498,6 +498,9 @@ struct snd_pcm_substream {
 	/* misc flags */
 	unsigned int hw_opened: 1;
 	unsigned int managed_buffer_alloc:1;
+#ifdef CONFIG_SND_PCM_XRUN_DEBUG
+	unsigned int xrun_counter; /* number of times xrun happens */
+#endif /* CONFIG_SND_PCM_XRUN_DEBUG */
 };
 
 #define SUBSTREAM_BUSY(substream) ((substream)->ref_count > 0)
diff --git a/sound/core/pcm.c b/sound/core/pcm.c
index dc37f3508dc7..290690fc2abc 100644
--- a/sound/core/pcm.c
+++ b/sound/core/pcm.c
@@ -462,6 +462,9 @@ static void snd_pcm_substream_proc_status_read(struct snd_info_entry *entry,
 	snd_iprintf(buffer, "-----\n");
 	snd_iprintf(buffer, "hw_ptr      : %ld\n", runtime->status->hw_ptr);
 	snd_iprintf(buffer, "appl_ptr    : %ld\n", runtime->control->appl_ptr);
+#ifdef CONFIG_SND_PCM_XRUN_DEBUG
+	snd_iprintf(buffer, "xrun_counter: %d\n", substream->xrun_counter);
+#endif
 }
 
 #ifdef CONFIG_SND_PCM_XRUN_DEBUG
@@ -970,6 +973,9 @@ int snd_pcm_attach_substream(struct snd_pcm *pcm, int stream,
 	substream->pid = get_pid(task_pid(current));
 	pstr->substream_opened++;
 	*rsubstream = substream;
+#ifdef CONFIG_SND_PCM_XRUN_DEBUG
+	substream->xrun_counter = 0;
+#endif /* CONFIG_SND_PCM_XRUN_DEBUG */
 	return 0;
 }
 
diff --git a/sound/core/pcm_lib.c b/sound/core/pcm_lib.c
index 6e7905749c4a..6eaa950504cf 100644
--- a/sound/core/pcm_lib.c
+++ b/sound/core/pcm_lib.c
@@ -184,6 +184,9 @@ void __snd_pcm_xrun(struct snd_pcm_substream *substream)
 		pcm_warn(substream->pcm, "XRUN: %s\n", name);
 		dump_stack_on_xrun(substream);
 	}
+#ifdef CONFIG_SND_PCM_XRUN_DEBUG
+	substream->xrun_counter++;
+#endif
 }
 
 #ifdef CONFIG_SND_PCM_XRUN_DEBUG
-- 
2.46.0.76.ge559c4bf1a-goog

