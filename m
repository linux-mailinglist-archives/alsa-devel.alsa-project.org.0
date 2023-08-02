Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DED9876D663
	for <lists+alsa-devel@lfdr.de>; Wed,  2 Aug 2023 20:03:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DEFC9DED;
	Wed,  2 Aug 2023 20:02:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DEFC9DED
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690999407;
	bh=ajLtkER/3IRp+AAbo1L5IpJLnnbMCls0fRNliYEQMSc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=uwYQxEVFu5sOvQ+m4TPfuw4YjrCgISLjYhMKSLmRuIi9/6BpevMJ7D6zbhxGlaR+B
	 vJ8sX+704N5fazTs+zTBTVD4uYS5nokN3RJymZqLtu//sO2Ld1iztq5iEyXjMjcZaS
	 PhlWR8jqaoTK3o1E8Gd5tFiNBr1J/aWCQTVYO0UQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 979B8F80630; Wed,  2 Aug 2023 19:59:05 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 63DBCF8053B;
	Wed,  2 Aug 2023 19:59:05 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4DC8BF805AF; Wed,  2 Aug 2023 19:58:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 979A6F805D5
	for <alsa-devel@alsa-project.org>; Wed,  2 Aug 2023 19:58:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 979A6F805D5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20221208 header.b=o61PY30O
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-3fbc59de009so1195425e9.3
        for <alsa-devel@alsa-project.org>;
 Wed, 02 Aug 2023 10:58:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690999110; x=1691603910;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XyXZmbrejVy6oU7P85KygnAFUmokjdS7T3od5TZzPV0=;
        b=o61PY30OWJEqIsIJbqjC2wEfrFt++nmLh2bc7nDkGL4MxB0bYYDOddvwOSTvGgO9/1
         RHnKe82BAvOY83+5Xd7YOx6OdqDvUJ9VfsRQaxg410gY6M8Z1JzmF12gvrgEX+EXNG9i
         Bwn0OqH9bVANcCIpVEZci0Iki55/dZZrXWhvR3962AXTLoDu8IV6Cgx415uAlEIIhQxX
         P1ta1eLDdskcspu7cWdvn25AoQdd7Ot8Vb4AsPGUfqe40RI/3U7vpm2361KN1PXfCLP2
         lKV9u/gO3uLo2KNITq31zmI+fiqfmVrYKpoaPaqovx35yulDGwhwI9Psm2w6ScUR+/1x
         Kk3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690999110; x=1691603910;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XyXZmbrejVy6oU7P85KygnAFUmokjdS7T3od5TZzPV0=;
        b=YRTZxplrHiNGyUPgwel/KHagsaz9IwE0vHCWUUYZwyrau19ZcUHdTD6tkHoua/0jQy
         blVQYCkzzz5fy1vefceBZUMUvVU/gbwsqDxsZvEk3+9XkjEVXKwPC9bMXb+Son5nu7IU
         M6yxe9/t1FPnytUJOxXVsvj0qnlyOP8MxlNcNl5QmTWA5hRw0EiVptWtHetVo7ODKDLr
         zcvxTzDuxDmtehbiG7QSLvdgfGNZR4DbQl8IpxFsRCUY6sQs/HOYnNHwCQ0WtWSSOs2q
         6O0QBRA3MesdYYpYwusvPIh4H3AeoUVrngazcLCEw798ncxNJMkqHtulBvjL9w+FM58e
         WttA==
X-Gm-Message-State: ABy/qLZsIKGUkBd0ei2pin4KFjiyVs2qG47o55Lz/wFlKRUoHiHCm6v+
	Q9iwTmxd6+bOobVRq3mYYn4qIg9IilQ=
X-Google-Smtp-Source: 
 APBJJlG6lh7xO8s7gdwcdPpW393CzJ8GrsGTZ/O8tPJvPn73H1VkhPTU437+89OuIPBLICk0Dx6pWw==
