Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C514B76D66E
	for <lists+alsa-devel@lfdr.de>; Wed,  2 Aug 2023 20:05:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4236DE85;
	Wed,  2 Aug 2023 20:04:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4236DE85
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690999534;
	bh=iQFS0AaAK0w8IhJixhmdKxgTU2gJt7xbAmAP4xFQGM8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=pc3qAXMuooPPcrpLS8e2WJPfZRLHB7gOLrYm8eFq121QCxr4znmJMOOYe27H6Nfd/
	 4wqaQrFY4hn3FNlRUcSPKdJ1fmTOxiYRsyY0SX2SQ4rnMaVH9W/krwph46w83VUbnQ
	 dj3qp26/h6bwX/7UTJ1r+FG/g0RMcUNucF6YsLRM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0DBEFF8068E; Wed,  2 Aug 2023 19:59:28 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6A79EF80692;
	Wed,  2 Aug 2023 19:59:28 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8DCD6F80609; Wed,  2 Aug 2023 19:58:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 537AEF805FF
	for <alsa-devel@alsa-project.org>; Wed,  2 Aug 2023 19:58:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 537AEF805FF
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20221208 header.b=jG029gDz
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-3fe110de3b6so917715e9.1
        for <alsa-devel@alsa-project.org>;
 Wed, 02 Aug 2023 10:58:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690999125; x=1691603925;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0QAIWP4M6rBKtTpn/rRinZikOOxcMUXJXPcYbOcWh7A=;
        b=jG029gDzx1VlaSJ6xc7aVKpj0Yef+5LN2PYEenXcXD3VNalatBnZxvLwaxFCBLAjwI
         pCU5V57NMxEkbzjVj7F28GLT9ocP47sWxQkPY+L7VYTFULVtn4pHf9a5Tihq1TE076Ho
         gRUFUZ7hQflSR1jA0q8oBDeJn96GDbIoCE8e5iKcEAb9D1qMkOu+S6PPk43/1HG8lGJV
         Y4hObvXevJX5xCJrPb7FVXhkZJCJmgvYmgSku5qWRfrNjtspBZcIe/HmUwqQVwOjUkOO
         tAeRA1MRPXTPmr8YW2KSiqix3l1nC7oPSZdEB1hmbcPePoeOax5Uysacrx6N2ELLkZkS
         G2Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690999125; x=1691603925;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0QAIWP4M6rBKtTpn/rRinZikOOxcMUXJXPcYbOcWh7A=;
        b=Y5dl52Gf1EpFIOZSVBaD7kmM3rpwwzDYUvXJRqYLdKocLlFJkiI2Jg2IMVeF3paJQb
         YsnWULnjFG2PuHq2UrDtQJGGgi1SfwD74rPQhr5uixbXFVAuCY9Xv1IQUHsUghxXQ+Yi
         mPU2fHweLIrO8FZ40HievC93lQfGjruDoVJjqjFE3IY4RxnP1fuhmvpEsRjR219IuxdE
         bBANNuXFBYIhvwb8UaBxAlPli9WfjLSLq179eOCHqIYfQ+QXZYn2e3AH8alni+SsAWoY
         c/9NivAYI0p/N0JAWa+jMmj0LvwNNPop/Sjg8AgQ7UbLQfW3b7Y2Pvx476g0W/sN83ZJ
         TyPQ==
X-Gm-Message-State: ABy/qLbSZQX1uUkgLL4OcDH/OTQGvLm7JiPkZhs7DtYEs/lnqrRKs8hR
	rqZRNY/BpeGheG7zbtmB7sZkNjX8BoE=
X-Google-Smtp-Source: 
 APBJJlEJ2EggviBFizXfzV+h7ot9Z1XD8RFiIvdOE3MYyO8E+jcUIKdnaY6u9B81DSwbVXGUTI3kOA==
X-Received: by 2002:a05:600c:4f06:b0:3fa:88b4:bff3 with SMTP id
 l6-20020a05600c4f0600b003fa88b4bff3mr5859273wmq.11.1690999125540;
        Wed, 02 Aug 2023 10:58:45 -0700 (PDT)
Received: from ALPER-PC.. ([178.233.24.1])
        by smtp.gmail.com with ESMTPSA id
 l23-20020a7bc457000000b003fe20db88ebsm2192439wmi.31.2023.08.02.10.58.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Aug 2023 10:58:45 -0700 (PDT)
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
Subject: [PATCH 26/27] ASoC: samsung: lowland: Split Line Out jack kcontrol
 from Headphone
Date: Wed,  2 Aug 2023 20:57:36 +0300
Message-Id: <20230802175737.263412-27-alpernebiyasak@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230802175737.263412-1-alpernebiyasak@gmail.com>
References: <20230802175737.263412-1-alpernebiyasak@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: X5KLGBDS3T2U5RK4R7TXIDYVK6QQX6C3
X-Message-ID-Hash: X5KLGBDS3T2U5RK4R7TXIDYVK6QQX6C3
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/X5KLGBDS3T2U5RK4R7TXIDYVK6QQX6C3/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

This driver has correctly mapped jack kcontrols for Headphone and
Headset Mic. However, it is also mapping Line Out jack detection events
to the Headphone kcontrol.

The WM5100 codec used here can distinguish Line Out connections from
Headphone connections. Decouple the two, expose Line Out to userspace as
an independent kcontrol and add the necessary widget.

Signed-off-by: Alper Nebi Yasak <alpernebiyasak@gmail.com>
---
I'm not sure this is a good idea, but still...

 sound/soc/samsung/lowland.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/sound/soc/samsung/lowland.c b/sound/soc/samsung/lowland.c
index 106770be6fc5..a79df871ea13 100644
--- a/sound/soc/samsung/lowland.c
+++ b/sound/soc/samsung/lowland.c
@@ -22,12 +22,16 @@ static struct snd_soc_jack lowland_headset;
 static struct snd_soc_jack_pin lowland_headset_pins[] = {
 	{
 		.pin = "Headphone",
-		.mask = SND_JACK_HEADPHONE | SND_JACK_LINEOUT,
+		.mask = SND_JACK_HEADPHONE,
 	},
 	{
 		.pin = "Headset Mic",
 		.mask = SND_JACK_MICROPHONE,
 	},
+	{
+		.pin = "Line Out",
+		.mask = SND_JACK_LINEOUT,
+	},
 };
 
 static int lowland_wm5100_init(struct snd_soc_pcm_runtime *rtd)
@@ -140,11 +144,13 @@ static const struct snd_kcontrol_new controls[] = {
 	SOC_DAPM_PIN_SWITCH("WM1250 Input"),
 	SOC_DAPM_PIN_SWITCH("WM1250 Output"),
 	SOC_DAPM_PIN_SWITCH("Headphone"),
+	SOC_DAPM_PIN_SWITCH("Line Out"),
 };
 
 static const struct snd_soc_dapm_widget widgets[] = {
 	SND_SOC_DAPM_HP("Headphone", NULL),
 	SND_SOC_DAPM_MIC("Headset Mic", NULL),
+	SND_SOC_DAPM_LINE("Line Out", NULL),
 
 	SND_SOC_DAPM_SPK("Main Speaker", NULL),
 
-- 
2.40.1

