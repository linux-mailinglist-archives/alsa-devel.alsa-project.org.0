Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 451D86C82F1
	for <lists+alsa-devel@lfdr.de>; Fri, 24 Mar 2023 18:10:33 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8BD1DE8F;
	Fri, 24 Mar 2023 18:09:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8BD1DE8F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1679677832;
	bh=+u+a7N16H7bcue6Y7HFd49XNMnpQsi2wyCf6IgUkH5A=;
	h=From:To:Subject:Date:CC:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=XQs20yNJ0nT+xlAhD/+OxgFykyZqMiC/gDThw8gkBhIiaHnrR08aVN43l5KndguSj
	 cboURod7uQXoAAnRauo6FOQfl6JZ2oe3d8TZiBnShz4zE8SFeq6rxlv5A8Fii7aoYk
	 0K0VTGkyQOUdgrEburp9TrgBLFNVVo3jDnQiEkws=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 45258F8027B;
	Fri, 24 Mar 2023 18:09:42 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 681E4F8027B; Fri, 24 Mar 2023 18:09:38 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id CBAF4F80093
	for <alsa-devel@alsa-project.org>; Fri, 24 Mar 2023 18:09:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CBAF4F80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=Ogf6aLdc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1679677770;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=JLRKnXRPip+ks27gdmBMUhtEnFO7L9UtH6SSkGcCZo0=;
	b=Ogf6aLdcPryHSL5lluKXHRR5F94BPJXOdFsxI48Ydq9t/iK8fTTfWhAidgzu9EPOqwQU7Q
	RLmr0sNpGj/qJH7hh2sNBrk1oVtxBpWUsg4wqK4Kgglh1Epq42pceSJkmfEp7TYreInR9f
	uEKa0Gf33ZkVpf1y46udTijdfZmpiYg=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-608-nNyU2mvONsWYuUBx53Gj4w-1; Fri, 24 Mar 2023 13:09:29 -0400
X-MC-Unique: nNyU2mvONsWYuUBx53Gj4w-1
Received: by mail-qt1-f199.google.com with SMTP id
 c11-20020ac85a8b000000b003bfdd43ac76so1401121qtc.5
        for <alsa-devel@alsa-project.org>;
 Fri, 24 Mar 2023 10:09:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679677768;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JLRKnXRPip+ks27gdmBMUhtEnFO7L9UtH6SSkGcCZo0=;
        b=qe/YQajPVXzcnUPtD8jdpe6LkyYlUrNgoCO+BAgsbckzFvRIZ1S81pQ9jFHHNOHHo8
         LtVHQdwW/NrPQnUOtwM+mY5esAq6kPfM3IIGFsre72XjtiSCtSBmGEFWnV0Z/v01DJTq
         9WjyWGnbphJB3Ou3RNnSjmRbS98KPofUarhew7hRjTMd3zIYbP3o+KIwaMKeNqmG1OBf
         sbccQuQyV/m1hHsF1/Q7yLViy/tcLG5w5U/tOSWpjhGiYHx9vfMFidZdKs9YKayVulDZ
         maBeLV/pKdu8ny2WRepM0b/S8EzR+cndkN1VyX/mBNZ1FfsnU67JK0GF11KHlinG9YzA
         VufA==
X-Gm-Message-State: AAQBX9cGCiOUANvuv4hky88ka/ong1Q4L/+/TAre8ZwPWI+xw7h9rN/g
	77eXEIduFsfsUGTA/Dxb9Ev6d0KrQqY7JYCZdV9pKfgAp43jb1728aNfp55YOIFNcCUEDox0BlQ
	bYappZG7Cmyglri7PZW9QyIE/yIQmiRZ9JeZBJEv4tTSytGoMMG7UmLPyj2WC52Fln+OCBz4c5V
	/AIk8gPEk=
X-Received: by 2002:a05:622a:352:b0:3e4:d90a:b12a with SMTP id
 r18-20020a05622a035200b003e4d90ab12amr1803641qtw.17.1679677767928;
        Fri, 24 Mar 2023 10:09:27 -0700 (PDT)
X-Google-Smtp-Source: 
 AKy350apy3oW7a9FJs0e8hOcJ3R4VeI8/w3JZazN2ebmIBP53MZF2bGhguV/L5X6EHjjOcdVuhZaIQ==
X-Received: by 2002:a05:622a:352:b0:3e4:d90a:b12a with SMTP id
 r18-20020a05622a035200b003e4d90ab12amr1803594qtw.17.1679677767627;
        Fri, 24 Mar 2023 10:09:27 -0700 (PDT)
