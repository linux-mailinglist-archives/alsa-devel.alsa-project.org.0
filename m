Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BA31878A05E
	for <lists+alsa-devel@lfdr.de>; Sun, 27 Aug 2023 19:05:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1DAB2E10;
	Sun, 27 Aug 2023 19:04:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1DAB2E10
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1693155942;
	bh=vBrC3PbaEeEOm8XbjHLB24U6qy1mN48eoCJxlA04oXc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=i1ozVlLvlgTaKa8b0bJbo+dgHMuBvVqhjYvl/rP9k8OxORUWG1fwZ+3B4TDW52J+2
	 gnnSpJ2IJdcgOmNtoohAb/lSYfgKr96ddU5grS1wWlokBAJTWVQ9CkgFP/QKTYlkmh
	 o75J7ovGDwDzSVXFtc4/mv8G8vtEmN4uXJSRyyKY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 29B61F805E0; Sun, 27 Aug 2023 19:02:20 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 545F8F805E0;
	Sun, 27 Aug 2023 19:02:20 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E57C0F8023B; Fri, 25 Aug 2023 08:27:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from out-61.mta1.migadu.com (out-61.mta1.migadu.com [95.215.58.61])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 18D10F80074
	for <alsa-devel@alsa-project.org>; Fri, 25 Aug 2023 08:27:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 18D10F80074
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256
 header.s=key1 header.b=azk9oKl/
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1692944857;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=x8g1PhZtieFXqvl5KlmXpfelaKvpJdAuWlFNqp32lxU=;
	b=azk9oKl/yWYIN5PPkoo3zBSOa5qD4a5Ttwotj7deRwg4VxJLVd1VH9ZPjzSxR8PPOtGk7H
	2eXNsnzhwSuxKFP68ub1/EATKxmpRZkXRApbQsGsMiJuZEaOOoibeOK2+BNWPK3PdLGpfw
	qaDtANXtL8laXrkLljPHNF5ob99FzAU=
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
Subject: [PATCH 4/5] drm/amdgpu: Use pci_get_base_class() to reduce duplicated
 code
Date: Fri, 25 Aug 2023 14:27:13 +0800
Message-Id: <20230825062714.6325-5-sui.jingfeng@linux.dev>
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
Message-ID-Hash: SJLZRUJS2NC6WSTONEGNFLM24RCWWD4B
X-Message-ID-Hash: SJLZRUJS2NC6WSTONEGNFLM24RCWWD4B
X-Mailman-Approved-At: Sun, 27 Aug 2023 17:02:16 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/SJLZRUJS2NC6WSTONEGNFLM24RCWWD4B/>
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
 drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c | 11 ++++-------
 drivers/gpu/drm/amd/amdgpu/amdgpu_bios.c | 20 +++++---------------
 2 files changed, 9 insertions(+), 22 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c
index a5a2b06c6588..4f18af877105 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c
@@ -1389,14 +1389,11 @@ void amdgpu_acpi_detect(void)
 	struct pci_dev *pdev = NULL;
 	int ret;
 
-	while ((pdev = pci_get_class(PCI_CLASS_DISPLAY_VGA << 8, pdev)) != NULL) {
-		if (!atif->handle)
-			amdgpu_atif_pci_probe_handle(pdev);
-		if (!atcs->handle)
-			amdgpu_atcs_pci_probe_handle(pdev);
-	}
+	while ((pdev = pci_get_base_class(PCI_BASE_CLASS_DISPLAY, pdev))) {
+		if ((pdev->class != PCI_CLASS_DISPLAY_VGA << 8) &&
+		    (pdev->class != PCI_CLASS_DISPLAY_OTHER << 8))
+			continue;
 
-	while ((pdev = pci_get_class(PCI_CLASS_DISPLAY_OTHER << 8, pdev)) != NULL) {
 		if (!atif->handle)
 			amdgpu_atif_pci_probe_handle(pdev);
 		if (!atcs->handle)
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_bios.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_bios.c
index 38ccec913f00..5bbb23e102ba 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_bios.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_bios.c
@@ -287,7 +287,11 @@ static bool amdgpu_atrm_get_bios(struct amdgpu_device *adev)
 	if (adev->flags & AMD_IS_APU)
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
@@ -299,20 +303,6 @@ static bool amdgpu_atrm_get_bios(struct amdgpu_device *adev)
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

