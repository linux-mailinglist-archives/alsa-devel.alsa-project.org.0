Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AAA88E7BD6
	for <lists+alsa-devel@lfdr.de>; Mon, 28 Oct 2019 22:56:15 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 46E5C2118;
	Mon, 28 Oct 2019 22:55:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 46E5C2118
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1572299775;
	bh=f68cRtuTxgppKj9xj8za+2KiGfNtA9XxbrZX8bn5F+U=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bnWSDA9H031UUyxMlPg5Od+qMS3RUiYU0nNLICWDBm4sIlsUF+e231daLraIeVbef
	 vTSw52MQxSrBw+K6Cc+h+jziGOh9GUWi7P8NALYAcztQzzviELZrdC7gzK+T8icJhj
	 M5EmgDXRBhjaZOISC/bn1GpM1ZlM1qCHeknQ6xX0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E3494F8075E;
	Mon, 28 Oct 2019 22:43:59 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9BE2EF8075C; Mon, 28 Oct 2019 22:43:57 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-yw1-xc43.google.com (mail-yw1-xc43.google.com
 [IPv6:2607:f8b0:4864:20::c43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7771EF803D6
 for <alsa-devel@alsa-project.org>; Mon, 28 Oct 2019 22:43:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7771EF803D6
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="QwRFUTxu"
Received: by mail-yw1-xc43.google.com with SMTP id s6so4372809ywe.5
 for <alsa-devel@alsa-project.org>; Mon, 28 Oct 2019 14:43:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CWZrm86EYWE5tSdL+2GWYcKokLwlyLKtZplRBnKgV38=;
 b=QwRFUTxuoTS6fLYPUcpL0+YIe3TDrEK0pLO3t07rzEq/PkbaYmu9SfdOtS+0f5rV9m
 N3MWenmX1sLm8rnoGGBgm2T9WTpTGiY4ZPymoXMt9dsNors7YWQE8Z+J8wUK/znW1qtY
 y2+019ISnq+P1RitC1U6Nvp/VUCMDWkUSfI87Yo/qBeQRMhLeaQM7k1tf2Ycy68VbQdo
 y4eGHOKP9+GPuQimHfOampbWYqfXt/GyVUaMmgUzyesoZZXs5jHbymt6LUrKmBtLeJoc
 YL6CXpuMfVME/cJQmjZ93+yclQCNKxuZMkXBc+EhRiViuQzwApjRfxnim2Oe9dleVU3k
 +yaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CWZrm86EYWE5tSdL+2GWYcKokLwlyLKtZplRBnKgV38=;
 b=Bp/xI+5XsUQzwX4HfyKTZ/aUG0N0UvXCK5M0UABLIJ9IwOaHxgqjwSfVIz8ecd/ClQ
 3w19Ga2F22pIWtJ7JvShri2Yu/HWqwWeFctX55gB2IJ4nTH2eVGxadtCuw+WH3/lK/ul
 AHhzFMn3ZFyqqtWslB/pNg6oSwKrX3l7LQ8z0zpRxy26m53+RK9VJWO1U4YIBv2szC6I
 YPdOff1AmYpco5lbHQcWfvsVp9clGHYz2H6s56Khq5wqf5NFeytzRwU/wFVK33EqQJGW
 Sbf7Mr6Xgy5sN5MOVXMsj/WX+TBgfnBg0Fz8Cy18Z1+thANJ6h2Cpi7oUDItuIVKd03G
 Ia2w==
X-Gm-Message-State: APjAAAWWn4CV0v+8C0UivEnXCnlNQ+dVcCTKJHhZR/J39WrRuttVYeF6
 zfYIsCg5siJmJDlY+XJCi1o=
X-Google-Smtp-Source: APXvYqyzgQb5T9V0F/VHF4Uy4pbYjowbEgK6tF1/eOpR3dtb5MyG3bAkHpUCBhkEnONE4E9jyv5FDQ==
X-Received: by 2002:a81:c214:: with SMTP id z20mr14391744ywc.170.1572299033192; 
 Mon, 28 Oct 2019 14:43:53 -0700 (PDT)
Received: from tr4.amd.com (atlvpn.amd.com. [165.204.84.11])
 by smtp.gmail.com with ESMTPSA id l68sm3421090ywf.95.2019.10.28.14.43.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Oct 2019 14:43:52 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org, alsa-devel@alsa-project.org, tiwai@suse.de,
 lukas@wunner.de
Date: Mon, 28 Oct 2019 17:42:12 -0400
Message-Id: <20191028214216.1508370-18-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191028214216.1508370-1-alexander.deucher@amd.com>
References: <20191028214216.1508370-1-alexander.deucher@amd.com>
MIME-Version: 1.0
Cc: Alex Deucher <alexander.deucher@amd.com>, Evan Quan <evan.quan@amd.com>
Subject: [alsa-devel] [PATCH 17/21] drm/amdgpu/runpm: enable runpm on baco
	capable VI+ asics
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

Seems to work reliably on VI+.

Reviewed-by: Evan Quan <evan.quan@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
index cdb9b1caa962..ee3e9194dd43 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
@@ -170,10 +170,14 @@ int amdgpu_driver_load_kms(struct drm_device *dev, unsigned long flags)
 	}
 
 	if (amdgpu_device_supports_boco(dev) &&
-	    (amdgpu_runtime_pm != 0)) /* enable runpm by default */
+	    (amdgpu_runtime_pm != 0)) /* enable runpm by default for boco */
 		adev->runpm = true;
 	else if (amdgpu_device_supports_baco(dev) &&
-		 (amdgpu_runtime_pm > 0)) /* enable runpm if runpm=1 */
+		 (amdgpu_runtime_pm != 0) &&
+		 (adev->asic_type >= CHIP_TOPAZ)) /* enable runpm by default on VI+ */
+		adev->runpm = true;
+	else if (amdgpu_device_supports_baco(dev) &&
+		 (amdgpu_runtime_pm > 0))  /* enable runpm if runpm=1 on CI */
 		adev->runpm = true;
 
 	/* Call ACPI methods: require modeset init
-- 
2.23.0

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
