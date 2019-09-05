Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BEFE2AA2B7
	for <lists+alsa-devel@lfdr.de>; Thu,  5 Sep 2019 14:08:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 34BF416AA;
	Thu,  5 Sep 2019 14:07:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 34BF416AA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1567685319;
	bh=/JXsEkLrbh2vMklbsoG2b/dT5pBlhAQ4ShJ/cI7o23s=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=YdGYcJqUpDUFLDw5kJdU2PuKNpr/6e9vp7Uy9Ea/aKP6/BU+wGbJJgPdGz/CErsXW
	 1pot8OTfvblehWrQnY7nBdlJRiFkvBAb+VVmo+3EILCjn7/nU7EINik4N8/psBISLJ
	 BD/IDzk+JMjRJUr8RQmATX+B1BGlssquT2/8pnIk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5230CF80672;
	Thu,  5 Sep 2019 14:02:00 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 942F2F80227; Thu,  5 Sep 2019 14:01:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 95224F80227
 for <alsa-devel@alsa-project.org>; Thu,  5 Sep 2019 14:01:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 95224F80227
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com
 header.i=@baylibre-com.20150623.gappssmtp.com header.b="DzwniM7S"
Received: by mail-wr1-x444.google.com with SMTP id u16so2483733wrr.0
 for <alsa-devel@alsa-project.org>; Thu, 05 Sep 2019 05:01:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xyfe6twDn91vPCbiXX1zqgwt25Jhxxgzdbixh4MbER0=;
 b=DzwniM7S9e2dHldU3F+1DNyQh1GbrFBvALKFQRdXceZd7xAI6n3jUPUCOzCJ39+RDi
 J/h6MRpzGNtTE/lw14UHMVnmNAGdOEzU7cyD99NofWKpkbPsQOTE1+MDFwj25NmQc3aO
 W9KH3c2WRcRShGvbDNapGZ8QQDL4sFg+qd7j7Nzc514rBwmGbz2zA1L8LG/nLsogy/fA
 gbsccH4/iSxF0MbRsw1lImO1xy42xcxgf1z3Y5NcIUrEEWHcKDNlznQroP7+78TwZyWg
 d0nS6Jm0A0bQ3uda/ZmbM2ajPTylIKrRF9tkaXSX06wgn/nRJlzvISC8J8q1DNDX01Wb
 8kfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xyfe6twDn91vPCbiXX1zqgwt25Jhxxgzdbixh4MbER0=;
 b=YhK7tthDyh+N/D0wcy5Lx4rurVgpn9O5w9n+y6g/GFxFd+rZdhVXrO7y0ds/nCqWZP
 11/EXComPmaPlyiP4bvmsKhKC5q0m9woQAnyGMMQzolYA6gl56gIY3QIA6OX4rrRgvij
 FDZ7xA6PyzvPQE1d5YE3obRPNQdOoOKt+LIXcbvlohDT/TMZSlg679qf0+UcKm2gDBe8
 5lxKbwDsMIShedOzxv5BXeoQbNTC2mb1Y1f29RDuZPnv5TkStF3yXaOCrFvjgsJ51ufI
 SzGMJiOePjNJ9tWCF7n6uetDPuniKYWhnqycLiqn+BPOX+3P2Tc370LyKHd9uzz6AWgG
 7jWA==
X-Gm-Message-State: APjAAAViDgE69ccubcwLWMaDi0tT2fWzyBgyOaTqrT+SRDHtixFofUNZ
 ax4yVnZFfxTZERL6h6j8u/e+fQ==
X-Google-Smtp-Source: APXvYqwctgVu4tqOBuDPlYOZXUwUpykru62hEl6KkwzhkUaceLyj2F4nPnNTNrghrllnO/9ig8jY8A==
X-Received: by 2002:a5d:4b41:: with SMTP id w1mr2142326wrs.23.1567684892350;
 Thu, 05 Sep 2019 05:01:32 -0700 (PDT)
