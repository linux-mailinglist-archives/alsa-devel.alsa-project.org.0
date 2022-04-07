Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CF7B4F8FE8
	for <lists+alsa-devel@lfdr.de>; Fri,  8 Apr 2022 09:52:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ACA02190E;
	Fri,  8 Apr 2022 09:51:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ACA02190E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1649404361;
	bh=NDa3acAKvX94tKVHxm3cIaDLp/13Cg5yVsZnxLWYj8Q=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=nNStVmDcSNvCg2x5jon72mo86CS5Z8r0Xp/1p66koF7ovxxrF8ZCNJx1NXA/kEA3x
	 Qmt+3k03Zy1DHr7bKZzywG4cVdG3AQWq0GP8eMO09JKBxfFvX2a7ShBuACQwHLF+8c
	 ndjGlctZAk43sNUNLdeDqtcQD65BW+EkcVpab5hU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BA83FF80564;
	Fri,  8 Apr 2022 09:48:22 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0D724F80085; Thu,  7 Apr 2022 16:13:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com
 [IPv6:2607:f8b0:4864:20::1029])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5CC71F80085
 for <alsa-devel@alsa-project.org>; Thu,  7 Apr 2022 16:13:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5CC71F80085
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="qxQqqf9d"
Received: by mail-pj1-x1029.google.com with SMTP id fu5so5745430pjb.1
 for <alsa-devel@alsa-project.org>; Thu, 07 Apr 2022 07:13:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=mR1YeWMU9tOSnx680BK1SzX5cCKeKB4fg1ibUdrnHdE=;
 b=qxQqqf9dbh1s4SOObcF+A7r6654kIcBnfemh5JwgpwDw9OjGdqjXErU8mqdijeekSC
 loz5BCCusyTbjFg3wiHAgRiJBdc948kp8LH+LZio0/SZIWfoj0voECmUcLpqjb06iL7L
 I+PBrKBpMj/URRb4cFfYAd+qKWdaOIwVdeVyH00i2ANa3rV84pBy48BUVqvLg9sDYhYu
 0t+6DhJYApEMDvKs5C4xHem9+56dSvMihbXiRfgIlTFUB3DRvMa7W5tOuZU4pVpHAQif
 gx9V4lJDwmSTgZBAnGlpnNvIUqnMKReCqkTDr2u1eniwFjTPrS8cYnIhW0haXndr/ACZ
 bpIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=mR1YeWMU9tOSnx680BK1SzX5cCKeKB4fg1ibUdrnHdE=;
 b=wCJh2X/Nn9rg3kOKwQPyNp2Wz77wTy/Bj6G5d3lvtoJ3IMMqNuTsZ8tBHDExLfzbyw
 ZrrAReMM4VCR8V2ETjC5XiAp74ogvOBPp4at9dLOJb0VnG7fD4FMYRV7tbMBX/+n12aC
 sRYVc2XdlORiyVls1ZuvJqa+Y5nMSO3k/layID3waeAfzNGjGOnGjchraqibk/a8DLkY
 ZvQ75R2UA3tKfI2MYJ+gwiEZaNvucffWnK3a+KbA5oOfLpe42l8AWbRtqVVavmniA7Ch
 QBJcfqGdKIF7BeB24rxehpQIBDN0h7glJoxpdzk4kZAIVaZvU0Fi0Q68IlomIvDVndL2
 kW9Q==
X-Gm-Message-State: AOAM531bj/oOMcgrgT4tn0lPae0pa2D9qe3V++vDJ1oVzkl7hQ0ijLp1
 p4amG1UIt3+hZUX02bmdbX5PksdjYFQ=
X-Google-Smtp-Source: ABdhPJzE8uGA9C15x77lzGAz2d8S8eq63Rm8lnGX6kNwkdDAlDbhC9zDlQ0/mAFkm+ODMIrfRM8ySQ==
X-Received: by 2002:a17:90b:4a0b:b0:1c7:221a:a600 with SMTP id
 kk11-20020a17090b4a0b00b001c7221aa600mr16063589pjb.112.1649340809591; 
 Thu, 07 Apr 2022 07:13:29 -0700 (PDT)
