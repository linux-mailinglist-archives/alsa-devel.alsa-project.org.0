Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AB31875C7BD
	for <lists+alsa-devel@lfdr.de>; Fri, 21 Jul 2023 15:25:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0DF87843;
	Fri, 21 Jul 2023 15:24:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0DF87843
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689945916;
	bh=CnRLAv31UiEFI1wgZWjHXpt/WRbr2w5cI3bfkQ9tBXk=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=U94Oo0wELxQcig3htrLZJVUN26EFOYlhLTa+O3H7z1bU+IcHJ5P6CWJjNQDZJhD1B
	 ccFeytoI6f7b+leualhmHhbtrTNIfk0nygf7lJJGZOeRE3z+cKud92Xgvl2U7IZXL5
	 oFF9e1v9kAd4exYhFp7pLt9ko3/XWGQu+W05NBOs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 793DEF805E0; Fri, 21 Jul 2023 15:22:20 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B637EF805D7;
	Fri, 21 Jul 2023 15:22:19 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 63E55F805BA; Fri, 21 Jul 2023 15:22:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=unavailable autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B67BEF80549
	for <alsa-devel@alsa-project.org>; Fri, 21 Jul 2023 15:21:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B67BEF80549
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=TDYllQvB
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 36LBeOqL003184;
	Fri, 21 Jul 2023 08:21:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	PODMain02222019; bh=/GR8Vtk59byP9wmS57RBzSvQgsvYoSeDrSmoMD6yAyg=; b=
	TDYllQvBA7zFTKeNcNFyxM7PHmQo7d5ZUfiN+vY1E1H6LjK6isyWVdgfn+52qGfU
	wy/e6F2AQ0u0feRbCwazXPMShAVnX6gtf3MNdT6UY5zyslvnULxcT6nh9fM176wW
	xmqmQh26XN5YycfW0ptj1GxFi6lZsI9G+qVe/0aSeLePFZ9CXgSVDXMkQOVOKigh
	pdbbtMT1t1n9VTyQetJrO63Naf3ufBGsy3H/eYog8zCDdLl26ImjAQhyAX02Y7Yq
	DLf3KSXK9dMlL3iB0gNw+UZqw6mt7HcVLvKqO/Xc+GzhaqIR25BNngXrCddKcumv
	iLB8IYpyeO0MHPgDx6ZlKA==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3rus62y4hx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 21 Jul 2023 08:21:29 -0500 (CDT)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.30; Fri, 21 Jul
 2023 14:21:27 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.2.1118.30 via Frontend
 Transport; Fri, 21 Jul 2023 14:21:27 +0100
Received: from work-debian.ad.cirrus.com (unknown [198.61.64.172])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id BBB6D15B6;
	Fri, 21 Jul 2023 13:21:26 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: <broonie@kernel.org>, <tiwai@suse.com>
CC: <perex@perex.cz>, <alsa-devel@alsa-project.org>,
        <linux-kernel@vger.kernel.org>, <patches@opensource.cirrus.com>,
        Simon
 Trimmer <simont@opensource.cirrus.com>,
        Richard Fitzgerald
	<rf@opensource.cirrus.com>
Subject: [PATCH v5 08/11] ASoC: cs35l56: Make common function for control port
 wait
Date: Fri, 21 Jul 2023 14:21:17 +0100
Message-ID: <20230721132120.5523-9-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230721132120.5523-1-rf@opensource.cirrus.com>
References: <20230721132120.5523-1-rf@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: gpEXFCACL11W3ufuZboS1PXaSEyF-jjJ
X-Proofpoint-ORIG-GUID: gpEXFCACL11W3ufuZboS1PXaSEyF-jjJ
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: FONPJIPMN2CYAIXVTPIRPYXMDSPCLLJN
X-Message-ID-Hash: FONPJIPMN2CYAIXVTPIRPYXMDSPCLLJN
X-MailFrom: prvs=25664d1566=rf@opensource.cirrus.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/FONPJIPMN2CYAIXVTPIRPYXMDSPCLLJN/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Simon Trimmer <simont@opensource.cirrus.com>

Move the waits for CS35L56_CONTROL_PORT_READY_US into a common
function, and also allow a wider range of allowed wait times.

