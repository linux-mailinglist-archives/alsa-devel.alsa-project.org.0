Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EB78B06C5
	for <lists+alsa-devel@lfdr.de>; Thu, 12 Sep 2019 04:30:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ADDB416F8;
	Thu, 12 Sep 2019 04:29:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ADDB416F8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1568255411;
	bh=zhLJlRlQfbNKCB/hHjwU+Sk7ZhucK6PKoUc/wx16m/U=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=kSFA52TZhg/88bwIvEOwop2b6gvJKKljn1UFAYb+OKYFQp3apoASw/Kl2o0d6d/Ie
	 E7EEW239/+bPyCRGhATHWMU4svXbJIswenpPf4gS7PGtIHnV51O7fQDcs/58b1RDdY
	 e5i5jGnjviivFX7yZOHS/5dTqStS5UWTTrJrabME=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DD1CEF8036F;
	Thu, 12 Sep 2019 04:28:26 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CC927F80368; Thu, 12 Sep 2019 04:28:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4FD14F80143
 for <alsa-devel@alsa-project.org>; Thu, 12 Sep 2019 04:28:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4FD14F80143
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="mLbAumr3"
Received: by mail-pf1-x444.google.com with SMTP id d15so14905306pfo.10
 for <alsa-devel@alsa-project.org>; Wed, 11 Sep 2019 19:28:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=717l4cD4Wzf0xH5nDJTl15ClpUuQOFo2fyYpt1Q/w+k=;
 b=mLbAumr3DrZozScwMs30++F+mc9LHyzJ1lI4nMTznNNyIfv8T3I92qVVOQ8PuMD+O1
 yKJGaeibE3xja5CAapYuI2Pa851bdGq+UEXTP+xyeeW9V7gieFN0dsE5RWKeTUi9Azgt
 RiBIxCQWng9eeHY5ruYHNqm+jPmq4OvTg8+ug=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=717l4cD4Wzf0xH5nDJTl15ClpUuQOFo2fyYpt1Q/w+k=;
 b=em2B1/Emb/u/S3j9hmC415OprkyKR/OsQSL5qB9YDRfWsggtFQMAshAg/B4H3LqqUt
 RUHWxsLexZ95PJsMuUuBBQ9VpKPuGbPkv1Dg2djoqqBXlsKAfaR+7BMyOiPJjvqUXGW8
 WrkG0Q5IFDWD4b/OPTl/c7iavKfRvZiG6gAEenYiGQKerPWKsr8d49oiXz4RkBlOYjc/
 AYZ/JzVzJG9vXtws8nOsw0XemBE/8BJh0vb5x0Dq27RWahxv2ZqtQNO7CD/Y2zPPvjlH
 RQvjJU04lEXgiWYQ11LoDAKxPx2h5XOLUG7Ij/mllyP2LmrrCIDJmooOdgyCDnoyqkB4
 S0vA==
X-Gm-Message-State: APjAAAV2G31Tmn8CY1WtDi+XjhOWsw+8R15e4mK1w4vrCVePLJIWZOG1
 CwrV97qbFHFokUlgf0PVFV8crA==
X-Google-Smtp-Source: APXvYqxnYzuJHmTquTSzntnrHY/YlhYcc4fT7VV9owd91fu47KgRLpUA0jzIxdr/7Kj9nG/lAQhP6Q==
X-Received: by 2002:a63:ad49:: with SMTP id y9mr343398pgo.30.1568255291271;
 Wed, 11 Sep 2019 19:28:11 -0700 (PDT)
Received: from localhost ([2401:fa00:1:10:845f:e35d:e30c:4b47])
 by smtp.gmail.com with ESMTPSA id e21sm7539616pgr.43.2019.09.11.19.28.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Sep 2019 19:28:10 -0700 (PDT)
From: Yu-Hsuan Hsu <yuhsuan@chromium.org>
To: linux-kernel@vger.kernel.org
Date: Thu, 12 Sep 2019 10:27:40 +0800
Message-Id: <20190912022740.161798-1-yuhsuan@chromium.org>
X-Mailer: git-send-email 2.23.0.162.g0b9fbb3734-goog
MIME-Version: 1.0
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Takashi Iwai <tiwai@suse.com>, Jie Yang <yang.jie@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Tzung-Bi Shih <tzungbi@google.com>, Mark Brown <broonie@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, alsa-devel@alsa-project.org,
 Yu-Hsuan Hsu <yuhsuan@chromium.org>
Subject: [alsa-devel] [PATCH] ASoC: Intel: kbl_rt5663_rt5514_max98927: Add
	dmic format constraint
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

24 bits recording from DMIC is not supported for KBL platform because
the TDM slot between PCH and codec is 16 bits only. We should add a
constraint to remove that unsupported format.

Signed-off-by: Yu-Hsuan Hsu <yuhsuan@chromium.org>
---
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
2.23.0.162.g0b9fbb3734-goog

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