X-Received: by 2002:a1c:7714:0:b0:3fb:be7c:d58a with SMTP id
 t20-20020a1c7714000000b003fbbe7cd58amr4909567wmi.26.1690999109889;
        Wed, 02 Aug 2023 10:58:29 -0700 (PDT)
Received: from ALPER-PC.. ([178.233.24.1])
        by smtp.gmail.com with ESMTPSA id
 l23-20020a7bc457000000b003fe20db88ebsm2192439wmi.31.2023.08.02.10.58.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Aug 2023 10:58:29 -0700 (PDT)
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
Subject: [PATCH 18/27] ASoC: mediatek: mt8186-mt6366-da7219-max98357: Map
 missing jack kcontrols
Date: Wed,  2 Aug 2023 20:57:28 +0300
Message-Id: <20230802175737.263412-19-alpernebiyasak@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230802175737.263412-1-alpernebiyasak@gmail.com>
References: <20230802175737.263412-1-alpernebiyasak@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: RWU5BPK5NYD5FIHFMT6QHQROZ75BPTQE
X-Message-ID-Hash: RWU5BPK5NYD5FIHFMT6QHQROZ75BPTQE
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/RWU5BPK5NYD5FIHFMT6QHQROZ75BPTQE/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Commit 8e9867486806 ("ASoC: mediatek: mt8186-da7219: Expose individual
headset jack pins") maps kcontrols for Headphone and Headset Mic jacks
for this driver so that PulseAudio and PipeWire can handle jack
detection events for these peripherals.

The DA7219 codec used here can also distinguish between Headphone and
Line Out connections that go into the same physical port. Expose the
latter to userspace as a kcontrol as well and add the necessary widgets.

Signed-off-by: Alper Nebi Yasak <alpernebiyasak@gmail.com>
---

 sound/soc/mediatek/mt8186/mt8186-mt6366-da7219-max98357.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/sound/soc/mediatek/mt8186/mt8186-mt6366-da7219-max98357.c b/sound/soc/mediatek/mt8186/mt8186-mt6366-da7219-max98357.c
index 0432f9d89020..aa8e00bba19b 100644
--- a/sound/soc/mediatek/mt8186/mt8186-mt6366-da7219-max98357.c
+++ b/sound/soc/mediatek/mt8186/mt8186-mt6366-da7219-max98357.c
@@ -46,6 +46,10 @@ static struct snd_soc_jack_pin mt8186_jack_pins[] = {
 		.pin = "Headset Mic",
 		.mask = SND_JACK_MICROPHONE,
 	},
+	{
+		.pin = "Line Out",
+		.mask = SND_JACK_LINEOUT,
+	},
 };
 
 static struct snd_soc_codec_conf mt8186_mt6366_da7219_max98357_codec_conf[] = {
@@ -964,6 +968,7 @@ mt8186_mt6366_da7219_max98357_widgets[] = {
 	SND_SOC_DAPM_SPK("Speakers", NULL),
 	SND_SOC_DAPM_HP("Headphones", NULL),
 	SND_SOC_DAPM_MIC("Headset Mic", NULL),
+	SND_SOC_DAPM_LINE("Line Out", NULL),
 	SND_SOC_DAPM_OUTPUT("HDMI1"),
 	SND_SOC_DAPM_MIXER(SOF_DMA_DL1, SND_SOC_NOPM, 0, 0, NULL, 0),
 	SND_SOC_DAPM_MIXER(SOF_DMA_DL2, SND_SOC_NOPM, 0, 0, NULL, 0),
@@ -996,6 +1001,7 @@ mt8186_mt6366_da7219_max98357_controls[] = {
 	SOC_DAPM_PIN_SWITCH("Speakers"),
 	SOC_DAPM_PIN_SWITCH("Headphones"),
 	SOC_DAPM_PIN_SWITCH("Headset Mic"),
+	SOC_DAPM_PIN_SWITCH("Line Out"),
 	SOC_DAPM_PIN_SWITCH("HDMI1"),
 };
 
-- 
2.40.1

