Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EB4DDE7BCE
	for <lists+alsa-devel@lfdr.de>; Mon, 28 Oct 2019 22:54:11 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7EE71217D;
	Mon, 28 Oct 2019 22:53:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7EE71217D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1572299651;
	bh=E5Ub6qJ5g/OZn8jsoCjquEgEqrKSR6yXueAHGf00vi0=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=P1+97sw1Cu1vaChpiYYxYkUZx9TwZvMmH84QZrMDwgzPm+IxK6qaRrWMxig7xZuLP
	 c4t/OMOUkW0+d5/9oqcCGaQZ1dM27h7BQkv2v3hl3J42RNU+pQLRJGIQ9jABvkWdp3
	 1gV+QMsbIygmr1EAtLEjrCvCOJKZl2w/KHDQv+GE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F0000F8074B;
	Mon, 28 Oct 2019 22:43:50 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 27EDDF80735; Mon, 28 Oct 2019 22:43:48 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-yb1-xb42.google.com (mail-yb1-xb42.google.com
 [IPv6:2607:f8b0:4864:20::b42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5C499F8072A
 for <alsa-devel@alsa-project.org>; Mon, 28 Oct 2019 22:43:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5C499F8072A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="I7GuFVs5"
Received: by mail-yb1-xb42.google.com with SMTP id r68so4633817ybf.5
 for <alsa-devel@alsa-project.org>; Mon, 28 Oct 2019 14:43:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Zq27KxaTxmtstlOCSE4K4tPBxG7thhuuXBs3cHKpcy0=;
 b=I7GuFVs5opcvn7ciPCzreSvnTnjCt4NQuQXN0whdRVOozdFPAy2vpR/LdFxs0C/5qm
 TnI1K/cGS8PnqVdHtWDQh1/M962fV7AjATd8iKeIZ3pnj/eobOqgG5AUyO9Wnu3iP+bp
 6kJHQ+MI1hBiJjyprDi1beRHBl/Eb1YuRJwWQB7ppqi1wYbkH5tXtgVKvF3CocjGm5Fh
 /W6Y57OIfmZt2pT8DHXvTPhMfyV6Iq3fpUj1xX2uzr628GvabihnqhmlY+C03lAy1cBo
 hNAa9Pv0Ose132aCRAMhqKfug1Mqi/EPLWBxzwM393rjUUex4nJzt4K1wHvzZx/vmzXH
 aTBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Zq27KxaTxmtstlOCSE4K4tPBxG7thhuuXBs3cHKpcy0=;
 b=B6e5DbgruejCUAMrvKH9m7TQjxFMhjN5aVaGNQOQiJydN5sRGWTw/17mwrZ6FM8Ari
 IIPCC7jvkYs9EZQHq28Yf/YRxd/vbTY7sRyGJWO5AmChYmTBUqnjq4btTe3MwJ7tc+Xk
 6LEV/J4Nr0Cgke49IfFQCt0gyeqSe2PZCDlbVmyTsDZsvyfTn7HbIqo5yDXIu3z/FsBq
 9TeXpz8fo4v0iSheLwDQyYNEATXHR9EnK9QX6IPfJIpO0HtPFO5gYWYgskueyj6hQumL
 rc3bHGyyrPKqsPHGtjnyZAfeY8VEohvBdo+AydrzNRAgzaj2P6pzsOqhj/ZEto2FaDeU
 GS5A==
X-Gm-Message-State: APjAAAV13f9Z64l21sJL8Ca006IxWQnVd7XgPSpkCfeIn6lpEyZ+d2zf
 fKbr2EqDB35jtuJr33p1LfBIPlshpD4=
X-Google-Smtp-Source: APXvYqwpkfHFuhRh+KxDdhtW7m7HcfNCAhYbRT29Y8l/CCp/CTQcCrmA9pTM8vF4QRR62JUwhumRLw==
X-Received: by 2002:a25:8502:: with SMTP id w2mr1477826ybk.505.1572299024162; 
 Mon, 28 Oct 2019 14:43:44 -0700 (PDT)
Received: from tr4.amd.com (atlvpn.amd.com. [165.204.84.11])
 by smtp.gmail.com with ESMTPSA id l68sm3421090ywf.95.2019.10.28.14.43.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Oct 2019 14:43:43 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org, alsa-devel@alsa-project.org, tiwai@suse.de,
 lukas@wunner.de
Date: Mon, 28 Oct 2019 17:42:09 -0400
Message-Id: <20191028214216.1508370-15-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191028214216.1508370-1-alexander.deucher@amd.com>
References: <20191028214216.1508370-1-alexander.deucher@amd.com>
MIME-Version: 1.0
Cc: Alex Deucher <alexander.deucher@amd.com>, Evan Quan <evan.quan@amd.com>
Subject: [alsa-devel] [PATCH 14/21] drm/amdgpu: start to disentangle boco
	from runtime pm
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

We originally only supported runtime pm on PX/HG
laptops so most of the runtime pm code looks for this.
Add a new flag to check for runtime pm enablement and
use this rather than checking for PX/HG.

Reviewed-by: Evan Quan <evan.quan@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu.h     |  3 +++
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c |  9 ++++++---
 drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c | 13 ++++++++-----
 3 files changed, 17 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
index f2b9714e7e0c..ff2f66bf531b 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
@@ -985,6 +985,9 @@ struct amdgpu_device {
 
 	uint64_t			unique_id;
 	uint64_t	df_perfmon_config_assign_mask[AMDGPU_MAX_DF_PERFMONS];
+
+	/* enable runtime pm on the device */
+	bool                            runpm;
 };
 
 static inline struct amdgpu_device *amdgpu_ttm_adev(struct ttm_bo_device *bdev)
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
index 849784e27a98..941a7f2a8140 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
@@ -1211,9 +1211,10 @@ static int amdgpu_pmops_runtime_suspend(struct device *dev)
 {
 	struct pci_dev *pdev = to_pci_dev(dev);
 	struct drm_device *drm_dev = pci_get_drvdata(pdev);
+	struct amdgpu_device *adev = drm_dev->dev_private;
 	int ret;
 
-	if (!amdgpu_device_supports_boco(drm_dev)) {
+	if (!adev->runpm) {
 		pm_runtime_forbid(dev);
 		return -EBUSY;
 	}
@@ -1243,9 +1244,10 @@ static int amdgpu_pmops_runtime_resume(struct device *dev)
 {
 	struct pci_dev *pdev = to_pci_dev(dev);
 	struct drm_device *drm_dev = pci_get_drvdata(pdev);
+	struct amdgpu_device *adev = drm_dev->dev_private;
 	int ret;
 
-	if (!amdgpu_device_supports_boco(drm_dev))
+	if (!adev->runpm)
 		return -EINVAL;
 
 	if (amdgpu_device_supports_boco(drm_dev)) {
@@ -1272,9 +1274,10 @@ static int amdgpu_pmops_runtime_resume(struct device *dev)
 static int amdgpu_pmops_runtime_idle(struct device *dev)
 {
 	struct drm_device *drm_dev = dev_get_drvdata(dev);
+	struct amdgpu_device *adev = drm_dev->dev_private;
 	struct drm_crtc *crtc;
 
-	if (!amdgpu_device_supports_boco(drm_dev)) {
+	if (!adev->runpm) {
 		pm_runtime_forbid(dev);
 		return -EBUSY;
 	}
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
index 1f03cfec5265..06dae1de71d0 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
@@ -91,7 +91,7 @@ void amdgpu_driver_unload_kms(struct drm_device *dev)
 	if (amdgpu_sriov_vf(adev))
 		amdgpu_virt_request_full_gpu(adev, false);
 
-	if (amdgpu_device_supports_boco(dev)) {
+	if (adev->runpm) {
 		pm_runtime_get_sync(dev->dev);
 		pm_runtime_forbid(dev->dev);
 	}
@@ -150,14 +150,17 @@ int amdgpu_driver_load_kms(struct drm_device *dev, unsigned long flags)
 	}
 	dev->dev_private = (void *)adev;
 
-	if ((amdgpu_runtime_pm != 0) &&
-	    amdgpu_has_atpx() &&
+	if (amdgpu_has_atpx() &&
 	    (amdgpu_is_atpx_hybrid() ||
 	     amdgpu_has_atpx_dgpu_power_cntl()) &&
 	    ((flags & AMD_IS_APU) == 0) &&
 	    !pci_is_thunderbolt_attached(dev->pdev))
 		flags |= AMD_IS_PX;
 
+	if ((amdgpu_runtime_pm != 0) &&
+	    (flags & AMD_IS_PX))
+		adev->runpm = true;
+
 	/* amdgpu_device_init should report only fatal error
 	 * like memory allocation failure or iomapping failure,
 	 * or memory manager initialization failure, it must
@@ -180,7 +183,7 @@ int amdgpu_driver_load_kms(struct drm_device *dev, unsigned long flags)
 				"Error during ACPI methods call\n");
 	}
 
-	if (amdgpu_device_supports_boco(dev)) {
+	if (adev->runpm) {
 		dev_pm_set_driver_flags(dev->dev, DPM_FLAG_NEVER_SKIP);
 		pm_runtime_use_autosuspend(dev->dev);
 		pm_runtime_set_autosuspend_delay(dev->dev, 5000);
@@ -194,7 +197,7 @@ int amdgpu_driver_load_kms(struct drm_device *dev, unsigned long flags)
 out:
 	if (r) {
 		/* balance pm_runtime_get_sync in amdgpu_driver_unload_kms */
-		if (adev->rmmio && amdgpu_device_supports_boco(dev))
+		if (adev->rmmio && adev->runpm)
 			pm_runtime_put_noidle(dev->dev);
 		amdgpu_driver_unload_kms(dev);
 	}
-- 
2.23.0

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
