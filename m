Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A51ECFE37C
	for <lists+alsa-devel@lfdr.de>; Fri, 15 Nov 2019 17:59:28 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2F10F1671;
	Fri, 15 Nov 2019 17:58:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2F10F1671
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1573837168;
	bh=lfOzYdeQeK/PWjfs8zowYWYbSzW/tVeL0+/kgQAOMI8=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=cODIFiycP++DivvVtSdsaHRf9kTSrRDWN/oyYUwIZ5cvxXsT13esrES6QDbFGZmqG
	 Px4yBZY/8S1VNI1YUhi/NpHk+aehUg7U6UZEIr2KTVZFotyZD/aQo8LVa/qfFLFKZ+
	 ypf3uqVDrHi7+c5EEMt+v/uzd4xEurDJ3jcU+1bU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2C798F801F4;
	Fri, 15 Nov 2019 17:51:31 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9AFEAF80126; Fri, 15 Nov 2019 17:51:08 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com
 [IPv6:2607:f8b0:4864:20::742])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 69C77F800CC
 for <alsa-devel@alsa-project.org>; Fri, 15 Nov 2019 17:50:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 69C77F800CC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="EwmYowyi"
Received: by mail-qk1-x742.google.com with SMTP id z23so8591024qkj.10
 for <alsa-devel@alsa-project.org>; Fri, 15 Nov 2019 08:50:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=LuNG6KFy5KThL3r1k/KJ0OsHggvbwJygj5mmgEPRWyA=;
 b=EwmYowyi+5uFn2h7o6s4/2MAfbgulgGUENe0jAh1n40hJQBai9EU9/dlIOMYJ1Uixu
 obJOfVta6AhFjainsrrtYLjW30jWI3WnenGa33QaDlYLZXDnaM/A5LwHiwiSDNmqrstQ
 fj3sqYbzx5NYgUwtZarGvDBKHP5B/cSrkEN54Q7qmGS1lVesa4QewpXgA5uW2jAa8b6O
 jGWPoSbp3047Z8ovYCzUfyQCi/rGZG+gZTst0jb+9oYWOP4Q2WhhMBxiakbT4mDoFPKi
 HUdIYzGnsCGUnneQBRoB4XIqMEjlRdOUaB1DHvzIFKjjKGps+r6UdlMNx/6HsPg0JQ1f
 rCxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LuNG6KFy5KThL3r1k/KJ0OsHggvbwJygj5mmgEPRWyA=;
 b=ZmB/js0nybbrWEcA4Ye4PzvOgEgevtvqXTSnzweVUnMR4YeqUQl6j+kDgkWlWjc9oe
 dDhfhnq7I5xyWnY+Ysqk8zkIelMZ1tUiXrdh10qusZAYihuMFLFsBsuO9nxugs+y+EQd
 0KLwuWb17TMZJQ+fVG0uh+Ly0+5+njjYy3UIf8PTaYhCAntYDf31SxW8AJEh+1/89//K
 AoFG6Zc6Hh1UzMQDfZQNsUsRHNPX54rKoaeARN7i4RiuTrTceR3d8JHCIppoMG4iVs4O
 Svd6dE7UXNnJ9Kspnex3lSDySbRaQ2Cmk3L4Q0B0f0n9od8cvVjDBGyb9bJMtQAYOZ8R
 nghQ==
X-Gm-Message-State: APjAAAWc5moaXI7nYmHg8ThmTNdcNWWuA+EeHYTvS0E43TSAsYbi976K
 Z2qjRWDKQFgWPzhH86Z00tM=
X-Google-Smtp-Source: APXvYqxTSnmwQp/Aixu62VrL5wDOzU3Un16NPmTsycW1gYQ/dZKHIhlmPORBnD+JGeH/U8UhKDVW+w==
X-Received: by 2002:a37:4906:: with SMTP id w6mr1488773qka.82.1573836655023;
 Fri, 15 Nov 2019 08:50:55 -0800 (PST)
Received: from localhost.localdomain ([71.219.59.120])
 by smtp.gmail.com with ESMTPSA id r29sm5610331qtb.63.2019.11.15.08.50.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Nov 2019 08:50:54 -0800 (PST)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org, alsa-devel@alsa-project.org, tiwai@suse.de,
 lukas@wunner.de
Date: Fri, 15 Nov 2019 11:50:26 -0500
Message-Id: <20191115165038.56646-9-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191115165038.56646-1-alexander.deucher@amd.com>
References: <20191115165038.56646-1-alexander.deucher@amd.com>
MIME-Version: 1.0
Cc: Alex Deucher <alexander.deucher@amd.com>, Evan Quan <evan.quan@amd.com>
Subject: [alsa-devel] [PATCH 08/20] drm/amdgpu: rename amdgpu_device_is_px
	to amdgpu_device_supports_boco (v2)
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

To better match what we are checking for and to align with
amdgpu_device_supports_baco.

BOCO is used on PowerXpress/Hybrid Graphics systems and BACO
is used on desktop dGPU boards.

v2: fix typo in documentation

Reviewed-by: Evan Quan <evan.quan@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu.h        | 2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 8 ++++----
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c    | 8 ++++----
 drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c    | 6 +++---
 4 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
index 6bc73fbd49fa..186135ea6033 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
@@ -1141,7 +1141,7 @@ void amdgpu_device_program_register_sequence(struct amdgpu_device *adev,
 					     const u32 *registers,
 					     const u32 array_size);
 
