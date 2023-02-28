Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 805DE6A576F
	for <lists+alsa-devel@lfdr.de>; Tue, 28 Feb 2023 12:03:58 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 286FD839;
	Tue, 28 Feb 2023 12:03:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 286FD839
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1677582237;
	bh=h/jiWEOZsffwI+IMKkal/xKUjU/a6RIroqiEYcdfC9s=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=LrIrjyD69qePW4hSh4+FZcorRxQt5PIc2dMOETFRgQNkuXRATwZ5Md9SuqBa1tpan
	 y+2awwJSqQfcuVwZ/e95JO/Z9MBE2M2ASr384PQMNjeu89AiJ9q6ShU6bIlB1RJuCC
	 yURg1jCjafRHCtu1mEOQkz1shLKXqkttOYNuZL4k=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7A979F80520;
	Tue, 28 Feb 2023 12:02:17 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9E0A7F804FE; Tue, 28 Feb 2023 12:02:13 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.153.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 47E7DF800BA
	for <alsa-devel@alsa-project.org>; Tue, 28 Feb 2023 12:02:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 47E7DF800BA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=microchip.com header.i=@microchip.com
 header.a=rsa-sha256 header.s=mchp header.b=qBNP1NKH
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1677582124; x=1709118124;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=h/jiWEOZsffwI+IMKkal/xKUjU/a6RIroqiEYcdfC9s=;
  b=qBNP1NKHDdaGknbDdSmgXhoGrZLDJtohJWPTI8KVB/y0uAL3h1d30vqL
   reGvJ5rJlhwPUOFe5bR3fE3v4LSbtb7rZkf37Xiix9Ft+4lmn+QQM/fFJ
   WTGW91dTnIXR3+tPqv/qiinp8cKL3ileKSb5m2Of4GrFQsF+B9B9Beb7n
   /7KL7iOt0c7NMf/6duXbHYrC9SLYG8A4K+3QL1h4tIobKj+XNdVjyov+l
   jUV2uZUbl8ae9MX18/dIEmEg6spUdjgPMmyrzRSPYKwwBycxEgdbf7p6L
   CzJADWsSdr3oE0m23ngN9VK/WuSO4IqiTQyM27lZMQnyRvXA+szi+pBIB
   Q==;
X-IronPort-AV: E=Sophos;i="5.98,221,1673938800";
   d="scan'208";a="213967735"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 28 Feb 2023 04:02:01 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Tue, 28 Feb 2023 04:01:59 -0700
Received: from m18063-ThinkPad-T460p.mchp-main.com (10.10.115.15) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2507.16 via Frontend Transport; Tue, 28 Feb 2023 04:01:54 -0700
From: Claudiu Beznea <claudiu.beznea@microchip.com>
To: <lgirdwood@gmail.com>, <broonie@kernel.org>, <robh+dt@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <perex@perex.cz>, <tiwai@suse.com>,
	<nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>
Subject: [PATCH v3 1/3] ASoC: soc-pcm: add option to start DMA after DAI
Date: Tue, 28 Feb 2023 13:01:43 +0200
Message-ID: <20230228110145.3770525-2-claudiu.beznea@microchip.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230228110145.3770525-1-claudiu.beznea@microchip.com>
References: <20230228110145.3770525-1-claudiu.beznea@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Message-ID-Hash: 3X6HY7OTZQGAOJOOGEU5SWSEJKMOZIOJ
X-Message-ID-Hash: 3X6HY7OTZQGAOJOOGEU5SWSEJKMOZIOJ
X-MailFrom: Claudiu.Beznea@microchip.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Claudiu Beznea <claudiu.beznea@microchip.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3X6HY7OTZQGAOJOOGEU5SWSEJKMOZIOJ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add option to start DMA component after DAI trigger. This is done
by filling the new struct snd_soc_component_driver::start_dma_last.

Signed-off-by: Claudiu Beznea <claudiu.beznea@microchip.com>
---
 include/sound/soc-component.h |  2 ++
 sound/soc/soc-pcm.c           | 27 ++++++++++++++++++++++-----
 2 files changed, 24 insertions(+), 5 deletions(-)

diff --git a/include/sound/soc-component.h b/include/sound/soc-component.h
index 3203d35bc8c1..0814ed143864 100644
--- a/include/sound/soc-component.h
+++ b/include/sound/soc-component.h
@@ -190,6 +190,8 @@ struct snd_soc_component_driver {
 	bool use_dai_pcm_id;	/* use DAI link PCM ID as PCM device number */
 	int be_pcm_base;	/* base device ID for all BE PCMs */
 
+	unsigned int start_dma_last;
+
 #ifdef CONFIG_DEBUG_FS
 	const char *debugfs_prefix;
 #endif
diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
index 005b179a770a..5eb056b942ce 100644
--- a/sound/soc/soc-pcm.c
+++ b/sound/soc/soc-pcm.c
@@ -1088,22 +1088,39 @@ static int soc_pcm_hw_params(struct snd_pcm_substream *substream,
 static int soc_pcm_trigger(struct snd_pcm_substream *substream, int cmd)
 {
 	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
-	int ret = -EINVAL, _ret = 0;
+	struct snd_soc_component *component;
+	int ret = -EINVAL, _ret = 0, start_dma_last = 0, i;
 	int rollback = 0;
 
 	switch (cmd) {
 	case SNDRV_PCM_TRIGGER_START:
 	case SNDRV_PCM_TRIGGER_RESUME:
 	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
+		/* Do we need to start dma last? */
+		for_each_rtd_components(rtd, i, component) {
+			if (component->driver->start_dma_last) {
+				start_dma_last = 1;
+				break;
+			}
+		}
+
 		ret = snd_soc_link_trigger(substream, cmd, 0);
 		if (ret < 0)
 			goto start_err;
 
-		ret = snd_soc_pcm_component_trigger(substream, cmd, 0);
-		if (ret < 0)
-			goto start_err;
+		if (start_dma_last) {
+			ret = snd_soc_pcm_dai_trigger(substream, cmd, 0);
+			if (ret < 0)
+				goto start_err;
+
+			ret = snd_soc_pcm_component_trigger(substream, cmd, 0);
+		} else {
+			ret = snd_soc_pcm_component_trigger(substream, cmd, 0);
+			if (ret < 0)
+				goto start_err;
 
-		ret = snd_soc_pcm_dai_trigger(substream, cmd, 0);
+			ret = snd_soc_pcm_dai_trigger(substream, cmd, 0);
+		}
 start_err:
 		if (ret < 0)
 			rollback = 1;
-- 
2.34.1

