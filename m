Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DC4EE5823AE
	for <lists+alsa-devel@lfdr.de>; Wed, 27 Jul 2022 12:01:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7E090163A;
	Wed, 27 Jul 2022 12:00:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7E090163A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1658916098;
	bh=DSCCyKVwWP2TcyemXmjZOPJN+EvQg7Qe5czbnE2lsOI=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=PpMeoGOTQAEyKhDNGFnwXn1nHKhbJggDVx45mM67rNK2uT2HHKJScrKckMNh7M6rf
	 MhRD49xnMO217QbQzo3QX+xmRJ/C8SErF2jOCTDWHcK5ZdFzUi0LwDMhvx03p13L3V
	 4gUqhuXTK8inVOy9z+n67nX8F+f2phf2d+/JHUxg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EB3ACF80551;
	Wed, 27 Jul 2022 11:59:46 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3B9AFF80544; Wed, 27 Jul 2022 11:59:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9A051F800C9
 for <alsa-devel@alsa-project.org>; Wed, 27 Jul 2022 11:59:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9A051F800C9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="TNYSGwwh"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26R4SNEe032560;
 Wed, 27 Jul 2022 04:59:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=T6+2mzXRPTLTtBq7x98yRAkPxVcb5dHCe1xJUV91oCI=;
 b=TNYSGwwh76BBHIpY0CGeSe+1YzJO9YFfbaisikwUU0yT4Gs10ICv3Pu9nAxmuUHshM43
 9X9DDDTUdbLsTI9hxdNgKJng86o6D4V5amkqeLMwSaJEc9lAIaDdYRzBXmXzc0Ym+Pd/
 NWbzdtjG8fX6hgZfKwNTBcrHcOUy6ayhxsqmP+AUiA4Qh/5x/AVSuUxtsuhS0PnIPqep
 rYuci/HcCGKHQPXn6JlzB4gdrsDID49bFQ9zcni9ZgIdSDc3dFFpX9S/aORkaj9w5fA6
 rKGZxgbSXvFCK6tCOD8aixzcnwExc2Cg8aY0ky9sOMIDJvH1yHDxpoWuZLHtkWYfN1Yd ig== 
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
 by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3hged1vtk5-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 27 Jul 2022 04:59:31 -0500
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.9; Wed, 27 Jul
 2022 04:59:29 -0500
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by
 anon-ediex01.ad.cirrus.com (198.61.84.80) with Microsoft SMTP Server id
 15.2.1118.9 via Frontend Transport; Wed, 27 Jul 2022 04:59:29 -0500
Received: from aryzen.ad.cirrus.com (unknown [198.61.65.94])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 4FDF02D4;
 Wed, 27 Jul 2022 09:59:29 +0000 (UTC)
From: Lucas Tanure <tanureal@opensource.cirrus.com>
To: Jaroslav Kysela <perex@perex.cz>, "Rafael J . Wysocki"
 <rafael@kernel.org>, Len Brown <lenb@kernel.org>, Hans de Goede
 <hdegoede@redhat.com>, Mark Gross <markgross@kernel.org>, Takashi Iwai
 <tiwai@suse.com>, Cameron Berkenpas <cam@neo-zeon.de>
Subject: [PATCH v2 4/4] platform/x86: serial-multi-instantiate: Add CLSA0101
 Laptop
Date: Wed, 27 Jul 2022 10:59:24 +0100
Message-ID: <20220727095924.80884-5-tanureal@opensource.cirrus.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220727095924.80884-1-tanureal@opensource.cirrus.com>
References: <20220727095924.80884-1-tanureal@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: KwUWKi34NrhthI5lpKwmDqaU7d1As0EB
X-Proofpoint-ORIG-GUID: KwUWKi34NrhthI5lpKwmDqaU7d1As0EB
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

The device CLSA0101 has two instances of CS35L41
connected by I2C.

Signed-off-by: Lucas Tanure <tanureal@opensource.cirrus.com>
---
 drivers/platform/x86/serial-multi-instantiate.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/platform/x86/serial-multi-instantiate.c b/drivers/platform/x86/serial-multi-instantiate.c
index 67feed25c9db..5362f1a7b77c 100644
--- a/drivers/platform/x86/serial-multi-instantiate.c
+++ b/drivers/platform/x86/serial-multi-instantiate.c
@@ -328,6 +328,7 @@ static const struct acpi_device_id smi_acpi_ids[] = {
 	{ "INT3515", (unsigned long)&int3515_data },
 	/* Non-conforming _HID for Cirrus Logic already released */
 	{ "CLSA0100", (unsigned long)&cs35l41_hda },
+	{ "CLSA0101", (unsigned long)&cs35l41_hda },
 	{ }
 };
 MODULE_DEVICE_TABLE(acpi, smi_acpi_ids);
-- 
2.37.1

