Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6884A5823B2
	for <lists+alsa-devel@lfdr.de>; Wed, 27 Jul 2022 12:01:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 08A2B1650;
	Wed, 27 Jul 2022 12:01:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 08A2B1650
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1658916115;
	bh=rEwepkHm2EPch0pBXKRxv0Hv/vO+u9iTqCswBh/PC8c=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=alUGJavAEyQto87WGTNhmmjGIPmo5HE91G2qwL+GuxB+UdQoVsXwf0m5534to21UV
	 sZDkEaG7vcQx+/GMGmABHCsAVrzGvYf+VtZkoNII5YFe+NVupr5bUW8k2enwGgwR4m
	 MVRUCRy94I76Ww34Mi1l/2MrekWAf3510DHYzCZs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8B35AF80558;
	Wed, 27 Jul 2022 11:59:47 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9140DF801D5; Wed, 27 Jul 2022 11:59:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D7B1DF80171
 for <alsa-devel@alsa-project.org>; Wed, 27 Jul 2022 11:59:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D7B1DF80171
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="mRbjPnM4"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26R4SNEg032560;
 Wed, 27 Jul 2022 04:59:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=OVWLOViijHvZ0gyrsr6sZosQT9smEiGwvFnRB0/TaRY=;
 b=mRbjPnM414VhyBwRFy9PC6SYYkXxG9KZHx50DRageHYP29fol+z3rOCN4NH4SluNwVPS
 Sl29+Ica17m9URmQU237sVDdieEvVJlOXM3IHctJN42WSKmBtqToO2vAlUmPMr+G50T4
 mdgYRf+57DBKJTzX81GCkIMy+QVVnI7qkZtFqfuD/SvexyJ6XWx6FmkYeHkDEQ0Jesh0
 713+YUqO9bGG4vWUyJfjWxLXRzy8x0nKSsOuiob0f1OUzD7+P9HgQnM6e+hb25EIdWka
 MFz9O0xzXMQBqIf6O2QJs0z6ILEU03RWj9GCpa0+uAMMs8ZtrZrLLdYqC7vRtQGGpbUv 5Q== 
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
 by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3hged1vtk6-3
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 27 Jul 2022 04:59:32 -0500
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.9; Wed, 27 Jul
 2022 04:59:29 -0500
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by
 anon-ediex01.ad.cirrus.com (198.61.84.80) with Microsoft SMTP Server id
 15.2.1118.9 via Frontend Transport; Wed, 27 Jul 2022 04:59:29 -0500
Received: from aryzen.ad.cirrus.com (unknown [198.61.65.94])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id E041E477;
 Wed, 27 Jul 2022 09:59:28 +0000 (UTC)
From: Lucas Tanure <tanureal@opensource.cirrus.com>
To: Jaroslav Kysela <perex@perex.cz>, "Rafael J . Wysocki"
 <rafael@kernel.org>, Len Brown <lenb@kernel.org>, Hans de Goede
 <hdegoede@redhat.com>, Mark Gross <markgross@kernel.org>, Takashi Iwai
 <tiwai@suse.com>, Cameron Berkenpas <cam@neo-zeon.de>
Subject: [PATCH v2 3/4] ACPI: scan: Add CLSA0101 Laptop Support
Date: Wed, 27 Jul 2022 10:59:23 +0100
Message-ID: <20220727095924.80884-4-tanureal@opensource.cirrus.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220727095924.80884-1-tanureal@opensource.cirrus.com>
References: <20220727095924.80884-1-tanureal@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: AtdIxN_CFm9gOicAvdNFl88eKK2K7cCh
X-Proofpoint-ORIG-GUID: AtdIxN_CFm9gOicAvdNFl88eKK2K7cCh
X-Proofpoint-Spam-Reason: safe
Cc: alsa-devel@alsa-project.org, Lucas Tanure <tanureal@opensource.cirrus.com>,
 patches@opensource.cirrus.com, linux-kernel@vger.kernel.org,
 platform-driver-x86@vger.kernel.org, linux-acpi@vger.kernel.org
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

Add CLSA0101 id to the ignore_serial_bus_ids
so serial-multi-instantiate can correctly
instantiate the driver.

Signed-off-by: Lucas Tanure <tanureal@opensource.cirrus.com>
---
 drivers/acpi/scan.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/acpi/scan.c b/drivers/acpi/scan.c
index b100e6ca9bb4..42cec8120f18 100644
--- a/drivers/acpi/scan.c
+++ b/drivers/acpi/scan.c
@@ -1722,6 +1722,7 @@ static bool acpi_device_enumeration_by_parent(struct acpi_device *device)
 		{"INT3515", },
 		/* Non-conforming _HID for Cirrus Logic already released */
 		{"CLSA0100", },
+		{"CLSA0101", },
 	/*
 	 * Some ACPI devs contain SerialBus resources even though they are not
 	 * attached to a serial bus at all.
-- 
2.37.1

