Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AC1680747C
	for <lists+alsa-devel@lfdr.de>; Wed,  6 Dec 2023 17:04:27 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D6192850;
	Wed,  6 Dec 2023 17:04:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D6192850
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1701878666;
	bh=jsI2AcF3wi0NGxAesBuQMumoo5fLXxaVd5yW6rfOEEI=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Ka9M/+tDcS8/z7b6e1hLtbOfzAL5s4CKSvgGGQte+spwWVdWODNSQlk54ZpZ1Pgg+
	 Nx8IySVvslkmuff/PyUotsPeEvHTEZUbdNVl2ro5JLCkF1DH+B88MpV+B+4GmhDciA
	 0LURXeDW/hyDJ89was7PZyfoUTV700G+UtEmLOrs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 57EBFF80589; Wed,  6 Dec 2023 17:03:54 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 769B3F80557;
	Wed,  6 Dec 2023 17:03:53 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 66476F8025A; Wed,  6 Dec 2023 17:03:43 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 81A2BF800F5
	for <alsa-devel@alsa-project.org>; Wed,  6 Dec 2023 17:03:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 81A2BF800F5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=THDPlpRV
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 3B65uLeA028385;
	Wed, 6 Dec 2023 10:03:30 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	PODMain02222019; bh=CF5Y4M22mU0ASa7dzcDvmubXPzmRyzCTuOM4tyVQcZE=; b=
	THDPlpRVAwel25YuDshmjnnPKhnNpHMuzCUv6lAVyrToEmywcionIxQgSV6oSg9O
	qRKmiJExjknlxGFY9Z0mjb3IcppouRjKbpQiPbfAq7CNvvA6OkJghphiYMLMY9Dg
	v26YC7rojfi96hBlISJYpkeII9Q6aw5AWxDZkgSiSqnkn911DcLOkbKqjI8vsv5P
	Zz9v92VWduZRCNfMqhWh7eSK+f4Rq8NuDGUV+8WX0QEGLr3vzLe5m73jb0TN/mAP
	wvXsG5RaylOm8BH+ManaUvvO2W/k+mHG8ESavhi25UtrxZxq+wMVBLJdqKYLnWHD
	t81DW2MHxQ8TEBFUfiXN9Q==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3utd47rww8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 06 Dec 2023 10:03:29 -0600 (CST)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Wed, 6 Dec
 2023 16:03:27 +0000
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1118.40 via Frontend Transport; Wed, 6 Dec 2023 16:03:27 +0000
Received: from ricardo-lws.crystal.cirrus.com (ricardo-lws.ad.cirrus.com
 [141.131.145.40])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 53A8E11D1;
	Wed,  6 Dec 2023 16:03:25 +0000 (UTC)
From: Ricardo Rivera-Matos <rriveram@opensource.cirrus.com>
To: James Schulman <james.schulman@cirrus.com>,
        David Rhodes
	<david.rhodes@cirrus.com>,
        Lucas Tanure <tanureal@opensource.cirrus.com>,
        Richard Fitzgerald <rf@opensource.cirrus.com>,
        Liam Girdwood
	<lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela
	<perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
CC: Ricardo Rivera-Matos <rriveram@opensource.cirrus.com>,
        Charles Keepax
	<ckeepax@opensource.cirrus.com>,
        <alsa-devel@alsa-project.org>, <patches@opensource.cirrus.com>,
        <linux-kernel@vger.kernel.org>
Subject: [PATCH 3/3] ASoC: cs35l45: Prevents spinning during runtime suspend
Date: Wed, 6 Dec 2023 10:03:18 -0600
Message-ID: <20231206160318.1255034-4-rriveram@opensource.cirrus.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231206160318.1255034-1-rriveram@opensource.cirrus.com>
References: <20231206160318.1255034-1-rriveram@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: HLP5MC39A_dcsXx0UFwisv0hie67bmM_
X-Proofpoint-ORIG-GUID: HLP5MC39A_dcsXx0UFwisv0hie67bmM_
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: PHFULDLAM6FZRWKLAMO7NCHN7O4FYCTW
X-Message-ID-Hash: PHFULDLAM6FZRWKLAMO7NCHN7O4FYCTW
X-MailFrom: prvs=77048296a8=rriveram@opensource.cirrus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/PHFULDLAM6FZRWKLAMO7NCHN7O4FYCTW/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Masks the "DSP Virtual Mailbox 2 write" interrupt when before
issuing the hibernate command to the DSP. The interrupt is
unmasked when exiting runtime suspend as it is required for
DSP operation.

Without this change the DSP fires an interrupt when hibernating
causing the system spin between runtime suspend and runtime
resume.

Signed-off-by: Ricardo Rivera-Matos <rriveram@opensource.cirrus.com>
Acked-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 sound/soc/codecs/cs35l45.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/sound/soc/codecs/cs35l45.c b/sound/soc/codecs/cs35l45.c
index 28f76fccf277..44c221745c3b 100644
--- a/sound/soc/codecs/cs35l45.c
+++ b/sound/soc/codecs/cs35l45.c
@@ -947,6 +947,8 @@ static int cs35l45_enter_hibernate(struct cs35l45_private *cs35l45)
 
 	cs35l45_setup_hibernate(cs35l45);
 
+	regmap_set_bits(cs35l45->regmap, CS35L45_IRQ1_MASK_2, CS35L45_DSP_VIRT2_MBOX_MASK);
+
 	// Don't wait for ACK since bus activity would wake the device
 	regmap_write(cs35l45->regmap, CS35L45_DSP_VIRT1_MBOX_1, CSPL_MBOX_CMD_HIBERNATE);
 
@@ -967,6 +969,8 @@ static int cs35l45_exit_hibernate(struct cs35l45_private *cs35l45)
 					  CSPL_MBOX_CMD_OUT_OF_HIBERNATE);
 			if (!ret) {
 				dev_dbg(cs35l45->dev, "Wake success at cycle: %d\n", j);
+				regmap_clear_bits(cs35l45->regmap, CS35L45_IRQ1_MASK_2,
+						 CS35L45_DSP_VIRT2_MBOX_MASK);
 				return 0;
 			}
 			usleep_range(100, 200);
-- 
2.34.1

