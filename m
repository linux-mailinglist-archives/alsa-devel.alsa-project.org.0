Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CA22FE386
	for <lists+alsa-devel@lfdr.de>; Fri, 15 Nov 2019 18:01:29 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B70441657;
	Fri, 15 Nov 2019 18:00:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B70441657
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1573837288;
	bh=bR+UJdrHF3Ppy5QkgngGoc6e/W7L6WnoYG/WP7CpEZU=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JpcT2tv5w0tPB6VyEKhbOovxNvs4Y6jg+8Ky0ShfHo1PvM9ufG1GH+Sd42J9Lkumb
	 UATO5uUNJRbDDISSZoAcKYjiR9CBWe2yXbFzDIGDWSh7JNHiMgZS9XM6tPOXhLJPVi
	 9BLZX90IryyhrFrSsGjvcpD4o/gDSDB4WEg4+5pY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E87E4F8022B;
	Fri, 15 Nov 2019 17:51:34 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DC8BBF8013D; Fri, 15 Nov 2019 17:51:14 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com
 [IPv6:2607:f8b0:4864:20::744])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 35745F80104
 for <alsa-devel@alsa-project.org>; Fri, 15 Nov 2019 17:51:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 35745F80104
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="CvfXnzBw"
Received: by mail-qk1-x744.google.com with SMTP id 15so8615574qkh.6
 for <alsa-devel@alsa-project.org>; Fri, 15 Nov 2019 08:51:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CDWn7KU/K4RcjXitYmHoOH9t0M50HF9fD6HpitNErzo=;
 b=CvfXnzBwzDl2u2i7TQOR0KpcvHMBQo34bskci8wta04UPOnoJj2kkGFEqklgKmZ1WA
 7S2aj4BZG2McshYWd6vTzZNKxjNFwHYRe/qR07Q4JNrWiBJOY54l2H0B7ImV4VsLZs6Q
 Hk3dG+gkaGEmRSAGtKEm6WBlcJPJ8H1+NFpHTEtZQj9dKvpT12ISglfJptTyCpbWORdf
 ig5CrYspiGf7RltJygSXXyVwcik//8dlJAlBGQaWeyW4C5PyJpxddW3BKGb7XGFd0EjY
 Fup3DHwtZYRg15VEEfM1KjGQPzI04DitX92cVOUnuSNHZAUjNbYwAh+jvjb7k4+Ew0uc
 hM/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CDWn7KU/K4RcjXitYmHoOH9t0M50HF9fD6HpitNErzo=;
 b=skCdPX/G2r3GI5PVna7sfyAeMyhUvv6txsQ3sxPIQpBF75IPUCYOUeojgJOsej/3rh
 COLApglczBQhFCk6WBZvU4srErFBApEubyjz3yL8qbs8eyaAp4VPeCrXQiOvKoCn2iBF
 uKkQ1Ou+2EIv/dH2NgPYwFGQBf50Wl17GAPVyaMYZ+h6iJIEwI1F1zMto1U3GNKlGLDk
 e1oD939eJphXXelm1Fm0IO0Ft3ksoUx6AByUXWlki2Zn64xEENQW9luFpmT19/D4TmmJ
 1mBKaqLC6pwvC2yFlb9mll1/WTvCh00HyVsg8lD0ZB2ivlpxNvmrjOMkiZ3j9OJdp9/k
 KhQg==
X-Gm-Message-State: APjAAAWgmbroymczflIfSJLlnYi7/HJwomv9ZYAxrwsdJ5D19v4GynFm
 nbqscN142TLYYn2PMpOUS34=
X-Google-Smtp-Source: APXvYqwyaIsQDs/wY+au+kCoQ6K4ddrmDvvP7tibzWSCMS7EZ9Vtp2LzBpNSe0Bi6s15SvmKHHuCQg==
X-Received: by 2002:a37:4bd7:: with SMTP id y206mr13640828qka.18.1573836659873; 
 Fri, 15 Nov 2019 08:50:59 -0800 (PST)
Received: from localhost.localdomain ([71.219.59.120])
 by smtp.gmail.com with ESMTPSA id r29sm5610331qtb.63.2019.11.15.08.50.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Nov 2019 08:50:59 -0800 (PST)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org, alsa-devel@alsa-project.org, tiwai@suse.de,
 lukas@wunner.de
Date: Fri, 15 Nov 2019 11:50:31 -0500
Message-Id: <20191115165038.56646-14-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191115165038.56646-1-alexander.deucher@amd.com>
References: <20191115165038.56646-1-alexander.deucher@amd.com>
MIME-Version: 1.0
Cc: Alex Deucher <alexander.deucher@amd.com>, Evan Quan <evan.quan@amd.com>
Subject: [alsa-devel] [PATCH 13/20] drm/amdgpu: start to disentangle boco
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
 drivers/gpu/drm/amd/amdgpu/amdgpu.h     |  2 ++
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c |  9 ++++++---
 drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c | 13 ++++++++-----
 3 files changed, 16 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
index 64bc5771b34f..8f6c995fd2ec 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
@@ -988,6 +988,8 @@ struct amdgpu_device {
 
 	/* device pstate */
 	int				pstate;
+	/* enable runtime pm on the device */
+	bool                            runpm;
 };
 
 static inline struct amdgpu_device *amdgpu_ttm_adev(struct ttm_bo_device *bdev)
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
index 7b5437a87b01..ea763bc5b233 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
@@ -1213,9 +1213,10 @@ static int amdgpu_pmops_runtime_suspend(struct device *dev)
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
@@ -1245,9 +1246,10 @@ static int amdgpu_pmops_runtime_resume(struct device *dev)
 {
 	struct pci_dev *pdev = to_pci_dev(dev);
 	struct drm_device *drm_dev = pci_get_drvdata(pdev);
+	struct amdgpu_device *adev = drm_dev->dev_private;
 	int ret;
 
-	if (!amdgpu_device_supports_boco(drm_dev))
+	if (!adev->runpm)
 		return -EINVAL;
 
 	if (amdgpu_device_supports_boco(drm_dev)) {
@@ -1274,9 +1276,10 @@ static int amdgpu_pmops_runtime_resume(struct device *dev)
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
index 4093af6e575a..89b021c54b93 100644
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
@@ -193,7 +196,7 @@ int amdgpu_driver_load_kms(struct drm_device *dev, unsigned long flags)
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
