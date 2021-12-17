Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E5CDB478700
	for <lists+alsa-devel@lfdr.de>; Fri, 17 Dec 2021 10:24:01 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7377F1EDB;
	Fri, 17 Dec 2021 10:23:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7377F1EDB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1639733041;
	bh=ZajTcXDH29qJBRte/fBttLYqdSvc2vz/HTKSKI3JPeQ=;
	h=Date:To:From:Subject:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=ilnnzyHCbP1Qv2UHPSHOOP3GR4nKIz96McyTek+xjIHmnQM7rclKR1iG7dggGbZ/d
	 +2YARz9NxNFOjwLio8+J1LgSDt3ctze0BVjlm3ysLZ6PKixkq+SjABtjGGTCnERbKC
	 gPuoeJiatZvZBMzhExAvXwgWyjeP2Svioo0OaucA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C9E9EF80143;
	Fri, 17 Dec 2021 10:22:53 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C246FF8014D; Fri, 17 Dec 2021 10:22:52 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5D593F80143
 for <alsa-devel@alsa-project.org>; Fri, 17 Dec 2021 10:22:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5D593F80143
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="qgTrlB6Q"
Received: by mail-wr1-x433.google.com with SMTP id i22so2740782wrb.13
 for <alsa-devel@alsa-project.org>; Fri, 17 Dec 2021 01:22:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:content-language:to:cc:from
 :subject:content-transfer-encoding;
 bh=uk6bh3LV1Aa0Iz/w9hKzE6HktJRsa8N+U8GREciWxuM=;
 b=qgTrlB6QcaClKEx7w5youQ0Dhh3+lVwqdsJo26GEY0V734MFuTEPPo/+4s2L5f1OnQ
 fwp/R44gpwS0WvJToBrO7evogfiA2xnBJoLaUN2rY0PbINNyQTu8tIgJZqn/iDbbV0y7
 SY843Nvn1d/hxhK8KdH+OcGlMtMCodCk9vXSm6OCJOTL2gpzY3XMdrNdZIj3cSXLNGOX
 DIELRbzzjQF/8R/7T63nA1i+VKrJ7tjWeojG/sAj44JwL6dPQczkikaabuvpJGpqdsBq
 Gq7oWt+5HDswRoGAPfvcD2F8+PwoBijgQmB/s3xQa9IloGvw3Fu4bdM7uslqG8WBM75v
 RZfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent
 :content-language:to:cc:from:subject:content-transfer-encoding;
 bh=uk6bh3LV1Aa0Iz/w9hKzE6HktJRsa8N+U8GREciWxuM=;
 b=P61ucuiI311ozeVKxHPISh4YtnfG3dIX2ARekI//8sXco7e2tBdHc7l5Z/wSid6moe
 HNrkwtrW3QCh5z5n53SXKzh1iuHy+meLPM6DxAmXbKr6VvYPXrtdL4ENlD7mHqKbBI9t
 t7+B4aTNd5MvQB5AQkQhVshVkz4jOcSo3p0E8KvdO02tC4fcC/C/fXB5GlCUSkqtHfxr
 /tNMTt2PA9vsxqLMZRnq2YFvyuxBD3i+Onw4+o/olFefwL/SEklLZsQQjGTtA22/l3xY
 LXnTE8slU3ZduAVtBYm33/QujYsfuuKqHBdMOjn4OZYjQbkcS4YMxGIjA1kUig01e6wC
 R0zA==
X-Gm-Message-State: AOAM531bPXkXwfbqWw1h63W2DA3I6i50Aj5yS/GLtl3H/Ts4wErczl2/
 dRcpbHIWTGnR/WwZDMInyPKrkeHlYaA=
X-Google-Smtp-Source: ABdhPJwObIMH0hF0FMQ9iHZXLosJ5uFyuiMmC5uzUc156UibszsZCmzSPYUcBGPzCUb/1ZcOnxx7Mw==
X-Received: by 2002:adf:9f03:: with SMTP id l3mr1736756wrf.378.1639732967365; 
 Fri, 17 Dec 2021 01:22:47 -0800 (PST)
Received: from ?IPV6:2003:ea:8f24:fd00:5c04:3253:ca5d:176d?
 (p200300ea8f24fd005c043253ca5d176d.dip0.t-ipconnect.de.
 [2003:ea:8f24:fd00:5c04:3253:ca5d:176d])
 by smtp.googlemail.com with ESMTPSA id p8sm6644658wrx.25.2021.12.17.01.22.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Dec 2021 01:22:47 -0800 (PST)
Message-ID: <9fed506d-b780-55cd-45a4-9bd2407c910f@gmail.com>
Date: Fri, 17 Dec 2021 10:22:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Content-Language: en-US
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
From: Heiner Kallweit <hkallweit1@gmail.com>
Subject: [PATCH] ASoC: sh: rz-ssi: Check return value of
 pm_runtime_resume_and_get()
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org
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

The return value of pm_runtime_resume_and_get() needs to be checked to
avoid a usage count imbalance in the error case. This fix is basically
the same as 92c959bae2e5 ("reset: renesas: Fix Runtime PM usage"),
and the last step before pm_runtime_resume_and_get() can be annotated
as __must_check.

Fixes: 03e786bd4341 ("ASoC: sh: Add RZ/G2L SSIF-2 driver")
Cc: stable@vger.kernel.org
Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 sound/soc/sh/rz-ssi.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/sound/soc/sh/rz-ssi.c b/sound/soc/sh/rz-ssi.c
index fa0cc08f7..850387dd8 100644
--- a/sound/soc/sh/rz-ssi.c
+++ b/sound/soc/sh/rz-ssi.c
@@ -1020,7 +1020,12 @@ static int rz_ssi_probe(struct platform_device *pdev)
 
 	reset_control_deassert(ssi->rstc);
 	pm_runtime_enable(&pdev->dev);
-	pm_runtime_resume_and_get(&pdev->dev);
+	ret = pm_runtime_resume_and_get(&pdev->dev);
+	if (ret < 0) {
+		pm_runtime_disable(ssi->dev);
+		reset_control_assert(ssi->rstc);
+		return dev_err_probe(ssi->dev, ret, "pm_runtime_resume_and_get failed\n");
+	}
 
 	spin_lock_init(&ssi->lock);
 	dev_set_drvdata(&pdev->dev, ssi);
-- 
2.34.1

