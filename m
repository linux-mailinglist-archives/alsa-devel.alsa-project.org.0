Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ACC31285F2
	for <lists+alsa-devel@lfdr.de>; Sat, 21 Dec 2019 01:19:16 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 14A3A84F;
	Sat, 21 Dec 2019 01:18:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 14A3A84F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1576887556;
	bh=GgzXuoZ6cf/ELpPk9Uo0rQ3XdKxMrhW3ogi8g5Kcd74=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=KwbM4Xa4suUmz1MVe72kRE2Ns3XAO4Tl6a6KfuyZneEXNRzcoC8cgeByZ8RqssUrm
	 VhzhsE8KIhzzZwSBI8HZtw17kid1vcQlLTvStQ9xiw9aLCDJonzNhN6d6zuDh5WvJM
	 m2Yg6yTMoBboxblIJ4nnJCMQoOu2SuxEgyIcofCQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1F68CF80247;
	Sat, 21 Dec 2019 01:17:32 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 06C1DF8015A; Sat, 21 Dec 2019 01:17:16 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-yw1-xc42.google.com (mail-yw1-xc42.google.com
 [IPv6:2607:f8b0:4864:20::c42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D8EF0F80088
 for <alsa-devel@alsa-project.org>; Sat, 21 Dec 2019 01:17:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D8EF0F80088
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="iN20BQIG"
Received: by mail-yw1-xc42.google.com with SMTP id n184so4573305ywc.3
 for <alsa-devel@alsa-project.org>; Fri, 20 Dec 2019 16:17:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=3sotCgf8hgZDhuwGqKH4BEcVKj67UXct/L0SFsnNm58=;
 b=iN20BQIGnAgXa02l+KIXWXiCbfx2o/NPoNrzfqzjAotwfQl/JTiEr+5kMsENEKf9GE
 SwwAdXtBIcLgNPNS2NaVM6CKcul7v/LJU4yGa4+xIa0fwPFFOj69Jupw66wZ1s01cX5a
 BunKfdsAqTkBTA/lW05IN769HvTBYY8GRt6VFdF1rB7+zkfCXHKf1McBIoR4DkDytIar
 6umvfKraChZAN3ej6SdOPjw5sHG5Rq14tdCo3lCuoeOst2SSZwSYts3LtAN7b0J6Kv+x
 y25cLaRkhH/aeIQYnxvwPU6OrZN3vIbxyknKGI5ocZ0TuCJXaaJT+iUMj2VHeiqn0dCS
 dp9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=3sotCgf8hgZDhuwGqKH4BEcVKj67UXct/L0SFsnNm58=;
 b=Ce2T1i4Iom1kRlysjQsdQOcW8rCtI4rhF8K1BasDd4f/cqnaKj31Q7eu1ZQC6+HCBL
 Yg0C0/Jp1y5bcuvA9iz8wh59NlZZ61V2yCwIuxZcDjugN3IWYnLoqjOF6Q+lQDiZzoWi
 /7+jn2SSSSTLyb9w8xZKFkrwUEa7yYoRJlolN3Hi9Cr64pgYuI9bXL8BK4vFcMq2/sub
 nmC7BEEncnmBJdizoms6Ex2oMfNJWGF0hY3T20knKkoYSE1Jg0SS/+WoE1Syu0IDYTDs
 nPovSmEj7h9EZChWL8LSR/6y5/nPwBS5LbkEK9F4woawm7Lcv5Um3WysEhDt26lN4W74
 bXzQ==
X-Gm-Message-State: APjAAAUS5ABXpZ/sR+94g7jICBLM80R4nDWQxRZ1ACuC2WEtfcBoHkZG
 PZNIJ6iSEczYxcRDwNl25K0=
X-Google-Smtp-Source: APXvYqzTC2xCTeznK0J5wqzo8//3BbLmwPPwt255mus4PTBGBsdZRx55BGsOkRWm7tkwM7wA+LpYVQ==
X-Received: by 2002:a0d:d4d6:: with SMTP id
 w205mr12514987ywd.366.1576887430604; 
 Fri, 20 Dec 2019 16:17:10 -0800 (PST)
Received: from tr4.amd.com (atlvpn.amd.com. [165.204.84.11])
 by smtp.gmail.com with ESMTPSA id e186sm4461571ywb.73.2019.12.20.16.17.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Dec 2019 16:17:10 -0800 (PST)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org, alsa-devel@alsa-project.org, tiwai@suse.de
Date: Fri, 20 Dec 2019 19:17:02 -0500
Message-Id: <20191221001702.1338587-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Cc: Alex Deucher <alexander.deucher@amd.com>
Subject: [alsa-devel] [PATCH] ALSA: hda/hdmi - fix atpx_present when CLASS
	is not VGA
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

You can't use PCI_BASE_CLASS with pci_get_class().  This
happens to work by luck on devices with PCI_CLASS_DISPLAY_VGA, but
misses PCI_CLASS_DISPLAY_OTHER.  Add a check for those as well.

Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
---
 sound/pci/hda/hda_intel.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/sound/pci/hda/hda_intel.c b/sound/pci/hda/hda_intel.c
index b856b89378ac..f69c8de64bd6 100644
--- a/sound/pci/hda/hda_intel.c
+++ b/sound/pci/hda/hda_intel.c
@@ -1410,7 +1410,17 @@ static bool atpx_present(void)
 	acpi_handle dhandle, atpx_handle;
 	acpi_status status;
 
-	while ((pdev = pci_get_class(PCI_BASE_CLASS_DISPLAY << 16, pdev)) != NULL) {
+	while ((pdev = pci_get_class(PCI_CLASS_DISPLAY_VGA << 8, pdev)) != NULL) {
+		dhandle = ACPI_HANDLE(&pdev->dev);
+		if (dhandle) {
+			status = acpi_get_handle(dhandle, "ATPX", &atpx_handle);
+			if (!ACPI_FAILURE(status)) {
+				pci_dev_put(pdev);
+				return true;
+			}
+		}
+	}
+	while ((pdev = pci_get_class(PCI_CLASS_DISPLAY_OTHER << 8, pdev)) != NULL) {
 		dhandle = ACPI_HANDLE(&pdev->dev);
 		if (dhandle) {
 			status = acpi_get_handle(dhandle, "ATPX", &atpx_handle);
-- 
2.24.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
