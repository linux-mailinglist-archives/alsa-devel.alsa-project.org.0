Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 280CA35C779
	for <lists+alsa-devel@lfdr.de>; Mon, 12 Apr 2021 15:24:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 90DB81607;
	Mon, 12 Apr 2021 15:24:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 90DB81607
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1618233895;
	bh=ndmgm+DFh8GvIwQGB+8FyXALVyWOb3oF6qzUjHxeO8M=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=qX3HGcDqwm0otcY43MBVwLvgwtGAil7kvuOgt2gES5x1wQSPmf+dZgLmzpy9SeLNq
	 lZdMq9hcsNCo+A8p4A5EjOKGrUeQwvE2Igk35BoWS/0hqCHf6z82S2nNEi9nCh6GQe
	 veJVNvLfvi101QgG7oAJFeGfcM2yQ8rz3tQtxqug=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EBA2DF8013D;
	Mon, 12 Apr 2021 15:23:26 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 89E37F80269; Mon, 12 Apr 2021 15:23:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 53AB7F800D3
 for <alsa-devel@alsa-project.org>; Mon, 12 Apr 2021 15:23:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 53AB7F800D3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com
 header.i=@baylibre-com.20150623.gappssmtp.com header.b="leYZC5Ow"
Received: by mail-wm1-x335.google.com with SMTP id
 j20-20020a05600c1914b029010f31e15a7fso8683877wmq.1
 for <alsa-devel@alsa-project.org>; Mon, 12 Apr 2021 06:23:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=6RMmYYuU+0a6526L101Df6MPF+9Ne8jsB4VHTPjDRzM=;
 b=leYZC5OwyHfO+RaQtnO/IKGmFzshm9oxi3w2NmGmISXC7k2l1T62GS4Bx/F8ZaLMVZ
 3JNoFy3P1JTddEIe4Strnc4tmO1uDoHo8175fq6gvRdxkUGbirbrl6f31CrrsIxY6+RK
 ijPqP27AxPt2vFD2Dc9ixPtj5vvWliqTUvGXeC+SgZQdkyPMl3JxmETIpwJfzSFcPzRI
 YKFVU2QROjlhjB0z84C2N6svOqF746FuPS4yIATzwziTj5OJx4tOUm2v6yfDtsfbhIGr
 nvbvVaAvtJ8HP0wrPV4WuT8o/SUKNqwAcIywHCL/89AJWC3o2a43FhwGpVVLhNqza5HP
 JyCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=6RMmYYuU+0a6526L101Df6MPF+9Ne8jsB4VHTPjDRzM=;
 b=KP4yLHT7Loufazvm6NVDzE1TU1Bi9a/SZKH64vNGYLVhThGOWunurzmxHlPO0FFQpe
 b2HykPpzmAdoLopEMSW3LmB8/ijyET1PMFmMShW+seDZFhux1KGcG7XCMyHsvzIJEUyn
 8/48CukU9XTUAhtDRS+AGAI41DFZDvjsH9PjoL7vdnEsWm9fOZ069nmVdcqO48dQ5TAc
 3naA8K/8ipJFuCEoV0uOL1i+VaGy2ziZJYuAGRlWmzSrzJeRxvxv9DlYhxAOa4SyPz/V
 xOqRDX4sZv9FFeTZvt/6QQ1h1hSUGkh1sPfgd2qc+8//MoqToSL/cmwbhTPNYAXesTIG
 f6rQ==
X-Gm-Message-State: AOAM531xtdk5sjaAwMpbVETRAMtV2SpEWOQ1dKiVZ8z+tt4RlXqewlrp
 lrSxQIj8eVOougJC30GTxAnYWg==
X-Google-Smtp-Source: ABdhPJzNv3NwebTHH2w3RT/SGRTxA+8oIWytylSgXkx7m6KWVzab7qUkugTYfCASOXGAQqhsy3VDAA==
X-Received: by 2002:a1c:e309:: with SMTP id a9mr8576793wmh.63.1618233787571;
 Mon, 12 Apr 2021 06:23:07 -0700 (PDT)
Received: from starbuck.lan (82-65-169-74.subs.proxad.net. [82.65.169.74])
 by smtp.googlemail.com with ESMTPSA id a4sm16624761wrx.86.2021.04.12.06.23.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Apr 2021 06:23:07 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>
Subject: [PATCH] ASoC: meson: axg-frddr: fix fifo depth on g12 and sm1
Date: Mon, 12 Apr 2021 15:22:56 +0200
Message-Id: <20210412132256.89920-1-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-Patchwork-Bot: notify
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Kevin Hilman <khilman@baylibre.com>,
 Christian Hewitt <christianshewitt@gmail.com>, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org, Jerome Brunet <jbrunet@baylibre.com>
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

Previous fifo depth patch was only tested on axg, not g12 or sm1.
Of course, while adding hw_params dai callback for the axg, I forgot to do
the same for g12 and sm1, leaving the depth unset and breaking playback on
these SoCs.

Add hw_params callback to the g12 dai_ops to fix the problem.

Fixes: 6f68accaa864 ("ASoC: meson: axg-frddr: set fifo depth according to the period")
Reported-by: Christian Hewitt <christianshewitt@gmail.com>
Tested-by: Christian Hewitt <christianshewitt@gmail.com>
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 sound/soc/meson/axg-frddr.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/meson/axg-frddr.c b/sound/soc/meson/axg-frddr.c
index 8ed114de0bdf..37f4bb3469b5 100644
--- a/sound/soc/meson/axg-frddr.c
+++ b/sound/soc/meson/axg-frddr.c
@@ -171,6 +171,7 @@ static const struct axg_fifo_match_data axg_frddr_match_data = {
 
 static const struct snd_soc_dai_ops g12a_frddr_ops = {
 	.prepare	= g12a_frddr_dai_prepare,
+	.hw_params	= axg_frddr_dai_hw_params,
 	.startup	= axg_frddr_dai_startup,
 	.shutdown	= axg_frddr_dai_shutdown,
 };
-- 
2.30.2

