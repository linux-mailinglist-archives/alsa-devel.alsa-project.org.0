Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AC2CFF98BD
	for <lists+alsa-devel@lfdr.de>; Tue, 12 Nov 2019 19:34:43 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 42EFF1658;
	Tue, 12 Nov 2019 19:33:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 42EFF1658
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1573583683;
	bh=ZTCh78X4EjOX3pj2X10F6j99yEoonjYky7XvyNEicZo=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Uof7yOjHxZcoDkmh2TR7Me6rMIh5/YQ/dlIDbNSnhIp6fFyc6hTgsbS17UeDVjOY8
	 L69m6Wkfm4hj+PRAQu3iFIyqe9acIp3Sry2sgLKEZg6CcbPZ+mc7ikQUV3GfzKuwCq
	 j9+q0u4E1Czk7k/5ItfNn5WvEhKZDm6CDbWGJ31E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6E242F8060E;
	Tue, 12 Nov 2019 19:31:29 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 923B6F8070B; Tue, 12 Nov 2019 18:17:37 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AD4D8F805FC
 for <alsa-devel@alsa-project.org>; Tue, 12 Nov 2019 18:17:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AD4D8F805FC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="Eck9OkBW"
Received: by mail-pf1-x444.google.com with SMTP id x28so13815140pfo.6
 for <alsa-devel@alsa-project.org>; Tue, 12 Nov 2019 09:17:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8VfkhaVR0FXWRYv7TUO3M4lLEIpTtvESy4tfTTW+/D0=;
 b=Eck9OkBWHfxSZjjibIiuQWO1WWXBY4jQiiMwqUVvTCjRd0kel/+JdOYcUC8CgQY/QM
 nVizBuNEQYMGHGXv4hMH5aVGNcAUQTx22lQqLRAj9r2rxyGLXUpzuI52FNm4y323K3wc
 Jn/KseHvjTJPLalBLwPWq2vgEngd54d0J6Cyg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8VfkhaVR0FXWRYv7TUO3M4lLEIpTtvESy4tfTTW+/D0=;
 b=a2710bROyHCe71oV+pmdzD38+er2LIIXmpKv8q6AnG/dB7mVmvHS3GCWi6ag/SuTC/
 xGVHCXO1ajeDjTPcKb+heH4xYGgys01QJstOSSI3EtY5L1Lyb7m3/ywR6cbaCEluEvZS
 +/K+DCUydiKnzozoYrxKKSuPBNVFWKp/oKh8Wg0x2ve0C0mREp2GGLs3srmLsF/TxHLF
 9NRWaTrPKC6/JlWHff7U2uwvQNo/wkHQROIkuI/SMyLKUpyCuDtAIRexIifjOue1je5M
 +PqVSqpFfNL43rIouQcYvpXEaMgSlTZWTb23J+GZ7tTMMD8Ggz6cZsXLASo46Ug6R00h
 5cUg==
X-Gm-Message-State: APjAAAXEOW9mWUE4zkdp29g0Wd89eRNfVh0OE71RKZYMB6lUEy1NvtJb
 dP2AwOPb47rT5roc8522RPfXAg==
X-Google-Smtp-Source: APXvYqxMdjhhO6SVolj4I3rxcxYKkIWLUqdmeXeWHxK0vphaxqGvLdDOrNkQo72JPu2mYsAK35CHtw==
X-Received: by 2002:a63:d10c:: with SMTP id k12mr37971418pgg.344.1573579052775; 
 Tue, 12 Nov 2019 09:17:32 -0800 (PST)
Received: from localhost ([2401:fa00:1:10:521e:3469:803b:9ad6])
 by smtp.gmail.com with ESMTPSA id a66sm19987305pfb.166.2019.11.12.09.17.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Nov 2019 09:17:32 -0800 (PST)
From: paulhsia <paulhsia@chromium.org>
To: linux-kernel@vger.kernel.org
Date: Wed, 13 Nov 2019 01:17:15 +0800
Message-Id: <20191112171715.128727-3-paulhsia@chromium.org>
X-Mailer: git-send-email 2.24.0.rc1.363.gb1bccd3e3d-goog
In-Reply-To: <20191112171715.128727-1-paulhsia@chromium.org>
References: <20191112171715.128727-1-paulhsia@chromium.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 12 Nov 2019 19:31:24 +0100
Cc: alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 paulhsia <paulhsia@chromium.org>, Takashi Iwai <tiwai@suse.com>
Subject: [alsa-devel] [PATCH 2/2] ALSA: pcm: Use stream lock in
	snd_pcm_detach_substream()
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Since snd_pcm_detach_substream modifies the input substream, the
function should use stream lock to protect the modification section.

Signed-off-by: paulhsia <paulhsia@chromium.org>
---
 sound/core/pcm.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/sound/core/pcm.c b/sound/core/pcm.c
index 9a72d641743d..06da9cb8984a 100644
--- a/sound/core/pcm.c
+++ b/sound/core/pcm.c
@@ -980,8 +980,12 @@ void snd_pcm_detach_substream(struct snd_pcm_substream *substream)
 {
 	struct snd_pcm_runtime *runtime;
 
-	if (PCM_RUNTIME_CHECK(substream))
+	if (snd_BUG_ON(!substream))
 		return;
+
+	snd_pcm_stream_lock_irq(substream);
+	if (PCM_RUNTIME_CHECK(substream))
+		goto unlock;
 	runtime = substream->runtime;
 	if (runtime->private_free != NULL)
 		runtime->private_free(runtime);
@@ -1000,6 +1004,8 @@ void snd_pcm_detach_substream(struct snd_pcm_substream *substream)
 	put_pid(substream->pid);
 	substream->pid = NULL;
 	substream->pstr->substream_opened--;
+ unlock:
+	snd_pcm_stream_unlock_irq(substream);
 }
 
 static ssize_t show_pcm_class(struct device *dev,
-- 
2.24.0.rc1.363.gb1bccd3e3d-goog

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
