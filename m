Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 34B154DDF13
	for <lists+alsa-devel@lfdr.de>; Fri, 18 Mar 2022 17:31:43 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3866A18C0;
	Fri, 18 Mar 2022 17:30:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3866A18C0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1647621101;
	bh=aY5T2Hh08cA2+xfnM27Edz6tmNEdcWa/K3k6rsc7XGk=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Awl6sDWbIKJoH4GuPgc53StH/sSWNQZPk5HXERyqmIiJvDY8X6Z1tPeJaj7GBinZq
	 xrOlNuqcSfcAxhw4OJyfRQd2CQf7AgDflf27+mtSCrpJQ9E8NGOT4pSRHRHxf4Fne6
	 6YeRRoeoRSzf+vfz5DiKDGRFIzGPQuvOmvidRHqE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4594BF80124;
	Fri, 18 Mar 2022 17:30:00 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CC444F80279; Fri, 18 Mar 2022 17:29:57 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5ADB3F8026D
 for <alsa-devel@alsa-project.org>; Fri, 18 Mar 2022 17:29:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5ADB3F8026D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="cxK65f2/"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 22I7cSw0022149;
 Fri, 18 Mar 2022 11:29:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=PODMain02222019;
 bh=bZOlEfRg8T9t1B79/9gI2BtOG0E7AxmmrAD8lfrQVfY=;
 b=cxK65f2/uAOtvEX3R8Rj+f4it+rm1WasLXI5OQ8Nj2ndlwpHKYqHZQ26BJb8/ghDOZ+g
 rSQuQeTFdH84eYj7FxUDatE3iw8Aj+IZEc/DWhi8iyPCanlmIKyt40qxD54W/PRuxwlm
 afEOLkDx6J0d++Iar4W+sVSxPTUSLWQ9v9Mb+m0tiVn4KVSblQwIJKsjaQRYqYnhQt/9
 ofI+Ixpa45WnFRUfGKBX0Nn25xp2jX0i/jp7tjth0rCUS9f1h1geHx2unuOSBpNJm49V
 xee1/+MrY8Wj9YdWpr4lig4/Zvd+dmPvJ3gPaRAbv954jjoqvEuiPmz6t76PLq9UZARA sA== 
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
 by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3et642efpx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Fri, 18 Mar 2022 11:29:46 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Fri, 18 Mar
 2022 16:29:44 +0000
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.18 via
 Frontend Transport; Fri, 18 Mar 2022 16:29:44 +0000
Received: from debianA11184.ad.cirrus.com (debianA11184.ad.cirrus.com
 [198.90.251.45])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 450F37C;
 Fri, 18 Mar 2022 16:29:44 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: <broonie@kernel.org>, <robh+dt@kernel.org>
Subject: [PATCH 0/5] ASoC: Add a driver for the Cirrus Logic CS35L45 Smart
 Amplifier
Date: Fri, 18 Mar 2022 16:29:38 +0000
Message-ID: <20220318162943.1578102-1-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: D_bFfSzULB-QA3qo-yHPCgAOR5Wto9Mw
X-Proofpoint-ORIG-GUID: D_bFfSzULB-QA3qo-yHPCgAOR5Wto9Mw
X-Proofpoint-Spam-Reason: safe
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
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
 sound/soc/codecs/cs35l45-i2c.c                |  73 ++
 sound/soc/codecs/cs35l45-spi.c                |  72 ++
 sound/soc/codecs/cs35l45-tables.c             | 202 +++++
 sound/soc/codecs/cs35l45.c                    | 689 ++++++++++++++++++
 sound/soc/codecs/cs35l45.h                    | 213 ++++++
 sound/soc/soc-utils-test.c                    | 186 +++++
 sound/soc/soc-utils.c                         |  45 ++
 15 files changed, 1632 insertions(+), 1 deletion(-)
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

