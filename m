Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 194E630D3BB
	for <lists+alsa-devel@lfdr.de>; Wed,  3 Feb 2021 08:05:28 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 91D181767;
	Wed,  3 Feb 2021 08:04:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 91D181767
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1612335927;
	bh=eeRnU4E/k90/N288U8XddXLnbW7FcTzRgv149kB+Woo=;
	h=To:From:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=po4+XcgqPnC4+RSly3djcvBhlscuEBt//bETT4atYjtSuzgwRUvuc5sQaU/dvITsa
	 QlxCncESRB19vIzKh/OiEObymIFWsVpKkRVQ3H5g52rF/NoLryYcWojYk71pNZrafP
	 rtEcvrbJNtVeJX41fktfFsj4kTnz15AHnXj48FSQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A754AF802E7;
	Wed,  3 Feb 2021 08:01:39 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F2122F80171; Sun, 31 Jan 2021 22:37:37 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E8FEEF80134
 for <alsa-devel@alsa-project.org>; Sun, 31 Jan 2021 22:37:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E8FEEF80134
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="rzoxAZoZ"
Received: by mail-ej1-x62b.google.com with SMTP id l9so21291324ejx.3
 for <alsa-devel@alsa-project.org>; Sun, 31 Jan 2021 13:37:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=to:from:subject:message-id:date:user-agent:mime-version
 :content-transfer-encoding:content-language;
 bh=kzNgrLo0S0Xm+AmIJlf3M/B5PGHGJ7ATVnXnZ+GlxR4=;
 b=rzoxAZoZWYzahdjy2NmsOYh9wDU5k8AEdZs6/9iDSZnB9xQkW/U3/PcPiE8ElJpYyy
 XXJBiVBoe8vjOwJs7ugmnDrGPkvlQkDiOB4IkvjzeNFsV6GD4wW++2ErN+7XvdiMBbY0
 W0yiWvfdFWJk2auw4RdEDku1DB4rOriaoouiIeLu4K43M62r/0M80gbjYmxP1MU4emP/
 lxstctFn6ogBHweLETgA4bYK8zdtC5VXUf9+GJCzi7M6ePo8SpjBj7tIropBaKR7kPWt
 gYD3STwhxr8UN26yYi4wtIWCON8Az1U9v2NytWIb3bGfe5udHgMh7es9KIo5JeMUvMV9
 JSVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:from:subject:message-id:date:user-agent
 :mime-version:content-transfer-encoding:content-language;
 bh=kzNgrLo0S0Xm+AmIJlf3M/B5PGHGJ7ATVnXnZ+GlxR4=;
 b=L3YY+8BZopaRXWqHuhwasVFUGVUY3a6EmtEh1Vhiu4nhef/ghHpZj4e0eQiAnkJQXb
 IC4nSQBMiiATR3eQOxKssftqdkF4o03mIlXXzLj4uRRuWOaWc57E0cwYuQYcqF54Bsad
 Pw7Ar/IKG7SEG677eamxS5vIgLJn/MHZpN2m4A03JKuwkWqXIJXEb2VN1DO0vFYXb/W3
 xYEQrb3TWLj2TwLRKAalQ7s/zQTSZA6rvhjYXf5TvSQ3rwy3R1CojauN7ZBIPALYp4Gj
 FhTfz8p7wAiowrs7uG8cnEzozuB68YptKJL2jqEG53JBMpEynjqULXmKwSBMuLzpZxX+
 ksBg==
X-Gm-Message-State: AOAM531gGU7NRxBqDYVUuLHI/R+/98XGsF1anlbEJwD4vuGeMBLTlaY8
 HNJ96ca6oGZRstq7NACgsaYZJ0SnnsB4uQ==
X-Google-Smtp-Source: ABdhPJxrEx3KlM9y6aspDLDHI5MAmoCjBnlSMzvoyNPQz1vSymhqbHGr5h1wcKgJW+LmHL/bgk64fQ==
X-Received: by 2002:a17:906:d189:: with SMTP id
 c9mr15133236ejz.36.1612129053804; 
 Sun, 31 Jan 2021 13:37:33 -0800 (PST)
Received: from ?IPv6:2a02:8388:1987:9380:e014:2d28:da71:9d35?
 (2a02-8388-1987-9380-e014-2d28-da71-9d35.cable.dynamic.v6.surfer.at.
 [2a02:8388:1987:9380:e014:2d28:da71:9d35])
 by smtp.gmail.com with ESMTPSA id f13sm7027697ejf.42.2021.01.31.13.37.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 31 Jan 2021 13:37:33 -0800 (PST)
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Romain Perier <romain.perier@gmail.com>,
 Colin Ian King <colin.king@canonical.com>, Allen Pais
 <allen.lkml@gmail.com>, alsa-devel@alsa-project.org
From: fassl <superfassl@gmail.com>
Subject: [PATCH] sound: pci/rme9652 - implement and expose controls for output
Message-ID: <3cd2889a-e71a-aa3f-e79a-d11a4833c581@gmail.com>
Date: Sun, 31 Jan 2021 22:37:32 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Mailman-Approved-At: Wed, 03 Feb 2021 08:01:31 +0100
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

From 980aa253c17d233966e05a43f3611693e2e02040 Mon Sep 17 00:00:00 2001
From: Jasmin Fazlic <superfassl@gmail.com>
Date: Sun, 31 Jan 2021 22:17:22 +0100
Subject: [PATCH] sound: pci/rme9652 - implement and expose controls for output
 loopback

- so far only tested and enabled for RME HDSP9632

