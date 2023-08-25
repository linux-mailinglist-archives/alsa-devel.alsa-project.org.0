Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 488A278A05D
	for <lists+alsa-devel@lfdr.de>; Sun, 27 Aug 2023 19:05:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D1E30950;
	Sun, 27 Aug 2023 19:04:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D1E30950
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1693155932;
	bh=xaX3drOXejzp+rmUXA2gyRdD/lZrFKtAdFcAZJTE1KA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Rb1kppAp429Y0vgUWG/wGCYpr2o8XCqt8jOnwtzq5yTeR9+4gS6dl1x9gAmhf/UsB
	 TwpycNv17CUr98TE9g8VN9QF51Q4kWpVuRw0dJ6Q03QkIZz5805X+frZkpUEfcuuo5
	 1sEK8XAf/J18gmr70unvFxpU2RbCilHFn0ZIBKE8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 41219F805D3; Sun, 27 Aug 2023 19:02:18 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B8266F805D6;
	Sun, 27 Aug 2023 19:02:17 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DB6BBF800F5; Fri, 25 Aug 2023 08:27:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from out-40.mta1.migadu.com (out-40.mta1.migadu.com [95.215.58.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E72CDF80158
	for <alsa-devel@alsa-project.org>; Fri, 25 Aug 2023 08:27:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E72CDF80158
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256
 header.s=key1 header.b=xGiuH5OB
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1692944859;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wTA7bapxplGCnZjVDiPGvbUqrHLJXwFDRMTQ/Lj8/HE=;
	b=xGiuH5OBd++On3BrycBzuioMtaX2agvln1PBzVzQu/x0OZDbgoFgvDf6fWfHxc0n1L3VAN
	y6FoqMZ8veBkMFIVMnCTQiZgUkHh2lHd3kESt2wuULl1bBQuT5deUKizVb5T4KjXJNCf7o
	rd1OAKaROEGNaEtx0iiLhAjv82tun74=
From: Sui Jingfeng <sui.jingfeng@linux.dev>
To: Bjorn Helgaas <bhelgaas@google.com>
Cc: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	nouveau@lists.freedesktop.org,
	linux-pci@vger.kernel.org,
	alsa-devel@alsa-project.org,
	Sui Jingfeng <suijingfeng@loongson.cn>,
	Alex Deucher <alexander.deucher@amd.com>
Subject: [PATCH 5/5] drm/radeon: Use pci_get_base_class() to reduce duplicated
 code
Date: Fri, 25 Aug 2023 14:27:14 +0800
Message-Id: <20230825062714.6325-6-sui.jingfeng@linux.dev>
In-Reply-To: <20230825062714.6325-1-sui.jingfeng@linux.dev>
References: <20230825062714.6325-1-sui.jingfeng@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-MailFrom: sui.jingfeng@linux.dev
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: MLOFCEQT7DZQ3GJJS32T5XL74YD5MANN
X-Message-ID-Hash: MLOFCEQT7DZQ3GJJS32T5XL74YD5MANN
X-Mailman-Approved-At: Sun, 27 Aug 2023 17:02:15 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MLOFCEQT7DZQ3GJJS32T5XL74YD5MANN/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Sui Jingfeng <suijingfeng@loongson.cn>

Should be no functional change.

Cc: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sui Jingfeng <suijingfeng@loongson.cn>
---
 drivers/gpu/drm/radeon/radeon_bios.c | 20 +++++---------------
 1 file changed, 5 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/radeon/radeon_bios.c b/drivers/gpu/drm/radeon/radeon_bios.c
index 63bdc9f6fc24..3a8c5199a0fe 100644
--- a/drivers/gpu/drm/radeon/radeon_bios.c
+++ b/drivers/gpu/drm/radeon/radeon_bios.c
@@ -199,7 +199,11 @@ static bool radeon_atrm_get_bios(struct radeon_device *rdev)
 	if (rdev->flags & RADEON_IS_IGP)
 		return false;
 
-	while ((pdev = pci_get_class(PCI_CLASS_DISPLAY_VGA << 8, pdev)) != NULL) {
+	while ((pdev = pci_get_base_class(PCI_BASE_CLASS_DISPLAY, pdev))) {
+		if ((pdev->class != PCI_CLASS_DISPLAY_VGA << 8) &&
+		    (pdev->class != PCI_CLASS_DISPLAY_OTHER << 8))
+			continue;
+
 		dhandle = ACPI_HANDLE(&pdev->dev);
 		if (!dhandle)
 			continue;
@@ -211,20 +215,6 @@ static bool radeon_atrm_get_bios(struct radeon_device *rdev)
 		}
 	}
 
-	if (!found) {
-		while ((pdev = pci_get_class(PCI_CLASS_DISPLAY_OTHER << 8, pdev)) != NULL) {
-			dhandle = ACPI_HANDLE(&pdev->dev);
-			if (!dhandle)
-				continue;
-
-			status = acpi_get_handle(dhandle, "ATRM", &atrm_handle);
-			if (ACPI_SUCCESS(status)) {
-				found = true;
-				break;
-			}
-		}
-	}
-
 	if (!found)
 		return false;
 	pci_dev_put(pdev);
-- 
2.34.1

