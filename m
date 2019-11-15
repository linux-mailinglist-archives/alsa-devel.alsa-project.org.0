Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E3E9FE36E
	for <lists+alsa-devel@lfdr.de>; Fri, 15 Nov 2019 17:55:18 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DFF371672;
	Fri, 15 Nov 2019 17:54:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DFF371672
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1573836917;
	bh=zwzcH0Sv7qIrXFhDKxOBUck5jEO07xie4iyotB8CVlk=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ntJf23RAAKRcugc3QMWmd6voT2xNr7kmOUClHk0psEbqeDt9hFAydL6IqMWlOKEKk
	 07THmNtqARdBm43cyl9id4WBU+26nTo21ANIObSDEwf6KTKqf5U5gVA++yqwST1gg8
	 kjLq/6egl5dkepQX8Lh/h5gEQ7U3wZScv5yaDILs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3A8B6F80104;
	Fri, 15 Nov 2019 17:51:16 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 649E0F80105; Fri, 15 Nov 2019 17:50:56 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-qv1-xf42.google.com (mail-qv1-xf42.google.com
 [IPv6:2607:f8b0:4864:20::f42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 172C7F800CC
 for <alsa-devel@alsa-project.org>; Fri, 15 Nov 2019 17:50:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 172C7F800CC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="T4e+JcaC"
Received: by mail-qv1-xf42.google.com with SMTP id x14so4028162qvu.0
 for <alsa-devel@alsa-project.org>; Fri, 15 Nov 2019 08:50:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=GbGxDJNQTBvT+RJ5ap+7ma9iXB0z5sr7CNysFxEASlY=;
 b=T4e+JcaCaipIGs2bYKlT2agWcdfSsedYGPShtxV8DxNp9XoEBObLDfjEUR0wp8ts0Z
 fsTQW2bNaNazBTW/7N5bKGOL5IkN09BZ/1sAssBfYFBplAzXlIZ8DxkXWJzIwLtODEjm
 otZ/sR8H9fZaJWelpljYSco1WVv65TYZMj9yR95d0lGt1I8595QAHaSw57JWJ9sxYKh2
 fOWnWW9bUWZSwhlC5sgVdagulV/rh2hnlAbKR6hWv72nl13r03rgNKhBkjo/4IrOk+yq
 B56rdRI313oU3WicGgJ1eNXjLRf4d487DDfZsJ7cJJMy23uv1RwuJYGK6S9n6DyNYZDa
 RAUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GbGxDJNQTBvT+RJ5ap+7ma9iXB0z5sr7CNysFxEASlY=;
 b=U5xgvoiP8WWR5rPeV5XosuINjHqkiWukz8SSZEOowcJJMyBM5MpwNjJ7GSLIyOwF4u
 yJB9p5Nvcb+BkCSS/86n2CC0HVRSrCiFnvOhCePC93heGCdMApU5Ubr0hQWUdjbNPjPt
 +38T5eX8tKxnMj4NivcECItOK6JI9qYRPel0f7935gVQ5D0Jo9wXTCKxjY7jxwvheAXP
 F4tXe0bhMCg/+oMdr+ClCtMtWOpz8nXlbWFL6vpdZkD4wAv1kLFKDBflqOoUIwS/7gHx
 pM24UDzm4NVGNHl2hnQf6DV3/Az9V+AMtPcPcyOC0/MoaSh9Z0uXGBx1NAy8tECPxqF2
 xglw==
X-Gm-Message-State: APjAAAWiuWM5dgkBOnerKCVhYV45i3mDxaERZ7EkiEA2WPfXksGr/lXl
 9TRyNZhUBLMsNk9O793xfN2w05Uz
X-Google-Smtp-Source: APXvYqzIJBJjrqEqFDHmoEOEXR4A7cfcdvI6IY8kxc6EW+m0uNexQg2eWAUb/hGwQLmNQvxzSI2HUA==
X-Received: by 2002:a0c:baad:: with SMTP id x45mr13031398qvf.230.1573836651089; 
 Fri, 15 Nov 2019 08:50:51 -0800 (PST)
Received: from localhost.localdomain ([71.219.59.120])
 by smtp.gmail.com with ESMTPSA id r29sm5610331qtb.63.2019.11.15.08.50.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Nov 2019 08:50:50 -0800 (PST)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org, alsa-devel@alsa-project.org, tiwai@suse.de,
 lukas@wunner.de
Date: Fri, 15 Nov 2019 11:50:22 -0500
Message-Id: <20191115165038.56646-5-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191115165038.56646-1-alexander.deucher@amd.com>
References: <20191115165038.56646-1-alexander.deucher@amd.com>
MIME-Version: 1.0
Cc: Alex Deucher <alexander.deucher@amd.com>, Evan Quan <evan.quan@amd.com>
Subject: [alsa-devel] [PATCH 04/20] drm/amdgpu: add supports_baco callback
	for CIK asics.
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
 drivers/gpu/drm/amd/amdgpu/cik.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/cik.c b/drivers/gpu/drm/amd/amdgpu/cik.c
index 2d64d270725d..968bc706b94d 100644
--- a/drivers/gpu/drm/amd/amdgpu/cik.c
+++ b/drivers/gpu/drm/amd/amdgpu/cik.c
@@ -1310,6 +1310,23 @@ static int cik_asic_pci_config_reset(struct amdgpu_device *adev)
 	return r;
 }
 
+static bool cik_asic_supports_baco(struct amdgpu_device *adev)
+{
+	bool baco_support;
+
+	switch (adev->asic_type) {
+	case CHIP_BONAIRE:
+	case CHIP_HAWAII:
+		smu7_asic_get_baco_capability(adev, &baco_support);
+		break;
+	default:
+		baco_support = false;
+		break;
+	}
+
+	return baco_support;
+}
+
 static enum amd_reset_method
 cik_asic_reset_method(struct amdgpu_device *adev)
 {
@@ -1899,6 +1916,7 @@ static const struct amdgpu_asic_funcs cik_asic_funcs =
 	.get_pcie_usage = &cik_get_pcie_usage,
 	.need_reset_on_init = &cik_need_reset_on_init,
 	.get_pcie_replay_count = &cik_get_pcie_replay_count,
+	.supports_baco = &cik_asic_supports_baco,
 };
 
 static int cik_common_early_init(void *handle)
-- 
2.23.0

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
