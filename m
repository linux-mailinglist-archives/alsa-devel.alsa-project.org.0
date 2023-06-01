Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4533A71A335
	for <lists+alsa-devel@lfdr.de>; Thu,  1 Jun 2023 17:51:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CF3EA839;
	Thu,  1 Jun 2023 17:50:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CF3EA839
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1685634671;
	bh=moK5e4bfKuvbWIKCxqCnAKXWulDDEb4SfkpyjDKd0os=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Ss+WlzmVuZpDeMISX5fy/75zW4ZiUmKrPE5T2zSYnGv7uM7+1dqtIxRz5gSoMStqC
	 ryUgtWq/f5P+TQRcFia14W6l6Cx9TmhtH2eqWPubJR9vnoOftFPCX4ArjQjlqmigKx
	 iFlWjRqBP8q3ZmtP7rXKx+JhVZzmL5k4c1MYjmfA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 867B2F805EB; Thu,  1 Jun 2023 17:48:13 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A30C4F805E5;
	Thu,  1 Jun 2023 17:48:12 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 27C9FF8057E; Thu,  1 Jun 2023 17:47:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7302EF80149
	for <alsa-devel@alsa-project.org>; Thu,  1 Jun 2023 17:47:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7302EF80149
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=S0YdhEIN
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 351CPISZ014930;
	Thu, 1 Jun 2023 10:47:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=ZtRVanoa2UL9fx2mOjgnx7Kor2SKPiAisybX4sOubCs=;
 b=S0YdhEINQttRsPR0Nq/Ygs4gC6mlo5XSRL/wzAPPlHqFSwv0UVQA0RCXLUPgRwIWGMF/
 OeZBV5crmUSx2/SHWSXFdpsW2CPZGHloxV7UBbiVZwW7SBMlh+yVmbC59HXOPPh7d8fB
 u62+R8Uz5+LP4eNOAhdAl+Iz11V5pWYmrc6XhUPIdxwIP+2GmXRQ0ZP0EBih29aMWqkh
 kptjGvkdr8c2b2txofK/iwpb75184ai8j6m9EgfI5J0LjQj1QAv/iH4NOB+oSGzpMtEs
 FqhQ9aIO5rc/9mIaMDRh9TPc4bFxyazxwnff/mezOoLv4F1SohQ70if+6X9syNyP0+su JA==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3quf90x42d-5
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 01 Jun 2023 10:47:37 -0500
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.26; Thu, 1 Jun
 2023 16:47:31 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.2.1118.26 via Frontend
 Transport; Thu, 1 Jun 2023 16:47:31 +0100
Received: from edi-sw-dsktp-006.ad.cirrus.com (edi-sw-dsktp-006.ad.cirrus.com
 [198.90.251.127])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id BC87E15A4;
	Thu,  1 Jun 2023 15:47:31 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: <tiwai@suse.com>, <perex@perex.cz>, <broonie@kernel.org>
CC: <alsa-devel@alsa-project.org>, <linux-kernel@vger.kernel.org>,
        <patches@opensource.cirrus.com>,
        Simon Trimmer
	<simont@opensource.cirrus.com>,
        Richard Fitzgerald <rf@opensource.cirrus.com>
Subject: [PATCH v4 08/12] ASoC: cs35l56: Make common function for control port
 wait
Date: Thu, 1 Jun 2023 16:47:27 +0100
Message-ID: <20230601154731.3210572-9-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230601154731.3210572-1-rf@opensource.cirrus.com>
References: <20230601154731.3210572-1-rf@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: ZVmxJV_NsmlLJqlBjs1oeVwctAu3N39e
X-Proofpoint-ORIG-GUID: ZVmxJV_NsmlLJqlBjs1oeVwctAu3N39e
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: HXG4ID4KIP36PVYGDZVZYHELAZMKY6VC
X-Message-ID-Hash: HXG4ID4KIP36PVYGDZVZYHELAZMKY6VC
X-MailFrom: prvs=151698faa0=rf@opensource.cirrus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/HXG4ID4KIP36PVYGDZVZYHELAZMKY6VC/>
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
index 489a61f84325..ae9e8f55962a 100644
--- a/include/sound/cs35l56.h
+++ b/include/sound/cs35l56.h
@@ -275,6 +275,7 @@ extern const unsigned int cs35l56_tx_input_values[CS35L56_NUM_INPUT_SRC];
 void cs35l56_reread_firmware_registers(struct cs35l56_base *cs35l56_base);
 int cs35l56_mbox_send(struct cs35l56_base *cs35l56_base, unsigned int command);
 int cs35l56_wait_for_firmware_boot(struct cs35l56_base *cs35l56_base);
+void cs35l56_wait_control_port_ready(void);
 void cs35l56_wait_min_reset_pulse(void);
 void cs35l56_system_reset(struct cs35l56_base *cs35l56_base, bool is_soundwire);
 int cs35l56_irq_request(struct cs35l56_base *cs35l56_base, int irq);
diff --git a/sound/soc/codecs/cs35l56-shared.c b/sound/soc/codecs/cs35l56-shared.c
index e3b935bd9037..7e02d023338c 100644
--- a/sound/soc/codecs/cs35l56-shared.c
+++ b/sound/soc/codecs/cs35l56-shared.c
@@ -249,6 +249,13 @@ int cs35l56_wait_for_firmware_boot(struct cs35l56_base *cs35l56_base)
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
@@ -275,7 +282,7 @@ void cs35l56_system_reset(struct cs35l56_base *cs35l56_base, bool is_soundwire)
 	if (is_soundwire)
 		return;
 
-	usleep_range(CS35L56_CONTROL_PORT_READY_US, CS35L56_CONTROL_PORT_READY_US + 400);
+	cs35l56_wait_control_port_ready();
 	regcache_cache_only(cs35l56_base->regmap, false);
 }
 EXPORT_SYMBOL_NS_GPL(cs35l56_system_reset, SND_SOC_CS35L56_SHARED);
@@ -486,8 +493,7 @@ int cs35l56_runtime_resume_common(struct cs35l56_base *cs35l56_base, bool is_sou
 						cs35l56_hibernate_wake_seq,
 						ARRAY_SIZE(cs35l56_hibernate_wake_seq));
 
-		usleep_range(CS35L56_CONTROL_PORT_READY_US,
-			     CS35L56_CONTROL_PORT_READY_US + 400);
+		cs35l56_wait_control_port_ready();
 	}
 
 out_sync:
@@ -561,9 +567,7 @@ int cs35l56_hw_init(struct cs35l56_base *cs35l56_base)
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

