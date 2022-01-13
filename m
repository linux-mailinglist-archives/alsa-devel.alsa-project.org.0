Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D30F248DCA9
	for <lists+alsa-devel@lfdr.de>; Thu, 13 Jan 2022 18:09:24 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6C73F2013;
	Thu, 13 Jan 2022 18:08:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6C73F2013
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1642093764;
	bh=HCuF+JLwAfO4pGgFL8/yewbZvLUNniZUOVrmwxPJQQA=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fSxw5PM/zu5vZypzRWV4Z7cPPkEKkHFX92WiAHyebre/JoQIzTNhITEPsB0TFzF3a
	 FVTVJ+6UANDXbbeHdHs71CgaFDe7OqmNEKWVTvPjy/06O0lszJVfQmFMEMfZwlLsTi
	 mrSM3YNbJe3jnd7V056yU4j1CsHANvkkodPLs74U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3022DF804F2;
	Thu, 13 Jan 2022 18:07:45 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A3B17F8028D; Thu, 13 Jan 2022 18:07:42 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7BC25F8010B
 for <alsa-devel@alsa-project.org>; Thu, 13 Jan 2022 18:07:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7BC25F8010B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="ACXWgahF"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 20DGAV41020998;
 Thu, 13 Jan 2022 11:07:34 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=Gec5JZr/Y9//uxGFGGdu2d0McsJMuIB7A7Bb0u1sRVw=;
 b=ACXWgahFZ9fSR7ggCRO6q6WcMrTFiJBdI0Mo9XOZdMQxb7wz7U6LwAWgh913BPE8ny53
 ++dJvUXvVAqfBzUH0DNiCF70XYgoNxmVEBFbi1Ih7y3gUxFGCDLNMku6mNaAL3od9ZxD
 AHPPzwQvd/xmXBVw9EXfPL8IZm5KI29gL6Lx+/MO/44tw75DrJhLYDWrB6rLG9s7Eyq8
 BECGMRxmjMoqlfyrgBwaAJggFXXUUyp5ls2PRSemMXGlWaaABVscxemndUV2InBavxK0
 0e+FGQyKBJXzeR3dtJKsdZxz3H5cKzM73N+G/3f0veHc9PXrfq1eCBrRINu+xwUQE1d1 jg== 
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
 by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3djqcb026y-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Thu, 13 Jan 2022 11:07:33 -0600
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Thu, 13 Jan
 2022 17:07:31 +0000
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.18 via
 Frontend Transport; Thu, 13 Jan 2022 17:07:31 +0000
Received: from aryzen.ad.cirrus.com (unknown [198.61.65.50])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 4B04BB13;
 Thu, 13 Jan 2022 17:07:31 +0000 (UTC)
From: Lucas Tanure <tanureal@opensource.cirrus.com>
To: "Rafael J . Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
 Hans de Goede <hdegoede@redhat.com>, Mark Gross <markgross@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Subject: [PATCH 3/5] ALSA: hda: cs35l41: Move cs35l41* calls to its own symbol
 namespace
Date: Thu, 13 Jan 2022 17:07:26 +0000
Message-ID: <20220113170728.1953559-3-tanureal@opensource.cirrus.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220113170728.1953559-1-tanureal@opensource.cirrus.com>
References: <20220113170728.1953559-1-tanureal@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: -focsmKxe0hIUvMgZBWBu82KdQqnWk2U
X-Proofpoint-ORIG-GUID: -focsmKxe0hIUvMgZBWBu82KdQqnWk2U
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

Create own namespace and avoid polluting the global namespace

Signed-off-by: Lucas Tanure <tanureal@opensource.cirrus.com>
---
 sound/pci/hda/cs35l41_hda.c     | 5 ++---
 sound/pci/hda/cs35l41_hda_i2c.c | 1 +
 sound/pci/hda/cs35l41_hda_spi.c | 1 +
 3 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/sound/pci/hda/cs35l41_hda.c b/sound/pci/hda/cs35l41_hda.c
index 509a380f9be7..c4f25e48dcc0 100644
--- a/sound/pci/hda/cs35l41_hda.c
+++ b/sound/pci/hda/cs35l41_hda.c
@@ -514,7 +514,7 @@ int cs35l41_hda_probe(struct device *dev, const char *device_name, int id, int i
 
 	return ret;
 }
-EXPORT_SYMBOL_GPL(cs35l41_hda_probe);
+EXPORT_SYMBOL_NS_GPL(cs35l41_hda_probe, SND_HDA_SCODEC_CS35L41);
 
 int cs35l41_hda_remove(struct device *dev)
 {
@@ -528,8 +528,7 @@ int cs35l41_hda_remove(struct device *dev)
 
 	return 0;
 }
-EXPORT_SYMBOL_GPL(cs35l41_hda_remove);
-
+EXPORT_SYMBOL_NS_GPL(cs35l41_hda_remove, SND_HDA_SCODEC_CS35L41);
 
 MODULE_DESCRIPTION("CS35L41 HDA Driver");
 MODULE_AUTHOR("Lucas Tanure, Cirrus Logic Inc, <tanureal@opensource.cirrus.com>");
diff --git a/sound/pci/hda/cs35l41_hda_i2c.c b/sound/pci/hda/cs35l41_hda_i2c.c
index 4a9462fb5c14..eeb387853ee3 100644
--- a/sound/pci/hda/cs35l41_hda_i2c.c
+++ b/sound/pci/hda/cs35l41_hda_i2c.c
@@ -62,5 +62,6 @@ static struct i2c_driver cs35l41_i2c_driver = {
 module_i2c_driver(cs35l41_i2c_driver);
 
 MODULE_DESCRIPTION("HDA CS35L41 driver");
+MODULE_IMPORT_NS(SND_HDA_SCODEC_CS35L41);
 MODULE_AUTHOR("Lucas Tanure <tanureal@opensource.cirrus.com>");
 MODULE_LICENSE("GPL");
diff --git a/sound/pci/hda/cs35l41_hda_spi.c b/sound/pci/hda/cs35l41_hda_spi.c
index 77426e96c58f..15345a72b9d1 100644
--- a/sound/pci/hda/cs35l41_hda_spi.c
+++ b/sound/pci/hda/cs35l41_hda_spi.c
@@ -59,5 +59,6 @@ static struct spi_driver cs35l41_spi_driver = {
 module_spi_driver(cs35l41_spi_driver);
 
 MODULE_DESCRIPTION("HDA CS35L41 driver");
+MODULE_IMPORT_NS(SND_HDA_SCODEC_CS35L41);
 MODULE_AUTHOR("Lucas Tanure <tanureal@opensource.cirrus.com>");
 MODULE_LICENSE("GPL");
-- 
2.34.1

