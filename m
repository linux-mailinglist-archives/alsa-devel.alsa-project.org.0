Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D2AA5156B41
	for <lists+alsa-devel@lfdr.de>; Sun,  9 Feb 2020 16:53:16 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 78462167D;
	Sun,  9 Feb 2020 16:52:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 78462167D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1581263596;
	bh=peRCY2d/zZqcscyWExr4wxbZ3lC/C1PcsySqMx0wI1A=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RT84nTJW6+Ssbig6a1O1s40sfUjtBdEMQzkZK4v/n+OJZHhrGr/84RRVG4lySK270
	 gqoaVOA1FxV1kDHgcxdUfMwIFxSNiJG8MV45UY6A4mCfV1Q5PmGe6sCoYyZ/LVNGEj
	 hgk6yxHmCRKWZMSavioihE92rIqXEEKFFO/Tvk4o=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 88FDFF8029B;
	Sun,  9 Feb 2020 16:48:40 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 754A8F8029A; Sun,  9 Feb 2020 16:48:38 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.serbinski.com (mail.serbinski.com [162.218.126.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D8707F80291
 for <alsa-devel@alsa-project.org>; Sun,  9 Feb 2020 16:48:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D8707F80291
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=serbinski.com header.i=@serbinski.com
 header.b="vkG/caFn"
Received: from localhost (unknown [127.0.0.1])
 by mail.serbinski.com (Postfix) with ESMTP id 86E81D00716;
 Sun,  9 Feb 2020 15:48:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at serbinski.com
Received: from mail.serbinski.com ([127.0.0.1])
 by localhost (mail.serbinski.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id j742tjVpCIOM; Sun,  9 Feb 2020 10:48:24 -0500 (EST)
Received: from anet (23-233-80-73.cpe.pppoe.ca [23.233.80.73])
 (using TLSv1 with cipher AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mail.serbinski.com (Postfix) with ESMTPSA id 5C22CD00717;
 Sun,  9 Feb 2020 10:48:10 -0500 (EST)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.serbinski.com 5C22CD00717
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=serbinski.com;
 s=default; t=1581263290;
 bh=ETimvPxlhSv3UnHdR3sMFlCASzRDsVkv5A46uX4f778=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=vkG/caFnE8m1E/W1a+a64GnTSi1zoYv2sl9AH9dQs5+ng5URuKdFHmgUDCD0d1eag
 xHralk0esT8FSs+YMIbay8uNkINY4y64fmmc7AxfHY/feKQiohFOdgBVv+DzpzMV/j
 dJD+IefZGnBM/T3l8QcNfT6vOJJd5KaGrhOy7XNU=
From: Adam Serbinski <adam@serbinski.com>
To: Mark Brown <broonie@kernel.org>,
 Srini Kandagatla <srinivas.kandagatla@linaro.org>,
 Rob Herring <robh+dt@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>
Date: Sun,  9 Feb 2020 10:47:46 -0500
Message-Id: <20200209154748.3015-7-adam@serbinski.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200209154748.3015-1-adam@serbinski.com>
References: <20200207205013.12274-1-adam@serbinski.com>
 <20200209154748.3015-1-adam@serbinski.com>
MIME-Version: 1.0
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, Banajit Goswami <bgoswami@codeaurora.org>,
 linux-arm-msm@vger.kernel.org, Patrick Lai <plai@codeaurora.org>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Andy Gross <agross@kernel.org>, Adam Serbinski <adam@serbinski.com>,
 linux-kernel@vger.kernel.org
Subject: [alsa-devel] [PATCH v2 6/8] ASoC: qcom/common: Use
	snd-soc-dummy-dai when codec is not specified
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

When not specifying a codec, use snd-soc-dummy-dai. This supports
the case where a fixed configuration codec is attached, such as
bluetooth hfp.

Signed-off-by: Adam Serbinski <adam@serbinski.com>
CC: Andy Gross <agross@kernel.org>
CC: Mark Rutland <mark.rutland@arm.com>
CC: Liam Girdwood <lgirdwood@gmail.com>
CC: Patrick Lai <plai@codeaurora.org>
CC: Banajit Goswami <bgoswami@codeaurora.org>
CC: Jaroslav Kysela <perex@perex.cz>
CC: Takashi Iwai <tiwai@suse.com>
CC: alsa-devel@alsa-project.org
CC: linux-arm-msm@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org
---
 sound/soc/qcom/common.c | 22 +++++++++++++++++-----
 1 file changed, 17 insertions(+), 5 deletions(-)

diff --git a/sound/soc/qcom/common.c b/sound/soc/qcom/common.c
index 6c20bdd850f3..aa2f2238aca0 100644
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
@@ -94,10 +94,22 @@ int qcom_snd_parse_of(struct snd_soc_card *card)
 				goto err;
 			}
 
-			ret = snd_soc_of_get_dai_link_codecs(dev, codec, link);
-			if (ret < 0) {
-				dev_err(card->dev, "%s: codec dai not found\n", link->name);
-				goto err;
+			if (codec) {
+				ret = snd_soc_of_get_dai_link_codecs(dev, codec, link);
+				if (ret < 0) {
+					dev_err(card->dev, "%s: codec dai not found\n", link->name);
+					goto err;
+				}
+			} else {
+				dlc = devm_kzalloc(dev,
+						   sizeof(*dlc), GFP_KERNEL);
+				if (!dlc)
+					return -ENOMEM;
+
+				link->codecs = dlc;
+				link->num_codecs = 1;
+				link->codecs->dai_name = "snd-soc-dummy-dai";
+				link->codecs->name = "snd-soc-dummy";
 			}
 			link->no_pcm = 1;
 			link->ignore_pmdown_time = 1;
-- 
2.21.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
