Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 01A13E7BD9
	for <lists+alsa-devel@lfdr.de>; Mon, 28 Oct 2019 22:56:51 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8FD67219B;
	Mon, 28 Oct 2019 22:56:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8FD67219B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1572299810;
	bh=8Mw7udatUfuCjNu3/Sv2uw0pfcFi68Npe8gTPesH7ls=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=FiVXEYhHykz4TDHWYFEdM/K6m5PjzRqx2AMmuHKJjl/okHTcqFOl7Yt5uftxa+802
	 bBorKGZh1kZdwku5SmLqY8+Qenw5NQ8hsnKvGJYY4f6tk30iGUE2DFPphqOtpBRS6a
	 qOpEgyD0cW9scG2XmCV4OPePDQ45neCaqNIuY/9E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8195FF80769;
	Mon, 28 Oct 2019 22:44:02 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 841A1F80765; Mon, 28 Oct 2019 22:43:59 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-yw1-xc41.google.com (mail-yw1-xc41.google.com
 [IPv6:2607:f8b0:4864:20::c41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D79A4F80759
 for <alsa-devel@alsa-project.org>; Mon, 28 Oct 2019 22:43:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D79A4F80759
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="e+n2Al6v"
Received: by mail-yw1-xc41.google.com with SMTP id j131so3197646ywa.8
 for <alsa-devel@alsa-project.org>; Mon, 28 Oct 2019 14:43:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/OTNWTrnNayQGKE2n9NJY1VA8uQkKW2cZ+erBCv1+bA=;
 b=e+n2Al6vVh+LJ58tv+dvyBeY41CjBhkBwBQny1mfRpu39y1AChTb085w/1vVXdr7Lq
 ekdtatIyw2Fs1suOrSgy7Kds5elQtfVDjqjSFqU826rdqgUdHO74AXog54JpH8NhLOAl
 b9gEoB1yaJ+G+fCSMLuAZFb8t5BR3Trz1/UChsq7m7GYaaZGKqXRY2CvhRbP7uKT/vnv
 YpyWbYUfCfTJr3EOHguKP9tjCpV0qxG4gQcUs2bw9Ry1Zs918/Unw4iwDI5OhnbzZ3bI
 wjg9dwNMLTi1C60C5dLUXlwngKNOHDEjgIeLgZDe11hRz04X1Pgx83FBBhKqHCoTIK9I
 OVwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/OTNWTrnNayQGKE2n9NJY1VA8uQkKW2cZ+erBCv1+bA=;
 b=fXUzrvEO9lKf490BX7AGwU+SzZO0roPZ4shA6yw2Z6a6rpsvzlwn7VRDhz+1b9/RuY
 2fpOR0sRdsIzvtPXILly9VpUJpU/FI6GhCujeD2CUAx7qm33VI7EAz8mBAGNDVY7eQXg
 W7FoQ2wrHJWuXurlPEozqtwCI3ff/h4dMqwByZTs/YqJwcN0xdRlHqT1QJ9/zymy99mn
 tlsJjk1LZDCQlTkA3BUtfs8jjrVsWhOEevqlRNeyqW1RaTDIIYYg14qCpl8H3HbJBPx3
 QLT4xsyDbpnnosBx6jRfz6KWQjZ4DHxOQSf7V4zoQmtIs6j1l0dx3So0vqFn3/s+ePJR
 D6AA==
X-Gm-Message-State: APjAAAVsk4Gv8KRMW5z108n47kaa9D9/WZeOWzrp3BFmWO6whDXcssll
 nemat74UKcZ/3rvgaIt7xv4=
X-Google-Smtp-Source: APXvYqzMJYvx+lRePoavyZ4w9Mlok1ABzCceZAveHW1gIZhzAtqIOUPHCuQjoSLZmIkO4mPDwQkQCg==
X-Received: by 2002:a81:52cd:: with SMTP id g196mr14534370ywb.83.1572299034999; 
 Mon, 28 Oct 2019 14:43:54 -0700 (PDT)
Received: from tr4.amd.com (atlvpn.amd.com. [165.204.84.11])
 by smtp.gmail.com with ESMTPSA id l68sm3421090ywf.95.2019.10.28.14.43.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Oct 2019 14:43:54 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org, alsa-devel@alsa-project.org, tiwai@suse.de,
 lukas@wunner.de
Date: Mon, 28 Oct 2019 17:42:13 -0400
Message-Id: <20191028214216.1508370-19-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191028214216.1508370-1-alexander.deucher@amd.com>
References: <20191028214216.1508370-1-alexander.deucher@amd.com>
MIME-Version: 1.0
Cc: Alex Deucher <alexander.deucher@amd.com>, Evan Quan <evan.quan@amd.com>
Subject: [alsa-devel] [PATCH 18/21] ALSA: hda/hdmi - fix vgaswitcheroo
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

Acked-by: Evan Quan <evan.quan@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
---

v2:
- check CONFIG_ACPI
- fix pci ref logic

sound/pci/hda/hda_intel.c | 49 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 49 insertions(+)

diff --git a/sound/pci/hda/hda_intel.c b/sound/pci/hda/hda_intel.c
index 1e14d7270adf..ab6c4e7c468b 100644
--- a/sound/pci/hda/hda_intel.c
+++ b/sound/pci/hda/hda_intel.c
@@ -35,6 +35,11 @@
 #include <linux/clocksource.h>
 #include <linux/time.h>
 #include <linux/completion.h>
+#ifdef SUPPORT_VGA_SWITCHEROO
+#ifdef CONFIG_ACPI
+#include <linux/acpi.h>
+#endif
+#endif
 
 #ifdef CONFIG_X86
 /* for snoop control */
@@ -1345,6 +1350,34 @@ static int azx_dev_free(struct snd_device *device)
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
@@ -1356,6 +1389,22 @@ static struct pci_dev *get_bound_vga(struct pci_dev *pci)
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
