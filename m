Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 075CAFE38F
	for <lists+alsa-devel@lfdr.de>; Fri, 15 Nov 2019 18:03:32 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 96D161654;
	Fri, 15 Nov 2019 18:02:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 96D161654
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1573837411;
	bh=KuratARjzKe0pvIVGBK9eyxxFKVw7ZyksdLtzjtpA9w=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WrnyHFajrzgGQHzdpKwTt27phwktSZHoIxevUf6u5Q9fUwZKrw9s3oIWqOXSIAc7+
	 lU9saJXY40TNyIsUqecdhvr5IWE9I9HeNkBHe83ENck6Vs3c4moZemVOdK7PYAQsjk
	 TtxXPuWGUvSYLFMXWNy1Cn/cHA+mS2IcgzHxFVco=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8BE1DF80255;
	Fri, 15 Nov 2019 17:51:39 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 36016F8014D; Fri, 15 Nov 2019 17:51:24 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com
 [IPv6:2607:f8b0:4864:20::742])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0EC3AF80115
 for <alsa-devel@alsa-project.org>; Fri, 15 Nov 2019 17:51:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0EC3AF80115
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="s31EjNVK"
Received: by mail-qk1-x742.google.com with SMTP id q70so8598500qke.12
 for <alsa-devel@alsa-project.org>; Fri, 15 Nov 2019 08:51:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=V7ZdfhhqdvYJzhCUEQRl60vWylsE5pgMI3gw5YsZa2o=;
 b=s31EjNVKITptRLLAnfHSu6VI0DABHc+xMC74IW3G268jvgR1XGBshIJY5HKb3ibxMt
 nwte8o8PoXk5Z+0MXyyAUh6AuTrCth2peOzPXmLPeKULj4niZYJdc3Khmv6J7jZ6eW/A
 sQcaVwRbP6Der9ST0BsH1TTkj12KZBi/2FwMeVCHyUTi7NeJTue4px0yLxN3BnvwP3Mm
 UpptW9Ar3Dk69xs+lxpam9tjqdryoBs+tNE0ofENXslypZDC5kuRZZp7Be49sFFjpcgR
 NIgPubxf//GLXtQq9b/D0RVs0YhwIdCIv+gNVs+yLcVy1J//9SfvUvSGeNW84/F03LM/
 dmVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=V7ZdfhhqdvYJzhCUEQRl60vWylsE5pgMI3gw5YsZa2o=;
 b=Iz/zdAvekSZLAfBlyl45NDWYvbN3D+iFZxvWlm9vAYyz+kv1CqesQLl/cQjUJ1v+8I
 GSJE8mx4BOQayoqnBqZ6dBxDn6rtfhRldCq4pURVrSTUL54uMNg1bZ1kWMlXGo7cAFDc
 RRqpGgIVdkIHwXHyrYWzCR1J5TOqdXq50q5zCuA8YEPoCq1+jCOgd7mtwcSl84BiLHPy
 AHMqDYbPtWKMxprdXWjOVK5+11q3GEmRpdylFQ+U2rOhZ/Bw8P7hDyhcRY32NZwQUaIr
 QnHcvF99MoQysNrpGrpJENqp+xihDNjqBdpiv6hAPsAkV2I7pwLDgf/XxhwgBVg2vXlv
 6i5A==
X-Gm-Message-State: APjAAAURY2nAqEOtMGuh88a59JNAiYy2Fm0jQRzRiJkpMTE1cAkvQDU3
 bCnz4Qq2Z9/cb8XuFEpfyxA=
X-Google-Smtp-Source: APXvYqzcIhdVc4bJywDxYq7AVOgx9WVhow/n3VbrTO6LuUdTpb4ti05PVMegwqt4WObHkVwB0Ce9iw==
X-Received: by 2002:ae9:e649:: with SMTP id x9mr5286432qkl.220.1573836662861; 
 Fri, 15 Nov 2019 08:51:02 -0800 (PST)
Received: from localhost.localdomain ([71.219.59.120])
 by smtp.gmail.com with ESMTPSA id r29sm5610331qtb.63.2019.11.15.08.51.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Nov 2019 08:51:02 -0800 (PST)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org, alsa-devel@alsa-project.org, tiwai@suse.de,
 lukas@wunner.de
Date: Fri, 15 Nov 2019 11:50:34 -0500
Message-Id: <20191115165038.56646-17-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191115165038.56646-1-alexander.deucher@amd.com>
References: <20191115165038.56646-1-alexander.deucher@amd.com>
MIME-Version: 1.0
Cc: Alex Deucher <alexander.deucher@amd.com>, Evan Quan <evan.quan@amd.com>
Subject: [alsa-devel] [PATCH 16/20] drm/amdgpu/runpm: enable runpm on baco
	capable VI+ asics (v2)
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

Works reliably on VI, vega.

v2: don't enable on navi yet.

Reviewed-by: Evan Quan <evan.quan@amd.com> (v1)
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
index 169db941f933..0c122ff2a7d0 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
@@ -170,10 +170,15 @@ int amdgpu_driver_load_kms(struct drm_device *dev, unsigned long flags)
 	}
 
 	if (amdgpu_device_supports_boco(dev) &&
-	    (amdgpu_runtime_pm != 0)) /* enable runpm by default */
+	    (amdgpu_runtime_pm != 0)) /* enable runpm by default for boco */
 		adev->runpm = true;
 	else if (amdgpu_device_supports_baco(dev) &&
-		 (amdgpu_runtime_pm > 0)) /* enable runpm if runpm=1 */
+		 (amdgpu_runtime_pm != 0) &&
+		 (adev->asic_type >= CHIP_TOPAZ) &&
+		 (adev->asic_type <= CHIP_VEGA20)) /* enable runpm by default on VI, vega */
+		adev->runpm = true;
+	else if (amdgpu_device_supports_baco(dev) &&
+		 (amdgpu_runtime_pm > 0))  /* enable runpm if runpm=1 on CI, NV */
 		adev->runpm = true;
 
 	/* Call ACPI methods: require modeset init
-- 
2.23.0

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
