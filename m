Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 486EE24632C
	for <lists+alsa-devel@lfdr.de>; Mon, 17 Aug 2020 11:22:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 02E17169A;
	Mon, 17 Aug 2020 11:21:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 02E17169A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1597656144;
	bh=La+Nn02jbOZQLGokp98p76QRlTP3kHuIDeBbyvDVpMA=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=laB0AfEMj2oHj9H7pbGqeLht9/Bohri8+KDknuGa/js/zjY38jVwXkgG5l2G6j8CB
	 r/5zH9/H+dxrbvqE3vAWjdPJjkMe1Oi1+auTF6GDHH+WciNyc4zQTSaFOYClCXGduK
	 9y5e5SU28k1RLvf4GI8hSBJdvSw2ea0jAobKr9jU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C2215F802EB;
	Mon, 17 Aug 2020 11:17:29 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1392FF80218; Mon, 17 Aug 2020 10:57:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,RCVD_IN_SORBS_WEB,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 664C3F800EF
 for <alsa-devel@alsa-project.org>; Mon, 17 Aug 2020 10:57:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 664C3F800EF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="tnVY62Mm"
Received: by mail-pf1-x442.google.com with SMTP id k18so7894889pfp.7
 for <alsa-devel@alsa-project.org>; Mon, 17 Aug 2020 01:57:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=UTSOhqNL5HstpQGSytQ69KLhEIvbIwMRL+50xoY/d1A=;
 b=tnVY62Mm3nYGST0oeSTRXyKqQJ1c+CoCCnUIazPPvCz2Zyx5i9VDNgtHhs66n21pZw
 P4WQK0kqDNCBQLWx79G6o67dpbwJPhWt+17dc0HsrLgkWerecLg4kU1AIkrwQFslBYBa
 lo6RK50/eqXjea5NQ6H/qmPJ5d/LhTJqcY5Wvpy4eRiJzPb6/1l1l/XqqBulYx6AA8Rn
 b4E5GwDvHlrlvoROyLH70MCyMvgwQ9Ma/CkCSLmwzyT1Lc4KAPigBb5KhVbbv3w22pje
 /GE4J6Iy8M24q00gdPEdDZwI0qp52uLP2AUdBjM2NmPmIQ7TYyAvbBumeE8H6Z/ojew0
 JD3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=UTSOhqNL5HstpQGSytQ69KLhEIvbIwMRL+50xoY/d1A=;
 b=PYHgXqO53GIqx+MBMf70GewpUVEAdesbsZgMGZRhT8xBnaYvQ94RFE5nG5I1Y3FJH5
 b8vrY8K6Zus/1Y3jTzPt/GJgpv3oh9TC4NcReMTK9aSc/jOzRmpxFNXCiTY+NZ/DyXy1
 S40A87HEcrwbbkmhze3mFEwAap9tAbVmw08dP9XkWzgccNkxrsTowbReOeqeby/mvM21
 fEzKCFnZJ81CiLiqMIoGU9PyN7Ueal0SW0gTwCiGdPgbjtDGmec83YSnR6pWyKwH7XLd
 wEVOgUeWcsPABnmVA2Y+SKfJGxFw2+JmdypJ5ClfPdz7OLttkve/TjyHBpdU5J/n+vtd
 YXWw==
X-Gm-Message-State: AOAM5308RQW7iE2H+BWL6bkW5hcuB1P0Z4Mm9XlmibUPZIfgSHpZ2tAl
 o21/RknUcTEvQY/WUO1XibE=
X-Google-Smtp-Source: ABdhPJyfL9kjLJ5laRAS5+b9JXqWdLH4UWSLPWaVE24ZUuM9BF3zE8Ke4dRt9cpQCFIksdK7gJHV4w==
X-Received: by 2002:a62:c582:: with SMTP id j124mr10929426pfg.21.1597654668407; 
 Mon, 17 Aug 2020 01:57:48 -0700 (PDT)
Received: from localhost.localdomain ([49.207.202.98])
 by smtp.gmail.com with ESMTPSA id j5sm19057245pfg.80.2020.08.17.01.57.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Aug 2020 01:57:47 -0700 (PDT)
From: Allen Pais <allen.cryptic@gmail.com>
To: perex@perex.cz, tiwai@suse.com, clemens@ladisch.de,
 o-takashi@sakamocchi.jp, timur@kernel.org, nicoleotsuka@gmail.com,
 Xiubo.Lee@gmail.com
Subject: [PATCH 05/10] sound: rm9652: convert tasklets to use new
 tasklet_setup() API
Date: Mon, 17 Aug 2020 14:26:58 +0530
Message-Id: <20200817085703.25732-6-allen.cryptic@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200817085703.25732-1-allen.cryptic@gmail.com>
References: <20200817085703.25732-1-allen.cryptic@gmail.com>
X-Mailman-Approved-At: Mon, 17 Aug 2020 11:17:21 +0200
Cc: alsa-devel@alsa-project.org, keescook@chromium.org,
 Allen Pais <allen.lkml@gmail.com>, linux-kernel@vger.kernel.org,
 Romain Perier <romain.perier@gmail.com>, linuxppc-dev@lists.ozlabs.org
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

From: Allen Pais <allen.lkml@gmail.com>

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
2.17.1

