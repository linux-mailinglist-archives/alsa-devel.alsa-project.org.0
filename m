Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E3C8E7BC4
	for <lists+alsa-devel@lfdr.de>; Mon, 28 Oct 2019 22:50:01 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0996F210F;
	Mon, 28 Oct 2019 22:49:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0996F210F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1572299401;
	bh=4bOpKsDunx6gRMRya0TNpJXfbotI3cVR7OIxSV0UHWo=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JduGnD2vE+ec3PFDgALqdp3OYn2Owg37YQdMTIsZvQxF/WmLF1MYlXV/PSuNx7k+L
	 Y5oo/q9+qV7/akp1pi8pjT+kla+a9dE2CKsdUzf9bkyvRojsgJrOaGAQXrnOEVOZl6
	 3UC5UNwEvu0c80djoYzlvygo6qFvQUDcCbKoEskI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3DF74F80679;
	Mon, 28 Oct 2019 22:43:25 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7E10AF80677; Mon, 28 Oct 2019 22:43:22 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-yb1-xb42.google.com (mail-yb1-xb42.google.com
 [IPv6:2607:f8b0:4864:20::b42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AC180F8064C
 for <alsa-devel@alsa-project.org>; Mon, 28 Oct 2019 22:43:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AC180F8064C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="XK5fSFBf"
Received: by mail-yb1-xb42.google.com with SMTP id w5so4393131ybs.11
 for <alsa-devel@alsa-project.org>; Mon, 28 Oct 2019 14:43:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=eXNIgNyIpKliPo5bixSq8PM86XlU7yVh3tY4R/mkD0Y=;
 b=XK5fSFBfdmb8SL5KSu2rHXfGvpYnW2a8k1+P6yi0MLg27S0AZ8BqUg+o3nUjjRmCvq
 oAQXpImnvXAbetX09xtK6xYpI2sT5UWfCYvMyxHYLwMX83f3GfIqcRBS8CcTCp4e0LCw
 ecHt/KpUDGH018DRYRRfo8iiL2OuzQjlPDK1mlFeHlKeWYueAMCJVxrkGlbwrX1HdGCm
 KTVtJx+3Fr9qziE53Mu3FgOYIhxq6BNWi8n3/C6NMDtlwKJ75WoVGLb1cYgi54uMDlbW
 ZwcbGPdHmuq/KL94utBTap6El9H4BEBI2jOhc3MVez2AzA4NnRzxhIuN47RK6f6nZMIn
 u9aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=eXNIgNyIpKliPo5bixSq8PM86XlU7yVh3tY4R/mkD0Y=;
 b=EUL40BL05bt2dso5hFnP7f1KOwqyffZhPBakKY8+KIWOKvGcJ/cz69s99rh3tbb1kn
 9WXsBPw6FoKBM/0fyM05ibZVAAdTKhtY4Z7VQ1H8flthF7PAioU2ayTKeX8EOwta2P2B
 Jl8p5JtDJfZ0nw+SkDE/QZxp7EQPL6vyArlAcqeyDxRpZz6+B1GJgEVfKse/mMQ9tpvZ
 0nzSrmowno3CzOq2OAcq8sDKgdlo+NkD0JKboHL4SzhDBlF8ldReRRK7TaCEU6x6F9kY
 2ejP3Nt7ebXwKuEWNO2NAZOnp1Hlqde4607IzV4jJEwKUnuFGgaP7807Huu0zzsm3f4x
 XTng==
X-Gm-Message-State: APjAAAUGK+WXay51mOcDhZ0s2FNsW4K5NrLsLP0ODi8a/D3eROZIBTi1
 o3lv5K+0WHuP9X1uS5O/Fb4=
X-Google-Smtp-Source: APXvYqzNT7GEIPMtaSo6h4t8I/mdhjZDjJNV67RaEbCP5CY5SYQfPt9+Q7xGW8BazMPUyayh6R3RKg==
X-Received: by 2002:a25:ef07:: with SMTP id g7mr15226083ybd.393.1572298994763; 
 Mon, 28 Oct 2019 14:43:14 -0700 (PDT)
Received: from tr4.amd.com (atlvpn.amd.com. [165.204.84.11])
 by smtp.gmail.com with ESMTPSA id l68sm3421090ywf.95.2019.10.28.14.43.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Oct 2019 14:43:14 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org, alsa-devel@alsa-project.org, tiwai@suse.de,
 lukas@wunner.de
Date: Mon, 28 Oct 2019 17:42:03 -0400
Message-Id: <20191028214216.1508370-9-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191028214216.1508370-1-alexander.deucher@amd.com>
References: <20191028214216.1508370-1-alexander.deucher@amd.com>
MIME-Version: 1.0
Cc: Alex Deucher <alexander.deucher@amd.com>, Evan Quan <evan.quan@amd.com>
Subject: [alsa-devel] [PATCH 08/21] drm/amdgpu: add a
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
index 00cc43f74be1..8bdaf1c784e5 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
@@ -1139,6 +1139,7 @@ void amdgpu_device_program_register_sequence(struct amdgpu_device *adev,
 					     const u32 array_size);
 
 bool amdgpu_device_is_px(struct drm_device *dev);
+bool amdgpu_device_supports_baco(struct drm_device *dev);
 bool amdgpu_device_is_peer_accessible(struct amdgpu_device *adev,
 				      struct amdgpu_device *peer_adev);
 
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
index 4eee40b9d0b0..85357bd2863e 100644
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
