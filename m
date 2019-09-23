Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B2E8BB99D
	for <lists+alsa-devel@lfdr.de>; Mon, 23 Sep 2019 18:31:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 929EC16A1;
	Mon, 23 Sep 2019 18:30:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 929EC16A1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1569256302;
	bh=Ojqg3k2egX0VeGH9X0BYPazpL2dd0E9KE+pkEgFUsyo=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=OuT0YKFBtA0LdHpZ3ebwyaDcLP45iuLolt8zNVXI5KddD2bQQYjKlSuh5gLlQQtqu
	 R9P8hV2mmiu0E2QGhnrRVulH9AbCQfHjmfTBtRAmp+t1FbOs7vDjljoHRoK04i3Cym
	 pz3CnU12zpuP73ofWsoNSEnpdb6VnIZSNIi9l5gY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AC7F7F8044C;
	Mon, 23 Sep 2019 18:29:57 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0EC69F8044C; Mon, 23 Sep 2019 18:29:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 18EACF802BD
 for <alsa-devel@alsa-project.org>; Mon, 23 Sep 2019 18:29:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 18EACF802BD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="XlvLPuZJ"
Received: by mail-pl1-x643.google.com with SMTP id y10so5415052plp.2
 for <alsa-devel@alsa-project.org>; Mon, 23 Sep 2019 09:29:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=UIQLE/TpeP0HNhlfy3lZ1lxjb/GhF1u9ggZXik+vAmU=;
 b=XlvLPuZJavyiPOcfVx827wot/20NwTXrHE4BD4Nakg2I6XGoYlP9HvLTQBW8nNpV6y
 B/yPd6PqLET2yp8IKUKnWjCeC3rdEaxGjLhmit3yM+4I2rtZOKKgG4fiqf5Uy/AAi5ov
 NbecdsQQ9xyUbFDDzBjphvglyA6bH74dFlR0Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=UIQLE/TpeP0HNhlfy3lZ1lxjb/GhF1u9ggZXik+vAmU=;
 b=Gbuy6pFtcr64BdP8Rr3ONDiZ42kMX97Xe+mkaaDLHG8A8KbA3HdxCmNHoSaJf6UoFK
 7/KoXanWAfEuo29A5M2BURcuPazaTU/U7X24b27Ppce4Gb2Ph9cd3cAnU8d7R3cym6/v
 pJvIO806+yffiNnnpoBtg/n8kA8L/3eqKKVgQqBAZpaQin1DmEP9fu6skyN+StqvmwvK
 Nt7HKlJV+FzH0zVYndOWC158a603yuhkWOiiM5EopuW2wL5NAZPlqlfWUcyE8itosCDd
 ZpWRt8rURH8lRgoa6jwVI8yK18CGb9aeJXCGOIrpMc1n7swgr4W6hUZEGYQ3dU5FQMWd
 YUHQ==
X-Gm-Message-State: APjAAAXIKxmRLlpfwAtptxJpkEy6xIK6pThwTGmEMCVdwcA3vrNnuUKp
 R2DbGaSD+xJsjM3g/x4Y1cKmSg==
X-Google-Smtp-Source: APXvYqwRngXV+UwA72WqOEFbZ2k5d969GaGRonb02UkUYlpokXoz7LNon/OVIE/CS/DX3WXOO3K9ow==
X-Received: by 2002:a17:902:fe81:: with SMTP id x1mr635679plm.66.1569256190787; 
 Mon, 23 Sep 2019 09:29:50 -0700 (PDT)
Received: from localhost ([2401:fa00:1:10:845f:e35d:e30c:4b47])
 by smtp.gmail.com with ESMTPSA id c11sm13677254pfj.114.2019.09.23.09.29.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Sep 2019 09:29:49 -0700 (PDT)
From: Yu-Hsuan Hsu <yuhsuan@chromium.org>
To: linux-kernel@vger.kernel.org
Date: Tue, 24 Sep 2019 00:29:40 +0800
Message-Id: <20190923162940.199580-1-yuhsuan@chromium.org>
X-Mailer: git-send-email 2.23.0.351.gc4317032e6-goog
MIME-Version: 1.0
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Takashi Iwai <tiwai@suse.com>, Jie Yang <yang.jie@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Tzung-Bi Shih <tzungbi@google.com>, Mark Brown <broonie@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, alsa-devel@alsa-project.org,
 Yu-Hsuan Hsu <yuhsuan@chromium.org>
Subject: [alsa-devel] [PATCH v2] ASoC: Intel: kbl_rt5663_rt5514_max98927:
	Add dmic format constraint
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

On KBL platform, the microphone is attached to external codec(rt5514)
instead of PCH. However, TDM slot between PCH and codec is 16 bits only.
In order to avoid setting wrong format, we should add a constraint to
force to use 16 bits format forever.

Signed-off-by: Yu-Hsuan Hsu <yuhsuan@chromium.org>
---
I have updated the commit message. Please see whether it is clear
enough. Thanks.
 sound/soc/intel/boards/kbl_rt5663_rt5514_max98927.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/sound/soc/intel/boards/kbl_rt5663_rt5514_max98927.c b/sound/soc/intel/boards/kbl_rt5663_rt5514_max98927.c
index 74dda8784f1a01..67b276a65a8d2d 100644
--- a/sound/soc/intel/boards/kbl_rt5663_rt5514_max98927.c
+++ b/sound/soc/intel/boards/kbl_rt5663_rt5514_max98927.c
@@ -400,6 +400,9 @@ static int kabylake_dmic_startup(struct snd_pcm_substream *substream)
 	snd_pcm_hw_constraint_list(runtime, 0, SNDRV_PCM_HW_PARAM_CHANNELS,
 			dmic_constraints);
 
+	runtime->hw.formats = SNDRV_PCM_FMTBIT_S16_LE;
+	snd_pcm_hw_constraint_msbits(runtime, 0, 16, 16);
+
 	return snd_pcm_hw_constraint_list(substream->runtime, 0,
 			SNDRV_PCM_HW_PARAM_RATE, &constraints_rates);
 }
-- 
2.23.0.351.gc4317032e6-goog

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
