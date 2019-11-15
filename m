Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 47A5EFE380
	for <lists+alsa-devel@lfdr.de>; Fri, 15 Nov 2019 18:00:12 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D7CF51657;
	Fri, 15 Nov 2019 17:59:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D7CF51657
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1573837211;
	bh=VKKTReDQHrcbMGPcT9gpYWeGsrIIVGauvzStyiNzhCU=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=EBxK6cI4BWudiQKt1GJDgFO60zzuFQ9XFxIMyQin0CkggXJYra1vUwL65xENriQZ0
	 Prd74D9qe3fPyuhpwh1Hp8uhUVn3ORHja6hjb8WDIcVsKEN19EIXF5CQ/lxnhilu0Z
	 dMScyCTFIqWiA19amT5C9lNItdUz5/l0JkhDqiaI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6428FF80212;
	Fri, 15 Nov 2019 17:51:32 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E3132F8013B; Fri, 15 Nov 2019 17:51:11 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-qk1-x72e.google.com (mail-qk1-x72e.google.com
 [IPv6:2607:f8b0:4864:20::72e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 13603F80107
 for <alsa-devel@alsa-project.org>; Fri, 15 Nov 2019 17:50:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 13603F80107
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="kud+mVtw"
Received: by mail-qk1-x72e.google.com with SMTP id z16so8626503qkg.7
 for <alsa-devel@alsa-project.org>; Fri, 15 Nov 2019 08:50:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=VVgxIWcj/FlBXGVRaxV/L0LEMIri/0ix2aG74MCVJXk=;
 b=kud+mVtwM4rBQutreGW53E9Hq6DXKEs+Ac5s249ubn6wUvx7duqSUGFxGYvKgm0mcD
 r+dX81XgCJ5UKPGfQxiPNqvYGr5Y64hhUqsRzMkyN//FF1OLZtsqSsxFxPev0m2OWn24
 VXxnkarpX7HIfhy5vRpzfQ9QcS1taCDoijlHOw8rjOpuCBzCXOJNnBOe4w/3x+6aQSIS
 fgvUGzd6GLvTPIevLgLm0C3ZQauWNDNmdqDjFBrF66b6bWvq9l91Nm00SkPsT7+IO+aM
 oTrpFH7a672Twqy9HT0d4WD0zKmJrJ3yhzuL4XAciJQrOOv+EGPauCaUQuiZ/oQ+RYif
 C+cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=VVgxIWcj/FlBXGVRaxV/L0LEMIri/0ix2aG74MCVJXk=;
 b=NGJj9MN5t8tasWn2jUJvzo/m1DyTn2qhPhEG8zFBCdmD9Te+76b7gbfiCnwQjE6jPt
 h5kNyE2qUjBSSBg+OoWw9ow8R0PsM+fvpNdAM0zqBSfQy+U35PrmOg6n6tVh8C+TfYz5
 QpRZ8/iFUV73OwkmWC4FVlwfuifzPiZIXwJAXBjTUvXjyZi5QT9pJhZJJn3TaFMLCZfa
 SA/Snc5OD4N04M89mHUCPrTQ84xlVAywbB2/iuWT87Bz9875oYwcECZsdgs25nrvYZpG
 6CPLuN0H3Tjouphr5OZ09MMC6HgdD92uRiUOcO9epLjk8JFzVfvW0FsIvbT1A2LXMJDE
 347Q==
X-Gm-Message-State: APjAAAVzG4I7pulywZNB0ug/cM5BZqYuY4IqSiL1JVt0hitmVPoGLulB
 5rXaf2W6H/rnP65kEvueJzU=
X-Google-Smtp-Source: APXvYqxnjq/dwG0B6CwHz8/cih7zvaLEoyqrP+kPLCcDv82B75tw/9bA1xo8eNQl8pBhGSgHHbGu3Q==
X-Received: by 2002:a37:6354:: with SMTP id x81mr5613352qkb.316.1573836657090; 
 Fri, 15 Nov 2019 08:50:57 -0800 (PST)
Received: from localhost.localdomain ([71.219.59.120])
 by smtp.gmail.com with ESMTPSA id r29sm5610331qtb.63.2019.11.15.08.50.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Nov 2019 08:50:56 -0800 (PST)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org, alsa-devel@alsa-project.org, tiwai@suse.de,
 lukas@wunner.de
Date: Fri, 15 Nov 2019 11:50:28 -0500
Message-Id: <20191115165038.56646-11-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191115165038.56646-1-alexander.deucher@amd.com>
References: <20191115165038.56646-1-alexander.deucher@amd.com>
MIME-Version: 1.0
Cc: Alex Deucher <alexander.deucher@amd.com>, Evan Quan <evan.quan@amd.com>
Subject: [alsa-devel] [PATCH 10/20] drm/amdgpu: split swSMU baco_reset into
	enter and exit
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

So we can use it for power savings rather than just reset.

Reviewed-by: Evan Quan <evan.quan@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/nv.c               |  7 ++++++-
 drivers/gpu/drm/amd/amdgpu/soc15.c            | 10 ++++++++--
 drivers/gpu/drm/amd/powerplay/amdgpu_smu.c    | 20 ++++++++++++++++---
 drivers/gpu/drm/amd/powerplay/arcturus_ppt.c  |  3 ++-
 .../gpu/drm/amd/powerplay/inc/amdgpu_smu.h    |  6 ++++--
 drivers/gpu/drm/amd/powerplay/inc/smu_v11_0.h |  3 ++-
 drivers/gpu/drm/amd/powerplay/navi10_ppt.c    |  3 ++-
 drivers/gpu/drm/amd/powerplay/smu_v11_0.c     |  9 ++++++++-
 drivers/gpu/drm/amd/powerplay/vega20_ppt.c    |  3 ++-
 9 files changed, 51 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/nv.c b/drivers/gpu/drm/amd/amdgpu/nv.c
index b25b72a73048..7b19a8381675 100644
--- a/drivers/gpu/drm/amd/amdgpu/nv.c
+++ b/drivers/gpu/drm/amd/amdgpu/nv.c
@@ -352,7 +352,12 @@ static int nv_asic_reset(struct amdgpu_device *adev)
 	if (nv_asic_reset_method(adev) == AMD_RESET_METHOD_BACO) {
 		if (!adev->in_suspend)
 			amdgpu_inc_vram_lost(adev);
-		ret = smu_baco_reset(smu);
+		ret = smu_baco_enter(smu);
+		if (ret)
+			return ret;
+		ret = smu_baco_exit(smu);
+		if (ret)
+			return ret;
 	} else {
 		if (!adev->in_suspend)
 			amdgpu_inc_vram_lost(adev);
diff --git a/drivers/gpu/drm/amd/amdgpu/soc15.c b/drivers/gpu/drm/amd/amdgpu/soc15.c
index 1acbb38f6384..3e37a3af59eb 100644
--- a/drivers/gpu/drm/amd/amdgpu/soc15.c
+++ b/drivers/gpu/drm/amd/amdgpu/soc15.c
@@ -509,9 +509,15 @@ static int soc15_asic_baco_reset(struct amdgpu_device *adev)
 
 	if (is_support_sw_smu(adev)) {
 		struct smu_context *smu = &adev->smu;
+		int ret;
 
-		if (smu_baco_reset(smu))
-			return -EIO;
+		ret = smu_baco_enter(smu);
+		if (ret)
+			return ret;
+
+		ret = smu_baco_exit(smu);
+		if (ret)
+			return ret;
 	} else {
 		void *pp_handle = adev->powerplay.pp_handle;
 		const struct amd_pm_funcs *pp_funcs = adev->powerplay.pp_funcs;
diff --git a/drivers/gpu/drm/amd/powerplay/amdgpu_smu.c b/drivers/gpu/drm/amd/powerplay/amdgpu_smu.c
index 753c1afcfaa3..356be22910db 100644
--- a/drivers/gpu/drm/amd/powerplay/amdgpu_smu.c
+++ b/drivers/gpu/drm/amd/powerplay/amdgpu_smu.c
@@ -2428,14 +2428,28 @@ int smu_baco_get_state(struct smu_context *smu, enum smu_baco_state *state)
 	return 0;
 }
 
-int smu_baco_reset(struct smu_context *smu)
+int smu_baco_enter(struct smu_context *smu)
 {
 	int ret = 0;
 
 	mutex_lock(&smu->mutex);
 
-	if (smu->ppt_funcs->baco_reset)
-		ret = smu->ppt_funcs->baco_reset(smu);
+	if (smu->ppt_funcs->baco_enter)
+		ret = smu->ppt_funcs->baco_enter(smu);
+
+	mutex_unlock(&smu->mutex);
+
+	return ret;
+}
+
+int smu_baco_exit(struct smu_context *smu)
+{
+	int ret = 0;
+
+	mutex_lock(&smu->mutex);
+
+	if (smu->ppt_funcs->baco_exit)
+		ret = smu->ppt_funcs->baco_exit(smu);
 
 	mutex_unlock(&smu->mutex);
 
diff --git a/drivers/gpu/drm/amd/powerplay/arcturus_ppt.c b/drivers/gpu/drm/amd/powerplay/arcturus_ppt.c
index 58c7c4a3053e..f251e402147c 100644
--- a/drivers/gpu/drm/amd/powerplay/arcturus_ppt.c
+++ b/drivers/gpu/drm/amd/powerplay/arcturus_ppt.c
@@ -2156,7 +2156,8 @@ static const struct pptable_funcs arcturus_ppt_funcs = {
 	.baco_is_support= smu_v11_0_baco_is_support,
 	.baco_get_state = smu_v11_0_baco_get_state,
 	.baco_set_state = smu_v11_0_baco_set_state,
-	.baco_reset = smu_v11_0_baco_reset,
+	.baco_enter = smu_v11_0_baco_enter,
+	.baco_exit = smu_v11_0_baco_exit,
 	.get_dpm_ultimate_freq = smu_v11_0_get_dpm_ultimate_freq,
 	.set_soft_freq_limited_range = smu_v11_0_set_soft_freq_limited_range,
 	.override_pcie_parameters = smu_v11_0_override_pcie_parameters,
diff --git a/drivers/gpu/drm/amd/powerplay/inc/amdgpu_smu.h b/drivers/gpu/drm/amd/powerplay/inc/amdgpu_smu.h
index 999445c5c010..725acd6d5e00 100644
--- a/drivers/gpu/drm/amd/powerplay/inc/amdgpu_smu.h
+++ b/drivers/gpu/drm/amd/powerplay/inc/amdgpu_smu.h
@@ -542,7 +542,8 @@ struct pptable_funcs {
 	bool (*baco_is_support)(struct smu_context *smu);
 	enum smu_baco_state (*baco_get_state)(struct smu_context *smu);
 	int (*baco_set_state)(struct smu_context *smu, enum smu_baco_state state);
-	int (*baco_reset)(struct smu_context *smu);
+	int (*baco_enter)(struct smu_context *smu);
+	int (*baco_exit)(struct smu_context *smu);
 	int (*mode2_reset)(struct smu_context *smu);
 	int (*get_dpm_ultimate_freq)(struct smu_context *smu, enum smu_clk_type clk_type, uint32_t *min, uint32_t *max);
 	int (*set_soft_freq_limited_range)(struct smu_context *smu, enum smu_clk_type clk_type, uint32_t min, uint32_t max);
@@ -624,7 +625,8 @@ bool smu_baco_is_support(struct smu_context *smu);
 
 int smu_baco_get_state(struct smu_context *smu, enum smu_baco_state *state);
 
-int smu_baco_reset(struct smu_context *smu);
+int smu_baco_enter(struct smu_context *smu);
+int smu_baco_exit(struct smu_context *smu);
 
 int smu_mode2_reset(struct smu_context *smu);
 
diff --git a/drivers/gpu/drm/amd/powerplay/inc/smu_v11_0.h b/drivers/gpu/drm/amd/powerplay/inc/smu_v11_0.h
index 606149085683..5a277136f2aa 100644
--- a/drivers/gpu/drm/amd/powerplay/inc/smu_v11_0.h
+++ b/drivers/gpu/drm/amd/powerplay/inc/smu_v11_0.h
@@ -248,7 +248,8 @@ enum smu_baco_state smu_v11_0_baco_get_state(struct smu_context *smu);
 
 int smu_v11_0_baco_set_state(struct smu_context *smu, enum smu_baco_state state);
 
-int smu_v11_0_baco_reset(struct smu_context *smu);
+int smu_v11_0_baco_enter(struct smu_context *smu);
+int smu_v11_0_baco_exit(struct smu_context *smu);
 
 int smu_v11_0_get_dpm_ultimate_freq(struct smu_context *smu, enum smu_clk_type clk_type,
 						 uint32_t *min, uint32_t *max);
diff --git a/drivers/gpu/drm/amd/powerplay/navi10_ppt.c b/drivers/gpu/drm/amd/powerplay/navi10_ppt.c
index 14be350a6127..f843ecb09db6 100644
--- a/drivers/gpu/drm/amd/powerplay/navi10_ppt.c
+++ b/drivers/gpu/drm/amd/powerplay/navi10_ppt.c
@@ -2064,7 +2064,8 @@ static const struct pptable_funcs navi10_ppt_funcs = {
 	.baco_is_support= smu_v11_0_baco_is_support,
 	.baco_get_state = smu_v11_0_baco_get_state,
 	.baco_set_state = smu_v11_0_baco_set_state,
-	.baco_reset = smu_v11_0_baco_reset,
+	.baco_enter = smu_v11_0_baco_enter,
+	.baco_exit = smu_v11_0_baco_exit,
 	.get_dpm_ultimate_freq = smu_v11_0_get_dpm_ultimate_freq,
 	.set_soft_freq_limited_range = smu_v11_0_set_soft_freq_limited_range,
 	.override_pcie_parameters = smu_v11_0_override_pcie_parameters,
diff --git a/drivers/gpu/drm/amd/powerplay/smu_v11_0.c b/drivers/gpu/drm/amd/powerplay/smu_v11_0.c
index fc9679ea2368..6071510ed206 100644
--- a/drivers/gpu/drm/amd/powerplay/smu_v11_0.c
+++ b/drivers/gpu/drm/amd/powerplay/smu_v11_0.c
@@ -1688,7 +1688,7 @@ int smu_v11_0_baco_set_state(struct smu_context *smu, enum smu_baco_state state)
 	return ret;
 }
 
-int smu_v11_0_baco_reset(struct smu_context *smu)
+int smu_v11_0_baco_enter(struct smu_context *smu)
 {
 	int ret = 0;
 
@@ -1702,6 +1702,13 @@ int smu_v11_0_baco_reset(struct smu_context *smu)
 
 	msleep(10);
 
+	return ret;
+}
+
+int smu_v11_0_baco_exit(struct smu_context *smu)
+{
+	int ret = 0;
+
 	ret = smu_v11_0_baco_set_state(smu, SMU_BACO_STATE_EXIT);
 	if (ret)
 		return ret;
diff --git a/drivers/gpu/drm/amd/powerplay/vega20_ppt.c b/drivers/gpu/drm/amd/powerplay/vega20_ppt.c
index 0b4892833808..02ede5c8b73a 100644
--- a/drivers/gpu/drm/amd/powerplay/vega20_ppt.c
+++ b/drivers/gpu/drm/amd/powerplay/vega20_ppt.c
@@ -3257,7 +3257,8 @@ static const struct pptable_funcs vega20_ppt_funcs = {
 	.baco_is_support= smu_v11_0_baco_is_support,
 	.baco_get_state = smu_v11_0_baco_get_state,
 	.baco_set_state = smu_v11_0_baco_set_state,
-	.baco_reset = smu_v11_0_baco_reset,
+	.baco_enter = smu_v11_0_baco_enter,
+	.baco_exit = smu_v11_0_baco_exit,
 	.get_dpm_ultimate_freq = smu_v11_0_get_dpm_ultimate_freq,
 	.set_soft_freq_limited_range = smu_v11_0_set_soft_freq_limited_range,
 	.override_pcie_parameters = smu_v11_0_override_pcie_parameters,
-- 
2.23.0

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
