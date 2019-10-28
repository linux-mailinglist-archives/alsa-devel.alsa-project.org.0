Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 05555E7BCA
	for <lists+alsa-devel@lfdr.de>; Mon, 28 Oct 2019 22:52:43 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8612D2169;
	Mon, 28 Oct 2019 22:51:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8612D2169
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1572299562;
	bh=QIVeignZCoNygmprdObypPZECaodVMcPi1NMhnyne7w=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=s/DKSNkXsvq7VzRwxPNE6Srniz3zl9P2fL8tINu42CGRIEa8CfHwp99lGuUIShNub
	 5tzPpTjXQ4iu03g0sUOJtm+BZdzMfJ53kVQJgrB0mjx95JKdpPt/0cl1WbjDZqu5J0
	 wkVVIUIC1uldoqVOWa1TghuVNSR5Jyf3R4fb4chk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D62BBF8071C;
	Mon, 28 Oct 2019 22:43:41 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DDA1FF8070E; Mon, 28 Oct 2019 22:43:39 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-yb1-xb44.google.com (mail-yb1-xb44.google.com
 [IPv6:2607:f8b0:4864:20::b44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 11D65F80674
 for <alsa-devel@alsa-project.org>; Mon, 28 Oct 2019 22:43:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 11D65F80674
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="km7YLDjS"
Received: by mail-yb1-xb44.google.com with SMTP id i6so4643509ybe.2
 for <alsa-devel@alsa-project.org>; Mon, 28 Oct 2019 14:43:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=j0CmKr8GpoVOtvZMrcSNmbhZOXME5pOWosm0aMVWcUw=;
 b=km7YLDjSNM+8qJo/qgNVndMKQCVBGAm8xEnJt+Ipy7fKgxn9o+73QjQIfOMdT+4k7Y
 BWREJiHJCCFoeL5TO37+Q4k4T9AKMnIXjmlBOTxnVvgrZxVfOu/sEhK4IufuO+Vx+Md3
 D6dywOkzVEAQ+i3diVfNAnbdG/jHdR1+iWCdhrXIPNiGMsFtloLFEhBKFqhS8Hh1a22Y
 aRHciBs3YKHYM93v1zcGRD3OcxOZKa63C8jBSksgNF61dd42NWbJNMStNbRS4+Us07iA
 MElcq8jVTFGdkGnaP5e1TdPWcjOwNiGg/q3CoF8ldFMrxovDef2DWqIXNJ5bWRaHmb09
 d86Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=j0CmKr8GpoVOtvZMrcSNmbhZOXME5pOWosm0aMVWcUw=;
 b=b+Xr++mvHUT4OycS+Ji39FR1c6iGImvKBIsB2C+m5yNe050WW0XI0VM5adsgiAizHu
 cjQamh6ZsgMucLCvZpPsMVYf/N+XWxdstN2RMhfKTHMpS+kRGBCnKWkY8yPV9KYiBE6j
 jS0BlIvzkqasu2KC1CLEJ9iidICpAndHtiAgCQrJIai56/u5gxfLqKMXZD5Xa9G7Ght2
 Obryt9rnfZO+4R22UQi8ubvJpgugo3Wlylu02YSu0PbCF94GyF11Y0f9ck1BCfjdGBMG
 xGzMGY4sre1Pc8ZElFjISU/og1YIuqBvw/yvGq9XrlCKWg+8pUhQ3TySA5QHR/f4G3uY
 ZMCw==
X-Gm-Message-State: APjAAAU5dbhDmv8Ca6e6VxmMVANSjHH0oGfCWGDCnbcwTtYXBn4vTNLR
 Fav657WaoX3qQF9Q/Fc7WME=
X-Google-Smtp-Source: APXvYqx/k0j1E95OCSKz8unIHaljY5EWEALnXKwXrBGxWodCBR3c/nWms+mYqX/T1QVgZI64SgmQ4A==
X-Received: by 2002:a25:dbd4:: with SMTP id
 g203mr15858452ybf.296.1572298999437; 
 Mon, 28 Oct 2019 14:43:19 -0700 (PDT)
Received: from tr4.amd.com (atlvpn.amd.com. [165.204.84.11])
 by smtp.gmail.com with ESMTPSA id l68sm3421090ywf.95.2019.10.28.14.43.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Oct 2019 14:43:19 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org, alsa-devel@alsa-project.org, tiwai@suse.de,
 lukas@wunner.de
Date: Mon, 28 Oct 2019 17:42:04 -0400
Message-Id: <20191028214216.1508370-10-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191028214216.1508370-1-alexander.deucher@amd.com>
References: <20191028214216.1508370-1-alexander.deucher@amd.com>
MIME-Version: 1.0
Cc: Alex Deucher <alexander.deucher@amd.com>, Evan Quan <evan.quan@amd.com>
Subject: [alsa-devel] [PATCH 09/21] drm/amdgpu: rename amdgpu_device_is_px
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
index 8bdaf1c784e5..d04a94ed23e5 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
@@ -1138,7 +1138,7 @@ void amdgpu_device_program_register_sequence(struct amdgpu_device *adev,
 					     const u32 *registers,
 					     const u32 array_size);
 
-bool amdgpu_device_is_px(struct drm_device *dev);
+bool amdgpu_device_supports_boco(struct drm_device *dev);
 bool amdgpu_device_supports_baco(struct drm_device *dev);
 bool amdgpu_device_is_peer_accessible(struct amdgpu_device *adev,
 				      struct amdgpu_device *peer_adev);
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
index 85357bd2863e..2a5f4c7c0a24 100644
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
@@ -2881,7 +2881,7 @@ int amdgpu_device_init(struct amdgpu_device *adev,
 	 * ignore it */
 	vga_client_register(adev->pdev, adev, NULL, amdgpu_device_vga_set_decode);
 
-	if (amdgpu_device_is_px(ddev))
+	if (amdgpu_device_supports_boco(ddev))
 		runtime = true;
 	if (!pci_is_thunderbolt_attached(adev->pdev))
 		vga_switcheroo_register_client(adev->pdev,
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
index cc7fd618223f..310182bf1db5 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
@@ -1164,7 +1164,7 @@ static int amdgpu_pmops_resume(struct device *dev)
 	struct drm_device *drm_dev = dev_get_drvdata(dev);
 
 	/* GPU comes up enabled by the bios on resume */
-	if (amdgpu_device_is_px(drm_dev)) {
+	if (amdgpu_device_supports_boco(drm_dev)) {
 		pm_runtime_disable(dev);
 		pm_runtime_set_active(dev);
 		pm_runtime_enable(dev);
@@ -1212,7 +1212,7 @@ static int amdgpu_pmops_runtime_suspend(struct device *dev)
 	struct drm_device *drm_dev = pci_get_drvdata(pdev);
 	int ret;
 
-	if (!amdgpu_device_is_px(drm_dev)) {
+	if (!amdgpu_device_supports_boco(drm_dev)) {
 		pm_runtime_forbid(dev);
 		return -EBUSY;
 	}
@@ -1239,7 +1239,7 @@ static int amdgpu_pmops_runtime_resume(struct device *dev)
 	struct drm_device *drm_dev = pci_get_drvdata(pdev);
 	int ret;
 
-	if (!amdgpu_device_is_px(drm_dev))
+	if (!amdgpu_device_supports_boco(drm_dev))
 		return -EINVAL;
 
 	drm_dev->switch_power_state = DRM_SWITCH_POWER_CHANGING;
@@ -1264,7 +1264,7 @@ static int amdgpu_pmops_runtime_idle(struct device *dev)
 	struct drm_device *drm_dev = dev_get_drvdata(dev);
 	struct drm_crtc *crtc;
 
-	if (!amdgpu_device_is_px(drm_dev)) {
+	if (!amdgpu_device_supports_boco(drm_dev)) {
 		pm_runtime_forbid(dev);
 		return -EBUSY;
 	}
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
index 137a8573d556..1f03cfec5265 100644
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
@@ -194,7 +194,7 @@ int amdgpu_driver_load_kms(struct drm_device *dev, unsigned long flags)
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