Signed-off-by: Simon Trimmer <simont@opensource.cirrus.com>
Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
Acked-by: Mark Brown <broonie@kernel.org>
---
 include/sound/cs35l56.h           |  1 +
 sound/soc/codecs/cs35l56-shared.c | 16 ++++++++++------
 2 files changed, 11 insertions(+), 6 deletions(-)

diff --git a/include/sound/cs35l56.h b/include/sound/cs35l56.h
index 0d6cdfb6107b..79e117abee06 100644
--- a/include/sound/cs35l56.h
+++ b/include/sound/cs35l56.h
@@ -275,6 +275,7 @@ extern const unsigned int cs35l56_tx_input_values[CS35L56_NUM_INPUT_SRC];
 int cs35l56_set_patch(struct cs35l56_base *cs35l56_base);
 int cs35l56_mbox_send(struct cs35l56_base *cs35l56_base, unsigned int command);
 int cs35l56_wait_for_firmware_boot(struct cs35l56_base *cs35l56_base);
+void cs35l56_wait_control_port_ready(void);
 void cs35l56_wait_min_reset_pulse(void);
 void cs35l56_system_reset(struct cs35l56_base *cs35l56_base, bool is_soundwire);
 int cs35l56_irq_request(struct cs35l56_base *cs35l56_base, int irq);
diff --git a/sound/soc/codecs/cs35l56-shared.c b/sound/soc/codecs/cs35l56-shared.c
index 8a98070ece5e..4e3becb9581d 100644
--- a/sound/soc/codecs/cs35l56-shared.c
+++ b/sound/soc/codecs/cs35l56-shared.c
@@ -244,6 +244,13 @@ int cs35l56_wait_for_firmware_boot(struct cs35l56_base *cs35l56_base)
 }
 EXPORT_SYMBOL_NS_GPL(cs35l56_wait_for_firmware_boot, SND_SOC_CS35L56_SHARED);
 
+void cs35l56_wait_control_port_ready(void)
+{
+	/* Wait for control port to be ready (datasheet tIRS). */
+	usleep_range(CS35L56_CONTROL_PORT_READY_US, 2 * CS35L56_CONTROL_PORT_READY_US);
+}
+EXPORT_SYMBOL_NS_GPL(cs35l56_wait_control_port_ready, SND_SOC_CS35L56_SHARED);
+
 void cs35l56_wait_min_reset_pulse(void)
 {
 	/* Satisfy minimum reset pulse width spec */
@@ -270,7 +277,7 @@ void cs35l56_system_reset(struct cs35l56_base *cs35l56_base, bool is_soundwire)
 	if (is_soundwire)
 		return;
 
-	usleep_range(CS35L56_CONTROL_PORT_READY_US, CS35L56_CONTROL_PORT_READY_US + 400);
+	cs35l56_wait_control_port_ready();
 	regcache_cache_only(cs35l56_base->regmap, false);
 }
 EXPORT_SYMBOL_NS_GPL(cs35l56_system_reset, SND_SOC_CS35L56_SHARED);
@@ -481,8 +488,7 @@ int cs35l56_runtime_resume_common(struct cs35l56_base *cs35l56_base, bool is_sou
 						cs35l56_hibernate_wake_seq,
 						ARRAY_SIZE(cs35l56_hibernate_wake_seq));
 
-		usleep_range(CS35L56_CONTROL_PORT_READY_US,
-			     CS35L56_CONTROL_PORT_READY_US + 400);
+		cs35l56_wait_control_port_ready();
 	}
 
 out_sync:
@@ -556,9 +562,7 @@ int cs35l56_hw_init(struct cs35l56_base *cs35l56_base)
 	if (!cs35l56_base->reset_gpio)
 		regmap_read(cs35l56_base->regmap, CS35L56_DSP_VIRTUAL1_MBOX_1, &devid);
 
-	/* Wait for control port to be ready (datasheet tIRS). */
-	usleep_range(CS35L56_CONTROL_PORT_READY_US,
-		     CS35L56_CONTROL_PORT_READY_US + 400);
+	cs35l56_wait_control_port_ready();
 
 	/*
 	 * The HALO_STATE register is in different locations on Ax and B0
-- 
2.30.2

