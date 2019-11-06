Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 576D6F0B9B
	for <lists+alsa-devel@lfdr.de>; Wed,  6 Nov 2019 02:22:37 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D69CF16FE;
	Wed,  6 Nov 2019 02:21:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D69CF16FE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1573003356;
	bh=qTxhxGRltfOqV8+P5EDUzamwWKawteEQsgb714DHsdM=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=UTI5K5/PpLY3vciH8wQEGNqfX/fnJEYyPp2yEQpC6V104M3liNGcyY54tZxgjpkom
	 NUYi7enA6MmI1CLgmv3QPt7ZKnWxi/buCk7QnITpmEnAswdGnaWRGidOz+yXVRXl8S
	 sQU7YySLlB6hpywHl97HUs2+TUggOF3ZfVkynkLk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E639CF80726;
	Wed,  6 Nov 2019 02:14:21 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AA7E0F80716; Wed,  6 Nov 2019 02:14:19 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B1EA9F805DF
 for <alsa-devel@alsa-project.org>; Wed,  6 Nov 2019 02:14:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B1EA9F805DF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="lkeXsYWV"
Received: by mail-pl1-x642.google.com with SMTP id k7so10620659pll.1
 for <alsa-devel@alsa-project.org>; Tue, 05 Nov 2019 17:14:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=S0/mp38rBhTMWLEhtC3QwaOFn+/U947fgGhIoy86tPY=;
 b=lkeXsYWVAefbqE3UPjez3lOrWJDCwjWCcmE+PoUi4PRe3dqpMErqJEzSANXauDUJYj
 OIqdNv2/SsZaF/1taRHW9TWELWcqo0dr9rttGXFwcLqecREaSCIRsgz7sRoDzljoB1fJ
 9R99DkzVIWZ5caxsk2z9a7f2MQa7utEi8dxD0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=S0/mp38rBhTMWLEhtC3QwaOFn+/U947fgGhIoy86tPY=;
 b=omGYfjXSaSTGSg1pjdRRXe2reh3ev2EWI5j3SRnoc4ZaE03AKI+t1yI2kXzGRKO6t8
 MqJx1flTZOwgd8/u5NtX/lQjnve8qz5TwWDQyudG7XlVOzPsPMvHme0dzRVYM0bxiIcD
 sNOP8iFav9lep1+wiilloEA7CYVwEF3CJ8l/V+qxGg+QoRH2hbz9ez2SutVZf3ImVey5
 VRFRQh4TYuIyIOD+ZBLUo1aNmyLwoKz7ROM+TYx/XRJ3CSCQDZ88QFfAykttcaKm+G+w
 QjNF1N1dlqYLHNWSYW8wcBUHJn2gicq084S77GpS8f8BXJ9n8aYMtiSnQQCfQFOhOWXE
 bdww==
X-Gm-Message-State: APjAAAVkbngkkewYkZYBZKctXaOvODAxYbrsPJKDwOo6y4fR3jDDHLqU
 4E5bFsyFPmFnDEyT0/7bmlokoqeqlUtA
X-Google-Smtp-Source: APXvYqws9eRFcCHXoKE5TXmzaq6PqF70yV9nWl/3JFskKXJE825D6xUydYmeYJke+HhlbaKhZPBJFw==
X-Received: by 2002:a17:902:bcc2:: with SMTP id
 o2mr36899608pls.281.1573002854653; 
 Tue, 05 Nov 2019 17:14:14 -0800 (PST)
Received: from localhost ([2620:15c:202:201:c87a:31ae:9107:f63d])
 by smtp.gmail.com with ESMTPSA id j12sm19054435pfe.32.2019.11.05.17.14.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Nov 2019 17:14:14 -0800 (PST)
From: Curtis Malainey <cujomalainey@chromium.org>
To: alsa-devel@alsa-project.org
Date: Tue,  5 Nov 2019 17:13:36 -0800
Message-Id: <20191106011335.223061-12-cujomalainey@chromium.org>
X-Mailer: git-send-email 2.24.0.rc1.363.gb1bccd3e3d-goog
In-Reply-To: <20191106011335.223061-1-cujomalainey@chromium.org>
References: <20191106011335.223061-1-cujomalainey@chromium.org>
MIME-Version: 1.0
Cc: Oder Chiou <oder_chiou@realtek.com>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Bard Liao <bardliao@realtek.com>, Curtis Malainey <cujomalainey@chromium.org>
Subject: [alsa-devel] [PATCH v3 11/11] ASoC: rt5677: Wait for DSP to boot
	before loading firmware
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

Wait for hardware to startup. If we load before hardware is ready we
could end up corrupting the firmware.

Signed-off-by: Curtis Malainey <cujomalainey@chromium.org>
---
 sound/soc/codecs/rt5677.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/sound/soc/codecs/rt5677.c b/sound/soc/codecs/rt5677.c
index 0e7773584145..f2f763b4c399 100644
--- a/sound/soc/codecs/rt5677.c
+++ b/sound/soc/codecs/rt5677.c
@@ -892,6 +892,7 @@ static void rt5677_dsp_work(struct work_struct *work)
 		container_of(work, struct rt5677_priv, dsp_work.work);
 	static bool activity;
 	bool enable = rt5677->dsp_vad_en;
+	int i, val;
 
 
 	dev_info(rt5677->component->dev, "DSP VAD: enable=%d, activity=%d\n",
@@ -913,6 +914,18 @@ static void rt5677_dsp_work(struct work_struct *work)
 		rt5677_set_vad_source(rt5677);
 		rt5677_set_dsp_mode(rt5677, true);
 
+#define RT5677_BOOT_RETRY 20
+		for (i = 0; i < RT5677_BOOT_RETRY; i++) {
+			regmap_read(rt5677->regmap, RT5677_PWR_DSP_ST, &val);
+			if (val == 0x3ff)
+				break;
+			udelay(500);
+		}
+		if (i == RT5677_BOOT_RETRY && val != 0x3ff) {
+			dev_err(rt5677->component->dev, "DSP Boot Timed Out!");
+			return;
+		}
+
 		/* Boot the firmware from IRAM instead of SRAM0. */
 		rt5677_dsp_mode_i2c_write_addr(rt5677, RT5677_DSP_BOOT_VECTOR,
 			0x0009, 0x0003);
-- 
2.24.0.rc1.363.gb1bccd3e3d-goog

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
