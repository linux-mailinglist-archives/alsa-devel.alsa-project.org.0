Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FDAD95EDE
	for <lists+alsa-devel@lfdr.de>; Tue, 20 Aug 2019 14:36:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3846C1669;
	Tue, 20 Aug 2019 14:35:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3846C1669
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1566304582;
	bh=3HZqylvwQaYnJ2Ci31IZmpGFMhDgeeUF2yRcaPqaJJw=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=HzM38c0JcxVITID3/fwu4sXiOHJMZ3DBESGRTNFaxY7+d2hD11y3QShPRtLNC94If
	 PZvBTE+l9gbl2EJWANTXl85PJYjDlDAXlTV8AF6lZ+FywYj+ik/Cjdliox3o8eQAL6
	 p5cGREmAFVgR68dTVzs/HzgOkWVrkBjYGkalKjkA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 99946F803D5;
	Tue, 20 Aug 2019 14:34:38 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 69C7BF8036E; Tue, 20 Aug 2019 14:34:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E7CF2F800D3
 for <alsa-devel@alsa-project.org>; Tue, 20 Aug 2019 14:34:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E7CF2F800D3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com
 header.i=@baylibre-com.20150623.gappssmtp.com header.b="QX2ousUi"
Received: by mail-wr1-x441.google.com with SMTP id r3so12237567wrt.3
 for <alsa-devel@alsa-project.org>; Tue, 20 Aug 2019 05:34:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=C4Mb2956O3FRxXwLE7go2npN/BtpK8pSn0FcezT5G7k=;
 b=QX2ousUiVBfSy/6wp/ndiWEdieYpT86MhekZPf558vtyY6ounj3GNb8xDtX9fTyjQ+
 H/6hrMlgDpF8KLQyFos/ukJ65U/LNDR7fJnxuDhLDn1bGgRO8MXmO0eK33ILYpduu0zw
 PH7iRrywrKqO32ZGY/nGOPR5JhMKqUlQTJMaTqoY80etoh8RIpC9EP8D/A7O5miCYyfo
 7+e98l/N4Aza0s8osWdP+wb3iG/Bbfm/OJWyWCMWTn12NuvnNrrKnQaWhTmxYi8IAdak
 obVglZAWVmeNpHBrzeIHVtmM6+SoypHInqmkKexdMhfmznhWEdkeASFDSPBPeMvgtkhJ
 6CCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=C4Mb2956O3FRxXwLE7go2npN/BtpK8pSn0FcezT5G7k=;
 b=Pk83hhmk6YpF6+vZu7YZMDvSrStqUWC5G4YGMASYZYnyOLiNIUYWSWXsWdbWeLDW7M
 9TjhG6tJ0cAQx+6e00guOaVpiUrto710aNliFgpzrrA5LEjgpUs75+FMMhrsqIkF/Ctp
 au/0VPFyOZ6IzePH62NpiuI+8OKVR1Jvzu1tP4gO3s+Hdu6EP+/YELL0ln8pe8c6b6vj
 Bevi7if0fQiOuxr6IBgjCZpZVOkOkKfBOxDo/o9sknZa72QqCWF+puuYwegzd2tY11sr
 bdinE+bGwDBezDGUqR3qagB1gO3obKBmBav07DM1xSCqqOdyfpT5vAPuDMqaLTkhImq0
 fttw==
X-Gm-Message-State: APjAAAXQhYCtrhTCxBZsU5yuXGlsumBgVu5g+CWlzrXDYOFuw4tSI0OD
 A4Mf6bexCCNEQIffTXSFCBw0+q0zJPA=
X-Google-Smtp-Source: APXvYqyfMx9psJcHwdQJaV1Gfgogu/f2ULTJSwrbGBvr+1926NVQ0lmFBoo5xeAkyfipxmA98WqE2Q==
X-Received: by 2002:adf:a2cd:: with SMTP id t13mr31996957wra.251.1566304470874; 
 Tue, 20 Aug 2019 05:34:30 -0700 (PDT)
Received: from starbuck.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.googlemail.com with ESMTPSA id 39sm59456442wrc.45.2019.08.20.05.34.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Aug 2019 05:34:30 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>
Date: Tue, 20 Aug 2019 14:34:13 +0200
Message-Id: <20190820123413.22249-1-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-Patchwork-Bot: notify
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Kevin Hilman <khilman@baylibre.com>, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org, Jerome Brunet <jbrunet@baylibre.com>
Subject: [alsa-devel] [PATCH] ASoC: meson: axg-tdm-formatter: free reset on
	device removal
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

Use the devm variant to get the formatter reset so it is properly freed
on device removal

Fixes: 751bd5db5260 ("ASoC: meson: axg-tdm-formatter: add reset")
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 sound/soc/meson/axg-tdm-formatter.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/meson/axg-tdm-formatter.c b/sound/soc/meson/axg-tdm-formatter.c
index 21c735afab35..358c8c0d861c 100644
--- a/sound/soc/meson/axg-tdm-formatter.c
+++ b/sound/soc/meson/axg-tdm-formatter.c
@@ -325,7 +325,7 @@ int axg_tdm_formatter_probe(struct platform_device *pdev)
 	}
 
 	/* Formatter dedicated reset line */
-	formatter->reset = reset_control_get_optional_exclusive(dev, NULL);
+	formatter->reset = devm_reset_control_get_optional_exclusive(dev, NULL);
 	if (IS_ERR(formatter->reset)) {
 		ret = PTR_ERR(formatter->reset);
 		if (ret != -EPROBE_DEFER)
-- 
2.21.0

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
