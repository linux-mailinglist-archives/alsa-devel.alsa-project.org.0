Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 457B033285D
	for <lists+alsa-devel@lfdr.de>; Tue,  9 Mar 2021 15:18:47 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D508D1820;
	Tue,  9 Mar 2021 15:17:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D508D1820
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1615299526;
	bh=XQcksOAEpy8X3ANG5p1B6t1Qhdc/uWnALrlHOgaf2sY=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qEK3nvhUSPqGM5cuQYFMgAzrouI7hH0WLR5ynp6GEtCnFrlfF0TDnF3LKfQ2LLsLs
	 4YmIhk0NJHYs7fVjrNXbhda2jDle9ENnG0/1lgwONrAeQhWaVGdKKg/EjXME7TQAxb
	 ADLuOFKlfNMTH7MvuzdI2fYgVTSUOQa2eb2mHjgI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1A3BCF8028B;
	Tue,  9 Mar 2021 15:15:51 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4DC68F8032B; Tue,  9 Mar 2021 15:15:46 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6BED5F80166
 for <alsa-devel@alsa-project.org>; Tue,  9 Mar 2021 15:15:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6BED5F80166
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="RiA6ZyC1"
Received: by mail-wr1-x434.google.com with SMTP id a18so15851969wrc.13
 for <alsa-devel@alsa-project.org>; Tue, 09 Mar 2021 06:15:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5k92QxyrxRTJi0W/7xlk/UVOaJACzUsOHFwPLvqgR18=;
 b=RiA6ZyC1Ou9XpUVI0ItDLdRO6zud+MChTC+o6ira9EZ0LBKCxLcd8dACvfFCXex9xG
 p9fGwmwAdu/qM0fLG5hU2OZBg4MfZbWN73bTzYkYRS30+4biIrxv4hCR8cCmxo8lzhrb
 bYVcrdHfDEwi/XU/nMoe5UUQwgnui//jQX5bUPQ8Etcwz7hjAFy1mA1E/nlEy7PUm+39
 qLyqPwaB+iPP8IqhopbnW5deD1QMEGHEKPxbMKDL1EkHzi+ILkcE7r1xx71+MucFMxKl
 EQQnAL4Ef0A3fFDmI5bLlCm8mcKv7KhFev83MLpVMYV0BYT42XI+CD5MhUKDwNUX5qph
 5BDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5k92QxyrxRTJi0W/7xlk/UVOaJACzUsOHFwPLvqgR18=;
 b=S7CA6gNRTWfnAsvM7/Fd/r7JtpCG8GkGR31PUNO6n867d86oFyErUWumPhbx4dYgzD
 axKOIqaw2N6uBbGq6Ea4A6nUpDdXVoH1olF2V5V3QjtXg1KFp8vezH83kmtzjvRex0Gg
 tWXAis/inLMljXQMzWy37gt4QQkvifw5hdlk9tKToX3SZXB4f+PaZ0z/vhwUsZgba4lc
 3k4DkPM/TaAnQ1BkMPVFZrLrp2V8sAtWp7aFOwz1F5Zclm1ubNB/LdX8rpPMrkEUYQKc
 GeHuoXEYLhZKwh9CmbtEovIfonreh3xz+1qA+PrmP4sBext8Il5zaHHDhIS6yKvlg077
 xyhg==
X-Gm-Message-State: AOAM531AiAdz+b+LXKf3/vQqsj9kitOUNvingW0HrC1X2qpe5QoxG57w
 /0vyTTIJFmedbfO3rgOTZNnuHw==
X-Google-Smtp-Source: ABdhPJwGF/B0sdM18GQqLgu4EoQINoJ2w3HS1vWklHTY5soJkWA4Wynb1oR2mypHaFivw90hQvPoJw==
X-Received: by 2002:a5d:43cc:: with SMTP id v12mr28316085wrr.287.1615299337598; 
 Tue, 09 Mar 2021 06:15:37 -0800 (PST)
Received: from srini-hackbox.lan
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.gmail.com with ESMTPSA id u20sm28007579wru.6.2021.03.09.06.15.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Mar 2021 06:15:37 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org,
	vkoul@kernel.org
Subject: [PATCH v2 5/5] ASoC: codecs: wsa881x: add static port map support
Date: Tue,  9 Mar 2021 14:15:14 +0000
Message-Id: <20210309141514.24744-6-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20210309141514.24744-1-srinivas.kandagatla@linaro.org>
References: <20210309141514.24744-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: robh@kernel.org, alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 pierre-louis.bossart@linux.intel.com, linux-kernel@vger.kernel.org,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, sanyog.r.kale@intel.com,
 yung-chuan.liao@linux.intel.com
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

Two instances of WSA881x(Speaker Right, Speaker Left) ports
are statically mapped to master ports. Allow the driver to parse
those mappings from device tree.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 sound/soc/codecs/wsa881x.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/sound/soc/codecs/wsa881x.c b/sound/soc/codecs/wsa881x.c
index db87e07b11c9..f7b6bbd62728 100644
--- a/sound/soc/codecs/wsa881x.c
+++ b/sound/soc/codecs/wsa881x.c
@@ -1105,6 +1105,11 @@ static int wsa881x_probe(struct sdw_slave *pdev,
 		return PTR_ERR(wsa881x->sd_n);
 	}
 
+	if (of_property_read_u32_array(dev->of_node, "qcom,port-mapping",
+				       pdev->m_port_map,
+				       WSA881X_MAX_SWR_PORTS))
+		dev_info(dev, "Static Port mapping not specified\n");
+
 	dev_set_drvdata(&pdev->dev, wsa881x);
 	wsa881x->slave = pdev;
 	wsa881x->dev = &pdev->dev;
-- 
2.21.0