Received: from p1.montleon.net (066-026-073-226.inf.spectrum.com.
 [66.26.73.226])
        by smtp.gmail.com with ESMTPSA id
 de21-20020a05620a371500b007422fd3009esm14460324qkb.20.2023.03.24.10.09.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Mar 2023 10:09:27 -0700 (PDT)
From: Jason Montleon <jmontleo@redhat.com>
To: alsa-devel@alsa-project.org,
	regressions@lists.linux.dev,
	yung-chuan.liao@linux.intel.com,
	broonie@kernel.org,
	tiwai@suse.com,
	bagasdotme@gmail.com,
	pierre-louis.bossart@linux.intel.com
Subject: [PATCH] ASoC: hdac_hdmi: use set_stream() instead of set_tdm_slots()
Date: Fri, 24 Mar 2023 13:07:11 -0400
Message-Id: <20230324170711.2526-1-jmontleo@redhat.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
Message-ID-Hash: 775LLUGGZOSDSXKA5J7IKOUSLSWUZDJ5
X-Message-ID-Hash: 775LLUGGZOSDSXKA5J7IKOUSLSWUZDJ5
X-MailFrom: jmontleo@redhat.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Jason Montleon <jmontleo@redhat.com>, stable@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/775LLUGGZOSDSXKA5J7IKOUSLSWUZDJ5/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

hdac_hdmi was not updated to use set_stream() instead of set_tdm_slots()
in the original commit so HDMI no longer produces audio.

Cc: stable@vger.kernel.org
Link: https://lore.kernel.org/regressions/CAJD_bPKQdtaExvVEKxhQ47G-ZXDA=k+gzhMJRHLBe=mysPnuKA@mail.gmail.com/
Fixes: 636110411ca7 ("ASoC: Intel/SOF: use set_stream() instead of set_tdm_slots() for HDAudio")
Signed-off-by: Jason Montleon <jmontleo@redhat.com>
---
 sound/soc/codecs/hdac_hdmi.c | 17 +++++++++++------
 1 file changed, 11 insertions(+), 6 deletions(-)

diff --git a/sound/soc/codecs/hdac_hdmi.c b/sound/soc/codecs/hdac_hdmi.c
index ed4f7cdda04f..8b6b76029694 100644
--- a/sound/soc/codecs/hdac_hdmi.c
+++ b/sound/soc/codecs/hdac_hdmi.c
@@ -436,23 +436,28 @@ static int hdac_hdmi_setup_audio_infoframe(struct hdac_device *hdev,
 	return 0;
 }
 
-static int hdac_hdmi_set_tdm_slot(struct snd_soc_dai *dai,
-		unsigned int tx_mask, unsigned int rx_mask,
-		int slots, int slot_width)
+static int hdac_hdmi_set_stream(struct snd_soc_dai *dai,
+				void *stream, int direction)
 {
 	struct hdac_hdmi_priv *hdmi = snd_soc_dai_get_drvdata(dai);
 	struct hdac_device *hdev = hdmi->hdev;
 	struct hdac_hdmi_dai_port_map *dai_map;
 	struct hdac_hdmi_pcm *pcm;
+	struct hdac_stream *hstream;
 
-	dev_dbg(&hdev->dev, "%s: strm_tag: %d\n", __func__, tx_mask);
+	if (!stream)
+		return -EINVAL;
+
+	hstream = (struct hdac_stream *)stream;
+
+	dev_dbg(&hdev->dev, "%s: strm_tag: %d\n", __func__, hstream->stream_tag);
 
 	dai_map = &hdmi->dai_map[dai->id];
 
 	pcm = hdac_hdmi_get_pcm_from_cvt(hdmi, dai_map->cvt);
 
 	if (pcm)
-		pcm->stream_tag = (tx_mask << 4);
+		pcm->stream_tag = (hstream->stream_tag << 4);
 
 	return 0;
 }
@@ -1544,7 +1549,7 @@ static const struct snd_soc_dai_ops hdmi_dai_ops = {
 	.startup = hdac_hdmi_pcm_open,
 	.shutdown = hdac_hdmi_pcm_close,
 	.hw_params = hdac_hdmi_set_hw_params,
-	.set_tdm_slot = hdac_hdmi_set_tdm_slot,
+	.set_stream = hdac_hdmi_set_stream,
 };
 
 /*
-- 
2.40.0

