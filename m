Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AC6CF1ADA40
	for <lists+alsa-devel@lfdr.de>; Fri, 17 Apr 2020 11:41:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 444381688;
	Fri, 17 Apr 2020 11:40:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 444381688
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1587116498;
	bh=CozJzqObR4ZMQYz5OtALhVg6I2Gs00Yp2ed0ncFR734=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=MOsonf6CcauWvzEbIiSnsFrr4GJLWsnDtZYEoZHw6Qh1rfUeF3YjJaW9CO5djc+T3
	 JALuUjQQWkq8r+Hn/PJkNqWDRNyVyzdF5F4oXblRd/HJfduLxvr8TrjbnHDN8dijqd
	 ayCm0U/w1nZehWMD0L/vVaRgZUuBhK9XZ3FTA2TI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A767BF80268;
	Fri, 17 Apr 2020 11:39:29 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EDF23F80266; Fri, 17 Apr 2020 11:39:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A7CB1F8012E
 for <alsa-devel@alsa-project.org>; Fri, 17 Apr 2020 11:39:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A7CB1F8012E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="JbqKbSdc"
Received: by mail-wm1-x343.google.com with SMTP id e26so2239309wmk.5
 for <alsa-devel@alsa-project.org>; Fri, 17 Apr 2020 02:39:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=sNSs/WMMs8v8LjUrmuY7lbgWrm5/KMfPWOpJUMEIGMY=;
 b=JbqKbSdcMZexzofzc9Tq5ioiUHPtcqHNoP80MWNiHMvtWkRfplPiXtpRt7drnCbcN9
 rKjiG756xPwfC6l1JaF/NFRdW+2kWQDPFrX1OwBZQauIi4x+sy2x4Dqc1HoNBgJSLgYX
 eIijShSPioui6pcAky8KsSWFNu51TS5FZaBjH/4MNOVs4Tc6tuDvMflchE+v/bev1YAT
 6NMfglbEG9f47JiuYUo2Dgz/WCeNpjdIhdUme0OZgQ3WbR0tdI5gmZ+9Zy4845YvNPmG
 FW48wgsMsMaXEbZu8WmM3LcdW8DjOmE8GNwx+HMk/5H2b6lH7qF969czt/QGWjVvFXGy
 XFeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=sNSs/WMMs8v8LjUrmuY7lbgWrm5/KMfPWOpJUMEIGMY=;
 b=rwMlgWO2BAeikLCq1OphYXwKB7QsJZASR+Ig8VKwqYH3CV6uMQQAvmSyNJBYrDEjws
 AnE6eUXBatci7DAXPCv6hvvQOmX9uA8dB3SpZr4nZKdoDyqEu9zA0SirFZUVevlcTRcG
 xM52G7y6szI/UZw7E92lNPe/Xm1OFALw+zSnh72wR9LyfgqbAwRaHUVaPwp779gz6UQk
 5vJF2HMiuRutdSBRj2Oh/w0AXKKk25IGEICHbcZ9zylMF9B5sG9UREGyNKUFROYL0DEw
 j/Geozm/eQEsRmwOEvx+qOWil2+JkiEEwzmiQ3fxWoZiOSU3dN355h3USpcCNSypn6x0
 E5Jw==
X-Gm-Message-State: AGi0PubD5NwrD7TCo8ox3D7zmJYPLCM6seqIG7jk6P0fLuHSb9tGHFU6
 R097gtV8bDgpOWm+rYuosQl5GA==
X-Google-Smtp-Source: APiQypLjCDr+lHOQd9iORXNvwi4wAxPgeC5qmc2MlHGFNNmFnbrdDVk1ilQZTEUF+aK84deHja4gzg==
X-Received: by 2002:a1c:1b88:: with SMTP id b130mr2417599wmb.75.1587116357734; 
 Fri, 17 Apr 2020 02:39:17 -0700 (PDT)
Received: from srini-hackbox.lan
 (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
 by smtp.gmail.com with ESMTPSA id y18sm7719884wmc.45.2020.04.17.02.39.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Apr 2020 02:39:16 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: srini@kernel.org,
	gregkh@linuxfoundation.org
Subject: [PATCH] slimbus: ngd: remove redundant assignment
Date: Fri, 17 Apr 2020 10:39:14 +0100
Message-Id: <20200417093914.22052-1-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
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

remove redundant assignment, as this is already done fewlines lines before.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 drivers/slimbus/qcom-ngd-ctrl.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/slimbus/qcom-ngd-ctrl.c b/drivers/slimbus/qcom-ngd-ctrl.c
index 7426b5884218..743ee7b4e63f 100644
--- a/drivers/slimbus/qcom-ngd-ctrl.c
+++ b/drivers/slimbus/qcom-ngd-ctrl.c
@@ -1365,7 +1365,6 @@ static int of_qcom_slim_ngd_register(struct device *parent,
 		platform_device_add(ngd->pdev);
 		ngd->base = ctrl->base + ngd->id * data->offset +
 					(ngd->id - 1) * data->size;
-		ctrl->ngd = ngd;
 
 		return 0;
 	}
-- 
2.21.0

