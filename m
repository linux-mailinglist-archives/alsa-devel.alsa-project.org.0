Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A1A6FE362
	for <lists+alsa-devel@lfdr.de>; Fri, 15 Nov 2019 17:52:41 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F2F0B165E;
	Fri, 15 Nov 2019 17:51:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F2F0B165E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1573836761;
	bh=eDq5STARrZSpV8+baTbjdgr2q5Y+1EtdzxJ7HPTZ9L8=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LRiH6VbsD8AtpNoEWCP5ftEGWibgf6HVLzh8+JFIOBMXha6Gv3HXnWjF8KsXlKTsu
	 7EaGImD9fcgP4F83cJvrUyCLrSgoEpVqBFIQ+uG5AHqpmu+FDmXG2CjEqhrAOYfg5v
	 gEXEbrfkBfmR5+FBVHFgV6ufLBvPfmwTPx/s3Kpg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 42754F8010A;
	Fri, 15 Nov 2019 17:50:58 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 67E4EF800CC; Fri, 15 Nov 2019 17:50:53 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com
 [IPv6:2607:f8b0:4864:20::741])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8117EF800CC
 for <alsa-devel@alsa-project.org>; Fri, 15 Nov 2019 17:50:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8117EF800CC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="aAp93I04"
Received: by mail-qk1-x741.google.com with SMTP id q70so8597793qke.12
 for <alsa-devel@alsa-project.org>; Fri, 15 Nov 2019 08:50:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jp8sobe6U2u/1BYRu0meomBohcsXcgJT/B6VFFnSNhY=;
 b=aAp93I047Vl2VQRrYJgBx8KytGIYitYGKGgxj1ED8keEvjyUuvLcBZaDLm+99c1B/q
 sr0DAV87wpueuOWDHYi9bH+ohGGUUzT51pUMVjSqcAjLDBiN+UEzd3kE9DWKfOIlA9Rk
 DGcHtca1bs7oPe8PYwnVLVykebg736PFNv5RaW+uHpceiMWpWXQtCe0ByamvItKXCWf/
 BWvaPcjHjzNodb62mO0DPFXLfJ8NFt7VkQSSP4Keq7oNjeVnmVV13cKrgeSNbbE3GonG
 3kgOKPUKGVgweSQtzhAaWMk0DPpuC8ew23fIwFEBbLn12hWY3OEOWa6P4SeEJmnPH9hG
 qWeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jp8sobe6U2u/1BYRu0meomBohcsXcgJT/B6VFFnSNhY=;
 b=nO4FsJkPu9DVKktVzvDIaPdDKsaQUezealUft1qkNQlTNDthGvF2if9sm8GbY1Z/ON
 1A3yXilaN0LUFWmr8+CfEJviWFQRKq7T9MaL21WtAmG/SJXwja9V/FX32O5X/LGpYgZN
 +h9mzE3xrNOCUSj0wZJf0LwDbKhMxZx+1PFo8sxPNlgvt58vQlAl7aauMC3HxZSVcLTo
 suzB6jc1dF5G0L69uhTCyVgWrsM1e5wMcFVDvGbrUQOnvUukNjOdr8iVjNxc6qfnjOI2
 7FX/nAwPGm+ItYnLOiE8aXbQ63WZXN/FWc11A/4jR57mge3bPIk36KcGqgyCD/+e47nD
 6fQA==
X-Gm-Message-State: APjAAAVcZq6KmuNwO+sPaMQOgQQNF9Xrj/jJCSsh65xr2G4jFsklaaDB
 fVagERPBRriqoBab+SJQ7d4=
X-Google-Smtp-Source: APXvYqwWaQa8o0dQnDtY/M2B2mXXeP4TFBayHN/JKxxVC4lgxAzXhFEo3QF2BNI0f0KWDymMUpRoWA==
X-Received: by 2002:a37:a281:: with SMTP id
 l123mr13209328qke.135.1573836647772; 
 Fri, 15 Nov 2019 08:50:47 -0800 (PST)
Received: from localhost.localdomain ([71.219.59.120])
 by smtp.gmail.com with ESMTPSA id r29sm5610331qtb.63.2019.11.15.08.50.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Nov 2019 08:50:47 -0800 (PST)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org, alsa-devel@alsa-project.org, tiwai@suse.de,
 lukas@wunner.de
Date: Fri, 15 Nov 2019 11:50:19 -0500
Message-Id: <20191115165038.56646-2-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191115165038.56646-1-alexander.deucher@amd.com>
References: <20191115165038.56646-1-alexander.deucher@amd.com>
MIME-Version: 1.0
Cc: Alex Deucher <alexander.deucher@amd.com>, Evan Quan <evan.quan@amd.com>
Subject: [alsa-devel] [PATCH 01/20] drm/amdgpu: add asic callback for BACO
	support
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

Used to check whether the device supports BACO.  This will
be used to enable runtime pm on devices which support BACO.

Reviewed-by: Evan Quan <evan.quan@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
index 4eac1549d4de..d951907980b1 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
@@ -591,6 +591,8 @@ struct amdgpu_asic_funcs {
 	bool (*need_reset_on_init)(struct amdgpu_device *adev);
 	/* PCIe replay counter */
 	uint64_t (*get_pcie_replay_count)(struct amdgpu_device *adev);
+	/* device supports BACO */
+	bool (*supports_baco)(struct amdgpu_device *adev);
 };
 
 /*
@@ -1121,6 +1123,8 @@ int emu_soc_asic_init(struct amdgpu_device *adev);
 #define amdgpu_asic_get_pcie_usage(adev, cnt0, cnt1) ((adev)->asic_funcs->get_pcie_usage((adev), (cnt0), (cnt1)))
 #define amdgpu_asic_need_reset_on_init(adev) (adev)->asic_funcs->need_reset_on_init((adev))
 #define amdgpu_asic_get_pcie_replay_count(adev) ((adev)->asic_funcs->get_pcie_replay_count((adev)))
+#define amdgpu_asic_supports_baco(adev) (adev)->asic_funcs->supports_baco((adev))
+
 #define amdgpu_inc_vram_lost(adev) atomic_inc(&((adev)->vram_lost_counter));
 
 /* Common functions */
-- 
2.23.0

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
