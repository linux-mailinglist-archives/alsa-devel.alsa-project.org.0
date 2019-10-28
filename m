Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C8FDCE7BC9
	for <lists+alsa-devel@lfdr.de>; Mon, 28 Oct 2019 22:52:12 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5E7312164;
	Mon, 28 Oct 2019 22:51:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5E7312164
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1572299532;
	bh=SHwoYnTw1VdS6B40+OTLdDkbjZjJIzhGhwomHuyKXLY=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=IQ0of3kb/0OZD3wA2qj+Wc3EzS3IBw1qPpr8OzlVlksZv6BMCNEvE7YCMNj/ManHL
	 CiOc14SIy5bj3wQhRvOYAPoPFBpyCkcJ2XtjhQCpRKCwjr6Mgoa4QxR3cvN8oOUMpT
	 l9YuxxqA4hCaHaU1G9imyWNHTtBmbpuGvRX1RkMk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BDB0DF8070D;
	Mon, 28 Oct 2019 22:43:40 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 37CE0F8070D; Mon, 28 Oct 2019 22:43:38 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-yb1-xb43.google.com (mail-yb1-xb43.google.com
 [IPv6:2607:f8b0:4864:20::b43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 71EA6F8070B
 for <alsa-devel@alsa-project.org>; Mon, 28 Oct 2019 22:43:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 71EA6F8070B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="fpp+S4OK"
Received: by mail-yb1-xb43.google.com with SMTP id h202so4621198ybg.13
 for <alsa-devel@alsa-project.org>; Mon, 28 Oct 2019 14:43:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=RrOpg/Upy9l67yTKZlPLf0p83NFZJk8nm/f92EYp9Ss=;
 b=fpp+S4OKMPA9N2Tqnd+NuGVQcGP3NcETOK1yCDVvArVgmS3mZn3QLUnAcK6sHIRpH6
 xxb9nI4TyuZdeQaOdmXAXZG2o+6JtgIYh+7kMoNEgkDB7Z4n+c2/10AL1IhOQQSX0nEG
 u5b1PVJQMdRUvW37A8m1yBHQdR+l3GfL91pWoPPv34Jovl5Q3YLR5l++bU5rgJ4NnWLD
 6PwE90tHBR7/aYlmf9nGssTynU0IACgZukS32x0mLRDY3WPouUCGlqbDouiCVDK9Ux+l
 ldzouYeoUkF5qHg1uPemQE9NeF7VeyvNUDhIZB64bgWTR4QQFgZWEPTyRPXnrc7mnzWh
 OQ9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=RrOpg/Upy9l67yTKZlPLf0p83NFZJk8nm/f92EYp9Ss=;
 b=PVG9cfE1f0dr4xWEItbjgzhvBns9rYMtXUrrcRPaniKeHW8WX1Pdz00UYcyA+L3OAi
 qQCzEXmaRg/VeCH5VgbQvMdT7fQCzjVBObZM86cOnxzjdGVr9tnY9wUsJDdGJd9tTk4M
 3zf9p4EcwVJRBD+yHuHo+bYaGrUatj714D8/O8LsasB9UR97O9Ea+JA5VGoG0r9HCbRZ
 HJu8CGA40QtAQakkf6mHLBHjUynK77tBhEzWe679ret4GBrhRIhZAPqUjvbej+1/aSHL
 KI8u/QcS3+CYqaDQmLYnMBeZkHIaSVySd3PnpzZBVbjPe+SXcDP2bukGOarBK23yExsp
 K7ng==
X-Gm-Message-State: APjAAAXK894sdmvYAGBHvmnBludaqqTS3vUk+a3Dlgs8iWPaI9XJvezm
 X2AP6xHIpH3b7EU3VBE085kyGb+gVic=
X-Google-Smtp-Source: APXvYqypD/H/qdgc7JW/7fDTtq2eWsXhh69R32hZlUBYHMACihCcDDiYgBBkijY8s3dvyQ4BFp8wvA==
X-Received: by 2002:a25:fc26:: with SMTP id v38mr16445664ybd.322.1572299013807; 
 Mon, 28 Oct 2019 14:43:33 -0700 (PDT)
Received: from tr4.amd.com (atlvpn.amd.com. [165.204.84.11])
 by smtp.gmail.com with ESMTPSA id l68sm3421090ywf.95.2019.10.28.14.43.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Oct 2019 14:43:33 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org, alsa-devel@alsa-project.org, tiwai@suse.de,
 lukas@wunner.de
Date: Mon, 28 Oct 2019 17:42:07 -0400
Message-Id: <20191028214216.1508370-13-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191028214216.1508370-1-alexander.deucher@amd.com>
References: <20191028214216.1508370-1-alexander.deucher@amd.com>
MIME-Version: 1.0
Cc: Alex Deucher <alexander.deucher@amd.com>, Evan Quan <evan.quan@amd.com>
Subject: [alsa-devel] [PATCH 12/21] drm/amdgpu: add helpers for baco entry
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
index d04a94ed23e5..f2b9714e7e0c 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
@@ -1142,6 +1142,8 @@ bool amdgpu_device_supports_boco(struct drm_device *dev);
 bool amdgpu_device_supports_baco(struct drm_device *dev);
 bool amdgpu_device_is_peer_accessible(struct amdgpu_device *adev,
 				      struct amdgpu_device *peer_adev);
+int amdgpu_device_baco_enter(struct drm_device *dev);
+int amdgpu_device_baco_exit(struct drm_device *dev);
 
 /* atpx handler */
 #if defined(CONFIG_VGA_SWITCHEROO)
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
index 2a5f4c7c0a24..2416a5103154 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
@@ -4256,3 +4256,64 @@ static void amdgpu_device_get_pcie_info(struct amdgpu_device *adev)
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
