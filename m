Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 43351E7BBD
	for <lists+alsa-devel@lfdr.de>; Mon, 28 Oct 2019 22:49:18 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C5532214B;
	Mon, 28 Oct 2019 22:48:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C5532214B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1572299357;
	bh=A4WhsqglZ8nJVJRvHX5/GR2dfe377LyjI7CeXGdCzHo=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LPpyAow6BP3+A2YO4/XRilC0rrw/IMItd+W6sIe03ZIBvkijLJM2BLzD+fC1QkV6f
	 ayNC2NNS1gyOakZjJ56hwek7pFAhGAqmc6ngXJ3+kReSNjTNmoh91EgKe9kvavfpf4
	 Lw6WBkgFlEJMmeUGqqx4zlkrEoTXSg0f5mGbw0BI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F0C1DF80673;
	Mon, 28 Oct 2019 22:43:18 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8F698F80671; Mon, 28 Oct 2019 22:43:16 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-yb1-xb41.google.com (mail-yb1-xb41.google.com
 [IPv6:2607:f8b0:4864:20::b41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A8DD1F8064C
 for <alsa-devel@alsa-project.org>; Mon, 28 Oct 2019 22:43:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A8DD1F8064C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="m3c7FBxK"
Received: by mail-yb1-xb41.google.com with SMTP id q143so4622313ybg.12
 for <alsa-devel@alsa-project.org>; Mon, 28 Oct 2019 14:43:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rprWGJs3yp+w8s82f6jq59UV3+l2Mkoh9FDMc2FAwa0=;
 b=m3c7FBxKY7e49MCTFyt0Zt271irgsmiMOT957bhbOTiJ2rzATG3SqP5FeFOjUYr8Qs
 oBfyY+HgYddJHRbD7PCGiFCJWAAyqwUOcQ+AeMyhLKIM/9xPWg8FG/O3DdfJqdFK2z0M
 o+qFp7iyTNfw69bPdFsOluP+d8tIv+TzsVivVM3Li8SoN+lJu/mu3eCwJUvmGhTVZGyZ
 ULmGuuo4sCC4J94uFQrFplivyAfVmpuTfL+5AQdpsktxmGfz6ib9QWaD0JD1/Hr+Bkxb
 oiOssvITlc7XYvoIQ34MDLEH4UPwlT4klTQosyQryBJVF+IWywLy6RsdbxbXdL5yC42C
 HhSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rprWGJs3yp+w8s82f6jq59UV3+l2Mkoh9FDMc2FAwa0=;
 b=uTZfpZqxIunmAIhYUXUccv8uIDKIaXbOTSz1bkLMpH6f265QVJd26Jc237j8kDBvYS
 PpxKQ9qvnZkXyhS0ulUcCijtYtUiuKIpF5wpRTvUSSOwAbBcwHKbL7jEtTLMRKn7QlQR
 DoJvXGBOUIbX6ptwG6IEjHLhlDNJwh8OafF5RR7msJQck3s+7lwZZUmk36vidApW1YAY
 q/c0MRUZjwYv79Hvr4k6eopAQwUPDUie6dqVr9fC/842g8TNxNxmYWnhh7L334GIY+/U
 DZjQUct3TOn+UY2uFlDhVZa3gXW5ZAF5VEBSEwEa4fkbqjU2Mc9pIlVDmTupcrx78+aZ
 ZHxw==
X-Gm-Message-State: APjAAAXKMpR3FGJRc+tA9nrImlN56Y/fxs9HFppjkH4pTbLPkMXjUYRt
 yo0pfjGxHEvFOW2wxht1zPQ=
X-Google-Smtp-Source: APXvYqzu4mse9nPWFKstSbzRiho6Pf0v9Bn7E5tZanNuAKAG2qI32EYBeZDrzwmZCle06tZmYfUu9A==
X-Received: by 2002:a25:7ac4:: with SMTP id v187mr6202171ybc.118.1572298992073; 
 Mon, 28 Oct 2019 14:43:12 -0700 (PDT)
Received: from tr4.amd.com (atlvpn.amd.com. [165.204.84.11])
 by smtp.gmail.com with ESMTPSA id l68sm3421090ywf.95.2019.10.28.14.43.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Oct 2019 14:43:11 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org, alsa-devel@alsa-project.org, tiwai@suse.de,
 lukas@wunner.de
Date: Mon, 28 Oct 2019 17:42:02 -0400
Message-Id: <20191028214216.1508370-8-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191028214216.1508370-1-alexander.deucher@amd.com>
References: <20191028214216.1508370-1-alexander.deucher@amd.com>
MIME-Version: 1.0
Cc: Alex Deucher <alexander.deucher@amd.com>, Evan Quan <evan.quan@amd.com>
Subject: [alsa-devel] [PATCH 07/21] drm/amdgpu: add supports_baco callback
	for NV asics.
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

Check the BACO capabilities from the powerplay table.

Reviewed-by: Evan Quan <evan.quan@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/nv.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/nv.c b/drivers/gpu/drm/amd/amdgpu/nv.c
index 22ab1955b923..e88e9b9edcbb 100644
--- a/drivers/gpu/drm/amd/amdgpu/nv.c
+++ b/drivers/gpu/drm/amd/amdgpu/nv.c
@@ -294,6 +294,16 @@ static int nv_asic_mode1_reset(struct amdgpu_device *adev)
 	return ret;
 }
 
+static bool nv_asic_supports_baco(struct amdgpu_device *adev)
+{
+	struct smu_context *smu = &adev->smu;
+
+	if (smu_baco_is_support(smu))
+		return true;
+	else
+		return false;
+}
+
 static enum amd_reset_method
 nv_asic_reset_method(struct amdgpu_device *adev)
 {
@@ -586,6 +596,7 @@ static const struct amdgpu_asic_funcs nv_asic_funcs =
 	.need_full_reset = &nv_need_full_reset,
 	.get_pcie_usage = &nv_get_pcie_usage,
 	.need_reset_on_init = &nv_need_reset_on_init,
+	.supports_baco = &nv_asic_supports_baco,
 };
 
 static int nv_common_early_init(void *handle)
-- 
2.23.0

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
