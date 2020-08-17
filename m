Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 52C85246327
	for <lists+alsa-devel@lfdr.de>; Mon, 17 Aug 2020 11:21:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EB0F216AE;
	Mon, 17 Aug 2020 11:20:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EB0F216AE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1597656101;
	bh=C16vL6hnbgvsiiC9zdfwMACi838YTcg8QH4b15TBWAw=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hO194CJXgz0mcp/n1EghCisY+kMCHJyQmxQEz/0B4GNSRkLV6q/BBd7GSITK57nab
	 88Ma8zo/ar5YPkCTnT7bHAZYQgUtLGGa97CCxHsza+Ka1gKhMrLovA9BW3FHCmiUS2
	 gsT/1tmzuwtYt8ivVnZvVsCKdtgWJSo/twTLUeCc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F3A15F802E7;
	Mon, 17 Aug 2020 11:17:28 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A4DB5F80218; Mon, 17 Aug 2020 10:57:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,RCVD_IN_SORBS_WEB,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 43117F80255
 for <alsa-devel@alsa-project.org>; Mon, 17 Aug 2020 10:57:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 43117F80255
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="QAqvBoa/"
Received: by mail-pg1-x542.google.com with SMTP id i10so2262482pgk.1
 for <alsa-devel@alsa-project.org>; Mon, 17 Aug 2020 01:57:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=5ir2EUoXSC9UiT6j30BKzwTi2avjOse2gHmZ0bVuRLw=;
 b=QAqvBoa/dd6F4tETAI6u/nDKz/8vA4EoePLKL2jn8cWNCqTVZrYl40CYqJxWTcf+eH
 ruK1J6R7QGdhsuqcJisS4p1gaDyPL/E5YLmfLh4tTdGhUmDWoUx+iH0koSkUGUQXliO7
 2JCpmXvCn5GzZPEKehV89mhI9YhIgsKxPYCzx0sEZdZFgiJvmspJz6zSMpHviaIGekwJ
 1z8BTY5fdbhG0uMJgtP8lqMAWPG/KEBRDetYK87jDM6OGa5X6bN2ruy4ecHjDY2vFviz
 XLsP4x+jKhVxq0vODvOPtstM1fIX6fFJxk0zucKQXdSgLhefDyQlIGj7mM8phP46n4ur
 aMqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=5ir2EUoXSC9UiT6j30BKzwTi2avjOse2gHmZ0bVuRLw=;
 b=h4e8d4ZBSUgurC7f9Pzpiqv/h0zXzNYH1Zk8paLAD5Ep39KPZUbXpH02SGAdHT2Q/7
 6c5DmoP8mr5KBQFnCcsE3RYFFPUOO/KftSJhKJzGnuOcKPaTFfUpJjIDb1yRbJt8kNYm
 Fi4/lULG8kGOXMQOxhr9zCJWQRrdqi0vH9bsSCBU5tXYq/1CjsLIL0xEHKNfPPDzDA5C
 neSIBVX4jqPt+/5WpNJae3kM9yxnjLOJHke66UxAZF5v6MiJGI4bH1qtA8Rfk42JoJuW
 nQmCRkvTFf4QmvYtH8GgFojVGiG2bQT4vbNLfPd0UKAF2jpS/bHCR4Ws7o5GfiKBAbaY
 uAVw==
X-Gm-Message-State: AOAM532R75xceuCwrNWgDBmE7lxrXdA7LZp1ijk0+g5GW76L0mqLZvK3
 Dxa7xQ6IcpAqxTVVVVkMxXs=
X-Google-Smtp-Source: ABdhPJzGb3DXb0HExdoQilfc10prLDt115mewJJXkDS4HvxKOzPFoSgMOQt2dPqyE+lXYYhpi5FbKw==
X-Received: by 2002:a63:6dc2:: with SMTP id i185mr9441882pgc.190.1597654654967; 
 Mon, 17 Aug 2020 01:57:34 -0700 (PDT)
Received: from localhost.localdomain ([49.207.202.98])
 by smtp.gmail.com with ESMTPSA id j5sm19057245pfg.80.2020.08.17.01.57.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Aug 2020 01:57:34 -0700 (PDT)
From: Allen Pais <allen.cryptic@gmail.com>
To: perex@perex.cz, tiwai@suse.com, clemens@ladisch.de,
 o-takashi@sakamocchi.jp, timur@kernel.org, nicoleotsuka@gmail.com,
 Xiubo.Lee@gmail.com
Subject: [PATCH 04/10] sound: riptide: convert tasklets to use new
 tasklet_setup() API
Date: Mon, 17 Aug 2020 14:26:57 +0530
Message-Id: <20200817085703.25732-5-allen.cryptic@gmail.com>
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
 sound/pci/riptide/riptide.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/pci/riptide/riptide.c b/sound/pci/riptide/riptide.c
index b4f300281822..098c69b3b7aa 100644
--- a/sound/pci/riptide/riptide.c
+++ b/sound/pci/riptide/riptide.c
@@ -1070,9 +1070,9 @@ getmixer(struct cmdif *cif, short num, unsigned short *rval,
 	return 0;
 }
 
-static void riptide_handleirq(unsigned long dev_id)
+static void riptide_handleirq(struct tasklet_struct *t)
 {
-	struct snd_riptide *chip = (void *)dev_id;
+	struct snd_riptide *chip = from_tasklet(chip, t, riptide_tq);
 	struct cmdif *cif = chip->cif;
 	struct snd_pcm_substream *substream[PLAYBACK_SUBSTREAMS + 1];
 	struct snd_pcm_runtime *runtime;
@@ -1843,7 +1843,7 @@ snd_riptide_create(struct snd_card *card, struct pci_dev *pci,
 	chip->received_irqs = 0;
 	chip->handled_irqs = 0;
 	chip->cif = NULL;
-	tasklet_init(&chip->riptide_tq, riptide_handleirq, (unsigned long)chip);
+	tasklet_setup(&chip->riptide_tq, riptide_handleirq);
 
 	if ((chip->res_port =
 	     request_region(chip->port, 64, "RIPTIDE")) == NULL) {
-- 
2.17.1

