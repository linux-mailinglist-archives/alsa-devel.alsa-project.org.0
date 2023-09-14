Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3960E7A08AF
	for <lists+alsa-devel@lfdr.de>; Thu, 14 Sep 2023 17:10:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 46EE0AEA;
	Thu, 14 Sep 2023 17:09:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 46EE0AEA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694704221;
	bh=Ozfv33hSd7HVs61TgWQt4gE63LEJ1zPotNoc+j6y4ds=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=uCTgd4Y/Px7Sw05GJPuVK2CMCTSDfzCCAY0Ndb8j2XeU4Rry9OBbm2tnna9FYpXX/
	 FlkitpkIutexVDSSmT9+L/UBVzxIH+04d6nD4OZrJ4GgkcrspDyvG61LUEYpZZ+jx4
	 xIM/LWjaD4TSilPzp0d4tbsOOIGTbo5jIV+2T0oc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0121FF80549; Thu, 14 Sep 2023 17:09:30 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 95008F80212;
	Thu, 14 Sep 2023 17:09:30 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 74379F80431; Thu, 14 Sep 2023 17:09:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B460AF80141
	for <alsa-devel@alsa-project.org>; Thu, 14 Sep 2023 17:09:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B460AF80141
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=DmRsOdku
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 38ECunMH020490;
	Thu, 14 Sep 2023 10:09:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PODMain02222019; bh=S
	2UpFO3lB2wyOwT/WGOW/cnqkjwF0wKC7PyTNKd0P38=; b=DmRsOdkuy3W3BezcB
	5Rh02PdcQCe+j1op82uw3Ej2v5dXcxSuhcYsY95W1ecqC8pYiqz+r7FmogLOvOru
	cXNHPWDWdGZnKkkK3U+xEOvlIKBhnDk8TtjREjL5NeTiheMnrcA66Y69k87GxSOc
	jBfg2/DeEhXIXS3Hd9okML6gnJaWDEGKCYZFSL1SJyqfho80QCwDopeRZ79V9rop
	IGUgQi1yLdjTXKeFRAcMLvjFm1utUcd1kydoruPJDIud4haJzte95bWch/02Wql7
	xmzUnJUsmDGz8pb3lx2qe/kxXlJboltnLBO5JOwasFLw97mCxuJv+T/r3KqN/6PG
	JOysw==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3t2y7sj90x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 14 Sep 2023 10:09:21 -0500 (CDT)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.37; Thu, 14 Sep
 2023 16:09:20 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1118.37 via Frontend Transport; Thu, 14 Sep 2023 16:09:20 +0100
Received: from EDIN4L06LR3.ad.cirrus.com (EDIN4L06LR3.ad.cirrus.com
 [198.61.65.215])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id F1E913563;
	Thu, 14 Sep 2023 15:09:19 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: <broonie@kernel.org>
CC: <alsa-devel@alsa-project.org>, <patches@opensource.cirrus.com>,
        <linux-kernel@vger.kernel.org>,
        Richard Fitzgerald <rf@opensource.cirrus.com>
Subject: [PATCH 0/3] ASoC: cs35l56: Define and export I2C/SPI pm_ops only if
 needed
Date: Thu, 14 Sep 2023 16:09:15 +0100
Message-ID: <20230914150918.14505-1-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: _QPw9Fkw16YQYjvTJXiCeOUVT2RyzeqM
X-Proofpoint-ORIG-GUID: _QPw9Fkw16YQYjvTJXiCeOUVT2RyzeqM
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: 5XIYIFHZHCNEADH7BO5AJHYJJAWOOVPS
X-Message-ID-Hash: 5XIYIFHZHCNEADH7BO5AJHYJJAWOOVPS
X-MailFrom: prvs=46218c6399=rf@opensource.cirrus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/5XIYIFHZHCNEADH7BO5AJHYJJAWOOVPS/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

These 3 patches update the pm_ops for I2C/SPI so that they are only built
and exported if they are needed.

Richard Fitzgerald (3):
  ASoC: cs35l56: Use pm_ptr()
  ASoC: cs35l56: Use new export macro for dev_pm_ops
  ASoC: cs35l56: Omit cs35l56_pm_ops_i2c_spi if I2C/SPI not enabled

 sound/soc/codecs/cs35l56-i2c.c | 2 +-
 sound/soc/codecs/cs35l56-sdw.c | 2 +-
 sound/soc/codecs/cs35l56-spi.c | 2 +-
 sound/soc/codecs/cs35l56.c     | 5 +++--
 4 files changed, 6 insertions(+), 5 deletions(-)

-- 
2.30.2

