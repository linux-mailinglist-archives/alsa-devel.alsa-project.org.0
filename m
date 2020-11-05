Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AC46E2A91B2
	for <lists+alsa-devel@lfdr.de>; Fri,  6 Nov 2020 09:45:01 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 60A1B1684;
	Fri,  6 Nov 2020 09:44:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 60A1B1684
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1604652300;
	bh=aIZy8Dz8WMqvrRPLq52p+kdXbwyNI/P1MWUP2Me0z6A=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=AxRnqoRPNmGY0/qNAz5tSKHdCqU0LlcdF0W+m49ZJAT+HtR+4YY5/C4IFBRwco/PY
	 aSZ38K/65hOUWlwlpANfPhMcNre0Sx9ndHonclK7C04YbHoSPfBngBrSewFPTpU9mg
	 WZlLfEzLpLJFoN9fbHt/LZLvWgXcnDM14w75/gRg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F1146F80276;
	Fri,  6 Nov 2020 09:43:17 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AF70FF80234; Thu,  5 Nov 2020 02:33:04 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 11B9FF800EC
 for <alsa-devel@alsa-project.org>; Thu,  5 Nov 2020 02:33:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 11B9FF800EC
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key)
 header.d=huaqin-corp-partner-google-com.20150623.gappssmtp.com
 header.i=@huaqin-corp-partner-google-com.20150623.gappssmtp.com
 header.b="sRMq/6pR"
Received: by mail-pf1-x441.google.com with SMTP id 10so47369pfp.5
 for <alsa-devel@alsa-project.org>; Wed, 04 Nov 2020 17:33:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=huaqin-corp-partner-google-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=y0j9x45cLRoZVnhsYpBXznSc0k/ZEdmj0hZUG9WZK3c=;
 b=sRMq/6pRIjsGno2xF8BFoX6qKBEzutyY/leovEnjFwgN85hCrsDhi5qDnw5Wmbrh0t
 6nbgOo1T3L8pHfzb+S+YGWohPszN0OAC6WwnNvF+olKDjOKFG8XzauJNWxv1R+jMjlta
 /TE7B6NXftrK4Db36vt8YYHCBIdLVPOkOARfu8Korec6UJqAl6eU3nF6exzw5mCWtJkw
 qz2Le4uhudzdx7OnTUwLAaZzPZMJ+URi6Vbjcb8Bbmook6opQ+TRj+eMAixstH97GpWI
 zToCgQyuYqbylGjLyQL4QwU+dwcwUMmJI5TDwCnjGmsPTzwi/7nbQm9W4kY0QGn5KTmp
 +hRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=y0j9x45cLRoZVnhsYpBXznSc0k/ZEdmj0hZUG9WZK3c=;
 b=HTqpNjcPV3nMfDKMcK8ZqVFgoCamYJJmBzpWsSmU9sFg3LXWta/LnDFkgAb76wccqS
 9Lb1zwF6Rm+J52xaCtI4QHaqIHaGqt52NC93Hxo0iEBf8+Amqj6Ym0H1eONTy6I1HWF0
 NiIuXBksmb1pukk/2h/Hb1ELcYyTMwUHWmMEHCPvN4mLkiRq4UrZwqWCIo5JoXwQJBjw
 fRIFH+jBpEwNXSKY+k1vH2sKvlzMtvgy9rkFnhEYrqGMQAYQKCCSnEPPMAdDexvzIYap
 M3EDp/lyYIp/+4HP9iD25rQB1l7fHV0N3iW9d4U7rQcKBgajeyI2WER8nq67DX9R+wCM
 bnQw==
X-Gm-Message-State: AOAM530OeD/qW4sY8mQ6J0HSc5NmkxjhjoI51RoOgULXAUNGIzBodUw9
 twqCyxpPLJtADyOpK6YBVFej
X-Google-Smtp-Source: ABdhPJy6gSH82vUf24cqhPHpUGiFqpM1OSKMNUyQ2UfoTdKnRMHgEwTpcaFQ3kwG93vicyAwnc0cWQ==
X-Received: by 2002:a63:6647:: with SMTP id a68mr142209pgc.7.1604539979103;
 Wed, 04 Nov 2020 17:32:59 -0800 (PST)
Received: from xuyuqing-ZenBook-UX425JA-UX425JA.huaqin.com ([101.78.151.194])
 by smtp.gmail.com with ESMTPSA id
 m13sm127817pjr.30.2020.11.04.17.32.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Nov 2020 17:32:58 -0800 (PST)
From: xuyuqing <xuyuqing@huaqin.corp-partner.google.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v1 1/2] ASoC: google: dt-bindings: add new compatible for
 sc7180-coachz
Date: Thu,  5 Nov 2020 09:32:41 +0800
Message-Id: <20201105013242.298518-2-xuyuqing@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201105013242.298518-1-xuyuqing@huaqin.corp-partner.google.com>
References: <20201105013242.298518-1-xuyuqing@huaqin.corp-partner.google.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 06 Nov 2020 09:43:14 +0100
Cc: Taniya Das <tdas@codeaurora.org>, alsa-devel@alsa-project.org,
 Banajit Goswami <bgoswami@codeaurora.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Rohit kumar <rohitkr@codeaurora.org>, cychiang@chromium.org,
 Patrick Lai <plai@codeaurora.org>, Andy Gross <agross@kernel.org>,
 dgreid@chromium.org, zhouguohui@huaqin.corp-partner.google.com,
 devicetree@vger.kernel.org, tzungbi@chromium.org,
 Stephan Gerhold <stephan@gerhold.net>, linux-arm-msm@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>,
 linux-arm-kernel@lists.infradead.org, dianders@chromium.org,
 Takashi Iwai <tiwai@suse.com>, xuyuqing@huaqin.corp-partner.google.com,
 Mark Brown <broonie@kernel.org>,
 Srini Kandagatla <srinivas.kandagatla@linaro.org>, judyhsiao@chromium.org
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

Add devicetree bindings for coachz in documentation file

Signed-off-by: xuyuqing <xuyuqing@huaqin.corp-partner.google.com>
---
 .../devicetree/bindings/sound/google,sc7180-trogdor.yaml      | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/sound/google,sc7180-trogdor.yaml b/Documentation/devicetree/bindings/sound/google,sc7180-trogdor.yaml
index efc34689d6b5..5857b3464e51 100644
--- a/Documentation/devicetree/bindings/sound/google,sc7180-trogdor.yaml
+++ b/Documentation/devicetree/bindings/sound/google,sc7180-trogdor.yaml
@@ -15,7 +15,9 @@ description:
 
 properties:
   compatible:
-    const: google,sc7180-trogdor
+    enum:
+      - google,sc7180-trogdor
+      - google,sc7180-coachz
 
   audio-routing:
     $ref: /schemas/types.yaml#/definitions/non-unique-string-array
-- 
2.25.1

