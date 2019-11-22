Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 98102107A29
	for <lists+alsa-devel@lfdr.de>; Fri, 22 Nov 2019 22:46:39 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 287CF1670;
	Fri, 22 Nov 2019 22:45:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 287CF1670
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1574459199;
	bh=HdMx4evWri2Hy0Hvc3hcRX67HH+8rksH7Txl7wOCdsg=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=l6tU8mmeUu2op/3N659U7AhinlrCB2eCxF+896Bm+9N4WE2Xg1y47myNBH7CWULhm
	 1/RZckHE0qUwmYcBD8r0ILybxb8UiAXAiY6IRzM0a03oouxxdFm4zRScG0fG3bJKBW
	 Kmwy7X0Ak9Ffp3OxW5hoI0EEGNu6+22u7uqhbNiM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 38781F8014A;
	Fri, 22 Nov 2019 22:44:14 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1CD0BF80157; Fri, 22 Nov 2019 22:44:08 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-yw1-xc44.google.com (mail-yw1-xc44.google.com
 [IPv6:2607:f8b0:4864:20::c44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 28264F800EE
 for <alsa-devel@alsa-project.org>; Fri, 22 Nov 2019 22:44:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 28264F800EE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="VTdEkhzC"
Received: by mail-yw1-xc44.google.com with SMTP id j137so2926786ywa.12
 for <alsa-devel@alsa-project.org>; Fri, 22 Nov 2019 13:44:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=UZRboScAMdXkhDOCeriWrHfA0G0p+X1/BFqys+kyJlU=;
 b=VTdEkhzC4UQ9S6hIdWvx8S31C6Mm0YAY4in/nMHUvmlXxVtvmPL0v/HcSrwsiUDn0S
 ge77QrX/9A5EgHx5w1HtyXhlOUsF6Bp8JHh54s9nAJiDdXSo4Q2p/tJx8CGAIn9lUNXl
 hhLXPtjmHmqYaZQ65LKVYV408a+0BZQYHFFB3Wj8AvGBgYrlL9xP77BBkMdR2Yk2+4+Z
 A4W+iwJXR8qUqCboRTYp9ZuPBWvEdiMR0nmyWdfhzLW1XFDgPEcQTnam17rG90PmqAS0
 3M/bOXT8MHH8Ni7KESIPOXbtMpBstPnoDElMSJNH8NHgEcP9WdujgxwfTWJ3vG+9Ei+8
 cekw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UZRboScAMdXkhDOCeriWrHfA0G0p+X1/BFqys+kyJlU=;
 b=CReZgbR70+1L1W9H4y5Bud/mw/5Y712UXZw1wYF2+T+9xO6vBTYXmz+P0ke5CjmBHj
 RwCuyWmjQSfzfzLuM+WhYwVvlHTv1eE7iZyEjAcSTKv1cG8ZODtiKjhx/T8uc2k1NSKL
 QU6bb48z+uAhMmyt/IQDizoNuaFhC943jSjnivjd5yMJFTXy2Weo1jRM4LegEPnBVn5q
 jBN5HQT415P6BT6SnZijTcnTqb978luoUzevcMgUAfoDE1Bo0Y5F4uH+1cUoohR0PB/a
 4FfZykxk1ZO5ix2BZh5jzExwv1bHSWrssNu+wsNsLR6yBUgpgUAs3BwLPttwCt1zc4lp
 LsVA==
X-Gm-Message-State: APjAAAX5DsPtgmPhFr0pyoFnTlJSDepQVoqI3aDQav1uwTYAvQ2cWCUY
 KuJcN5/Qaec9VIKNCuwyVys=
X-Google-Smtp-Source: APXvYqzpCxqjhUm4FionawKDzm3lfMqwKucoMhLNTgXWLQtua41zahCcLox4aqQJwyxS19+SJ5OMXA==
X-Received: by 2002:a81:a985:: with SMTP id g127mr3202791ywh.470.1574459042397; 
 Fri, 22 Nov 2019 13:44:02 -0800 (PST)
Received: from tr4.amd.com (atlvpn.amd.com. [165.204.84.11])
 by smtp.gmail.com with ESMTPSA id t15sm2111522ywh.70.2019.11.22.13.44.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Nov 2019 13:44:01 -0800 (PST)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org, alsa-devel@alsa-project.org, tiwai@suse.de
Date: Fri, 22 Nov 2019 16:43:50 -0500
Message-Id: <20191122214353.582899-2-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191122214353.582899-1-alexander.deucher@amd.com>
References: <20191122214353.582899-1-alexander.deucher@amd.com>
MIME-Version: 1.0
Cc: Alex Deucher <alexander.deucher@amd.com>, Evan Quan <evan.quan@amd.com>
Subject: [alsa-devel] [PATCH 1/4] ALSA: hda/hdmi - fix vgaswitcheroo
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
