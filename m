Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 939B710440B
	for <lists+alsa-devel@lfdr.de>; Wed, 20 Nov 2019 20:14:35 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DA0BC1756;
	Wed, 20 Nov 2019 20:13:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DA0BC1756
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1574277274;
	bh=ahdep5rvEZBYmyn6JNKqo4DendtsZvU0GRrxlMHXjFM=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=XJtu9zxBMlq0fqR1nnxJIbBDg3XVEPD7v9hyvh7Qjt53x8ouzIVGgnbL5tBfpE7Kr
	 AaxGSDOYxdFMKFlkgVwz0JNQSyr+8ssFGj1ZFL83Qk/EHfk7Q/Q84XtCZcTQQAWapU
	 3x7JZz4ew0evqwWCQteW9Up9iaZ5L7bxPxLQFiJ0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 095A5F8013E;
	Wed, 20 Nov 2019 20:12:51 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 69023F8013D; Wed, 20 Nov 2019 20:12:48 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 87700F800C1
 for <alsa-devel@alsa-project.org>; Wed, 20 Nov 2019 20:12:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 87700F800C1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="vbKUuFnp"
Received: by mail-pl1-x643.google.com with SMTP id f9so216719plr.7
 for <alsa-devel@alsa-project.org>; Wed, 20 Nov 2019 11:12:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=J89rFEpX2bcn4MT2rPqMISIns9zkUW3SAqfx6stcmDY=;
 b=vbKUuFnpjfJvhuUKKja6vHEpvk/MObeRe3IhQevXbNqezXzUbsV0cVX4hw7adTt+LM
 QTvOp/vQ20lVAv3n+DrS6ZZpNgbv1Y6RIm9hAqfu6j1l01m+87zvrB8Tg6/6EEkNHXet
 POwLlYM+ptX+E3pk4NPK1v9PNeg7D1lcml9m6svRjLG243bG1N9C8eJm+RTAuFDWYyIH
 Yex95Vf1x5B0/3ot1YSx+57pmpPM03Ntu+L8MJRoCrqq5jydnxgt22PLU6QwCJGEmzMc
 t/7E+2XkFkM8xENO5PgYzoTZ+1mvi9jC2rLHSQCbxJJRQU6PQldJlLOg44gstt/uQFNI
 SW5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=J89rFEpX2bcn4MT2rPqMISIns9zkUW3SAqfx6stcmDY=;
 b=STJATZ2OI4lh7Z3zas5RgcRKXFDRp1pQxBvDFJ/ERgDe4+kGqntOtVEIzYIeUQyjL3
 gYtsJTfdi6cuKF9DEOFDT+c1VgdFArLBrBXP2X99a8ybj6ceJ+FxLYcTjZuPxu6FCorr
 na4Rt7qCvhR33cNF7SrQCrzHZ7j1BITZuNFXGsDl68UngdTwBOIkLIm8DaNZG07t0ObF
 /0sT6Em0GpDJwhb71g0oeVIkVoJy6AKRVgda7Y/wky6FUAROF9hh+dGaEVDFn4R1qBwA
 1mRmLQiVDO8cu3i4IQohF2pmIZeGETDQwGCOcSzRGudzhjMnvcrZQyp01USl6K2f+iD5
 ob2w==
X-Gm-Message-State: APjAAAVdvO8FqP0eX2DuSz7nrHiFyjxxRl9eMgyfiut5aRlCtZVOPTq/
 IpubOqWI5sD0/kDLSHPq2oQgyZPlcIM=
X-Google-Smtp-Source: APXvYqx6ToveC8vMvJEIUJZIaEYGHMUI5soASX6ocwFi7Mrc2xfaH6mjYyGdWNEB/BOYZM7VUsXG0g==
X-Received: by 2002:a17:902:690a:: with SMTP id
 j10mr4547778plk.67.1574277162652; 
 Wed, 20 Nov 2019 11:12:42 -0800 (PST)
Received: from mangix-trapnet.lan ([69.42.0.214])
 by smtp.gmail.com with ESMTPSA id y1sm120495pfq.138.2019.11.20.11.12.41
 for <alsa-devel@alsa-project.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Nov 2019 11:12:41 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: alsa-devel@alsa-project.org
Date: Wed, 20 Nov 2019 11:12:40 -0800
Message-Id: <20191120191240.260130-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Subject: [alsa-devel] [PATCHv2] aplay: Limit VUMeter progress bar to 100 for
	negative as well
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

While the progress bar cannot be negative, GCC concludes that it can be
and assumes tmp can be written past the end. Fixes this GCC warning:

aplay.c:1747:18: warning: '%02d' directive writing between 2 and 11 bytes
 into a region of size 4 [-Wformat-overflow=]
 1747 |    sprintf(tmp, "%02d%%", maxperc[c]);

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 v2: Reworded
 aplay/aplay.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/aplay/aplay.c b/aplay/aplay.c
index 78adee2..1a887e4 100644
--- a/aplay/aplay.c
+++ b/aplay/aplay.c
@@ -54,6 +54,8 @@
 #include "formats.h"
 #include "version.h"
 
+#define ABS(a)  (a) < 0 ? -(a) : (a)
+
 #ifdef SND_CHMAP_API_VERSION
 #define CONFIG_SUPPORT_CHMAP	1
 #endif
@@ -1741,7 +1743,7 @@ static void print_vu_meter_stereo(int *perc, int *maxperc)
 			line[bar_length + 6 + 1 + p] = '+';
 		else
 			line[bar_length - p - 1] = '+';
-		if (maxperc[c] > 99)
+		if (ABS(maxperc[c]) > 99)
 			sprintf(tmp, "MAX");
 		else
 			sprintf(tmp, "%02d%%", maxperc[c]);
-- 
2.23.0

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
