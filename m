Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E7D1DE7BB6
	for <lists+alsa-devel@lfdr.de>; Mon, 28 Oct 2019 22:48:03 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7DA532143;
	Mon, 28 Oct 2019 22:47:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7DA532143
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1572299283;
	bh=zwzcH0Sv7qIrXFhDKxOBUck5jEO07xie4iyotB8CVlk=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HP4FG22qiy11itFiSAGnrFcszRn2F4W661R3+Xb0YVEfeMG69cI9ayFv+UUn4rx8V
	 jyXMZWeWY9iL1wyZtpbWeO8TJAn4p+a7dpfle78MYFoq0qG67V65wxZISfnkePKREQ
	 FOgtFJn3jQMmHvBV6ORelQ8gO4ef85/ediNTHKc8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 11E1BF8063E;
	Mon, 28 Oct 2019 22:43:14 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B1A3BF8063D; Mon, 28 Oct 2019 22:43:11 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-yb1-xb43.google.com (mail-yb1-xb43.google.com
 [IPv6:2607:f8b0:4864:20::b43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E692BF80635
 for <alsa-devel@alsa-project.org>; Mon, 28 Oct 2019 22:43:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E692BF80635
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="rpdg0jwx"
Received: by mail-yb1-xb43.google.com with SMTP id t11so1883844ybk.10
 for <alsa-devel@alsa-project.org>; Mon, 28 Oct 2019 14:43:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=GbGxDJNQTBvT+RJ5ap+7ma9iXB0z5sr7CNysFxEASlY=;
 b=rpdg0jwxSFgYTeSiIEzi1U9yRqGpvmv02WbdjQHfyATmHrj28HkQ7T9TqGKPA2uWmI
 heDWxxJ93T34sNmjuElMhQ32pW+8ZlfG3L34Z6B7oShqL1vacC5IISwG//bFFT1z66ml
 MTxicv9f3MbyoNHii+yLR9NxQXEAjwkgAKSD61V6W38uZZH0l7Ou5JV/+//ZaVKUZFCo
 LK8/ovi0IJt5tGw5B0paYCKuMTub/xUWdKe282mPLc8hiya+C7ulUwki7JTmM0nqlX4b
 NrxQsl74WRrUWN3MWh4guuIUftvYFZ+r0ERdmDV6ovS/mZwbIp/5IYjKH4aCbA6NdovB
 32gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GbGxDJNQTBvT+RJ5ap+7ma9iXB0z5sr7CNysFxEASlY=;
 b=ks4rdfvyGk9ifOSXIbrR4ZVKL8v3l0NT80zUAMsmY3q+5dSFOuhMwpJ9/sZEOSpgCJ
 Sp8PR91MdTm/j9XVg+8nnjb7w8U04ebcKgYxbMuuknD59VpxEloS9Fud8eYCqylQqWRA
 DvzlPcI5u0+a3CWJ4eX6kFu4RF8XaUTXuKcy2q6zyPFOw9JeM7864OVTIAvCWiErd1rX
 RjoQGUqFSQl6T1Uvz+9rxEfnEnR1c/rbrVDq+VaNZUcHIFS2xZvQDZ5y1YZ59OnNnNgl
 hcaGEkpRnuc/vbYM4IoZ6IGpnT6P/Lf34QVi0KFMEnUgMVaDl15X4EoqvpWnr6RjYRcW
 rxMA==
X-Gm-Message-State: APjAAAXKQaCa+eU4u9hSMmHJHuQq27RgJoSL6QvgIFdLvdIPWqr1fHiL
 mkZelSOtfxsaEThkvQVEXl0=
X-Google-Smtp-Source: APXvYqz6507CpDAq9VrcBCDCu6RBZOH3UH9hLdATMX1e/2buKhbsm+Sn710B4BqXriGOQsER7N5+EQ==
X-Received: by 2002:a25:d70f:: with SMTP id o15mr16995235ybg.43.1572298987058; 
 Mon, 28 Oct 2019 14:43:07 -0700 (PDT)
Received: from tr4.amd.com (atlvpn.amd.com. [165.204.84.11])
 by smtp.gmail.com with ESMTPSA id l68sm3421090ywf.95.2019.10.28.14.43.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Oct 2019 14:43:06 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org, alsa-devel@alsa-project.org, tiwai@suse.de,
 lukas@wunner.de
Date: Mon, 28 Oct 2019 17:42:00 -0400
Message-Id: <20191028214216.1508370-6-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191028214216.1508370-1-alexander.deucher@amd.com>
References: <20191028214216.1508370-1-alexander.deucher@amd.com>
MIME-Version: 1.0
Cc: Alex Deucher <alexander.deucher@amd.com>, Evan Quan <evan.quan@amd.com>
Subject: [alsa-devel] [PATCH 05/21] drm/amdgpu: add supports_baco callback
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
