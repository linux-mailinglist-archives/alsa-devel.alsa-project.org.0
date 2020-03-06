Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ADE917BE82
	for <lists+alsa-devel@lfdr.de>; Fri,  6 Mar 2020 14:30:46 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9EB3B1655;
	Fri,  6 Mar 2020 14:29:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9EB3B1655
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1583501445;
	bh=J6WMWhCjEjNEVqShoOWEGpHj7yF5pxDwUtfxfL11d3g=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=SxXz1G5z8pc+TYQMyljxxf2NaQo9LFMxA35hUtE8YBB9R3Uoa9BE9iPar2rjUoTep
	 y1ucV6C9n1OPQN2SoqW7nCa4CAD7/0styvO7HvnLu0mQQH3jft50jKP+ooADaVPppl
	 SmGFPrR+rgYPUWinpqAPaYcZkW/0jPRXtYo1jUXo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id ACBDDF80232;
	Fri,  6 Mar 2020 14:28:21 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B5EDBF801F5; Fri,  6 Mar 2020 14:28:16 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AC97FF8012D
 for <alsa-devel@alsa-project.org>; Fri,  6 Mar 2020 14:28:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AC97FF8012D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="u3e/2zoI"
Received: by mail-wr1-x443.google.com with SMTP id v11so2338938wrm.9
 for <alsa-devel@alsa-project.org>; Fri, 06 Mar 2020 05:28:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=s/SQlldbFSrcIJZeNdEsclD6jLNPj7ywOopnzdmGSlU=;
 b=u3e/2zoIl7mhZ3lQbVX5KBbT43kddGGfuCa7C28fLEjTPyz9pVH/wUFwT7+yTYy+vO
 sHmwmtkFfurb0BNw9LG1iQMVPMaI7pGbbaHPNqgZP9XekedDqeJ1H80iBE46zvsYr8A1
 3QCviLp59OCUSLHvQ2voHogs/u8ujsPewIujnP/CNtO6N/GWtztHBnpVNDwgwIqFkoWR
 edSKhlHP7xGS6j2jgROcopWlk2Ro8aej6MK7GKp70AgsyOk1u+KVK+3ycoILhNiQS9ue
 Pyp82fFJjj/pNR08moPIziLgsCHajEUvHnaO5lYjpq1xg2xIvJ+t5E+bKt46Tx9uI8d1
 VWLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=s/SQlldbFSrcIJZeNdEsclD6jLNPj7ywOopnzdmGSlU=;
 b=SBPEKQXPTRz4dboOmjwHUPktEzm55y8vY5nJAMk6kvaDmvycJOX+sxrvHb15h1ObzO
 pl8kTuozXcCOoHib3JyVjHSSH+A0Q4U+YzW2hSgKnqZ1lS7bj3nBWQwmueK2q4DLPtyg
 ZFVswdYAevRQZyfdlpFmPTS70rtNJ80cwLmekRoNJ5dETCiMRzKTrGF4D0zeWy4C+qIz
 fU1FW8ng4GtHanJ2S2R9ozeUtQUAKKPzgSi4bhS/ayNC/kLGP7h15hl1OoKdpb4n1+EF
 igZT1v+3uk8aJc6uHPdtfgqLfW8duTfy1At4jzH6brp0SvNr345aw5f4G3z4IXkYep13
 kuLA==
X-Gm-Message-State: ANhLgQ2lxyIacUvhQKTmiLwlZeuDdU5HfyNGILQqRr4HZ3jjuv7Xi3Xu
 A1fjNgoCMG25XKw4L9mUVuDunA==
X-Google-Smtp-Source: ADFU+vunxoHABI8TriMiol6gqaAZ/kpe93uiKeKsgXKfcON7DsYPrts1EuNrkty/P9eOmwfq9Ndi1Q==
X-Received: by 2002:a05:6000:189:: with SMTP id
 p9mr4094777wrx.391.1583501292341; 
 Fri, 06 Mar 2020 05:28:12 -0800 (PST)
Received: from srini-hackbox.lan
 (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
 by smtp.gmail.com with ESMTPSA id t1sm53349237wrs.41.2020.03.06.05.28.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Mar 2020 05:28:11 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org
Subject: [PATCH 1/2] ASoC: wcd934x: fix High Accuracy Buck enable
Date: Fri,  6 Mar 2020 13:28:05 +0000
Message-Id: <20200306132806.19684-2-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20200306132806.19684-1-srinivas.kandagatla@linaro.org>
References: <20200306132806.19684-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, lgirdwood@gmail.com
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

High Accuracy buck is not applicable when we use RCO Band Gap source,
so move it back to correct place.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 sound/soc/codecs/wcd934x.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/sound/soc/codecs/wcd934x.c b/sound/soc/codecs/wcd934x.c
index aefaadfba8a1..83d643a07775 100644
--- a/sound/soc/codecs/wcd934x.c
+++ b/sound/soc/codecs/wcd934x.c
@@ -1202,11 +1202,6 @@ static int wcd934x_set_sido_input_src(struct wcd934x_codec *wcd, int sido_src)
 		regmap_update_bits(wcd->regmap, WCD934X_ANA_RCO,
 				   WCD934X_ANA_RCO_BG_EN_MASK, 0);
 		usleep_range(100, 110);
-	} else if (sido_src == SIDO_SOURCE_RCO_BG) {
-		regmap_update_bits(wcd->regmap, WCD934X_ANA_RCO,
-				   WCD934X_ANA_RCO_BG_EN_MASK,
-				   WCD934X_ANA_RCO_BG_ENABLE);
-		usleep_range(100, 110);
 		regmap_update_bits(wcd->regmap, WCD934X_ANA_BUCK_CTL,
 				   WCD934X_ANA_BUCK_PRE_EN1_MASK,
 				   WCD934X_ANA_BUCK_PRE_EN1_ENABLE);
@@ -1219,6 +1214,11 @@ static int wcd934x_set_sido_input_src(struct wcd934x_codec *wcd, int sido_src)
 				   WCD934X_ANA_BUCK_HI_ACCU_EN_MASK,
 				   WCD934X_ANA_BUCK_HI_ACCU_ENABLE);
 		usleep_range(100, 110);
+	} else if (sido_src == SIDO_SOURCE_RCO_BG) {
+		regmap_update_bits(wcd->regmap, WCD934X_ANA_RCO,
+				   WCD934X_ANA_RCO_BG_EN_MASK,
+				   WCD934X_ANA_RCO_BG_ENABLE);
+		usleep_range(100, 110);
 	}
 	wcd->sido_input_src = sido_src;
 
-- 
2.21.0

