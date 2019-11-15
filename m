Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F308FE37A
	for <lists+alsa-devel@lfdr.de>; Fri, 15 Nov 2019 17:57:57 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2CBA7167E;
	Fri, 15 Nov 2019 17:57:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2CBA7167E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1573837077;
	bh=rV72SkeKdJV0OAeAiqUPwTy7iGhr3YWeS/wtd+3SjFs=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=GA06KBceDiTFtVfcUtXDIN33GzO+hODv1EqJmgme8JGoy2zyCJJou2Mv1K72/0do2
	 iyXCwUEzGYmrINyMVGam2YyBPPTOeRdxc6STrPG3Hs7aMUKAl3NtLVqHrSB9GvoRgk
	 NFGHtKJb4R5bzmvGyrwLZDg2Wba4jFE4TNiku1Ms=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 621FCF8014F;
	Fri, 15 Nov 2019 17:51:28 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CAFAEF80119; Fri, 15 Nov 2019 17:51:04 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com
 [IPv6:2607:f8b0:4864:20::842])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1CD44F80105
 for <alsa-devel@alsa-project.org>; Fri, 15 Nov 2019 17:50:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1CD44F80105
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="R55PFBxt"
Received: by mail-qt1-x842.google.com with SMTP id t8so11476725qtc.6
 for <alsa-devel@alsa-project.org>; Fri, 15 Nov 2019 08:50:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5GDdrlMnmxrNIgQKGRo4dG3+0quYy3Sx5zwE/LC5HRo=;
 b=R55PFBxt0+70cTo2vVEQTNYlUs/t5UiY9yRKqaOpvjP/A6F7uWAPB7xxqiSmAyaTt2
 IbqAF/v8/jMYoHYAJjXQHX2xiPwB54nkIJ7IpFn33cT5UYmonUs/fV9lfbDQem+sSxNU
 NQ2AG4gYdAYiYxWyU7WbTmJalKAdplf78jId8bF5g1fXZzf+pnXc203ojiFhQ1HvPRmh
 S9GaZR7yDFCEubK8mdvhLzM1SNobH8bgPAblWP+nx/0lW8Vm4yvZEqH5sVva0jpDL0sD
 wJl9tI4w+rfSHOgv18uKfsZD18lFdZnkarsA78rxdXP7/qxBhWGUPvzVrT6HC1h6rb0Z
 2NMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5GDdrlMnmxrNIgQKGRo4dG3+0quYy3Sx5zwE/LC5HRo=;
 b=ZbHyFG//tG1+hF/DwwV32DwraTmTs3FM4xHVpW+9IUlNgRBa88Ek3NxYGd9RwufeJS
 hMLCp/9NXBXOflxn6V+xY8JwFf9WdL9iZ1eaDyxoY2+PjdoHLZCFjjvc+3WMTskQdMdh
 DQ8B/wNMlKeQpT5gjzww71ojYewQh4g8Ms+f1j6yZks+DZVwX/LJk3+2o6C/Iiaf++Go
 caZb6/ejTv/HOy934ax+9mRYptLmWEuc5hZJFU1ezDRJWWLhPyBmAnS+JNV7dKnZ2DjW
 Dhn3eNKh5pb0hNKSd6et3oWCL6Hy62wW/qJ24uWYdFDUCqrsNtbQgPLN01D1S99pv+Xb
 CyHQ==
X-Gm-Message-State: APjAAAXdtwygJSzfUqL3ZRZZkiIY1LLd5TvPBuY0lLBIgPcfb1fGl3FB
 cZPHKa0D+pjSE/JQa5AtkSw=
X-Google-Smtp-Source: APXvYqwJvVpkUdtzPqhxIDkA7Ck3K7idIqSlwZ+EpI4czsgrEr9ZCFt4OnnGDUPaXOpTBMVSVCpnnA==
X-Received: by 2002:ac8:3597:: with SMTP id k23mr14757208qtb.195.1573836654139; 
 Fri, 15 Nov 2019 08:50:54 -0800 (PST)
Received: from localhost.localdomain ([71.219.59.120])
 by smtp.gmail.com with ESMTPSA id r29sm5610331qtb.63.2019.11.15.08.50.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Nov 2019 08:50:53 -0800 (PST)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org, alsa-devel@alsa-project.org, tiwai@suse.de,
 lukas@wunner.de
Date: Fri, 15 Nov 2019 11:50:25 -0500
Message-Id: <20191115165038.56646-8-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191115165038.56646-1-alexander.deucher@amd.com>
References: <20191115165038.56646-1-alexander.deucher@amd.com>
MIME-Version: 1.0
Cc: Alex Deucher <alexander.deucher@amd.com>, Evan Quan <evan.quan@amd.com>
Subject: [alsa-devel] [PATCH 07/20] drm/amdgpu: add a
	amdgpu_device_supports_baco helper
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

To check if a device supports BACO or not.  This will be
used in determining when to enable runtime pm.

Reviewed-by: Evan Quan <evan.quan@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu.h        |  1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 15 +++++++++++++++
 2 files changed, 16 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
index d951907980b1..6bc73fbd49fa 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
@@ -1142,6 +1142,7 @@ void amdgpu_device_program_register_sequence(struct amdgpu_device *adev,
 					     const u32 array_size);
 
 bool amdgpu_device_is_px(struct drm_device *dev);
+bool amdgpu_device_supports_baco(struct drm_device *dev);
 bool amdgpu_device_is_peer_accessible(struct amdgpu_device *adev,
 				      struct amdgpu_device *peer_adev);
 
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
index 85c024b74d6d..e6dfc246e621 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
@@ -154,6 +154,21 @@ bool amdgpu_device_is_px(struct drm_device *dev)
 	return false;
 }
 
+/**
+ * amdgpu_device_supports_baco - Does the device support BACO
+ *
+ * @dev: drm_device pointer
+ *
+ * Returns true if the device supporte BACO,
+ * otherwise return false.
+ */
+bool amdgpu_device_supports_baco(struct drm_device *dev)
+{
+	struct amdgpu_device *adev = dev->dev_private;
+
+	return amdgpu_asic_supports_baco(adev);
+}
+
 /**
  * VRAM access helper functions.
  *
-- 
2.23.0

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
