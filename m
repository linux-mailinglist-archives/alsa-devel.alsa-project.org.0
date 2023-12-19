Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7304B818C15
	for <lists+alsa-devel@lfdr.de>; Tue, 19 Dec 2023 17:23:33 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 040BAE76;
	Tue, 19 Dec 2023 17:23:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 040BAE76
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1703003013;
	bh=k+REvp5rrSawFtWM6CQWTUZ1WjCVHMhecNdbz5kST7s=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ZXVZHadsE0fmtRNZafWj4X5C3OR1y+F1VCCa61HPVivMeiOO6o/sz4L3jl9JDwtZf
	 q9njYPX20iDNxpQJVpWbox/6GC4l1SS/63iRB8GsXx8u7XNbm0gXobEgzy2PNexe3D
	 i6C+ci7mv8ZDWNxJ2gLI5C43KNt1JeDZSaYgsUrs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9DCE4F804DA; Tue, 19 Dec 2023 17:23:00 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5FAB6F8055C;
	Tue, 19 Dec 2023 17:23:00 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B1832F804DA; Tue, 19 Dec 2023 17:22:54 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,T_SCC_BODY_TEXT_LINE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id CFD19F80212
	for <alsa-devel@alsa-project.org>; Tue, 19 Dec 2023 17:22:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CFD19F80212
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=IIT2R+8t
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 3BJ6vo3A022423;
	Tue, 19 Dec 2023 10:22:47 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	PODMain02222019; bh=kWx+FOgFshuXbEEqkcUUBv5Kl1kbOKWb4xX0B875/08=; b=
	IIT2R+8t3bT7OdewwNHScukbYxtUDo26JLmOO9T/Ab9SLxPlqSu+WSErFFSyKPen
	VJ6YdtDeQGYge5BoBoZQx1+8V54g7FQxmIwG/iXkCOChn0zKyg9VvQVE4au6TDcX
	jSO3e/qfvIxEjn1T3cM8d9a+qQ1b/KwZPAyS34nXbINCO+HkdslSPtfVcnOFwNv6
	wZTGJdOWQKVQk8z5MjKABkiQvUQvsijpooYlTNbZ2wV3h5k7xroFEPct21vUeLAV
	of0afIOtumAtJBHJwcYL7l1Ls8/fAXHywuGP2rF0L8ao0k/XGsi7UJimzxX98x1h
	/dAjOZdDQJRY+Zpnti1xlA==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3v1a6249gs-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 19 Dec 2023 10:22:47 -0600 (CST)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Tue, 19 Dec
 2023 16:22:43 +0000
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.2.1118.40 via Frontend
 Transport; Tue, 19 Dec 2023 16:22:43 +0000
Received: from sbinding-cirrus-dsktp2.ad.cirrus.com (unknown [198.90.238.77])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 0A9A715B9;
	Tue, 19 Dec 2023 16:22:43 +0000 (UTC)
From: Stefan Binding <sbinding@opensource.cirrus.com>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
CC: <alsa-devel@alsa-project.org>, <linux-sound@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <patches@opensource.cirrus.com>,
        "Stefan
 Binding" <sbinding@opensource.cirrus.com>
Subject: [PATCH v1 1/2] ALSA: hda: cs35l41: Do not allow uninitialised
 variables to be freed
Date: Tue, 19 Dec 2023 16:22:31 +0000
Message-ID: <20231219162232.790358-2-sbinding@opensource.cirrus.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231219162232.790358-1-sbinding@opensource.cirrus.com>
References: <20231219162232.790358-1-sbinding@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: ODee1_Mhp9AwakRjhVnYukfjuVkbAeWJ
X-Proofpoint-ORIG-GUID: ODee1_Mhp9AwakRjhVnYukfjuVkbAeWJ
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: JZ2EJSO5KCVT2YYIPTA476DPE6THA7R2
X-Message-ID-Hash: JZ2EJSO5KCVT2YYIPTA476DPE6THA7R2
X-MailFrom: prvs=7717b54677=sbinding@opensource.cirrus.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JZ2EJSO5KCVT2YYIPTA476DPE6THA7R2/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Initialise the variables to NULL so that they cannot be uninitialised
when devm_kfree is called.

Found by static analysis.

Fixes: 8c4c216db8fb ("ALSA: hda: cs35l41: Add config table to support many laptops without _DSD")

Signed-off-by: Stefan Binding <sbinding@opensource.cirrus.com>
---
 sound/pci/hda/cs35l41_hda_property.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/pci/hda/cs35l41_hda_property.c b/sound/pci/hda/cs35l41_hda_property.c
index c9eb70290973..73b304e6c83c 100644
--- a/sound/pci/hda/cs35l41_hda_property.c
+++ b/sound/pci/hda/cs35l41_hda_property.c
@@ -77,10 +77,10 @@ static const struct cs35l41_config cs35l41_config_table[] = {
 static int cs35l41_add_gpios(struct cs35l41_hda *cs35l41, struct device *physdev, int reset_gpio,
 			     int spkid_gpio, int cs_gpio_index, int num_amps)
 {
-	struct acpi_gpio_mapping *gpio_mapping;
-	struct acpi_gpio_params *reset_gpio_params;
-	struct acpi_gpio_params *spkid_gpio_params;
-	struct acpi_gpio_params *cs_gpio_params;
+	struct acpi_gpio_mapping *gpio_mapping = NULL;
+	struct acpi_gpio_params *reset_gpio_params = NULL;
+	struct acpi_gpio_params *spkid_gpio_params = NULL;
+	struct acpi_gpio_params *cs_gpio_params = NULL;
 	unsigned int num_entries = 0;
 	unsigned int reset_index, spkid_index, csgpio_index;
 	int i;
-- 
2.34.1

