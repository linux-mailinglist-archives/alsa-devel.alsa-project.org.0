Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 203BB870C3B
	for <lists+alsa-devel@lfdr.de>; Mon,  4 Mar 2024 22:15:42 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 39D6D93A;
	Mon,  4 Mar 2024 22:15:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 39D6D93A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1709586941;
	bh=sN4cZZCpBa2dv3S1VwRkORi3Qly2+c/g5Zmovy/V+p8=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=rILUUBz8C7PnEil9gZ7IjvjBRa+voORxtDiHW+7k8mL9oMrBY0rgILBaVM+4sqVU4
	 3GwQdBIf2MiUy6V3SiMGOtImWoMMZst61kFMUOYiISM1S+1fEu1OPUiX5YbN/4uKKi
	 Rdm0GlGwhKEKWtDr74PLRaBzXdVjwGyRfq9s9S7g=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F2854F8059F; Mon,  4 Mar 2024 22:15:08 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 58F32F8057D;
	Mon,  4 Mar 2024 22:15:08 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 32AF5F8024E; Mon,  4 Mar 2024 22:15:04 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com
 [IPv6:2607:f8b0:4864:20::432])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 901A0F8014B
	for <alsa-devel@alsa-project.org>; Mon,  4 Mar 2024 22:14:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 901A0F8014B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256
 header.s=google header.b=XsOWwWmF
Received: by mail-pf1-x432.google.com with SMTP id
 d2e1a72fcca58-6de3141f041so3248027b3a.0
        for <alsa-devel@alsa-project.org>;
 Mon, 04 Mar 2024 13:14:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1709586895; x=1710191695;
 darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2lcvUCMTYrQlx87Hprkf9sf9zhrKFytO61nZbZl+b/k=;
        b=XsOWwWmFO0olsHfysdqGlGd8xfLxbjGmikXyBwvVhtpnJpr1bWAHDtZK23DGhJRWZt
         f0nlBf8yRFOQy1W3KrFtyiAAIYD8B9xUrYsE1RaX+MUnVAwj8ODe4dj6VxAHio8ql1mc
         IoXSCJMqjI+9BLAVVe6XmcNFc1W0XUKg1o4oM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709586895; x=1710191695;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2lcvUCMTYrQlx87Hprkf9sf9zhrKFytO61nZbZl+b/k=;
        b=MQDBVk/XlyC50ZOJvhRqvlXNhquXvrYqBep1F/H0NbY0/NSnnN2LKoaCymDAGFWvbh
         vs/1IR/NvMlznLv5F6JAq2UGLYYxAZmlFg44Hw8LAIJgJ28dY+e3NA/jZS2NRmJPwNOC
         v7Jb+L4NcMID58l96Xq7lHybM++JVR1wd5D2sISXvLJo4WYE3dzfZKeFyr+8NXnaGDwI
         QF4l5P4ZALwNg3cMgYoIZ3VS/kCGfGnkXn2bVp3IgyeJNyNYR0S0YzGHlVIaNyQcFH+x
         GcuM/yt5OTNjeAYaqwzbXGxWaJh7FNvU5kPI7atJ5X9CVpoicnbHYYJVw6hLOHgbjTHf
         ObvA==
X-Gm-Message-State: AOJu0Yyi0y0Yu/k7H1TGj8BKhVXu2V0AwytSSnSi8+qooSSLL5lJtzCb
	hUUXWIO7cL8+Fygy3wSgHWsQ0yDav9qAPH7An/YH1U/9v4+U+4SwOCGlrvKK8e/QzV15a9JUMQ=
	=
X-Google-Smtp-Source: 
 AGHT+IFOPP+Uh/8llgt3ODM4F8ZZNGLmJa+YmlJseG30AR6H8VoE3d45tIOullfuZJ9/I8z4yNqNlg==
X-Received: by 2002:a05:6a20:1583:b0:1a0:ce82:349 with SMTP id
 h3-20020a056a20158300b001a0ce820349mr8965194pzj.30.1709586895004;
        Mon, 04 Mar 2024 13:14:55 -0800 (PST)
