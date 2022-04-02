Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 326174F014F
	for <lists+alsa-devel@lfdr.de>; Sat,  2 Apr 2022 14:02:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BCC1E178D;
	Sat,  2 Apr 2022 14:01:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BCC1E178D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1648900964;
	bh=6HEO6FX0cTApZGYZL9W0YfZG6AVikd2sj2ykd9jNyJs=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=ATkL2wM68cHGL0Qegxllksbr1nWdJHPHLUS+UpkJoLfklafJCOcIVQ+D+0pW9/vG2
	 xgxz5WAuPrDmOO/Fy1Ixj8zJHo+Ho3zjOzqE4eweS31N94EyTDtGaEoOZrxU3UsYfN
	 RudJdEritDQd/wHQXm1+PWS6Fu5mh3IwMUT8lLhI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 389D8F80100;
	Sat,  2 Apr 2022 14:01:37 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EEB8AF802DB; Sat,  2 Apr 2022 14:01:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,HK_RANDOM_ENVFROM,HK_RANDOM_FROM,SPF_HELO_NONE,
 SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [IPv6:2a00:1450:4864:20::234])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4A848F80100
 for <alsa-devel@alsa-project.org>; Sat,  2 Apr 2022 14:01:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4A848F80100
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="Pv058XN5"
Received: by mail-lj1-x234.google.com with SMTP id bn33so7072090ljb.6
 for <alsa-devel@alsa-project.org>; Sat, 02 Apr 2022 05:01:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=jjfIXBTTvGAOCiQ27r2H9evLgRv0+TvRaITRPKY6pwo=;
 b=Pv058XN5Iozx5bqSBy6Ou9cjVc77Rvdp82w5q100fxamtfRZxs2SQbCSjEcTXzpPi+
 bH+wHMbkIDnXPbawpV7lUMO0T20KnrB1r4oZWZVKaV16h+Dxj8hZ9iQRkNywzuzQ4wDG
 SrFsNUpTkBqjuLqE8ccfbeypzCSOVkZaz91QkPIOz1J1/guS6UURV51sK42ZsiE9AU9q
 ECYDTWsyGOzGnYLh8jBJzZDWotoTjdeUcom7PABBogbnZisMUI75bHO1eOr+7Lf323aI
 6QLo5B3elp3NfFmmqx1Y4ZcsIShNooeUd1vsw0gL/Tszb7HbYm49HEC6+gdN6zhUelhj
 AjVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=jjfIXBTTvGAOCiQ27r2H9evLgRv0+TvRaITRPKY6pwo=;
 b=xjwKtJ9H78tMfTm+gGcDjd7Xi0SahJySQ0V0Qu4YXtiX2S3lV2K3aKBz/SjxbfIVQ+
 AFFKJG+2tX2hXEO7ydLhi38PgEtCD18e0L6i7KS4pjywhUaTawrdtWAUYXPBC4cnMXbN
 07Iz6/F4AHw3FPgZ+kbQl29aR9XSKSH9bstpJ89tjSHzBiun8ENTZP6LXU4Uqaq++H8N
 r+oFoncZ3y+ys1wqX5fpCEx+hGLbqdsuNYrvViKdTKnGHzSlVZuQ6fYlzEqvdptCqlW5
 3OpPOaaL3w5cwLDm7HHL18WwDp0b/aipBqkceyPcZZ90Trh6AXfnSlLBLTm/1rkY6Xwj
 5Hzw==
X-Gm-Message-State: AOAM530tIqD4tcjg68Mje6StUYNi/4bBgvYAFgI3sY0P91Qhs+TLZXoo
 uDns93myK8cuO/yQSrLDXfM=
X-Google-Smtp-Source: ABdhPJx07OsbhYu/s537+TkEcgHtFIjG440h4+L/7oy4/a2kG/GkQTmNcLnCBbVIe50Llxhi170dlQ==
X-Received: by 2002:a2e:7c14:0:b0:24a:fefe:bba7 with SMTP id
 x20-20020a2e7c14000000b0024afefebba7mr5483770ljc.272.1648900891161; 
 Sat, 02 Apr 2022 05:01:31 -0700 (PDT)
Received: from dell.lan (93-181-165-181.internetia.net.pl. [93.181.165.181])
 by smtp.gmail.com with ESMTPSA id
 h16-20020a19ca50000000b0044a25081cf9sm506233lfj.133.2022.04.02.05.01.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 02 Apr 2022 05:01:29 -0700 (PDT)
From: Janusz Krzysztofik <jmkrzyszt@gmail.com>
To: Mark Brown <broonie@kernel.org>
Subject: [PATCH] ASoC: ti: osk5912: Make it CCF clk API compatible
Date: Sat,  2 Apr 2022 14:01:06 +0200
Message-Id: <20220402120106.131118-1-jmkrzyszt@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Janusz Krzysztofik <jmkrzyszt@gmail.com>, alsa-devel@alsa-project.org,
 linux-omap@vger.kernel.org, Peter Ujfalusi <peter.ujfalusi@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>
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

The driver, OMAP1 specific, now omits clk_prepare/unprepare() steps, not
supported by OMAP1 custom implementation of clock API.  However, non-CCF
stubs of those functions exist for use on such platforms until converted
to CCF.

Update the driver to be compatible with CCF implementation of clock API.

Signed-off-by: Janusz Krzysztofik <jmkrzyszt@gmail.com>
---
 sound/soc/ti/osk5912.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/sound/soc/ti/osk5912.c b/sound/soc/ti/osk5912.c
index 40e29dda7e7a..22da3b335e81 100644
--- a/sound/soc/ti/osk5912.c
+++ b/sound/soc/ti/osk5912.c
@@ -134,6 +134,10 @@ static int __init osk_soc_init(void)
 		goto err2;
 	}
 
+	err = clk_prepare(tlv320aic23_mclk);
+	if (err)
+		goto err3;
+
 	/*
 	 * Configure 12 MHz output on MCLK.
 	 */
@@ -142,7 +146,7 @@ static int __init osk_soc_init(void)
 		if (clk_set_rate(tlv320aic23_mclk, CODEC_CLOCK)) {
 			printk(KERN_ERR "Cannot set MCLK for AIC23 CODEC\n");
 			err = -ECANCELED;
-			goto err3;
+			goto err4;
 		}
 	}
 
@@ -151,6 +155,8 @@ static int __init osk_soc_init(void)
 
 	return 0;
 
+err4:
+	clk_unprepare(tlv320aic23_mclk);
 err3:
 	clk_put(tlv320aic23_mclk);
 err2:
@@ -164,6 +170,7 @@ static int __init osk_soc_init(void)
 
 static void __exit osk_soc_exit(void)
 {
+	clk_unprepare(tlv320aic23_mclk);
 	clk_put(tlv320aic23_mclk);
 	platform_device_unregister(osk_snd_device);
 }
-- 
2.35.1

