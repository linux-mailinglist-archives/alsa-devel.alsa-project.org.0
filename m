Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A741596358
	for <lists+alsa-devel@lfdr.de>; Tue, 16 Aug 2022 21:48:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 35B75163E;
	Tue, 16 Aug 2022 21:47:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 35B75163E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1660679303;
	bh=E7Og6JHouSSw+gAIPkrM/TO1NNGAVZ5J89GKbAzcFq0=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=WPP9ZpHHVxk0aV7LODaxunj7aTUYbCPGY7rw5+uI3tvn1KsNw6lzOcFdNp7nrPCqi
	 kwECWWk2W1ZRE0J8SXTPAeKnxjiWOj5yox8pgAZQmfkzHQvd4vUiG7GVqwHdkbAiPP
	 YHbcRuhu95k4m2C1mMJ+utIaeoOmvhvNMxejM9z8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9F6ADF80095;
	Tue, 16 Aug 2022 21:47:24 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4989BF8032D; Tue, 16 Aug 2022 21:47:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from neo-zeon.de (neo-zeon.de [70.229.12.130])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 28D13F80082
 for <alsa-devel@alsa-project.org>; Tue, 16 Aug 2022 21:47:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 28D13F80082
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=neo-zeon.de header.i=@neo-zeon.de
 header.b="UZndlUgd"
Received: from neo-zeon.de (localhost [::1])
 by neo-zeon.de (OpenSMTPD) with ESMTP id 86363371;
 Tue, 16 Aug 2022 12:47:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=neo-zeon.de; h=from:to:cc
 :subject:date:message-id:mime-version:content-transfer-encoding;
 s=1; bh=C26QCOHlg2M7zNnEEDSWeN6CCrA=; b=UZndlUgdjqpGAOS3iTNS+qE
 JmrLgQEKziHZDJKUuTDTHMbBasTGzC+Sd5VxrVFyQf0dRxr1cuS2h0Y5IlXgtuOy
 JM4QAgO8a0zczrbaeaHOonYRbXPkTYPJQhIzGduXI1mqkmO2mwjmMT+Z1pW/p5Xs
 7hEWFkUNFc0t252W/GJw=
Received: by neo-zeon.de (OpenSMTPD) with ESMTPSA id a374ab74
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO); 
 Tue, 16 Aug 2022 12:47:08 -0700 (PDT)
From: Cameron Berkenpas <cam@neo-zeon.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ALSA: hda/realtek: Add CLSA0101 to serial-multi-instantiate.
Date: Tue, 16 Aug 2022 12:46:40 -0700
Message-Id: <20220816194639.13870-1-cam@neo-zeon.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, Cameron Berkenpas <cam@neo-zeon.de>,
 tanureal@opensource.cirrus.com
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
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Added CLSA0101 to serial-multi-instantiate.c.

Signed-off-by: Cameron Berkenpas <cam@neo-zeon.de>
---
 drivers/platform/x86/serial-multi-instantiate.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/serial-multi-instantiate.c b/drivers/platform/x86/serial-multi-instantiate.c
index 1e8063b7c169..bc9bf591dd10 100644
--- a/drivers/platform/x86/serial-multi-instantiate.c
+++ b/drivers/platform/x86/serial-multi-instantiate.c
@@ -327,8 +327,9 @@ static const struct acpi_device_id smi_acpi_ids[] = {
 	{ "BSG2150", (unsigned long)&bsg2150_data },
 	{ "INT3515", (unsigned long)&int3515_data },
 	{ "CSC3551", (unsigned long)&cs35l41_hda },
-	/* Non-conforming _HID for Cirrus Logic already released */
+	/* Non-conforming _HIDs for Cirrus Logic already released */
 	{ "CLSA0100", (unsigned long)&cs35l41_hda },
+	{ "CLSA0101", (unsigned long)&cs35l41_hda },
 	{ }
 };
 MODULE_DEVICE_TABLE(acpi, smi_acpi_ids);
-- 
2.34.1

