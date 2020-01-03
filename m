Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B4C7112FF2C
	for <lists+alsa-devel@lfdr.de>; Sat,  4 Jan 2020 00:36:33 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3E2BD178D;
	Sat,  4 Jan 2020 00:35:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3E2BD178D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1578094593;
	bh=y24ibNwu59NghVMulc/iDRulRbMe8iGmoWHpMUymlxM=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=iKgiPbS93bFaE0nRJiz/SnywIyjrp7Rc8Y6ETJLpB5IDYwGX+N01YDH5tV2sisEN9
	 EeK8uCtBOt9uQMUyZSTvzZhIUWpCXeCHyfkv26cQ0aI3uwpzDB9O4SLOzuL2hr+ND2
	 RcorqPEHM6cCpadizZtfB808rC6EgvKxfNEweSII=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 86E92F8015F;
	Sat,  4 Jan 2020 00:34:51 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B63EEF8015D; Sat,  4 Jan 2020 00:34:48 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 53757F8013E
 for <alsa-devel@alsa-project.org>; Sat,  4 Jan 2020 00:34:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 53757F8013E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="AdDUVBka"
Received: by mail-pg1-x544.google.com with SMTP id q127so24064960pga.4
 for <alsa-devel@alsa-project.org>; Fri, 03 Jan 2020 15:34:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ecAAqTTQEDsJhq1d+GQeh/so67WQS1s8AlS7zowLxCI=;
 b=AdDUVBkafB2Jykix7nUumiXV1CiNDBqmBeYyBep89Myp/9vTmDXDTP8YK6sGJU2M2Q
 gazpp1k/0A6raFhM9Fa4iaTx5CqTyZ258tiCmbY+qWjIQvtf5K4yzwZHZI6nEOVyduJf
 4LWp5dG34vdq0C9gMX2sAsYtXVYTNhSXjvCb4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ecAAqTTQEDsJhq1d+GQeh/so67WQS1s8AlS7zowLxCI=;
 b=eMf1tcvbymSerOJg8Qb3WGQfQGZfO4LIkJj6/JorbxDjhcUoqzShfLqjKR8gGF+cmk
 3OAkQsGKnAhTn3lrVLYBqzrh/X6ra9d+5Qgo+EZbs2UUz9iRVegBL5PgyOfd57Gf6pY9
 Uwu+tOw5+KxK0M8xOdZI+8x3aHp0VGrTc+5K3YRTq2ccu+WivTguR2cVu601QPS6CkQO
 6llEx+PkbeLQO6zbKCmMcmXm2/VAVs0qNUcwMGZ98pxKcWIV/VVuO4GcXqytPejHDycl
 4Y8nmYHY/POwX8Zp89T5DDXYURC+2E5UQtyyXgROz8DpSpnjiiiF7IlN78l+l3zuZ2KQ
 tU3w==
X-Gm-Message-State: APjAAAWnx2zM4s/o+4IHLELc/lrQq0CvSXDYlfuZSkmhBW7GLn1YVYsN
 muyGFxS7+XhXBMq+Nj7QNwDM0GN/kQ==
X-Google-Smtp-Source: APXvYqzuQCZ+dSfjMG6Sy3Rt29INVsCzEfqR56eOT09vzs9UnB6kn5FBS2tna+tZehGRTT44CkfFAQ==
X-Received: by 2002:a62:a515:: with SMTP id v21mr98240158pfm.128.1578094482563; 
 Fri, 03 Jan 2020 15:34:42 -0800 (PST)
Received: from localhost ([2620:15c:202:201:c87a:31ae:9107:f63d])
 by smtp.gmail.com with ESMTPSA id j125sm67774804pfg.160.2020.01.03.15.34.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Jan 2020 15:34:42 -0800 (PST)
From: Curtis Malainey <cujomalainey@chromium.org>
To: alsa-devel@alsa-project.org
Date: Fri,  3 Jan 2020 15:34:00 -0800
Message-Id: <20200103233401.160654-1-cujomalainey@chromium.org>
X-Mailer: git-send-email 2.24.1.735.g03f4e72817-goog
MIME-Version: 1.0
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Ben Zhang <benzh@chromium.org>, Jie Yang <yang.jie@linux.intel.com>,
 Takashi Iwai <tiwai@suse.com>, Pan Xiuli <xiuli.pan@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Alexios Zavras <alexios.zavras@intel.com>, Mark Brown <broonie@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Curtis Malainey <cujomalainey@chromium.org>,
 Thomas Gleixner <tglx@linutronix.de>
Subject: [alsa-devel] [PATCH] ASoC: bdw-rt5677: add spi driver compile
	switches
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

If the SPI driver is not compiled in then the RT5677_SPI driver will not
be included as well which will cause the bdw-rt5677 driver to fail to
probe since the DSP components are managed by the RT5677_SPI driver. The
solution is to remove them when the driver is not present as part of the
build.

Signed-off-by: Curtis Malainey <cujomalainey@chromium.org>
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
CC: Pan Xiuli <xiuli.pan@linux.intel.com>
---
 sound/soc/intel/boards/bdw-rt5677.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/sound/soc/intel/boards/bdw-rt5677.c b/sound/soc/intel/boards/bdw-rt5677.c
index 2af8e5a62da84..d5ded2c545d2c 100644
--- a/sound/soc/intel/boards/bdw-rt5677.c
+++ b/sound/soc/intel/boards/bdw-rt5677.c
@@ -74,11 +74,13 @@ static const struct snd_soc_dapm_route bdw_rt5677_map[] = {
 	/* CODEC BE connections */
 	{"SSP0 CODEC IN", NULL, "AIF1 Capture"},
 	{"AIF1 Playback", NULL, "SSP0 CODEC OUT"},
+#if IS_ENABLED(CONFIG_SND_SOC_RT5677_SPI)
 	{"DSP Capture", NULL, "DSP Buffer"},
 
 	/* DSP Clock Connections */
 	{ "DSP Buffer", NULL, "SSP0 CODEC IN" },
 	{ "SSP0 CODEC IN", NULL, "DSPTX" },
+#endif
 };
 
 static const struct snd_kcontrol_new bdw_rt5677_controls[] = {
@@ -319,6 +321,7 @@ static struct snd_soc_dai_link bdw_rt5677_dais[] = {
 		SND_SOC_DAILINK_REG(fe, dummy, platform),
 	},
 
+#if IS_ENABLED(CONFIG_SND_SOC_RT5677_SPI)
 	/* Non-DPCM links */
 	{
 		.name = "Codec DSP",
@@ -326,6 +329,7 @@ static struct snd_soc_dai_link bdw_rt5677_dais[] = {
 		.ops = &bdw_rt5677_dsp_ops,
 		SND_SOC_DAILINK_REG(dsp),
 	},
+#endif
 
 	/* Back End DAI links */
 	{
-- 
2.24.1.735.g03f4e72817-goog

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
