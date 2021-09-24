Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D501417E0F
	for <lists+alsa-devel@lfdr.de>; Sat, 25 Sep 2021 01:11:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 32502165D;
	Sat, 25 Sep 2021 01:10:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 32502165D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1632525095;
	bh=ngBGvRM08zKzgUxi84SfSAHxhmUdrLRqA1/9tSyBy4g=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=a4uiKoaqWtsl8kUE7MXslKuemMYE1gTjwW6bqd3TPMzD7cyqHyKhkeo/0gZjYBknH
	 jzgqa4OYbkANcxhVixxeWmJ0B14CXRweVap6kbRc2Gxh/PBvZfWqDbGyselaOFa1r1
	 ZW7DSAGVtUgDkpM897MQYMWaDPtQ6PiqNPlznz9c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 936E1F8013F;
	Sat, 25 Sep 2021 01:10:18 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 425D8F802A0; Sat, 25 Sep 2021 01:10:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from smtp-relay-canonical-1.canonical.com
 (smtp-relay-canonical-1.canonical.com [185.125.188.121])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E4802F8013F
 for <alsa-devel@alsa-project.org>; Sat, 25 Sep 2021 01:10:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E4802F8013F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com
 header.b="l/oBghUc"
Received: from localhost (1.general.cking.uk.vpn [10.172.193.212])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by smtp-relay-canonical-1.canonical.com (Postfix) with ESMTPSA id B44B640189; 
 Fri, 24 Sep 2021 23:10:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1632525003;
 bh=MMj9XYGRAUjX3duA0tNbIp1LXgRy3RovsJqNaSyyQsQ=;
 h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type;
 b=l/oBghUcWofCXKBBLGS+d1d1Wsqr08VyP5+xGKT2Qt5ZwjNLAui/2iu+q7M0cSYeZ
 3+gY9hQOg71JQFBSQfAV7MaLs7d/tODV2zct8dqLd8ZQGZhxJL7GIOQ6iyODJhQbqW
 LQas497Wi0cRtWGcVmbq8vc/tVHPCCE1qKPVf5zOohptAlJfXLbY/1NAQA9oVeBMae
 hh8krdC/NXQRR/yKN98PA5Pgv42lsZpXbuxuXMrhxcZcXvr+2IJ3FFl0W0haHAnIEy
 20iQRbZLz/NGQT2K6Q+7FL9wwW4+z4MmEkcx24jRMSYF+IfvCeU3d0OYNnnJt+bTAH
 35fy8XI/A8Daw==
From: Colin King <colin.king@canonical.com>
To: Oder Chiou <oder_chiou@realtek.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org
Subject: [PATCH] ASoC: codecs: Fix spelling mistake "Unsupport" ->
 "Unsupported"
Date: Sat, 25 Sep 2021 00:10:03 +0100
Message-Id: <20210924231003.144502-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
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

From: Colin Ian King <colin.king@canonical.com>

There are spelling mistakes in dev_err error messages. Fix them.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 sound/soc/codecs/rt1015.c | 2 +-
 sound/soc/codecs/rt1016.c | 2 +-
 sound/soc/codecs/rt1019.c | 2 +-
 sound/soc/codecs/rt1305.c | 2 +-
 sound/soc/codecs/rt1308.c | 2 +-
 sound/soc/codecs/rt5514.c | 2 +-
 sound/soc/codecs/rt5616.c | 2 +-
 sound/soc/codecs/rt5640.c | 2 +-
 sound/soc/codecs/rt5645.c | 2 +-
 sound/soc/codecs/rt5651.c | 2 +-
 sound/soc/codecs/rt5659.c | 2 +-
 sound/soc/codecs/rt5660.c | 2 +-
 sound/soc/codecs/rt5663.c | 2 +-
 sound/soc/codecs/rt5665.c | 2 +-
 sound/soc/codecs/rt5668.c | 2 +-
 sound/soc/codecs/rt5670.c | 2 +-
 sound/soc/codecs/rt5677.c | 2 +-
 sound/soc/codecs/rt5682.c | 6 +++---
 18 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/sound/soc/codecs/rt1015.c b/sound/soc/codecs/rt1015.c
