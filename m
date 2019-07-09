Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 55B4762F23
	for <lists+alsa-devel@lfdr.de>; Tue,  9 Jul 2019 06:04:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D7C6A1666;
	Tue,  9 Jul 2019 06:03:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D7C6A1666
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1562645046;
	bh=+/6lbnSziPWUgd92NrBJCy9EYVg2FTln8eRrW+rQlJM=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=F7/lsoHNRabHPoxJ2U4CGEKGdXUNitJ/pqLzaJOR/WjWdWZcyJ68G4BozSPho8rCe
	 ZafUW89UxNg+hs1ZOFaSLiVKb0R8p4Sw4JwisGf+J7j367LsQWxg+wefAKobINwgfh
	 MSu+/ztJbIXey2x4ptRBaXA7tcOwygVwqy9Nlp38=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 26603F80275;
	Tue,  9 Jul 2019 06:02:22 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 57E6EF80274; Tue,  9 Jul 2019 06:02:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID, DKIM_VALID_AU, PDS_NO_HELO_DNS, SPF_HELO_NONE, SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 51C57F801A4
 for <alsa-devel@alsa-project.org>; Tue,  9 Jul 2019 06:02:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 51C57F801A4
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="Q9qEe6nl"
Received: by mail-pl1-x644.google.com with SMTP id k8so9374126plt.3
 for <alsa-devel@alsa-project.org>; Mon, 08 Jul 2019 21:02:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=eRS78OWHqkPassIhCrQBp7dftHSLHAwV/FZqf0gRdDE=;
 b=Q9qEe6nlNveqMLgdp9dy7hMTu8Qj4wowQPPPFvIveM8eDDunlIwyhQK1cwwGoBKh0I
 xVXUKnt7PSm9xaepMoQCga54ppDTviuo247P6zwRS8Hz2M5txQrsH/K/XP+f2uvU/PNa
 /qDkBdtmuKwQRG/duwbvCriisvI01pbz0j0tQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=eRS78OWHqkPassIhCrQBp7dftHSLHAwV/FZqf0gRdDE=;
 b=I3wRhUgHj9UNBAjKp1+Gug8I6wVguhuSme7W4tszp0udhlirGrAaYVoZdcL5j8QqHQ
 0UG6R/e7AI/3etzWV2CLwxdN73zRUiw9cTv+1baB2al6LB1WvGtmEi8m9LZHl8QFWhuo
 hcdjHHfCrGP4Nt4pP6gx/roY6EwMqFuu/zQKOjQrpc5hngSh50kgQc3dgczsBYDyRHGm
 AaMwxR70Gbx2ScyGAFnBnKYLZz5n27YWABqKhJIK403sUMDUyInEQH+ZplBuNfX2qvdi
 Xn97x+qrAkhNuh9gHndHtPl+IOeG2PuRgVgj8auD2PGWQTUQRQi8Qbcpp58zOUC2pgBD
 Tk0w==
X-Gm-Message-State: APjAAAXI7bIXlDrq1HRk9c8ddU8rkQMJ2QkjtDDJnqavqBfWn/4BGWvw
 14DxFgQBpOJvzRCl1n9Hl+9MBaQpC0Q=
X-Google-Smtp-Source: APXvYqw1POX5vUNQfCeCAYBFdnr8Hff0wsdebHhnjXjJxe04kvt3a7FE1kpZ1AlgHQbJC8nJcqu/3w==
X-Received: by 2002:a17:902:2884:: with SMTP id
 f4mr28745735plb.286.1562644933885; 
 Mon, 08 Jul 2019 21:02:13 -0700 (PDT)
Received: from localhost ([2620:15c:202:201:82b8:d8c4:6cb6:57f5])
 by smtp.gmail.com with ESMTPSA id k5sm861841pjl.32.2019.07.08.21.02.11
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 08 Jul 2019 21:02:12 -0700 (PDT)
From: Alex Levin <levinale@chromium.org>
To: alsa-devel@alsa-project.org
Date: Mon,  8 Jul 2019 21:01:47 -0700
Message-Id: <20190709040147.111927-1-levinale@chromium.org>
X-Mailer: git-send-email 2.22.0.410.gd8fdbe21b5-goog
MIME-Version: 1.0
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 linux-kernel@vger.kernel.org, Jie Yang <yang.jie@linux.intel.com>,
 Takashi Iwai <tiwai@suse.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>, benzh@chromium.org,
 Mark Brown <broonie@kernel.org>, cujomalainey@chromium.org,
 Alex Levin <levinale@chromium.org>
Subject: [alsa-devel] [PATCH] ASoC: Intel: Atom: read timestamp moved to
	period_elapsed
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

sst_platform_pcm_pointer is called from both snd_pcm_period_elapsed and
from snd_pcm_ioctl. Calling read timestamp results in recalculating
pcm_delay and buffer_ptr (sst_calc_tstamp) which consumes buffers in a
faster rate than intended.
In a tested BSW system with chtrt5650, for a rate of 48000, the
measured rate was sometimes 10 times more than that.
After moving the timestamp read to period elapsed, buffer consumption is
as expected.

Signed-off-by: Alex Levin <levinale@chromium.org>
---
 sound/soc/intel/atom/sst-mfld-platform-pcm.c | 23 +++++++++++++-------
 1 file changed, 15 insertions(+), 8 deletions(-)

diff --git a/sound/soc/intel/atom/sst-mfld-platform-pcm.c b/sound/soc/intel/atom/sst-mfld-platform-pcm.c
index 0e8b1c5eec88..196af0b30b41 100644
--- a/sound/soc/intel/atom/sst-mfld-platform-pcm.c
+++ b/sound/soc/intel/atom/sst-mfld-platform-pcm.c
@@ -265,16 +265,28 @@ static void sst_period_elapsed(void *arg)
 {
 	struct snd_pcm_substream *substream = arg;
 	struct sst_runtime_stream *stream;
-	int status;
+	struct snd_soc_pcm_runtime *rtd;
+	int status, ret_val;
 
 	if (!substream || !substream->runtime)
 		return;
 	stream = substream->runtime->private_data;
 	if (!stream)
 		return;
+
+	rtd = substream->private_data;
+	if (!rtd)
+		return;
+
 	status = sst_get_stream_status(stream);
 	if (status != SST_PLATFORM_RUNNING)
 		return;
+
+	ret_val = stream->ops->stream_read_tstamp(sst->dev, &stream->stream_info);
+	if (ret_val) {
+		dev_err(rtd->dev, "stream_read_tstamp err code = %d\n", ret_val);
+		return;
+	}
 	snd_pcm_period_elapsed(substream);
 }
 
@@ -658,20 +670,15 @@ static snd_pcm_uframes_t sst_platform_pcm_pointer
 			(struct snd_pcm_substream *substream)
 {
 	struct sst_runtime_stream *stream;
-	int ret_val, status;
+	int status;
 	struct pcm_stream_info *str_info;
-	struct snd_soc_pcm_runtime *rtd = substream->private_data;
 
 	stream = substream->runtime->private_data;
 	status = sst_get_stream_status(stream);
 	if (status == SST_PLATFORM_INIT)
 		return 0;
+
 	str_info = &stream->stream_info;
-	ret_val = stream->ops->stream_read_tstamp(sst->dev, str_info);
-	if (ret_val) {
-		dev_err(rtd->dev, "sst: error code = %d\n", ret_val);
-		return ret_val;
-	}
 	substream->runtime->delay = str_info->pcm_delay;
 	return str_info->buffer_ptr;
 }
-- 
2.22.0.410.gd8fdbe21b5-goog

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
