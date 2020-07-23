Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CC82322B5FD
	for <lists+alsa-devel@lfdr.de>; Thu, 23 Jul 2020 20:45:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 71E6F167F;
	Thu, 23 Jul 2020 20:44:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 71E6F167F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1595529919;
	bh=W9l1WM5BbpSiNIde0NOAyc432HhpEPj5U9+dW+Ku7II=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=PE0oj3FvAL4f6KLmQQaRaW4WAGnOtJET5ZdR57CzmLHYpPxXcD+WUvkvF6gFcYTAL
	 I6VwUl9PaCCeplqpi3tP4AqOHtO5tGGkSaPyvdty+oS8Skg3XQsr2mXXpcNxUHnd45
	 ugKthq729xzzxzNDJ3CR/3lCHwR7KXnNzVHht0+0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1E635F802FF;
	Thu, 23 Jul 2020 20:39:46 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 11496F802E3; Thu, 23 Jul 2020 20:39:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mo4-p02-ob.smtp.rzone.de (mo4-p02-ob.smtp.rzone.de
 [85.215.255.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0EECFF80278
 for <alsa-devel@alsa-project.org>; Thu, 23 Jul 2020 20:39:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0EECFF80278
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gerhold.net header.i=@gerhold.net
 header.b="icZ5lBhg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1595529565;
 s=strato-dkim-0002; d=gerhold.net;
 h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
 bh=YA3Xn+6h1lb6vYJcmjrVDZzx4mzbkhYBJ457Wje8sQ4=;
 b=icZ5lBhgkDfHnE7GAxjUzcj1av6hxTBj1amqjpjXSyGZOgdRGT4CCaP7n92LNTHwER
 e1w/3F2kybznBWeLk0EYgeAz29W+FVYt627kk98jHKVZyocLsf0vfVTSWVNYBs4JbSsk
 4aIebKUrfGI7uDtNeiGFRB8V4R4ZXdprkkyIcnWyyTiB+D6TuPbGMsmmoky1XLWWpzXr
 3uBEaOkvgVFZDMf2WbSDCohv0AYI9Deg8THTNGZ8J7shWXkQV4iO9/cm1eUssfLAjhIx
 Mf/PGv2RGttn9FKUzHmO+mhr0DMuJxnSJz7ZBTBl+6H381izzvNUyVtv0cRpN4JwF33r
 W7hg==
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVORvLd4SsytBXS7IYBkLahKxB4W6OBfnv"
X-RZG-CLASS-ID: mo00
Received: from localhost.localdomain
 by smtp.strato.de (RZmta 46.10.5 DYNA|AUTH)
 with ESMTPSA id Y0939ew6NIdK5IK
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Thu, 23 Jul 2020 20:39:20 +0200 (CEST)
From: Stephan Gerhold <stephan@gerhold.net>
To: Mark Brown <broonie@kernel.org>
Subject: [PATCH 4/7] ASoC: qcom: common: Support parsing links without DPCM
Date: Thu, 23 Jul 2020 20:39:01 +0200
Message-Id: <20200723183904.321040-5-stephan@gerhold.net>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200723183904.321040-1-stephan@gerhold.net>
References: <20200723183904.321040-1-stephan@gerhold.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Banajit Goswami <bgoswami@codeaurora.org>,
 Stephan Gerhold <stephan@gerhold.net>, Patrick Lai <plai@codeaurora.org>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 ~postmarketos/upstreaming@lists.sr.ht, Cheng-Yi Chiang <cychiang@chromium.org>
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

So far qcom_snd_parse_of() was only used to parse the device tree
for boards using the QDSP6 driver together with DPCM. apq8016_sbc
uses an almost identical version (apq8016_sbc_parse_of()) which
parses links without DPCM.

Given the similarity of the two functions it is useful to combine
these two. To allow using qcom_snd_parse_of() in apq8016_sbc we
need to support parsing links without DPCM as well.

This is pretty simple: A DPCM link in the device tree is defined using:

  - DPCM frontend: "cpu"
  - DPCM backend:  "cpu", "platform" and "codec"

... while a link without DPCM has "cpu" and "codec" (but no "platform").

Add a few more if conditions to handle links without DPCM correctly.

Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
---
 sound/soc/qcom/common.c | 26 +++++++++++++++++++-------
 1 file changed, 19 insertions(+), 7 deletions(-)

diff --git a/sound/soc/qcom/common.c b/sound/soc/qcom/common.c
index 030df6026562..54f5bc60246f 100644
--- a/sound/soc/qcom/common.c
+++ b/sound/soc/qcom/common.c
@@ -84,7 +84,7 @@ int qcom_snd_parse_of(struct snd_soc_card *card)
 			goto err;
 		}
 
-		if (codec && platform) {
+		if (platform) {
 			link->platforms->of_node = of_parse_phandle(platform,
 					"sound-dai",
 					0);
@@ -93,15 +93,24 @@ int qcom_snd_parse_of(struct snd_soc_card *card)
 				ret = -EINVAL;
 				goto err;
 			}
+		} else {
+			link->platforms->of_node = link->cpus->of_node;
+		}
 
+		if (codec) {
 			ret = snd_soc_of_get_dai_link_codecs(dev, codec, link);
 			if (ret < 0) {
 				dev_err(card->dev, "%s: codec dai not found\n", link->name);
 				goto err;
 			}
-			link->no_pcm = 1;
-			link->ignore_pmdown_time = 1;
+
+			if (platform) {
+				/* DPCM backend */
+				link->no_pcm = 1;
+				link->ignore_pmdown_time = 1;
+			}
 		} else {
+			/* DPCM frontend */
 			dlc = devm_kzalloc(dev, sizeof(*dlc), GFP_KERNEL);
 			if (!dlc)
 				return -ENOMEM;
@@ -109,15 +118,18 @@ int qcom_snd_parse_of(struct snd_soc_card *card)
 			link->codecs	 = dlc;
 			link->num_codecs = 1;
 
-			link->platforms->of_node = link->cpus->of_node;
 			link->codecs->dai_name = "snd-soc-dummy-dai";
 			link->codecs->name = "snd-soc-dummy";
 			link->dynamic = 1;
 		}
 
-		snd_soc_dai_link_set_capabilities(link);
-		link->ignore_suspend = 1;
-		link->nonatomic = 1;
+		if (platform || !codec) {
+			/* DPCM */
+			snd_soc_dai_link_set_capabilities(link);
+			link->ignore_suspend = 1;
+			link->nonatomic = 1;
+		}
+
 		link->stream_name = link->name;
 		link++;
 
-- 
2.27.0

