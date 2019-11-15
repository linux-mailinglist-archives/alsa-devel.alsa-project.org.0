Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 89D72FE37B
	for <lists+alsa-devel@lfdr.de>; Fri, 15 Nov 2019 17:58:39 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1AFBC1669;
	Fri, 15 Nov 2019 17:57:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1AFBC1669
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1573837119;
	bh=hdxWRnXCNtLmsLzZCpPAad/haJvxjSel0el9CKFrACI=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=lP6vQmVvg41e5d2meMvxje8jDjyBeaOufjZGWzHwXoksszI2VobjW71LC10E4R6S7
	 I2ozJsaIhCG8mo1TDUYtt+NMJ7aAKJjOm4ZeCSGxvOf9aiWiyY0gk2q1ViQHxqIzow
	 fNiALqJySBT3hjx71JMXYOVSXfr3WFInIhTFbhiw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 71EC3F8015F;
	Fri, 15 Nov 2019 17:51:29 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5F7AEF80125; Fri, 15 Nov 2019 17:51:07 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-qv1-xf43.google.com (mail-qv1-xf43.google.com
 [IPv6:2607:f8b0:4864:20::f43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B69C3F8010B
 for <alsa-devel@alsa-project.org>; Fri, 15 Nov 2019 17:50:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B69C3F8010B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="EZaCgRjn"
Received: by mail-qv1-xf43.google.com with SMTP id w11so4012931qvu.13
 for <alsa-devel@alsa-project.org>; Fri, 15 Nov 2019 08:50:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7FGoEDMcY3bsTDzE5n31NNKpbGzTd5lhcWG/27KJrPg=;
 b=EZaCgRjn1F2Vvebsp1g5cmFobbn+Jo7LkyQcR6Z6WX0aSOUHkcrMc3jZA6BZFPzgp8
 s8zUtlQxWHNDiOJWGkcETLoWNxuZ5hZs6+Y1dre+23zv684O8kmgD7XDEXcrP5VTatSb
 paB9XTwgA2AFMkK+9YI70+opSCJ21dqV6VfULAhiSGL/1XQTzhjjpl6BQY+yH+7i8IBn
 oVV5gcdwwaGMfxs1hqcMXDYWnD/gx4qb0c4fxkQD6ntiwlhF/Knj739ZX09E8mjV7TxX
 ZUBBjuEiQz5pUPxSs/cRUupJpcmDG3OhazxxlwDXH7tMr1mY3ItrLfdPHAVhdiyzchhY
 Sccw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7FGoEDMcY3bsTDzE5n31NNKpbGzTd5lhcWG/27KJrPg=;
 b=MkyQBGJe0CEpCtuT+dSKJktJg2mgYpBwDLX/cMyRQusvNmgYHpA6zxp7atNca+/J6P
 Wg/id95UUnBzq+IGKuOUfoEMAu/yECaSC0UlP54HIb767n1yDoCaAEZa13DZCMWNQKvy
 ruy2X9rrWrd4OFzST0DQ7hGoCtps0zo9+55UN3SoWvfc40y41bVohcP39EXrxamGnaev
 RfbjkXPXe/Vv2zxI/JnQL7uvFr5d7r6L8+O+pnsUO+cFKzAcjrr8bjlJoeGe63GeR477
 FGrMzL3nKZHPlvDguz9P3pIl2B+4hNp6GoYhm3GumbQUkM/v6QG+lykJohypPIZCQME2
 rZUQ==
X-Gm-Message-State: APjAAAUDsxfGmF1GAMP7V1L72LLtwF0lJFoiN08HpAL5JvT1dqyB81jj
 +WpORqtia6RoWbjHw8Jdt01M/Qpo
X-Google-Smtp-Source: APXvYqy7Kp7MZMRd3jHLnKAtZzaTP/Xm5oGgpnF0isM9GWTFmSjZH/yoMv4nsjoYt+xStkXDzuiXiA==
X-Received: by 2002:a05:6214:22c:: with SMTP id
 j12mr13792174qvt.150.1573836656032; 
 Fri, 15 Nov 2019 08:50:56 -0800 (PST)
Received: from localhost.localdomain ([71.219.59.120])
 by smtp.gmail.com with ESMTPSA id r29sm5610331qtb.63.2019.11.15.08.50.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Nov 2019 08:50:55 -0800 (PST)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org, alsa-devel@alsa-project.org, tiwai@suse.de,
 lukas@wunner.de
Date: Fri, 15 Nov 2019 11:50:27 -0500
Message-Id: <20191115165038.56646-10-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191115165038.56646-1-alexander.deucher@amd.com>
References: <20191115165038.56646-1-alexander.deucher@amd.com>
MIME-Version: 1.0
Cc: Alex Deucher <alexander.deucher@amd.com>, Evan Quan <evan.quan@amd.com>
Subject: [alsa-devel] [PATCH 09/20] drm/amdgpu: add additional boco checks
	to runtime suspend/resume (v2)
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
BOCO - Bus Off, Chip Off

We will take slightly different paths for boco and baco.

v2: fold together two consecutive if clauses

Reviewed-by: Evan Quan <evan.quan@amd.com> (v1)
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c | 47 ++++++++++++++-----------
 1 file changed, 26 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
index bfd91cf9150b..d05f8c03e559 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
@@ -1219,18 +1219,21 @@ static int amdgpu_pmops_runtime_suspend(struct device *dev)
 		return -EBUSY;
 	}
 
-	drm_dev->switch_power_state = DRM_SWITCH_POWER_CHANGING;
+	if (amdgpu_device_supports_boco(drm_dev))
+		drm_dev->switch_power_state = DRM_SWITCH_POWER_CHANGING;
 	drm_kms_helper_poll_disable(drm_dev);
 
 	ret = amdgpu_device_suspend(drm_dev, false, false);
-	pci_save_state(pdev);
-	pci_disable_device(pdev);
-	pci_ignore_hotplug(pdev);
-	if (amdgpu_is_atpx_hybrid())
-		pci_set_power_state(pdev, PCI_D3cold);
-	else if (!amdgpu_has_atpx_dgpu_power_cntl())
-		pci_set_power_state(pdev, PCI_D3hot);
-	drm_dev->switch_power_state = DRM_SWITCH_POWER_DYNAMIC_OFF;
+	if (amdgpu_device_supports_boco(drm_dev)) {
+		pci_save_state(pdev);
+		pci_disable_device(pdev);
+		pci_ignore_hotplug(pdev);
+		if (amdgpu_is_atpx_hybrid())
+			pci_set_power_state(pdev, PCI_D3cold);
+		else if (!amdgpu_has_atpx_dgpu_power_cntl())
+			pci_set_power_state(pdev, PCI_D3hot);
+		drm_dev->switch_power_state = DRM_SWITCH_POWER_DYNAMIC_OFF;
+	}
 
 	return 0;
 }
