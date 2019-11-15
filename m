Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 42385FE384
	for <lists+alsa-devel@lfdr.de>; Fri, 15 Nov 2019 18:00:45 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C68A2167A;
	Fri, 15 Nov 2019 17:59:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C68A2167A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1573837244;
	bh=mLOS4dqXgwHwu49FQbqdu2Ixu6HgeNi6jyGn38ySl9Y=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XzWZ5Doc34sv5QCMBc0jKjq5O1AnayfNhngUUU+siUE5rayG3G1KG8cS66jn7t3Q+
	 5r9l+4d1HuJbzBnWz2qr/FpnAMVaqr+zA1uoMGKexnWnKWU8q+rpCCxXQP5vrvkclh
	 Sggvz8cy4UXI1uLGopDDYqj3MjRAWSmkV7F6QVPk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A84A0F80218;
	Fri, 15 Nov 2019 17:51:33 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 860E7F8013D; Fri, 15 Nov 2019 17:51:13 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com
 [IPv6:2607:f8b0:4864:20::742])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 280F4F800FF
 for <alsa-devel@alsa-project.org>; Fri, 15 Nov 2019 17:51:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 280F4F800FF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="W9lWU6bJ"
Received: by mail-qk1-x742.google.com with SMTP id m4so8596340qke.9
 for <alsa-devel@alsa-project.org>; Fri, 15 Nov 2019 08:51:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0MgTuC5BgKHh8g9okFWnMYj+ryxsdDpMF+psrmOrlpc=;
 b=W9lWU6bJiT0xvZaPdZUCULtlKXJkcF+7t3J9/CdUquDlbCdERiUcQXYjHQIhAPyxNF
 CVwEn8/PWOKMS4+Kdy83JRY9IDPAhc9QZt5xKm+9E26e/yj0Glfw51BjFBkR0fpOPqiD
 naSnUkBDSLtn6S8szFjKIw/Al/TwNrctfHKNnFQ4hgYTBKsdgIPWn2hwtqU0JIwsJn30
 Oxt4GazjXaDq8aXZUKTAKmXnD02FltuNSGSgK6y1mti/4WRkWratwOrgNfvzwuNjxizT
 CX2KHzeEdS+kqSaEzync0eaKpgUH5k3tj+JcGBJ3++J4vwb6cbyG2LyKz7Qa/zVNe/vC
 6F1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0MgTuC5BgKHh8g9okFWnMYj+ryxsdDpMF+psrmOrlpc=;
 b=XTKvLDbDKtu7rCIt2luMy66gbCGtLm/Xa+TJw1SQL9TdVsOJJb7SG/ePOC4TAF1519
 qich8zTGC0UI9q4vtC9yajgwMJAI+uBH+UaR92mHAs2NMycRD5/bXI9zMhYQQ1mYKhdk
 8YVz3dv5A1/XJSV0n1JcMjO1HP1c6SWxcBuLa+bDoacuFvkAyvzpK5Qrer3whu+kuYvY
 gcSaZpHzWnp6nVdWYv+PGbfdfRMaVY9bmc1ymbSM3mLXtEDThFmwrlNb5PHRH3v2NZW2
 oeaPrhms942BEYeG/tAnpdvv7Mh0fvlU+ptxWbgQGryuvo9R4o0Gik8LwbgV8fRjfjth
 jdew==
X-Gm-Message-State: APjAAAX+yw7C+2+BDeCj20Ys3T2Cx5HFnLmVM8Zune7WlCDkeDIm9IZi
 NQEo83edm16dLB5b/mshJ+w=
X-Google-Smtp-Source: APXvYqyeoT309l8spittf8ytRO2+pekLf702hNJ94cEtqBbyi0eY5X9hsZWCSJwEFOpZWmUpYZqJYA==
X-Received: by 2002:a37:9585:: with SMTP id
 x127mr13692046qkd.146.1573836658926; 
 Fri, 15 Nov 2019 08:50:58 -0800 (PST)
Received: from localhost.localdomain ([71.219.59.120])
 by smtp.gmail.com with ESMTPSA id r29sm5610331qtb.63.2019.11.15.08.50.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Nov 2019 08:50:58 -0800 (PST)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org, alsa-devel@alsa-project.org, tiwai@suse.de,
 lukas@wunner.de
Date: Fri, 15 Nov 2019 11:50:30 -0500
Message-Id: <20191115165038.56646-13-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191115165038.56646-1-alexander.deucher@amd.com>
References: <20191115165038.56646-1-alexander.deucher@amd.com>
MIME-Version: 1.0
Cc: Alex Deucher <alexander.deucher@amd.com>, Evan Quan <evan.quan@amd.com>
Subject: [alsa-devel] [PATCH 12/20] drm/amdgpu: add baco support to runtime
	suspend/resume
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

BACO - Bus Active, Chip Off

This adds the necessary support to the runtime suspend
and resume functions to handle boards that support
baco.

Reviewed-by: Evan Quan <evan.quan@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
index d05f8c03e559..7b5437a87b01 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
@@ -1166,7 +1166,8 @@ static int amdgpu_pmops_resume(struct device *dev)
 	struct drm_device *drm_dev = dev_get_drvdata(dev);
 
 	/* GPU comes up enabled by the bios on resume */
-	if (amdgpu_device_supports_boco(drm_dev)) {
+	if (amdgpu_device_supports_boco(drm_dev) ||
+	    amdgpu_device_supports_baco(drm_dev)) {
 		pm_runtime_disable(dev);
 		pm_runtime_set_active(dev);
 		pm_runtime_enable(dev);
@@ -1233,6 +1234,8 @@ static int amdgpu_pmops_runtime_suspend(struct device *dev)
 		else if (!amdgpu_has_atpx_dgpu_power_cntl())
 			pci_set_power_state(pdev, PCI_D3hot);
 		drm_dev->switch_power_state = DRM_SWITCH_POWER_DYNAMIC_OFF;
+	} else if (amdgpu_device_supports_baco(drm_dev)) {
+		amdgpu_device_baco_enter(drm_dev);
 	}
 
 	return 0;
@@ -1258,6 +1261,8 @@ static int amdgpu_pmops_runtime_resume(struct device *dev)
 		if (ret)
 			return ret;
 		pci_set_master(pdev);
+	} else if (amdgpu_device_supports_baco(drm_dev)) {
+		amdgpu_device_baco_exit(drm_dev);
 	}
 	ret = amdgpu_device_resume(drm_dev, false, false);
 	drm_kms_helper_poll_enable(drm_dev);
-- 
2.23.0

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
