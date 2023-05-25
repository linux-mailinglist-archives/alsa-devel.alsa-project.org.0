Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 66BEA710F2E
	for <lists+alsa-devel@lfdr.de>; Thu, 25 May 2023 17:10:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BB0A383E;
	Thu, 25 May 2023 17:09:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BB0A383E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1685027427;
	bh=dwmrLOcHTarwGa8TdIHKJY+KrzzP/L1YpM7ojlSVAj8=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=IMsbSKVJhp9pfLTyNLLuFfNOkx32l8oOqR8HcKBXxnrkiMqucX5Y/WtvUSBpl9Rq0
	 4/Z6gK5f0mjb02txP1bNjlX/LnKJHWF4TBI0PKINbQ46kLf0xryYKdkezG1sSfej1z
	 syo5G+vPd5xGot1eJeCNsO3Dt0mFQMrVbogo50D0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7E9A4F805CA; Thu, 25 May 2023 17:07:56 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D6DAFF805CB;
	Thu, 25 May 2023 17:07:55 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 02558F805A0; Thu, 25 May 2023 17:07:41 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 89B2FF8026A
	for <alsa-devel@alsa-project.org>; Thu, 25 May 2023 17:07:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 89B2FF8026A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=epxDMbK1
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 34PEE1BJ025344;
	Thu, 25 May 2023 10:07:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=uKYzq/D3zt7bRv8BxAmrdUM7w25ZiebnATzlkyzSXQI=;
 b=epxDMbK16aFoxr2pHRoDeq2N796Dm7yYuUpj1C6WzPDg1JgZZPd0pyhMsxDThif75/SN
 JtrDq0gsgmMnwig4BDc6wioDTvvteo4oYhgSGuQ/oO8IOGMnTTP06mVzIP29ogTVj5oa
 7TCbhbdxfw/jroMb5nAAwAfAd8aKFZ+nZihUrNva4jO7J4Za/GG/0WOtD6B62FE2aoLy
 LjHSO80vbzTeg4ITU7w4RUISazuiX08zvjndZ6Nu0Ot/Sbcxnc8okbHFKIQevBo53jj1
 SqU2GkbHdxjcGNyK6wLzUuCxJQazv/mZUXsmASDgVjTg3no/x6GLEy6t3PX+SstYE94T RA==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3qptmm70m7-5
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 25 May 2023 10:07:07 -0500
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.26; Thu, 25 May
 2023 10:07:04 -0500
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.2.1118.26 via Frontend
 Transport; Thu, 25 May 2023 10:07:04 -0500
Received: from EDIN4L06LR3.ad.cirrus.com (EDIN4L06LR3.ad.cirrus.com
 [198.61.65.166])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 5104111D4;
	Thu, 25 May 2023 15:07:04 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: <tiwai@suse.com>, <broonie@kernel.org>, <perex@perex.cz>
CC: <alsa-devel@alsa-project.org>, <linux-kernel@vger.kernel.org>,
        <patches@opensource.cirrus.com>,
        Richard Fitzgerald
	<rf@opensource.cirrus.com>
Subject: [PATCH 08/13] ASoC: cs35l56: Pass correct pointer to cs35l56_irq()
Date: Thu, 25 May 2023 16:06:54 +0100
Message-ID: <20230525150659.25409-9-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230525150659.25409-1-rf@opensource.cirrus.com>
References: <20230525150659.25409-1-rf@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: 5gdkB_Q5s2h0VWW4y0BMmtD463Dq6uyk
X-Proofpoint-GUID: 5gdkB_Q5s2h0VWW4y0BMmtD463Dq6uyk
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: N2SQYIED73Y44XJKBETZQ6YNZSRVBHI6
X-Message-ID-Hash: N2SQYIED73Y44XJKBETZQ6YNZSRVBHI6
X-MailFrom: prvs=050971c6a2=rf@opensource.cirrus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/N2SQYIED73Y44XJKBETZQ6YNZSRVBHI6/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

cs35l56_irq() was changed to take a cs35l56_base* but the code
in cs35l56-sdw was still passing it a cs35l56_private*.

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---
 sound/soc/codecs/cs35l56-sdw.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/cs35l56-sdw.c b/sound/soc/codecs/cs35l56-sdw.c
index 09d255cc7652..b433266b7844 100644
--- a/sound/soc/codecs/cs35l56-sdw.c
+++ b/sound/soc/codecs/cs35l56-sdw.c
@@ -230,7 +230,7 @@ static void cs35l56_sdw_irq_work(struct work_struct *work)
 						       struct cs35l56_private,
 						       sdw_irq_work);
 
-	cs35l56_irq(-1, cs35l56);
+	cs35l56_irq(-1, &cs35l56->base);
 
 	/* unmask interrupts */
 	if (!cs35l56->sdw_irq_no_unmask)
-- 
2.30.2

