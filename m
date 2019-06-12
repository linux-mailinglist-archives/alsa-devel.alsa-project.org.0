Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EAD242D69
	for <lists+alsa-devel@lfdr.de>; Wed, 12 Jun 2019 19:26:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 80E5217BE;
	Wed, 12 Jun 2019 19:25:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 80E5217BE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1560360385;
	bh=G3FVFNpNAAMz34LfpiRRRcQQdEGe+NRWKwuNvn30xaI=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HoSnz17Lr9LEN4H9LZBgapJSwiG9Mt6JcUAdb6ZMtGZl00ZACO0lLOg6MS3tCIvxx
	 22dX/6QcwoBFG3Pfog2pzkBc/s1L3wVx88ajAWhJXswNIo9ook+6xdhGyy6xYFdara
	 cFnQ8z/gUNv9/Q5XJRVTdN6vQIX1md+SmSgPdEN8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6A6C7F89738;
	Wed, 12 Jun 2019 19:24:06 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 71F43F896FA; Wed, 12 Jun 2019 19:23:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D18E2F896CE
 for <alsa-devel@alsa-project.org>; Wed, 12 Jun 2019 19:23:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D18E2F896CE
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 12 Jun 2019 10:23:52 -0700
X-ExtLoop1: 1
Received: from adorrell-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.251.133.122])
 by fmsmga008.fm.intel.com with ESMTP; 12 Jun 2019 10:23:51 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Wed, 12 Jun 2019 12:23:33 -0500
Message-Id: <20190612172347.22338-2-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190612172347.22338-1-pierre-louis.bossart@linux.intel.com>
References: <20190612172347.22338-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Cc: tiwai@suse.de, broonie@kernel.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [alsa-devel] [PATCH 01/15] ASoC: SOF: Intel: hda: save handle to
	sdev in sof_intel_hda_stream
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

From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>

Add a snd_sof_dev member to sof_intel_hda_stream. This will be
used to access the snd_sof_dev during link hw_params callback.

Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/intel/hda-stream.c | 4 ++++
 sound/soc/sof/intel/hda.h        | 1 +
 2 files changed, 5 insertions(+)

diff --git a/sound/soc/sof/intel/hda-stream.c b/sound/soc/sof/intel/hda-stream.c
index c92006f89499..1cd94e7631a8 100644
--- a/sound/soc/sof/intel/hda-stream.c
+++ b/sound/soc/sof/intel/hda-stream.c
@@ -564,6 +564,8 @@ int hda_dsp_stream_init(struct snd_sof_dev *sdev)
 		if (!hda_stream)
 			return -ENOMEM;
 
+		hda_stream->sdev = sdev;
+
 		stream = &hda_stream->hda_stream;
 
 		stream->pphc_addr = sdev->bar[HDA_DSP_PP_BAR] +
@@ -617,6 +619,8 @@ int hda_dsp_stream_init(struct snd_sof_dev *sdev)
 		if (!hda_stream)
 			return -ENOMEM;
 
+		hda_stream->sdev = sdev;
+
 		stream = &hda_stream->hda_stream;
 
 		/* we always have DSP support */
diff --git a/sound/soc/sof/intel/hda.h b/sound/soc/sof/intel/hda.h
index 6c7dee2627d0..502b0a3c2e3c 100644
--- a/sound/soc/sof/intel/hda.h
+++ b/sound/soc/sof/intel/hda.h
@@ -409,6 +409,7 @@ static inline struct hda_bus *sof_to_hbus(struct snd_sof_dev *s)
 }
 
 struct sof_intel_hda_stream {
+	struct snd_sof_dev *sdev;
 	struct hdac_ext_stream hda_stream;
 	struct sof_intel_stream stream;
 	int hw_params_upon_resume; /* set up hw_params upon resume */
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
