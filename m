Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 59F3D2FF27C
	for <lists+alsa-devel@lfdr.de>; Thu, 21 Jan 2021 18:53:36 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DA2C8190B;
	Thu, 21 Jan 2021 18:52:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DA2C8190B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1611251616;
	bh=ib6UZDOA9xp6Yp+LXmzKvkLWDP2CqqiBn8Uerzggbdw=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Ig3XOzOU0p5FabmLU773xWzWVOJ06tfH5w60dXxdyrw9immtRnDukgdeoWKY+QlHj
	 a3VCaXxCwqT5acybMEHNPkLyE8Rs0RKgwBrEJQI9uTVBUE3hEz58dKainwAbnA9qwy
	 0VnFEYScnziNaQBGVKcPgHPc/3SsHYH2gyZYU+f0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4FCA4F8026A;
	Thu, 21 Jan 2021 18:52:03 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 37CFCF8026A; Thu, 21 Jan 2021 18:52:01 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 62CA9F80162
 for <alsa-devel@alsa-project.org>; Thu, 21 Jan 2021 18:51:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 62CA9F80162
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="cuSirrQ1"
Received: by mail-ed1-x52f.google.com with SMTP id dj23so3481011edb.13
 for <alsa-devel@alsa-project.org>; Thu, 21 Jan 2021 09:51:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=OCYYVMv5s714jVuwCabaovHSIiuYo1Mak9GI7N7bfpA=;
 b=cuSirrQ1oaAAyphXl4bCIjli2fQoncNhitI0+YSQr3brIfsbP9VbBs3jzssRkA++JE
 LG1K19NciHMQYyvSknHr5rL/fS73Lz6NxQ8nGH+Nb+j2A/pHWblY+1UbzpLedlTywnSI
 ZxPmTnpt0Py/TXigz0VWFJxdtIKfzBpfQdwjc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OCYYVMv5s714jVuwCabaovHSIiuYo1Mak9GI7N7bfpA=;
 b=Nmu1RnMFYAozgUq+kZrsuYM183x+korNNuKVeqU9li0mMEWL7zEGv7ZXoF+KAaTeAo
 YQ1JS3g+dwtnkIiwvUumAh/3MsoBQwqQEUwYLKUbs8eHTIPvj9tm+dvvOttNC54XH4ss
 fwAfqnoHd1Qfanilddg00gx18qVlyxbx7c3Of8qQiCTE9vm8HTgAh6VPEz2p7oMvsI0D
 s8n4XhnF9cXpC6HvkpSO+AssuSRYSQHWJ+e1K+ujVXj3bPlVR0xn35Go97/2TBaHfUFv
 X3EOwHqiZ/gFwguwPu9+B3O2Ff+nE1me2owyJlktnJ00L6SZmMTVJy2p+lYooOSGZze7
 N41A==
X-Gm-Message-State: AOAM530EyPasdH31BRB4tcOt9UXxb8Jz4QTbPVF8GQsEKgBIy08EWiKx
 +4tTgWsnkiurXFzapN48iT+8PA==
X-Google-Smtp-Source: ABdhPJyAt+sWJ5YT6v7cdGLKqc6+7CG9j6StKNytrRLmmdUplw06fy1GOc3aYmBcNgxFrk+wwAdvSw==
X-Received: by 2002:a05:6402:1249:: with SMTP id
 l9mr201913edw.375.1611251514174; 
 Thu, 21 Jan 2021 09:51:54 -0800 (PST)
Received: from alco.lan ([80.71.134.83])
 by smtp.gmail.com with ESMTPSA id w16sm3232349edv.4.2021.01.21.09.51.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Jan 2021 09:51:53 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Jie Yang <yang.jie@linux.intel.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Mateusz Gorski <mateusz.gorski@linux.intel.com>,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Lukasz Majczak <lma@semihalf.com>
Subject: [PATCH v3 2/2] ASoC: Intel: Skylake: Zero snd_ctl_elem_value
Date: Thu, 21 Jan 2021 18:51:51 +0100
Message-Id: <20210121175151.139111-2-ribalda@chromium.org>
X-Mailer: git-send-email 2.30.0.296.g2bfb1c46d8-goog
In-Reply-To: <20210121175151.139111-1-ribalda@chromium.org>
References: <20210121175151.139111-1-ribalda@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Ricardo Ribalda <ribalda@chromium.org>
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

Clear struct snd_ctl_elem_value before calling ->put() to avoid any data
leak.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Reviewed-by: Cezary Rojewski <cezary.rojewski@intel.com>
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 sound/soc/intel/skylake/skl-topology.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/intel/skylake/skl-topology.c b/sound/soc/intel/skylake/skl-topology.c
index ffd37aaecdf1..76a04a883e63 100644
--- a/sound/soc/intel/skylake/skl-topology.c
+++ b/sound/soc/intel/skylake/skl-topology.c
@@ -3632,7 +3632,7 @@ static void skl_tplg_complete(struct snd_soc_component *component)
 		sprintf(chan_text, "c%d", mach->mach_params.dmic_num);
 
 		for (i = 0; i < se->items; i++) {
-			struct snd_ctl_elem_value val;
+			struct snd_ctl_elem_value val = {};
 
 			if (strstr(texts[i], chan_text)) {
 				val.value.enumerated.item[0] = i;
-- 
2.30.0.296.g2bfb1c46d8-goog

