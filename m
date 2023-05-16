Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CB88705453
	for <lists+alsa-devel@lfdr.de>; Tue, 16 May 2023 18:48:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 356E5F0;
	Tue, 16 May 2023 18:47:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 356E5F0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684255715;
	bh=NmVCTiiqaXBUxqaLY1Cg5ytP33bKMshtI1bMs+3E32E=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=RnXGZ5s7KGkV93giACuiw9T/v2AXg+sYYyconXKYaHU7nbGQe3i151VpEW4gH2sly
	 p8FhqpXNuEdFhWuLnqeuyqGFgyak6PYzGsC3e6WjXFZhZE9B9CCmXCamtZp0tT+xIc
	 CSBeOscRs8zZDDBK2x/8GL9glO06E4ZPOZsLYUJ8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 86BAAF8016A; Tue, 16 May 2023 18:47:42 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 16563F8025A;
	Tue, 16 May 2023 18:47:42 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A7EF0F80272; Tue, 16 May 2023 18:47:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-il1-x12b.google.com (mail-il1-x12b.google.com
 [IPv6:2607:f8b0:4864:20::12b])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 1D4B1F8016A
	for <alsa-devel@alsa-project.org>; Tue, 16 May 2023 18:47:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1D4B1F8016A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256
 header.s=google header.b=XgquwqvL
Received: by mail-il1-x12b.google.com with SMTP id
 e9e14a558f8ab-3319a6f989aso100368365ab.2
        for <alsa-devel@alsa-project.org>;
 Tue, 16 May 2023 09:47:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1684255646; x=1686847646;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4kqAFNzMiB3ZwK/e/ItswkNJsgBlTz31zqehRMdz+Ac=;
        b=XgquwqvLNbDkiRPVfnqU1n76gnw4qQo6lUMlezqCtFltOedMPmcnAvkXvPdCFuhylm
         mclF0gih61PAmtXrLslY7axZG74QEeWuxP6yd+uBQ9qpJ3TcBrCgQEUGRtruX3Z6NyYF
         QeubN5hMQlbLVmVTqFEZ3V9Vn3hUIwcTtEkLw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684255646; x=1686847646;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4kqAFNzMiB3ZwK/e/ItswkNJsgBlTz31zqehRMdz+Ac=;
        b=hzRTk7pnijvyBfdXuszy4WyEJX6RPkMazeKzHMD5uHNQd+Qat01wUErov4Q1SNRj9d
         QhUxQRyWbXGrvThVWqGyU8l2kQmX+4AgZbWw2Bl6Kh/zHbaoEbR0GxfrDT4NnOZlyMJW
         UQULOdfmWCt5WmBmEGXyhtMOMfqMvl4zqqvhnyTZtVpJapYF6sZDiUxzaDxTC+15x6F6
         taOcyrSQI9VvgLtq6Da0n1znZJ22J3xvswxVHHD9R8Mp/GONoz5ZDLsNBRHrQuPHHOh1
         Lf9Spzq1XJKHaZyA3ADfPW+Yg/dpxD+qGlehI1RfI6JAmYZ53wcLq5gvtZpmdduBDf8V
         hGrA==
X-Gm-Message-State: AC+VfDwxi3O/rZZbY2gYsu5OnooS5Od4y0snWX7lS1jlPm/4J0N22Tcw
	HJvOE2IJOOesCAeiWXdu6u2HEQ==
X-Google-Smtp-Source: 
 ACHHUZ5PMmHS1ZQAfxj/ZSE8EJBw2wv392wyIBpq74SBz2GLLGdQUWCTJBVp7LJdjI9cHzN8lRkBbQ==
X-Received: by 2002:a92:ca91:0:b0:335:ebb8:1138 with SMTP id
 t17-20020a92ca91000000b00335ebb81138mr12869924ilo.22.1684255646089;
        Tue, 16 May 2023 09:47:26 -0700 (PDT)
Received: from localhost (30.23.70.34.bc.googleusercontent.com. [34.70.23.30])
        by smtp.gmail.com with UTF8SMTPSA id
 c41-20020a023f69000000b004141e72be1asm7771265jaf.175.2023.05.16.09.47.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 May 2023 09:47:25 -0700 (PDT)
From: Matthias Kaehlcke <mka@chromium.org>
To: Oder Chiou <oder_chiou@realtek.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: Douglas Anderson <dianders@chromium.org>,
	linux-kernel@vger.kernel.org,
	alsa-devel@alsa-project.org,
	Stephen Boyd <swboyd@chromium.org>,
	Matthias Kaehlcke <mka@chromium.org>,
	stable@kernel.org
