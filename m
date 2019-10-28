Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FBDDE7BCD
	for <lists+alsa-devel@lfdr.de>; Mon, 28 Oct 2019 22:53:27 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EF8D52172;
	Mon, 28 Oct 2019 22:52:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EF8D52172
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1572299607;
	bh=r/RONVSndOKt6Cie1F52vGXojWBQoaWoPzSU29FCHwU=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pzMvmmAENz3ZT4ltgDDuACZ5dCqUzWIbQfQLSFNcyXBLyNeOK8NdynKUWpcxPylEK
	 UO7Vu0yoMckCknVgScaVSThC/U8x7z5nM+L4fUdjmid0UXNfVltWaSCe03t7KK160T
	 Uu6GuxNOqhhzgaWFHZHWcC0WNGBv7fgD/8JeqR9E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 19F5BF80720;
	Mon, 28 Oct 2019 22:43:45 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3BA2AF8071F; Mon, 28 Oct 2019 22:43:42 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-yb1-xb43.google.com (mail-yb1-xb43.google.com
 [IPv6:2607:f8b0:4864:20::b43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 54E5AF8070E
 for <alsa-devel@alsa-project.org>; Mon, 28 Oct 2019 22:43:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 54E5AF8070E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="qET5lgYj"
Received: by mail-yb1-xb43.google.com with SMTP id c13so4047077ybq.3
 for <alsa-devel@alsa-project.org>; Mon, 28 Oct 2019 14:43:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=GJZAPAB9TzHoxM5Wh1v3IEaEGA/8F0zj5r6AgfYhfEs=;
 b=qET5lgYjfUo4xmVbpEMi/WTVGBgq/MjwXyLCGrzRWCaBU0eNJFg3fnLSYeCi6DDZnT
 m4XTvfe1aCH23/PCfdrhBbcGs4PXz7Qa4FCpffRzOSOM6/U+CnvGpAKEKqYqUU7mGP9J
 3/pfHEQLyPtFSFuYlWojFL71vpqK3SIaBG4rxjaapSEIq5aVRIV44xz0BDbUbd5I78qU
 2r710M8+gfApoB+8Q8qvZsOi2nU98h11zaaOYnbcHCMc6N+Aypl436d6WbNM9ZHnD9Bz
 t9WG3SWoKR7hCiVNCNIT6ES7VPnqrK7gDTjkdnTBn7/Vop9oTUxvhdaWPQu0/EXEZ7Np
 P2qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GJZAPAB9TzHoxM5Wh1v3IEaEGA/8F0zj5r6AgfYhfEs=;
 b=oA9yYS5ZtvkPukAaNx4MjmQ+JiuUY7IQsaIGMjdKDTf3Vls7fMl+61aAn5U86Fnl29
 q5hog3rZ/feZZj9OHYP/xgbDC7DbTImVm4/V/LVcU8vGY67AWMbflHF6iXnurqzL7e9H
 lR9eHjkkwzvs6t/hcR/njqRFDxxvl7vR4ClgNvCkCcA68QrfBk6Y33V23at6xu/XUYSj
 tj+rghU1rUmqD9qpljNaNtIgA9SDqBS6tSgI4B16rFwzqq/GT8iskTTG4pk6s/yuB3mK
 FubdVRH7H8Xt9Z4u8h7odZv7NMFhv7Il2nbX0IxPulBc+/iUUj0faxW8X6K7BfoMJ9Uq
 tTKA==
X-Gm-Message-State: APjAAAWkdPwJIb7d6PqW2wCTcibAsW15HEFZzz8z9qIZiBxMhiBBLgn6
 nM7KKNXIbPytI9jZAu2EUlA=
X-Google-Smtp-Source: APXvYqwISLLy2E0UUjwlfDLL2xxVlWWh9Gs5O5w8L2UXtcqu9Hvc3NrziwdR8Xo8DvRCWWhkPnzY0Q==
X-Received: by 2002:a25:7c7:: with SMTP id 190mr15918296ybh.24.1572299018037; 
 Mon, 28 Oct 2019 14:43:38 -0700 (PDT)
Received: from tr4.amd.com (atlvpn.amd.com. [165.204.84.11])
 by smtp.gmail.com with ESMTPSA id l68sm3421090ywf.95.2019.10.28.14.43.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Oct 2019 14:43:36 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org, alsa-devel@alsa-project.org, tiwai@suse.de,
 lukas@wunner.de
Date: Mon, 28 Oct 2019 17:42:08 -0400
Message-Id: <20191028214216.1508370-14-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191028214216.1508370-1-alexander.deucher@amd.com>
References: <20191028214216.1508370-1-alexander.deucher@amd.com>
MIME-Version: 1.0
Cc: Alex Deucher <alexander.deucher@amd.com>, Evan Quan <evan.quan@amd.com>
Subject: [alsa-devel] [PATCH 13/21] drm/amdgpu: add baco support to runtime
	suspend/resume
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

This adds the necessary support to the runtime suspend
and resume functions to handle boards that support
baco.

Reviewed-by: Evan Quan <evan.quan@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
index 7b8478d08b2b..849784e27a98 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
@@ -1164,7 +1164,8 @@ static int amdgpu_pmops_resume(struct device *dev)
 	struct drm_device *drm_dev = dev_get_drvdata(dev);
 
 	/* GPU comes up enabled by the bios on resume */
-	if (amdgpu_device_supports_boco(drm_dev)) {
+	if (amdgpu_device_supports_boco(drm_dev) ||
+	    amdgpu_device_supports_baco(drm_dev)) {
 		pm_runtime_disable(dev);
 		pm_runtime_set_active(dev);
 		pm_runtime_enable(dev);
@@ -1231,6 +1232,8 @@ static int amdgpu_pmops_runtime_suspend(struct device *dev)
 		else if (!amdgpu_has_atpx_dgpu_power_cntl())
 			pci_set_power_state(pdev, PCI_D3hot);
 		drm_dev->switch_power_state = DRM_SWITCH_POWER_DYNAMIC_OFF;
+	} else if (amdgpu_device_supports_baco(drm_dev)) {
+		amdgpu_device_baco_enter(drm_dev);
 	}
 
 	return 0;
@@ -1256,6 +1259,8 @@ static int amdgpu_pmops_runtime_resume(struct device *dev)
 		if (ret)
 			return ret;
 		pci_set_master(pdev);
+	} else if (amdgpu_device_supports_baco(drm_dev)) {
+		amdgpu_device_baco_exit(drm_dev);
 	}
 	ret = amdgpu_device_resume(drm_dev, false, false);
 	drm_kms_helper_poll_enable(drm_dev);
-- 
2.23.0

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
