Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D96A1DCFC1
	for <lists+alsa-devel@lfdr.de>; Fri, 18 Oct 2019 22:08:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6C03115E2;
	Fri, 18 Oct 2019 22:07:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6C03115E2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1571429325;
	bh=5XhF6idFbwqN+fBPatCtbFqzYw8h2Jxmwgm4WvKWeB0=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=J250NaDhItBThn2DEGCYoLwoWW1ebcrVmMeW5BkTAtqJAN82uQCwYjkqE33wWkrXe
	 90KXdglUNFqB6i6MS7xEcDhi32BVOG+BvPEokbZ0II+0q+82fZJKVrJqHpNJHMQNnU
	 ASHIOd6sIuF53SIjSPqqvEYv0rTURTNkhUd2u8Vg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0FBB8F805FA;
	Fri, 18 Oct 2019 22:05:19 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A77FAF80633; Fri, 18 Oct 2019 22:05:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F3CD3F8060D
 for <alsa-devel@alsa-project.org>; Fri, 18 Oct 2019 22:05:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F3CD3F8060D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="RhoJI0kb"
Received: by mail-pf1-x444.google.com with SMTP id y5so4514613pfo.4
 for <alsa-devel@alsa-project.org>; Fri, 18 Oct 2019 13:05:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0/0t86VmlmsJ+s+jfeC96BKU3vsDP4S3mozuKdo/LEY=;
 b=RhoJI0kb5cgmH+hJTiQ9TWUzDCOLsA+bVJChZRQOfGa+PK3iVSxfxbjAzEdC4QOhDP
 F41HwoCwOfQ3Rs6K9EybL9hChY5nbYlZDvzZU5OIGhnEB7RzGSdCH36VYB3Q+Gw3bLmA
 5N4Z9b8pbBOEhPSy5j/F7GqaDKhpGAEOXuzJY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0/0t86VmlmsJ+s+jfeC96BKU3vsDP4S3mozuKdo/LEY=;
 b=GMPA/oxRHMGaXtecLjgnGdZsksXWN+UPxX2zRFtPJz8B7EFTce42IH/3zToAyI8CS7
 cAFIIpQ5WgZR+pdB32v3IMatka9VTHuxsgKNk5MvoDabOjYe0aA8fXDeX/aoPbqllcEc
 Me0xU2pp8IBUR90HDhBxF3iimNqM0jWIYtmvUgYaXeFRciPL339FMeXutmyl47wAAmlK
 2tiNbzh9Gh1yzKr4Y5r82hoibhQDE+hdZ0mMzpTDSQBHw2AS1GrXDr9xGmNWMg3s55rh
 hubYrea+61eqdKG6v/A9M3wB/uxd/yxkvyqdT4NomRwG0gbJg8kydXu7rm6yjQREqSPu
 RHPQ==
X-Gm-Message-State: APjAAAWfRfXjh0xzCje+lqcKCDQpvVnUveOg5kvsGMHMnhyqvPqo9eUk
 PJl5UuR3J5Bndrp8vDYnLJfIIlAKBbtO
X-Google-Smtp-Source: APXvYqwK9JRPG6wkduSVrlfzj1yLoVHbA4hjImXNLguHy+g4Hs8elhj6cX1lmdtEzU5HmS8aiEW+GA==
X-Received: by 2002:aa7:874f:: with SMTP id g15mr8736602pfo.175.1571429107987; 
 Fri, 18 Oct 2019 13:05:07 -0700 (PDT)
Received: from localhost ([2620:15c:202:201:c87a:31ae:9107:f63d])
 by smtp.gmail.com with ESMTPSA id f89sm6690103pje.20.2019.10.18.13.05.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 18 Oct 2019 13:05:07 -0700 (PDT)
From: Curtis Malainey <cujomalainey@chromium.org>
To: alsa-devel@alsa-project.org
Date: Fri, 18 Oct 2019 13:04:40 -0700
Message-Id: <20191018200449.141123-4-cujomalainey@chromium.org>
X-Mailer: git-send-email 2.23.0.866.gb869b98d4c-goog
In-Reply-To: <20191018200449.141123-1-cujomalainey@chromium.org>
References: <20191018200449.141123-1-cujomalainey@chromium.org>
MIME-Version: 1.0
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Alexios Zavras <alexios.zavras@intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Takashi Iwai <tiwai@suse.com>,
 Jie Yang <yang.jie@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Ben Zhang <benzh@chromium.org>, Mark Brown <broonie@kernel.org>,
 Curtis Malainey <cujomalainey@chromium.org>,
 Thomas Gleixner <tglx@linutronix.de>
Subject: [alsa-devel] [PATCH v2 03/12] ASoC: bdw-rt5677: Add a DAI link for
	rt5677 SPI PCM device
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

From: Ben Zhang <benzh@chromium.org>

This link is needed for the RT5677 DSP to do hotwording

Signed-off-by: Ben Zhang <benzh@chromium.org>
Signed-off-by: Curtis Malainey <cujomalainey@chromium.org>
---
 sound/soc/intel/boards/bdw-rt5677.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/sound/soc/intel/boards/bdw-rt5677.c b/sound/soc/intel/boards/bdw-rt5677.c
index 4a4d3353e26df..eeb9a11e4e14d 100644
--- a/sound/soc/intel/boards/bdw-rt5677.c
+++ b/sound/soc/intel/boards/bdw-rt5677.c
@@ -74,6 +74,7 @@ static const struct snd_soc_dapm_route bdw_rt5677_map[] = {
 	/* CODEC BE connections */
 	{"SSP0 CODEC IN", NULL, "AIF1 Capture"},
 	{"AIF1 Playback", NULL, "SSP0 CODEC OUT"},
+	{"DSP Capture", NULL, "DSP Buffer"},
 };
 
 static const struct snd_kcontrol_new bdw_rt5677_controls[] = {
@@ -258,6 +259,12 @@ SND_SOC_DAILINK_DEF(platform,
 SND_SOC_DAILINK_DEF(be,
 	DAILINK_COMP_ARRAY(COMP_CODEC("i2c-RT5677CE:00", "rt5677-aif1")));
 
+/* Wake on voice interface */
+SND_SOC_DAILINK_DEFS(dsp,
+	DAILINK_COMP_ARRAY(COMP_CPU("spi-RT5677AA:00")),
+	DAILINK_COMP_ARRAY(COMP_CODEC("i2c-RT5677CE:00", "rt5677-dspbuffer")),
+	DAILINK_COMP_ARRAY(COMP_PLATFORM("spi-RT5677AA:00")));
+
 static struct snd_soc_dai_link bdw_rt5677_dais[] = {
 	/* Front End DAI links */
 	{
@@ -276,6 +283,13 @@ static struct snd_soc_dai_link bdw_rt5677_dais[] = {
 		SND_SOC_DAILINK_REG(fe, dummy, platform),
 	},
 
+	/* Non-DPCM links */
+	{
+		.name = "Codec DSP",
+		.stream_name = "Wake on Voice",
+		SND_SOC_DAILINK_REG(dsp),
+	},
+
 	/* Back End DAI links */
 	{
 		/* SSP0 - Codec */
-- 
2.23.0.866.gb869b98d4c-goog

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
