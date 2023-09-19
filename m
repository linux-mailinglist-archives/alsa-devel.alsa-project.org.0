Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C5567A5FA7
	for <lists+alsa-devel@lfdr.de>; Tue, 19 Sep 2023 12:33:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E0E3BE87;
	Tue, 19 Sep 2023 12:32:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E0E3BE87
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1695119610;
	bh=StBHIzcE1F7elEhaUhCawc0k/90MkJvFumgX7RYuvVI=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=XJEQ9AMRPslfdl5hj+VrFTnncIcAM7s5bNdDF24GU9sUEPK/+T2m92QM+3YyzVI6m
	 CQ23z4qc/mC8yNa7wyCczTvEQMDXFYfG3MRB5gd3a9uQe/I+vt2BzUKmaTjOgyQ9Rc
	 2Jy1jvBHMUXR1vubl3Zi2As0PK49hZrc7T1TI99Q=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 12444F805A0; Tue, 19 Sep 2023 12:31:36 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8678EF805A1;
	Tue, 19 Sep 2023 12:31:35 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 95F5BF8057A; Tue, 19 Sep 2023 12:31:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D05FBF80549
	for <alsa-devel@alsa-project.org>; Tue, 19 Sep 2023 12:31:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D05FBF80549
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=XfjOqRrC
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 38J4RRCZ031661;
	Tue, 19 Sep 2023 05:31:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PODMain02222019; bh=a
	VqstsaBSD2K7gIVkXXt0j+hccLECROHmsTT3NOhKeI=; b=XfjOqRrC5hsESJzQI
	RX0WZBsOue44L8ArhsOvc+Tmi3/nLFuJFFbmqMCKwJgyVWLwTn7QSz5fvDR/c9yV
	HTyaL4Dq/X3GHa2ta4ft2WXnY/2kK4Y1ykpK69XwgAEgd0JEje2SZM41OJa+nHuv
	TX+7oiCy3pJa5cfGxyv6mmjXPUrVgXk349BwdhD31Vlz8PY9uk16omx9uNVBq4Ae
	roLeorHG/4LIJAJVlaef+GFH5s3DKZB3IZywCK+AYqCvVvUGKgGHFkwEVxP2eRpu
	JOZG4gxixugGbe8tNoy7PvtHN7xCopJy84QaZ/s3y58U9RDP36hs0pcuAyvaWt91
	LwsYA==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3t59ry3p1h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 19 Sep 2023 05:31:18 -0500 (CDT)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.37; Tue, 19 Sep
 2023 11:31:16 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.2.1118.37 via Frontend
 Transport; Tue, 19 Sep 2023 11:31:16 +0100
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 4B50D11AA;
	Tue, 19 Sep 2023 10:31:16 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: <broonie@kernel.org>
CC: <lgirdwood@gmail.com>, <robh+dt@kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>, <alsa-devel@alsa-project.org>,
        <devicetree@vger.kernel.org>, <patches@opensource.cirrus.com>
Subject: [PATCH 0/5] Minor default jack pop performance updates
Date: Tue, 19 Sep 2023 11:31:11 +0100
Message-ID: <20230919103116.580305-1-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: N3nK7fLmcEH4KA41Fb4LgyXwu73fLjEV
X-Proofpoint-ORIG-GUID: N3nK7fLmcEH4KA41Fb4LgyXwu73fLjEV
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: SG3XMRNRPI4M6I5ILWPLDLR2ZNKZIEAN
X-Message-ID-Hash: SG3XMRNRPI4M6I5ILWPLDLR2ZNKZIEAN
X-MailFrom: prvs=4626caf035=ckeepax@opensource.cirrus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/SG3XMRNRPI4M6I5ILWPLDLR2ZNKZIEAN/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Some small updates to the driver defaults to ensure a good pop
performance on jack insert and removal.

Thanks,
Charles

Charles Keepax (5):
  dt-bindings: ASoC: cirrus,cs42l43: Update a couple of default values
  ASoC: cs42l43: Lower default type detect time
  ASoC: cs42l43: Enable bias sense by default
  ASoC: cs42l43: Move headset bias sense enable earlier in process
  ASoC: cs42l43: Extend timeout on bias sense timeout

 .../bindings/sound/cirrus,cs42l43.yaml        |  4 +-
 sound/soc/codecs/cs42l43-jack.c               | 38 +++++++++----------
 2 files changed, 21 insertions(+), 21 deletions(-)

-- 
2.39.2

