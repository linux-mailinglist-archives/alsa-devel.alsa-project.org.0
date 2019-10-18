Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AF76DCFD2
	for <lists+alsa-devel@lfdr.de>; Fri, 18 Oct 2019 22:13:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DC2311688;
	Fri, 18 Oct 2019 22:12:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DC2311688
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1571429618;
	bh=gBDV1ej+UCmbR6KQNQv8XHMy5grdRvsAFLjSNUkFPr4=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dKuEMp53dX+IgYUKzNqvWBuht9c56IIFDBoh/Hl7tbiGTcpS4V+DsZFp/Vff/ievP
	 t/5OZxy4AMXDKicFOexis2N6NHbqt1Fts94v8uh8oVR7qZYxCqKzUJJekgkP4ph3FD
	 qduiAJPUvpYGzqDlGa7lzhhEdbZsTXqF93tzuuTA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6ED96F8070E;
	Fri, 18 Oct 2019 22:05:36 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2798BF80659; Fri, 18 Oct 2019 22:05:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AB3B1F80636
 for <alsa-devel@alsa-project.org>; Fri, 18 Oct 2019 22:05:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AB3B1F80636
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="MTMTVsW+"
Received: by mail-pl1-x643.google.com with SMTP id t10so3347291plr.8
 for <alsa-devel@alsa-project.org>; Fri, 18 Oct 2019 13:05:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fHr81ZQhbvUWZj2399KoG8my0oP+xo+Q4KJxgdH9PSg=;
 b=MTMTVsW+dQxcaMT4PCDyGXyHX7/ucZXVXKK8YeJMXUf8g5UV2VS5RG4V8Xt1UaaNUY
 BRJLC44f3+sVjRszD+HR8ko+ZKgjF8BUdG1X9eUN6m1au+YNhUEaNB5pSp06qhnTWy6l
 hMZYMlqmuLZZ4YkCq9lFRqokUdfuJVy2IF+Gg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fHr81ZQhbvUWZj2399KoG8my0oP+xo+Q4KJxgdH9PSg=;
 b=H+3W/McS3rSs4gQOBXxrw3Wm2wGm3ie1rm73FVSB+ZLfQ391Arxrg9d/pdQLhuhnGt
 lps4Jc5TMHYF8ZOX18BrC5skQADmVuaYr8KWTYFGQ7QVkPyytx6VgpFzbEI6KT1MzmW8
 uOFhSZQRqwpkTrgYMyOehjFYnWiItVj3H++Ver3pBHOLJW4g3dGFRL4ToClGnVNrrf6G
 d5/ZHgD96LH2oFWct9IQngMs0OdC183J5Ky2Enm+DVyFMPDcXWWKOUYWk31bf+iIQqIz
 bGRwiJqjqoYgoj5sOvpFU+Qa3alX/L54FqbzxY7s+Ls6M9j4ZaSh0wwwMzyzegObwRmB
 4gtw==
X-Gm-Message-State: APjAAAX/REZDsfJGGs8vUK4duT5+IUOKhMPerlLm3wFRIHvrobze+abL
 b8WIU5ym0kxwe6iUaa0v7gzsQvN6xLI/
X-Google-Smtp-Source: APXvYqy0Qv9u6jo2RfqRrLYRUXHtZY3pw/ayMvi2SeJkbA4zso5E8ZicoFaCeWji7elSMfLbcIwnZg==
X-Received: by 2002:a17:902:6b88:: with SMTP id
 p8mr11084048plk.251.1571429118764; 
 Fri, 18 Oct 2019 13:05:18 -0700 (PDT)
Received: from localhost ([2620:15c:202:201:c87a:31ae:9107:f63d])
 by smtp.gmail.com with ESMTPSA id p24sm12116692pgc.72.2019.10.18.13.05.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 18 Oct 2019 13:05:18 -0700 (PDT)
From: Curtis Malainey <cujomalainey@chromium.org>
To: alsa-devel@alsa-project.org
Date: Fri, 18 Oct 2019 13:04:47 -0700
Message-Id: <20191018200449.141123-11-cujomalainey@chromium.org>
X-Mailer: git-send-email 2.23.0.866.gb869b98d4c-goog
In-Reply-To: <20191018200449.141123-1-cujomalainey@chromium.org>
References: <20191018200449.141123-1-cujomalainey@chromium.org>
MIME-Version: 1.0
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Ben Zhang <benzh@chromium.org>, Takashi Iwai <tiwai@suse.com>,
 Jie Yang <yang.jie@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Richard Fontana <rfontana@redhat.com>, Mark Brown <broonie@kernel.org>,
 Curtis Malainey <cujomalainey@chromium.org>,
 Thomas Gleixner <tglx@linutronix.de>
Subject: [alsa-devel] [PATCH v2 10/12] ASoC: bdw-rt5677: Turn on MCLK1 for
	DSP via DAPM
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

The RT5677 DSP needs the I2S MCLK1 to run its DSP. Add a dapm route to
SSP0 CODEC IN so the clock is turned on automatically when the DSP is
turned on.

Signed-off-by: Curtis Malainey <cujomalainey@chromium.org>
---
 sound/soc/intel/boards/bdw-rt5677.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/sound/soc/intel/boards/bdw-rt5677.c b/sound/soc/intel/boards/bdw-rt5677.c
index eeb9a11e4e14d..b2475e3eff7b4 100644
--- a/sound/soc/intel/boards/bdw-rt5677.c
+++ b/sound/soc/intel/boards/bdw-rt5677.c
@@ -75,6 +75,10 @@ static const struct snd_soc_dapm_route bdw_rt5677_map[] = {
 	{"SSP0 CODEC IN", NULL, "AIF1 Capture"},
 	{"AIF1 Playback", NULL, "SSP0 CODEC OUT"},
 	{"DSP Capture", NULL, "DSP Buffer"},
+
+	/* DSP Clock Connections */
+	{ "DSP Buffer", NULL, "SSP0 CODEC IN" },
+	{ "SSP0 CODEC IN", NULL, "DSPTX" },
 };
 
 static const struct snd_kcontrol_new bdw_rt5677_controls[] = {
-- 
2.23.0.866.gb869b98d4c-goog

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
