Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D6FEB75CB70
	for <lists+alsa-devel@lfdr.de>; Fri, 21 Jul 2023 17:20:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 50F6783B;
	Fri, 21 Jul 2023 17:19:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 50F6783B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689952826;
	bh=/5RwreGCV7UvWcje7bw8rgW4nAC+l8JSJVhA7+LVSAw=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=PSO7g60lUNQ+bMmYPKSjnlpozz40YDerjHp256vBxZ3LwvRK1ZlfIwc/a/CjProU4
	 UN26hD1gXwRyLgXvLZC1e3F7vIRJ3mWSKCXnfVVsie6+my3WE6xmrIBbL24zeRqASM
	 dD1UPaZorSalDWf5aMpMLEqKHVUepudSYmpxWQpU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 03807F8057B; Fri, 21 Jul 2023 17:18:49 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1AF55F80567;
	Fri, 21 Jul 2023 17:18:49 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0324FF80548; Fri, 21 Jul 2023 17:18:42 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id A1F3BF80494
	for <alsa-devel@alsa-project.org>; Fri, 21 Jul 2023 17:18:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A1F3BF80494
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=fWnzOQS7
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 36LDppwj011284;
	Fri, 21 Jul 2023 10:18:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	PODMain02222019; bh=EiuPuPFrlkojOXOF0eP6Mp1vYF/Par8Q01lLhTZsruo=; b=
	fWnzOQS76zdRLqDVzKeeqebvdTriSsrX63tBzTtcdbKOtiKpHtnOOeX2dNwjnkNa
	KBhD6cUUkMjJu150MO8JkTI5JjG2ukakwAbRzUz3m0xaLtS/teqrdijtG40Bh1sh
	eQKFvERS70s/LjGd2wnsn9+MyI9WlFlMlfZBqiK1MbPXX1TTQSWXT+cBiXTx+ieE
	lKg9492yoYFBKZkKkGdTRTiUx+G01dVfQ97eDBefBeqHxZS5/WpMnsi3sJ7/LFSE
	eeZU9zFTXKJm3UL8upXQLAFK/zSWm558omvgG3o4MTBIBVAXfaQHY3boGWCn91ZT
	tvot5fORHz6cNLlTLA9mgg==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3rus62y8g5-4
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 21 Jul 2023 10:18:30 -0500 (CDT)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.30; Fri, 21 Jul
 2023 16:18:26 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.2.1118.30 via Frontend
 Transport; Fri, 21 Jul 2023 16:18:26 +0100
Received: from sbinding-cirrus-dsktp2.ad.cirrus.com (unknown [198.90.238.219])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 2023315B6;
	Fri, 21 Jul 2023 15:18:26 +0000 (UTC)
From: Stefan Binding <sbinding@opensource.cirrus.com>
To: Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi
 Iwai <tiwai@suse.com>
CC: <alsa-devel@alsa-project.org>, <linux-kernel@vger.kernel.org>,
        <patches@opensource.cirrus.com>,
        Stefan Binding
	<sbinding@opensource.cirrus.com>
Subject: [PATCH v2 03/11] ALSA: hda: cs35l41: Check mailbox status of pause
 command after firmware load
Date: Fri, 21 Jul 2023 16:18:08 +0100
Message-ID: <20230721151816.2080453-4-sbinding@opensource.cirrus.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230721151816.2080453-1-sbinding@opensource.cirrus.com>
References: <20230721151816.2080453-1-sbinding@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: fYwUMO83TH-O7nPgvuzXqLhLToPbJpoU
X-Proofpoint-ORIG-GUID: fYwUMO83TH-O7nPgvuzXqLhLToPbJpoU
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: DFBZJ25KJ3C5PXY6NKAPZJMVV2NLDF4G
X-Message-ID-Hash: DFBZJ25KJ3C5PXY6NKAPZJMVV2NLDF4G
X-MailFrom: prvs=2566513517=sbinding@opensource.cirrus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/DFBZJ25KJ3C5PXY6NKAPZJMVV2NLDF4G/>
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