Received: from fedora.flets-east.jp ([2400:4050:c360:8200:8ae8:3c4:c0da:7419])
 by smtp.gmail.com with ESMTPSA id
 ne4-20020a17090b374400b001cb142237a8sm2311614pjb.4.2022.04.07.07.13.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Apr 2022 07:13:28 -0700 (PDT)
From: Akihiko Odaki <akihiko.odaki@gmail.com>
To: 
Subject: [PATCH] ASoC: rt5682: Add jack kcontrol
Date: Thu,  7 Apr 2022 23:13:16 +0900
Message-Id: <20220407141316.5099-1-akihiko.odaki@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 08 Apr 2022 09:48:11 +0200
Cc: Oder Chiou <oder_chiou@realtek.com>, alsa-devel@alsa-project.org,
 Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org,
 Mark Brown <broonie@kernel.org>, Akihiko Odaki <akihiko.odaki@gmail.com>
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

Create a jack kcontrol manually as rt5682 does not use DAPM pins
for jack and will not have kcontrols for them.

Signed-off-by: Akihiko Odaki <akihiko.odaki@gmail.com>
---
 include/sound/jack.h      | 2 +-
 sound/core/jack.c         | 3 +--
 sound/soc/codecs/rt5682.c | 5 +++++
 3 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/include/sound/jack.h b/include/sound/jack.h
index 1181f536557e..bb5fcbd70d7c 100644
--- a/include/sound/jack.h
+++ b/include/sound/jack.h
@@ -60,10 +60,10 @@ struct snd_jack {
 	struct list_head kctl_list;
 	struct snd_card *card;
 	const char *id;
+	int type;
 #ifdef CONFIG_SND_JACK_INPUT_DEV
 	struct input_dev *input_dev;
 	int registered;
-	int type;
 	char name[100];
 	unsigned int key[6];   /* Keep in sync with definitions above */
 #endif /* CONFIG_SND_JACK_INPUT_DEV */
diff --git a/sound/core/jack.c b/sound/core/jack.c
index d1e3055f2b6a..967a9769ea24 100644
--- a/sound/core/jack.c
+++ b/sound/core/jack.c
@@ -530,8 +530,6 @@ int snd_jack_new(struct snd_card *card, const char *id, int type,
 
 		jack->input_dev->phys = "ALSA";
 
-		jack->type = type;
-
 		for (i = 0; i < SND_JACK_SWITCH_TYPES; i++)
 			if (type & (1 << i))
 				input_set_capability(jack->input_dev, EV_SW,
@@ -545,6 +543,7 @@ int snd_jack_new(struct snd_card *card, const char *id, int type,
 		goto fail_input;
 
 	jack->card = card;
+	jack->type = type;
 	INIT_LIST_HEAD(&jack->kctl_list);
 
 	if (initial_kctl)
diff --git a/sound/soc/codecs/rt5682.c b/sound/soc/codecs/rt5682.c
index be68d573a490..583dc80f08d0 100644
--- a/sound/soc/codecs/rt5682.c
+++ b/sound/soc/codecs/rt5682.c
@@ -1012,6 +1012,7 @@ static int rt5682_set_jack_detect(struct snd_soc_component *component,
 		struct snd_soc_jack *hs_jack, void *data)
 {
 	struct rt5682_priv *rt5682 = snd_soc_component_get_drvdata(component);
+	int ret;
 
 	rt5682->hs_jack = hs_jack;
 
@@ -1025,6 +1026,10 @@ static int rt5682_set_jack_detect(struct snd_soc_component *component,
 		return 0;
 	}
 
+	ret = snd_jack_add_new_kctl(hs_jack->jack, hs_jack->jack->id, hs_jack->jack->type);
+	if (ret)
+		dev_warn(component->dev, "Failed to create jack kcontrol - %d\n", ret);
+
 	if (!rt5682->is_sdw) {
 		switch (rt5682->pdata.jd_src) {
 		case RT5682_JD1:
-- 
2.35.1

