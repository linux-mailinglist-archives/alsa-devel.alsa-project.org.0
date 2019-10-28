Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AA2D1E7BAE
	for <lists+alsa-devel@lfdr.de>; Mon, 28 Oct 2019 22:46:26 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 37FDE2138;
	Mon, 28 Oct 2019 22:45:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 37FDE2138
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1572299185;
	bh=92wL0A9mSDEMt9om8AGeY8HdB7ixjlflOdpXASHkML0=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dXDKV2QB4KIRYnrqrW+CwxY1kwAG+KU724k0xT13xlC70uLuI0iakl4fqqTesS3im
	 eCpSz7st/gCmsEFnUjxBU3Q6WlW2AT5FsnTeBBDq8jKA4vCNPJr1yswmIR+qV4G9MO
	 FE6As+kMSM9V6J2TtFfUAGK+vIKVCaSyVcFhFlFs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9E770F80610;
	Mon, 28 Oct 2019 22:43:04 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6B975F805FD; Mon, 28 Oct 2019 22:43:01 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-yw1-xc43.google.com (mail-yw1-xc43.google.com
 [IPv6:2607:f8b0:4864:20::c43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 95827F805FB
 for <alsa-devel@alsa-project.org>; Mon, 28 Oct 2019 22:42:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 95827F805FB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="mu3oY0az"
Received: by mail-yw1-xc43.google.com with SMTP id d192so4377289ywa.1
 for <alsa-devel@alsa-project.org>; Mon, 28 Oct 2019 14:42:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=R9wFN5XWeyPOYY+DE8nmOrCKugyIqCGXLRd2W9DKIio=;
 b=mu3oY0azkhTG7W8r7Oxb1D8F4MMN0PsB7D7ghcdepF+jYn+s9/3fj1vActHtlUA1iq
 fynoE74n9kILvuAdngZElnIf9N2WZv3G8PLX4Os/cHZNzL6XBLVLUj0zFF71JTZIXmLA
 celPJXVI7O8gKQEcpI0koXpuR05La8evzYE7C/12dova/ZRSefcslK/AdhRnAgro6xRc
 EKxHh5PGXryQ0OTHom4Awf8xdQUkyVj+JO8lrS8RNlcDlupIY0+NUNeh2RScveJDx5ZZ
 yBohV49agAmpkIgWFU4UbaRIgQWPW1i/1qcDyXdTcCD37PHtPI17ySjqy54y7Ti0G1SS
 wb1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=R9wFN5XWeyPOYY+DE8nmOrCKugyIqCGXLRd2W9DKIio=;
 b=lPsALMJPYpymyJexbOMWFQgDlvLj4mQsHdRVje9rD935D5/V/SFjJ5q0odB4o6U1iM
 cLrgCeQMcBt6NmLKZpf/5JWZtPCegcZuBye8ckahzk7ayVfbIYoQs+GmGJuJ5NMXSZqx
 KK6yk0AfF5Xfy2KuaR6FZLVC4KqIOStMxMoA84kNlLOdsHQ81/C+SFfBAsDC0TrtrMOD
 RzWBOgr1300GaQCKkj/ylnci00qMak9NhBeezDX9u3R6EfeVWE6jmOFzUd27s9Lx3z85
 kvYqkL9IGMINjiyHIXEwbEDb88bIjWJWGSBVjuwcAWdDxV/spnyHkrMwXWQq3m0YWp78
 7Nmg==
X-Gm-Message-State: APjAAAUN2cchh03WdneFzM9RTelv7xNN+By+ov9Snmx3MGSYGnZ72IrE
 nRFsO4CJikGkDn7dYZVSEmg=
X-Google-Smtp-Source: APXvYqxVRpCCYOmQJk0wGB25ns/O9JE3IFgrRBFe50Iw2NZCAFeaVB9zqNljDE7gGAWT6HdDuU41uA==
X-Received: by 2002:a0d:dbd7:: with SMTP id d206mr14293718ywe.35.1572298977354; 
 Mon, 28 Oct 2019 14:42:57 -0700 (PDT)
Received: from tr4.amd.com (atlvpn.amd.com. [165.204.84.11])
 by smtp.gmail.com with ESMTPSA id l68sm3421090ywf.95.2019.10.28.14.42.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Oct 2019 14:42:56 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org, alsa-devel@alsa-project.org, tiwai@suse.de,
 lukas@wunner.de
Date: Mon, 28 Oct 2019 17:41:58 -0400
Message-Id: <20191028214216.1508370-4-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191028214216.1508370-1-alexander.deucher@amd.com>
References: <20191028214216.1508370-1-alexander.deucher@amd.com>
MIME-Version: 1.0
Cc: Alex Deucher <alexander.deucher@amd.com>, Evan Quan <evan.quan@amd.com>
Subject: [alsa-devel] [PATCH 03/21] drm/amdgpu: add supports_baco callback
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

v2: drop unrelated struct cleanup

drivers/gpu/drm/amd/amdgpu/soc15.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/soc15.c b/drivers/gpu/drm/amd/amdgpu/soc15.c
index f7146011a786..976584a47758 100644
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
