Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B3A9548DCAE
	for <lists+alsa-devel@lfdr.de>; Thu, 13 Jan 2022 18:10:14 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6210C2020;
	Thu, 13 Jan 2022 18:09:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6210C2020
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1642093814;
	bh=6jJqw1zxSZGJ4whrMvItC7N04L5/xejXvS5zoM+rFnE=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=twGNcw6J2gMYI/JNqR4A9Ilo0lohD6c6wgjtH3Jh0bAD/6MoLo13PhitzhMOx5BfN
	 QqphQnYJ836Y3VbVQdlpkmjolEkdrHWW7EbAFRSrnmexpDMgJPlzdVseHvysPs7zqW
	 30jQNqEpZYQOcVanqT77YhVwgrqaUiLQqxXg1Wbw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C7A1FF80515;
	Thu, 13 Jan 2022 18:07:47 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 19C18F80516; Thu, 13 Jan 2022 18:07:46 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EF6A8F80054
 for <alsa-devel@alsa-project.org>; Thu, 13 Jan 2022 18:07:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EF6A8F80054
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="AAVok25A"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 20DGAV40020998;
 Thu, 13 Jan 2022 11:07:33 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=HI6bEErhvsZPIb7ephN7Y9393a6abI1s2gAyNDkJZXY=;
 b=AAVok25Aem42bor/3GPosb7Owzp05/4x22OYdTpKbVqaekymMPC8ll7a1A6cixEwXajk
 qv4UgpFBP9DFZf7As1F3IWVuW/o5aHTun4o65BEoExgZE6KJ+EzbjHRqYJ7jGG4FRdf2
 tThu54E6vm6fow7jR9DGB6WkfDodYjl1vxfl16RV/hlfsHZa1tyKQVb+cXOhM44hydKY
 0VtgMgwrB8jLHv8MdJaOZ33HKnUDViKK/KgmzkF6LCDWaE0Yg7Z65L6IBjvEq7GCdpoe
 e00jgNgK6vVtA8EZSRAD1+ghvWmpfdvej6+kP/wiwmZemhJ4fXmPr1nCDYddu+6GOiLf Bg== 
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
 by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3djqcb026y-1
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
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id C7E87B0E;
 Thu, 13 Jan 2022 17:07:30 +0000 (UTC)
From: Lucas Tanure <tanureal@opensource.cirrus.com>
To: "Rafael J . Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
 Hans de Goede <hdegoede@redhat.com>, Mark Gross <markgross@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Subject: [PATCH 2/5] ALSA: hda: cs35l41: Add calls to newly added test key
 function
Date: Thu, 13 Jan 2022 17:07:25 +0000
Message-ID: <20220113170728.1953559-2-tanureal@opensource.cirrus.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220113170728.1953559-1-tanureal@opensource.cirrus.com>
References: <20220113170728.1953559-1-tanureal@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: pmEixx5NJrqnbqps-fMLCBxpSSPyDnrM
X-Proofpoint-ORIG-GUID: pmEixx5NJrqnbqps-fMLCBxpSSPyDnrM
X-Proofpoint-Spam-Reason: safe
Cc: alsa-devel@alsa-project.org, Charles Keepax <ckeepax@opensource.cirrus.com>,
 Lucas Tanure <tanureal@opensource.cirrus.com>, patches@opensource.cirrus.com,
 linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org,
 linux-acpi@vger.kernel.org
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

From: Charles Keepax <ckeepax@opensource.cirrus.com>

The test key now needs to be manually held when calling
cs35l41_register_errata_patch, after patch:

'commit f517ba4924ad ("ASoC: cs35l41: Add support for
hibernate memory retention mode")'

Add the missing function calls to this driver.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
Signed-off-by: Lucas Tanure <tanureal@opensource.cirrus.com>
---
 sound/pci/hda/cs35l41_hda.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/sound/pci/hda/cs35l41_hda.c b/sound/pci/hda/cs35l41_hda.c
index c47c5f0b4e59..509a380f9be7 100644
--- a/sound/pci/hda/cs35l41_hda.c
+++ b/sound/pci/hda/cs35l41_hda.c
@@ -463,6 +463,10 @@ int cs35l41_hda_probe(struct device *dev, const char *device_name, int id, int i
 		goto err;
 	}
 
+	ret = cs35l41_test_key_unlock(cs35l41->dev, cs35l41->regmap);
+	if (ret)
+		goto err;
+
 	ret = cs35l41_register_errata_patch(cs35l41->dev, cs35l41->regmap, reg_revid);
 	if (ret)
 		goto err;
@@ -473,6 +477,10 @@ int cs35l41_hda_probe(struct device *dev, const char *device_name, int id, int i
 		goto err;
 	}
 
+	ret = cs35l41_test_key_lock(cs35l41->dev, cs35l41->regmap);
+	if (ret)
+		goto err;
+
 	ret = cs35l41_hda_apply_properties(cs35l41, acpi_hw_cfg);
 	if (ret)
 		goto err;
-- 
2.34.1

