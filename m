Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D7D4E7BC5
	for <lists+alsa-devel@lfdr.de>; Mon, 28 Oct 2019 22:50:38 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 24614215B;
	Mon, 28 Oct 2019 22:49:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 24614215B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1572299438;
	bh=zBdNbKyptyD4EF9V4k8S6gBE8mMbKSBj+Q1WZZX/zMY=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=MkpfoDqQTHk6QZKEtLcG6xWqmhVGVHMXeHmnvlgPG8ED/0d0bnns4SXDjGYyhUfkF
	 /UrjvyuDhKQTNC6YLe6sPS/EnM51qmHuW2RcO14UllXZRTjfyhoEkik+gbMefvXNCx
	 ygLRb7OfP9yOvWfL1VXu1cQlwsMxiXAJX5oIrgyo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B6BCEF8068A;
	Mon, 28 Oct 2019 22:43:31 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 80DA2F8067C; Mon, 28 Oct 2019 22:43:28 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-yw1-xc42.google.com (mail-yw1-xc42.google.com
 [IPv6:2607:f8b0:4864:20::c42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D19D9F80677
 for <alsa-devel@alsa-project.org>; Mon, 28 Oct 2019 22:43:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D19D9F80677
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="rWasITr/"
Received: by mail-yw1-xc42.google.com with SMTP id d192so4377701ywa.1
 for <alsa-devel@alsa-project.org>; Mon, 28 Oct 2019 14:43:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tbg+nGZs28cfdi4lLSwu0wN/GLAMpH0syoOpZnLkTNQ=;
 b=rWasITr/0jsEy1mN+Ka/9Le/gpZ4XdPbp/N/QbpcqXBC4lSu4+Ql3nC1c95KrHUgNo
 1MTazFeg7AdbkGnsqnFvqR+XUMcsl6sMlSFkJZLSr/nud9SveDP5OFgRgwlmrn5Mo6j5
 Ynj3w0BYjX7xpcv//ClKU95pmAVwbwdg/AIEcYFsBtMgBd3FghI5XislekLHbLf4pPwl
 x50h/pD5vJ7bzy31acswM9eMKGRd26mP50pbaZbpJuzsnWCABjKg7gIO3/psfny4dJ4K
 Hituo+ofKPH4qvFFYzGzxsaBfgcig/sNqtkUFwgtsKLSFHF6HsqvEeia6GyHK4snYL+Z
 HooQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tbg+nGZs28cfdi4lLSwu0wN/GLAMpH0syoOpZnLkTNQ=;
 b=nlTODvq9JbKfPud1W8MQiPs5ECX3NF13pIA9zda4llVrdROUQTZ1R2JYKBnDo6WsqC
 SnKSDbOQzDDF+hxZ0YTgiMUjfOwIpH0/l2v2bYgUw+y8mt0D7GTHiyN0SKA3HJ6js18I
 2LGe1Yo5ynpffsO34SQoSeqIzzQAMclkUxROjOTYngFWJGyeHNk2+pR2iVwubr/p6wED
 vo6x/aqSGcVu4+6y/IxVk7IiKGfqI5J203cz6DVqHce2GUye+uhLyYE5HfYXD7EgodaL
 Hw9itAaYyTNSzt6gWvtXmi9DKQDKM2gy6VlCmWmVbc807wPo0YiCs6W50UWJKwURKQHX
 /sXg==
X-Gm-Message-State: APjAAAWCNihJWob6Yn8yqX+kzWbe6rQ87gDjRmjHqhfoIGi/jPoQ7wAI
 w+Yw0f2Y4bX82X4BcUejy7U=
X-Google-Smtp-Source: APXvYqzP2Ti26LoW6HupwE2mT1DU+9HALPRm9lRVVWgKkJGI8mB3ybkldJmxWVpKaRp8kMoZAa9JwQ==
X-Received: by 2002:a0d:c985:: with SMTP id l127mr14915831ywd.68.1572299003959; 
 Mon, 28 Oct 2019 14:43:23 -0700 (PDT)
Received: from tr4.amd.com (atlvpn.amd.com. [165.204.84.11])
 by smtp.gmail.com with ESMTPSA id l68sm3421090ywf.95.2019.10.28.14.43.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Oct 2019 14:43:23 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org, alsa-devel@alsa-project.org, tiwai@suse.de,
 lukas@wunner.de
Date: Mon, 28 Oct 2019 17:42:05 -0400
Message-Id: <20191028214216.1508370-11-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191028214216.1508370-1-alexander.deucher@amd.com>
References: <20191028214216.1508370-1-alexander.deucher@amd.com>
MIME-Version: 1.0
Cc: Alex Deucher <alexander.deucher@amd.com>, Evan Quan <evan.quan@amd.com>
Subject: [alsa-devel] [PATCH 10/21] drm/amdgpu: add additional boco checks
	to runtime suspend/resume (v2)
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
BOCO - Bus Off, Chip Off

We will take slightly different paths for boco and baco.

v2: fold together two consecutive if clauses

Reviewed-by: Evan Quan <evan.quan@amd.com> (v1)
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c | 47 ++++++++++++++-----------
 1 file changed, 26 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
index 310182bf1db5..7b8478d08b2b 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
@@ -1217,18 +1217,21 @@ static int amdgpu_pmops_runtime_suspend(struct device *dev)
 		return -EBUSY;
 	}
 
-	drm_dev->switch_power_state = DRM_SWITCH_POWER_CHANGING;
+	if (amdgpu_device_supports_boco(drm_dev))
+		drm_dev->switch_power_state = DRM_SWITCH_POWER_CHANGING;
 	drm_kms_helper_poll_disable(drm_dev);
 
 	ret = amdgpu_device_suspend(drm_dev, false, false);
-	pci_save_state(pdev);
-	pci_disable_device(pdev);
-	pci_ignore_hotplug(pdev);
-	if (amdgpu_is_atpx_hybrid())
-		pci_set_power_state(pdev, PCI_D3cold);
-	else if (!amdgpu_has_atpx_dgpu_power_cntl())
-		pci_set_power_state(pdev, PCI_D3hot);
-	drm_dev->switch_power_state = DRM_SWITCH_POWER_DYNAMIC_OFF;
+	if (amdgpu_device_supports_boco(drm_dev)) {
+		pci_save_state(pdev);
+		pci_disable_device(pdev);
+		pci_ignore_hotplug(pdev);
+		if (amdgpu_is_atpx_hybrid())
+			pci_set_power_state(pdev, PCI_D3cold);
+		else if (!amdgpu_has_atpx_dgpu_power_cntl())
+			pci_set_power_state(pdev, PCI_D3hot);
+		drm_dev->switch_power_state = DRM_SWITCH_POWER_DYNAMIC_OFF;
+	}
 
 	return 0;
 }
