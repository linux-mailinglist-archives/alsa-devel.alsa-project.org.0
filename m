Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A85469983D
	for <lists+alsa-devel@lfdr.de>; Thu, 16 Feb 2023 16:02:46 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 67129F30;
	Thu, 16 Feb 2023 16:01:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 67129F30
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1676559765;
	bh=eAjTKRlwKTKkINH2Yg5KjjgYTY2NpeGUzLbBUhTX9bM=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=oaGC7Q9mgsy7RM7ye3NMliiIY8KfMnhpOPoniGNOpvDn8PiSA0g76CQLTbWrlQt7t
	 6NKthOSOx4EK6Iogd9L44XRQ489opWbxAdMVFToKNj1CeUICulPwtxxO/3ZGDD6iYI
	 44pPjgxDKivJbjvsHScm2fNw15fmAlRmlstTGnMg=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D0AE7F80606;
	Thu, 16 Feb 2023 15:56:07 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3E8FAF800E4; Fri, 10 Feb 2023 05:51:31 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com
 [IPv6:2607:f8b0:4864:20::1031])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A1967F80094
	for <alsa-devel@alsa-project.org>; Fri, 10 Feb 2023 05:51:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A1967F80094
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=mEtjIiol
Received: by mail-pj1-x1031.google.com with SMTP id
 s89-20020a17090a2f6200b0023125ebb4b1so4411836pjd.3
        for <alsa-devel@alsa-project.org>;
 Thu, 09 Feb 2023 20:51:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/p6GNpoWLwqRjkpemdg8r3B7YOn9VfnVEzWKh2GHgSQ=;
        b=mEtjIioleyGxYaWuQJaM9p/AxjJefiyXu8LvsMl3AaQryOfcQO+xfqyhuhj365eu1a
         VUd0vp9Y82wY4p5q7ciGrkQb3Q0pe2zuRNz7mpYuIUfypr4gKRJiSwcVFEEp3ROamt7m
         f2o0mcQ3EgkUlGtesmnyMPr6HrhJJA2Ruprd1ynnLyufZgZtgemKhsi3eDuODbrrNhHB
         mA/8oAfhdOG9+uUcSsPvyLanaDiqNIXatrwJlPNq1j9BVApCRbxk9iwtk5wWoRGELver
         8DpVkbsJHDyhJi8Zb+iXnkLj1W5w3xGyD/F6OSgWf+nDQkwi/NcMbz19PXiTc5stxZbr
         dchA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/p6GNpoWLwqRjkpemdg8r3B7YOn9VfnVEzWKh2GHgSQ=;
        b=0ie1BWr9VpO9rbHDHbUECTgZvD5fuFx1+GiMX1YT17Q//El0C5smc2TTzs5SJybG2j
         ULFrBq6d8QTFllBLEQqUvxRMvwueJGqNFx5chy2djDm9OfOzRP59NQDkyd7tzJpr1dD/
         FeUCS49M21nhHnDRq/48doM1dsH4KHarRmO470bsp1WaadC4XIrqlpIbq8iedKIjjYFN
         ExDpAdII7cj3JkTMIFZorWUpKyy5MGBkcCE9bHzUw8dS8YQ2mLSAOrEEbkaLir/b4Yjt
         7gYHHi9p7IvQ4eXg/LYKTLrATSy0XY30FuzVJjfNkhZo8ZVevNs8Ii1t8fr/2acRdafb
         kg3w==
X-Gm-Message-State: AO0yUKVjaoUWW8XE9goTAWwKQ0qjSr87i8b3D++9VXdot0TBiEh4M6pN
	MGhTGOHLGx6kmqyvw1b40E4=
X-Google-Smtp-Source: 
 AK7set8jSnGNm0tfiKRiMixhQZ/VY+kgsPUh9U4OTggadOBbCV4OPfkKzZmoBDm/AM7I3UA3B9lqiA==
X-Received: by 2002:a05:6a20:8f04:b0:bc:c07a:f6c with SMTP id
 b4-20020a056a208f0400b000bcc07a0f6cmr18379114pzk.16.1676004686432;
        Thu, 09 Feb 2023 20:51:26 -0800 (PST)
Received: from localhost.localdomain ([202.53.32.211])
        by smtp.gmail.com with ESMTPSA id
 t13-20020a62ea0d000000b0057fec210d33sm2269218pfh.152.2023.02.09.20.51.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Feb 2023 20:51:26 -0800 (PST)
From: Orlando Chamberlain <orlandoch.dev@gmail.com>
To: platform-driver-x86@vger.kernel.org,
	amd-gfx@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	alsa-devel@alsa-project.org
