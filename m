Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 66B4722B5FA
	for <lists+alsa-devel@lfdr.de>; Thu, 23 Jul 2020 20:44:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 11D401681;
	Thu, 23 Jul 2020 20:43:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 11D401681
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1595529876;
	bh=Fh87hb0Gad1Dxo/Uv90kDIGMuVab4aYbAasASoiC8ro=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pi7vyDcB4QFrFxgFk1JwuXchDhSoaYku24k4DXVZFvrlxRUJd8YQ6KwWsXU0fx/KI
	 3O/uwypU/qcwDBN2XWk9T6gerqbysiKwK5aRaqlcAJCdQtf3gnp/kFfmGgj9OHMf5N
	 11n5z4+AucwyGhFuN5Jcp5wr69qK78wc6Lan80V4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 67C97F802E2;
	Thu, 23 Jul 2020 20:39:44 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7CF57F8024A; Thu, 23 Jul 2020 20:39:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mo4-p02-ob.smtp.rzone.de (mo4-p02-ob.smtp.rzone.de
 [81.169.146.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BA2C2F80274
 for <alsa-devel@alsa-project.org>; Thu, 23 Jul 2020 20:39:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BA2C2F80274
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gerhold.net header.i=@gerhold.net
 header.b="lU7j/DBW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1595529564;
 s=strato-dkim-0002; d=gerhold.net;
 h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
 bh=36mZrS5hCVfH9Dj/e1VKggw9G17HGuzh5g5Kqq1w5iQ=;
 b=lU7j/DBWR0BKWqTEcy/vG8xRFqg9/mAhagjy67JZ+7pF+YfvxxtTbj1u6oLs9oyof4
 qlWqNRsLkDQJsXMOTlg+SlTiEiuq511thT60iUHqCER+usqjCxkuYLd225xXloqjf5JM
 wNtGXXIE9bMOVvGLBoHX0oTxaeXwyrhcGOmWeHqLVCKvo7izq68IVTzVUQ+86OzCgK5p
 mi1OApwcybmFgK2XecjyUfz3FdiY99D4ewP2DgRztHKKhrFWFfw+GGvZlexRcGxa95f6
 hxR885fp2YWxcrtxFOPOH6FGGQ2PpHaEuOEio6kte6hFDC18wP0wJBMKpJ4L+7tza7U+
 bnMw==
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVORvLd4SsytBXS7IYBkLahKxB4W6OBfnv"
X-RZG-CLASS-ID: mo00
Received: from localhost.localdomain
 by smtp.strato.de (RZmta 46.10.5 DYNA|AUTH)
 with ESMTPSA id Y0939ew6NIdM5IN
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Thu, 23 Jul 2020 20:39:22 +0200 (CEST)
From: Stephan Gerhold <stephan@gerhold.net>
To: Mark Brown <broonie@kernel.org>
Subject: [PATCH 7/7] ASoC: qcom: common: Avoid printing errors for
 -EPROBE_DEFER
Date: Thu, 23 Jul 2020 20:39:04 +0200
Message-Id: <20200723183904.321040-8-stephan@gerhold.net>
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

qcom_snd_parse_of() tends to produce lots of error messages during bootup:

	MultiMedia1: error getting cpu dai name

This happens because the DAIs are not probed until the ADSP remoteproc
has booted, which takes a while. Until it is ready, snd_soc_of_get_dai_name()
returns -EDEFER_PROBE to retry probing later. This is perfectly normal,
so cleanup the kernel log a bit by not printing in case of -EPROBE_DEFER.

Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
---
 sound/soc/qcom/common.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/sound/soc/qcom/common.c b/sound/soc/qcom/common.c
index 84dba0d69e6b..5194d90ddb96 100644
--- a/sound/soc/qcom/common.c
+++ b/sound/soc/qcom/common.c
@@ -88,7 +88,9 @@ int qcom_snd_parse_of(struct snd_soc_card *card)
 
 		ret = snd_soc_of_get_dai_name(cpu, &link->cpus->dai_name);
 		if (ret) {
-			dev_err(card->dev, "%s: error getting cpu dai name\n", link->name);
+			if (ret != -EPROBE_DEFER)
+				dev_err(card->dev, "%s: error getting cpu dai name: %d\n",
+					link->name, ret);
 			goto err;
 		}
 
@@ -108,7 +110,9 @@ int qcom_snd_parse_of(struct snd_soc_card *card)
 		if (codec) {
 			ret = snd_soc_of_get_dai_link_codecs(dev, codec, link);
 			if (ret < 0) {
-				dev_err(card->dev, "%s: codec dai not found\n", link->name);
+				if (ret != -EPROBE_DEFER)
+					dev_err(card->dev, "%s: codec dai not found: %d\n",
+						link->name, ret);
 				goto err;
 			}
 
-- 
2.27.0

