Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5404376D66C
	for <lists+alsa-devel@lfdr.de>; Wed,  2 Aug 2023 20:05:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2CBD2E75;
	Wed,  2 Aug 2023 20:04:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2CBD2E75
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690999511;
	bh=Y9xdDN32VmPivBRnE+XlL6TfPEHRPuWhrBBu81Gi7W4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Vw/V5i8CCf6BKHvKAnxfeTINhFL9Gzk16LWQU+kP1NiRhM7ev5ujqC27YTIDEgGMA
	 oOgH9XMNqvk4zZLcsIjwt09cmdgAJzs7sn8BDbTknnCnr5teyf/pXsIt/hE49uST9W
	 3BhiO7WufT9vlcpMBq7wtqYtILk0O5RTc34B33HA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1818AF80686; Wed,  2 Aug 2023 19:59:22 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 84788F8067C;
	Wed,  2 Aug 2023 19:59:21 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DB297F805FB; Wed,  2 Aug 2023 19:58:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4A2FCF80558
	for <alsa-devel@alsa-project.org>; Wed,  2 Aug 2023 19:58:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4A2FCF80558
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20221208 header.b=ST/5jqkz
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-3fe2fb9b4d7so1394645e9.1
        for <alsa-devel@alsa-project.org>;
 Wed, 02 Aug 2023 10:58:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690999122; x=1691603922;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7E+xhja+1jrCpHxegbBsk22hE7b38rXeL+uTtQJDC68=;
        b=ST/5jqkzflkWDXQ7+gy1tnzteCKA9DH+Zn3Z1bd3QWdweQMyxUoz3JNZy29M0TXkAk
         D8Luxt8lV3Y6OPtuKagLAhF2wyOk8n9x48E3AzWvSZF99I6hnGP1kmm1K3LcXvP0aXA1
         W3EteyHyGFO4Itb0ymixr81ge2PuwGmULbcmzj/bDKqrleD2wQ6oSxxU8ouxFJz9ZdJe
         yNKtdhiQMAZfAOd/XgA+XFcCCoTWHkS+Rq1z5zVEz0y9WVg5YchGPUbYYzaIoQw8NImi
         iT69PeQ3SA08IBAn3r/oTCgQvMW9VbqXZZHwWY/goiqG7BNWaoPDJutDmCETgB9ZwgGm
         4nqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690999122; x=1691603922;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7E+xhja+1jrCpHxegbBsk22hE7b38rXeL+uTtQJDC68=;
        b=CBRwf22S2hjsWEEcKaRCQyFeSTmYVoqLfi9pN9Y+KotS0YEvWAylAsfCxaRYq6Iy6d
         EtFhpgxZmNjknjPqF+Gnet9hdeMPTOKGzONLunVDGC3ykZ1SXbh5DBIPY6A+8RG1fVs+
         m/rPTTp6xaONE1jZZFatL1aTdb8tLAQBmPGN0TsBB5ftoA33jPOJlYSBQ+jtmts9YO+f
         +1MSABuvE0kr6SpwOOIFby53nP/wTMi0BUNNSd4u1k/q+lH9n/1pPTMX3vMnDThohgbV
         I6gsXCMxyynEy8D5yQwcA27H+ug5qUteeGRvCMFVl+w/d6Wt9vf2cOjYAr/Auhs2Ft3Q
         3A8g==
X-Gm-Message-State: ABy/qLb4ufk3M8DnlCejG8xmvWii5LmlF6tf4D20KnWagzsiHlT1QPxu
	cNnwecJGdobYVbtQGVugo3t/uPiIEBE=
X-Google-Smtp-Source: 
 APBJJlGzX3CO1LF4O7+6d9YH3/jJclKl+auO3bb9ktPlErNofRTvqIfFV9fV871SszD/KIJLlcRuKQ==
X-Received: by 2002:a05:600c:20f:b0:3fb:fa9f:5292 with SMTP id
 15-20020a05600c020f00b003fbfa9f5292mr5339041wmi.25.1690999121618;
        Wed, 02 Aug 2023 10:58:41 -0700 (PDT)
