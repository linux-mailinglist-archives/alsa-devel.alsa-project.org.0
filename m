Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BA514D3AFE
	for <lists+alsa-devel@lfdr.de>; Wed,  9 Mar 2022 21:24:57 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1C9E016F2;
	Wed,  9 Mar 2022 21:24:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1C9E016F2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646857497;
	bh=07Dd4FoIS7I5Cam0j7GdbiFV61Y/AIx9+RKeEzrx8IQ=;
	h=Date:Subject:From:To:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mQ+8OWNxOaR3ujMmIBm0TciOr9TbfwhfUM2O/pNgSdJ452Tr4eQtQvsNSSU0Mtc3K
	 aVurKtCc4HcVFmR+4qMbSJOSAL0a0BKwIa7cS64dUfS0xoxlNuFKOhJ9IUc7bUpBpg
	 mD9DFD2vb13MLq77Nr9unOIyGECZYy4jMl3hqfSQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 01ABEF800D2;
	Wed,  9 Mar 2022 21:23:19 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 892A0F804AB; Wed,  9 Mar 2022 21:23:17 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_NONE, T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 00EE8F800D2
 for <alsa-devel@alsa-project.org>; Wed,  9 Mar 2022 21:23:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 00EE8F800D2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="pqtjIe+Z"
Received: by mail-ej1-x629.google.com with SMTP id kt27so7749991ejb.0
 for <alsa-devel@alsa-project.org>; Wed, 09 Mar 2022 12:23:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language
 :from:to:cc:references:in-reply-to:content-transfer-encoding;
 bh=NGVLTVFJsUCjubXSfriwHtfIwsDlVociFIc0hJBnwpk=;
 b=pqtjIe+ZUtDb1ZeuVaqwVq3YPbDh9rBJ4o7jyWzzNMQt0nHlCL4Wuj5VpJemji07sH
 Vf1B1wzDI+F6bk5VrPCnxIfcTUOa6+A/th9ruhGAPiVAdw6FIlTN87ic5wVM8qhQs2aK
 r74cazB0augzHOao39P1VzZcnbuUtXilmz7T4A6pQXaIfiY8a/0fOUNVmTml6eUh9WLh
 kIkLRp6KLWr/gE3g5XRVvuOv7zvaIGQSTN4qzuO4s9VlPfpVVV1n0DcRTFfV/7kbgAe3
 gmsXVwzg/hnw9U3yfK1kreuFVymSQyJq8IMjb03WOkkuIaK1iT9NsCzzGEuQOibTJuvI
 h6zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:from:to:cc:references:in-reply-to
 :content-transfer-encoding;
 bh=NGVLTVFJsUCjubXSfriwHtfIwsDlVociFIc0hJBnwpk=;
 b=zpFia23eZO1raYIBOGyjBPfGgdEVbogKKnjyXd4MQSa4gPkQ+76/QU+0geSQeCrzlm
 JQTAmAkGH1BmHBPy2ZIjoIW7Off26lReSf2qIGl/BCAI19YyUBfLiLM/zdSqQbDAlmta
 wF4iFcFfMqmGJ6V7KkimQXnLgJP8NTRSqUBmhAexLrhBiUvBdoxgVrTGw4HWATRFs65j
 DvmW4v2co++wN6L+NMNztl73zqyuvYhJAt/TryBVmCgAYUz8ABzUVtm1Cig6/jh7Yusi
 hu2bSc53H896BYdI8I+tPTcNVN41G4nT2GSjLT3dIwsxVmDELg1nhW8Axar3Guj7QoVs
 GGIA==
X-Gm-Message-State: AOAM531N/o7J3zT0e9QFDjp4AmHZo0ZqOv1M9VWC1ORiq9w0VGkqddwI
 9gELuTwfj/wn9OB9Omej6XQ=
X-Google-Smtp-Source: ABdhPJwjwNyDz7Zhk+G5PJeQBhyjrdvyfOflLQPcu37GGOkDRuK7VvaTPqYNd6yuk4zpv9a2q9rHSQ==
X-Received: by 2002:a17:907:2d25:b0:6d7:c831:5714 with SMTP id
 gs37-20020a1709072d2500b006d7c8315714mr1411549ejc.137.1646857392603; 
 Wed, 09 Mar 2022 12:23:12 -0800 (PST)
