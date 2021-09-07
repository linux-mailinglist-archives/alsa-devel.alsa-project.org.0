Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4748E403147
	for <lists+alsa-devel@lfdr.de>; Wed,  8 Sep 2021 00:59:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C3139172D;
	Wed,  8 Sep 2021 00:59:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C3139172D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1631055590;
	bh=fPmihyGoH95LHGrH/wGUGxTY+NfqUzSXGkEDxjl2yXk=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=UXOrdR4EAAOsmLs1SimStjvX0c56jq55mi7IWdZ1Xnvb/iyY+EBwEPLMBdgPrrXr8
	 eVvUGBrKKPEawUiNLVi4FJr7ankp9TnbrAVLOCWhuNMjm1GJrp5tL/XlqQ8WVTsj65
	 qeaQGBPD6kczAGiey7ri7nk+a8HLe8F8Zh1v/JOo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A62CFF80300;
	Wed,  8 Sep 2021 00:58:42 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4F2C6F802DF; Wed,  8 Sep 2021 00:58:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AAC98F800C7
 for <alsa-devel@alsa-project.org>; Wed,  8 Sep 2021 00:58:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AAC98F800C7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="dCcGtds/"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 187MOMom011127; 
 Tue, 7 Sep 2021 17:58:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=PODMain02222019;
 bh=nnQSN31jtxHeO8603VLC465dKrlkvLcY+sGc3eMaxIw=;
 b=dCcGtds/w2xBOlyCIpzKnvIAEziABOSb22BLydtxeSZHMep3UjDtJFY6SDwkFo8KbOnI
 du4wriANU2tQj74+/ezEI3C0rYYnSxen87C1mhPqehhzwjCqtlwZm3Jn2wnoqKi2zbMQ
 giNX68ZvHK7U4B0jGvywRtLNSjOJ0UahdU/r1+G8tjhxNXAruSR3ery1afsjiUjyBw6E
 9IBz8dBkIuD5c+ip9nW78X4Gyrfr0CgXmsvBsAb9BpD4ViGiiFD5UT5fEiiCwTMHdtd9
 IM9F19GiItqwfvv9bjI0PS29Jzcs9gxvo+Xai8cr5D3fcuUSKRquN9ccrVtQbC8FgPbV Ow== 
Received: from ediex01.ad.cirrus.com ([87.246.76.36])
 by mx0a-001ae601.pphosted.com with ESMTP id 3axcp60905-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Tue, 07 Sep 2021 17:58:32 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.12; Tue, 7 Sep
 2021 23:58:31 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2242.12 via
 Frontend Transport; Tue, 7 Sep 2021 23:58:30 +0100
Received: from localhost.localdomain (macC02XQ1DJJG5K.ad.cirrus.com
 [141.131.65.38])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 8D8D62BA;
 Tue,  7 Sep 2021 22:58:29 +0000 (UTC)
From: David Rhodes <drhodes@opensource.cirrus.com>
To: <broonie@kernel.org>, <robh@kernel.org>, <ckeepax@opensource.cirrus.com>, 
 <brian.austin@cirrus.com>, <patches@opensource.cirrus.com>,
 <alsa-devel@alsa-project.org>, <david.rhodes@cirrus.com>,
 <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH v7 0/2] Cirrus Logic CS35L41 Amplifier
Date: Tue, 7 Sep 2021 17:57:17 -0500
Message-ID: <20210907225719.2018115-1-drhodes@opensource.cirrus.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: -bk_K7S8xYwKJBiOGgvWkKDkjtHcatKx
X-Proofpoint-GUID: -bk_K7S8xYwKJBiOGgvWkKDkjtHcatKx
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

v7 changes:
Remove property 'classh-bst-max-limit'

David Rhodes (2):
  ASoC: cs35l41: CS35L41 Boosted Smart Amplifier
  ASoC: cs35l41: Add bindings for CS35L41

 .../devicetree/bindings/sound/cs35l41.yaml    |  151 ++
 include/sound/cs35l41.h                       |   34 +
 sound/soc/codecs/Kconfig                      |   12 +
 sound/soc/codecs/Makefile                     |    4 +
 sound/soc/codecs/cs35l41-i2c.c                |  114 ++
 sound/soc/codecs/cs35l41-spi.c                |  143 ++
 sound/soc/codecs/cs35l41-tables.c             |  597 +++++++
 sound/soc/codecs/cs35l41.c                    | 1545 +++++++++++++++++
 sound/soc/codecs/cs35l41.h                    |  775 +++++++++
 9 files changed, 3375 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/cs35l41.yaml
 create mode 100644 include/sound/cs35l41.h
 create mode 100644 sound/soc/codecs/cs35l41-i2c.c
 create mode 100644 sound/soc/codecs/cs35l41-spi.c
 create mode 100644 sound/soc/codecs/cs35l41-tables.c
 create mode 100644 sound/soc/codecs/cs35l41.c
 create mode 100644 sound/soc/codecs/cs35l41.h

-- 
2.25.1

