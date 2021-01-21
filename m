Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EEDA2FF19C
	for <lists+alsa-devel@lfdr.de>; Thu, 21 Jan 2021 18:18:48 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D52A218FF;
	Thu, 21 Jan 2021 18:17:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D52A218FF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1611249523;
	bh=rsNzeOtWALehmeSa1wgwOzvO744l+gKaieiyjD0LmHo=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=sUzOwm7y6217+T/m0ZyqIUAq3iNSWKk1oI0TnMyYi7RPGYBS/dEPLZU96ihm+L6Wh
	 z69IcPVtJURCt6sgRdgAVpsIjtCm8C0cBx6DGFhLN3mcA1P4oe8O13TEPzFiudWWY0
	 PqUs0jFQ4dMjhukduNuKhWvi8Mjn5YyXfgzCw+vU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6240EF80272;
	Thu, 21 Jan 2021 18:16:57 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 163AEF80257; Thu, 21 Jan 2021 18:16:55 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AF107F80164
 for <alsa-devel@alsa-project.org>; Thu, 21 Jan 2021 18:16:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AF107F80164
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="CWn25tIi"
Received: by mail-ej1-x632.google.com with SMTP id r12so3680766ejb.9
 for <alsa-devel@alsa-project.org>; Thu, 21 Jan 2021 09:16:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=R37OwwWmnd3gx+4QWJQscKseQ469mdd6BDRuEqSONlc=;
 b=CWn25tIicWFL5R/EoP0Lw4d3jigOs6L3lg+H8SEmtOHGMseHtmldYRKeFKZ4IZZPFI
 FbX562x4NKV151mntW0uUcYzfQm7qac71gge153zpsQH6FIr5EtA5YBEBr412WLSwoFP
 ucz1a79Zr9a8/QFF/N0/vZt2L6smCUZGQAxi0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=R37OwwWmnd3gx+4QWJQscKseQ469mdd6BDRuEqSONlc=;
 b=nfPBI+/liWmxKtq9akesHrTXNo1m652MMCC4FVh8JoplLrSwR+uFPLpsN8RadAUDFT
 au6DZEkmUZZxXsZqSTbTICf+BeBfoI1C52MTjf7rPmby0/Ru+8JylnMGzgAeaicvGpcz
 rtO+YwE0DIQB2gGFnAc0dBTCUva4tF21y64x6G3Dwhd5GFxnA4zYi23ipX5w5FFTRi35
 abjP+TYVi5mYqVQp4EuLWF0Vz4MIxqeNEcx7RaITrozID3nQA044PH3ZTBluosx34gbr
 6dd5FoslQKcDYAfjeNmUWPjFtrrwpw5uXqRzyzTK33E92RyfwBvjmzAvIR0eQPAF/hGN
 G1Gw==
X-Gm-Message-State: AOAM530HA7Ne48ddAMErkf2x/QM/wg/X95Q+3Rc2EGI2y+Jb0TcP98G2
 WCmXf0+D1lEvQ9b+WlJe+GFgeg==
X-Google-Smtp-Source: ABdhPJy+x6N7BHDOHH5vuQVEJdyydy2XancBgQi0eaeXii6q/njzBaQIRBAtjMRzAtrBnRx1Lvo4BA==
X-Received: by 2002:a17:906:eb12:: with SMTP id
 mb18mr309753ejb.257.1611249407746; 
 Thu, 21 Jan 2021 09:16:47 -0800 (PST)
Received: from alco.lan ([80.71.134.83])
 by smtp.gmail.com with ESMTPSA id q9sm2484024ejd.113.2021.01.21.09.16.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Jan 2021 09:16:47 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
To: Cezary Rojewski <cezary.rojewski@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Jie Yang <yang.jie@linux.intel.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Mateusz Gorski <mateusz.gorski@linux.intel.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Lukasz Majczak <lma@semihalf.com>
Subject: [PATCH v2 2/2] ASoC: Intel: Skylake: Zero snd_ctl_elem_value
Date: Thu, 21 Jan 2021 18:16:44 +0100
Message-Id: <20210121171644.131059-2-ribalda@chromium.org>
X-Mailer: git-send-email 2.30.0.296.g2bfb1c46d8-goog
In-Reply-To: <20210121171644.131059-1-ribalda@chromium.org>
References: <20210121171644.131059-1-ribalda@chromium.org>
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

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 sound/soc/intel/skylake/skl-topology.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/intel/skylake/skl-topology.c b/sound/soc/intel/skylake/skl-topology.c
index 1ef30ca45410..b824086203b9 100644
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

