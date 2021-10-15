Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C54742F3BB
	for <lists+alsa-devel@lfdr.de>; Fri, 15 Oct 2021 15:37:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5DA6916DA;
	Fri, 15 Oct 2021 15:36:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5DA6916DA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1634305066;
	bh=SvghflUrOGhV85t6sc7QXv5ynB0FwvegMeGrBZQjXnA=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Kuiwq5XYYQRSHDLqOSv9ZubhULs8QOreCfKCocv0NKQyIssPefyx2VG9D4H7aGj2L
	 WUbawQZe7zBuRrj3MBOyO/8DeP5+GtA1QwNkPq21n6Kk7cvfmgeRCU21Ah2sXSXXtE
	 A2/UfI/yqgO4eviyTcnaWqrE8/Ff2YTUBpYODRfE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DA5B1F804FE;
	Fri, 15 Oct 2021 15:36:39 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2181CF804F3; Fri, 15 Oct 2021 15:36:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B7D0DF8025B
 for <alsa-devel@alsa-project.org>; Fri, 15 Oct 2021 15:36:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B7D0DF8025B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="nPRVqwpZ"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19FCfErK009690; 
 Fri, 15 Oct 2021 08:36:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=nLm+bJjmjHyyceHmW8/DqzOKJ8iLerQs094PpXda3bg=;
 b=nPRVqwpZQJBtjDE10i3T0sPwnuJDJ6UqmFVilV1F4LD6Nl8tuvXRPDDImn7qbGoXExW8
 ygvayOdAWG32Wo6Ys4MA6XVjLn18k+zu93LK9uYiZQsnenp4g7TiZAO40IT01XMcsGG+
 gAqrnYCQkymxSlaiyQ2IBlaqtTbMBaNr87z2lOqgSeuP3bT2HmrbFVICgD+IhB1O/67o
 721SMCwSBTJL3/49DLDbqhuu1wrCtwte2uqILOoTv6X+WTuXoT7d4q/hk4HWMCnGNFYl
 OmgwYmvgMAnMxxD1RRj93AcO91f4LZH849l+neXdPuUsk1HXlU0AT1AtXabQIP5ev/O+ Mw== 
Received: from ediex02.ad.cirrus.com ([87.246.76.36])
 by mx0a-001ae601.pphosted.com with ESMTP id 3bq1gagp5w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Fri, 15 Oct 2021 08:36:24 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.7; Fri, 15 Oct
 2021 14:36:22 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.7 via Frontend
 Transport; Fri, 15 Oct 2021 14:36:22 +0100
Received: from AUSNPC0LSNW1-debian.cirrus.com (AUSNPC0LSNW1.ad.cirrus.com
 [198.61.65.254])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 0824A46D;
 Fri, 15 Oct 2021 13:36:21 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: <broonie@kernel.org>
Subject: [PATCH 01/16] ASoC: cs42l42: Don't reconfigure the PLL while it is
 running
Date: Fri, 15 Oct 2021 14:36:04 +0100
Message-ID: <20211015133619.4698-2-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211015133619.4698-1-rf@opensource.cirrus.com>
References: <20211015133619.4698-1-rf@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: 4HC68SSBzAH5w3Nn5-MKMtX_1jVOj9qL
X-Proofpoint-GUID: 4HC68SSBzAH5w3Nn5-MKMtX_1jVOj9qL
X-Proofpoint-Spam-Reason: safe
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 Richard Fitzgerald <rf@opensource.cirrus.com>, linux-kernel@vger.kernel.org
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

When capture and playback substreams are both running at the same time,
cs42l42_pcm_hw_params() would be called for each direction. The first
call will configure the PLL. The second call must not write the PLL
configuration registers again if the first substream is already running,
as this could destabilize the PLL.

The DAI is marked symmetric sample bits and sample rate, so the two
directions will always have the same SCLK (I2S always has 2 channel slots
so the DAI does not need to require symmetric channels to guarantee the
same SCLK). However, since cs42l42_pll_config() is checking for an active
stream it may as well test that the requested SCLK is the same as the
currently active configuration.

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---
 sound/soc/codecs/cs42l42.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/sound/soc/codecs/cs42l42.c b/sound/soc/codecs/cs42l42.c
index 8de23e4732b3..26f6a3510a03 100644
--- a/sound/soc/codecs/cs42l42.c
+++ b/sound/soc/codecs/cs42l42.c
@@ -618,6 +618,14 @@ static int cs42l42_pll_config(struct snd_soc_component *component)
 	else
 		clk = cs42l42->sclk;
 
+	/* Don't reconfigure if there is an audio stream running */
+	if (cs42l42->stream_use) {
+		if (pll_ratio_table[cs42l42->pll_config].sclk == clk)
+			return 0;
+		else
+			return -EBUSY;
+	}
+
 	for (i = 0; i < ARRAY_SIZE(pll_ratio_table); i++) {
 		if (pll_ratio_table[i].sclk == clk) {
 			cs42l42->pll_config = i;
-- 
2.11.0

