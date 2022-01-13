Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 59ACB48DCAA
	for <lists+alsa-devel@lfdr.de>; Thu, 13 Jan 2022 18:09:28 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 47EE22026;
	Thu, 13 Jan 2022 18:08:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 47EE22026
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1642093767;
	bh=iKeK+QqRAHqhorJkx9Ay1XJnrqOvVZ/FeiwNL7DGehg=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=P8oOi5N6WzQhTankEDMrYFJTLPyIk9fk5UVa0VjHNzP8DbBXqjZ/nqlwcR1VMNkvW
	 v0/2pSjHtSiIhJ58eQNE6Mu7JCKuzrgLplZhBb3kwIDz0/0I+++kzJ8h8FarT5fEO4
	 NKoWWrbTBlOTXTbA2rRLofsdyhVwGwGi9/ylF0Co=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B675AF804FB;
	Thu, 13 Jan 2022 18:07:45 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DE482F804FB; Thu, 13 Jan 2022 18:07:43 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 05346F8013F
 for <alsa-devel@alsa-project.org>; Thu, 13 Jan 2022 18:07:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 05346F8013F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="VHybBKuH"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 20DGAV43020998;
 Thu, 13 Jan 2022 11:07:36 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=GSiBkVP9UmloE0oIArp77dF5D6A7HQmpsTBzlpdvMyY=;
 b=VHybBKuHOuMu13cAI/5M7TPpZbLvYs2eSzykmjI8f57kUHaif2g9ZViibiMJjkb0P19u
 aBOg+nOF+esO59I+eH6mB9c54P/ISMrj8nrh17LWstrUucXs5kvUKRCpE11pdHzaniJB
 lOQYhp4hv7H+RFqjhoL7NS0mkbaivQEZ0kxBXjl7FwKEEt5cT93OYrHyyWACbqT2JUqo
 IFwtaUTjuCrtFGjzHhSKYqFFD9/gZOAk+ndrNzHkuUe6H01z2BsK0iae3nnXgIuv37pz
 RNafqMxCfNakLoUdA2e2znNnnZWW/HnPHPxEK4XquZqNkLmBBwBOs2M90PSIFfL6Ger8 hQ== 
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
 by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3djqcb026y-4
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Thu, 13 Jan 2022 11:07:35 -0600
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Thu, 13 Jan
 2022 17:07:32 +0000
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.18 via
 Frontend Transport; Thu, 13 Jan 2022 17:07:32 +0000
Received: from aryzen.ad.cirrus.com (unknown [198.61.65.50])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 23A6AB0E;
 Thu, 13 Jan 2022 17:07:32 +0000 (UTC)
From: Lucas Tanure <tanureal@opensource.cirrus.com>
To: "Rafael J . Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
 Hans de Goede <hdegoede@redhat.com>, Mark Gross <markgross@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Subject: [PATCH 5/5] ACPI / scan: Create platform device for CLSA0100
Date: Thu, 13 Jan 2022 17:07:28 +0000
Message-ID: <20220113170728.1953559-5-tanureal@opensource.cirrus.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220113170728.1953559-1-tanureal@opensource.cirrus.com>
References: <20220113170728.1953559-1-tanureal@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: 6hGjFieOBt8Dt08GJJouyJ77KoV70pmi
X-Proofpoint-ORIG-GUID: 6hGjFieOBt8Dt08GJJouyJ77KoV70pmi
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

The ACPI device with CLSA0100 is a sound card with
multiple instances of CS35L41 connected by I2C to
the main CPU.

We add an ID to the i2c_multi_instantiate_idsi list
to enumerate all I2C slaves correctly.

Signed-off-by: Lucas Tanure <tanureal@opensource.cirrus.com>
---
 drivers/acpi/scan.c                          | 2 ++
 drivers/platform/x86/i2c-multi-instantiate.c | 8 ++++++++
 2 files changed, 10 insertions(+)

diff --git a/drivers/acpi/scan.c b/drivers/acpi/scan.c
index c215bc8723d0..2a68031d953e 100644
--- a/drivers/acpi/scan.c
+++ b/drivers/acpi/scan.c
@@ -1753,6 +1753,8 @@ static bool acpi_device_enumeration_by_parent(struct acpi_device *device)
 	 */
 		{"BCM4752", },
 		{"LNV4752", },
+	/* Non-conforming _HID for Cirrus Logic already released */
+		{"CLSA0100", },
 		{}
 	};
 
diff --git a/drivers/platform/x86/i2c-multi-instantiate.c b/drivers/platform/x86/i2c-multi-instantiate.c
index 4956a1df5b90..a51a74933fa9 100644
--- a/drivers/platform/x86/i2c-multi-instantiate.c
+++ b/drivers/platform/x86/i2c-multi-instantiate.c
@@ -147,6 +147,12 @@ static const struct i2c_inst_data int3515_data[]  = {
 	{}
 };
 
+static const struct i2c_inst_data cs35l41_hda[] = {
+	{ "cs35l41-hda", IRQ_RESOURCE_GPIO, 0 },
+	{ "cs35l41-hda", IRQ_RESOURCE_GPIO, 0 },
+	{}
+};
+
 /*
  * Note new device-ids must also be added to i2c_multi_instantiate_ids in
  * drivers/acpi/scan.c: acpi_device_enumeration_by_parent().
@@ -155,6 +161,8 @@ static const struct acpi_device_id i2c_multi_inst_acpi_ids[] = {
 	{ "BSG1160", (unsigned long)bsg1160_data },
 	{ "BSG2150", (unsigned long)bsg2150_data },
 	{ "INT3515", (unsigned long)int3515_data },
+	/* Non-conforming _HID for Cirrus Logic already released */
+	{ "CLSA0100", (unsigned long)cs35l41_hda },
 	{ }
 };
 MODULE_DEVICE_TABLE(acpi, i2c_multi_inst_acpi_ids);
-- 
2.34.1

