Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BECD591DCF2
	for <lists+alsa-devel@lfdr.de>; Mon,  1 Jul 2024 12:45:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D5CB122A9;
	Mon,  1 Jul 2024 12:45:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D5CB122A9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1719830735;
	bh=UpSxcVPntx3n4vMZc8ID9H1olcCZrFJBh6e8CLNr8Mw=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=d3e77Zk1CccEZMsKSzI0Q2nj0IJ6JB9yXCqq4dSRitPmzyu4Ki8+dNo62u3sSvOVs
	 /WU8Up1oHTpsoHgSHZ9IJ+/9zB0Qn6/2gQMpc6K2y1cUnLREUVyXeSNr4IGnW6QedH
	 NsS7Ug89zZnrnx4Rdc/WN6sej+2O3R7FIrJ/lXls=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2FA27F805A9; Mon,  1 Jul 2024 12:45:03 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 28A21F805B1;
	Mon,  1 Jul 2024 12:45:03 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4C5F8F804D6; Mon,  1 Jul 2024 12:44:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A6034F800E4
	for <alsa-devel@alsa-project.org>; Mon,  1 Jul 2024 12:44:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A6034F800E4
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=S6BoX666
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id
 4614mX4v015862;
	Mon, 1 Jul 2024 05:44:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=/wiHC4oaRURJNsaa
	FyjCYv+VT+J39EVgcOXEImnRR80=; b=S6BoX666plhomGfCM+GfiN0XGolBVTF9
	agH0/Pi2/NzUs45k//iiXPLfQNTitja7I6tVVOQ7XhzbKPsngWfm6EkpILH97Shs
	XhG8DTGxsbViO6XNNu/dV3kYSbU9JLQYPcqG7geJekxmQHIXzM+yNsjNK+931Ux1
	L6aWKRm6lVzlFl//W5hkEsloFIBmUr6462s7jh4Qv+IJ2dqm60xS5HKLnW14/NuX
	rUpS8QZAKODDJcv7xmGBw6/8ombqDlzbG2v5bu19ufFYW9p1CTsshZNdFrmIATjK
	y9OU8dZ3Lo72/1SMw5wsGlNkqLLN18JVaQdBApk6C3REh96WgfliMw==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 402epjabpk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 01 Jul 2024 05:44:46 -0500 (CDT)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 1 Jul 2024
 11:44:44 +0100
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1544.9 via Frontend Transport; Mon, 1 Jul 2024 11:44:44 +0100
Received: from ediswws06.ad.cirrus.com (ediswws06.ad.cirrus.com
 [198.90.208.18])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id 92958820244;
	Mon,  1 Jul 2024 10:44:44 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: <broonie@kernel.org>
CC: <linux-kernel@vger.kernel.org>, <patches@opensource.cirrus.com>,
        <alsa-devel@alsa-project.org>, <linux-sound@vger.kernel.org>
Subject: [PATCH 0/3] ASoC: cs35l56: Remove obsolete and redundant code
Date: Mon, 1 Jul 2024 11:44:41 +0100
Message-ID: <20240701104444.172556-1-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: bOUPjYsMgHFBb0XazBy7dUpeROiiir_0
X-Proofpoint-ORIG-GUID: bOUPjYsMgHFBb0XazBy7dUpeROiiir_0
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: U62AXWDTZSDUNXQB5EJS7JL7RYQOADMA
X-Message-ID-Hash: U62AXWDTZSDUNXQB5EJS7JL7RYQOADMA
X-MailFrom: prvs=4912873e61=rf@opensource.cirrus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/U62AXWDTZSDUNXQB5EJS7JL7RYQOADMA/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

These commits remove various code that is either no longer needed,
or is redundant.

Richard Fitzgerald (3):
  ASoC: cs35l56: Revert support for dual-ownership of ASP registers
  ASoC: cs35l56: Remove support for A1 silicon
  ASoC: cs35l56: Remove redundant clearing of clk_stop_mode1

 include/sound/cs35l56.h           |  11 +-
 sound/soc/codecs/cs35l56-sdw.c    |  75 -----------
 sound/soc/codecs/cs35l56-shared.c | 122 ++++--------------
 sound/soc/codecs/cs35l56.c        | 205 ++----------------------------
 sound/soc/codecs/cs35l56.h        |   2 -
 5 files changed, 45 insertions(+), 370 deletions(-)

-- 
2.39.2

