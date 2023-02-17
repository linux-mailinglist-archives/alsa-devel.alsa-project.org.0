Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B01269ABBF
	for <lists+alsa-devel@lfdr.de>; Fri, 17 Feb 2023 13:44:07 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9787FF1A;
	Fri, 17 Feb 2023 13:43:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9787FF1A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1676637846;
	bh=h/jiWEOZsffwI+IMKkal/xKUjU/a6RIroqiEYcdfC9s=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=sf7ELBZJx7eusomP0hW2vwZCbkHrjMh92PO2npV+x8LO9QaqY3QoU8hyEcJW78Ljl
	 oSzM2M/rC6su4WTBK1DfRGo5YfN9ilc3bw4Y0xCddvheZeBjbLyzemqUrfVNpuHrwS
	 QhFeAgL3CtxVop2VQs2xLNB3qbrGTec4LZTn0Tn0=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4F59BF80496;
	Fri, 17 Feb 2023 13:42:27 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F3B7BF800AA; Fri, 17 Feb 2023 13:42:22 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.154.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 51483F800B6
	for <alsa-devel@alsa-project.org>; Fri, 17 Feb 2023 13:42:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 51483F800B6
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=microchip.com header.i=@microchip.com
 header.a=rsa-sha256 header.s=mchp header.b=iF5slHV8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1676637733; x=1708173733;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=h/jiWEOZsffwI+IMKkal/xKUjU/a6RIroqiEYcdfC9s=;
  b=iF5slHV8GVol0jPuEpZocXm53u9HEaPSs6GHJ2u0uWwjlJs1fKGHMaWH
   YuVXgbfkB3FSxHdkOcjWjv1zm9Bb6u0uh2XpMXcDztrfcBCaOR0+V7I4m
   O3cUHQa85wJRdl59ZoX4nOMR4j+ihIizlXXX9z1sNGAj/jaAjJDyMxxJ2
   uy+2wcoeOvmGShZPKR3czrbIPnoiq2l9RZPjnsW3zuFHX/DJq/yVKyyH0
   hWC4aWGwUsvkRnTlAMZqSlsglK1txBHd//oqiqw+S2QM7JoAaI6G6lBNH
   X1HfqwNxpQUJVgBRP0RE5/76e2CrAMBfrDOwZuLrokT5zc3CnoQvy9dQB
   Q==;
X-IronPort-AV: E=Sophos;i="5.97,304,1669100400";
   d="scan'208";a="137771533"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 17 Feb 2023 05:42:11 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Fri, 17 Feb 2023 05:42:07 -0700
Received: from m18063-ThinkPad-T460p.mchp-main.com (10.10.115.15) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2507.16 via Frontend Transport; Fri, 17 Feb 2023 05:42:03 -0700
From: Claudiu Beznea <claudiu.beznea@microchip.com>
To: <lgirdwood@gmail.com>, <broonie@kernel.org>, <robh+dt@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <perex@perex.cz>, <tiwai@suse.com>,
	<nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>
Subject: [PATCH v2 1/3] ASoC: soc-pcm: add option to start DMA after DAI
Date: Fri, 17 Feb 2023 14:41:49 +0200
Message-ID: <20230217124151.236216-2-claudiu.beznea@microchip.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230217124151.236216-1-claudiu.beznea@microchip.com>
References: <20230217124151.236216-1-claudiu.beznea@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Message-ID-Hash: GSBTLU5BBAIYYUJAMFFHRYONPUDWMUMA
X-Message-ID-Hash: GSBTLU5BBAIYYUJAMFFHRYONPUDWMUMA
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/GSBTLU5BBAIYYUJAMFFHRYONPUDWMUMA/>
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

