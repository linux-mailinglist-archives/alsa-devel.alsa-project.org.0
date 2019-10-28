Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 18EA3E7BCF
	for <lists+alsa-devel@lfdr.de>; Mon, 28 Oct 2019 22:54:47 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AE5CA2186;
	Mon, 28 Oct 2019 22:53:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AE5CA2186
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1572299686;
	bh=RT6+h+8Y0LjEsW427wqeXkp6paAl5vW09R+z9vdzWzk=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=A+oYQYwIp5L6joTfgs3bnJnJeLdl9QNNgSKDSWktqTcCH9ABOHjpmgPCgNtAUAAVX
	 4I8jrrasM8PHSm8x1vbI7vQNL5ipB0vbC7anuFt2cyNOUISfIeJXdqsYMzp5NWHqah
	 YmTXUk3ITxIvq0YtCNwAuBOD1PWXzghjkYNbvZYI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BFD17F80752;
	Mon, 28 Oct 2019 22:43:53 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E8D2BF80746; Mon, 28 Oct 2019 22:43:50 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-yw1-xc43.google.com (mail-yw1-xc43.google.com
 [IPv6:2607:f8b0:4864:20::c43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 303EFF802BD
 for <alsa-devel@alsa-project.org>; Mon, 28 Oct 2019 22:43:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 303EFF802BD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="LmoO/6X5"
Received: by mail-yw1-xc43.google.com with SMTP id i2so2603012ywg.13
 for <alsa-devel@alsa-project.org>; Mon, 28 Oct 2019 14:43:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=NmuQsbCHKb7BkJ6zh/WNcWYe2RbOykwS3NQHXLqtDhs=;
 b=LmoO/6X5fu2ZRkja6BHX0ytKpwDljwEeMDkFSusx4gve7xOtBmJPqZMx6V8htZNC7b
 fblhqvgdkvGcnWmDolrMI9aL6Hjxzj0TtCdRIVupeavycnRHkNdpEtWe17zWaovYeio8
 7CaYze78R1lFH4VCjoppqHhO4MUXGC9hcY2oFsW0b3mG1mXC1OcDo7V+u/9HtIXDVtFA
 FPJl/LhX71hT3PFHpAdfY5A83YWVScP9yaZiUy3FaM2qWAdweOHA7dCeiLJhJ2xRCCdv
 iLrbBn8VKALbibpUeOS+OZjZCUawcq/nckfgn2xTVdy5gP62q2o9aqvWQCVmmj/uQA8O
 t7DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NmuQsbCHKb7BkJ6zh/WNcWYe2RbOykwS3NQHXLqtDhs=;
 b=cjJC+T/pyjrCiCPVTYwIv+QvRAbAC4aegqjEG0wDd9hoMt9WFzTj4bzbB+05x4zPMQ
 N2O3E4LgamU/vQ5Bqy387AZJchukuTQ5IRw0Yephyyxccdx85ozmmLPpenrCigDqVPn9
 gZuHlganUPD5xeaknYVk2/ZKCW7t4GDqN021Z3Ur1Gs/u87iZ/obBZ4DJIIMpToEO3TO
 yO/MAw5Ij9kjKE2YcBR0g/qA+FXIKyYaGBfVTZWkT6p9l+FcX9C+6xkXYQ73jj2hmZBB
 pq8Q9Gw2zs65ZAaX/n3SJDgqTMUh1l1wL33No2asdHRzols5QFj4DKwy6ec9uRo1hIlz
 0qwg==
X-Gm-Message-State: APjAAAXmlrLY9geMQZfxfr7QVY7zYX0RK+VzhhC0lTp6z1LaWGqy5JVV
 +MAdvKK8SLW7wbrqvNEC/tM=
X-Google-Smtp-Source: APXvYqwEfAtxsHHey0gA75G29M9zoivrzSdMucDftnFHD02cqWioBTmAjbg43BqJbHlP+XoD2J8n0Q==
X-Received: by 2002:a81:bd05:: with SMTP id b5mr14658593ywi.243.1572299026966; 
 Mon, 28 Oct 2019 14:43:46 -0700 (PDT)
Received: from tr4.amd.com (atlvpn.amd.com. [165.204.84.11])
 by smtp.gmail.com with ESMTPSA id l68sm3421090ywf.95.2019.10.28.14.43.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Oct 2019 14:43:46 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org, alsa-devel@alsa-project.org, tiwai@suse.de,
 lukas@wunner.de
Date: Mon, 28 Oct 2019 17:42:10 -0400
Message-Id: <20191028214216.1508370-16-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191028214216.1508370-1-alexander.deucher@amd.com>
References: <20191028214216.1508370-1-alexander.deucher@amd.com>
MIME-Version: 1.0
Cc: Alex Deucher <alexander.deucher@amd.com>, Evan Quan <evan.quan@amd.com>
Subject: [alsa-devel] [PATCH 15/21] drm/amdgpu: disentangle runtime pm and
	vga_switcheroo
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

Originally we only supported runtime pm on PX/HG laptops
so vga_switcheroo and runtime pm are sort of entangled.

Attempt to logically separate them.

Reviewed-by: Evan Quan <evan.quan@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 22 ++++++++++++++--------
 1 file changed, 14 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
index 2416a5103154..0dd4ff3658f1 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
@@ -2711,7 +2711,7 @@ int amdgpu_device_init(struct amdgpu_device *adev,
 		       uint32_t flags)
 {
 	int r, i;
-	bool runtime = false;
+	bool boco = false;
 	u32 max_MBps;
 
 	adev->shutdown = false;
@@ -2882,11 +2882,14 @@ int amdgpu_device_init(struct amdgpu_device *adev,
 	vga_client_register(adev->pdev, adev, NULL, amdgpu_device_vga_set_decode);
 
 	if (amdgpu_device_supports_boco(ddev))
-		runtime = true;
-	if (!pci_is_thunderbolt_attached(adev->pdev))
+		boco = true;
+	if (amdgpu_has_atpx() &&
+	    (amdgpu_is_atpx_hybrid() ||
+	     amdgpu_has_atpx_dgpu_power_cntl()) &&
+	    !pci_is_thunderbolt_attached(adev->pdev))
 		vga_switcheroo_register_client(adev->pdev,
-					       &amdgpu_switcheroo_ops, runtime);
-	if (runtime)
+					       &amdgpu_switcheroo_ops, boco);
+	if (boco)
 		vga_switcheroo_init_domain_pm_ops(adev->dev, &adev->vga_pm_domain);
 
 	if (amdgpu_emu_mode == 1) {
@@ -3063,7 +3066,7 @@ int amdgpu_device_init(struct amdgpu_device *adev,
 
 failed:
 	amdgpu_vf_error_trans_all(adev);
-	if (runtime)
+	if (boco)
 		vga_switcheroo_fini_domain_pm_ops(adev->dev);
 
 	return r;
@@ -3110,9 +3113,12 @@ void amdgpu_device_fini(struct amdgpu_device *adev)
 
 	kfree(adev->bios);
 	adev->bios = NULL;
-	if (!pci_is_thunderbolt_attached(adev->pdev))
+	if (amdgpu_has_atpx() &&
+	    (amdgpu_is_atpx_hybrid() ||
+	     amdgpu_has_atpx_dgpu_power_cntl()) &&
+	    !pci_is_thunderbolt_attached(adev->pdev))
 		vga_switcheroo_unregister_client(adev->pdev);
-	if (adev->flags & AMD_IS_PX)
+	if (amdgpu_device_supports_boco(adev->ddev))
 		vga_switcheroo_fini_domain_pm_ops(adev->dev);
 	vga_client_register(adev->pdev, NULL, NULL, NULL);
 	if (adev->rio_mem)
-- 
2.23.0

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