Subject: [RFC PATCH 9/9] drm/amdgpu: register a vga_switcheroo client for all
 GPUs that are not thunderbolt attached
Date: Fri, 10 Feb 2023 15:48:26 +1100
Message-Id: <20230210044826.9834-10-orlandoch.dev@gmail.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230210044826.9834-1-orlandoch.dev@gmail.com>
References: <20230210044826.9834-1-orlandoch.dev@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MailFrom: orlandoch.dev@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: YGU2IY7AOWGJOOLZBHY2TYDN5GEI7C26
X-Message-ID-Hash: YGU2IY7AOWGJOOLZBHY2TYDN5GEI7C26
X-Mailman-Approved-At: Thu, 16 Feb 2023 14:55:48 +0000
CC: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Hans de Goede <hdegoede@redhat.com>,
 Mark Gross <markgross@kernel.org>, Takashi Iwai <tiwai@suse.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>,
 Andrey Grodzovsky <andrey.grodzovsky@amd.com>,
 Lijo Lazar <lijo.lazar@amd.com>, YiPeng Chai <YiPeng.Chai@amd.com>,
 Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>,
 Mario Limonciello <mario.limonciello@amd.com>,
 Bokun Zhang <Bokun.Zhang@amd.com>, Jack Xiao <Jack.Xiao@amd.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Rander Wang <rander.wang@intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>, Yong Zhi <yong.zhi@intel.com>,
 Evan Quan <evan.quan@amd.com>, Kerem Karabay <kekrby@gmail.com>,
 Aditya Garg <gargaditya08@live.com>, Aun-Ali Zaidi <admin@kodeit.net>,
 Orlando Chamberlain <orlandoch.dev@gmail.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/YGU2IY7AOWGJOOLZBHY2TYDN5GEI7C26/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Kerem Karabay <kekrby@gmail.com>

Commit 3840c5bcc245 ("drm/amdgpu: disentangle runtime pm and
vga_switcheroo") made amdgpu only register a vga_switcheroo client for
GPU's with PX, however AMD GPUs in dual gpu Apple Macbooks do need to
register, but don't have PX. Instead of AMD's PX, they use apple-gmux.

Revert to the old logic of registering for all non-thunderbolt gpus,
like radeon and nouveau.

Fixes: 3840c5bcc245 ("drm/amdgpu: disentangle runtime pm and vga_switcheroo")
Signed-off-by: Kerem Karabay <kekrby@gmail.com>
[Orlando Chamberlain <orlandoch.dev@gmail.com>: add commit description]
Signed-off-by: Orlando Chamberlain <orlandoch.dev@gmail.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 18 +++++++++++-------
 1 file changed, 11 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
index 2f28a8c02f64..0bb553a61552 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
@@ -3919,12 +3919,13 @@ int amdgpu_device_init(struct amdgpu_device *adev,
 	if ((adev->pdev->class >> 8) == PCI_CLASS_DISPLAY_VGA)
 		vga_client_register(adev->pdev, amdgpu_device_vga_set_decode);
 
-	if (amdgpu_device_supports_px(ddev)) {
-		px = true;
-		vga_switcheroo_register_client(adev->pdev,
-					       &amdgpu_switcheroo_ops, px);
+	px = amdgpu_device_supports_px(ddev);
+
+	if (!pci_is_thunderbolt_attached(adev->pdev))
+		vga_switcheroo_register_client(adev->pdev, &amdgpu_switcheroo_ops, px);
+
+	if (px)
 		vga_switcheroo_init_domain_pm_ops(adev->dev, &adev->vga_pm_domain);
-	}
 
 	if (adev->gmc.xgmi.pending_reset)
 		queue_delayed_work(system_wq, &mgpu_info.delayed_reset_work,
@@ -4048,10 +4049,13 @@ void amdgpu_device_fini_sw(struct amdgpu_device *adev)
 
 	kfree(adev->bios);
 	adev->bios = NULL;
-	if (amdgpu_device_supports_px(adev_to_drm(adev))) {
+
+	if (!pci_is_thunderbolt_attached(adev->pdev))
 		vga_switcheroo_unregister_client(adev->pdev);
+
+	if (amdgpu_device_supports_px(adev_to_drm(adev)))
 		vga_switcheroo_fini_domain_pm_ops(adev->dev);
-	}
+
 	if ((adev->pdev->class >> 8) == PCI_CLASS_DISPLAY_VGA)
 		vga_client_unregister(adev->pdev);
 
-- 
2.39.1

