Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BF0D404C34
	for <lists+alsa-devel@lfdr.de>; Thu,  9 Sep 2021 13:55:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 34FCD1717;
	Thu,  9 Sep 2021 13:54:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 34FCD1717
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1631188530;
	bh=cV1bULndHYuO+pws6De6elADmnvVsd2GUAbeYhywzrI=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=PQgOL43mx2lpAp/U1rYWwohocI1bWUB4ZyQPUgiz0KfEX+KzU8iozZbgll/4trV9W
	 FqWU1Kv96HRY6FzspAMZuPLiVIy7MZjkBMx3OrOswF9G6N/P9kOqhBDvUh1KA2kOVf
	 CnLJj3mTwG1Bk7WMoaYzF04zyNGQFf6foDavLgPo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6B573F804E3;
	Thu,  9 Sep 2021 13:53:01 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F0E31F804ED; Thu,  9 Sep 2021 13:52:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B2C5FF804E5
 for <alsa-devel@alsa-project.org>; Thu,  9 Sep 2021 13:52:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B2C5FF804E5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="ENXr6k59"
Received: by mail.kernel.org (Postfix) with ESMTPSA id C069461B39;
 Thu,  9 Sep 2021 11:52:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1631188368;
 bh=cV1bULndHYuO+pws6De6elADmnvVsd2GUAbeYhywzrI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ENXr6k59t0CW/YzLt6/lwO7FQYgcNDWxBuFUcyS74xyXeUvzO62i6hOl2vYh7M2Gs
 eFzHTHxRVflTJ3i1tkT6IOvxUVWqNTmevvlnq9Sl+JV5W/Jvyjnwb9YVQMjdgZh4qN
 ncQvCMG8k6facySfxkzgki7VzP+O/E2zm7W7frtA3Z0xSXDGf7lUaK6ERKxfSPvsvE
 j0XL+BZPMm7K4iU52YLzg6k3spuvDwhma3w1y4OxXoscrwUNedWhjuh5aqEN7f7vTj
 M+yiZ86afWQvKHD1VRN9uA+gbsJRHy1C0G/ooLLOYKF5DhVTubICgLfhrmuSH1srln
 AWiuea8xQ72Lg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.10 070/176] ASoC: Intel: bytcr_rt5640: Move
 "Platform Clock" routes to the maps for the matching in-/output
Date: Thu,  9 Sep 2021 07:49:32 -0400
Message-Id: <20210909115118.146181-70-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210909115118.146181-1-sashal@kernel.org>
References: <20210909115118.146181-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Cc: Sasha Levin <sashal@kernel.org>, Hans de Goede <hdegoede@redhat.com>,
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

From: Hans de Goede <hdegoede@redhat.com>

[ Upstream commit dccd1dfd0770bfd494b68d1135b4547b2c602c42 ]

Move the "Platform Clock" routes for the "Internal Mic" and "Speaker"
routes to the intmic_*_map[] / *_spk_map[] arrays.

This ensures that these "Platform Clock" routes do not get added when the
BYT_RT5640_NO_INTERNAL_MIC_MAP / BYT_RT5640_NO_SPEAKERS quirks are used.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
Acked-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Link: https://lore.kernel.org/r/20210802142501.991985-2-hdegoede@redhat.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/intel/boards/bytcr_rt5640.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/sound/soc/intel/boards/bytcr_rt5640.c b/sound/soc/intel/boards/bytcr_rt5640.c
index ca14730232ba..43ee3d095a1b 100644
--- a/sound/soc/intel/boards/bytcr_rt5640.c
+++ b/sound/soc/intel/boards/bytcr_rt5640.c
@@ -286,9 +286,6 @@ static const struct snd_soc_dapm_widget byt_rt5640_widgets[] = {
 static const struct snd_soc_dapm_route byt_rt5640_audio_map[] = {
 	{"Headphone", NULL, "Platform Clock"},
 	{"Headset Mic", NULL, "Platform Clock"},
-	{"Internal Mic", NULL, "Platform Clock"},
-	{"Speaker", NULL, "Platform Clock"},
-
 	{"Headset Mic", NULL, "MICBIAS1"},
 	{"IN2P", NULL, "Headset Mic"},
 	{"Headphone", NULL, "HPOL"},
@@ -296,19 +293,23 @@ static const struct snd_soc_dapm_route byt_rt5640_audio_map[] = {
 };
 
 static const struct snd_soc_dapm_route byt_rt5640_intmic_dmic1_map[] = {
+	{"Internal Mic", NULL, "Platform Clock"},
 	{"DMIC1", NULL, "Internal Mic"},
 };
 
 static const struct snd_soc_dapm_route byt_rt5640_intmic_dmic2_map[] = {
+	{"Internal Mic", NULL, "Platform Clock"},
 	{"DMIC2", NULL, "Internal Mic"},
 };
 
 static const struct snd_soc_dapm_route byt_rt5640_intmic_in1_map[] = {
+	{"Internal Mic", NULL, "Platform Clock"},
 	{"Internal Mic", NULL, "MICBIAS1"},
 	{"IN1P", NULL, "Internal Mic"},
 };
 
 static const struct snd_soc_dapm_route byt_rt5640_intmic_in3_map[] = {
+	{"Internal Mic", NULL, "Platform Clock"},
 	{"Internal Mic", NULL, "MICBIAS1"},
 	{"IN3P", NULL, "Internal Mic"},
 };
@@ -350,6 +351,7 @@ static const struct snd_soc_dapm_route byt_rt5640_ssp0_aif2_map[] = {
 };
 
 static const struct snd_soc_dapm_route byt_rt5640_stereo_spk_map[] = {
+	{"Speaker", NULL, "Platform Clock"},
 	{"Speaker", NULL, "SPOLP"},
 	{"Speaker", NULL, "SPOLN"},
 	{"Speaker", NULL, "SPORP"},
@@ -357,6 +359,7 @@ static const struct snd_soc_dapm_route byt_rt5640_stereo_spk_map[] = {
 };
 
 static const struct snd_soc_dapm_route byt_rt5640_mono_spk_map[] = {
+	{"Speaker", NULL, "Platform Clock"},
 	{"Speaker", NULL, "SPOLP"},
 	{"Speaker", NULL, "SPOLN"},
 };
-- 
2.30.2

