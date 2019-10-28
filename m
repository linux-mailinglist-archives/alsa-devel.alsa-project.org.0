Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 41607E7BD3
	for <lists+alsa-devel@lfdr.de>; Mon, 28 Oct 2019 22:55:34 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CE423218D;
	Mon, 28 Oct 2019 22:54:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CE423218D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1572299733;
	bh=4kr28zpWnRjtt/jPA9gzayrzBgjQ8iYGAf5PEt3TmUU=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=lZQp9zJdU/E/OUsKjF7HxcMwHSYwhKL2DS8w7FkDHpy81VZtdk489yZoVJ0vSgWfy
	 JIihiAwwzd1v2pQ2Oman1hM30ry9pjClACLw3gDrJqEtVvwYJR9mxrB5hNHvUqTQjf
	 rJuy2TLCSYkRdRiuWFLPw9TI3tyJKgNCZTYzU/0A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3C9E5F8075A;
	Mon, 28 Oct 2019 22:43:57 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F1485F803D6; Mon, 28 Oct 2019 22:43:54 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-yw1-xc42.google.com (mail-yw1-xc42.google.com
 [IPv6:2607:f8b0:4864:20::c42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0636EF80746
 for <alsa-devel@alsa-project.org>; Mon, 28 Oct 2019 22:43:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0636EF80746
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="kBLTSpiQ"
Received: by mail-yw1-xc42.google.com with SMTP id x65so4344743ywf.12
 for <alsa-devel@alsa-project.org>; Mon, 28 Oct 2019 14:43:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=sLZv/CpuD8SdrFw1dTNsk2ZH8m7VrrvAw9kvrx3mH4g=;
 b=kBLTSpiQtXzshubpKqmIpczcHXjdKsrYZ2D8DjPJ9xI6U69JPebobKSOb1PkJLxYjD
 vhCfFRsUlnDff45at+9jQEYs180/UBlg9FTV4NN1rE/F5SGiO94PYrcZg6E7yNLWp5b7
 LZGkNXKJ/g3HUmhHk5h1sjt9XtmNUZBdUwfB4H6lfU3OY1xG15z/SkGBInsjR4PH1WCY
 3xP+vOJ3LGt6b7kjhjAt+x5pZJykygE8/qjEtTjHBnJRZ0khbBhJx2b74oYAedTbr0fd
 ao4y4MU0quqYnVAnk7N3jjy5twXAIrv32Q75lAxH+CjQua8Nn+nkXvPcg7qicTBxO5HX
 zZcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=sLZv/CpuD8SdrFw1dTNsk2ZH8m7VrrvAw9kvrx3mH4g=;
 b=RED6xYokRnjaKXrCTcsOmTUI6D29Bj84y9ia1c3s0geWGNleGHlfJEwq7eNUbH54Pa
 0UrVgDrnI5x7KEPUOCfQfYfHr/qGkC/GRFcjmFevS4Wy5zJdSB8lSO1uQg/bGzGYha9t
 VBqmb4mJxPty/RYigl95Gg7Ck9JPJMyDDI9RLwp8x5eho/um0EUQcDwlgiym1x2Mx68W
 1IO5EfWZdiA+7FlZfk99xoFIeprL5xT8HscpwBHoC05NrbkhZPWSDOhn1UXwsGSRXHam
 tD7KoEKKgt4BwLG8y7+b7OwGbk0TNhAXew6iCZTwDE4Kj/47Yi1qYpMKe/oCp/LQKqEb
 +9tw==
X-Gm-Message-State: APjAAAUJf/mTEGeT3HdDNDlOLYD+zQEh2j9AScK0OeB3eL+y6yDEFFoA
 kgpFGmUdKMm5qUZLrIK1iqU=
X-Google-Smtp-Source: APXvYqzRIyqfLPGXVdM7ZBXjdu0HqWhPy+sLZ/zEaEtvpjA/z6ITj1KQI9opSALskUvXCy/zI20gZQ==
X-Received: by 2002:a0d:ca0e:: with SMTP id m14mr14477793ywd.292.1572299030774; 
 Mon, 28 Oct 2019 14:43:50 -0700 (PDT)
Received: from tr4.amd.com (atlvpn.amd.com. [165.204.84.11])
 by smtp.gmail.com with ESMTPSA id l68sm3421090ywf.95.2019.10.28.14.43.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Oct 2019 14:43:50 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org, alsa-devel@alsa-project.org, tiwai@suse.de,
 lukas@wunner.de
Date: Mon, 28 Oct 2019 17:42:11 -0400
Message-Id: <20191028214216.1508370-17-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191028214216.1508370-1-alexander.deucher@amd.com>
References: <20191028214216.1508370-1-alexander.deucher@amd.com>
MIME-Version: 1.0
Cc: Alex Deucher <alexander.deucher@amd.com>, Evan Quan <evan.quan@amd.com>
Subject: [alsa-devel] [PATCH 16/21] drm/amdgpu: enable runtime pm on BACO
	capable boards if runpm=1
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

Everything is in place now.  Not enabled by default yet.  You
still have to specify runpm=1.

Reviewed-by: Evan Quan <evan.quan@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
index 06dae1de71d0..cdb9b1caa962 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
@@ -157,10 +157,6 @@ int amdgpu_driver_load_kms(struct drm_device *dev, unsigned long flags)
 	    !pci_is_thunderbolt_attached(dev->pdev))
 		flags |= AMD_IS_PX;
 
-	if ((amdgpu_runtime_pm != 0) &&
-	    (flags & AMD_IS_PX))
-		adev->runpm = true;
-
 	/* amdgpu_device_init should report only fatal error
 	 * like memory allocation failure or iomapping failure,
 	 * or memory manager initialization failure, it must
@@ -173,6 +169,13 @@ int amdgpu_driver_load_kms(struct drm_device *dev, unsigned long flags)
 		goto out;
 	}
 
+	if (amdgpu_device_supports_boco(dev) &&
+	    (amdgpu_runtime_pm != 0)) /* enable runpm by default */
+		adev->runpm = true;
+	else if (amdgpu_device_supports_baco(dev) &&
+		 (amdgpu_runtime_pm > 0)) /* enable runpm if runpm=1 */
+		adev->runpm = true;
+
 	/* Call ACPI methods: require modeset init
 	 * but failure is not fatal
 	 */
-- 
2.23.0

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
