Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E8C1725A441
	for <lists+alsa-devel@lfdr.de>; Wed,  2 Sep 2020 06:07:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8F7211800;
	Wed,  2 Sep 2020 06:06:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8F7211800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1599019628;
	bh=2gINi1V3qDxftE80kJvy9klZRKOxWvJCtV3jvALYoPk=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=cRnodUKUGyf0e02hXAsfTrOXtpKZq0icCiblwUPmSNc0rsDXUwPdhVAR28YjgO6ke
	 V7JX946g5G081dvb+puassOzjZNTTdEE7E+AehQT1QVi67rZVWjk8cJAzRELAvpmRb
	 9e5R7jDvbX5dYadVLRRb943aOyhOcmWuauzDgM0E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 34442F802FB;
	Wed,  2 Sep 2020 06:03:01 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9BB68F802F8; Wed,  2 Sep 2020 06:02:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D5275F80212
 for <alsa-devel@alsa-project.org>; Wed,  2 Sep 2020 06:02:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D5275F80212
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="JJfSZAQF"
Received: by mail-pg1-x543.google.com with SMTP id w186so1858848pgb.8
 for <alsa-devel@alsa-project.org>; Tue, 01 Sep 2020 21:02:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=sGG3rAOIUtBwifyFrh+uay3mLGw7gglSc8A6kESWHzo=;
 b=JJfSZAQFEvqT9kbV5uHWA1gotLUHMAdFJQ/LH6wPrHNkEx6n7+RDwywqzSrk7HoanN
 6IfloxZ0XHRDZT4QI0q9KkKzAbAjm1nc0dEGvCV01f6ddjlGVnLa+pimhdqZqAjq8wtz
 4jQk168hcBtUIn/sF0nRlI5YVCEaGVb+VuN4sbmSVG7EFyG9FMmGnJZ72MBK863kMDB9
 OVFjq2KjBdUrbfAjJLIGohVeChnpPgpJnDPTFMyNgP1OAcNxqs1ulAIC7ee9p/z8r40Q
 Op6tN/Eky3CqXLoVfs2NWqLlhWYRlH4w3EGjXCxTdTrZZL0pVJxVVq2TGYUhl/7rN0kc
 LFFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=sGG3rAOIUtBwifyFrh+uay3mLGw7gglSc8A6kESWHzo=;
 b=erNjP4faR/fcRK3vjm+AQMhYOC35+Ht7hweKOB9tOFkNAxiWZr7UMjuJg/QxcfMdzz
 GSbvf8DjapAMw/0pBmXG3AWrcQHjw1s1qjVtung1/U43bWJAA61HSV9h8FjmNF76S8je
 n3kYVEy/uy2O/QBsnS7JtbW110EtM35QORKy4yt1eXh8qQv527qX7NS9Jn8AMFWkqiiI
 LlBVN6lz9llwd/IwnB/OaOUzVdZkXc3J1PP1U7/oagRLKl7scc0A8pokAs4YqCNVzNDO
 aQct3pwmFyl87i0kBfL5yJx280hBKrKxigb70OgcCcTDvUCYiUYvTc9HNpSVHqWHrEWq
 Y1UQ==
X-Gm-Message-State: AOAM532dhgb8Lan2mAst8iN6L+MT2QNXIQxs1MrJvqiBtpNV2X5i5LOB
 AnyrIIW/yA+V6LdN3jQZB04=
X-Google-Smtp-Source: ABdhPJyCaY3eWYqoZFQL6PxrM7qyrGmhHHSn5WRwoULcTXOeZIv7VoMCQDkgEAB6l0fPn5c2LWjHmQ==
X-Received: by 2002:a63:5361:: with SMTP id t33mr391974pgl.245.1599019370290; 
 Tue, 01 Sep 2020 21:02:50 -0700 (PDT)
Received: from localhost.localdomain ([49.207.196.170])
 by smtp.gmail.com with ESMTPSA id q71sm3058350pjq.7.2020.09.01.21.02.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Sep 2020 21:02:49 -0700 (PDT)
