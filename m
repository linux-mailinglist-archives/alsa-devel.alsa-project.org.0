Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 26719FE376
	for <lists+alsa-devel@lfdr.de>; Fri, 15 Nov 2019 17:56:50 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AD8EA1672;
	Fri, 15 Nov 2019 17:55:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AD8EA1672
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1573837009;
	bh=XjFk5+G2aKMI/dwV+6Q89RxqQcMFI8eUX0IU/V5nAE4=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=KHanCdbVH3DU7PknXU20ESJNMO6Sq8nDUA7psdm3WUBsO6fQ01OFNO5O0Q/UThGqt
	 BPjELenf0e82wIuFOSMOhJa1qu7OnCI2Y5+4u2HONXHkWb/LkA/Rhc9NwSWQhshvgD
	 3eBBUSez/taZBUtrNpntN3Qu/wDJ2fOFMGxjxMhY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1A69CF8011A;
	Fri, 15 Nov 2019 17:51:24 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6967CF800FF; Fri, 15 Nov 2019 17:51:00 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-qv1-xf42.google.com (mail-qv1-xf42.google.com
 [IPv6:2607:f8b0:4864:20::f42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0153AF800FF
 for <alsa-devel@alsa-project.org>; Fri, 15 Nov 2019 17:50:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0153AF800FF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="m6ehfTKq"
Received: by mail-qv1-xf42.google.com with SMTP id w11so4012854qvu.13
 for <alsa-devel@alsa-project.org>; Fri, 15 Nov 2019 08:50:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YFNdZiRBH47JJt3PV/k6JXdY/UBci9TMzjiB91Hah6Q=;
 b=m6ehfTKqfIc8NVyjTALcLOchgkFOLjS+IY8p75qtHy1LcW5BRsOudAtKopwZ2HQve5
 Bp4kQv0SbdL2qhfxDMn6PsI8f6FRr9bqYqQe9KrhqC+Wu2FGFvkX2dQG8xolUi5IF4PS
 /S97Tb9Nm9BDChSttfdrlHqsBxmCkZh9YrnXoAHmjgU565Jns3j1JSc99xmgQxejKnWV
 ps1J/iV4kTV8OLdRFe/z8ngDDgKK84EUTNuPIkdK/wtqihtRTc428+Ap1MPodeRE0rx2
 9SXvSSuazGr/gYcEebbqjjgH0Ofpm4NirSn0H0pWUOJHyD1DbxcF5SBrGcT07z1jR0/a
 lg5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YFNdZiRBH47JJt3PV/k6JXdY/UBci9TMzjiB91Hah6Q=;
 b=dxIU5YLLA3Wfu6cPwALXbFHanzxhuxsjylrToULVE0h1SMVf8JkuLyXQ1iH9sJfRmy
 54pnoJSyMg1H6F+j7kwrSNLuzl4Ok+twaXUcIdKQht2W+7Tcp6bKhSrg627Baos0Wkd3
 LdgfT0hFb5O9JzVsQGbYiqKgoJErakMic2P4WzIkbmmvL/c9qYECm3nziWj6kRr6mYfD
 Hww41bQ5SCoSKFM8ycUX4uyy1weERFjtgt5+DmbLrzrpAJdiq8Y19abw02koh1+cvbWm
 vszf5IMeleW4Zao/joCObNCXd78ox7A1FgWMxuteUxLgbXOO2L+SrhrrP5Lk6wtNnmn2
 zyBQ==
X-Gm-Message-State: APjAAAUiG1fuZqAwa0cXeRVJ76ry/CW0J4HLsK9E3jv0iVrG0xGiU78n
 IGwv7M4T417dTyYnFOLMFyM=
X-Google-Smtp-Source: APXvYqwvz4kqKZe6zrjTPBGMJYJepFu1QqBw8MQt5Bv0C3r72WF5lVuUp/auNtzOQBLUrd7Huz07pg==
X-Received: by 2002:a05:6214:11a9:: with SMTP id
 u9mr14430458qvv.126.1573836653174; 
 Fri, 15 Nov 2019 08:50:53 -0800 (PST)
Received: from localhost.localdomain ([71.219.59.120])
 by smtp.gmail.com with ESMTPSA id r29sm5610331qtb.63.2019.11.15.08.50.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Nov 2019 08:50:52 -0800 (PST)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org, alsa-devel@alsa-project.org, tiwai@suse.de,
 lukas@wunner.de
Date: Fri, 15 Nov 2019 11:50:24 -0500
Message-Id: <20191115165038.56646-7-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191115165038.56646-1-alexander.deucher@amd.com>
References: <20191115165038.56646-1-alexander.deucher@amd.com>
MIME-Version: 1.0
Cc: Alex Deucher <alexander.deucher@amd.com>, Evan Quan <evan.quan@amd.com>
Subject: [alsa-devel] [PATCH 06/20] drm/amdgpu: add supports_baco callback
	for NV asics.
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
 drivers/gpu/drm/amd/amdgpu/nv.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/nv.c b/drivers/gpu/drm/amd/amdgpu/nv.c
index 0ba66bef5746..b25b72a73048 100644
--- a/drivers/gpu/drm/amd/amdgpu/nv.c
+++ b/drivers/gpu/drm/amd/amdgpu/nv.c
@@ -314,6 +314,16 @@ static int nv_asic_mode1_reset(struct amdgpu_device *adev)
 	return ret;
 }
 
+static bool nv_asic_supports_baco(struct amdgpu_device *adev)
+{
+	struct smu_context *smu = &adev->smu;
+
+	if (smu_baco_is_support(smu))
+		return true;
+	else
+		return false;
+}
+
 static enum amd_reset_method
 nv_asic_reset_method(struct amdgpu_device *adev)
 {
@@ -617,6 +627,7 @@ static const struct amdgpu_asic_funcs nv_asic_funcs =
 	.get_pcie_usage = &nv_get_pcie_usage,
 	.need_reset_on_init = &nv_need_reset_on_init,
 	.get_pcie_replay_count = &nv_get_pcie_replay_count,
+	.supports_baco = &nv_asic_supports_baco,
 };
 
 static int nv_common_early_init(void *handle)
-- 
2.23.0

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
