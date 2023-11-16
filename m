Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 824A67EE59C
	for <lists+alsa-devel@lfdr.de>; Thu, 16 Nov 2023 17:59:26 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E1DCB86F;
	Thu, 16 Nov 2023 17:58:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E1DCB86F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1700153965;
	bh=NHkJarmeB71LLdtXtRJFlnynlRUZwhK3li3A7MBO+l8=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=kvry+ewlX32Rvei20ReWJCIoUohs3cmkQnp01L1cvd6EsaSUSB+orQjS3e6qFe0yV
	 0grpHaYA3EPG7eGvG4fMRlaawJXIKHq6YKAFjUgBEfRV23uUOJs75c6Fv/NFqzCyLy
	 21zUMPTHXZk+Tvxo0JsF0rv62ZLCYXCoGs3uV9fY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2CE24F8055B; Thu, 16 Nov 2023 17:57:46 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9EBE4F8055A;
	Thu, 16 Nov 2023 17:57:45 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BA442F801D5; Thu, 16 Nov 2023 14:29:29 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 61BFEF80166
	for <alsa-devel@alsa-project.org>; Thu, 16 Nov 2023 14:29:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 61BFEF80166
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=Fc1v3txi
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-9e2838bcb5eso120380966b.0
        for <alsa-devel@alsa-project.org>;
 Thu, 16 Nov 2023 05:29:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700141358; x=1700746158;
 darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=phasBQ66hQbV8v95EjxNAAfUnHVV0YTsbzlRXy0LVJ8=;
        b=Fc1v3txihWKncukNwgs39P5ZD+1R621FGhVPFAmppQjxmssKoHnSDJfxCBKcchr6Ry
         2gloXxJpc25DaSFbEvYMxL18yg9zj1bt5gWE2CBxZ095t/SXz4krr9RyaE2qe/0P3HKk
         DL5NhBpXPf+pUyPQ9/SzY470Kd7w5B9xr8mSN4OYlx88TBFUeq2Owl7SKXHs+QDy7L/0
         USactnXL/uRqX+FbdqXLt4BP+ZMM4R47aWD5FpY1hTggZzXYMHGu+d4fziQJV55DSIeO
         OVMgLuvGCVcijfERQXI5zqp436EXC02Vi8DbK6ZkMlb0sbkTrsi0OPW0PscbpILNONZr
         KVaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700141358; x=1700746158;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=phasBQ66hQbV8v95EjxNAAfUnHVV0YTsbzlRXy0LVJ8=;
        b=ON4j4/t+IjdDn/CpRZfQi2sfdGO0AB7EBJH6csnbbUEJSFsCemanrhroGGEdYHpIpH
         qOfNqxSnjNx693FNpakKbGlgzdZbC8+FWdrEknHLnQ7frrzjzU+X7pbByfr4yGFW6ze5
         +sphUteWFBxqsbYadguNF6PSny0RHljr8zvwSWGKqUV2eyRK9wXbjJF3Y+S2NWMP/PRQ
         5nijYP9mIzLmhflv54MxadxgGL0QMVgraFGW96732B4Iqx3qCb5g9R0GR5j4fQSoLEwc
         sGhBDGVqEc6mi6hryn5wS/yN4t798+GPeliazXgcx4iZaFq2pjxIaiUyvwGjOKfBo8rI
         /izw==
X-Gm-Message-State: AOJu0YzD/L4HV+vBdPYOokytaPoPHIfZZGkVMaaPl60+mE/gINu0YHcV
	f9ulrgDJFIk1fZe87/fB73E=
X-Google-Smtp-Source: 
 AGHT+IETQAqTtflawuPNOpNHdANLA92iBYVUDChkLW4axQQ8AlPTGr7K5HhSq87VLm7W3qwBnxwgPg==
X-Received: by 2002:a17:906:ae91:b0:9a2:28dc:4166 with SMTP id
 md17-20020a170906ae9100b009a228dc4166mr12113941ejb.75.1700141358357;
        Thu, 16 Nov 2023 05:29:18 -0800 (PST)
