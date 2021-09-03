Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 255F3400770
	for <lists+alsa-devel@lfdr.de>; Fri,  3 Sep 2021 23:30:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9F3CA18F2;
	Fri,  3 Sep 2021 23:29:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9F3CA18F2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1630704619;
	bh=80CWatMJnDl4j8YByeyBLu+d8LT1e69+cBK3rtkg+KY=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=e25H5yV2i/v/bpSU9zslkcf5zMrJuSZGp/MaVsLB4zbwQG3f/ePzacwRb7CxE3Gwj
	 Cgo/LGQfkb9bmphXbqAnzaF0JOX6wjUkbCyAfy04bNDhRZOAElHeHbq7mq2mWv7Btn
	 Kue7wyBlkeRonPivtbasGu6E0cItmTwOfYgehw1A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2CD21F80227;
	Fri,  3 Sep 2021 23:29:03 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3844FF800B5; Fri,  3 Sep 2021 23:28:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 415FDF800B5
 for <alsa-devel@alsa-project.org>; Fri,  3 Sep 2021 23:28:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 415FDF800B5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="giW83shY"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 183CeU7G021630; 
 Fri, 3 Sep 2021 16:28:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=PODMain02222019;
 bh=7GR8vWfF8Vj23srb/s0wK4/nAvxtIHwD9KLeLONvQr8=;
 b=giW83shY9E5ouo8O68O+UvphttX2eUuzJymzn0hN6vvTTxJgAMYUV6c+on6cMFJ8+7h8
 TOwu/r9GXZTPvweXJEv/y0f0KULsq/8Ur44NCjHW8+nzpQ7K/9dHpCpPXvL2RYsRLuUs
 WOSyryW11rhffsx8KKa3mQAd/5XX6uFUAyjeugsF89n4oqPLcd9taUZ01tWVZ2ssoZI9
 fKbU3MRFGvWNNkh+ioT4hj13O+nx5dbMV9u6tcuhfkAi0nltcnWT9KZrFlwO1h89KSb0
 yMGJP1s4uTeusRXs9cd593XdyTMnvNJ0v4p3wFLBVzX604YPzpoT/KL++FrZatdx0Qlc Lg== 
Received: from ediex01.ad.cirrus.com ([87.246.76.36])
 by mx0b-001ae601.pphosted.com with ESMTP id 3au71jh9ay-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Fri, 03 Sep 2021 16:28:22 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.12; Fri, 3 Sep
 2021 22:28:20 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2242.12 via
 Frontend Transport; Fri, 3 Sep 2021 22:28:20 +0100
Received: from localhost.localdomain (macC02XQ1DJJG5K.ad.cirrus.com
 [141.131.64.124])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id BD1D6B13;
 Fri,  3 Sep 2021 21:28:11 +0000 (UTC)
From: David Rhodes <drhodes@opensource.cirrus.com>
To: <broonie@kernel.org>, <robh@kernel.org>, <ckeepax@opensource.cirrus.com>, 
 <brian.austin@cirrus.com>, <patches@opensource.cirrus.com>,
 <alsa-devel@alsa-project.org>, <david.rhodes@cirrus.com>,
 <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH v6 0/2] Cirrus Logic CS35L41 Amplifier
Date: Fri, 3 Sep 2021 16:26:57 -0500
Message-ID: <20210903212659.2011303-1-drhodes@opensource.cirrus.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: lv7VdIqZLPMyeBGYrfmeqfwSxLoQwI_r
X-Proofpoint-ORIG-GUID: lv7VdIqZLPMyeBGYrfmeqfwSxLoQwI_r
X-Proofpoint-Spam-Reason: safe
Cc: David Rhodes <drhodes@opensource.cirrus.com>
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

ASoC driver and devicetree documentation for a new
Cirrus Logic amplifier CS35L41

v6 changes:
Fix header comment style
Remove some unsafe mixer controls
Remove some fields in regmap readable_reg
Remove unneccesssary regmap setup in component_probe
Remove extra whitespace
Reorder in probe: handle_pdata before regulator_enable
Set initial analog gain to 0dB

David Rhodes (2):
  ASoC: cs35l41: CS35L41 Boosted Smart Amplifier
  ASoC: cs35l41: Add bindings for CS35L41

 .../devicetree/bindings/sound/cs35l41.yaml    |  162 ++
 include/sound/cs35l41.h                       |   35 +
 sound/soc/codecs/Kconfig                      |   12 +
 sound/soc/codecs/Makefile                     |    4 +
 sound/soc/codecs/cs35l41-i2c.c                |  114 ++
 sound/soc/codecs/cs35l41-spi.c                |  143 ++
 sound/soc/codecs/cs35l41-tables.c             |  597 +++++++
 sound/soc/codecs/cs35l41.c                    | 1561 +++++++++++++++++
 sound/soc/codecs/cs35l41.h                    |  775 ++++++++
 9 files changed, 3403 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/cs35l41.yaml
 create mode 100644 include/sound/cs35l41.h
 create mode 100644 sound/soc/codecs/cs35l41-i2c.c
 create mode 100644 sound/soc/codecs/cs35l41-spi.c
 create mode 100644 sound/soc/codecs/cs35l41-tables.c
 create mode 100644 sound/soc/codecs/cs35l41.c
 create mode 100644 sound/soc/codecs/cs35l41.h

-- 
2.25.1

