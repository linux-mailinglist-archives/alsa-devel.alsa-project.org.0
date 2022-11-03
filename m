Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 211C5619293
	for <lists+alsa-devel@lfdr.de>; Fri,  4 Nov 2022 09:17:52 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6576A1698;
	Fri,  4 Nov 2022 09:17:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6576A1698
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1667549871;
	bh=B0Ggmd9peyJ1RTIDCK/jO5y9sgOhpc2cyI6MQ2ecelI=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=K3ehAWzgeU+/ZBZMh5LFXCwWZh40e6ulkdZFhbyEej5r/4shEVa6z3/mHDExob++Q
	 esfvUNKcK/BXMTItd0rFJN7C5otw4EvhzqPmOKQ3howyf466umfLKO/tfN5wC+QWxZ
	 mj5mC/QYBZP9Pj102Jr9Vc21RHhe5LFzHlub5/sQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4258DF8055A;
	Fri,  4 Nov 2022 09:16:04 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AA0E2F8051E; Thu,  3 Nov 2022 14:15:53 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C351CF80155
 for <alsa-devel@alsa-project.org>; Thu,  3 Nov 2022 14:15:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C351CF80155
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="AVvamd5s"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667481348;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tF48IIsES7IkkOV8CP2SYktqbQsH3Wm7oCaHUYKuyUE=;
 b=AVvamd5sXQhvmLQRJlrFSIgiCXXNzlOaL0fo9Zuv62k7e8ydQ39LUEBIkFXDl7Bw3Mi17M
 ldlRSOsQqjEqrTB5DCJ3LgJgRrPF5p4EHHn6FIpZwqTBr7fysQ+WQwTGnmiK0G33ctLV1U
 boTTCcBkvBrPFo5VOJR/BvUbWXYOVVo=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-365-3fwMhjfQMOCT9PAYYn-r_w-1; Thu, 03 Nov 2022 09:15:47 -0400
X-MC-Unique: 3fwMhjfQMOCT9PAYYn-r_w-1
Received: by mail-qv1-f69.google.com with SMTP id
 e9-20020ad45369000000b004bbb737fcf9so1266357qvv.6
 for <alsa-devel@alsa-project.org>; Thu, 03 Nov 2022 06:15:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tF48IIsES7IkkOV8CP2SYktqbQsH3Wm7oCaHUYKuyUE=;
 b=Xo1cdDFmpTYB8L05yeBToZzFGsYjAswzuTyz7lWmL8qmRSbk1LuteB/2Y2j2ylGxMi
 b/EaECNrT8C61VzMp5z23EhVRmss4ac12eM8nUeBAMi+zfiniZmISdmIfpUmnEhKylcq
 mhl+ej3/CesZSK8l8YWnCm36qlW0gnL3OYQdWu/rKKVuHPDOahtqNO7yCC89hi/zFAF0
 K5OOGrXGQrWo1c6jMcnbah0Mq3dkUMJzjkJbx85qdD7alWIbpU7XSr4XRQpYI8kYbqRm
 JymFNBeWFRWIrXYn6v7p4ZNPt52KZKvJHRtZiYynTVgQ6S8zSw2TOvho2t9bJyza0gcd
 SzNw==
X-Gm-Message-State: ACrzQf1NaQONWh7b8fcT1w0a/X3V96DzTf7Nhckoj84VtMkOx32KtG04
 andWz4BLXoH8RTyL0WtEEiODuL5PpJNGbIkbSwFN+fNRM6qE0xOrtD+J195XtLGQwNPm8u/QJQd
 9P0hVOEvgWh/fVm8esQ7w1rw=
X-Received: by 2002:a05:6214:621:b0:4bb:ce2d:e29b with SMTP id
 a1-20020a056214062100b004bbce2de29bmr24951603qvx.80.1667481346769; 
 Thu, 03 Nov 2022 06:15:46 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5+plLN60XMHL56pa2r+xcXzlCL7hdTgEUxSIuEWPE35WGQNnWo+vfMcQr5EP5GltbbvMpIig==
X-Received: by 2002:a05:6214:621:b0:4bb:ce2d:e29b with SMTP id
 a1-20020a056214062100b004bbce2de29bmr24951582qvx.80.1667481346518; 
 Thu, 03 Nov 2022 06:15:46 -0700 (PDT)
Received: from p1.montleon.intra (066-026-073-226.inf.spectrum.com.
 [66.26.73.226]) by smtp.gmail.com with ESMTPSA id
 s8-20020a05620a16a800b006ed30a8fb21sm715086qkj.76.2022.11.03.06.15.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Nov 2022 06:15:46 -0700 (PDT)
From: Jason Montleon <jmontleo@redhat.com>
To: pierre-louis.bossart@linux.intel.com
Subject: [PATCH v2 2/2] ASoC: rt5677: fix legacy dai naming
Date: Thu,  3 Nov 2022 09:11:44 -0400
Message-Id: <20221103131144.2942-2-jmontleo@redhat.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221103131144.2942-1-jmontleo@redhat.com>
References: <87v8nwmgso.wl-tiwai@suse.de>
 <20221103131144.2942-1-jmontleo@redhat.com>
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

