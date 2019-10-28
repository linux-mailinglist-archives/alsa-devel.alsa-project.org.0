Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6394AE7BAB
	for <lists+alsa-devel@lfdr.de>; Mon, 28 Oct 2019 22:45:28 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C1C2F2115;
	Mon, 28 Oct 2019 22:44:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C1C2F2115
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1572299127;
	bh=5O9dl6qq+oTyv03jEJUFkbvrsxh5J5DReKWSIpkstYg=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=TmtErIRg7m/NQ1hCIgO9cHStG7CP8nMCdU9qIov/fplbTFYUkTOU1/GG2F2ofCYxO
	 OsaaCfsU0WipjAcmlmJuwvSfQm4lDxJyD5aEj1dkJHSsiGvXCD9qEIj6O22x/4g1ms
	 /cvAtFKWncehv369M8pufU/NDb51Pp5xIjK8rhyI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E39D8F805AE;
	Mon, 28 Oct 2019 22:42:57 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 26FEDF800E7; Mon, 28 Oct 2019 22:42:55 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-yw1-xc43.google.com (mail-yw1-xc43.google.com
 [IPv6:2607:f8b0:4864:20::c43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 69146F800E7
 for <alsa-devel@alsa-project.org>; Mon, 28 Oct 2019 22:42:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 69146F800E7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="nW8aVH2P"
Received: by mail-yw1-xc43.google.com with SMTP id i123so4349877ywe.11
 for <alsa-devel@alsa-project.org>; Mon, 28 Oct 2019 14:42:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WZYzWQ3n+K05Ss/icenk5EXv4sIlQ5/+aONtA537Z7A=;
 b=nW8aVH2PE/nue4Y4UxnJoeivzfEPZp5E8MbS6SCFGju2zTwzz3BfH/vx5KMDU/3Cm2
 pzNXvr8wZhlmRIrbAjW2R7gdXq/tvVyVok8lpBbfXnmUfqFwHWxbg8gsR/8L6yWPWEv/
 OH9KnnVqm6gjS1sACSoL6xJ1gYOnoxB1jSCmLCNkQFtJCFEXODBUTmVeDkqJhbokTTC/
 v5pm5gF8c8SqhGPEvPArYkB/jMyw40dXNTQRuThyyE527X2t1Z0ktdKVUITmhctlA08K
 9TZF6QUnqtppGoriOP5FNgePMCFdHj9f/czN4DJ7LismVrrZQmIHDRYJj355bYFQrGYW
 g4Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WZYzWQ3n+K05Ss/icenk5EXv4sIlQ5/+aONtA537Z7A=;
 b=jiACaAyKgLYgk1lu+bX+fs9MA5xMpNE/qsJbOlapO/Uhh3pRs3H2HWIUvprnnnw4K5
 z4+P77wZ/ud0m9LUHkt3ViNDgeZnyyWSZ7uKHhn2Vmw95xjj6LLNq9LbT6XFkbwFFqRt
 g4lr4Cz22/SyPlxrXZ/x+XpXkaCB9WFpbjkzVfT5gb5YHqptsXF+m3qglFDOE3ISoAj2
 j3XJ/HzCAPgaYpZtveCXCRYTz52ZwAon3VUxQaLUyP7BealFQiWASgRaLWIYXCkbVsEZ
 v6hvDNhE8I6OEh+U7MWALy25D55ix7GJvdmWr/TiQ2i2TpBv70DnvpTdv/KwAiU0qHlr
 H+cQ==
X-Gm-Message-State: APjAAAX68igx0wcFX29kpCrrX06BxAsa96VIX7qow5srjl2Ya/LRBdmO
 iqonJGkXKPu96PApM377FCg=
X-Google-Smtp-Source: APXvYqysZpDomzWe5ORzZyVW6CUjfGqNW5Lm/pL6r+wwLGARUEpIsFYDkkvb/+FAj7/LhNV+l8KiYg==
X-Received: by 2002:a81:5ed4:: with SMTP id
 s203mr14106281ywb.427.1572298970745; 
 Mon, 28 Oct 2019 14:42:50 -0700 (PDT)
Received: from tr4.amd.com (atlvpn.amd.com. [165.204.84.11])
 by smtp.gmail.com with ESMTPSA id l68sm3421090ywf.95.2019.10.28.14.42.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Oct 2019 14:42:50 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org, alsa-devel@alsa-project.org, tiwai@suse.de,
 lukas@wunner.de
Date: Mon, 28 Oct 2019 17:41:56 -0400
Message-Id: <20191028214216.1508370-2-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191028214216.1508370-1-alexander.deucher@amd.com>
References: <20191028214216.1508370-1-alexander.deucher@amd.com>
MIME-Version: 1.0
Cc: Alex Deucher <alexander.deucher@amd.com>, Evan Quan <evan.quan@amd.com>
Subject: [alsa-devel] [PATCH 01/21] drm/amdgpu: add asic callback for BACO
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
index ffa7be1b9125..00cc43f74be1 100644
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
@@ -1118,6 +1120,8 @@ int emu_soc_asic_init(struct amdgpu_device *adev);
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
