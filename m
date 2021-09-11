Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AD1640743F
	for <lists+alsa-devel@lfdr.de>; Sat, 11 Sep 2021 02:47:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9E6EF168B;
	Sat, 11 Sep 2021 02:46:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9E6EF168B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1631321267;
	bh=fPmihyGoH95LHGrH/wGUGxTY+NfqUzSXGkEDxjl2yXk=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=ht4Ku0mMro46BGrkA8DtxUG5zee4a5uyRBqfk4lzO+6QlciWHC1dkRod6h9CcB61e
	 BrSSGIzeqBllmQNdpmcKPj2i6k6UXjHXErw9Aozr4cptXXwa2B1kIwycBpGduog667
	 mK3xLbydLuf6SCjUHtg85g8RJjB1/7czqq4yr8jA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 18E15F8049C;
	Sat, 11 Sep 2021 02:46:31 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 40762F802E7; Sat, 11 Sep 2021 02:46:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5C143F800FC
 for <alsa-devel@alsa-project.org>; Sat, 11 Sep 2021 02:46:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5C143F800FC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="OZ+uyQ+Q"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 18AMqDqM021593; 
 Fri, 10 Sep 2021 19:46:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=PODMain02222019;
 bh=nnQSN31jtxHeO8603VLC465dKrlkvLcY+sGc3eMaxIw=;
 b=OZ+uyQ+QN6Ry/+/69V4UF8UBlf/oeamW+U+QmCzAU5bQEfOFzMeJc5zKolhmfCoQ6yXz
 mhkbv5cjvjwOupT5KGgJ4UDk5sbudoooPtsDcdV5wj1WGt3lYoQfj1d7DDmWFIwmV3PZ
 o7S0TIazN4m/Ry5qdvuGejy3PQiAJTzpeTRm5F36PgwzhTqC8Ewd51cF3iexvDUl9lup
 VaVV074hhfVugqQK3uSaY9Sxj/ICnb9QHmuQrsNnqGTZgftGeivvhBOsp1ZQMdsnB2Qw
 XJuFZEp1jxAGaTPK+YIKULk8zymRRktYjGFGx9hPDFsrMDWYKOZ9Cvth33yZvdx8t3J/ gw== 
Received: from ediex02.ad.cirrus.com ([87.246.76.36])
 by mx0b-001ae601.pphosted.com with ESMTP id 3aytg79kjf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Fri, 10 Sep 2021 19:46:21 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.12; Sat, 11 Sep
 2021 01:46:20 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2242.12 via
 Frontend Transport; Sat, 11 Sep 2021 01:46:20 +0100
Received: from mail1.cirrus.com (unknown [198.61.64.254])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id AF66645D;
 Sat, 11 Sep 2021 00:46:11 +0000 (UTC)
From: David Rhodes <drhodes@opensource.cirrus.com>
To: <broonie@kernel.org>, <robh@kernel.org>, <ckeepax@opensource.cirrus.com>, 
 <brian.austin@cirrus.com>, <patches@opensource.cirrus.com>,
 <alsa-devel@alsa-project.org>, <david.rhodes@cirrus.com>,
 <pierre-louis.bossart@linux.intel.com>, <devicetree@vger.kernel.org>
Subject: [PATCH v7 0/2] Cirrus Logic CS35L41 Amplifier
Date: Fri, 10 Sep 2021 19:45:44 -0500
Message-ID: <20210911004546.2139657-1-drhodes@opensource.cirrus.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: pR86pyhJ5rdkT9bQGcT5NgA6A3CnjwOG
X-Proofpoint-ORIG-GUID: pR86pyhJ5rdkT9bQGcT5NgA6A3CnjwOG
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

