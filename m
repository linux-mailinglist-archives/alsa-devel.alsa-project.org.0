Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C8765FE38B
	for <lists+alsa-devel@lfdr.de>; Fri, 15 Nov 2019 18:02:46 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 571E21677;
	Fri, 15 Nov 2019 18:01:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 571E21677
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1573837366;
	bh=X9lQ3URHey0fD3QaF/Oc2SPGkPLEumg7rw6kbA9SuZ4=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HNi9SfGhuqY3X6rigoX5kUAkQgyaUVeKaiRtyfy2iQk9sljs183Ax6VK0R3eQm3l6
	 W+jSM6os3sEh9Jxy1M3IWYtnmFYqu9Evm2hCqvnlYrOu7aGVhamDj2E9m7dQw/ccQw
	 xyAmhJGdPxFXEtPtbQ957C2fFHgN7yhPu7CTBiWc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EDC10F80249;
	Fri, 15 Nov 2019 17:51:37 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 56136F8014D; Fri, 15 Nov 2019 17:51:22 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-qk1-x743.google.com (mail-qk1-x743.google.com
 [IPv6:2607:f8b0:4864:20::743])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 719FEF8011A
 for <alsa-devel@alsa-project.org>; Fri, 15 Nov 2019 17:51:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 719FEF8011A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="SpM0Uh/Q"
Received: by mail-qk1-x743.google.com with SMTP id 71so8639959qkl.0
 for <alsa-devel@alsa-project.org>; Fri, 15 Nov 2019 08:51:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4qojIgGbWEnHYfN+shtVDFUDibgxQlLZqNEeWIlyiqA=;
 b=SpM0Uh/QsUtC36uuYwiwGmlUU/sbXM1nibYLSieH6JFEER108IkPpW//9qpkPyM6/M
 0tdtziZy7XuigeACpL3zOjAF7+1xGgtpeTsSlKHJu8RH5HvB6cNftxPHuN4h9Amt8udI
 KpRd6ApRceGJ1Sme4p8TaWB4VjAIzLw0+9BWtV9D0BTauSERP+s24sVRzPxVbJ7tGe83
 ZNV9asGmkRoLWSMbb+fMSSw3/Zvp9gUj7tvQ8nRMWDZR36bfqOcKPVKkxIgnPu/A2NsL
 9dW6fgfsCNbnfP2YJQa+UEFieO3NyK+vBxrEfY0Rr9OYLHXLP46cuFXKuggQD5BOcV/f
 srCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4qojIgGbWEnHYfN+shtVDFUDibgxQlLZqNEeWIlyiqA=;
 b=qLtDv5xCh2qK9mWQMlPbiYOlg9VI2V7WuYxjicslZNUmtDc75I4ser559R79FQD7ib
 5fIzug70xP7mjb7r3mjXco8q32TylwN8WUBPqXEk0dFy2TJu+/lsl/Dpv7GgZP8hWpxw
 Uzf/SfL6JBNMqjIH95FmQQE3GsTvassa218olY1XZMFXsGksDq/px7j/UxKUB0Jky1iv
 6H4CBY0Mzmsraw9WgM1rVltceXdI09eleoU1/fXdNgNL21CG6SVrGo4jjHE7UygD9qDy
 fMaozIi1QNZ9lALAwhHOgoWM+1o3/+wiaTDqr40pa3wwqmp3NYH7edx+bXSbwE8EP9NU
 qGeA==
X-Gm-Message-State: APjAAAXKWWn84DlKQStA4xGE6errQ6+9jkctFHHjyqEIO1k/h+RF9JmB
 7EfxlTZTwXAPmIjtTVrNJC8=
X-Google-Smtp-Source: APXvYqx8zWWe9iN+OHngtO6IBQGnPAjCQGrhhGw8F5lc25PXwubLu0JRPffOnhe99olIpvVSIIrQPw==
X-Received: by 2002:a37:470b:: with SMTP id u11mr13595211qka.172.1573836661881; 
 Fri, 15 Nov 2019 08:51:01 -0800 (PST)
Received: from localhost.localdomain ([71.219.59.120])
 by smtp.gmail.com with ESMTPSA id r29sm5610331qtb.63.2019.11.15.08.51.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Nov 2019 08:51:01 -0800 (PST)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org, alsa-devel@alsa-project.org, tiwai@suse.de,
 lukas@wunner.de
Date: Fri, 15 Nov 2019 11:50:33 -0500
Message-Id: <20191115165038.56646-16-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191115165038.56646-1-alexander.deucher@amd.com>
References: <20191115165038.56646-1-alexander.deucher@amd.com>
MIME-Version: 1.0
Cc: Alex Deucher <alexander.deucher@amd.com>, Evan Quan <evan.quan@amd.com>
Subject: [alsa-devel] [PATCH 15/20] drm/amdgpu: enable runtime pm on BACO
	capable boards if runpm=1
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

Everything is in place now.  Not enabled by default yet.  You
still have to specify runpm=1.

Reviewed-by: Evan Quan <evan.quan@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
index 89b021c54b93..169db941f933 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
@@ -157,10 +157,6 @@ int amdgpu_driver_load_kms(struct drm_device *dev, unsigned long flags)
 	    !pci_is_thunderbolt_attached(dev->pdev))
 		flags |= AMD_IS_PX;
 
-	if ((amdgpu_runtime_pm != 0) &&
-	    (flags & AMD_IS_PX))
-		adev->runpm = true;
-
 	/* amdgpu_device_init should report only fatal error
 	 * like memory allocation failure or iomapping failure,
 	 * or memory manager initialization failure, it must
@@ -173,6 +169,13 @@ int amdgpu_driver_load_kms(struct drm_device *dev, unsigned long flags)
 		goto out;
 	}
 
+	if (amdgpu_device_supports_boco(dev) &&
+	    (amdgpu_runtime_pm != 0)) /* enable runpm by default */
+		adev->runpm = true;
+	else if (amdgpu_device_supports_baco(dev) &&
+		 (amdgpu_runtime_pm > 0)) /* enable runpm if runpm=1 */
+		adev->runpm = true;
+
 	/* Call ACPI methods: require modeset init
 	 * but failure is not fatal
 	 */
-- 
2.23.0

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
