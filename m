Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BFC8F619298
	for <lists+alsa-devel@lfdr.de>; Fri,  4 Nov 2022 09:18:34 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5758D1682;
	Fri,  4 Nov 2022 09:17:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5758D1682
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1667549914;
	bh=qqyted+XNQ/Zpjqtyu4zSaIVbHCEoMI/izC+8aNSC0E=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=uqU0V9TkyJgfxImplSM+J5mlqtbiDgtqPMublWSo8lNoky5FDIJIFjgUuMzbPftjV
	 OJtQP0TiifbLgeXAFNQPsI0tds2zzybmVz82pZF7TOckJiRJQse9k9cnI9Gp3gr1TE
	 oNl6MyaT3M9/iM+Qv86/FD8Y1HJJkZdPiPm9vG+c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3D352F80567;
	Fri,  4 Nov 2022 09:16:05 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7A6DAF8051E; Thu,  3 Nov 2022 14:26:03 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E5FA6F8051C
 for <alsa-devel@alsa-project.org>; Thu,  3 Nov 2022 14:26:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E5FA6F8051C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="IhT0pEta"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667481959;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=gPvea2fildMPjjeLpBpmnKqPPFqFIQbi64w+Mdeh/2k=;
 b=IhT0pEtaz8RYH8YKi3DA0qixPM8ZTipMNNMq3uJ0z+zmiOYOy3Bq+1n+uKQJApm0/9hbKB
 YtHaiWwVUru1pxqF8p2cfAm5h1lMzL/KkF4s9LyE37pDHHkTZJdQY2beNmrzr8U2YhW5FH
 UezU7L/jO9beXzayFuYEmOQHc1/iAn0=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-346-UgcOPnUROp--fCKL4djLyg-1; Thu, 03 Nov 2022 09:25:57 -0400
X-MC-Unique: UgcOPnUROp--fCKL4djLyg-1
Received: by mail-qt1-f199.google.com with SMTP id
 i4-20020ac813c4000000b003a5044a818cso1803169qtj.11
 for <alsa-devel@alsa-project.org>; Thu, 03 Nov 2022 06:25:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=gPvea2fildMPjjeLpBpmnKqPPFqFIQbi64w+Mdeh/2k=;
 b=WKlL82Y0HpU8vVpQ++Aoa+PbSAlnmykzHyU92qzJVr11hGAUGRkjuzCjIw7s8v40ou
 pS/eDaWm8ArcFTEa6EDCagqQQFpNYRZ9dTJMhRH1oeoqkOxfg+dRLqagQalVkLK4hys+
 KjwCwNeAJY1b0z+GAsjnhcU5f42fRkCYjmRhpuh9uAxMXOjAbpnwgSuZswclXlEL/4CG
 k/QjP7hPsmI5htf0LQ5SJSMNqDwQbl1V3UzLcpoTJaxxmHVHq/pB9INedby44sWV7oVm
 zLQSWA6fM8QHqG9bhGcCt2hDqKSL/0FDC6LxqRTElEmAd7Iw5SmqfzalFvyqK95DJfps
 JDjw==
X-Gm-Message-State: ACrzQf3XrlRFLq+Yd43LSZV9LytFRp/ZHN31NBNPOoTOUKpRZvQ2XgF2
 PWUqfWBhUYf6QdU2ErT4oslzN56qxhgL280P6aMKI8ADE/mm20su0AV2FTwpNTuXmJXofDWZYJX
 MDGuFL3mx5TN6+stHT/0JQ3A=
X-Received: by 2002:a05:620a:7ee:b0:6fa:5811:760e with SMTP id
 k14-20020a05620a07ee00b006fa5811760emr6896689qkk.363.1667481956774; 
 Thu, 03 Nov 2022 06:25:56 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6REhdMvAmSgmT22cTSQCx1WutrRM31JFApEyOPUiCm23hUNlEyIN5/ylb3fbW5ZoGw/15ddQ==
X-Received: by 2002:a05:620a:7ee:b0:6fa:5811:760e with SMTP id
 k14-20020a05620a07ee00b006fa5811760emr6896670qkk.363.1667481956561; 
 Thu, 03 Nov 2022 06:25:56 -0700 (PDT)
Received: from p1.montleon.intra (066-026-073-226.inf.spectrum.com.
 [66.26.73.226]) by smtp.gmail.com with ESMTPSA id
 gb4-20020a05622a598400b0039853b7b771sm502853qtb.80.2022.11.03.06.25.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Nov 2022 06:25:55 -0700 (PDT)
From: Jason Montleon <jmontleo@redhat.com>
To: pierre-louis.bossart@linux.intel.com
Subject: [PATCH v3 1/2] ASoC: rt5514: fix legacy dai naming
Date: Thu,  3 Nov 2022 09:25:24 -0400
Message-Id: <20221103132525.3247-1-jmontleo@redhat.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
X-Mailman-Approved-At: Fri, 04 Nov 2022 09:16:01 +0100
Cc: oder_chiou@realtek.com, alsa-devel@alsa-project.org,
 ckeepax@opensource.cirrus.com, regressions@lists.linux.dev,
 jmontleo@redhat.com, cezary.rojewski@intel.com, tiwai@suse.com,
 broonie@kernel.org
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

Starting with 6.0-rc1 these messages are logged and the sound card
is unavailable. Adding legacy_dai_naming to the rt5514-spi causes
it to function properly again.

[   16.928454] kbl_r5514_5663_max kbl_r5514_5663_max: ASoC: CPU DAI
spi-PRP0001:00 not registered
[   16.928561] platform kbl_r5514_5663_max: deferred probe pending

Signed-off-by: Jason Montleon <jmontleo@redhat.com>
---
 sound/soc/codecs/rt5514-spi.c | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/sound/soc/codecs/rt5514-spi.c b/sound/soc/codecs/rt5514-spi.c
index 1a25a3787935..362663abcb89 100644
--- a/sound/soc/codecs/rt5514-spi.c
+++ b/sound/soc/codecs/rt5514-spi.c
@@ -298,13 +298,14 @@ static int rt5514_spi_pcm_new(struct snd_soc_component *component,
 }
 
 static const struct snd_soc_component_driver rt5514_spi_component = {
-	.name		= DRV_NAME,
-	.probe		= rt5514_spi_pcm_probe,
-	.open		= rt5514_spi_pcm_open,
-	.hw_params	= rt5514_spi_hw_params,
-	.hw_free	= rt5514_spi_hw_free,
-	.pointer	= rt5514_spi_pcm_pointer,
-	.pcm_construct	= rt5514_spi_pcm_new,
+	.name			= DRV_NAME,
+	.probe			= rt5514_spi_pcm_probe,
+	.open			= rt5514_spi_pcm_open,
+	.hw_params		= rt5514_spi_hw_params,
+	.hw_free		= rt5514_spi_hw_free,
+	.pointer		= rt5514_spi_pcm_pointer,
+	.pcm_construct		= rt5514_spi_pcm_new,
+	.legacy_dai_naming	= 1,
 };
 
 /**
-- 
2.37.3

