Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 55AA063B31
	for <lists+alsa-devel@lfdr.de>; Tue,  9 Jul 2019 20:39:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C649F165D;
	Tue,  9 Jul 2019 20:38:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C649F165D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1562697553;
	bh=o+tZpWQGa6PogVnZoisV3dPTsZ0kYmq9H2+RcXAPzMk=;
	h=Date:From:To:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=dWiQ6iReLanx4q+jhOPokAsmUDYpyS5aNJOFKZIx2fiEtqu26Z9dbptsQeRAx2j/i
	 xK8/4+WPCpNKiuezVZSWJyBOUyyM5mI5X3RZOCebjzjOD+d9XiGCFOGZb73tGsjVbq
	 U40xc7x1NIWTsoinDbHJHO0ipMzziWssbrL7gxPA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DB5A5F80274;
	Tue,  9 Jul 2019 20:37:28 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7E879F80274; Tue,  9 Jul 2019 20:37:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,PDS_NO_HELO_DNS,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AE13FF801A4
 for <alsa-devel@alsa-project.org>; Tue,  9 Jul 2019 20:37:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AE13FF801A4
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="sU5195Zy"
Received: by mail-pg1-x541.google.com with SMTP id q4so9886765pgj.8
 for <alsa-devel@alsa-project.org>; Tue, 09 Jul 2019 11:37:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:subject:message-id:mime-version:content-disposition
 :user-agent; bh=St7FhH/B2+2QgaaqOEQBdmC5rnxH6VjFL6gJzmS5t78=;
 b=sU5195Zy+46v8fdhHcGm6ZEuoHLruB9abDWcULfRtfkiyh6Rel3d/I0zTH7cHEv4wP
 8KARyhwvnDuxfsOPRDv1iq7YPCSVMm5bleuSwiaGyrcOf8IykUYsEHPZV5VhtEhhJopY
 RgMkap+TkVQHIKcy1R151Wvp1E0d0pilsZGHKdUoDNtxAAtg75gJq7rx5TcKkQl3leNP
 Kc+09sfa5b6WvMUfCi2GAPKFw/Znlxxu1x/CdMc9iDRJVLyZnVb9vSW5WftFnVGDNQiY
 arS1e16fRgVrukTkmjWwS52WqO3E8CJQCL2RrkZlx7RfVVDL4unn7I0eIqEEnj/mH9Cu
 gWvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:subject:message-id:mime-version
 :content-disposition:user-agent;
 bh=St7FhH/B2+2QgaaqOEQBdmC5rnxH6VjFL6gJzmS5t78=;
 b=idIavwwxBZryprFdauIvrR1x7/ePI7zJqv3NZQlM5vuzRK48UX7Meq/wBpnBOpMehq
 S0FtRfBYDuSi/YXOgf5mGtuSglY0uoKOXOpbk/994apqPNR8cARIY/p4Xcpcs5ibLoIc
 q+FQcU2AWwQOC2nOLGpFrAVx/wViTMzz0kSItNl6HKoryS/J2OHE8j8EEav5uD+L5QjK
 oUQ4LwI4EaqDIgMnm28PvuOlMWLQ0PiKR3ZWCvMGXVKm8Y4RyVyIG8DtGTcmUBJto4gO
 Z/QS1sYVuMao4r49v3qk8NNtJPBpZaiFAXXpxcuSptE/q/CWKwWCzHZiCOkt4fsqTbhS
 jKLw==
X-Gm-Message-State: APjAAAWx4Si5EloXT9rKZdV9c/eIcX26DXbq4JIs+Lbuv9fS6rFPTotV
 4cOdk6qXbRRNQx/WCEBkqQ4=
X-Google-Smtp-Source: APXvYqxNt5E/YYKAgEW1nfeuimILQx8tP1AR9k9ETZtDKUi2QI1/Dvs6glXpRmhRP9RSTge0M1Hqlg==
X-Received: by 2002:a17:90a:29c5:: with SMTP id
 h63mr1551874pjd.83.1562697441789; 
 Tue, 09 Jul 2019 11:37:21 -0700 (PDT)
Received: from hari-Inspiron-1545 ([183.83.86.126])
 by smtp.gmail.com with ESMTPSA id 65sm23755427pgf.30.2019.07.09.11.37.17
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 09 Jul 2019 11:37:21 -0700 (PDT)
Date: Wed, 10 Jul 2019 00:07:15 +0530
From: Hariprasad Kelam <hariprasad.kelam@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Vinod Koul <vkoul@kernel.org>,
 Hariprasad Kelam <hariprasad.kelam@gmail.com>,
 Dan Carpenter <dan.carpenter@oracle.com>,
 Gen Zhang <blackgod016574@gmail.com>, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
Message-ID: <20190709183715.GA7634@hari-Inspiron-1545>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.5.24 (2015-08-30)
Subject: [alsa-devel] [PATCH] sound: soc: codecs: wcd9335: fix Unneeded
	variable: "ret"
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

