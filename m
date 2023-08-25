Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7989678A05C
	for <lists+alsa-devel@lfdr.de>; Sun, 27 Aug 2023 19:05:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B6F38DFA;
	Sun, 27 Aug 2023 19:04:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B6F38DFA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1693155912;
	bh=RMEF3w73TsY+zbyXuw7xccZssSIjMPpZJWlzRs3G7to=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=F6X196Vs1qpOY2LVLRNtSegbZtG3+1Kkb/UslHk32N4N1RjbhSqKfJrOxdoMKPt2o
	 AlQsbG558dJbf62aCT4mIxRf9bAj05NkSA+usX/c50T/12rHsCus1VDF2I2Pc3Kkti
	 ii5rxc97L142XyFbwnZtItyCwGp6lXxX94OiisRI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 24EB2F805CB; Sun, 27 Aug 2023 19:02:05 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 60870F805D2;
	Sun, 27 Aug 2023 19:02:04 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A1C07F8025F; Fri, 25 Aug 2023 08:27:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from out-19.mta1.migadu.com (out-19.mta1.migadu.com
 [IPv6:2001:41d0:203:375::13])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C2B45F800F5
	for <alsa-devel@alsa-project.org>; Fri, 25 Aug 2023 08:27:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C2B45F800F5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256
 header.s=key1 header.b=J9557CES
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1692944854;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HvMwAdaM/5LwVLuwlRIstn4bDRGDsqcLFd+SgLGHveo=;
	b=J9557CESZD0jU1gCVKUTQTMhgPsStpHY4kD4mKKub+s8jAS6W/GwAlQNVLhdXsTlKgbIwP
	nGtqCj8han5cBytFhcvOlFt/sFPnp09Xx8kaVT4m9VTtL6o8FFya8yCHODM9rXrlRHcr1v
	jrvUtaJzRL22rSHGrA5R7eJ7HIsgmug=
From: Sui Jingfeng <sui.jingfeng@linux.dev>
To: Bjorn Helgaas <bhelgaas@google.com>
Cc: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	nouveau@lists.freedesktop.org,
	linux-pci@vger.kernel.org,
	alsa-devel@alsa-project.org,
	Sui Jingfeng <suijingfeng@loongson.cn>,
	Ben Skeggs <bskeggs@redhat.com>,
	Karol Herbst <kherbst@redhat.com>,
	Lyude Paul <lyude@redhat.com>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH 3/5] drm/nouveau: Use pci_get_base_class() to reduce
 duplicated code
Date: Fri, 25 Aug 2023 14:27:12 +0800
Message-Id: <20230825062714.6325-4-sui.jingfeng@linux.dev>
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
Message-ID-Hash: Q2IKDO6CSXWKEM47TNQ2RHUD4DL24IYR
X-Message-ID-Hash: Q2IKDO6CSXWKEM47TNQ2RHUD4DL24IYR
X-Mailman-Approved-At: Sun, 27 Aug 2023 17:01:46 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/Q2IKDO6CSXWKEM47TNQ2RHUD4DL24IYR/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Sui Jingfeng <suijingfeng@loongson.cn>

Should be no functional change.

Cc: Ben Skeggs <bskeggs@redhat.com>
Cc: Karol Herbst <kherbst@redhat.com>
Cc: Lyude Paul <lyude@redhat.com>
Cc: David Airlie <airlied@gmail.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
Signed-off-by: Sui Jingfeng <suijingfeng@loongson.cn>
---
 drivers/gpu/drm/nouveau/nouveau_acpi.c | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_acpi.c b/drivers/gpu/drm/nouveau/nouveau_acpi.c
index a2ae8c21e4dc..8f0c69aad248 100644
--- a/drivers/gpu/drm/nouveau/nouveau_acpi.c
+++ b/drivers/gpu/drm/nouveau/nouveau_acpi.c
@@ -284,14 +284,11 @@ static bool nouveau_dsm_detect(void)
 		printk("MXM: GUID detected in BIOS\n");
 
 	/* now do DSM detection */
-	while ((pdev = pci_get_class(PCI_CLASS_DISPLAY_VGA << 8, pdev)) != NULL) {
-		vga_count++;
-
-		nouveau_dsm_pci_probe(pdev, &dhandle, &has_mux, &has_optimus,
-				      &has_optimus_flags, &has_power_resources);
-	}
+	while ((pdev = pci_get_base_class(PCI_BASE_CLASS_DISPLAY, pdev))) {
+		if ((pdev->class != PCI_CLASS_DISPLAY_VGA << 8) &&
+		    (pdev->class != PCI_CLASS_DISPLAY_3D << 8))
+			continue;
 
-	while ((pdev = pci_get_class(PCI_CLASS_DISPLAY_3D << 8, pdev)) != NULL) {
 		vga_count++;
 
 		nouveau_dsm_pci_probe(pdev, &dhandle, &has_mux, &has_optimus,
-- 
2.34.1

