Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A9654FE378
	for <lists+alsa-devel@lfdr.de>; Fri, 15 Nov 2019 17:57:19 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4BEC71671;
	Fri, 15 Nov 2019 17:56:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4BEC71671
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1573837039;
	bh=e5VD/bVzB0lcRTUJoFRRcl+R11vYF6vuOpwADyBkJV4=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HvDH9hIlQel+pBv7wrvVAIEsmA9V+6FCkTIgt2/7ZFHWQmzIKqzNCT3ZTVuL4eEh+
	 R1oWSlAZFul9BV4w5XoSLZoMAGMYZNVQ06em5Ec8xykQfFoBgx1+ChBJzqi5d5DMEg
	 tcXleKxnFFqXoAJeMKizOLSFchGGk0+4YIcqletA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 15F73F8014C;
	Fri, 15 Nov 2019 17:51:27 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A4FCFF80122; Fri, 15 Nov 2019 17:51:04 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com
 [IPv6:2607:f8b0:4864:20::842])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 41AD0F80115
 for <alsa-devel@alsa-project.org>; Fri, 15 Nov 2019 17:50:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 41AD0F80115
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="NJcXJKk4"
Received: by mail-qt1-x842.google.com with SMTP id g50so11475131qtb.4
 for <alsa-devel@alsa-project.org>; Fri, 15 Nov 2019 08:50:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=EQdQrTTJ5P/B6GAAEN4PWeFdJlxrHUCbcOO/qZCkvxM=;
 b=NJcXJKk43iH8RFmomOiA9I8sguZGg4QRMxlvsW3Q2Y3Tt3QWbwGYp8JD7Qv9sxSglY
 A8VtjtXC8vBaiJB/rZsEyMiN8XuCpFAWHLkdAZ7UZEq0sxK6H/0WagnLQ5ejgB298UhC
 0Y84k2YcokIbbrmcw6Gl4trVX7oP0xnX8m1NvfmLBCIu2YJoZC7fH2GQC5EDUB3CfBfR
 K6wEaYRT3uDHRBxbUHMB0KQocUW4+oa9AQy5y/38x+nVf0TvKDI+e31Oq1mkkvLdXsuY
 nDYOg3G5lU1+kyrIMv5JUzpGhSheqhS3wPZW/DnBVY0ty9fDB2mh1vAdd7cLQIm8coKF
 xPLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=EQdQrTTJ5P/B6GAAEN4PWeFdJlxrHUCbcOO/qZCkvxM=;
 b=ZtMtxdb9L41j2Sy3yDbS/2fwpTNutecrnt74nqW3iP0DFYFCqP1m/wNmtY65GPXnMA
 QQOLZg60gbabw03GturrbKUqHiGHKHaT/qIx82nxGmFtK1LCe4FBgWH09YVOz0E2PuhU
 M2mVF7xc2ghdBcZuIZ2KEsUk1WTCQJQiPW4jxs6198fK2ApdbvFUFRiu9V8I1fQpqMK4
 CLG4ftZoq/OqKo9WOHSzFyvn6ZcwPYh6Zg8CB3n0itEhoft2ROCPTSCguO+vpPGGvMs4
 86HbmSsLNNFf1ZAoR1FSUP9lWwEe+Ewo5IQI4dEVvB8ViXDGK9PSaBG5h1OsfK6Sk6vx
 V54w==
X-Gm-Message-State: APjAAAU0OQhJeo6igQlDUbrUjOn+oqsiHSKDyJTeaD5AflxU+5rtCDXD
 SIuucwfXBj3wcThWHG3mVH4=
X-Google-Smtp-Source: APXvYqxBQVufszcXfXS99TznWZ5iAkouT0JVCO9WW+4ZpSkVGo50+4Eu2/MPHKQnMR9qcLQQR+qmqA==
X-Received: by 2002:ac8:4157:: with SMTP id e23mr14740321qtm.158.1573836658053; 
 Fri, 15 Nov 2019 08:50:58 -0800 (PST)
