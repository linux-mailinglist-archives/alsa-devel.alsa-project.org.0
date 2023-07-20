Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DF1D675B00E
	for <lists+alsa-devel@lfdr.de>; Thu, 20 Jul 2023 15:34:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5ADC1204;
	Thu, 20 Jul 2023 15:33:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5ADC1204
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689860046;
	bh=/5RwreGCV7UvWcje7bw8rgW4nAC+l8JSJVhA7+LVSAw=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=mC+L2eJImau80i+MUfDGHNN6rNxBdfqmhh8FHH8e1fZf707kOEkskoUUZeBu4XhQJ
	 e5+IlSFdy27bxADYHyxDPlF5SDe/bjOz324tdNW9sXJXMuyhN/UlD8faj79bh1/3CP
	 bTxtaOHaxKaeTLeFfi1ump5F87jFQLHHjh6K+s08=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DAB74F80564; Thu, 20 Jul 2023 15:32:24 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 45A6BF80557;
	Thu, 20 Jul 2023 15:32:24 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EBBD4F80551; Thu, 20 Jul 2023 15:32:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5E4F8F800D2
	for <alsa-devel@alsa-project.org>; Thu, 20 Jul 2023 15:32:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5E4F8F800D2
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=jFv+73Du
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 36K6Acqa016432;
	Thu, 20 Jul 2023 08:32:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	PODMain02222019; bh=EiuPuPFrlkojOXOF0eP6Mp1vYF/Par8Q01lLhTZsruo=; b=
	jFv+73DuwtZBQSZSDZYa0unhg90pwDv1b/EM87f2b6FLqpHBDJITSM4NP95L+GcH
	VYDdpYAT4lmN/mTsWg2I/rOuM7vXIHjxnFspI2I3UkYv2GqWIKB+e3GLCYrRmPHK
	px2U3JNwyDYRQzopidC48fH0C4m3qq/7INeOp+0XlUYyQpedFz+iqjzUKM9AuVz9
	ZWtokQ2SraWvwZcYILc04WgiHJMX1jFul0GI+UTW04k9JAfsN1FUFFiR0UtrSTlx
	TOmY4bRoYghKRT+sUb4V+jwyEUeHJ6fbn22qG1sE6UPvdqi5nHv5FK7idodbUk6F
	W5/4r0HHtUVdRxioMgy/uA==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3rus6gx5mr-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 20 Jul 2023 08:32:11 -0500 (CDT)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.30; Thu, 20 Jul
 2023 14:32:09 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.2.1118.30 via Frontend
 Transport; Thu, 20 Jul 2023 14:32:09 +0100
Received: from sbinding-cirrus-dsktp2.ad.cirrus.com (unknown [198.90.238.219])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 362D5475;
	Thu, 20 Jul 2023 13:32:09 +0000 (UTC)
From: Stefan Binding <sbinding@opensource.cirrus.com>
To: Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi
 Iwai <tiwai@suse.com>
CC: <alsa-devel@alsa-project.org>, <linux-kernel@vger.kernel.org>,
        <patches@opensource.cirrus.com>,
        Stefan Binding
	<sbinding@opensource.cirrus.com>
Subject: [PATCH v1 02/11] ALSA: hda: cs35l41: Check mailbox status of pause
 command after firmware load
Date: Thu, 20 Jul 2023 14:31:38 +0100
Message-ID: <20230720133147.1294337-3-sbinding@opensource.cirrus.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230720133147.1294337-1-sbinding@opensource.cirrus.com>
References: <20230720133147.1294337-1-sbinding@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: GbT4YsEvKqUvwlIltQE3K904X8yV2OEB
X-Proofpoint-GUID: GbT4YsEvKqUvwlIltQE3K904X8yV2OEB
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: QZIZJJX375LBZP74F3CWGZZEPCGSFFDI
X-Message-ID-Hash: QZIZJJX375LBZP74F3CWGZZEPCGSFFDI
X-MailFrom: prvs=25651755c6=sbinding@opensource.cirrus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QZIZJJX375LBZP74F3CWGZZEPCGSFFDI/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Currently, we do not check the return status of the pause command,
immediately after we load firmware. If the pause has failed,
the firmware is not running.

Signed-off-by: Stefan Binding <sbinding@opensource.cirrus.com>
---
 sound/pci/hda/cs35l41_hda.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/sound/pci/hda/cs35l41_hda.c b/sound/pci/hda/cs35l41_hda.c
index f9c97270db6f6..29f1dce45f1dc 100644
--- a/sound/pci/hda/cs35l41_hda.c
+++ b/sound/pci/hda/cs35l41_hda.c
@@ -781,7 +781,12 @@ static int cs35l41_smart_amp(struct cs35l41_hda *cs35l41)
 		goto clean_dsp;
 	}
 
-	cs35l41_set_cspl_mbox_cmd(cs35l41->dev, cs35l41->regmap, CSPL_MBOX_CMD_PAUSE);
+	ret = cs35l41_set_cspl_mbox_cmd(cs35l41->dev, cs35l41->regmap, CSPL_MBOX_CMD_PAUSE);
+	if (ret) {
+		dev_err(cs35l41->dev, "Error waiting for DSP to pause: %u\n", ret);
+		goto clean_dsp;
+	}
+
 	cs35l41->firmware_running = true;
 
 	return 0;
-- 
2.34.1

