Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E2D41FE390
	for <lists+alsa-devel@lfdr.de>; Fri, 15 Nov 2019 18:04:08 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 749DD1612;
	Fri, 15 Nov 2019 18:03:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 749DD1612
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1573837448;
	bh=HdMx4evWri2Hy0Hvc3hcRX67HH+8rksH7Txl7wOCdsg=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=vDGJFks9CTo+qM7LpNQjGixgmlm1MnfMgxWD1VdUu0XVTPPZXcxHCCupIlbGp13gG
	 niPV5ndcWUy/s/Sgo7XZ9WeTv29DmepBzDKQ0iYzzvwgcWd+1aHek1VvzOz1dz8lWL
	 KY1judvAi85+B29s4hFyAEjY7gXf2gCb3YwM4a9s=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 876A1F80260;
	Fri, 15 Nov 2019 17:51:40 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0F6EAF8014D; Fri, 15 Nov 2019 17:51:25 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com
 [IPv6:2607:f8b0:4864:20::841])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8227DF80105
 for <alsa-devel@alsa-project.org>; Fri, 15 Nov 2019 17:51:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8227DF80105
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="k7CeB3tD"
Received: by mail-qt1-x841.google.com with SMTP id p20so11475975qtq.5
 for <alsa-devel@alsa-project.org>; Fri, 15 Nov 2019 08:51:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=UZRboScAMdXkhDOCeriWrHfA0G0p+X1/BFqys+kyJlU=;
 b=k7CeB3tDxWwB9+2zwjzZUeKQPtfdgVpegslfXUiTpLDeQrGOH0k/0s3xHFBLkpsHNX
 hHm9OBC/uKv6vqUFt88zusy+d9JRhfk4ozvKg/no2M4nqoP9b36u+5iarmaTX7IBgozL
 NK9d+fl5U0/y3hWXuJGyEu2bQCMudoQmjGHQCN+JORMHGnTTf3mygWZnb0XO+JJ/gmo1
 BAK6SEzKHRC22TlazN2+WSI7od/5v1vpskzm2MHeeT4BmKdb160okGI9CN6Y0GCKIK0w
 +eFeJN4sxAQNogTWpuKGEU/GiY7ijpUZK7XZ+iX0QXgxp96VU2j7C15WlKRI85g0mdU0
 bL8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UZRboScAMdXkhDOCeriWrHfA0G0p+X1/BFqys+kyJlU=;
 b=SVOMAJIxJXFv+3uJ9jOHBesZCZ2gkXtar6o9ahhEzg+dpju2QN+c09EPk22gnsVT5G
 dPCwcmfCHuBlIRa95VM4y/oY3/XubtTeh4e/CA7PZp67/+q8z38PsZ4SNOkJtZ/N1o9Q
 GMbtGYBHvm/94LQG8y82/GXPh9kX5/wMldupEundERoaX/RyyY1wuT8jbUbK1EfE+Rfo
 a6+tH4SzXvjkh85pw4tR8Ed4ZRs2zZlS+6mYlIvhXNkhPWNCLTmwQzaXTYQqZ45+Gl6q
 uPM/hxaSLIwr4MUHoNJ7Te/iHEukvscYxSaUbs6rJ2HsBOCzka3hMU/RqCoV3+wv1uMe
 OynQ==
X-Gm-Message-State: APjAAAWe7V4hK7smwEcsM7b+KZpYIeVGSO027so7XfVD9sa4zVZ0Y2oO
 VAYeJqjJvweSTE6HKUBzIis=
X-Google-Smtp-Source: APXvYqwWSYYr05JU+xC2YPj/RaDKhglO5F3lQsGl1PoPw9I7E1AWIVqkVibxrB74OWxVSJNhpw9jdg==
X-Received: by 2002:ac8:7282:: with SMTP id v2mr13958901qto.75.1573836663793; 
 Fri, 15 Nov 2019 08:51:03 -0800 (PST)
