Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ABA61681F2
	for <lists+alsa-devel@lfdr.de>; Fri, 21 Feb 2020 16:39:43 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E38B416D0;
	Fri, 21 Feb 2020 16:38:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E38B416D0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1582299583;
	bh=Eyx1O3bcdzOnfzPIy8zGyoLAcghfb4FAA8fcpkLyHFg=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=aoGRO8j3C8V4ikzFmtwOEZaAFIw7Ly4uFSAGSp+JZf2WcIzP7dqY+/MT2lp8RrdVE
	 E02xdRfL7tiYGyuXZuDuKVYWhzbZcDemnVsTvDMFAaPjxSAWIjZucXfqJ2O7SuwAfD
	 tDHjjvilOgBfxHuGmQyP/MIkUuisFDXj2s54aBUM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 72024F8028B;
	Fri, 21 Feb 2020 16:36:27 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 952F9F80240; Fri, 21 Feb 2020 16:36:23 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 319F7F80278
 for <alsa-devel@alsa-project.org>; Fri, 21 Feb 2020 16:36:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 319F7F80278
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com
 header.i=@baylibre-com.20150623.gappssmtp.com header.b="YJwIqRv9"
Received: by mail-wm1-x341.google.com with SMTP id a6so2373410wme.2
 for <alsa-devel@alsa-project.org>; Fri, 21 Feb 2020 07:36:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=eFN2VKHrE+JD0cGAI+3A9MIQDzvF5Lgt98hOYp/CejM=;
 b=YJwIqRv9ZAZT+JufvECzrUvECj3c7vl3DwyjpavnRiTUC+BT5MwCGuUuHrmuPh5Qdx
 2k2nK57li5jZtok/isZ8Y1ljxslqxASi+smgJ7u9748rS31vEE6rk1FFWUbLXsNaFofV
 WC9+91sUznQKJ4ukv+rpRKMuxbM8RZgHoBZyWBPbD0POsX8WiOb+0mYGMRZ4w9iu5anB
 PV2NTKPrVoTm9H6mFTrDDZISPtGpVmOjN6OQMXYBeRUeZh21ze7FU98JEInnGCL2lpOo
 CK7zxw0pRThM7dM1fWfJlbzxNQP95XAMC63rKo7kS7d/iCJPCdB1RkSa+kMv8AtG/3Si
 M6ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=eFN2VKHrE+JD0cGAI+3A9MIQDzvF5Lgt98hOYp/CejM=;
 b=dNc72vfm9Fee9XTgAJKqXwUWl5O6r5ndznN2K1XWrUlJp3WJYRt/4Jvgl7G6HhdIa2
 DtBshtBwphY4xR/jMjIY8N2Bv1zFj1N0aE8p4ef/pWeFoSdwswJyIAZSkagh9GBR6rl0
 O/8dYSr7UQeI7A0L8wGjRXbZTD9oxiXrHHOvCWb6z7gxYR0nGsjfBsdCPmcXONcILIUn
 huiksOBv98STaR4gwg89qk+jRTurBvyBHqyzLqOy/RjLdPzaIG1PguoNHujgnq/7vQn4
 tNhcFeyxYb5MlE2y/SgGhCNXmez59Otn1I4MkPRho06OBjlcAZpmWZCb8Q1QHhEJD+bU
 YH/w==
X-Gm-Message-State: APjAAAWo09VtqV1jtMABJ4t59zRnawfJK/rrG1XrqyIVAp0KrG1WzMeW
 N7dF8FMf4QchAPYqNFv7AOuqlA==
X-Google-Smtp-Source: APXvYqyKrZMlHSg/htp/5+30XIfFhh5aJwM5uacnmK48s3KUO/TfzxUThJS8Jhao+rZrzsLIALqGhQ==
X-Received: by 2002:a7b:c14d:: with SMTP id z13mr4597867wmi.71.1582299379163; 
 Fri, 21 Feb 2020 07:36:19 -0800 (PST)
Received: from localhost.localdomain (cag06-3-82-243-161-21.fbx.proxad.net.
 [82.243.161.21])
 by smtp.googlemail.com with ESMTPSA id z25sm4198782wmf.14.2020.02.21.07.36.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Feb 2020 07:36:18 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>
Subject: [PATCH v2 3/3] ASoC: meson: axg-card: add toacodec support
Date: Fri, 21 Feb 2020 16:36:07 +0100
Message-Id: <20200221153607.1585499-4-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200221153607.1585499-1-jbrunet@baylibre.com>
References: <20200221153607.1585499-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-Patchwork-Bot: notify
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Kevin Hilman <khilman@baylibre.com>, linux-kernel@vger.kernel.org,
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

Make sure the axg audio card driver recognise the dai_link as a
codec-to-codec link if the cpu dai is the internal dac glue.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 sound/soc/meson/axg-card.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/sound/soc/meson/axg-card.c b/sound/soc/meson/axg-card.c
index 372dc696cc8e..48651631bdcf 100644
--- a/sound/soc/meson/axg-card.c
+++ b/sound/soc/meson/axg-card.c
@@ -303,7 +303,8 @@ static int axg_card_cpu_is_tdm_iface(struct device_node *np)
 
 static int axg_card_cpu_is_codec(struct device_node *np)
 {
-	return of_device_is_compatible(np, DT_PREFIX "g12a-tohdmitx");
+	return of_device_is_compatible(np, DT_PREFIX "g12a-tohdmitx") ||
+		of_device_is_compatible(np, DT_PREFIX "g12a-toacodec");
 }
 
 static int axg_card_add_link(struct snd_soc_card *card, struct device_node *np,
-- 
2.24.1