@@ -1242,20 +1245,22 @@ static int amdgpu_pmops_runtime_resume(struct device *dev)
 	if (!amdgpu_device_supports_boco(drm_dev))
 		return -EINVAL;
 
-	drm_dev->switch_power_state = DRM_SWITCH_POWER_CHANGING;
-
-	if (amdgpu_is_atpx_hybrid() ||
-	    !amdgpu_has_atpx_dgpu_power_cntl())
-		pci_set_power_state(pdev, PCI_D0);
-	pci_restore_state(pdev);
-	ret = pci_enable_device(pdev);
-	if (ret)
-		return ret;
-	pci_set_master(pdev);
-
+	if (amdgpu_device_supports_boco(drm_dev)) {
+		drm_dev->switch_power_state = DRM_SWITCH_POWER_CHANGING;
+
+		if (amdgpu_is_atpx_hybrid() ||
+		    !amdgpu_has_atpx_dgpu_power_cntl())
+			pci_set_power_state(pdev, PCI_D0);
+		pci_restore_state(pdev);
+		ret = pci_enable_device(pdev);
+		if (ret)
+			return ret;
+		pci_set_master(pdev);
+	}
 	ret = amdgpu_device_resume(drm_dev, false, false);
 	drm_kms_helper_poll_enable(drm_dev);
-	drm_dev->switch_power_state = DRM_SWITCH_POWER_ON;
+	if (amdgpu_device_supports_boco(drm_dev))
+		drm_dev->switch_power_state = DRM_SWITCH_POWER_ON;
 	return 0;
 }
 
-- 
2.23.0

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
