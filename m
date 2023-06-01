Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 96FE2719C8C
	for <lists+alsa-devel@lfdr.de>; Thu,  1 Jun 2023 14:50:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AD4474E;
	Thu,  1 Jun 2023 14:49:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AD4474E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1685623814;
	bh=Xh1lxC0+hRLhc1RZRzbRLXKxbwl3StTGuIwymclgVzY=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=Q3bafoNZj5X49iq863Pbsfcxp9YhpNtHkz0LQSAEYVVw9N4Yg0CfiBuxA5po4yEx3
	 L3WRGsdfaiV4SXTQSY3KcElu2CLNqloe4RiAIr9/FazxxELKwt80o5qol71/W7QVOq
	 0o2KL8oPcZw0vZgjJMbrvVb1lSLxZHgTciKOdo/0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E8547F800ED; Thu,  1 Jun 2023 14:49:23 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 86F01F80132;
	Thu,  1 Jun 2023 14:49:23 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D6393F80149; Thu,  1 Jun 2023 14:49:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 73AD8F800C1
	for <alsa-devel@alsa-project.org>; Thu,  1 Jun 2023 14:49:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 73AD8F800C1
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=BOE56TmR
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3517gbC6006318;
	Thu, 1 Jun 2023 07:49:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=PODMain02222019;
 bh=Hx1i5w0nyq9m1kcDij6XJIcwI5RdLT1oMRmwl9V+aAY=;
 b=BOE56TmRBFMI+h6wValPkdM4oEacJCxKpdOREBByZ+4f1ztrUCDpQnWsFtTMUQ50+I4p
 6T1K/km7UApK4Zud9SV8j/Hvz7tzhcfaEbV8ftyYfTsxBVGptNXdUgoKAQV6R3s6UdSj
 k29Zd+I/mcVv1OrWU9YWgQjivsJstnrF+l0XIXqbNKvupP2NtabZLPOhWR/rjWQBB0J+
 f2XLUE2gj4K8l4aYC0ZiwKC6+H29btrTpE6B/iqJGMtL+sY4YibXFcbd+qVn97brCx1A
 JDbc9JoDQnx6wlDrHSnlwdY8Vd5saRc/8CQwXaFCO+KH3toALLZakadyaze2nam4Ghvl yw==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3que9mx9sd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 01 Jun 2023 07:49:09 -0500
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.26; Thu, 1 Jun
 2023 13:49:08 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Thu, 1 Jun 2023 13:49:08 +0100
Received: from edi-sw-dsktp-006.ad.cirrus.com (edi-sw-dsktp-006.ad.cirrus.com
 [198.90.251.127])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id EE916468;
	Thu,  1 Jun 2023 12:49:07 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: <broonie@kernel.org>
CC: <alsa-devel@alsa-project.org>, <linux-kernel@vger.kernel.org>,
        <patches@opensource.cirrus.com>,
        Richard Fitzgerald
	<rf@opensource.cirrus.com>
Subject: [PATCH] ASoC: cs35l56: Remove NULL check from
 cs35l56_sdw_dai_set_stream()
Date: Thu, 1 Jun 2023 13:49:07 +0100
Message-ID: <20230601124907.3128170-1-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: NABGbYFSE8FDOgVXM9iuPK9CV-Gr3zMT
X-Proofpoint-ORIG-GUID: NABGbYFSE8FDOgVXM9iuPK9CV-Gr3zMT
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: 7DYEV4K44S5EJ33NLUV46CRVMDAY4EOQ
X-Message-ID-Hash: 7DYEV4K44S5EJ33NLUV46CRVMDAY4EOQ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7DYEV4K44S5EJ33NLUV46CRVMDAY4EOQ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The dma pointer must be set to the passed stream pointer, even
if that pointer is NULL.

Fixes: e49611252900 ("ASoC: cs35l56: Add driver for Cirrus Logic CS35L56")
Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---
 sound/soc/codecs/cs35l56.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/sound/soc/codecs/cs35l56.c b/sound/soc/codecs/cs35l56.c
index 3c07bd1e959e..c03f9d3c9a13 100644
--- a/sound/soc/codecs/cs35l56.c
+++ b/sound/soc/codecs/cs35l56.c
@@ -704,9 +704,6 @@ static int cs35l56_sdw_dai_hw_free(struct snd_pcm_substream *substream,
 static int cs35l56_sdw_dai_set_stream(struct snd_soc_dai *dai,
 				      void *sdw_stream, int direction)
 {
-	if (!sdw_stream)
-		return 0;
-
 	snd_soc_dai_dma_data_set(dai, direction, sdw_stream);
 
 	return 0;
-- 
2.30.2