Subject: [PATCH] SoC: rt5682: Disable jack detection interrupt during suspend
Date: Tue, 16 May 2023 16:46:30 +0000
Message-ID: 
 <20230516164629.1.Ibf79e94b3442eecc0054d2b478779cc512d967fc@changeid>
X-Mailer: git-send-email 2.40.1.606.ga4b1b128d6-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: BNVOCPT6ZOCW5XRHIDAPEH6SDO5K3S5D
X-Message-ID-Hash: BNVOCPT6ZOCW5XRHIDAPEH6SDO5K3S5D
X-MailFrom: mka@chromium.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/BNVOCPT6ZOCW5XRHIDAPEH6SDO5K3S5D/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The rt5682 driver switches its regmap to cache-only when the
device suspends and back to regular mode on resume. When the
jack detect interrupt fires rt5682_irq() schedules the jack
detect work. This can result in invalid reads from the regmap
in cache-only mode if the work runs before the device has
resumed:

[   56.245502] rt5682 9-001a: ASoC: error at soc_component_read_no_lock on rt5682.9-001a for register: [0x000000f0] -16

Disable the jack detection interrupt during suspend and
re-enable it on resume. The driver already schedules the
jack detection work on resume, so any state change during
suspend is still handled.

This is essentially the same as commit f7d00a9be147 ("SoC:
rt5682s: Disable jack detection interrupt during suspend")
for the rt5682s.

Cc: stable@kernel.org
Signed-off-by: Matthias Kaehlcke <mka@chromium.org>
---

 sound/soc/codecs/rt5682-i2c.c | 4 +++-
 sound/soc/codecs/rt5682.c     | 6 ++++++
 sound/soc/codecs/rt5682.h     | 1 +
 3 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/rt5682-i2c.c b/sound/soc/codecs/rt5682-i2c.c
index 2935c1bb81f3..5bc46b041786 100644
--- a/sound/soc/codecs/rt5682-i2c.c
+++ b/sound/soc/codecs/rt5682-i2c.c
@@ -267,7 +267,9 @@ static int rt5682_i2c_probe(struct i2c_client *i2c)
 		ret = devm_request_threaded_irq(&i2c->dev, i2c->irq, NULL,
 			rt5682_irq, IRQF_TRIGGER_RISING | IRQF_TRIGGER_FALLING
 			| IRQF_ONESHOT, "rt5682", rt5682);
-		if (ret)
+		if (!ret)
+			rt5682->irq = i2c->irq;
+		else
 			dev_err(&i2c->dev, "Failed to reguest IRQ: %d\n", ret);
 	}
 
diff --git a/sound/soc/codecs/rt5682.c b/sound/soc/codecs/rt5682.c
index f6c798b65c08..5d992543b791 100644
--- a/sound/soc/codecs/rt5682.c
+++ b/sound/soc/codecs/rt5682.c
@@ -2959,6 +2959,9 @@ static int rt5682_suspend(struct snd_soc_component *component)
 	if (rt5682->is_sdw)
 		return 0;
 
+	if (rt5682->irq)
+		disable_irq(rt5682->irq);
+
 	cancel_delayed_work_sync(&rt5682->jack_detect_work);
 	cancel_delayed_work_sync(&rt5682->jd_check_work);
 	if (rt5682->hs_jack && (rt5682->jack_type & SND_JACK_HEADSET) == SND_JACK_HEADSET) {
@@ -3027,6 +3030,9 @@ static int rt5682_resume(struct snd_soc_component *component)
 	mod_delayed_work(system_power_efficient_wq,
 		&rt5682->jack_detect_work, msecs_to_jiffies(0));
 
+	if (rt5682->irq)
+		enable_irq(rt5682->irq);
+
 	return 0;
 }
 #else
diff --git a/sound/soc/codecs/rt5682.h b/sound/soc/codecs/rt5682.h
index d568c6993c33..e8efd8a84a6c 100644
--- a/sound/soc/codecs/rt5682.h
+++ b/sound/soc/codecs/rt5682.h
@@ -1462,6 +1462,7 @@ struct rt5682_priv {
 	int pll_out[RT5682_PLLS];
 
 	int jack_type;
+	int irq;
 	int irq_work_delay_time;
 };
 
-- 
2.40.1.606.ga4b1b128d6-goog