Received: from localhost.localdomain ([71.219.59.120])
 by smtp.gmail.com with ESMTPSA id r29sm5610331qtb.63.2019.11.15.08.50.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Nov 2019 08:50:57 -0800 (PST)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org, alsa-devel@alsa-project.org, tiwai@suse.de,
 lukas@wunner.de
Date: Fri, 15 Nov 2019 11:50:29 -0500
Message-Id: <20191115165038.56646-12-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191115165038.56646-1-alexander.deucher@amd.com>
References: <20191115165038.56646-1-alexander.deucher@amd.com>
MIME-Version: 1.0
Cc: Alex Deucher <alexander.deucher@amd.com>, Evan Quan <evan.quan@amd.com>
Subject: [alsa-devel] [PATCH 11/20] drm/amdgpu: add helpers for baco entry
	and exit
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

Will be used for runtime pm.  Entry will enter the BACO
state (chip off).  Exit will exit the BACO state (chip on).

Reviewed-by: Evan Quan <evan.quan@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu.h        |  2 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 61 ++++++++++++++++++++++
 2 files changed, 63 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
index 186135ea6033..64bc5771b34f 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
@@ -1145,6 +1145,8 @@ bool amdgpu_device_supports_boco(struct drm_device *dev);
 bool amdgpu_device_supports_baco(struct drm_device *dev);
 bool amdgpu_device_is_peer_accessible(struct amdgpu_device *adev,
 				      struct amdgpu_device *peer_adev);
+int amdgpu_device_baco_enter(struct drm_device *dev);
+int amdgpu_device_baco_exit(struct drm_device *dev);
 
 /* atpx handler */
 #if defined(CONFIG_VGA_SWITCHEROO)
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
index 45c196845497..7195ef83ddba 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
@@ -4299,3 +4299,64 @@ static void amdgpu_device_get_pcie_info(struct amdgpu_device *adev)
 	}
 }
 
+int amdgpu_device_baco_enter(struct drm_device *dev)
+{
+	struct amdgpu_device *adev = dev->dev_private;
+
+	if (!amdgpu_device_supports_baco(adev->ddev))
+		return -ENOTSUPP;
+
+	if (is_support_sw_smu(adev)) {
+		struct smu_context *smu = &adev->smu;
+		int ret;
+
+		ret = smu_baco_enter(smu);
+		if (ret)
+			return ret;
+
+		return 0;
+	} else {
+		void *pp_handle = adev->powerplay.pp_handle;
+		const struct amd_pm_funcs *pp_funcs = adev->powerplay.pp_funcs;
+
+		if (!pp_funcs ||!pp_funcs->get_asic_baco_state ||!pp_funcs->set_asic_baco_state)
+			return -ENOENT;
+
+		/* enter BACO state */
+		if (pp_funcs->set_asic_baco_state(pp_handle, 1))
+			return -EIO;
+
+		return 0;
+	}
+}
+
+int amdgpu_device_baco_exit(struct drm_device *dev)
+{
+	struct amdgpu_device *adev = dev->dev_private;
+
+	if (!amdgpu_device_supports_baco(adev->ddev))
+		return -ENOTSUPP;
+
+	if (is_support_sw_smu(adev)) {
+		struct smu_context *smu = &adev->smu;
+		int ret;
+
+		ret = smu_baco_exit(smu);
+		if (ret)
+			return ret;
+
+		return 0;
+	} else {
+		void *pp_handle = adev->powerplay.pp_handle;
+		const struct amd_pm_funcs *pp_funcs = adev->powerplay.pp_funcs;
+
+		if (!pp_funcs ||!pp_funcs->get_asic_baco_state ||!pp_funcs->set_asic_baco_state)
+			return -ENOENT;
+
+		/* exit BACO state */
+		if (pp_funcs->set_asic_baco_state(pp_handle, 0))
+			return -EIO;
+
+		return 0;
+	}
+}
-- 
2.23.0

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
