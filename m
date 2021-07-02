Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 732323BA4D8
	for <lists+alsa-devel@lfdr.de>; Fri,  2 Jul 2021 22:54:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0076816B5;
	Fri,  2 Jul 2021 22:53:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0076816B5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1625259265;
	bh=twLfArV8So/ZXHAHbeXc6VqaxzcXntf06zUxyXCBcZc=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Cp0gbeY+9kA/nGoqRywB9Ee3i0u2aujuPuYSuYkf50FvX8gXEN2NLEXb/7fFZKpFh
	 ApKXnD5RCkzEFT+II9GHkGd+Pe66P07FuBec3z8jbfyPu/uMi8onuF5E7y2BCgE9r6
	 QfSGJMBkqkGOarwv0YIg+hAMVF4GqyGpBzPHgUAA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6A869F80240;
	Fri,  2 Jul 2021 22:52:57 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 17A9BF80229; Fri,  2 Jul 2021 22:52:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7E905F80165
 for <alsa-devel@alsa-project.org>; Fri,  2 Jul 2021 22:52:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7E905F80165
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="W8eO5Moc"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 162Kqn09013604; Fri, 2 Jul 2021 15:52:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=PODMain02222019;
 bh=1UkNbNJls2edYInU8Me+4fBrNgTv50l5Yatpm9cCBa8=;
 b=W8eO5MocKQCILyk9XBHNgiXw0WMr/c2dyU1+bVtG5NuBVPqjna7MwYVWnZAoqEXZUw2w
 aVb5EWHp+LibngwWOp+B3SI2/VjEP8I9SHCPNin+Qu6gbC7ZKw5HdyCnhvUv7Li26S+Q
 hSxe8Z5cntROdn6FEqSs8vpz9EXYg27jToGyw4R5rwUd38Q2A3jOzIECqRG7OIF1WGJg
 tks05254elR3zZ0BzXZyJ3SQHvv2pweSimsWu1HE6j8S6wdVD7qZRlPB6XvRlqCDrB70
 nV+hsv5dlnTNRX4y51dnKw7iANub4+f9gKXey7HO5NaI0/vk0kV+eopWR+DhzYAGuAsL Eg== 
Received: from ediex02.ad.cirrus.com ([87.246.76.36])
 by mx0a-001ae601.pphosted.com with ESMTP id 39j40rrgdu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Fri, 02 Jul 2021 15:52:49 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Fri, 2 Jul 2021
 21:52:47 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2242.4 via Frontend
 Transport; Fri, 2 Jul 2021 21:52:47 +0100
Received: from localhost.localdomain (macC02XQ1DJJG5K.ad.cirrus.com
 [141.131.64.84])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 48A96448;
 Fri,  2 Jul 2021 20:52:40 +0000 (UTC)
From: David Rhodes <drhodes@opensource.cirrus.com>
To: <broonie@kernel.org>, <robh@kernel.org>, <ckeepax@opensource.cirrus.com>, 
 <brian.austin@cirrus.com>, <patches@opensource.cirrus.com>,
 <alsa-devel@alsa-project.org>, <david.rhodes@cirrus.com>
Subject: [PATCH v3 0/2] Cirrus Logic CS35L41 Amplifier
Date: Fri, 2 Jul 2021 15:51:25 -0500
Message-ID: <20210702205127.1400539-1-drhodes@opensource.cirrus.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: AGA4KQEq20m1_0kerCCUM5mf5XMDAHtG
X-Proofpoint-GUID: AGA4KQEq20m1_0kerCCUM5mf5XMDAHtG
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 lowpriorityscore=0 bulkscore=0
 impostorscore=0 adultscore=0 suspectscore=0 phishscore=0 mlxlogscore=999
 malwarescore=0 spamscore=0 priorityscore=1501 clxscore=1015 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2107020106
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

v3 changes:
Removed redundant info from license header
Alphabetized includes
Changed comment on ACPI ID to reflect that vendor portion is a PnP ID
Removed some unnecessary initializations
Changed some uses of (x == NULL) to (!x)

David Rhodes (2):
  ASoC: cs35l41: CS35L41 Boosted Smart Amplifier
  ASoC: cs35l41: Add bindings for CS35L41

 .../devicetree/bindings/sound/cs35l41.yaml    |  395 ++++
 include/sound/cs35l41.h                       |   79 +
 sound/soc/codecs/Kconfig                      |   12 +
 sound/soc/codecs/Makefile                     |    4 +
 sound/soc/codecs/cs35l41-i2c.c                |  120 ++
 sound/soc/codecs/cs35l41-spi.c                |  147 ++
 sound/soc/codecs/cs35l41-tables.c             |  612 ++++++
 sound/soc/codecs/cs35l41.c                    | 1765 +++++++++++++++++
 sound/soc/codecs/cs35l41.h                    |  750 +++++++
 9 files changed, 3884 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/cs35l41.yaml
 create mode 100644 include/sound/cs35l41.h
 create mode 100644 sound/soc/codecs/cs35l41-i2c.c
 create mode 100644 sound/soc/codecs/cs35l41-spi.c
 create mode 100644 sound/soc/codecs/cs35l41-tables.c
 create mode 100644 sound/soc/codecs/cs35l41.c
 create mode 100644 sound/soc/codecs/cs35l41.h

-- 
2.25.1