Received: from localhost.localdomain ([71.219.59.120])
 by smtp.gmail.com with ESMTPSA id r29sm5610331qtb.63.2019.11.15.08.51.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Nov 2019 08:51:03 -0800 (PST)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org, alsa-devel@alsa-project.org, tiwai@suse.de,
 lukas@wunner.de
Date: Fri, 15 Nov 2019 11:50:35 -0500
Message-Id: <20191115165038.56646-18-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191115165038.56646-1-alexander.deucher@amd.com>
References: <20191115165038.56646-1-alexander.deucher@amd.com>
MIME-Version: 1.0
Cc: Alex Deucher <alexander.deucher@amd.com>, Evan Quan <evan.quan@amd.com>
Subject: [alsa-devel] [PATCH 17/20] ALSA: hda/hdmi - fix vgaswitcheroo
	detection for AMD
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

Only enable the vga_switcheroo logic on systems with the
ATPX ACPI method.  This logic is not needed for asics
that are not part of a PX (PowerXpress)/HG (Hybrid Graphics)
platform.

Reviewed-by: Takashi Iwai <tiwai@suse.de>
Acked-by: Evan Quan <evan.quan@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
---
 sound/pci/hda/hda_intel.c | 45 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 45 insertions(+)

diff --git a/sound/pci/hda/hda_intel.c b/sound/pci/hda/hda_intel.c
index 240f4ca76391..3ebc7b2a897f 100644
--- a/sound/pci/hda/hda_intel.c
+++ b/sound/pci/hda/hda_intel.c
@@ -35,6 +35,7 @@
 #include <linux/clocksource.h>
 #include <linux/time.h>
 #include <linux/completion.h>
+#include <linux/acpi.h>
 
 #ifdef CONFIG_X86
 /* for snoop control */
@@ -1393,6 +1394,34 @@ static int azx_dev_free(struct snd_device *device)
 }
 
 #ifdef SUPPORT_VGA_SWITCHEROO
+#ifdef CONFIG_ACPI
+/* ATPX is in the integrated GPU's namespace */
+static bool atpx_present(void)
+{
+	struct pci_dev *pdev = NULL;
+	acpi_handle dhandle, atpx_handle;
+	acpi_status status;
+
+	while ((pdev = pci_get_class(PCI_BASE_CLASS_DISPLAY << 16, pdev)) != NULL) {
+		dhandle = ACPI_HANDLE(&pdev->dev);
+		if (dhandle) {
+			status = acpi_get_handle(dhandle, "ATPX", &atpx_handle);
+			if (!ACPI_FAILURE(status)) {
+				pci_dev_put(pdev);
+				return true;
+			}
+		}
+		pci_dev_put(pdev);
+	}
+	return false;
+}
+#else
+static bool atpx_present(void)
+{
+	return false;
+}
+#endif
+
 /*
  * Check of disabled HDMI controller by vga_switcheroo
  */
@@ -1404,6 +1433,22 @@ static struct pci_dev *get_bound_vga(struct pci_dev *pci)
 	switch (pci->vendor) {
 	case PCI_VENDOR_ID_ATI:
 	case PCI_VENDOR_ID_AMD:
+		if (pci->devfn == 1) {
+			p = pci_get_domain_bus_and_slot(pci_domain_nr(pci->bus),
+							pci->bus->number, 0);
+			if (p) {
+				/* ATPX is in the integrated GPU's ACPI namespace
+				 * rather than the dGPU's namespace. However,
+				 * the dGPU is the one who is involved in
+				 * vgaswitcheroo.
+				 */
+				if (((p->class >> 16) == PCI_BASE_CLASS_DISPLAY) &&
+				    atpx_present())
+					return p;
+				pci_dev_put(p);
+			}
+		}
+		break;
 	case PCI_VENDOR_ID_NVIDIA:
 		if (pci->devfn == 1) {
 			p = pci_get_domain_bus_and_slot(pci_domain_nr(pci->bus),
-- 
2.23.0

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
