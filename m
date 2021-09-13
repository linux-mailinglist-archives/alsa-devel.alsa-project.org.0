Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DC13F40983B
	for <lists+alsa-devel@lfdr.de>; Mon, 13 Sep 2021 18:02:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5379B1672;
	Mon, 13 Sep 2021 18:01:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5379B1672
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1631548966;
	bh=Lx5o7B3XBxCK6Cey+krYZcdbyy9F4ULqrQ0/c7tVIY8=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=P7Svvlqec9eUQvBlSzj927zGuH3mjmcRC49EWGSt2zoHIELTcruF+4m7zc1x5rt8b
	 FYPODbOcJEal9LQY26XrIb7JIf24rn076wFGPkHxR86ZY6/SRjJAy7yQiMp21pJIuM
	 XWCi3DMTQ6Q8JK8YZl9+7nXPC09H/XtzQMf8fBUk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9AC3EF804E5;
	Mon, 13 Sep 2021 18:01:29 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BBE24F80227; Mon, 13 Sep 2021 18:01:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4C9D0F80227
 for <alsa-devel@alsa-project.org>; Mon, 13 Sep 2021 18:01:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4C9D0F80227
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="LlJM/JLI"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 18DAEA6M014550; 
 Mon, 13 Sep 2021 11:01:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=PODMain02222019;
 bh=kxwr+fQrkMMf3nLnZDBqxMSorZNZnlyvVvt6IleDk5M=;
 b=LlJM/JLIdInDxTP5XBtCbco5xiMepz7PSSmlx0XbGMtAFjg9lVYOY5r5ged4uEkrgJDz
 VNwjujb2t1qz5YsYLjFxDfp6nefkosY1+Mbc7nq0vUFSP0VuLpJX+IfZV5wxoFBzsXwR
 BYDT218rWB67MmyPwIATEgzk0gVwCHX/Bt1vRcehXQ3hDZVJuBcR/PC4FkRn/uJHoezQ
 sEs2x3Gj7Bb7DZ0M0C4kPVU+FotiT9OfZPI0ENnCHj/ZrmJu77oBnDqkJIMwV/5RZrQv
 feYJYpu9cVTq0pXmFTLCw/WOFu3EQoMQ3sRvdiy2okNJMA5nZ4YVkScTl4OM5UUmF9Yf XA== 
Received: from ediex02.ad.cirrus.com ([87.246.76.36])
 by mx0a-001ae601.pphosted.com with ESMTP id 3b1n5drxkd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Mon, 13 Sep 2021 11:01:19 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.12; Mon, 13 Sep
 2021 17:01:17 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2242.12 via
 Frontend Transport; Mon, 13 Sep 2021 17:01:17 +0100
Received: from simont-vb.lan?044ad.cirrus.com (unknown [198.90.238.152])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 3D0482A9;
 Mon, 13 Sep 2021 16:01:17 +0000 (UTC)
From: Simon Trimmer <simont@opensource.cirrus.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>
Subject: [PATCH 00/16] add driver to support firmware loading on Cirrus Logic
 DSPs
Date: Mon, 13 Sep 2021 17:00:41 +0100
Message-ID: <20210913160057.103842-1-simont@opensource.cirrus.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: cFiMMI10d2CKHvOl6ZcBIY-_fScsUAlG
X-Proofpoint-ORIG-GUID: cFiMMI10d2CKHvOl6ZcBIY-_fScsUAlG
X-Proofpoint-Spam-Reason: safe
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 Simon Trimmer <simont@opensource.cirrus.com>, linux-kernel@vger.kernel.org
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

This series of patches gradually separates the ASoC specific wm_adsp
code from that required to manage firmware in Cirrus Logic DSPs.

The series starts with renaming, progresses to splitting the
functionality before finally moving the independent functionality into
drivers/firmware so that it can be used by both the existing ASoC
wm_adsp and new non-audio parts.

Charles Keepax (3):
  ASoC: wm_adsp: Move check for control existence
  ASoC: wm_adsp: Switch to using wm_coeff_read_ctrl for compressed
    buffers
  ASoC: wm_adsp: Move sys_config_size to wm_adsp

Simon Trimmer (13):
  ASoC: wm_adsp: Remove use of snd_ctl_elem_type_t
  ASoC: wm_adsp: Cancel ongoing work when removing controls
  ASoC: wm_adsp: Rename generic DSP support
  ASoC: wm_adsp: Introduce cs_dsp logging macros
  ASoC: wm_adsp: Separate some ASoC and generic functions
  ASoC: wm_adsp: Split DSP power operations into helper functions
  ASoC: wm_adsp: Separate generic cs_dsp_coeff_ctl handling
  ASoC: wm_adsp: Move check of dsp->running to better place
  ASoC: wm_adsp: Pass firmware names as parameters when starting DSP
    core
  ASoC: wm_adsp: move firmware loading to client
  ASoC: wm_adsp: Split out struct cs_dsp from struct wm_adsp
  ASoC: wm_adsp: Separate wm_adsp specifics in cs_dsp_client_ops
  firmware: cs_dsp: add driver to support firmware loading on Cirrus
    Logic DSPs

 MAINTAINERS                                   |   11 +
 drivers/firmware/Kconfig                      |    1 +
 drivers/firmware/Makefile                     |    1 +
 drivers/firmware/cirrus/Kconfig               |    5 +
 drivers/firmware/cirrus/Makefile              |    3 +
 drivers/firmware/cirrus/cs_dsp.c              | 3109 ++++++++++++++++
 include/linux/firmware/cirrus/cs_dsp.h        |  242 ++
 .../linux/firmware/cirrus}/wmfw.h             |    8 +-
 sound/soc/codecs/Kconfig                      |    1 +
 sound/soc/codecs/cs47l15.c                    |   22 +-
 sound/soc/codecs/cs47l24.c                    |   20 +-
 sound/soc/codecs/cs47l35.c                    |   24 +-
 sound/soc/codecs/cs47l85.c                    |   32 +-
 sound/soc/codecs/cs47l90.c                    |   34 +-
 sound/soc/codecs/cs47l92.c                    |   20 +-
 sound/soc/codecs/madera.c                     |   18 +-
 sound/soc/codecs/wm2200.c                     |   30 +-
 sound/soc/codecs/wm5102.c                     |   16 +-
 sound/soc/codecs/wm5110.c                     |   24 +-
 sound/soc/codecs/wm_adsp.c                    | 3188 ++---------------
 sound/soc/codecs/wm_adsp.h                    |  105 +-
 21 files changed, 3794 insertions(+), 3120 deletions(-)
 create mode 100644 drivers/firmware/cirrus/Kconfig
 create mode 100644 drivers/firmware/cirrus/Makefile
 create mode 100644 drivers/firmware/cirrus/cs_dsp.c
 create mode 100644 include/linux/firmware/cirrus/cs_dsp.h
 rename {sound/soc/codecs => include/linux/firmware/cirrus}/wmfw.h (91%)

-- 
2.33.0