Received: from ALPER-PC.. ([178.233.24.1])
        by smtp.gmail.com with ESMTPSA id
 l23-20020a7bc457000000b003fe20db88ebsm2192439wmi.31.2023.08.02.10.58.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Aug 2023 10:58:41 -0700 (PDT)
From: Alper Nebi Yasak <alpernebiyasak@gmail.com>
To: alsa-devel@alsa-project.org
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
	Alper Nebi Yasak <alpernebiyasak@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Takashi Iwai <tiwai@suse.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Jaroslav Kysela <perex@perex.cz>,
	linux-kernel@vger.kernel.org,
	Akihiko Odaki <akihiko.odaki@gmail.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	=?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?=
 <nfraprado@collabora.com>
Subject: [PATCH 24/27] ASoC: rockchip: rockchip_rt5645: Map missing jack
 kcontrols
Date: Wed,  2 Aug 2023 20:57:34 +0300
Message-Id: <20230802175737.263412-25-alpernebiyasak@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230802175737.263412-1-alpernebiyasak@gmail.com>
References: <20230802175737.263412-1-alpernebiyasak@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: LQ5E5D5ES44PEMW4IPGBLSXEX2X4XKEM
X-Message-ID-Hash: LQ5E5D5ES44PEMW4IPGBLSXEX2X4XKEM
X-MailFrom: alpernebiyasak@gmail.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/LQ5E5D5ES44PEMW4IPGBLSXEX2X4XKEM/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

This driver does not properly map jack pins to kcontrols that PulseAudio
and PipeWire need to handle jack detection events. The RT5645 codec used
here supports detecting Headphone and Headset Mic connections. Expose
both to userspace as kcontrols.

Signed-off-by: Alper Nebi Yasak <alpernebiyasak@gmail.com>
---

 sound/soc/rockchip/rockchip_rt5645.c | 22 +++++++++++++++++-----
 1 file changed, 17 insertions(+), 5 deletions(-)

diff --git a/sound/soc/rockchip/rockchip_rt5645.c b/sound/soc/rockchip/rockchip_rt5645.c
index e73a342b7953..ef9fdf0386cb 100644
--- a/sound/soc/rockchip/rockchip_rt5645.c
+++ b/sound/soc/rockchip/rockchip_rt5645.c
@@ -22,6 +22,16 @@
 #define DRV_NAME "rockchip-snd-rt5645"
 
 static struct snd_soc_jack headset_jack;
+static struct snd_soc_jack_pin headset_jack_pins[] = {
+	{
+		.pin = "Headphones",
+		.mask = SND_JACK_HEADPHONE,
+	},
+	{
+		.pin = "Headset Mic",
+		.mask = SND_JACK_MICROPHONE,
+	},
+};
 
 static const struct snd_soc_dapm_widget rk_dapm_widgets[] = {
 	SND_SOC_DAPM_HP("Headphones", NULL),
@@ -103,11 +113,13 @@ static int rk_init(struct snd_soc_pcm_runtime *runtime)
 	int ret;
 
 	/* Enable Headset and 4 Buttons Jack detection */
-	ret = snd_soc_card_jack_new(card, "Headset Jack",
-				    SND_JACK_HEADPHONE | SND_JACK_MICROPHONE |
-				    SND_JACK_BTN_0 | SND_JACK_BTN_1 |
-				    SND_JACK_BTN_2 | SND_JACK_BTN_3,
-				    &headset_jack);
+	ret = snd_soc_card_jack_new_pins(card, "Headset Jack",
+					 SND_JACK_HEADPHONE | SND_JACK_MICROPHONE |
+					 SND_JACK_BTN_0 | SND_JACK_BTN_1 |
+					 SND_JACK_BTN_2 | SND_JACK_BTN_3,
+					 &headset_jack,
+					 headset_jack_pins,
+					 ARRAY_SIZE(headset_jack_pins));
 	if (ret) {
 		dev_err(card->dev, "New Headset Jack failed! (%d)\n", ret);
 		return ret;
-- 
2.40.1