-bool amdgpu_device_is_px(struct drm_device *dev);
+bool amdgpu_device_supports_boco(struct drm_device *dev);
 bool amdgpu_device_supports_baco(struct drm_device *dev);
 bool amdgpu_device_is_peer_accessible(struct amdgpu_device *adev,
 				      struct amdgpu_device *peer_adev);
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
index e6dfc246e621..45c196845497 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
@@ -138,14 +138,14 @@ static DEVICE_ATTR(pcie_replay_count, S_IRUGO,
 static void amdgpu_device_get_pcie_info(struct amdgpu_device *adev);
 
 /**
- * amdgpu_device_is_px - Is the device is a dGPU with HG/PX power control
+ * amdgpu_device_supports_boco - Is the device a dGPU with HG/PX power control
  *
  * @dev: drm_device pointer
  *
  * Returns true if the device is a dGPU with HG/PX power control,
  * otherwise return false.
  */
-bool amdgpu_device_is_px(struct drm_device *dev)
+bool amdgpu_device_supports_boco(struct drm_device *dev)
 {
 	struct amdgpu_device *adev = dev->dev_private;
 
@@ -1091,7 +1091,7 @@ static void amdgpu_switcheroo_set_state(struct pci_dev *pdev, enum vga_switchero
 {
 	struct drm_device *dev = pci_get_drvdata(pdev);
 
-	if (amdgpu_device_is_px(dev) && state == VGA_SWITCHEROO_OFF)
+	if (amdgpu_device_supports_boco(dev) && state == VGA_SWITCHEROO_OFF)
 		return;
 
 	if (state == VGA_SWITCHEROO_ON) {
@@ -2914,7 +2914,7 @@ int amdgpu_device_init(struct amdgpu_device *adev,
 	 * ignore it */
 	vga_client_register(adev->pdev, adev, NULL, amdgpu_device_vga_set_decode);
 
-	if (amdgpu_device_is_px(ddev))
+	if (amdgpu_device_supports_boco(ddev))
 		runtime = true;
 	if (!pci_is_thunderbolt_attached(adev->pdev))
 		vga_switcheroo_register_client(adev->pdev,
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
index 5c2190558f69..bfd91cf9150b 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
@@ -1166,7 +1166,7 @@ static int amdgpu_pmops_resume(struct device *dev)
 	struct drm_device *drm_dev = dev_get_drvdata(dev);
 
 	/* GPU comes up enabled by the bios on resume */
-	if (amdgpu_device_is_px(drm_dev)) {
+	if (amdgpu_device_supports_boco(drm_dev)) {
 		pm_runtime_disable(dev);
 		pm_runtime_set_active(dev);
 		pm_runtime_enable(dev);
@@ -1214,7 +1214,7 @@ static int amdgpu_pmops_runtime_suspend(struct device *dev)
 	struct drm_device *drm_dev = pci_get_drvdata(pdev);
 	int ret;
 
-	if (!amdgpu_device_is_px(drm_dev)) {
+	if (!amdgpu_device_supports_boco(drm_dev)) {
 		pm_runtime_forbid(dev);
 		return -EBUSY;
 	}
@@ -1241,7 +1241,7 @@ static int amdgpu_pmops_runtime_resume(struct device *dev)
 	struct drm_device *drm_dev = pci_get_drvdata(pdev);
 	int ret;
 
-	if (!amdgpu_device_is_px(drm_dev))
+	if (!amdgpu_device_supports_boco(drm_dev))
 		return -EINVAL;
 
 	drm_dev->switch_power_state = DRM_SWITCH_POWER_CHANGING;
@@ -1266,7 +1266,7 @@ static int amdgpu_pmops_runtime_idle(struct device *dev)
 	struct drm_device *drm_dev = dev_get_drvdata(dev);
 	struct drm_crtc *crtc;
 
-	if (!amdgpu_device_is_px(drm_dev)) {
+	if (!amdgpu_device_supports_boco(drm_dev)) {
 		pm_runtime_forbid(dev);
 		return -EBUSY;
 	}
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
index 2d428ca45184..4093af6e575a 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
@@ -91,7 +91,7 @@ void amdgpu_driver_unload_kms(struct drm_device *dev)
 	if (amdgpu_sriov_vf(adev))
 		amdgpu_virt_request_full_gpu(adev, false);
 
-	if (amdgpu_device_is_px(dev)) {
+	if (amdgpu_device_supports_boco(dev)) {
 		pm_runtime_get_sync(dev->dev);
 		pm_runtime_forbid(dev->dev);
 	}
@@ -180,7 +180,7 @@ int amdgpu_driver_load_kms(struct drm_device *dev, unsigned long flags)
 				"Error during ACPI methods call\n");
 	}
 
-	if (amdgpu_device_is_px(dev)) {
+	if (amdgpu_device_supports_boco(dev)) {
 		dev_pm_set_driver_flags(dev->dev, DPM_FLAG_NEVER_SKIP);
 		pm_runtime_use_autosuspend(dev->dev);
 		pm_runtime_set_autosuspend_delay(dev->dev, 5000);
@@ -193,7 +193,7 @@ int amdgpu_driver_load_kms(struct drm_device *dev, unsigned long flags)
 out:
 	if (r) {
 		/* balance pm_runtime_get_sync in amdgpu_driver_unload_kms */
-		if (adev->rmmio && amdgpu_device_is_px(dev))
+		if (adev->rmmio && amdgpu_device_supports_boco(dev))
 			pm_runtime_put_noidle(dev->dev);
 		amdgpu_driver_unload_kms(dev);
 	}
-- 
2.23.0

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