Received: from localhost ([2620:15c:9d:4:b42f:8688:bd6c:d87d])
        by smtp.gmail.com with UTF8SMTPSA id
 k6-20020a63f006000000b005e4666261besm7964290pgh.50.2024.03.04.13.14.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Mar 2024 13:14:54 -0800 (PST)
From: cujomalainey@chromium.org
To: alsa-devel@alsa-project.org
Cc: Akshu Agrawal <akshu.agrawal@amd.com>,
	Curtis Malainey <cujomalainey@chromium.org>,
	Karthik Ramasubramanian <kramasub@google.com>,
	Support Opensource <support.opensource@diasemi.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Subject: [PATCH] ASoC: da7219: read fmw property to get mclk for non-dts
 systems
Date: Mon,  4 Mar 2024 13:14:43 -0800
Message-ID: <20240304211444.1031693-1-cujomalainey@chromium.org>
X-Mailer: git-send-email 2.44.0.rc1.240.g4c46232300-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: PBB3OVOWFY3Y7IAPZKHXPKZKV2BRQAMF
X-Message-ID-Hash: PBB3OVOWFY3Y7IAPZKHXPKZKV2BRQAMF
X-MailFrom: cujomalainey@chromium.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/PBB3OVOWFY3Y7IAPZKHXPKZKV2BRQAMF/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Akshu Agrawal <akshu.agrawal@amd.com>

Non-dts based systems can use ACPI DSDT to pass on the mclk
to da7219.
This enables da7219 mclk to be linked to system clock.
Enable/Disable of the mclk is already handled in the codec so
platform drivers don't have to explicitly do handling of mclk.

Signed-off-by: Akshu Agrawal <akshu.agrawal@amd.com>
Signed-off-by: Curtis Malainey <cujomalainey@chromium.org>
Cc: Karthik Ramasubramanian <kramasub@google.com>
---
 include/sound/da7219.h    | 2 ++
 sound/soc/codecs/da7219.c | 8 +++++++-
 2 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/include/sound/da7219.h b/include/sound/da7219.h
index dde4542b084f3..4cf4c52be3f7f 100644
--- a/include/sound/da7219.h
+++ b/include/sound/da7219.h
@@ -40,6 +40,8 @@ struct da7219_pdata {
 
 	const char *dai_clk_names[DA7219_DAI_NUM_CLKS];
 
+	const char *mclk_name;
+
 	/* Mic */
 	enum da7219_micbias_voltage micbias_lvl;
 	enum da7219_mic_amp_in_sel mic_amp_in_sel;
diff --git a/sound/soc/codecs/da7219.c b/sound/soc/codecs/da7219.c
index 311ea7918b312..800f61d993043 100644
--- a/sound/soc/codecs/da7219.c
+++ b/sound/soc/codecs/da7219.c
@@ -1782,6 +1782,8 @@ static struct da7219_pdata *da7219_fw_to_pdata(struct device *dev)
 			 pdata->dai_clk_names[DA7219_DAI_WCLK_IDX],
 			 pdata->dai_clk_names[DA7219_DAI_BCLK_IDX]);
 
+	device_property_read_string(dev, "dlg,mclk-name", &pdata->mclk_name);
+
 	if (device_property_read_u32(dev, "dlg,micbias-lvl", &of_val32) >= 0)
 		pdata->micbias_lvl = da7219_fw_micbias_lvl(dev, of_val32);
 	else
@@ -2521,7 +2523,11 @@ static int da7219_probe(struct snd_soc_component *component)
 	da7219_handle_pdata(component);
 
 	/* Check if MCLK provided */
-	da7219->mclk = clk_get(component->dev, "mclk");
+	if (da7219->pdata->mclk_name)
+		da7219->mclk = clk_get(NULL, da7219->pdata->mclk_name);
+	if (!da7219->mclk)
+		da7219->mclk = clk_get(component->dev, "mclk");
+
 	if (IS_ERR(da7219->mclk)) {
 		if (PTR_ERR(da7219->mclk) != -ENOENT) {
 			ret = PTR_ERR(da7219->mclk);
-- 
2.44.0.rc1.240.g4c46232300-goog

