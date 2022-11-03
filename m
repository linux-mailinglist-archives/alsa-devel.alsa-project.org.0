Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 57C7A619299
	for <lists+alsa-devel@lfdr.de>; Fri,  4 Nov 2022 09:18:41 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E3E7316A2;
	Fri,  4 Nov 2022 09:17:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E3E7316A2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1667549921;
	bh=UZIykCi2zrJge/DnKfWxbuxG1AEcI8ZWLSjtAgAa20g=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=aNoBw8g+qAI+AiiVC1KB2gq22NmMd4GKjIs4Y86fvbIEjTcUZHcUnQFc+55qUbM71
	 74OGWdWSck4hxr/0eUKyNMoSIRBFNzNPGWTQmJwO88UNoB31jpzc/aczdt8fcRXuqL
	 B2MHOWQdOKyUlwF/C+x5dMW3hQkUWYb3K0mrMKjY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C7846F8057A;
	Fri,  4 Nov 2022 09:16:05 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 66B9EF8051F; Thu,  3 Nov 2022 14:26:06 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0BC58F80155
 for <alsa-devel@alsa-project.org>; Thu,  3 Nov 2022 14:26:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0BC58F80155
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="SCxgTcfD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667481962;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=k/osXEXoceD/V9gqfveYOQdnvKpq5BFrtlU8yYodRj8=;
 b=SCxgTcfDrPHHsxi1G3rnLWGsYi3gkrs069dUXS+oFNbXimDC1j7MZ1vNtzs2imiUkgxYgp
 NkioFp97QvaZkpXiBpF40KJHc4pZMsUfI602w0Q1jnbdo+KPaFLtOBlGT6SM2aIGBSvAaL
 93Iqa4zPmxBS+ZY1G5Sb5eBz/T0RcKI=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-6-paQ8S-OENISwlq9kwoxNfg-1; Thu, 03 Nov 2022 09:26:01 -0400
X-MC-Unique: paQ8S-OENISwlq9kwoxNfg-1
Received: by mail-qv1-f69.google.com with SMTP id
 q17-20020a056214019100b004b1d3c9f3acso1325383qvr.0
 for <alsa-devel@alsa-project.org>; Thu, 03 Nov 2022 06:26:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=k/osXEXoceD/V9gqfveYOQdnvKpq5BFrtlU8yYodRj8=;
 b=heHV+UD3K8sI1L4VRPDHv+8CFmqpnjwsy14RCzq4YevsFozJpjs/1FgTlvUzUVahda
 nfrT5nnu/TkdkgP+tFCUh30rG1aYTTHyM/A4VqImZcOVfz1cLsBo429vj+ICsiHMiu0n
 Nb2jHs6pq5XieLzFrYHqeCm3EW3TD76mOrGeyjf0AIvdRqr5X32eUuIBriBFBrKxHt9P
 ybf++wePFqKrC/lfLJNtyrK083reCkd0ohgonTeP4fS8kCBQOMyEQ14CiI2RlfcOlBTR
 V7Mi7jQYDaTjvHu2CRsCUBkvLVKT8sVFw3UcQDqqVTA1i81hgne3OV0BeFw3g4MZFTsW
 4npw==
X-Gm-Message-State: ACrzQf0KgEmk9JSI17xt93SctXAQope7Lnv/8nZqv7Bj/B1dU8DZP4eY
 CaYoIBeeCr8BGQgpSNejgfLPG4I9P1+A5lH8pHTEs5I6vAvD/0bickoCfMRiXOzy3xqSoFTaJAJ
 Mg+csIxtKeC46n5kPdeHENqg=
X-Received: by 2002:a05:6214:1c46:b0:4bb:fce3:bb36 with SMTP id
 if6-20020a0562141c4600b004bbfce3bb36mr17863216qvb.59.1667481961095; 
 Thu, 03 Nov 2022 06:26:01 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7I/1vcdAKxOv2K5w+1HF6EPIBG5Vvmyfb0fLUJqGTDDFjHpfvRjBNSGSk3CcQcJaVwzeAIBg==
X-Received: by 2002:a05:6214:1c46:b0:4bb:fce3:bb36 with SMTP id
 if6-20020a0562141c4600b004bbfce3bb36mr17863180qvb.59.1667481960711; 
 Thu, 03 Nov 2022 06:26:00 -0700 (PDT)
Received: from p1.montleon.intra (066-026-073-226.inf.spectrum.com.
 [66.26.73.226]) by smtp.gmail.com with ESMTPSA id
 gb4-20020a05622a598400b0039853b7b771sm502853qtb.80.2022.11.03.06.25.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Nov 2022 06:26:00 -0700 (PDT)
From: Jason Montleon <jmontleo@redhat.com>
To: pierre-louis.bossart@linux.intel.com
Subject: [PATCH v3 2/2] ASoC: rt5677: fix legacy dai naming
Date: Thu,  3 Nov 2022 09:25:25 -0400
Message-Id: <20221103132525.3247-2-jmontleo@redhat.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221103132525.3247-1-jmontleo@redhat.com>
References: <20221103132525.3247-1-jmontleo@redhat.com>
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

Starting with 6.0-rc1 the CPU DAI is not registered and the sound
card is unavailable. Adding legacy_dai_naming causes it to function
properly again.

Signed-off-by: Jason Montleon <jmontleo@redhat.com>
---
 sound/soc/codecs/rt5677-spi.c | 19 ++++++++++---------
 1 file changed, 10 insertions(+), 9 deletions(-)

diff --git a/sound/soc/codecs/rt5677-spi.c b/sound/soc/codecs/rt5677-spi.c
index 8f3993a4c1cc..d25703dd7499 100644
--- a/sound/soc/codecs/rt5677-spi.c
+++ b/sound/soc/codecs/rt5677-spi.c
@@ -396,15 +396,16 @@ static int rt5677_spi_pcm_probe(struct snd_soc_component *component)
 }
 
 static const struct snd_soc_component_driver rt5677_spi_dai_component = {
-	.name		= DRV_NAME,
-	.probe		= rt5677_spi_pcm_probe,
-	.open		= rt5677_spi_pcm_open,
-	.close		= rt5677_spi_pcm_close,
-	.hw_params	= rt5677_spi_hw_params,
-	.hw_free	= rt5677_spi_hw_free,
-	.prepare	= rt5677_spi_prepare,
-	.pointer	= rt5677_spi_pcm_pointer,
-	.pcm_construct	= rt5677_spi_pcm_new,
+	.name			= DRV_NAME,
+	.probe			= rt5677_spi_pcm_probe,
+	.open			= rt5677_spi_pcm_open,
+	.close			= rt5677_spi_pcm_close,
+	.hw_params		= rt5677_spi_hw_params,
+	.hw_free		= rt5677_spi_hw_free,
+	.prepare		= rt5677_spi_prepare,
+	.pointer		= rt5677_spi_pcm_pointer,
+	.pcm_construct		= rt5677_spi_pcm_new,
+	.legacy_dai_naming	= 1,
 };
 
 /* Select a suitable transfer command for the next transfer to ensure
-- 
2.37.3

