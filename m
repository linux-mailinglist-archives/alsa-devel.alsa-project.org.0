Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B24CF95EDF
	for <lists+alsa-devel@lfdr.de>; Tue, 20 Aug 2019 14:37:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5F7C5165F;
	Tue, 20 Aug 2019 14:36:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5F7C5165F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1566304629;
	bh=2jVX64Nnh/WTvT9kZ2W6N2fMUcNmti+Oic9bZJN3LQA=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=fanKWCIns03XtW8rI0OLaFnwDtDXaQVbz/QlH8/xXVdwSEE2YmmqOp8CtmeCJcG0m
	 wY0HhcmxoqJdSOXmY6BNxY4I2V3InO8yokdwHI00N+W5v40daN1S3+jBY8jog9/0G6
	 gQAmGQDOB1Cf4sxM0+a1Y+fZmnlbT60HSMPrhlng=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D4A83F803F3;
	Tue, 20 Aug 2019 14:35:22 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DD78CF80529; Tue, 20 Aug 2019 14:35:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1BACCF80391
 for <alsa-devel@alsa-project.org>; Tue, 20 Aug 2019 14:35:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1BACCF80391
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com
 header.i=@baylibre-com.20150623.gappssmtp.com header.b="HD7yEtEN"
Received: by mail-wr1-x442.google.com with SMTP id k2so12225474wrq.2
 for <alsa-devel@alsa-project.org>; Tue, 20 Aug 2019 05:35:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=f0GMZ30YIFAvd4BpzkWj3t3CsrOU2xIx+D0MV3qKWwM=;
 b=HD7yEtENDDCyJ+cTYqoAme6M2J6NtjGhq3AGudkN57sTS1uopnxxw53ihlT7+XQbad
 G0b8SvorSPr4kQJuFsmCTOhR85ICveNvh11HAO9OU8S5Wz+/tkj/pS5wucxjNWbO88Xv
 Yy/G6oJj+9ZYe61x+QPhpQ80+3p6OoL/xE8cxWKtaDJaB68e+QF1hZhtTSPdP3ydrwHp
 qbcS9Xh6Pj06txoXkIAid4SNhHjSKQVwpdrYW13DD4UC3BoPvBECBdHoDc7qBUn6kf20
 O5H0+oA/DsxyyAYvX4QqjC2mr4tOQKHza0WP75F9hL3lbAnv0+v6csDHodJDSSqhP6/n
 SLeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=f0GMZ30YIFAvd4BpzkWj3t3CsrOU2xIx+D0MV3qKWwM=;
 b=CRqn+4lWKbGKaE7j9e2ZCzl1DkzUFki4WzM3VcwAh79A6pRk1bSfgDaazUI4N4WvGN
 YyAyypi66ZIoLL/OEKskhe/OQ87kiv/pib7PTUhBfnt7ty2fRDH1BMQP7N6KlpFF2P/U
 POzPZaxeRjLCnl00D3+UA3m+BUhhrwy+jlId1UV7AAUNjmcMqKhkFqnzNW5qJNHcbAAQ
 s/y5kF8/7Zi4qHhf1MShAhXoHGgJcKHmVmh9gZKYjILvDm+ufyi0eYbd2XIjZfxnF3FL
 eaw3j4elrgMkm3b0RGyCc5xz/JQCS2Fqsmp2bD687IIaSbM5uOY4hfkHy2hCiHAI3/OG
 S40A==
X-Gm-Message-State: APjAAAXJ0J45bqyIAWEBOtMqGt+QoKiiWltanB5qShZeuerv5KSaZxd8
 hJwoYhXyqvffwaKYTio9k3QL7g==
X-Google-Smtp-Source: APXvYqx2gGA189ZOi44f1fTFmoVy+zzWIEPmaIN3RmlvE4ZjcSTl6+IoA4dhS0VzFiEIp/piWYqVWw==
X-Received: by 2002:a5d:610d:: with SMTP id v13mr7166603wrt.249.1566304516138; 
 Tue, 20 Aug 2019 05:35:16 -0700 (PDT)
Received: from starbuck.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.googlemail.com with ESMTPSA id m23sm29661097wml.41.2019.08.20.05.35.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Aug 2019 05:35:15 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>
Date: Tue, 20 Aug 2019 14:35:10 +0200
Message-Id: <20190820123510.22491-1-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-Patchwork-Bot: notify
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Kevin Hilman <khilman@baylibre.com>, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org, Jerome Brunet <jbrunet@baylibre.com>
Subject: [alsa-devel] [PATCH] ASoC: meson: g12a-tohdmitx: require regmap mmio
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

The tohdmitx glue uses regmap MMIO so it should require it.

Fixes: c8609f3870f7 ("ASoC: meson: add g12a tohdmitx control")
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 sound/soc/meson/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/meson/Kconfig b/sound/soc/meson/Kconfig
index 63b38c123103..2e3676147cea 100644
--- a/sound/soc/meson/Kconfig
+++ b/sound/soc/meson/Kconfig
@@ -87,6 +87,7 @@ config SND_MESON_AXG_PDM
 
 config SND_MESON_G12A_TOHDMITX
 	tristate "Amlogic G12A To HDMI TX Control Support"
+	select REGMAP_MMIO
 	imply SND_SOC_HDMI_CODEC
 	help
 	  Select Y or M to add support for HDMI audio on the g12a SoC
-- 
2.21.0

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
