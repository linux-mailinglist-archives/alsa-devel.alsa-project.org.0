Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D98CD23B18C
	for <lists+alsa-devel@lfdr.de>; Tue,  4 Aug 2020 02:07:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0E4F61667;
	Tue,  4 Aug 2020 02:06:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0E4F61667
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1596499648;
	bh=c0xPEnpHIjKK5s/FvMEYVEq36KsICI2mh/oHHME9pDw=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fp4wTs98ykidy4gsOaf558ND/hPmpgL/M/q9eeLfly+5vAWYOv35Q+Dox4cTAggfZ
	 HeRMzYKNtwNwJzo7aW06wHOC9M4+0pzXC1OW0IwqIEQ/k4/VTi/erzMyc8G2G3X0Iz
	 mW9Bv/AGrvDSH8x7fR4NPS6XJ40twlxE9+5RRaN8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 20924F80249;
	Tue,  4 Aug 2020 02:05:47 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4A8E7F80249; Tue,  4 Aug 2020 02:05:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 16968F801F7
 for <alsa-devel@alsa-project.org>; Tue,  4 Aug 2020 02:05:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 16968F801F7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="m7JUSxo2"
Received: by mail-pl1-x643.google.com with SMTP id p1so21878365pls.4
 for <alsa-devel@alsa-project.org>; Mon, 03 Aug 2020 17:05:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=y16Y9VzNG9qM+J0oXaRKcTXEkcxRSQyUjMcg0sQqDX0=;
 b=m7JUSxo2z9T38XvDBBSMBw1xudjbDt7oA4PQIt4hL6CSScE3oqLtdvilgE1ZxTrkxw
 47CMo04qMxEQHssTIVp688HGv2GZX5XgmSD6ZB+R6CAEqc7TduZ8x9ijI5otvWJ24avG
 4G/H/VJFnoAQ9grSOdfJ49KklJyLN0NzKZgrY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=y16Y9VzNG9qM+J0oXaRKcTXEkcxRSQyUjMcg0sQqDX0=;
 b=ZLLAOUDIonZRAt9sQ0AVKvxN3xLCkMS2LnMhTh03qcULVQvtwLOvxLl3Y2yJTXm6At
 FfTyUKMgBLTc8Y3jtwcz3Aw9tV5g6ubqeKDhlGl4OPfF94UspWs9e8dwQiAUwVqZgTaw
 ddFUhbYem+JqPzEyH+H4SkhjbRvXWxqORk09U7uhjRKKwDdZzMw32eqTber88Gn1ZlJ0
 7GcQ/CYixF/i8crkjZu2ImBxWnx8jvX2OetvMoJGoMylfCX/iwl2FHZCm5GfVN/0mRh8
 LVIGkHEVcjw3doY+N+paLOO7QoKCO1gEpihcqbwlM3wpJdPV6h2P4VGXRARkAAc7raS+
 Rzug==
X-Gm-Message-State: AOAM5300McxSA2Obdr7ft6YPrnTN2ZoonKrMTJD/2JKTUl8sHTWkr8P2
 kwFCQ479IgCwBvNlFvbFz0Xyyw==
X-Google-Smtp-Source: ABdhPJxx5w0TAv0orspB1pOK9CJb492TY2RPzdXrRojGdVXlfSbiBzq9AcCqxuS4HsoSMxslIgTPxw==
X-Received: by 2002:a17:90a:4e89:: with SMTP id
 o9mr1813122pjh.178.1596499533330; 
 Mon, 03 Aug 2020 17:05:33 -0700 (PDT)
Received: from smtp.gmail.com ([2620:15c:202:1:3e52:82ff:fe6c:83ab])
 by smtp.gmail.com with ESMTPSA id e28sm12332756pfl.124.2020.08.03.17.05.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Aug 2020 17:05:32 -0700 (PDT)
From: Stephen Boyd <swboyd@chromium.org>
To: Mark Brown <broonie@kernel.org>,
	Oder Chiou <oder_chiou@realtek.com>
Subject: [PATCH 1/3] ASoC: rt5682: Use dev_dbg() in rt5682_clk_check()
Date: Mon,  3 Aug 2020 17:05:29 -0700
Message-Id: <20200804000531.920688-2-swboyd@chromium.org>
X-Mailer: git-send-email 2.28.0.163.g6104cc2f0b6-goog
In-Reply-To: <20200804000531.920688-1-swboyd@chromium.org>
References: <20200804000531.920688-1-swboyd@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Takashi Iwai <tiwai@suse.com>,
 linux-kernel@vger.kernel.org, Shuming Fan <shumingf@realtek.com>,
 Cheng-Yi Chiang <cychiang@chromium.org>
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

I see a spew of "sysclk/dai not set correctly" whenever I cat
/sys/kernel/debug/clk/clk_summary on my device. This is because the
master pointer isn't set yet in this driver. A user isn't going to be
able to do much if this check is failing so this error message isn't
really an error, it's more of a kernel debug message. Lower the priority
to dev_dbg() so that it isn't so noisy.

Cc: Cheng-Yi Chiang <cychiang@chromium.org>
Cc: Shuming Fan <shumingf@realtek.com>
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---
 sound/soc/codecs/rt5682.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/rt5682.c b/sound/soc/codecs/rt5682.c
index fab066a75ce0..ed9475f24aec 100644
--- a/sound/soc/codecs/rt5682.c
+++ b/sound/soc/codecs/rt5682.c
@@ -2482,7 +2482,7 @@ static int rt5682_set_bias_level(struct snd_soc_component *component,
 static bool rt5682_clk_check(struct rt5682_priv *rt5682)
 {
 	if (!rt5682->master[RT5682_AIF1]) {
-		dev_err(rt5682->component->dev, "sysclk/dai not set correctly\n");
+		dev_dbg(rt5682->component->dev, "sysclk/dai not set correctly\n");
 		return false;
 	}
 	return true;
-- 
Sent by a computer, using git, on the internet