Received: from IFM10N30752.intra.ifm (87-206-74-243.dynamic.chello.pl.
 [87.206.74.243])
        by smtp.gmail.com with ESMTPSA id
 cw16-20020a170906c79000b00992e94bcfabsm8374529ejb.167.2023.11.16.05.29.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Nov 2023 05:29:18 -0800 (PST)
From: Kamil Duljas <kamil.duljas@gmail.com>
To: Mark Brown <broonie@kernel.org>
Cc: Takashi Iwai <tiwai@suse.de>,
	alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	Jaroslav Kysela <perex@perex.cz>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	=?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>,
	Kamil Duljas <kamil.duljas@gmail.com>
Subject: [PATCH] ASoC: SOF: topology: Fix mem leak in sof_dai_load()
Date: Thu, 16 Nov 2023 14:28:49 +0100
Message-Id: <20231116132849.1534-1-kamil.duljas@gmail.com>
X-Mailer: git-send-email 2.35.2.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MailFrom: kamil.duljas@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: K7MZWVQ6IW7PILEDJOA7PO5IGKM22BXT
X-Message-ID-Hash: K7MZWVQ6IW7PILEDJOA7PO5IGKM22BXT
X-Mailman-Approved-At: Thu, 16 Nov 2023 16:57:41 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/K7MZWVQ6IW7PILEDJOA7PO5IGKM22BXT/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The function has multiple return points at which it is not released
previously allocated memory.

Signed-off-by: Kamil Duljas <kamil.duljas@gmail.com>
---
 sound/soc/sof/topology.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/sound/soc/sof/topology.c b/sound/soc/sof/topology.c
index a3a3af252259..ef8f8991f025 100644
--- a/sound/soc/sof/topology.c
+++ b/sound/soc/sof/topology.c
@@ -1736,8 +1736,10 @@ static int sof_dai_load(struct snd_soc_component *scomp, int index,
 	/* perform pcm set op */
 	if (ipc_pcm_ops && ipc_pcm_ops->pcm_setup) {
 		ret = ipc_pcm_ops->pcm_setup(sdev, spcm);
-		if (ret < 0)
+		if (ret < 0) {
+			kfree(spcm);
 			return ret;
+		}
 	}
 
 	dai_drv->dobj.private = spcm;
@@ -1747,6 +1749,7 @@ static int sof_dai_load(struct snd_soc_component *scomp, int index,
 			       ARRAY_SIZE(stream_tokens), private->array,
 			       le32_to_cpu(private->size));
 	if (ret) {
+		kfree(dai_drv->dobj.private);
 		dev_err(scomp->dev, "error: parse stream tokens failed %d\n",
 			le32_to_cpu(private->size));
 		return ret;
@@ -1764,9 +1767,9 @@ static int sof_dai_load(struct snd_soc_component *scomp, int index,
 	ret = snd_dma_alloc_pages(SNDRV_DMA_TYPE_DEV, sdev->dev,
 				  PAGE_SIZE, &spcm->stream[stream].page_table);
 	if (ret < 0) {
+		kfree(dai_drv->dobj.private);
 		dev_err(scomp->dev, "error: can't alloc page table for %s %d\n",
 			caps->name, ret);
-
 		return ret;
 	}
 
@@ -1782,9 +1785,10 @@ static int sof_dai_load(struct snd_soc_component *scomp, int index,
 	stream = SNDRV_PCM_STREAM_CAPTURE;
 
 	/* do we need to allocate capture PCM DMA pages */
-	if (!spcm->pcm.capture)
+	if (!spcm->pcm.capture) {
+		kfree(dai_drv->dobj.private);
 		return ret;
-
+	}
 	caps = &spcm->pcm.caps[stream];
 
 	/* allocate capture page table buffer */
@@ -1810,7 +1814,7 @@ static int sof_dai_load(struct snd_soc_component *scomp, int index,
 free_playback_tables:
 	if (spcm->pcm.playback)
 		snd_dma_free_pages(&spcm->stream[SNDRV_PCM_STREAM_PLAYBACK].page_table);
-
+	kfree(dai_drv->dobj.private);
 	return ret;
 }
 
-- 
2.35.2.windows.1

