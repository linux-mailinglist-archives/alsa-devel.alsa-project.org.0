Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 305C6F0B86
	for <lists+alsa-devel@lfdr.de>; Wed,  6 Nov 2019 02:16:31 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 914E616F2;
	Wed,  6 Nov 2019 02:15:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 914E616F2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1573002990;
	bh=dw+1V5FwJ/4CbLfnplH1rMCuCDc6Z4uZtRkUebzEob8=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=m7Fz/CLT0HWOd8IhKJg3TBZZkx93Z6yqh7Xbmx7s5or880pgZ7YtgWSdcCEo+2TI4
	 Wh9uCnzKuT1aPBpkhgendWljUcErmACUvh5AdZHM+46AiBA4qLd359SJXkjUoZqfdu
	 pDlRodJa18qmQG5KsXb5Z1QYvqQtYK/XTPs3ANdE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BFAA6F805FE;
	Wed,  6 Nov 2019 02:14:03 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 90D6DF805FF; Wed,  6 Nov 2019 02:14:00 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B5014F80535
 for <alsa-devel@alsa-project.org>; Wed,  6 Nov 2019 02:13:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B5014F80535
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="K/w05RpB"
Received: by mail-pf1-x441.google.com with SMTP id c184so17530477pfb.0
 for <alsa-devel@alsa-project.org>; Tue, 05 Nov 2019 17:13:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ixe1xd6/IFXLwB1j1yCq5eWDbgA2Z38SjnHHpEfLceI=;
 b=K/w05RpBeWOOP8Sf1NEcym1VGDwAuRsMwGrzsm9FW7Xbw+cP6PMz5mgCpZ0tlOqGdD
 Nb4loxJs+Twop6UEHAPyyLYKhTU1MRaw85d/uqcmtxTLAs0rxRTVHl7pYRB0HyBNWgxu
 mzbFLNQ+AYdgRn5X+6j5GB+qgOOxchL9IvX34=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ixe1xd6/IFXLwB1j1yCq5eWDbgA2Z38SjnHHpEfLceI=;
 b=MZMZ/TrZGrb6sGAX6JHs2dMteeeOwunMUzXYwyA3YVEtbMdQK93velb2pumXqmH77/
 x44rMHlgwgGfIcD93YlnfrikodLIji+B6w2V/ytHGjORxQWwn2ne7m7TMjg1vsLLOYp4
 /hABKLakeBFG+XNxDuf+9j0uKwyDiMcTsrNYTSvu40d7pHHWLikz15m4f/KE+2ker/7n
 eBmgEVhLD29jTCUqetTuKi/bo4kRsAGSuwiypXrxXwkb4t9y9Evy8B3tqeVqHhAaPUEH
 n61aMzfmhfeOTB+68NfmAmHp0MiIYBwfkG+1rH7R5TmupRrsAC2Sy6LhgRlT67tzC9f7
 pjIA==
X-Gm-Message-State: APjAAAX6VQBQJ3nE2zZP0RthDkVrJ6Rd85RwjPfz6H8LzXkhWOlvhWPX
 4PJzHKu0hOnoqmkKiZKcp5WbbSd5cvpV
X-Google-Smtp-Source: APXvYqwwdAN/Oxw1RrhP+PbgedpqIAliM8xeV5MLRlNPbO/jdC1sSGhGIdP8nOIIQJPZ3TnS43n43g==
X-Received: by 2002:a17:90a:c306:: with SMTP id g6mr85240pjt.38.1573002835498; 
 Tue, 05 Nov 2019 17:13:55 -0800 (PST)
Received: from localhost ([2620:15c:202:201:c87a:31ae:9107:f63d])
 by smtp.gmail.com with ESMTPSA id y14sm25084278pff.69.2019.11.05.17.13.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Nov 2019 17:13:54 -0800 (PST)
From: Curtis Malainey <cujomalainey@chromium.org>
To: alsa-devel@alsa-project.org
Date: Tue,  5 Nov 2019 17:13:27 -0800
Message-Id: <20191106011335.223061-3-cujomalainey@chromium.org>
X-Mailer: git-send-email 2.24.0.rc1.363.gb1bccd3e3d-goog
In-Reply-To: <20191106011335.223061-1-cujomalainey@chromium.org>
References: <20191106011335.223061-1-cujomalainey@chromium.org>
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
Subject: [alsa-devel] [PATCH v3 02/11] ASoC: bdw-rt5677: Add a DAI link for
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
index 4a4d3353e26d..eeb9a11e4e14 100644
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
2.24.0.rc1.363.gb1bccd3e3d-goog

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
