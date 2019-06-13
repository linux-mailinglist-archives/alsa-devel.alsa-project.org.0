Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 967FF435A2
	for <lists+alsa-devel@lfdr.de>; Thu, 13 Jun 2019 13:45:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1ED391822;
	Thu, 13 Jun 2019 13:44:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1ED391822
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1560426312;
	bh=8oWDzZPpwqLhHNAgQdAIlIR76Um90XhYW9GR/uG27GM=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=cjUBJnGeRuLgGny3fDI1Ej0+3Uxe/u0WUQ3dC2s+GH+AImP0QcuDgkVdCuuAp5Ysh
	 xyLXcp5j7JfYJnM/A84TlDSLJEzKOdCA97DDb2UfhKtStxTENfZ9D2C9z1j/Xbhole
	 Y2Hqnp0Qsk+1xSrISAf4ZfLfhZMQgH9/aO4N63Iw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C1E4FF8972F;
	Thu, 13 Jun 2019 13:42:47 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8F13DF896F1; Thu, 13 Jun 2019 13:42:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BE138F80791
 for <alsa-devel@alsa-project.org>; Thu, 13 Jun 2019 13:42:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BE138F80791
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com
 header.i=@baylibre-com.20150623.gappssmtp.com header.b="t8gsBpvV"
Received: by mail-wm1-x341.google.com with SMTP id u8so9778899wmm.1
 for <alsa-devel@alsa-project.org>; Thu, 13 Jun 2019 04:42:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ct4dk4GNCZZpVBLlWG9IpyH3sVkXJaOUvUrsuvrJN7k=;
 b=t8gsBpvVYiQYc5Cn+QwlQpiY7tEcHBk2PiEx7Mm99YPiqUHhaR1qhC0wYPkrGD4SHH
 AeMv6d+++LORjfxG0hocO0hAVvVWjfgFXU7DUebAhDowZP5pxIZyokfKWuCJzU8ptVhs
 QTgFlBriQSaGZrLhOrDLhAUzOUWa2IZ20zuUZUL7kLXsMMqv8CincQItL92lCi5QYDLp
 yO8rK8tCPUVh0fCCcPIWZsvG5XWSoviGFdcRgDhPtSwdgQT738Uv3cgVBbCBZVsW2SCz
 ENsPDyh/zm4wAkf0I4yvwFPYHgBcqLTLWSYk/hhtUFHz1WUfsbUpGdYYMdpUXFx89UY4
 6JIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ct4dk4GNCZZpVBLlWG9IpyH3sVkXJaOUvUrsuvrJN7k=;
 b=tFrtmw5nU1n9elA8jDdnWYz0Jt18Wb0uj9rWH0A0NTo2uuOw1NqTOWB3K8ThviVFKM
 QfUfHZKusWhXgj1Q9nwSr8oSl5zWO0012OmgyX0wbnkHl3FzBl9H2Vw1J4EcmPR/z/gF
 Yw+RkGn703oFaUjJs/mXHbSwM/7jK4EtaM4IQ/+fpiqmze04Yk4rXq9Wqw+6DQiwgB5I
 b8hucBw5NagaYhTsgcVFPFA0btfeO+TMfBksvkN+gWLdZKW0EdzMM8vjY2I9GMXlvGrr
 AniaVJnptdTSqQnZrucQ9yzgaTV0UEDcbT+CxeWiwdI/DQtov9ZWXTbRhFw4LdjDXBdp
 74sw==
X-Gm-Message-State: APjAAAUku5QFEjQvB8wj1pzQYt1GGzWnjRz/XZf0IWP81iIi0HH0opAN
 J2tv93mSwaQZP8uGihffDZtiNQ==
X-Google-Smtp-Source: APXvYqwqh3apCFq8wjX/n7GQ82ee2GciU3Q+2n5x2zCfXMbElFvgw/Kli69Hg3m7WsELb0p2+ZsBpA==
X-Received: by 2002:a05:600c:254b:: with SMTP id
 e11mr3135082wma.171.1560426159921; 
 Thu, 13 Jun 2019 04:42:39 -0700 (PDT)
Received: from boomer.local (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31])
 by smtp.googlemail.com with ESMTPSA id b5sm2598490wru.69.2019.06.13.04.42.39
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 13 Jun 2019 04:42:39 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Kevin Hilman <khilman@baylibre.com>
Date: Thu, 13 Jun 2019 13:42:30 +0200
Message-Id: <20190613114233.21130-2-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190613114233.21130-1-jbrunet@baylibre.com>
References: <20190613114233.21130-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-Patchwork-Bot: notify
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 Jerome Brunet <jbrunet@baylibre.com>
Subject: [alsa-devel] [PATCH 1/4] ASoC: meson: axg-tdmin: right_j is not
	supported
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

Right justified format is actually not supported by the amlogic tdm input
decoder.

Fixes: 13a22e6a98f8 ("ASoC: meson: add tdm input driver")
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 sound/soc/meson/axg-tdmin.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/sound/soc/meson/axg-tdmin.c b/sound/soc/meson/axg-tdmin.c
index a790f925a4ef..cb87f17f3e95 100644
--- a/sound/soc/meson/axg-tdmin.c
+++ b/sound/soc/meson/axg-tdmin.c
@@ -121,7 +121,6 @@ static int axg_tdmin_prepare(struct regmap *map,
 		break;
 
 	case SND_SOC_DAIFMT_LEFT_J:
-	case SND_SOC_DAIFMT_RIGHT_J:
 	case SND_SOC_DAIFMT_DSP_B:
 		break;
 
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
