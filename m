Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BAC006E2469
	for <lists+alsa-devel@lfdr.de>; Fri, 14 Apr 2023 15:40:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 45258E83;
	Fri, 14 Apr 2023 15:39:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 45258E83
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1681479600;
	bh=Tq2Oy1mcE6uMjdArf8OWpuiYhef624f8nXhnAnzFrfc=;
	h=To:Subject:Date:In-Reply-To:References:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From:Reply-To:Cc:From;
	b=SiXLYESPjzls+Qwpxv4WSMGkfk7rXZye0Znw/E/0KW/C4AFv0VWhKqXdxAPXEJzFT
	 hZznjuIHGE5cb+fVnOmmTCxqGu+MIdoLfMotpGIEfCMLOhp5mt/7XvywgzHeVpngEl
	 iQtGbj7F4h92ULdDa6aN7JJxjr3ssUTIknaF8AGo=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9F751F8052E;
	Fri, 14 Apr 2023 15:38:15 +0200 (CEST)
To: <broonie@kernel.org>
Subject: [PATCH 2/5] ASoC: cs35l56: Allow a wider range for reset pulse width
Date: Fri, 14 Apr 2023 14:37:50 +0100
In-Reply-To: <20230414133753.653139-1-rf@opensource.cirrus.com>
References: <20230414133753.653139-1-rf@opensource.cirrus.com>
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/KAN65SCSSJ2V4JRAUKT4MMKEABJEZTWA/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>
MIME-Version: 1.0
Message-ID: 
 <168147949455.26.3401634900657387799@mailman-core.alsa-project.org>
From: Richard Fitzgerald via Alsa-devel <alsa-devel@alsa-project.org>
Reply-To: Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 patches@opensource.cirrus.com, Simon Trimmer <simont@opensource.cirrus.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>
Content-Type: message/rfc822
Content-Disposition: inline

Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 29B8EF804F2; Fri, 14 Apr 2023 15:38:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6CBC4F80448
	for <alsa-devel@alsa-project.org>; Fri, 14 Apr 2023 15:38:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6CBC4F80448
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=Db4OBZOR
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 33EDVEAQ030487;
	Fri, 14 Apr 2023 08:37:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=t8u5z/+Hl7usp2Usp0dfJ/iSy8mzPELkY06njsmrUxQ=;
 b=Db4OBZORU3ZR0royBcyWFIGhQLKEG81mDsRJwWv3lAY5ciq60QepA9SugYEQwP3bWXae
 dZ1Q68Mue5t5TT7sg9z8D3bYYdwDnWhFpKtq3OpCCqRJUwhK1QY562Oo6oUfaBIir7Kk
 OXCn8bKuO6UErFqCNJqQ0SqTd5r4QRKGSpydyBQ1eb+UQ9LCRG3TqLV4+nizEMIskj4c
 NUwbK+98nguR5nCP7wEyMyUF37aHCI8Zvt58AeSFrSnOz50IY519sci7YIAH2KnApncJ
 zdZzdNa83w3tncU4BcbDBDURT4Ikvtpp3pSnP0150YS0qrHlXoOfl3ZYXdQCwClCABkF LQ==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3pu5p3sexy-3
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 14 Apr 2023 08:37:58 -0500
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.26; Fri, 14 Apr
 2023 08:37:54 -0500
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.2.1118.26 via Frontend
 Transport; Fri, 14 Apr 2023 08:37:54 -0500
Received: from edi-sw-dsktp-006.ad.cirrus.com (edi-sw-dsktp-006.ad.cirrus.com
 [198.90.251.127])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 1553545D;
	Fri, 14 Apr 2023 13:37:54 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: <broonie@kernel.org>
Subject: [PATCH 2/5] ASoC: cs35l56: Allow a wider range for reset pulse width
Date: Fri, 14 Apr 2023 14:37:50 +0100
Message-ID: <20230414133753.653139-3-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230414133753.653139-1-rf@opensource.cirrus.com>
References: <20230414133753.653139-1-rf@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: tVmX-Lr0LKU_2vIpGUHHfiJVPXPJntDH
X-Proofpoint-GUID: tVmX-Lr0LKU_2vIpGUHHfiJVPXPJntDH
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: KAN65SCSSJ2V4JRAUKT4MMKEABJEZTWA
X-Message-ID-Hash: KAN65SCSSJ2V4JRAUKT4MMKEABJEZTWA
X-MailFrom: prvs=94685c4d78=rf@opensource.cirrus.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 patches@opensource.cirrus.com, Simon Trimmer <simont@opensource.cirrus.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/KAN65SCSSJ2V4JRAUKT4MMKEABJEZTWA/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Simon Trimmer <simont@opensource.cirrus.com>

There is no reason to have such a tight usleep range of 400us and it is
acceptable to allow MIN_US * 2.

Also wrap the usleep in an inline function.

Signed-off-by: Simon Trimmer <simont@opensource.cirrus.com>
Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---
 sound/soc/codecs/cs35l56.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/sound/soc/codecs/cs35l56.c b/sound/soc/codecs/cs35l56.c
index 5ea7f419cda6..d60095162bfa 100644
--- a/sound/soc/codecs/cs35l56.c
+++ b/sound/soc/codecs/cs35l56.c
@@ -835,6 +835,12 @@ static int cs35l56_wait_for_firmware_boot(struct cs35l56_private *cs35l56)
 	return 0;
 }
 
+static inline void cs35l56_wait_min_reset_pulse(void)
+{
+	/* Satisfy minimum reset pulse width spec */
+	usleep_range(CS35L56_RESET_PULSE_MIN_US, 2 * CS35L56_RESET_PULSE_MIN_US);
+}
+
 static const struct reg_sequence cs35l56_system_reset_seq[] = {
 	REG_SEQ0(CS35L56_DSP_VIRTUAL1_MBOX_1, CS35L56_MBOX_CMD_SYSTEM_RESET),
 };
@@ -1236,7 +1242,7 @@ int cs35l56_system_suspend_late(struct device *dev)
 	 */
 	if (cs35l56->reset_gpio) {
 		gpiod_set_value_cansleep(cs35l56->reset_gpio, 0);
-		usleep_range(CS35L56_RESET_PULSE_MIN_US, CS35L56_RESET_PULSE_MIN_US + 400);
+		cs35l56_wait_min_reset_pulse();
 	}
 
 	regulator_bulk_disable(ARRAY_SIZE(cs35l56->supplies), cs35l56->supplies);
@@ -1289,7 +1295,7 @@ int cs35l56_system_resume_early(struct device *dev)
 	/* Ensure a spec-compliant RESET pulse. */
 	if (cs35l56->reset_gpio) {
 		gpiod_set_value_cansleep(cs35l56->reset_gpio, 0);
-		usleep_range(CS35L56_RESET_PULSE_MIN_US, CS35L56_RESET_PULSE_MIN_US + 400);
+		cs35l56_wait_min_reset_pulse();
 	}
 
 	/* Enable supplies before releasing RESET. */
@@ -1440,9 +1446,7 @@ int cs35l56_common_probe(struct cs35l56_private *cs35l56)
 		return dev_err_probe(cs35l56->dev, ret, "Failed to enable supplies\n");
 
 	if (cs35l56->reset_gpio) {
-		/* satisfy minimum reset pulse width spec */
-		usleep_range(CS35L56_RESET_PULSE_MIN_US,
-			     CS35L56_RESET_PULSE_MIN_US + 400);
+		cs35l56_wait_min_reset_pulse();
 		gpiod_set_value_cansleep(cs35l56->reset_gpio, 1);
 	}
 
-- 
2.30.2

