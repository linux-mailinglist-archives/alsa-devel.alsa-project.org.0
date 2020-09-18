Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 07B3826FF06
	for <lists+alsa-devel@lfdr.de>; Fri, 18 Sep 2020 15:45:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8ECE916DE;
	Fri, 18 Sep 2020 15:44:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8ECE916DE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1600436728;
	bh=+zMTIgNm9f4+ujcTqhZKpz2XW/cwp0zRMFdkhgmo9Tc=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=NL1guxqiVyLm7lXd1RnfzL99zaYuko7zwKJmSkCxW+OMMn7iHhXzwhG6+nJzOZsFB
	 fdLain7q5N5rPJ3naILXyN/ivPSj70DhA6b2bPwuJmpckyZ0HCMuCbBnkWutlSmlVI
	 9wlRQKthDobiRuRqlFZkMlfI63/IL842Nxanjp+Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 95F8BF80150;
	Fri, 18 Sep 2020 15:43:47 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DA65BF8015A; Fri, 18 Sep 2020 15:43:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9A0BCF8012D
 for <alsa-devel@alsa-project.org>; Fri, 18 Sep 2020 15:43:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9A0BCF8012D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="XgCJZ0Du"
Received: by mail-wm1-x342.google.com with SMTP id q9so5396254wmj.2
 for <alsa-devel@alsa-project.org>; Fri, 18 Sep 2020 06:43:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=qvcbNvQjWzfNB0ydZSwT1sc9AT6Wn6EsN24KcPP/36s=;
 b=XgCJZ0DuaovlpuzVMN0KDk0ouqjnEUGGCr2lGUqOyIrSublpYtp3ZpJCBsHi5Sf+Do
 VOujaOSz/Dc2fmZMkjbiLacflo6IZdGoCHk4e+QYJwltpckDrV6YUnyipYE3i6EmMQ+I
 DWrvCp2GrHugnT9IAXTdZbLkUUlVQgHC9hWjQuYjYvCJXQfr8SXIc5dMijT661tImpdb
 v8mFtcUNF4hIcWgTOi6aU5RCJ06WNydGVKN2nok+A6Qh+O01ckO8xSEcUUt/SSazBk94
 pmw5oOyJmnD3JVgcwBEeu6orgO+BgGRtktg8RKMr1aQ8cTd65Oh1TYGjeQPIYeHCoLBH
 gV9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=qvcbNvQjWzfNB0ydZSwT1sc9AT6Wn6EsN24KcPP/36s=;
 b=GHDws4n5hFf/Dw/g5Sw4OUzEOaDwKR/FBEwlnwlVGL84g7bDx3fcNlRuhLwvpKR+CJ
 saNXK7tZxSLt2gTX9BzPAXdtKewhEOT/QkSJO8z5DEMUQRuL7zlvhRIXi5Cj6nrGAWlM
 VrW7XImff+xWF/th88VzQpHZLBNij1VkbDfxkGM4l9DOrjhCeOY8wnrBYjWhmolcM6Xe
 uVDapuIVLfy3nlutHnQvjK2UQlyfWppugIX+wbcqxnYLL6ONFaiIJUMshnPGoYi/rtdL
 8JWcdshS6btpBunN/oOE0IXfZk2NxceTfx9jgtCEY8oxH4+HH6mKAW/pwxzW/OKT7GCD
 VlPA==
X-Gm-Message-State: AOAM53223V5lb8Gi+SbADw4yOd22S7W4jUbT18B8UXjVY7ceJvNVD7cK
 AOiX0ZcvVz4gRFghhldaCwXpVfFctdfg5Q==
X-Google-Smtp-Source: ABdhPJzkEaXcmSpXwnkDENmv3OilQgvOgxammH6DrXwKx4UPCA5t5HjPAlG/vM6zCMgYkKWJ7Le7mg==
X-Received: by 2002:a1c:4886:: with SMTP id
 v128mr15978850wma.139.1600436614205; 
 Fri, 18 Sep 2020 06:43:34 -0700 (PDT)
Received: from localhost.localdomain ([78.30.5.109])
 by smtp.googlemail.com with ESMTPSA id l4sm5049906wme.43.2020.09.18.06.43.33
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 18 Sep 2020 06:43:33 -0700 (PDT)
From: =?UTF-8?q?Guillermo=20Rodr=C3=ADguez?= <guille.rodriguez@gmail.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ASoC: cs42l51: add additional ADC volume controls
Date: Fri, 18 Sep 2020 15:43:16 +0200
Message-Id: <20200918134317.22574-1-guille.rodriguez@gmail.com>
X-Mailer: git-send-email 2.26.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: =?UTF-8?q?Guillermo=20Rodr=C3=ADguez?= <guille.rodriguez@gmail.com>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, James Schulman <james.schulman@cirrus.com>,
 David Rhodes <david.rhodes@cirrus.com>
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

Add volume controls for:
- Analog programmable gain amplifier (PGA) (-3 .. +12 dB)
- ADC attenuator (0 .. -96 dB)

Signed-off-by: Guillermo Rodríguez <guille.rodriguez@gmail.com>
---
 sound/soc/codecs/cs42l51.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/sound/soc/codecs/cs42l51.c b/sound/soc/codecs/cs42l51.c
index 764f2ef8f59d..097c4e8d9950 100644
--- a/sound/soc/codecs/cs42l51.c
+++ b/sound/soc/codecs/cs42l51.c
@@ -122,6 +122,9 @@ static const char *chan_mix[] = {
 	"R L",
 };
 
+static const DECLARE_TLV_DB_SCALE(pga_tlv, -300, 50, 0);
+static const DECLARE_TLV_DB_SCALE(adc_att_tlv, -9600, 100, 0);
+
 static SOC_ENUM_SINGLE_EXT_DECL(cs42l51_chan_mix, chan_mix);
 
 static const struct snd_kcontrol_new cs42l51_snd_controls[] = {
@@ -138,6 +141,12 @@ static const struct snd_kcontrol_new cs42l51_snd_controls[] = {
 			0, 0x19, 0x7F, adc_pcm_tlv),
 	SOC_DOUBLE_R("ADC Mixer Switch",
 			CS42L51_ADCA_VOL, CS42L51_ADCB_VOL, 7, 1, 1),
+	SOC_DOUBLE_R_SX_TLV("ADC Attenuator Volume",
+			CS42L51_ADCA_ATT, CS42L51_ADCB_ATT,
+			0, 0xA0, 96, adc_att_tlv),
+	SOC_DOUBLE_R_SX_TLV("PGA Volume",
+			CS42L51_ALC_PGA_CTL, CS42L51_ALC_PGB_CTL,
+			0, 0x1A, 30, pga_tlv),
 	SOC_SINGLE("Playback Deemphasis Switch", CS42L51_DAC_CTL, 3, 1, 0),
 	SOC_SINGLE("Auto-Mute Switch", CS42L51_DAC_CTL, 2, 1, 0),
 	SOC_SINGLE("Soft Ramp Switch", CS42L51_DAC_CTL, 1, 1, 0),
-- 
2.26.0

