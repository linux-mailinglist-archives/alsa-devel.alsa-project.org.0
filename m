Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DE5B9404B24
	for <lists+alsa-devel@lfdr.de>; Thu,  9 Sep 2021 13:49:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 767B016B8;
	Thu,  9 Sep 2021 13:48:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 767B016B8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1631188179;
	bh=i06AM4DVmRVPJBNARjGrF5thGGhhF9wFivOaNz4+sWI=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HM9AWnmKT7f+XuJMZ9xtgHjoPbwfIEV+qyvMH6j1zCddPKq2+fDOurlsPggolWcge
	 kw8icv7M3zpLWipOo/0rf2PHnGKMophwZZV4DcXY7i72zp9fzn8GQxBlL2SCW5tvNv
	 BqCHHC699o+ky37shA2fMEpyncX/dGi22w99dIOY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 172C0F80253;
	Thu,  9 Sep 2021 13:48:36 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 62DEAF80253; Thu,  9 Sep 2021 13:48:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C8698F80217
 for <alsa-devel@alsa-project.org>; Thu,  9 Sep 2021 13:48:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C8698F80217
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="d7KBhoO2"
Received: by mail.kernel.org (Postfix) with ESMTPSA id A981D611EF;
 Thu,  9 Sep 2021 11:48:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1631188109;
 bh=i06AM4DVmRVPJBNARjGrF5thGGhhF9wFivOaNz4+sWI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=d7KBhoO2Ll0SRI9uqZzHMorBI+3aemWPNuPSJEjQgoyx9ZpM23zSLwK5jPC2imORh
 RqOWgyJVodENQsimjJeKuWSiRRY5T1gxW/3wEmQMlyf0X9Z5sNu2qojIMLONz9kRu/
 ysIGGSeoh82caWLFCYlxbwgo5HEC3JzJ/Z8ppaMmwtYzrRchxCaVVTaMPeJTCK8niA
 pKrraEWlVlenSNKdKifL9IH78CZkdUQs5x+tGbWgV8BQyBAwxZd/FuMFMfvKeTFfTK
 EvuI7bsuBudKW1M3mUvYXNOmZ4p+ddhMDZGuf6L179GuBBROxGjb5HAvuJ20t4nXAr
 Q5gDjAfI8Bt8g==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.13 088/219] ASoC: Intel: update sof_pcm512x quirks
Date: Thu,  9 Sep 2021 07:44:24 -0400
Message-Id: <20210909114635.143983-88-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210909114635.143983-1-sashal@kernel.org>
References: <20210909114635.143983-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Cc: Sasha Levin <sashal@kernel.org>,
 Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
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

From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

[ Upstream commit 22414cade8dfec25ab94df52b3a4f7aa8edb6120 ]

The default SOF topology enables SSP capture and DMICs, even though
both of these hardware capabilities are not always available in
hardware (specific versions of HiFiberry and DMIC kit needed).

For the SSP capture, this leads to annoying "SP5-Codec: ASoC: no
backend capture" and "streamSSP5-Codec: ASoC: no users capture at
close - state 0" errors.

Update the quirks to match what the topology needs, which also allows
for the ability to remove SSP capture and DMIC support.

BugLink: https://github.com/thesofproject/linux/issues/3061
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
Link: https://lore.kernel.org/r/20210802152151.15832-4-pierre-louis.bossart@linux.intel.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/intel/boards/sof_pcm512x.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/sound/soc/intel/boards/sof_pcm512x.c b/sound/soc/intel/boards/sof_pcm512x.c
index 8620d4f38493..335c212c1961 100644
--- a/sound/soc/intel/boards/sof_pcm512x.c
+++ b/sound/soc/intel/boards/sof_pcm512x.c
@@ -26,11 +26,16 @@
 
 #define SOF_PCM512X_SSP_CODEC(quirk)		((quirk) & GENMASK(3, 0))
 #define SOF_PCM512X_SSP_CODEC_MASK			(GENMASK(3, 0))
+#define SOF_PCM512X_ENABLE_SSP_CAPTURE		BIT(4)
+#define SOF_PCM512X_ENABLE_DMIC			BIT(5)
 
 #define IDISP_CODEC_MASK	0x4
 
 /* Default: SSP5 */
-static unsigned long sof_pcm512x_quirk = SOF_PCM512X_SSP_CODEC(5);
+static unsigned long sof_pcm512x_quirk =
+	SOF_PCM512X_SSP_CODEC(5) |
+	SOF_PCM512X_ENABLE_SSP_CAPTURE |
+	SOF_PCM512X_ENABLE_DMIC;
 
 static bool is_legacy_cpu;
 
@@ -245,8 +250,9 @@ static struct snd_soc_dai_link *sof_card_dai_links_create(struct device *dev,
 	links[id].dpcm_playback = 1;
 	/*
 	 * capture only supported with specific versions of the Hifiberry DAC+
-	 * links[id].dpcm_capture = 1;
 	 */
+	if (sof_pcm512x_quirk & SOF_PCM512X_ENABLE_SSP_CAPTURE)
+		links[id].dpcm_capture = 1;
 	links[id].no_pcm = 1;
 	links[id].cpus = &cpus[id];
 	links[id].num_cpus = 1;
@@ -381,6 +387,9 @@ static int sof_audio_probe(struct platform_device *pdev)
 
 	ssp_codec = sof_pcm512x_quirk & SOF_PCM512X_SSP_CODEC_MASK;
 
+	if (!(sof_pcm512x_quirk & SOF_PCM512X_ENABLE_DMIC))
+		dmic_be_num = 0;
+
 	/* compute number of dai links */
 	sof_audio_card_pcm512x.num_links = 1 + dmic_be_num + hdmi_num;
 
-- 
2.30.2

