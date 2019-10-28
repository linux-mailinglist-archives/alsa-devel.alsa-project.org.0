Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A5947E7BBC
	for <lists+alsa-devel@lfdr.de>; Mon, 28 Oct 2019 22:48:50 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 235F9214A;
	Mon, 28 Oct 2019 22:48:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 235F9214A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1572299330;
	bh=kLY6zpEdWqLQX4p9jtgwkbMA4rhs/24YQ5LBgJrlOmk=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Er+7b02lzVXaaiM6Rb7S0HvxgVH2hUvwHgTuYLVWBVODYKux0lyRei4z3WaN/F1Um
	 VhXUPcbJVcMIbTTxF2k62zG+U/nbpMY7S4rT+XUIPflfQs0pVgflZJLi1RbXQI2wp0
	 PWek/RYGNFEpYjwCQSgNC77KzBxK88o9fTpNI8F0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 569DAF8065A;
	Mon, 28 Oct 2019 22:43:16 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7B8CDF80659; Mon, 28 Oct 2019 22:43:13 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-yb1-xb41.google.com (mail-yb1-xb41.google.com
 [IPv6:2607:f8b0:4864:20::b41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DA110F80635
 for <alsa-devel@alsa-project.org>; Mon, 28 Oct 2019 22:43:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DA110F80635
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="AqHCmSMn"
Received: by mail-yb1-xb41.google.com with SMTP id m1so4644343ybm.1
 for <alsa-devel@alsa-project.org>; Mon, 28 Oct 2019 14:43:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qucmBK8296Afdjp1xdtDTe1Y7Yf+ZSue6Gan8Ja2z+8=;
 b=AqHCmSMnEk7GaUGG8kP+OTr5LZdzBxqYZ5pj0zJd51A+VNv7Q22zwBThgHPpzxIKH2
 HoUjmwSFAnL3buNogPZjwnttstf7c9PpMEGLiUDVVfphS3uilS1QzeLWwuhhM/JS7VQZ
 vMDT/hD5vPwpmYTzr1ynIqG7Tck7OYLKZGqUznTdNIKR4+JQVbF58f9pc+dT26lExvQO
 cvR54gU6MvpU3kEOGhZZY9A3AM8Y9nJlYgyBnQct/yEMzNjgySiRQfptLDevYXtB9uOO
 wzxRwlejDlDvTufgYfcl8jmuRA7cXFkwUjthIZrCAP3KMlr2m7i8ngZeK1kLpe729ZDK
 KO0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qucmBK8296Afdjp1xdtDTe1Y7Yf+ZSue6Gan8Ja2z+8=;
 b=lEwNY5CCYJ7sn/Wb34gThx472iG9AIKnC+FoSEtl7DfvMkUoy3QSA5BflEGbBGvh/q
 Ero/dCUa/XyyBpLqxhOH4luBTs56CBAqah1et5co0YXzeQux0A/Y7WqwqKPosuOAS/xd
 SbZjv6jRxYJhKIh4ureUyvIE2KQSJzSnvqgNMMKwZxDLW1EUVeCRnw4AM2MUm2qRQ6sJ
 l+B/IgxTDDtQcYEc8HFAMrNeVLG9g61V9WJ00XcRic2ONTjxCVczAd/TZfz/fnM2EXSA
 nQ7D0UG97/mkN95bEpGHk5m8g4SEAcCYXGoaS1swNq5klPh9dRI0BO7YX1lvOXFea4c3
 CaeA==
X-Gm-Message-State: APjAAAVrk/2eeyJl+WsXM0XGDgnj38HEnLWmq5PO/zWEdLkbzuygrY0K
 Gm33aY9B6jU3/BMWqIorXRY=
X-Google-Smtp-Source: APXvYqwXA1cwOWR46RFBa9t7RraBeNXdAhOh/cb2amOGjqWzhsI86cX2qFq8MQwbb/KaG2ppnIGN4A==
X-Received: by 2002:a25:80c1:: with SMTP id c1mr16075831ybm.195.1572298989667; 
 Mon, 28 Oct 2019 14:43:09 -0700 (PDT)
Received: from tr4.amd.com (atlvpn.amd.com. [165.204.84.11])
 by smtp.gmail.com with ESMTPSA id l68sm3421090ywf.95.2019.10.28.14.43.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Oct 2019 14:43:09 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org, alsa-devel@alsa-project.org, tiwai@suse.de,
 lukas@wunner.de
Date: Mon, 28 Oct 2019 17:42:01 -0400
Message-Id: <20191028214216.1508370-7-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191028214216.1508370-1-alexander.deucher@amd.com>
References: <20191028214216.1508370-1-alexander.deucher@amd.com>
MIME-Version: 1.0
Cc: Alex Deucher <alexander.deucher@amd.com>, Evan Quan <evan.quan@amd.com>
Subject: [alsa-devel] [PATCH 06/21] drm/amdgpu: add supports_baco callback
	for VI asics.
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
 drivers/gpu/drm/amd/amdgpu/vi.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/vi.c b/drivers/gpu/drm/amd/amdgpu/vi.c
index 78e5cdc0c058..871c0b8c6b0b 100644
--- a/drivers/gpu/drm/amd/amdgpu/vi.c
+++ b/drivers/gpu/drm/amd/amdgpu/vi.c
@@ -745,6 +745,27 @@ static int vi_asic_pci_config_reset(struct amdgpu_device *adev)
 	return r;
 }
 
+static bool vi_asic_supports_baco(struct amdgpu_device *adev)
+{
+	bool baco_support;
+
+	switch (adev->asic_type) {
+	case CHIP_FIJI:
+	case CHIP_TONGA:
+	case CHIP_POLARIS10:
+	case CHIP_POLARIS11:
+	case CHIP_POLARIS12:
+	case CHIP_TOPAZ:
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
 vi_asic_reset_method(struct amdgpu_device *adev)
 {
@@ -1116,6 +1137,7 @@ static const struct amdgpu_asic_funcs vi_asic_funcs =
 	.get_pcie_usage = &vi_get_pcie_usage,
 	.need_reset_on_init = &vi_need_reset_on_init,
 	.get_pcie_replay_count = &vi_get_pcie_replay_count,
+	.supports_baco = &vi_asic_supports_baco,
 };
 
 #define CZ_REV_BRISTOL(rev)	 \
-- 
2.23.0

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
