Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A0CBE255D96
	for <lists+alsa-devel@lfdr.de>; Fri, 28 Aug 2020 17:16:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5477A189E;
	Fri, 28 Aug 2020 17:15:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5477A189E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1598627806;
	bh=a2/BofKB+XGI3vE1Ny2QpefHDyPaK6JfrBus9W7ZmdY=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Pn1wcs2uI9nDduXpxjRNAQ2OX7vNWUpYZ6/9dYlPQJLzarL7ka/IS/aQmkxl6x7Vj
	 8ApTOsm9PWaxVDjLeRtg2zsNS6ArmBgW+2UlqKaGa3dBUAPR91e9mB/bjnKAEHV+X4
	 WheZPmoMUbQkOVQzwFHfuPd3P1ji3PTsSsKG3Z0U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7688FF800EB;
	Fri, 28 Aug 2020 17:15:05 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2BAA5F80105; Fri, 28 Aug 2020 17:15:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 82130F80105
 for <alsa-devel@alsa-project.org>; Fri, 28 Aug 2020 17:14:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 82130F80105
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com
 header.i=@baylibre-com.20150623.gappssmtp.com header.b="F8plumSa"
Received: by mail-wm1-x343.google.com with SMTP id t2so1274158wma.0
 for <alsa-devel@alsa-project.org>; Fri, 28 Aug 2020 08:14:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=6XO7ADdhJqpOQN7r6IzL9NHcOCfqqL0xalqP8Zr9AVw=;
 b=F8plumSakJirsH7lNu+Hn/G7X19AHjzTM5ONVDRwW97YDaWp3eg5szWB9CGtJhU1Vl
 xDFBvsnLlFHfbRlyNJtUC4tBi4s/mV1k4Rb02oFIBor+rPQeL/cg6t4Cew5Gn5mWJpIE
 Vt9KWC3iVYvkuyvrFRynD11z7LAMVPS+NI9tnBG14HFtnOHW6LVuCYnX33VWdWOsXr5e
 qFu28wlsnB7Y9L5unZLg6f+471jLdM9fe5jHwFkhnxxvaPAzYGZRjDgNUWQ6qtm+iBJt
 x/eqVD/jlV7ybQwhqzNXBTd6BUWYCR8zG7Co5wjqsfBCECYSt9kbIJ4zzWAjtCSaqkcb
 kGMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=6XO7ADdhJqpOQN7r6IzL9NHcOCfqqL0xalqP8Zr9AVw=;
 b=rUxLk/eouWn5dMBLoKCS/En/dDM1hH9l87PjcTDMOgddiGt2v+9QBSCUMKLR0gdnCJ
 j72C0W7M2H9/Thz1J9AbpsYl+3HLg+C8BMpjbaANl1MCykzYOHX5GaXxCSsabdOz6/p6
 a4HtAOR4n0Jii/ZhdZGDLaCP65YJ4TjspFJowyLRwsym7ue88P2E3Bpoz65V0hjlaWZh
 Zt8tR8/Fg6EdA1XVKCKkQt1X+CGJufqBKi9Dl/1VvtOJPIByEwKB0JwWfS3n3opGyBtO
 +oH/Ya4xdueEqMdk8+1yFsIl/bFQEkoOQLtm2QMKA4kDixwZAkDJ0GDlMjfSawMqrcwB
 Hj3Q==
X-Gm-Message-State: AOAM532DOE88eS6qxzC9QKGB4RAmn3ZS8rGBMq8KjBtHuaP4mOCT4t12
 fFrXmwSeGFXNRayPZIIiItgYwA==
X-Google-Smtp-Source: ABdhPJxjB6+c5w8aI5zAeGsZDGu6H+RsO/PecnVXHIa5KCb0j3pXBs/KW6K15lIti3aH81H18eacBw==
X-Received: by 2002:a1c:7215:: with SMTP id n21mr2039022wmc.156.1598627690389; 
 Fri, 28 Aug 2020 08:14:50 -0700 (PDT)
Received: from starbuck.baylibre.local
 (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.googlemail.com with ESMTPSA id b8sm2877677wmh.48.2020.08.28.08.14.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Aug 2020 08:14:49 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>
Subject: [PATCH] ASoC: meson: axg-toddr: fix channel order on g12 platforms
Date: Fri, 28 Aug 2020 17:14:38 +0200
Message-Id: <20200828151438.350974-1-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.25.4
MIME-Version: 1.0
X-Patchwork-Bot: notify
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Kevin Hilman <khilman@baylibre.com>,
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
 Nicolas Belin <nbelin@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>
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

On g12 and following platforms, The first channel of record with more than
2 channels ends being placed randomly on an even channel of the output.

On these SoCs, a bit was added to force the first channel to be placed at
the beginning of the output. Apparently the behavior if the bit is not set
is not easily predictable. According to the documentation, this bit is not
present on the axg series.

Set the bit on g12 and fix the problem.

Fixes: a3c23a8ad4dc ("ASoC: meson: axg-toddr: add g12a support")
Reported-by: Nicolas Belin <nbelin@baylibre.com>
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 sound/soc/meson/axg-toddr.c | 24 +++++++++++++++++++++++-
 1 file changed, 23 insertions(+), 1 deletion(-)

diff --git a/sound/soc/meson/axg-toddr.c b/sound/soc/meson/axg-toddr.c
index e711abcf8c12..d6adf7edea41 100644
--- a/sound/soc/meson/axg-toddr.c
+++ b/sound/soc/meson/axg-toddr.c
@@ -18,6 +18,7 @@
 #define CTRL0_TODDR_SEL_RESAMPLE	BIT(30)
 #define CTRL0_TODDR_EXT_SIGNED		BIT(29)
 #define CTRL0_TODDR_PP_MODE		BIT(28)
+#define CTRL0_TODDR_SYNC_CH		BIT(27)
 #define CTRL0_TODDR_TYPE_MASK		GENMASK(15, 13)
 #define CTRL0_TODDR_TYPE(x)		((x) << 13)
 #define CTRL0_TODDR_MSB_POS_MASK	GENMASK(12, 8)
@@ -189,10 +190,31 @@ static const struct axg_fifo_match_data axg_toddr_match_data = {
 	.dai_drv		= &axg_toddr_dai_drv
 };
 
+static int g12a_toddr_dai_startup(struct snd_pcm_substream *substream,
+				 struct snd_soc_dai *dai)
+{
+	struct axg_fifo *fifo = snd_soc_dai_get_drvdata(dai);
+	int ret;
+
+	ret = axg_toddr_dai_startup(substream, dai);
+	if (ret)
+		return ret;
+
+	/*
+	 * Make sure the first channel ends up in the at beginning of the output
+	 * As weird as it looks, without this the first channel may be misplaced
+	 * in memory, with a random shift of 2 channels.
+	 */
+	regmap_update_bits(fifo->map, FIFO_CTRL0, CTRL0_TODDR_SYNC_CH,
+			   CTRL0_TODDR_SYNC_CH);
+
+	return 0;
+}
+
 static const struct snd_soc_dai_ops g12a_toddr_ops = {
 	.prepare	= g12a_toddr_dai_prepare,
 	.hw_params	= axg_toddr_dai_hw_params,
-	.startup	= axg_toddr_dai_startup,
+	.startup	= g12a_toddr_dai_startup,
 	.shutdown	= axg_toddr_dai_shutdown,
 };
 
-- 
2.25.4