Received: from ?IPV6:2a01:c22:7793:600:9d6a:7788:3389:da6c?
 (dynamic-2a01-0c22-7793-0600-9d6a-7788-3389-da6c.c22.pool.telefonica.de.
 [2a01:c22:7793:600:9d6a:7788:3389:da6c])
 by smtp.googlemail.com with ESMTPSA id
 d1-20020a17090694c100b006da91d57e93sm1143326ejy.207.2022.03.09.12.23.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Mar 2022 12:23:12 -0800 (PST)
Message-ID: <38053baf-c33b-7fdf-7593-99b22153a9c0@gmail.com>
Date: Wed, 9 Mar 2022 21:23:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: [PATCH v2 2/2] ASoC: meson: aiu: fix duplicate debugfs directory error
Content-Language: en-US
From: Heiner Kallweit <hkallweit1@gmail.com>
To: Jerome Brunet <jbrunet@baylibre.com>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Neil Armstrong <narmstrong@baylibre.com>, Kevin Hilman
 <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
References: <51953618-79b6-0df7-2d28-d5dce4dc86c7@gmail.com>
In-Reply-To: <51953618-79b6-0df7-2d28-d5dce4dc86c7@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 alsa-devel@alsa-project.org,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
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

On a S905W-based system I get the following error:
debugfs: Directory 'c1105400.audio-controller' with parent 'P230-Q200' already present!

Turned out that multiple components having the same name triggers this
error in soc_init_component_debugfs(). With the patch the error is gone
and that's the debugfs entries.

/sys/kernel/debug/asoc/P230-Q200/acodec:c1105400.audio-controller
/sys/kernel/debug/asoc/P230-Q200/hdmi:c1105400.audio-controller
/sys/kernel/debug/asoc/P230-Q200/cpu:c1105400.audio-controller

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 sound/soc/meson/aiu-acodec-ctrl.c | 3 +++
 sound/soc/meson/aiu-codec-ctrl.c  | 3 +++
 sound/soc/meson/aiu.c             | 3 +++
 3 files changed, 9 insertions(+)

diff --git a/sound/soc/meson/aiu-acodec-ctrl.c b/sound/soc/meson/aiu-acodec-ctrl.c
index 27a6d3259..22e181646 100644
--- a/sound/soc/meson/aiu-acodec-ctrl.c
+++ b/sound/soc/meson/aiu-acodec-ctrl.c
@@ -193,6 +193,9 @@ static const struct snd_soc_component_driver aiu_acodec_ctrl_component = {
 	.of_xlate_dai_name	= aiu_acodec_of_xlate_dai_name,
 	.endianness		= 1,
 	.non_legacy_dai_naming	= 1,
+#ifdef CONFIG_DEBUG_FS
+	.debugfs_prefix		= "acodec",
+#endif
 };
 
 int aiu_acodec_ctrl_register_component(struct device *dev)
diff --git a/sound/soc/meson/aiu-codec-ctrl.c b/sound/soc/meson/aiu-codec-ctrl.c
index c3ea733fc..59ee66fc2 100644
--- a/sound/soc/meson/aiu-codec-ctrl.c
+++ b/sound/soc/meson/aiu-codec-ctrl.c
@@ -140,6 +140,9 @@ static const struct snd_soc_component_driver aiu_hdmi_ctrl_component = {
 	.of_xlate_dai_name	= aiu_hdmi_of_xlate_dai_name,
 	.endianness		= 1,
 	.non_legacy_dai_naming	= 1,
+#ifdef CONFIG_DEBUG_FS
+	.debugfs_prefix		= "hdmi",
+#endif
 };
 
 int aiu_hdmi_ctrl_register_component(struct device *dev)
diff --git a/sound/soc/meson/aiu.c b/sound/soc/meson/aiu.c
index d299a70db..88e611e64 100644
--- a/sound/soc/meson/aiu.c
+++ b/sound/soc/meson/aiu.c
@@ -103,6 +103,9 @@ static const struct snd_soc_component_driver aiu_cpu_component = {
 	.pointer		= aiu_fifo_pointer,
 	.probe			= aiu_cpu_component_probe,
 	.remove			= aiu_cpu_component_remove,
+#ifdef CONFIG_DEBUG_FS
+	.debugfs_prefix		= "cpu",
+#endif
 };
 
 static struct snd_soc_dai_driver aiu_cpu_dai_drv[] = {
-- 
2.35.1


