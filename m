Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 456F1857EA8
	for <lists+alsa-devel@lfdr.de>; Fri, 16 Feb 2024 15:06:36 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C29F686F;
	Fri, 16 Feb 2024 15:06:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C29F686F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1708092395;
	bh=E6q5xrMcVV+0iqJ33ckm74DzEhM3R6Lm5oDsVEfUaZs=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=qR0C9sl+uGkUXd4043P+9HK0klQNk6xOAj3FLqK2UFimas6qlUmVv4cb15lKR1qvh
	 W9bHbeDmbn1FhkaeTY1zn01ymMfhHjPXzaur2Ej9qFmGMXduLyaGqwkvxjB3qrLfbr
	 /o2rF9EhqRg0x8gGJrytWr1DrM+Y9INRcmLa2N98=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C65DCF805B6; Fri, 16 Feb 2024 15:06:03 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4E814F80588;
	Fri, 16 Feb 2024 15:06:03 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5207EF80238; Fri, 16 Feb 2024 15:05:57 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 68E10F80104
	for <alsa-devel@alsa-project.org>; Fri, 16 Feb 2024 15:05:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 68E10F80104
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=F4OzVQbF
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 41G5u5hg027308;
	Fri, 16 Feb 2024 08:05:37 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PODMain02222019; bh=D
	w280V9Ji8JnDWHiX49rYuBF9Ede07pNOdQW29T5Qag=; b=F4OzVQbFi4ewdFUlT
	uU1W+e+bVKsiFUa31R6u5z4IXVO27zdEmSOltdY5Iw+YBDHCYfKgI+BNTVv2m0sQ
	+BPskYVslty0imzHDz/rFu9mxnUjPiGcohi/EOzqpU6W/6N+6ytpwttGbUVh+TOE
	w5NB1ogPposbebzRFBJ67zw/kbA6gFnqe5ZjAUAlrKeSgF5NmltUlzWa+Ka8g3vb
	HQYQXno0cP2/mOeIhQl1Wy7kZhmL0ewC7ZiFnQVVAgrt5wakA61yHCOaq1F0La0Y
	A/Pw89vj0ZboxE9wI/TR9/GtCkXucbD7Ctp8zxw4RJ+1VMcR/djaVzqCbdekpcLC
	ojMag==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3w67e2738b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 16 Feb 2024 08:05:37 -0600 (CST)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Fri, 16 Feb
 2024 14:05:35 +0000
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 ediex01.ad.cirrus.com (198.61.84.80) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40 via Frontend Transport; Fri, 16 Feb 2024 14:05:35 +0000
Received: from ediswws06.ad.cirrus.com (ediswws06.ad.cirrus.com
 [198.90.208.18])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id 5FA17820242;
	Fri, 16 Feb 2024 14:05:35 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: <broonie@kernel.org>
CC: <alsa-devel@alsa-project.org>, <linux-sound@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <patches@opensource.cirrus.com>,
        "Richard
 Fitzgerald" <rf@opensource.cirrus.com>
Subject: [PATCH] ASoC: cs35l56: Must clear HALO_STATE before issuing
 SYSTEM_RESET
Date: Fri, 16 Feb 2024 14:05:35 +0000
Message-ID: <20240216140535.1434933-1-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: _z1cWPfNfG1gpNOCgIy6EkY_CyfG-Cwr
X-Proofpoint-GUID: _z1cWPfNfG1gpNOCgIy6EkY_CyfG-Cwr
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: UB3AQZOPS64YG45O3ADQOHG3RQVTI6O6
X-Message-ID-Hash: UB3AQZOPS64YG45O3ADQOHG3RQVTI6O6
X-MailFrom: prvs=9776aa2d70=rf@opensource.cirrus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/UB3AQZOPS64YG45O3ADQOHG3RQVTI6O6/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The driver must write 0 to HALO_STATE before sending the SYSTEM_RESET
command to the firmware.

HALO_STATE is in DSP memory, which is preserved across a soft reset.
The SYSTEM_RESET command does not change the value of HALO_STATE.
There is period of time while the CS35L56 is resetting, before the
firmware has started to boot, where a read of HALO_STATE will return
the value it had before the SYSTEM_RESET. If the driver does not
clear HALO_STATE, this would return BOOT_DONE status even though the
firmware has not booted.

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
Fixes: 8a731fd37f8b ("ASoC: cs35l56: Move utility functions to shared file")
---
 sound/soc/codecs/cs35l56-shared.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/codecs/cs35l56-shared.c b/sound/soc/codecs/cs35l56-shared.c
index 995d979b6d87..cb4e83126b08 100644
--- a/sound/soc/codecs/cs35l56-shared.c
+++ b/sound/soc/codecs/cs35l56-shared.c
@@ -335,6 +335,7 @@ void cs35l56_wait_min_reset_pulse(void)
 EXPORT_SYMBOL_NS_GPL(cs35l56_wait_min_reset_pulse, SND_SOC_CS35L56_SHARED);
 
 static const struct reg_sequence cs35l56_system_reset_seq[] = {
+	REG_SEQ0(CS35L56_DSP1_HALO_STATE, 0),
 	REG_SEQ0(CS35L56_DSP_VIRTUAL1_MBOX_1, CS35L56_MBOX_CMD_SYSTEM_RESET),
 };
 
-- 
2.30.2

