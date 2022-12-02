Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 463DB640A7D
	for <lists+alsa-devel@lfdr.de>; Fri,  2 Dec 2022 17:20:08 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6F0AB1872;
	Fri,  2 Dec 2022 17:19:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6F0AB1872
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1669998007;
	bh=HUZrQfZ8zWBtxKbZ7tqB72s/BYGKYcuqFUcMZvFpy6I=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=gL6SomEsHpXRR95U7d6f1B3fSJpvDNJk23MzLUNOcdnnCHlKxTDibx3709WHUpigR
	 V5sM6lzwO4tL47bYGlQocWa5sgT8WkzvyfGea5wcMDX579nwAHzTRk4e/ePC15rK1c
	 0jPMbrM5/sUab6zTGgYi1p1JBQVTiGl6YyKP/ApA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CBCD1F8055B;
	Fri,  2 Dec 2022 17:18:27 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 60D31F8055B; Fri,  2 Dec 2022 17:18:26 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 PRX_BODY_32,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B2828F8026A
 for <alsa-devel@alsa-project.org>; Fri,  2 Dec 2022 17:18:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B2828F8026A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="mAE7Tqx7"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2B28j12k022681; Fri, 2 Dec 2022 10:18:14 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=PODMain02222019;
 bh=RIFCmyy6/4s76okPuZ7eQuTU58jGZcnvgrzMHZqxzxY=;
 b=mAE7Tqx7LOPHnchN2hJ3/2V2i231GtpO4kElveA8j+WCzOAc80n4NmkTlqEoSZD0gVnG
 be56TQwteIRDe1Z3RoOO+ZzPZ9x2RqzVIuAVjpiCy6wr01GfqAovyAUmSMbsWC2zqEul
 wzkWI1IetFJXQTCWNgNvRL6vc/JMi0nw3Gczy7Wvd6EmCQjXIia//LStczR2ubvptL++
 Ezf+OgYtsGM/M+pgpmUDYXtPRYx3RZXOMg9a0R03xnEBani+6dcboONc2WuZEV1nXJCR
 z80hHYo/z8EdTHeLpkl6+fd2cGSMF9Ehk3KqTALxsRYeQ3zDXH3cGoLjbajN5PJmjBHE aA== 
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
 by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3m6k2vt0n6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 02 Dec 2022 10:18:14 -0600
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.20; Fri, 2 Dec
 2022 10:18:12 -0600
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.2.1118.20 via
 Frontend Transport; Fri, 2 Dec 2022 10:18:12 -0600
Received: from edi-sw-dsktp-006.ad.cirrus.com (edi-sw-dsktp-006.ad.cirrus.com
 [198.90.251.111])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 71E17B10;
 Fri,  2 Dec 2022 16:18:12 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: <vkoul@kernel.org>, <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH v2 0/3] soundwire: cadence: Fix oversized FIFO size define
Date: Fri, 2 Dec 2022 16:18:09 +0000
Message-ID: <20221202161812.4186897-1-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: s3b6a1tc7ugk36PbSMbViYKf154AY-yy
X-Proofpoint-ORIG-GUID: s3b6a1tc7ugk36PbSMbViYKf154AY-yy
X-Proofpoint-Spam-Reason: safe
Cc: alsa-devel@alsa-project.org, patches@opensource.cirrus.com,
 linux-kernel@vger.kernel.org, Richard Fitzgerald <rf@opensource.cirrus.com>,
 sanyog.r.kale@intel.com, yung-chuan.liao@linux.intel.com
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

As determined by experimentation and asking a hardware person, the FIFO
in the Cadence IP is actually only 8 entries long, not 32. This is fixed
in patch #1.

As a bonus, patches #2 and #3 fix two other things I noticed while
debugging this.

Changes since v1:
- Rewrite commit message of patch #1
- Only reduce response_buf to 34 (32 + 2)
- Trim RX_FIFO_AVAIL to length of response_buf instead of expected
  FIFO size

Richard Fitzgerald (3):
  soundwire: cadence: Don't overflow the command FIFOs
  soundwire: cadence: Remove wasted space in response_buf
  soundwire: cadence: Drain the RX FIFO after an IO timeout

 drivers/soundwire/cadence_master.c | 46 +++++++++++++++++++-----------
 drivers/soundwire/cadence_master.h | 13 ++++++++-
 2 files changed, 41 insertions(+), 18 deletions(-)

-- 
2.30.2