this fixes below issues reported  by coccicheck
sound/soc/codecs/wcd9335.c:3611:5-8: Unneeded variable: "ret". Return
"0" on line 3625
sound/soc/codecs/wcd9335.c:3941:5-8: Unneeded variable: "ret". Return
"0" on line 3971
sound/soc/codecs/wcd9335.c:3745:5-8: Unneeded variable: "ret". Return
"0" on line 3784
sound/soc/codecs/wcd9335.c:3896:5-8: Unneeded variable: "ret". Return
"0" on line 3934
sound/soc/codecs/wcd9335.c:3026:5-8: Unneeded variable: "ret". Return
"0" on line 3038

We cannot change return of these functions as they are callback
functions.

Signed-off-by: Hariprasad Kelam <hariprasad.kelam@gmail.com>
---
 sound/soc/codecs/wcd9335.c | 15 +++++----------
 1 file changed, 5 insertions(+), 10 deletions(-)

diff --git a/sound/soc/codecs/wcd9335.c b/sound/soc/codecs/wcd9335.c
index 1bbbe42..e13af36 100644
--- a/sound/soc/codecs/wcd9335.c
+++ b/sound/soc/codecs/wcd9335.c
@@ -3018,7 +3018,6 @@ static int wcd9335_codec_enable_slim(struct snd_soc_dapm_widget *w,
 	struct snd_soc_component *comp = snd_soc_dapm_to_component(w->dapm);
 	struct wcd9335_codec *wcd = snd_soc_component_get_drvdata(comp);
 	struct wcd_slim_codec_dai_data *dai = &wcd->dai[w->shift];
-	int ret = 0;
 
 	switch (event) {
 	case SND_SOC_DAPM_POST_PMU:
@@ -3030,7 +3029,7 @@ static int wcd9335_codec_enable_slim(struct snd_soc_dapm_widget *w,
 		break;
 	}
 
-	return ret;
+	return 0;
 }
 
 static int wcd9335_codec_enable_mix_path(struct snd_soc_dapm_widget *w,
@@ -3603,7 +3602,6 @@ static int wcd9335_codec_ear_dac_event(struct snd_soc_dapm_widget *w,
 {
 	struct snd_soc_component *comp = snd_soc_dapm_to_component(w->dapm);
 	struct wcd9335_codec *wcd = dev_get_drvdata(comp->dev);
-	int ret = 0;
 
 	switch (event) {
 	case SND_SOC_DAPM_PRE_PMU:
@@ -3617,7 +3615,7 @@ static int wcd9335_codec_ear_dac_event(struct snd_soc_dapm_widget *w,
 		break;
 	};
 
-	return ret;
+	return 0;
 }
 
 static void wcd9335_codec_hph_post_pa_config(struct wcd9335_codec *wcd,
@@ -3737,7 +3735,6 @@ static int wcd9335_codec_enable_hphl_pa(struct snd_soc_dapm_widget *w,
 	struct snd_soc_component *comp = snd_soc_dapm_to_component(w->dapm);
 	struct wcd9335_codec *wcd = dev_get_drvdata(comp->dev);
 	int hph_mode = wcd->hph_mode;
-	int ret = 0;
 
 	switch (event) {
 	case SND_SOC_DAPM_PRE_PMU:
@@ -3776,7 +3773,7 @@ static int wcd9335_codec_enable_hphl_pa(struct snd_soc_dapm_widget *w,
 		break;
 	};
 
-	return ret;
+	return 0;
 }
 
 static int wcd9335_codec_enable_lineout_pa(struct snd_soc_dapm_widget *w,
@@ -3888,7 +3885,6 @@ static int wcd9335_codec_enable_hphr_pa(struct snd_soc_dapm_widget *w,
 	struct snd_soc_component *comp = snd_soc_dapm_to_component(w->dapm);
 	struct wcd9335_codec *wcd = dev_get_drvdata(comp->dev);
 	int hph_mode = wcd->hph_mode;
-	int ret = 0;
 
 	switch (event) {
 	case SND_SOC_DAPM_PRE_PMU:
@@ -3926,14 +3922,13 @@ static int wcd9335_codec_enable_hphr_pa(struct snd_soc_dapm_widget *w,
 		break;
 	};
 
-	return ret;
+	return 0;
 }
 
 static int wcd9335_codec_enable_ear_pa(struct snd_soc_dapm_widget *w,
 				       struct snd_kcontrol *kc, int event)
 {
 	struct snd_soc_component *comp = snd_soc_dapm_to_component(w->dapm);
-	int ret = 0;
 
 	switch (event) {
 	case SND_SOC_DAPM_POST_PMU:
@@ -3963,7 +3958,7 @@ static int wcd9335_codec_enable_ear_pa(struct snd_soc_dapm_widget *w,
 		break;
 	};
 
-	return ret;
+	return 0;
 }
 
 static irqreturn_t wcd9335_slimbus_irq(int irq, void *data)
-- 
2.7.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
