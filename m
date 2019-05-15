Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 004581F57E
	for <lists+alsa-devel@lfdr.de>; Wed, 15 May 2019 15:21:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7C6B316D1;
	Wed, 15 May 2019 15:20:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7C6B316D1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1557926495;
	bh=74qOra9yq2uPYk+vG8p4CglAuVGp7jL+5LhO+oLC4po=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Djpei0PcctAdEUtlFW+iSVnDD5e8DydQjknDdXjB99/cS4WDcKB69aUIrjUh5NtOl
	 ZrYi/IjpTfascfkLHDw3xrAUV2d3Qwjy1Xta7DurT8QEtANR2dQC/xKtpCN7pAfKBW
	 wCqzImVh2hSuVZ6XjdgemkCXBjWfJG184tcbUmw4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4F524F8972B;
	Wed, 15 May 2019 15:19:13 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DEF75F896B8; Wed, 15 May 2019 15:19:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CB52FF89684
 for <alsa-devel@alsa-project.org>; Wed, 15 May 2019 15:19:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CB52FF89684
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com
 header.i=@baylibre-com.20150623.gappssmtp.com header.b="zDGPkuHo"
Received: by mail-wr1-x444.google.com with SMTP id f8so2681731wrt.1
 for <alsa-devel@alsa-project.org>; Wed, 15 May 2019 06:19:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Qs77ALhE/gKtnduPvCRtEn1+XaA68gtG693yCTv90Vk=;
 b=zDGPkuHoA+3szCHGN82vW7BAjTdBaU1OEwV8QGKRxUxlc/CvIbHhm/IJhbrHViITb8
 Msdp/fTbSM4btIYHBKCNaYVZ9n8AnJab4dM4x4ATaPA9r1roYVf93Xdo/bChCE+wWkEF
 cGZtKlUI9OejPiIb8VyEOg8mXy/XHD6YGtjlzYGbKpIsVSJv5wl2PlyVRCqOl5BZHpN/
 wTf4ruJlum1SBBQ948AXlntz0/Js3jMwR6yC+lrrFR/UGBPwf1KNKAnPJwoKaGlMcdUp
 2gKy5rNYaka0c8ojR19pSXOI0kOgsA8uDExnZ4ASqvPi2hzP4gUjXhCDeem7dIDTL5zT
 wvTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Qs77ALhE/gKtnduPvCRtEn1+XaA68gtG693yCTv90Vk=;
 b=SfgYp8AuAUBA0JCA47bHFZgG4ic3iOaPaLlEKffjzxoAyormonwtEAf+aQVv4O5y1C
 j7m+O7ywugYjOk5slArMJsO7Pg4L3AF8ff2WjA1r1MKXo2yKXebXSeeBE4q+h2K4/LxM
 QMvXYZbVakuUdy0q2Fy5uyzQWWUTSbkmq3AtszqwXCn6YBK+6UjsltXWVolw7phCqUSC
 dd0wWshTUyKVQmMFEXpH2ofuUqkaifhgoVfXyPFwrf6TvTBVrJYndAgzD5qyOSd6I6Sp
 syJC77BfTJfPaCCPROQezFMQR91dc286Q2XdXQnzw269pFST5ds3EDi4eFo+45xD0tW0
 DzqQ==
X-Gm-Message-State: APjAAAUPmr2tIe7UvTwa8oK/kCv2F7+gUTPCuUrTDdDaZJ0riLLrt9T/
 SA5A2PxgFIfgbl8V0oElPkmmSw==
X-Google-Smtp-Source: APXvYqzm4ytAil3rojl8lYKukf8vaRhm+kH45f8n+v0RKH14Kw6A7pvAhM/MdQwtVNK4LuJ6xQgZOw==
X-Received: by 2002:adf:b641:: with SMTP id i1mr25792669wre.288.1557926344965; 
 Wed, 15 May 2019 06:19:04 -0700 (PDT)
Received: from boomer.local (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31])
 by smtp.googlemail.com with ESMTPSA id b206sm2789848wmd.28.2019.05.15.06.19.04
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 15 May 2019 06:19:04 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Kevin Hilman <khilman@baylibre.com>
Date: Wed, 15 May 2019 15:18:55 +0200
Message-Id: <20190515131858.32130-3-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190515131858.32130-1-jbrunet@baylibre.com>
References: <20190515131858.32130-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-Patchwork-Bot: notify
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 Jerome Brunet <jbrunet@baylibre.com>
Subject: [alsa-devel] [PATCH 2/5] ASoC: dapm: allow muxes to force a
	disconnect
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

Let soc_dapm_mux_update_power() accept NULL as 'e' enum.

It makes the code a bit more robust and, more importantly, let the calling
mux force a disconnect of the output path if necessary.

This is useful if the dapm elements following the mux must be off
while updating the mux, to avoid glitches or force a (re)configuration.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 sound/soc/soc-dapm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/soc-dapm.c b/sound/soc/soc-dapm.c
index 81a7a12196ff..a4d6c068b545 100644
--- a/sound/soc/soc-dapm.c
+++ b/sound/soc/soc-dapm.c
@@ -2245,7 +2245,7 @@ static int soc_dapm_mux_update_power(struct snd_soc_card *card,
 	dapm_kcontrol_for_each_path(path, kcontrol) {
 		found = 1;
 		/* we now need to match the string in the enum to the path */
-		if (!(strcmp(path->name, e->texts[mux])))
+		if (e && !(strcmp(path->name, e->texts[mux])))
 			connect = true;
 		else
 			connect = false;
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