@@ -1244,20 +1247,22 @@ static int amdgpu_pmops_runtime_resume(struct device *dev)
 	if (!amdgpu_device_supports_boco(drm_dev))
 		return -EINVAL;
 
-	drm_dev->switch_power_state = DRM_SWITCH_POWER_CHANGING;
-
-	if (amdgpu_is_atpx_hybrid() ||
-	    !amdgpu_has_atpx_dgpu_power_cntl())
-		pci_set_power_state(pdev, PCI_D0);
-	pci_restore_state(pdev);
-	ret = pci_enable_device(pdev);
-	if (ret)
-		return ret;
-	pci_set_master(pdev);
-
+	if (amdgpu_device_supports_boco(drm_dev)) {
+		drm_dev->switch_power_state = DRM_SWITCH_POWER_CHANGING;
+
+		if (amdgpu_is_atpx_hybrid() ||
+		    !amdgpu_has_atpx_dgpu_power_cntl())
+			pci_set_power_state(pdev, PCI_D0);
+		pci_restore_state(pdev);
+		ret = pci_enable_device(pdev);
+		if (ret)
+			return ret;
+		pci_set_master(pdev);
+	}
 	ret = amdgpu_device_resume(drm_dev, false, false);
 	drm_kms_helper_poll_enable(drm_dev);
-	drm_dev->switch_power_state = DRM_SWITCH_POWER_ON;
+	if (amdgpu_device_supports_boco(drm_dev))
+		drm_dev->switch_power_state = DRM_SWITCH_POWER_ON;
 	return 0;
 }
 
-- 
2.23.0

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