Signed-off-by: Jasmin Fazlic <superfassl@gmail.com>
---
 sound/pci/rme9652/hdsp.c | 85 +++++++++++++++++++++++++++++++++++++++-
 1 file changed, 84 insertions(+), 1 deletion(-)

diff --git a/sound/pci/rme9652/hdsp.c b/sound/pci/rme9652/hdsp.c
index cea53a878c36..7e832a502cea 100644
--- a/sound/pci/rme9652/hdsp.c
+++ b/sound/pci/rme9652/hdsp.c
@@ -469,6 +469,7 @@ struct hdsp {
     unsigned char          qs_out_channels;
     unsigned char         ds_out_channels;
     unsigned char         ss_out_channels;
+    u32                   io_loopback;          /* output loopback channel states*/
 
     struct snd_dma_buffer capture_dma_buf;
     struct snd_dma_buffer playback_dma_buf;
@@ -3253,6 +3254,71 @@ static const struct snd_kcontrol_new snd_hdsp_96xx_aeb =
             HDSP_AnalogExtensionBoard);
 static struct snd_kcontrol_new snd_hdsp_adat_sync_check = HDSP_ADAT_SYNC_CHECK;
 
+
+static bool hdsp_loopback_get(struct hdsp *const hdsp, const u8 channel)
+{
+    return hdsp->io_loopback & (1 << channel);
+}
+
+static int hdsp_loopback_set(struct hdsp *const hdsp, const u8 channel, const bool enable)
+{
+    if (hdsp_loopback_get(hdsp, channel) == enable)
+        return 0;
+
+    hdsp->io_loopback ^= (1 << channel);
+
+    hdsp_write(hdsp, HDSP_inputEnable + (4 * (hdsp->max_channels + channel)), enable);
+
+    return 1;
+}
+
+static int snd_hdsp_loopback_info(struct snd_kcontrol *const kcontrol,
+                  struct snd_ctl_elem_info *const uinfo)
+{
+    uinfo->type = SNDRV_CTL_ELEM_TYPE_BOOLEAN;
+    uinfo->count = 1;
+    uinfo->value.integer.min = 0;
+    uinfo->value.integer.max = 1;
+    return 0;
+}
+
+static int snd_hdsp_loopback_get(struct snd_kcontrol *const kcontrol,
+                 struct snd_ctl_elem_value *const ucontrol)
+{
+    struct hdsp *const hdsp = snd_kcontrol_chip(kcontrol);
+    const u8 channel = kcontrol->id.index;
+
+    if (channel >= hdsp->max_channels)
+        return -ENOENT;
+
+    ucontrol->value.integer.value[0] = hdsp_loopback_get(hdsp, channel);
+
+    return 0;
+}
+
+static int snd_hdsp_loopback_put(struct snd_kcontrol *const kcontrol,
+                 struct snd_ctl_elem_value *const ucontrol)
+{
+    struct hdsp *const hdsp = snd_kcontrol_chip(kcontrol);
+    const u8 channel = ucontrol->id.index;
+    const bool enable = ucontrol->value.integer.value[0] & 1;
+
+    if (channel >= hdsp->max_channels)
+        return -ENOENT;
+
+    return hdsp_loopback_set(hdsp, channel, enable);
+}
+
+static struct snd_kcontrol_new snd_hdsp_loopback_control = {
+    .iface = SNDRV_CTL_ELEM_IFACE_HWDEP,
+    .name = "Output Loopback",
+    .index = 0,
+    .access = SNDRV_CTL_ELEM_ACCESS_READWRITE,
+    .info = snd_hdsp_loopback_info,
+    .get = snd_hdsp_loopback_get,
+    .put = snd_hdsp_loopback_put
+};
+
 static int snd_hdsp_create_controls(struct snd_card *card, struct hdsp *hdsp)
 {
     unsigned int idx;
@@ -3297,6 +3363,17 @@ static int snd_hdsp_create_controls(struct snd_card *card, struct hdsp *hdsp)
         }
     }
 
+    /* Output loopback controls for H9632 cards */
+    if (hdsp->io_type == H9632) {
+        for (idx = 0; idx < hdsp->max_channels; idx++) {
+            snd_hdsp_loopback_control.index = idx;
+            kctl = snd_ctl_new1(&snd_hdsp_loopback_control, hdsp);
+            err = snd_ctl_add(card, kctl);
+            if (err < 0)
+                return err;
+        }
+    }
+
     /* AEB control for H96xx card */
     if (hdsp->io_type == H9632 || hdsp->io_type == H9652) {
         if ((err = snd_ctl_add(card, kctl = snd_ctl_new1(&snd_hdsp_96xx_aeb, hdsp))) < 0)
@@ -4956,7 +5033,7 @@ static int snd_hdsp_enable_io (struct hdsp *hdsp)
 
 static void snd_hdsp_initialize_channels(struct hdsp *hdsp)
 {
-    int status, aebi_channels, aebo_channels;
+    int status, aebi_channels, aebo_channels, i;
 
     switch (hdsp->io_type) {
     case Digiface:
@@ -4983,6 +5060,12 @@ static void snd_hdsp_initialize_channels(struct hdsp *hdsp)
         hdsp->ss_out_channels = H9632_SS_CHANNELS+aebo_channels;
         hdsp->ds_out_channels = H9632_DS_CHANNELS+aebo_channels;
         hdsp->qs_out_channels = H9632_QS_CHANNELS+aebo_channels;
+        /* Disable loopback of output channels, as the set function
+         * only sets on a change we fake all bits (channels) as enabled.
+         */
+        hdsp->io_loopback = 0xffffffff;
+        for (i = 0; i < hdsp->max_channels; ++i)
+            hdsp_loopback_set(hdsp, i, false);
         break;
 
     case Multiface:
-- 
2.27.0


