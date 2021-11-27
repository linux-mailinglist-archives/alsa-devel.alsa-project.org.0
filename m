Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BDA045FD93
	for <lists+alsa-devel@lfdr.de>; Sat, 27 Nov 2021 10:22:36 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0C5391714;
	Sat, 27 Nov 2021 10:21:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0C5391714
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1638004956;
	bh=GAuxfKWzQ8w4e/sEv0+DQGGZvg4Ir0ZzrTyI01zMRfU=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=eKmNPDzXkhwn4ULLynWAPiwB17eWk7+Oa4fpVH4W6Ee5FDNT2oHZXwLwS18t+/1Tk
	 vdDpqbjZR8rRGk8ei5flVLPPGnTxalmMdb2UcFwUx281SjfCg79/x90+L1vWW8t1S1
	 LO0VB/GmYhs38rGkQ2OZmlK5l6DvRtBSpR6HTQdQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 615C9F80132;
	Sat, 27 Nov 2021 10:21:18 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A392BF8049E; Sat, 27 Nov 2021 10:21:15 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE autolearn=disabled version=3.4.0
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8878BF80132
 for <alsa-devel@alsa-project.org>; Sat, 27 Nov 2021 10:20:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8878BF80132
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="d9ijPY1V"
Received: by mail-lf1-x12e.google.com with SMTP id f18so30135575lfv.6
 for <alsa-devel@alsa-project.org>; Sat, 27 Nov 2021 01:20:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9CVjzfYPDceDBXmW9CFOxQhvY2AD/vo1bVX7QojZu30=;
 b=d9ijPY1Vc7Y5ROoNnm4XMRAgMwJ4EKvCQceea7CUeIN0h7egU0pGRRJgGa4v11YvPs
 Gnr7or+QKknle615+BATi1e1lF/FtP3dcRm8B2wr9l/nBld6hTl2/7zTUzHtS0s2Pba1
 d/fIHGvvTc7nbzK6u3wAx0yS9RhP35bquHtiW1jLZPCiMQ71XeTjsweEn/Ojl6kE7Ctb
 gWyeN4Mn/1ASc2qpayqZDRA/Us+7cvQJ5ioVnAsEUMj6YVTr4l7COBvM9Tb78WvcA9hZ
 aReXq5jsS7ary1yHrOZQsrTqEABiTWl794YAkLU5Blx84t6X0l5q2DnSZQhIM1l2x7+Z
 byig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9CVjzfYPDceDBXmW9CFOxQhvY2AD/vo1bVX7QojZu30=;
 b=6xBC/6ITkrQ8zJC/4EpzNvcxtO1uDLKS4r6LQv9qX5MO9V/GZi0lquOmdSRvU+yfRk
 KQ9NMht98TPiIawRVaroHzrfAB9rwtc6uehamGKmDAK7kK1+UYxZOonRDffzdywX7ezx
 jwogJjpd9ahPxxSfY1DPM3wS3/Y7/VnpSv9dzYDZIam80nJov1Y1nYLCoTmXYCKDf2NJ
 DJXDorVsrTGuDk2rPdKBR7WS8IISC78LbnaUSDFvxw1A8pHg6v3e8IF5F9zgurE2Bwwu
 V+scAppYB9RiZj/yxNDNh5ZQdaaWzoije8KQJCzaxMm0v4UQ5A5JzBI3ZYUUTcRC+vwG
 Qg2A==
X-Gm-Message-State: AOAM533xJU4vlm8E0+dayCL8Pz3A3+YWBSg6qcOvbrhR91U2lVIL0hr5
 +s+5KF9swTzrx0bPWGERhro=
X-Google-Smtp-Source: ABdhPJxYeR3a8otPywQ9MUA/07Tz4Y5IjKsyDu01fisdQG64wt1KKDIiDBQd/KXjf+BlQjb1Q581dw==
X-Received: by 2002:a05:6512:519:: with SMTP id
 o25mr33652054lfb.422.1638004801650; 
 Sat, 27 Nov 2021 01:20:01 -0800 (PST)
Received: from localhost.localdomain (h-155-4-221-129.NA.cust.bahnhof.se.
 [155.4.221.129])
 by smtp.gmail.com with ESMTPSA id v7sm743066ljd.31.2021.11.27.01.20.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 27 Nov 2021 01:20:00 -0800 (PST)
From: Rikard Falkeborn <rikard.falkeborn@gmail.com>
To: Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>
Subject: [PATCH] ASoC: intel: boards: bytcht*: Constify static snd_soc_ops
Date: Sat, 27 Nov 2021 10:19:54 +0100
Message-Id: <20211127091954.12075-1-rikard.falkeborn@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, linux-kernel@vger.kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Rikard Falkeborn <rikard.falkeborn@gmail.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>, alsa-devel@alsa-project.org,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
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

These are only assigned to the ops fields in the snd_soc_dai_link struct
which is a pointer to const struct snd_soc_ops. Make them const to allow
the compiler to put them in read-only memory.

Signed-off-by: Rikard Falkeborn <rikard.falkeborn@gmail.com>
---
 sound/soc/intel/boards/bytcht_cx2072x.c | 2 +-
 sound/soc/intel/boards/bytcht_nocodec.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/intel/boards/bytcht_cx2072x.c b/sound/soc/intel/boards/bytcht_cx2072x.c
index 0a736308052a..ffd497a5b5a5 100644
--- a/sound/soc/intel/boards/bytcht_cx2072x.c
+++ b/sound/soc/intel/boards/bytcht_cx2072x.c
@@ -147,7 +147,7 @@ static int byt_cht_cx2072x_aif1_startup(struct snd_pcm_substream *substream)
 					    SNDRV_PCM_HW_PARAM_RATE, 48000);
 }
 
-static struct snd_soc_ops byt_cht_cx2072x_aif1_ops = {
+static const struct snd_soc_ops byt_cht_cx2072x_aif1_ops = {
 	.startup = byt_cht_cx2072x_aif1_startup,
 };
 
diff --git a/sound/soc/intel/boards/bytcht_nocodec.c b/sound/soc/intel/boards/bytcht_nocodec.c
index 67b3c4e97864..115c2bcaabd4 100644
--- a/sound/soc/intel/boards/bytcht_nocodec.c
+++ b/sound/soc/intel/boards/bytcht_nocodec.c
@@ -93,7 +93,7 @@ static int aif1_startup(struct snd_pcm_substream *substream)
 			&constraints_48000);
 }
 
-static struct snd_soc_ops aif1_ops = {
+static const struct snd_soc_ops aif1_ops = {
 	.startup = aif1_startup,
 };
 
-- 
2.34.1