From: Allen Pais <allen.lkml@gmail.com>
To: perex@perex.cz,
	tiwai@suse.com,
	broonie@kernel.org
Subject: [PATCH v2 05/10] ALSA: hdsp: convert tasklets to use new
 tasklet_setup() API
Date: Wed,  2 Sep 2020 09:32:16 +0530
Message-Id: <20200902040221.354941-6-allen.lkml@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200902040221.354941-1-allen.lkml@gmail.com>
References: <20200902040221.354941-1-allen.lkml@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, timur@kernel.org, Xiubo.Lee@gmail.com,
 clemens@ladisch.de, Allen Pais <allen.lkml@gmail.com>, nicoleotsuka@gmail.com,
 Romain Perier <romain.perier@gmail.com>
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

In preparation for unconditionally passing the
struct tasklet_struct pointer to all tasklet
callbacks, switch to using the new tasklet_setup()
and from_tasklet() to pass the tasklet pointer explicitly.

Signed-off-by: Romain Perier <romain.perier@gmail.com>
Signed-off-by: Allen Pais <allen.lkml@gmail.com>
---
 sound/pci/rme9652/hdsp.c  | 6 +++---
 sound/pci/rme9652/hdspm.c | 7 +++----
 2 files changed, 6 insertions(+), 7 deletions(-)

diff --git a/sound/pci/rme9652/hdsp.c b/sound/pci/rme9652/hdsp.c
index 227aece17e39..dda56ecfd33b 100644
--- a/sound/pci/rme9652/hdsp.c
+++ b/sound/pci/rme9652/hdsp.c
@@ -3791,9 +3791,9 @@ static int snd_hdsp_set_defaults(struct hdsp *hdsp)
 	return 0;
 }
 
-static void hdsp_midi_tasklet(unsigned long arg)
+static void hdsp_midi_tasklet(struct tasklet_struct *t)
 {
-	struct hdsp *hdsp = (struct hdsp *)arg;
+	struct hdsp *hdsp = from_tasklet(hdsp, t, midi_tasklet);
 
 	if (hdsp->midi[0].pending)
 		snd_hdsp_midi_input_read (&hdsp->midi[0]);
@@ -5182,7 +5182,7 @@ static int snd_hdsp_create(struct snd_card *card,
 
 	spin_lock_init(&hdsp->lock);
 
-	tasklet_init(&hdsp->midi_tasklet, hdsp_midi_tasklet, (unsigned long)hdsp);
+	tasklet_setup(&hdsp->midi_tasklet, hdsp_midi_tasklet);
 
 	pci_read_config_word(hdsp->pci, PCI_CLASS_REVISION, &hdsp->firmware_rev);
 	hdsp->firmware_rev &= 0xff;
diff --git a/sound/pci/rme9652/hdspm.c b/sound/pci/rme9652/hdspm.c
index 0fa49f4d15cf..572350aaf18d 100644
--- a/sound/pci/rme9652/hdspm.c
+++ b/sound/pci/rme9652/hdspm.c
@@ -2169,9 +2169,9 @@ static int snd_hdspm_create_midi(struct snd_card *card,
 }
 
 
-static void hdspm_midi_tasklet(unsigned long arg)
+static void hdspm_midi_tasklet(struct tasklet_struct *t)
 {
-	struct hdspm *hdspm = (struct hdspm *)arg;
+	struct hdspm *hdspm = from_tasklet(hdspm, t, midi_tasklet);
 	int i = 0;
 
 	while (i < hdspm->midiPorts) {
@@ -6836,8 +6836,7 @@ static int snd_hdspm_create(struct snd_card *card,
 
 	}
 
-	tasklet_init(&hdspm->midi_tasklet,
-			hdspm_midi_tasklet, (unsigned long) hdspm);
+	tasklet_setup(&hdspm->midi_tasklet, hdspm_midi_tasklet);
 
 
 	if (hdspm->io_type != MADIface) {
-- 
2.25.1

