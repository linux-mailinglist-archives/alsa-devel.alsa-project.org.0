Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 396BC5FFFAB
	for <lists+alsa-devel@lfdr.de>; Sun, 16 Oct 2022 15:30:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CDE5D61DA;
	Sun, 16 Oct 2022 15:29:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CDE5D61DA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1665927046;
	bh=GAw/0cPvVF5y28P+zAqaf/mFWtMcoUdj+ef8I4K9Lvo=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=M5G6QfSllKnF4Xg+y+PL8bv5yjeeYu7m//LkSC4jYnNiqZjM4se3KBdXM8Xm8id3E
	 KopuGNhC+lhZSoZSBu/mTZYA3ih+94pdK2BBoTh7rgCv+iUvgaBhxtyP1Plav4HnaU
	 MImEl8WpF/wWY+/8z5YDzBAX2xVKhgnt65HG7wCk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1677DF80579;
	Sun, 16 Oct 2022 15:28:03 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 26A9AF8055C; Sun, 16 Oct 2022 15:28:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
 RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 687C9F8053D
 for <alsa-devel@alsa-project.org>; Sun, 16 Oct 2022 15:27:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 687C9F8053D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="gbkTAWWF"
Received: by mail-ed1-x533.google.com with SMTP id s2so12694313edd.2
 for <alsa-devel@alsa-project.org>; Sun, 16 Oct 2022 06:27:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=R19Q50f+4lJZEQStb2xYnMd/U/8/rdyoHM9BaeMxvps=;
 b=gbkTAWWF6YY0ZHs9zxW1q9aUl6tCSvP9p4r8o3h1d5cTHJFV3BITvz6EgkHXD12VPF
 r45o4jjfXEVXaDE/HgXGhGzJtcVV2tdAG/hD8z35OgMVtzXvqc0uJhza7xWHJyBjphM5
 KN/0vaIoXgSILYv9JTWA/uVS6KYRY7P5dD5U9VIfjQ0RjJWD4XYLgl2+UftSL18DV1WT
 EHX+vVJpBDNvGUneUs+D1qh5G3Yam3mNSxnkhS8egoHtqPFC+yuNa9afL/DT2fBD/U4R
 vZlRwQPnZoOKFbfVmWMDHxNYmyY8P9UmCCc85qLYSYUpayfKCee0JP+vG0mhZYggG3AY
 uSiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=R19Q50f+4lJZEQStb2xYnMd/U/8/rdyoHM9BaeMxvps=;
 b=Vt/F3WvQTGN6YMyw78KSaEhhoFKCOj1jKiJNqNSCxvnRiahsyUvqnQiiU9uNiwUQDU
 V9g4LlabM/GVJgXM5ZKjkMjYbO9JvS46TmlIYvGz5dsE8L0AyqpyhbJ6tsi0/43nCecs
 Lk0oAhzO0EMHQWFPjMcft0+7UShP9FVYA/Ntll4hQNTpspHeKvuSoY2GJd7FmYaCNzjI
 bIVBLXnN+To1n5FT0T973dwBb0tfukyk+RlRuxJCpZ/geiAnCUmbDlo3buF9FJrrVmw2
 7iV29fCLU4+/wwLd+kuRUGjCrlPvPh23j2tTxXrdVj0fuXriNZJxITkKfXfItglsE3S2
 1qKw==
X-Gm-Message-State: ACrzQf0v37MyhfTzoHMWxSgF2VUrfk8E7/X8d4wnpEx3usr11RfbTkkx
 nSynUZH0SKaLdZ5YDuNhyC8=
X-Google-Smtp-Source: AMsMyM4CLc3sbcJ+XcUb7r1QZ6mjeycYteXNf0YLcpCxBQ7DSnn0VWt1dxwJNrSay4i3SURbUIJ5SA==
X-Received: by 2002:a05:6402:5190:b0:45c:fca7:e07b with SMTP id
 q16-20020a056402519000b0045cfca7e07bmr6145825edd.327.1665926876937; 
 Sun, 16 Oct 2022 06:27:56 -0700 (PDT)
Received: from hp-power-15.localdomain
 (mm-39-7-212-37.vitebsk.dynamic.pppoe.byfly.by. [37.212.7.39])
 by smtp.gmail.com with ESMTPSA id
 y5-20020aa7ce85000000b0045c72bba0bfsm5572057edv.4.2022.10.16.06.27.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 16 Oct 2022 06:27:56 -0700 (PDT)
From: Siarhei Volkau <lis8215@gmail.com>
To: 
Subject: [PATCH v3 7/7] ASoC: codecs: jz4725b: add missed microphone widgets
Date: Sun, 16 Oct 2022 16:26:48 +0300
Message-Id: <20221016132648.3011729-8-lis8215@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20221016132648.3011729-1-lis8215@gmail.com>
References: <20221016132648.3011729-1-lis8215@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, linux-mips@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Paul Cercueil <paul@crapouillou.net>, Siarhei Volkau <lis8215@gmail.com>,
 Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org
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

Microphone input can be single ended or differential, although
known SoCs with that codec expose MIC1P only.

Also there is 20dB mic boost in the Mic1 path.

Signed-off-by: Siarhei Volkau <lis8215@gmail.com>
---
 sound/soc/codecs/jz4725b.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/sound/soc/codecs/jz4725b.c b/sound/soc/codecs/jz4725b.c
index 52b2bb95b..685ba1d3a 100644
--- a/sound/soc/codecs/jz4725b.c
+++ b/sound/soc/codecs/jz4725b.c
@@ -175,6 +175,15 @@ static const SNDRV_CTL_TLVD_DECLARE_DB_RANGE(jz4725b_out_tlv,
 	12, 23, TLV_DB_SCALE_ITEM(-1050, 100, 0),
 	24, 31, TLV_DB_SCALE_ITEM(  100,  50, 0),
 );
+static const SNDRV_CTL_TLVD_DECLARE_DB_SCALE(jz4725b_mic_boost_tlv, 0, 2000, 0);
+
+static const char * const jz4725b_mic_mode_texts[] = {
+	"Single Ended", "Differential",
+};
+
+static const struct soc_enum jz4725b_mic_mode_enum =
+	SOC_ENUM_SINGLE(JZ4725B_CODEC_REG_CR3, REG_CR3_MICDIFF_OFFSET,
+			2, jz4725b_mic_mode_texts);
 
 static const struct snd_kcontrol_new jz4725b_codec_controls[] = {
 	SOC_DOUBLE_TLV("DAC Playback Volume",
@@ -219,6 +228,13 @@ static const struct snd_kcontrol_new jz4725b_codec_controls[] = {
 	SOC_SINGLE("High-Pass Filter Capture Switch",
 		   JZ4725B_CODEC_REG_CR2,
 		   REG_CR2_ADC_HPF_OFFSET, 1, 0),
+
+	SOC_ENUM("Mic Mode Capture Switch", jz4725b_mic_mode_enum),
+
+	SOC_SINGLE_TLV("Mic1 Boost Capture Volume",
+		       JZ4725B_CODEC_REG_PMR2,
+		       REG_PMR2_GIM_OFFSET,
+		       1, 0, jz4725b_mic_boost_tlv),
 };
 
 static const char * const jz4725b_codec_adc_src_texts[] = {
-- 
2.36.1

