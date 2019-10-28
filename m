Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A379EE7BC8
	for <lists+alsa-devel@lfdr.de>; Mon, 28 Oct 2019 22:51:26 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 371C0215E;
	Mon, 28 Oct 2019 22:50:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 371C0215E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1572299486;
	bh=a/NacdpNWTgqZprS2ERTTCw3jp8kc3l/7/2HkZXUKr0=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=vTqmKbsPR7y/lSGZ6dQa2enWvAE6RUEnvjHhwRMvaeHubmPwPrNrFrjjnpOhn0Ogo
	 Y2gO2mtvr+Crv4jYGeSaWjp0mRiUV6kIv4nW4fqp3yG3fv51IwJu9yrdHiEHAXqKz8
	 P+czqDG6FDNdLTkewfXzMYA7ACWj/jsQ0YPdxN54=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 51D0FF806F7;
	Mon, 28 Oct 2019 22:43:35 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7A976F806E9; Mon, 28 Oct 2019 22:43:32 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-yw1-xc2b.google.com (mail-yw1-xc2b.google.com
 [IPv6:2607:f8b0:4864:20::c2b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 879C6F8067B
 for <alsa-devel@alsa-project.org>; Mon, 28 Oct 2019 22:43:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 879C6F8067B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="dE9yzHvG"
Received: by mail-yw1-xc2b.google.com with SMTP id d192so4377764ywa.1
 for <alsa-devel@alsa-project.org>; Mon, 28 Oct 2019 14:43:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ulQ4alMl7WFyMasL0IglumkICE486CP2se1fq7FCWe8=;
 b=dE9yzHvGRhfc1ZmySfGurWSjpXg9V1NKdgy3jViFdx7fX/1q2pvpavCQg06tHtEnEX
 x7jHgHfBOoA+mrLgi5DWXabV38I9Tttwnq7oy4ydsp4KFdpZ8iL14rUPRXC3S9n7Pew1
 JAvS6WRLmL1sOtg5RiXANb8yb54e/A1X1zi2q4DQzsCuQuT7/M2+wa7i7Q7KQTvU5XMm
 SUr+G5mofq9o0yPIEigw3O6d/ZHNtzxS02nUEJJh01W2v43iNSi1ojAjE2GbdcV3eSoN
 c77frGFv1UzGySFY99xO/hBzNlptESXiLBEQAFYzvMrpSouJLYqwBscCSY5PG4OkP1TS
 DYeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ulQ4alMl7WFyMasL0IglumkICE486CP2se1fq7FCWe8=;
 b=jtx82Bt74smdod86Fp2BBIjrYh63tlqrRe88YZR25K1JOxYeUJIAuqQ/PfPtlmTtyM
 On7g1/8EP7DCV3RnOba0mOJFAgZPCmdk+qPD4XOJTCq99kSpNn5IMLQmN0weq0TEAGRB
 MpIUzrqf3krXTH4VxX78dMQbhNnNHCFls1nxhp+L3KVWnIVK+u5kQWD100Yplv39mxkr
 jYi09yav4MXRGT6oQNLH+dWPhYE6zc1beQgzG9JWD4EXVLmsDa9th8i/jd+1jV2sk19M
 +tqqDVUlb5Qlnk56R557JDCX9RbAdOO2bPqTIA7bI3pw1Y6RgXKCJHZM42jlP+CAy9IM
 1nmw==
X-Gm-Message-State: APjAAAXALCNvlfcZwgqfo/d5CrCnHCsVVPFYn42yzRHgfAOqyRh0R8pZ
 bjFsiwkoi1NCPZzq554uBWA=
X-Google-Smtp-Source: APXvYqy/BpXu/jxSIhtC2AZGs0ZBbujt4yvjd3kepC4GcuGw/eltz8UdVPWGHiibHdtyQfvi9jD/+g==
X-Received: by 2002:a81:8282:: with SMTP id
 s124mr14627556ywf.498.1572299007606; 
 Mon, 28 Oct 2019 14:43:27 -0700 (PDT)
Received: from tr4.amd.com (atlvpn.amd.com. [165.204.84.11])
 by smtp.gmail.com with ESMTPSA id l68sm3421090ywf.95.2019.10.28.14.43.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Oct 2019 14:43:26 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org, alsa-devel@alsa-project.org, tiwai@suse.de,
 lukas@wunner.de
Date: Mon, 28 Oct 2019 17:42:06 -0400
Message-Id: <20191028214216.1508370-12-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191028214216.1508370-1-alexander.deucher@amd.com>
References: <20191028214216.1508370-1-alexander.deucher@amd.com>
MIME-Version: 1.0
Cc: Alex Deucher <alexander.deucher@amd.com>, Evan Quan <evan.quan@amd.com>
Subject: [alsa-devel] [PATCH 11/21] drm/amdgpu: split swSMU baco_reset into
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
index e88e9b9edcbb..9af6b8645851 100644
--- a/drivers/gpu/drm/amd/amdgpu/nv.c
+++ b/drivers/gpu/drm/amd/amdgpu/nv.c
@@ -332,7 +332,12 @@ static int nv_asic_reset(struct amdgpu_device *adev)
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
index 976584a47758..16c5bb75889f 100644
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
index 4e468b0272c3..43a81640e672 100644
--- a/drivers/gpu/drm/amd/powerplay/amdgpu_smu.c
+++ b/drivers/gpu/drm/amd/powerplay/amdgpu_smu.c
@@ -2413,14 +2413,28 @@ int smu_baco_get_state(struct smu_context *smu, enum smu_baco_state *state)
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
index 3099ac256bd3..b75efdee1672 100644
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
index 8120e7587585..ae85a9f0184f 100644
--- a/drivers/gpu/drm/amd/powerplay/inc/amdgpu_smu.h
+++ b/drivers/gpu/drm/amd/powerplay/inc/amdgpu_smu.h
@@ -543,7 +543,8 @@ struct pptable_funcs {
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
index abd4debb3def..0acc33435838 100644
--- a/drivers/gpu/drm/amd/powerplay/inc/smu_v11_0.h
+++ b/drivers/gpu/drm/amd/powerplay/inc/smu_v11_0.h
@@ -240,7 +240,8 @@ enum smu_baco_state smu_v11_0_baco_get_state(struct smu_context *smu);
 
 int smu_v11_0_baco_set_state(struct smu_context *smu, enum smu_baco_state state);
 
-int smu_v11_0_baco_reset(struct smu_context *smu);
+int smu_v11_0_baco_enter(struct smu_context *smu);
+int smu_v11_0_baco_exit(struct smu_context *smu);
 
 int smu_v11_0_get_dpm_ultimate_freq(struct smu_context *smu, enum smu_clk_type clk_type,
 						 uint32_t *min, uint32_t *max);
diff --git a/drivers/gpu/drm/amd/powerplay/navi10_ppt.c b/drivers/gpu/drm/amd/powerplay/navi10_ppt.c
index 769f9451d904..40bcbabc3503 100644
--- a/drivers/gpu/drm/amd/powerplay/navi10_ppt.c
+++ b/drivers/gpu/drm/amd/powerplay/navi10_ppt.c
@@ -1738,7 +1738,8 @@ static const struct pptable_funcs navi10_ppt_funcs = {
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
index bbb74b1d5d80..aae40db43383 100644
--- a/drivers/gpu/drm/amd/powerplay/smu_v11_0.c
+++ b/drivers/gpu/drm/amd/powerplay/smu_v11_0.c
@@ -1655,7 +1655,7 @@ int smu_v11_0_baco_set_state(struct smu_context *smu, enum smu_baco_state state)
 	return ret;
 }
 
-int smu_v11_0_baco_reset(struct smu_context *smu)
+int smu_v11_0_baco_enter(struct smu_context *smu)
 {
 	int ret = 0;
 
@@ -1669,6 +1669,13 @@ int smu_v11_0_baco_reset(struct smu_context *smu)
 
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
index 7c8933f987d1..b6030b809043 100644
--- a/drivers/gpu/drm/amd/powerplay/vega20_ppt.c
+++ b/drivers/gpu/drm/amd/powerplay/vega20_ppt.c
@@ -3258,7 +3258,8 @@ static const struct pptable_funcs vega20_ppt_funcs = {
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
