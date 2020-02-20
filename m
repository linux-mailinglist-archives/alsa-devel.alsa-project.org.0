Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 52333166862
	for <lists+alsa-devel@lfdr.de>; Thu, 20 Feb 2020 21:32:17 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D7CED16B4;
	Thu, 20 Feb 2020 21:31:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D7CED16B4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1582230737;
	bh=D1KhRhA8sqJOKuZc1kYTl4OwQO8Nh761qvwEyEs+2HY=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=tFnbcSwDxvEcMqklAwmYWlG2eLGcYBUtG/3nYqwnLSC+neVokSAsoQlqtMXVESAee
	 VCeyUFwh9KZl/wG19qTwulY3v/ARQys66kF7jSEYubu9HsOZmdxcvoDplJwoTODcao
	 Q6xCL8nGWEe2/ZkfICc3mxhVdx5RNPsfmoRwys50=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 46B5BF8014A;
	Thu, 20 Feb 2020 21:30:04 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BA8A4F80114; Thu, 20 Feb 2020 21:30:00 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.horus.com (mail.horus.com [78.46.148.228])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CE364F80114
 for <alsa-devel@alsa-project.org>; Thu, 20 Feb 2020 21:29:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CE364F80114
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=horus.com header.i=@horus.com
 header.b="bd2clCy1"
Received: from lenny.lan (178-190-192-10.adsl.highway.telekom.at
 [178.190.192.10])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client CN "E-Mail Matthias Reichl Lenny",
 Issuer "HiassofT CA 2014" (verified OK))
 by mail.horus.com (Postfix) with ESMTPSA id A0C31640B6;
 Thu, 20 Feb 2020 21:29:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=horus.com;
 s=20180324; t=1582230596;
 bh=rjfkgJ8RDKxm2i1s9gf+AbVPSHOS8GJhnpNwNnZN5kQ=;
 h=From:To:Cc:Subject:Date:From;
 b=bd2clCy1cM3Bf9B/qCQVIt2yiEHXyV/7hiORIlA+ErfX36yYaL3kzRaXY2uWpAoFU
 48U0QLtK4SZIdvBoiho1vnmQvckm7O6gqvp5xl5vnTrC1C7wFq0Y6GsgtZthcA1y4j
 4lH6RjXK0TilO7OFtqcpuihey6Cby12TRmZ+9Bbw=
Received: by lenny.lan (Postfix, from userid 1000)
 id 1C806204D10; Thu, 20 Feb 2020 21:29:56 +0100 (CET)
From: Matthias Reichl <hias@horus.com>
To: Mark Brown <broonie@kernel.org>
Subject: [PATCH] ASoC: pcm512x: Fix unbalanced regulator enable call in probe
 error path
Date: Thu, 20 Feb 2020 21:29:56 +0100
Message-Id: <20200220202956.29233-1-hias@horus.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org
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

When we get a clock error during probe we have to call
regulator_bulk_disable before bailing out, otherwise we trigger
a warning in regulator_put.

Fix this by using "goto err" like in the error cases above.

Fixes: 5a3af1293194d ("ASoC: pcm512x: Add PCM512x driver")
Signed-off-by: Matthias Reichl <hias@horus.com>
---
 sound/soc/codecs/pcm512x.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/sound/soc/codecs/pcm512x.c b/sound/soc/codecs/pcm512x.c
index 861210f6bf4fd..4cbef9affffda 100644
--- a/sound/soc/codecs/pcm512x.c
+++ b/sound/soc/codecs/pcm512x.c
@@ -1564,13 +1564,15 @@ int pcm512x_probe(struct device *dev, struct regmap *regmap)
 	}
 
 	pcm512x->sclk = devm_clk_get(dev, NULL);
-	if (PTR_ERR(pcm512x->sclk) == -EPROBE_DEFER)
-		return -EPROBE_DEFER;
+	if (PTR_ERR(pcm512x->sclk) == -EPROBE_DEFER) {
+		ret = -EPROBE_DEFER;
+		goto err;
+	}
 	if (!IS_ERR(pcm512x->sclk)) {
 		ret = clk_prepare_enable(pcm512x->sclk);
 		if (ret != 0) {
 			dev_err(dev, "Failed to enable SCLK: %d\n", ret);
-			return ret;
+			goto err;
 		}
 	}
 
-- 
2.20.1

