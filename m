Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 18CB5FE369
	for <lists+alsa-devel@lfdr.de>; Fri, 15 Nov 2019 17:54:14 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7D0A01612;
	Fri, 15 Nov 2019 17:53:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7D0A01612
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1573836853;
	bh=vKZNZPD121ERugMJrjSPXB8anSko4PhYDPDh5LOG3wQ=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=h9+LtOhKZFhyP5qbdJW8n9lE85e7NkTBayVthaB/I8zHhr4ozDlULldz4IJYrRKFK
	 WrKMemg+q4+yIX8ukbra0OvS+UvljZd8fs0UDT58mI4D2i2XTFfegaYT/Fx53hsgpN
	 7pjeg7CKhWxX5zUzv/FiPG7hzgwX+APCw5DhXEHQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 92598F80124;
	Fri, 15 Nov 2019 17:51:08 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C8D9EF80107; Fri, 15 Nov 2019 17:50:54 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com
 [IPv6:2607:f8b0:4864:20::744])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BB08FF80104
 for <alsa-devel@alsa-project.org>; Fri, 15 Nov 2019 17:50:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BB08FF80104
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="fQBalVcm"
Received: by mail-qk1-x744.google.com with SMTP id m4so8595912qke.9
 for <alsa-devel@alsa-project.org>; Fri, 15 Nov 2019 08:50:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5jWqSWkcr8Rvf8rBv65dsS38w4SQg0IVGsPkUDNSymc=;
 b=fQBalVcmuS7D569AzzAGn5yTvOZvdpQPU2UShbNTmLqwpKsEorCDhr7Dw4AWCciYfE
 PX/Up36rA7FEBlgy9zgDahv9Yd0plrB/BPAiZyX2mMX0hN6ANHfy1NH1hpuOAf66mPkp
 FHGCTwx/EJbUvbL+yDQyK04NBXQHEAg4JVRhiOnlPoOf9tayeVtQ7Q6oAkYZrLPrmXLm
 MzO5R0nYGBi/iYWhe0g5tjPXLwnI3gUy67Kfe5UlEBkRohVOW17XINHlZEjHBo/43jCo
 j4NEHyBQ726r5aj8j0ULGbMlM6I0nyIG4NokGn5F/T7BLjQm6gMbWnYQyD92mwng+J96
 1/Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5jWqSWkcr8Rvf8rBv65dsS38w4SQg0IVGsPkUDNSymc=;
 b=oX4vtMLkuqMei86NUc4ZM6nPYmsxNQT/Qz/i1HEMLMOfCEVzaFJFpCKB7gbSI/0JPa
 LhpUP6GmqdWql0MAjyDvw8Slnm1DZ11OyRStiDS2YuYxHlJ7eL/+ELGfx50GrlIzJtLV
 S9DxAoUEIPcAlm/LqHg8HxKztmUzuLylJca8mEA1e1QvQMTHmfHW2sAk828QIPRycLN7
 nxBrmXN3Up3jAqzWM/KyTTlrba2nhHWdzfZPP/mpSrtdEizYuYJFiTNMbZ6i/5i78YUj
 MbTsUxEZheqGUnKt0WNCDkjol3MQE6PwiJIQLBscjg9+dkXlVu9PKpmTBxOXpQHbkaGa
 CV2g==
X-Gm-Message-State: APjAAAUsWD0k6r218ak05u2JmKsqdAIjRiDqTdRYqmrvKTfHnb7vh9DG
 7S8DILALsUnFUYJTTD4QT3nuE0FI
X-Google-Smtp-Source: APXvYqwUQN4Ql9efspU0qVkhPDNX5y515UaSRjj54wrpz4vvqvq1LDWOHRa+MzIcW6l4aJe0ILVY9g==
X-Received: by 2002:a37:6554:: with SMTP id z81mr13753900qkb.9.1573836649131; 
 Fri, 15 Nov 2019 08:50:49 -0800 (PST)
Received: from localhost.localdomain ([71.219.59.120])
 by smtp.gmail.com with ESMTPSA id r29sm5610331qtb.63.2019.11.15.08.50.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Nov 2019 08:50:48 -0800 (PST)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org, alsa-devel@alsa-project.org, tiwai@suse.de,
 lukas@wunner.de
Date: Fri, 15 Nov 2019 11:50:20 -0500
Message-Id: <20191115165038.56646-3-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191115165038.56646-1-alexander.deucher@amd.com>
References: <20191115165038.56646-1-alexander.deucher@amd.com>
MIME-Version: 1.0
Cc: Alex Deucher <alexander.deucher@amd.com>, Evan Quan <evan.quan@amd.com>
Subject: [alsa-devel] [PATCH 02/20] drm/amdgpu: add supports_baco callback
	for soc15 asics. (v2)
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

v2: drop unrelated struct cleanup

Reviewed-by: Evan Quan <evan.quan@amd.com> (v1)
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/soc15.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/soc15.c b/drivers/gpu/drm/amd/amdgpu/soc15.c
index 305ad3eec987..1acbb38f6384 100644
--- a/drivers/gpu/drm/amd/amdgpu/soc15.c
+++ b/drivers/gpu/drm/amd/amdgpu/soc15.c
@@ -599,6 +599,28 @@ static int soc15_asic_reset(struct amdgpu_device *adev)
 	}
 }
 
+static bool soc15_supports_baco(struct amdgpu_device *adev)
+{
+	bool baco_support;
+
+	switch (adev->asic_type) {
+	case CHIP_VEGA10:
+	case CHIP_VEGA12:
+		soc15_asic_get_baco_capability(adev, &baco_support);
+		break;
+	case CHIP_VEGA20:
+		if (adev->psp.sos_fw_version >= 0x80067)
+			soc15_asic_get_baco_capability(adev, &baco_support);
+		else
+			baco_support = false;
+		break;
+	default:
+		return false;
+	}
+
+	return baco_support;
+}
+
 /*static int soc15_set_uvd_clock(struct amdgpu_device *adev, u32 clock,
 			u32 cntl_reg, u32 status_reg)
 {
@@ -999,6 +1021,7 @@ static const struct amdgpu_asic_funcs soc15_asic_funcs =
 	.get_pcie_usage = &soc15_get_pcie_usage,
 	.need_reset_on_init = &soc15_need_reset_on_init,
 	.get_pcie_replay_count = &soc15_get_pcie_replay_count,
+	.supports_baco = &soc15_supports_baco,
 };
 
 static const struct amdgpu_asic_funcs vega20_asic_funcs =
@@ -1020,6 +1043,7 @@ static const struct amdgpu_asic_funcs vega20_asic_funcs =
 	.get_pcie_usage = &vega20_get_pcie_usage,
 	.need_reset_on_init = &soc15_need_reset_on_init,
 	.get_pcie_replay_count = &soc15_get_pcie_replay_count,
+	.supports_baco = &soc15_supports_baco,
 };
 
 static int soc15_common_early_init(void *handle)
-- 
2.23.0

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