Received: from starbuck.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.googlemail.com with ESMTPSA id a18sm3436311wrh.25.2019.09.05.05.01.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Sep 2019 05:01:31 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>
Date: Thu,  5 Sep 2019 14:01:16 +0200
Message-Id: <20190905120120.31752-5-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190905120120.31752-1-jbrunet@baylibre.com>
References: <20190905120120.31752-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-Patchwork-Bot: notify
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Kevin Hilman <khilman@baylibre.com>, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org, Jerome Brunet <jbrunet@baylibre.com>
Subject: [alsa-devel] [PATCH 4/8] ASoC: meson: axg-toddr: expose all 8 inputs
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

The TODDR component, as it, has a maximum of 8 input. Depending on
the SoC, these may not all be connected or some input components may
not be supported

Instead of decribing only the connected inputs, describe them all
and let ASoC routing do the rest.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 sound/soc/meson/axg-toddr.c | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/sound/soc/meson/axg-toddr.c b/sound/soc/meson/axg-toddr.c
index 4f63e434fad4..2e9a2e5862ce 100644
--- a/sound/soc/meson/axg-toddr.c
+++ b/sound/soc/meson/axg-toddr.c
@@ -142,16 +142,11 @@ static struct snd_soc_dai_driver axg_toddr_dai_drv = {
 };
 
 static const char * const axg_toddr_sel_texts[] = {
-	"IN 0", "IN 1", "IN 2", "IN 3", "IN 4", "IN 6"
+	"IN 0", "IN 1", "IN 2", "IN 3", "IN 4", "IN 5", "IN 6", "IN 7"
 };
 
-static const unsigned int axg_toddr_sel_values[] = {
-	0, 1, 2, 3, 4, 6
-};
-
-static SOC_VALUE_ENUM_SINGLE_DECL(axg_toddr_sel_enum, FIFO_CTRL0,
-				  CTRL0_SEL_SHIFT, CTRL0_SEL_MASK,
-				  axg_toddr_sel_texts, axg_toddr_sel_values);
+static SOC_ENUM_SINGLE_DECL(axg_toddr_sel_enum, FIFO_CTRL0, CTRL0_SEL_SHIFT,
+			    axg_toddr_sel_texts);
 
 static const struct snd_kcontrol_new axg_toddr_in_mux =
 	SOC_DAPM_ENUM("Input Source", axg_toddr_sel_enum);
@@ -163,7 +158,9 @@ static const struct snd_soc_dapm_widget axg_toddr_dapm_widgets[] = {
 	SND_SOC_DAPM_AIF_IN("IN 2", NULL, 0, SND_SOC_NOPM, 0, 0),
 	SND_SOC_DAPM_AIF_IN("IN 3", NULL, 0, SND_SOC_NOPM, 0, 0),
 	SND_SOC_DAPM_AIF_IN("IN 4", NULL, 0, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_AIF_IN("IN 5", NULL, 0, SND_SOC_NOPM, 0, 0),
 	SND_SOC_DAPM_AIF_IN("IN 6", NULL, 0, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_AIF_IN("IN 7", NULL, 0, SND_SOC_NOPM, 0, 0),
 };
 
 static const struct snd_soc_dapm_route axg_toddr_dapm_routes[] = {
@@ -173,7 +170,9 @@ static const struct snd_soc_dapm_route axg_toddr_dapm_routes[] = {
 	{ "SRC SEL", "IN 2", "IN 2" },
 	{ "SRC SEL", "IN 3", "IN 3" },
 	{ "SRC SEL", "IN 4", "IN 4" },
+	{ "SRC SEL", "IN 5", "IN 5" },
 	{ "SRC SEL", "IN 6", "IN 6" },
+	{ "SRC SEL", "IN 7", "IN 7" },
 };
 
 static const struct snd_soc_component_driver axg_toddr_component_drv = {
-- 
2.21.0

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