index c0c5952cdff7..6a27dfacd81c 100644
--- a/sound/soc/codecs/rt1015.c
+++ b/sound/soc/codecs/rt1015.c
@@ -864,7 +864,7 @@ static int rt1015_set_component_pll(struct snd_soc_component *component,
 
 	ret = rl6231_pll_calc(freq_in, freq_out, &pll_code);
 	if (ret < 0) {
-		dev_err(component->dev, "Unsupport input clock %d\n", freq_in);
+		dev_err(component->dev, "Unsupported input clock %d\n", freq_in);
 		return ret;
 	}
 
diff --git a/sound/soc/codecs/rt1016.c b/sound/soc/codecs/rt1016.c
index 7561d202274c..9845cdddcb4c 100644
--- a/sound/soc/codecs/rt1016.c
+++ b/sound/soc/codecs/rt1016.c
@@ -490,7 +490,7 @@ static int rt1016_set_component_pll(struct snd_soc_component *component,
 
 	ret = rl6231_pll_calc(freq_in, freq_out * 4, &pll_code);
 	if (ret < 0) {
-		dev_err(component->dev, "Unsupport input clock %d\n", freq_in);
+		dev_err(component->dev, "Unsupported input clock %d\n", freq_in);
 		return ret;
 	}
 
diff --git a/sound/soc/codecs/rt1019.c b/sound/soc/codecs/rt1019.c
index 8c0b00242bb8..80b7ca0e4e1e 100644
--- a/sound/soc/codecs/rt1019.c
+++ b/sound/soc/codecs/rt1019.c
@@ -359,7 +359,7 @@ static int rt1019_set_dai_pll(struct snd_soc_dai *dai, int pll_id, int source,
 
 	ret = rl6231_pll_calc(freq_in, freq_out, &pll_code);
 	if (ret < 0) {
-		dev_err(component->dev, "Unsupport input clock %d\n", freq_in);
+		dev_err(component->dev, "Unsupported input clock %d\n", freq_in);
 		return ret;
 	}
 
diff --git a/sound/soc/codecs/rt1305.c b/sound/soc/codecs/rt1305.c
index 7a0094578e46..a9c473537a91 100644
--- a/sound/soc/codecs/rt1305.c
+++ b/sound/soc/codecs/rt1305.c
@@ -841,7 +841,7 @@ static int rt1305_set_component_pll(struct snd_soc_component *component,
 
 	ret = rl6231_pll_calc(freq_in, freq_out, &pll_code);
 	if (ret < 0) {
-		dev_err(component->dev, "Unsupport input clock %d\n", freq_in);
+		dev_err(component->dev, "Unsupported input clock %d\n", freq_in);
 		return ret;
 	}
 
diff --git a/sound/soc/codecs/rt1308.c b/sound/soc/codecs/rt1308.c
index b4e5546e2e21..c555b77b3c5c 100644
--- a/sound/soc/codecs/rt1308.c
+++ b/sound/soc/codecs/rt1308.c
@@ -664,7 +664,7 @@ static int rt1308_set_component_pll(struct snd_soc_component *component,
 
 	ret = rl6231_pll_calc(freq_in, freq_out, &pll_code);
 	if (ret < 0) {
-		dev_err(component->dev, "Unsupport input clock %d\n", freq_in);
+		dev_err(component->dev, "Unsupported input clock %d\n", freq_in);
 		return ret;
 	}
 
diff --git a/sound/soc/codecs/rt5514.c b/sound/soc/codecs/rt5514.c
index 4b1ad5054e8d..577680df7052 100644
--- a/sound/soc/codecs/rt5514.c
+++ b/sound/soc/codecs/rt5514.c
@@ -936,7 +936,7 @@ static int rt5514_set_dai_pll(struct snd_soc_dai *dai, int pll_id, int source,
 
 	ret = rl6231_pll_calc(freq_in, freq_out, &pll_code);
 	if (ret < 0) {
-		dev_err(component->dev, "Unsupport input clock %d\n", freq_in);
+		dev_err(component->dev, "Unsupported input clock %d\n", freq_in);
 		return ret;
 	}
 
diff --git a/sound/soc/codecs/rt5616.c b/sound/soc/codecs/rt5616.c
index fd0d3a08e9dd..8e6414468a87 100644
--- a/sound/soc/codecs/rt5616.c
+++ b/sound/soc/codecs/rt5616.c
@@ -1133,7 +1133,7 @@ static int rt5616_set_dai_pll(struct snd_soc_dai *dai, int pll_id, int source,
 
 	ret = rl6231_pll_calc(freq_in, freq_out, &pll_code);
 	if (ret < 0) {
-		dev_err(component->dev, "Unsupport input clock %d\n", freq_in);
+		dev_err(component->dev, "Unsupported input clock %d\n", freq_in);
 		return ret;
 	}
 
diff --git a/sound/soc/codecs/rt5640.c b/sound/soc/codecs/rt5640.c
index cd1db5caabad..d01fe73ab9c8 100644
--- a/sound/soc/codecs/rt5640.c
+++ b/sound/soc/codecs/rt5640.c
@@ -1909,7 +1909,7 @@ static int rt5640_set_dai_pll(struct snd_soc_dai *dai, int pll_id, int source,
 
 	ret = rl6231_pll_calc(freq_in, freq_out, &pll_code);
 	if (ret < 0) {
-		dev_err(component->dev, "Unsupport input clock %d\n", freq_in);
+		dev_err(component->dev, "Unsupported input clock %d\n", freq_in);
 		return ret;
 	}
 
diff --git a/sound/soc/codecs/rt5645.c b/sound/soc/codecs/rt5645.c
index 9408ee63cb26..197c56047947 100644
--- a/sound/soc/codecs/rt5645.c
+++ b/sound/soc/codecs/rt5645.c
@@ -2969,7 +2969,7 @@ static int rt5645_set_dai_pll(struct snd_soc_dai *dai, int pll_id, int source,
 
 	ret = rl6231_pll_calc(freq_in, freq_out, &pll_code);
 	if (ret < 0) {
-		dev_err(component->dev, "Unsupport input clock %d\n", freq_in);
+		dev_err(component->dev, "Unsupported input clock %d\n", freq_in);
 		return ret;
 	}
 
diff --git a/sound/soc/codecs/rt5651.c b/sound/soc/codecs/rt5651.c
index fc0c83b73f09..e78ea101bc8d 100644
--- a/sound/soc/codecs/rt5651.c
+++ b/sound/soc/codecs/rt5651.c
@@ -1487,7 +1487,7 @@ static int rt5651_set_dai_pll(struct snd_soc_dai *dai, int pll_id, int source,
 
 	ret = rl6231_pll_calc(freq_in, freq_out, &pll_code);
 	if (ret < 0) {
-		dev_err(component->dev, "Unsupport input clock %d\n", freq_in);
+		dev_err(component->dev, "Unsupported input clock %d\n", freq_in);
 		return ret;
 	}
 
diff --git a/sound/soc/codecs/rt5659.c b/sound/soc/codecs/rt5659.c
index 4a50b169fe03..e1503c2eee81 100644
--- a/sound/soc/codecs/rt5659.c
+++ b/sound/soc/codecs/rt5659.c
@@ -3509,7 +3509,7 @@ static int rt5659_set_component_pll(struct snd_soc_component *component, int pll
 
 	ret = rl6231_pll_calc(freq_in, freq_out, &pll_code);
 	if (ret < 0) {
-		dev_err(component->dev, "Unsupport input clock %d\n", freq_in);
+		dev_err(component->dev, "Unsupported input clock %d\n", freq_in);
 		return ret;
 	}
 
diff --git a/sound/soc/codecs/rt5660.c b/sound/soc/codecs/rt5660.c
index 33ff9156358b..3b50fb29864e 100644
--- a/sound/soc/codecs/rt5660.c
+++ b/sound/soc/codecs/rt5660.c
@@ -1046,7 +1046,7 @@ static int rt5660_set_dai_pll(struct snd_soc_dai *dai, int pll_id, int source,
 
 	ret = rl6231_pll_calc(freq_in, freq_out, &pll_code);
 	if (ret < 0) {
-		dev_err(component->dev, "Unsupport input clock %d\n", freq_in);
+		dev_err(component->dev, "Unsupported input clock %d\n", freq_in);
 		return ret;
 	}
 
diff --git a/sound/soc/codecs/rt5663.c b/sound/soc/codecs/rt5663.c
index be9fc58ff681..0389b2bb360e 100644
--- a/sound/soc/codecs/rt5663.c
+++ b/sound/soc/codecs/rt5663.c
@@ -2941,7 +2941,7 @@ static int rt5663_set_dai_pll(struct snd_soc_dai *dai, int pll_id, int source,
 
 	ret = rl6231_pll_calc(freq_in, freq_out, &pll_code);
 	if (ret < 0) {
-		dev_err(component->dev, "Unsupport input clock %d\n", freq_in);
+		dev_err(component->dev, "Unsupported input clock %d\n", freq_in);
 		return ret;
 	}
 
diff --git a/sound/soc/codecs/rt5665.c b/sound/soc/codecs/rt5665.c
index e59323fd5bf2..33e889802ff8 100644
--- a/sound/soc/codecs/rt5665.c
+++ b/sound/soc/codecs/rt5665.c
@@ -4374,7 +4374,7 @@ static int rt5665_set_component_pll(struct snd_soc_component *component, int pll
 
 	ret = rl6231_pll_calc(freq_in, freq_out, &pll_code);
 	if (ret < 0) {
-		dev_err(component->dev, "Unsupport input clock %d\n", freq_in);
+		dev_err(component->dev, "Unsupported input clock %d\n", freq_in);
 		return ret;
 	}
 
diff --git a/sound/soc/codecs/rt5668.c b/sound/soc/codecs/rt5668.c
index 6ab1a8bc3735..fb09715bf932 100644
--- a/sound/soc/codecs/rt5668.c
+++ b/sound/soc/codecs/rt5668.c
@@ -2171,7 +2171,7 @@ static int rt5668_set_component_pll(struct snd_soc_component *component,
 
 	ret = rl6231_pll_calc(freq_in, freq_out, &pll_code);
 	if (ret < 0) {
-		dev_err(component->dev, "Unsupport input clock %d\n", freq_in);
+		dev_err(component->dev, "Unsupported input clock %d\n", freq_in);
 		return ret;
 	}
 
diff --git a/sound/soc/codecs/rt5670.c b/sound/soc/codecs/rt5670.c
index ecbaf129a6e3..ce7684752bb0 100644
--- a/sound/soc/codecs/rt5670.c
+++ b/sound/soc/codecs/rt5670.c
@@ -2577,7 +2577,7 @@ static int rt5670_set_dai_pll(struct snd_soc_dai *dai, int pll_id, int source,
 
 	ret = rl6231_pll_calc(freq_in, freq_out, &pll_code);
 	if (ret < 0) {
-		dev_err(component->dev, "Unsupport input clock %d\n", freq_in);
+		dev_err(component->dev, "Unsupported input clock %d\n", freq_in);
 		return ret;
 	}
 
diff --git a/sound/soc/codecs/rt5677.c b/sound/soc/codecs/rt5677.c
index f655228c8c4b..4a8c267d4fbc 100644
--- a/sound/soc/codecs/rt5677.c
+++ b/sound/soc/codecs/rt5677.c
@@ -4557,7 +4557,7 @@ static int rt5677_set_dai_pll(struct snd_soc_dai *dai, int pll_id, int source,
 
 	ret = rt5677_pll_calc(freq_in, freq_out, &pll_code);
 	if (ret < 0) {
-		dev_err(component->dev, "Unsupport input clock %d\n", freq_in);
+		dev_err(component->dev, "Unsupported input clock %d\n", freq_in);
 		return ret;
 	}
 
diff --git a/sound/soc/codecs/rt5682.c b/sound/soc/codecs/rt5682.c
index 4a64cab99c55..12113c2dcae2 100644
--- a/sound/soc/codecs/rt5682.c
+++ b/sound/soc/codecs/rt5682.c
@@ -2327,7 +2327,7 @@ static int rt5682_set_component_pll(struct snd_soc_component *component,
 		pll2_fout1 = 3840000;
 		ret = rl6231_pll_calc(freq_in, pll2_fout1, &pll2f_code);
 		if (ret < 0) {
-			dev_err(component->dev, "Unsupport input clock %d\n",
+			dev_err(component->dev, "Unsupported input clock %d\n",
 				freq_in);
 			return ret;
 		}
@@ -2339,7 +2339,7 @@ static int rt5682_set_component_pll(struct snd_soc_component *component,
 
 		ret = rl6231_pll_calc(pll2_fout1, freq_out, &pll2b_code);
 		if (ret < 0) {
-			dev_err(component->dev, "Unsupport input clock %d\n",
+			dev_err(component->dev, "Unsupported input clock %d\n",
 				pll2_fout1);
 			return ret;
 		}
@@ -2390,7 +2390,7 @@ static int rt5682_set_component_pll(struct snd_soc_component *component,
 
 		ret = rl6231_pll_calc(freq_in, freq_out, &pll_code);
 		if (ret < 0) {
-			dev_err(component->dev, "Unsupport input clock %d\n",
+			dev_err(component->dev, "Unsupported input clock %d\n",
 				freq_in);
 			return ret;
 		}
-- 
2.32.0

