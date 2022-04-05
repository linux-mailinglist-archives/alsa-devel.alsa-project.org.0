Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D77C4F35F8
	for <lists+alsa-devel@lfdr.de>; Tue,  5 Apr 2022 15:55:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1F546184D;
	Tue,  5 Apr 2022 15:55:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1F546184D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1649166950;
	bh=4WqylMW8i+rQfLRmQu6qHTLDIIC8RebC1tDp4MbEjrw=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=VmA5DSinjjMr2vN+4Fxj5VGjl191m2WJKWFRBy1qoPdeYFuuL/LzzYaGSs6wjzgci
	 h3vwxFllwidMmhGvEId3K7xD8UQKdRfNI7LlGEsRHBo/dPHSXxGIPNyp8R2BNoIjvp
	 qAk/jJRaMnq1p6Xg4pKxlCjWhl++gyO6gA0VZvwk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 093F9F80528;
	Tue,  5 Apr 2022 15:54:35 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AA092F80527; Tue,  5 Apr 2022 15:54:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2D588F800D1
 for <alsa-devel@alsa-project.org>; Tue,  5 Apr 2022 15:54:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2D588F800D1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="g2jQs73Q"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 2356jiGC029879;
 Tue, 5 Apr 2022 08:54:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=PODMain02222019;
 bh=D7H9GzgzNTUv2SxZBu6ky5Mhjq+9FrGLu3EkwWXFSIo=;
 b=g2jQs73Qjk38eI+fMIuqbIBkeVF1/x//BzW1DoRLUX5JKXvc1TCbFH5dpjQt+gYWNDZk
 FaJgSd4VvUCtFWgHk0DaLA47+Liqhj5ThoQ7VPA/KteyHZtY7wWYN2Be4QEwXjA5LXvB
 yLGM/hdATnIsWHrGXd/XF8TITzLS/k0Gwh1y4dJ1P2CI8RaSgB0i4dfTROnDjao0SLkO
 hkyVn0i85Nn+Ef4PLpUFaXBH7Y5h/wXOXHkv8bwZ/MDcoZbD039JKg1vguafOmJeZCIV
 lreIJZhiNE4ex1PsvTswd2iTMMLi74qVeCD86CX1GTmtMe6RQwLE+WGuERHK9tnJpTNu 2g== 
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
 by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3f6kw2brws-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Tue, 05 Apr 2022 08:54:25 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Tue, 5 Apr
 2022 14:54:23 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.24 via
 Frontend Transport; Tue, 5 Apr 2022 14:54:23 +0100
Received: from AUSNPC0LSNW1-debian.cirrus.com (AUSNPC0LSNW1.ad.cirrus.com
 [198.61.65.88])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id C644E458;
 Tue,  5 Apr 2022 13:54:22 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: <broonie@kernel.org>
Subject: [PATCH v2 0/5] ASoC: Add a driver for the Cirrus Logic CS35L45 Smart
 Amplifier
Date: Tue, 5 Apr 2022 14:54:14 +0100
Message-ID: <20220405135419.1230088-1-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: cJo1vpfXBTPYhRk3hu6TOOHFtAt-ZQXd
X-Proofpoint-GUID: cJo1vpfXBTPYhRk3hu6TOOHFtAt-ZQXd
X-Proofpoint-Spam-Reason: safe
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 patches@opensource.cirrus.com, linux-kernel@vger.kernel.org,
 Richard Fitzgerald <rf@opensource.cirrus.com>, robh+dt@kernel.org
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

This adds basic audio support for the Cirrus Logic CS35L45 amplifier.

The first two patches add two generic helpers to ASoC, and patch 3 is
a kunit test for patch 2.

CHANGES SINCE V1:
Patch #5:
 - spi .remove callback now has void return
 - use new I2C .probe_new callback
 - force boost-bypass mode as default

James Schulman (1):
  ASoC: cs35l45: Add driver for Cirrus Logic CS35L45 Smart Amp

Richard Fitzgerald (4):
  ASoC: soc.h: Add SOC_SINGLE_S_TLV() macro
  ASoC: soc-utils: Add helper to calculate BCLK from TDM info
  ASoC: soc-utils: Add kunit test for snd_soc_tdm_params_to_bclk()
  ASoC: dt-bindings: cs35l45: Cirrus Logic CS35L45 Smart Amp

 .../bindings/sound/cirrus,cs35l45.yaml        |  75 ++
 MAINTAINERS                                   |   2 +
 include/dt-bindings/sound/cs35l45.h           |  20 +
 include/sound/soc.h                           |   4 +
 sound/soc/Kconfig                             |   9 +-
 sound/soc/Makefile                            |   5 +
 sound/soc/codecs/Kconfig                      |  30 +
 sound/soc/codecs/Makefile                     |   8 +
 sound/soc/codecs/cs35l45-i2c.c                |  72 ++
 sound/soc/codecs/cs35l45-spi.c                |  72 ++
 sound/soc/codecs/cs35l45-tables.c             | 202 +++++
 sound/soc/codecs/cs35l45.c                    | 693 ++++++++++++++++++
 sound/soc/codecs/cs35l45.h                    | 217 ++++++
 sound/soc/soc-utils-test.c                    | 186 +++++
 sound/soc/soc-utils.c                         |  45 ++
 15 files changed, 1639 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/sound/cirrus,cs35l45.yaml
 create mode 100644 include/dt-bindings/sound/cs35l45.h
 create mode 100644 sound/soc/codecs/cs35l45-i2c.c
 create mode 100644 sound/soc/codecs/cs35l45-spi.c
 create mode 100644 sound/soc/codecs/cs35l45-tables.c
 create mode 100644 sound/soc/codecs/cs35l45.c
 create mode 100644 sound/soc/codecs/cs35l45.h
 create mode 100644 sound/soc/soc-utils-test.c

-- 
2.30.2

