Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B9BB46192A4
	for <lists+alsa-devel@lfdr.de>; Fri,  4 Nov 2022 09:19:30 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 59F30169D;
	Fri,  4 Nov 2022 09:18:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 59F30169D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1667549970;
	bh=p519d/dpGyRG3VlmsC5Te2dHnGoZfeLByhmqztUyPUY=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=G+gyTbZqVruWu9RhHwoxStyDtoGe8BIGsRMXpX4oeKFataLBbq8arS+kNv/e+R2MY
	 yXqKtZQBgLfAaIc59NrrsUny9gJmHl6kCvpTyi/BYkDOdjrvjnjHcC5DEF+MnO+mZ2
	 8ZgiQNuAltKUJerMlxrYN2h6njhBAUDA3LnVEjIY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BC156F805A0;
	Fri,  4 Nov 2022 09:16:07 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 695A8F8051F; Thu,  3 Nov 2022 15:46:30 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F0211F80155
 for <alsa-devel@alsa-project.org>; Thu,  3 Nov 2022 15:46:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F0211F80155
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="KrJ6ucy2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667486785;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YJXibA0h5EKEv6IPvm5uKuXU6CZAaOV8NDSOv2jfpHY=;
 b=KrJ6ucy2gsPD2BvQtJv8F++EZzaGsl/t1CIEPS+qEdQa//1CtF6KKKaoMQbPe9PDPMfGJp
 T1IvOJRDv4lvZ4tiEorGlEzHC6auPhy+rwdnLUSSgxxz8EV5HcrhSHkwU1vcwDby52QdyB
 ZlBVmkrF5s7HfrnqttYA78PZdWCaGLI=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-182-GHCafKiWO12v09kUIo2wSw-1; Thu, 03 Nov 2022 10:46:25 -0400
X-MC-Unique: GHCafKiWO12v09kUIo2wSw-1
Received: by mail-qt1-f198.google.com with SMTP id
 y8-20020ac87088000000b003a528a5b844so1937007qto.18
 for <alsa-devel@alsa-project.org>; Thu, 03 Nov 2022 07:46:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YJXibA0h5EKEv6IPvm5uKuXU6CZAaOV8NDSOv2jfpHY=;
 b=K8WMQdGPpQ17uwwJbkc3fnOvAz1mD5LQJjY3zM3nDXO3cnKl8AnNbbuOM/T5IRIAhL
 x2XKLk6IWLZ9sSGKNqDUdPdvFY/+w0ZgLS97S9WDKsd8GPhNeDWEOo6a0qJwJTjvEWNm
 JezCZAtyCwEBBEdeDKIbCs0t+VDuJJth+5DKkiFOu0blj+VRRVuDKV101kK/CdJF7xW9
 DNq+6hWMgGaPWXHfdKdaF9H+hKWTVWhUwDD3lnJJBUntnrimbFuLPgS7bInoP/6zF0Bt
 TDpvIDo4v9LGOOF0K+BXAYwQXWnarcRsAeZ4y9Ukag0JemRWMRG8WfT39DzdV4akov7o
 F68A==
X-Gm-Message-State: ACrzQf2hflW2067Fa+JMrjzMi2NxCbdgWiP0pr1CfXZJS0CMPQtplsge
 1HQyvMTQZ/NXMLC5AeD2m4vGWsYXr0vfZ+KpXIKmrKmB319pcxkgdc5rWCRX5q6ClqEsh3gpYip
 rLLrI3e7CYuQGBEadmm4vQCM=
X-Received: by 2002:ae9:ec07:0:b0:6cf:4190:246 with SMTP id
 h7-20020ae9ec07000000b006cf41900246mr21110391qkg.760.1667486782959; 
 Thu, 03 Nov 2022 07:46:22 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4bk/lucYFrTehGoPTfO4GaH3jiwxkOh9YtFwCTaUkFUDWKuoNdHR7lGGIqfCeXvIoqPaCE1A==
X-Received: by 2002:ae9:ec07:0:b0:6cf:4190:246 with SMTP id
 h7-20020ae9ec07000000b006cf41900246mr21110377qkg.760.1667486782760; 
 Thu, 03 Nov 2022 07:46:22 -0700 (PDT)
Received: from p1.montleon.intra (066-026-073-226.inf.spectrum.com.
 [66.26.73.226]) by smtp.gmail.com with ESMTPSA id
 h15-20020a05620a244f00b006fa468342a3sm873175qkn.108.2022.11.03.07.46.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Nov 2022 07:46:22 -0700 (PDT)
From: Jason Montleon <jmontleo@redhat.com>
To: pierre-louis.bossart@linux.intel.com
Subject: [PATCH v4 2/2] ASoC: rt5677: fix legacy dai naming
Date: Thu,  3 Nov 2022 10:46:12 -0400
Message-Id: <20221103144612.4431-2-jmontleo@redhat.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221103144612.4431-1-jmontleo@redhat.com>
References: <20221103144612.4431-1-jmontleo@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
X-Mailman-Approved-At: Fri, 04 Nov 2022 09:16:01 +0100
Cc: oder_chiou@realtek.com, alsa-devel@alsa-project.org,
 ckeepax@opensource.cirrus.com, regressions@lists.linux.dev,
 jmontleo@redhat.com, cezary.rojewski@intel.com, stable@vger.kernel.org,
 tiwai@suse.com, broonie@kernel.org
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

Fixes: fc34ece41f71 ("ASoC: Refactor non_legacy_dai_naming flag")
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

