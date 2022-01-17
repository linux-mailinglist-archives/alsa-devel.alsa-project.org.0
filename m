Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 864134901BA
	for <lists+alsa-devel@lfdr.de>; Mon, 17 Jan 2022 06:46:56 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1780C1766;
	Mon, 17 Jan 2022 06:46:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1780C1766
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1642398416;
	bh=fldIVNgOHyFNfoKSVkZNyAmdvzzaVsmSoDZGqQArDzw=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=j/V74e9ATfNVuKR9rq443fgw2L57AbKwuQwcH+XJRvLt3NIdVmpVOzMQ0FgZMVWnr
	 HT7DtyEMO9E59vpSQi1jkVNWDmXuO43MeVP1N59/CGnGMN/DivZ7uG/GgGfQevZUvK
	 IpB0Do46B6uKxLPqo5GKu2noWHfXp8GUU7epgpz4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 45113F80506;
	Mon, 17 Jan 2022 06:45:50 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BBCB3F80425; Mon, 17 Jan 2022 06:45:45 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail-ua1-x933.google.com (mail-ua1-x933.google.com
 [IPv6:2607:f8b0:4864:20::933])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1D084F80249
 for <alsa-devel@alsa-project.org>; Mon, 17 Jan 2022 06:45:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1D084F80249
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="pmZXDEv7"
Received: by mail-ua1-x933.google.com with SMTP id l15so28393016uai.11
 for <alsa-devel@alsa-project.org>; Sun, 16 Jan 2022 21:45:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Y0oUOdrqx+M8py6qBVJEFpjZfRB3lbu88LpKn+n4xFE=;
 b=pmZXDEv7iSwpJpTGyxqLIzk7jhq/Vi9ZB43sj1LMdQc/OU4J7XN83dD3YojAvNsoyI
 TqcN6zwobKvHNxTKi5vAH1nvfDoOc1pDbBL6o4gXtbwFSGMHlof6TK8vVWKmSTmjIkcd
 nvbK4SrS9LCmu4jGNOaGYMT9IeNt+YHGiULQY7ccclyruK3TcJwwAE0Xzn+1spjuEXM6
 6OYTNEuggycMHr7X8BepSs7l6flHVfedcX0PIPdOdw4fLQ3tG+y5lVr2GFflpoSVhLTe
 dXLxmrv2wkeVq1su3cSyhLJtAv2ZOBo/tWJ7XThmUVmEt+uifLZ+rezqwPnP8viXmIKg
 I4Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=Y0oUOdrqx+M8py6qBVJEFpjZfRB3lbu88LpKn+n4xFE=;
 b=D0c72RPsoiu884HYQU4TVvhItfd2FoG86p2cVV3Uy9btEHHXumkKRXaWrGRxUoJqTp
 JNHRfUsQOBbfeiddedQBddlhdH2i9py9yZ5ZhX0VThL/JMil1iyneXDIXkJThrRSY0LL
 zzga6TyoAtwuhislPe9I4gCrdnrdU87pt9b7JErpHQ9DTEuXK1oX0d3d1J8by54ehNoD
 DgqIEdXf2AW06VNsB/CJ/cuPOREDB4f6eWZmUWYDjIPCviwqgWA725qp9e+xJ/26V0aK
 9B4jZsJ3DTNNF8O6aZuuSQcrVeSfG5zyIBqccikHO2ts/D/LFX2ncTa5SVVCW1VJm44I
 EaMw==
X-Gm-Message-State: AOAM532/sqw1Diui32bDVGA6Uoyndn3d61285zMWlz4dSLAyXYZVpYsA
 UxIQNzLFTKhFO0KeJwtDi+8=
X-Google-Smtp-Source: ABdhPJwawnuHrizaHjg8rkobDL8ONBEIo4JDdRDosuyLLDmKJanABd2iFWFhGJSt+PrgNZbWEO934A==
X-Received: by 2002:a67:c00b:: with SMTP id v11mr7339828vsi.56.1642398340807; 
 Sun, 16 Jan 2022 21:45:40 -0800 (PST)
Received: from kubuntu-desktop.. ([67.8.38.84])
 by smtp.gmail.com with ESMTPSA id 41sm3262976uag.18.2022.01.16.21.45.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 16 Jan 2022 21:45:40 -0800 (PST)
From: Julian Braha <julianbraha@gmail.com>
To: broonie@kernel.org, lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com
Subject: [PATCH] ASoC: au1x: fix unmet dependency on SND_SOC_I2C_AND_SPI for
 SND_SOC_WM8731
Date: Mon, 17 Jan 2022 00:45:39 -0500
Message-Id: <20220117054539.81757-1-julianbraha@gmail.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, fazilyildiran@gmail.com,
 linux-kernel@vger.kernel.org
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

When SND_SOC_DB1200 is selected,
and SND_SOC_I2C_AND_SPI is not selected,
Kbuild gives the following warning:

WARNING: unmet direct dependencies detected for SND_SOC_WM8731
  Depends on [n]: SOUND [=y] && !UML && SND [=y] && SND_SOC [=y] && SND_SOC_I2C_AND_SPI [=n]
  Selected by [y]:
  - SND_SOC_DB1200 [=y] && SOUND [=y] && !UML && SND [=y] && SND_SOC [=y] && SND_SOC_AU1XPSC [=y]

This is because SND_SOC_DB1200 selects
SND_SOC_WM8731 without selecting or depending on
SND_SOC_I2C_AND_SPI, despite SND_SOC_WM8731
depending on SND_SOC_I2C_AND_SPI.

This unmet dependency bug was detected by Kismet,
a static analysis tool for Kconfig. Please advise
if this is not the appropriate solution.

Signed-off-by: Julian Braha <julianbraha@gmail.com>
---
 sound/soc/au1x/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/au1x/Kconfig b/sound/soc/au1x/Kconfig
index 38de7c0efbc7..3dccdfddbf9d 100644
--- a/sound/soc/au1x/Kconfig
+++ b/sound/soc/au1x/Kconfig
@@ -54,6 +54,7 @@ config SND_SOC_DB1000
 config SND_SOC_DB1200
 	tristate "DB1200/DB1300/DB1550 Audio support"
 	depends on SND_SOC_AU1XPSC
+	depends on SND_SOC_I2C_AND_SPI
 	select SND_SOC_AU1XPSC_AC97
 	select SND_SOC_AC97_CODEC
 	select SND_SOC_WM9712
-- 
2.32.0

