Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 16B6A38B457
	for <lists+alsa-devel@lfdr.de>; Thu, 20 May 2021 18:35:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8A2411697;
	Thu, 20 May 2021 18:34:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8A2411697
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1621528512;
	bh=dEcY6VDZkucQeAHG+0z0CqQ11EjNe3NjcbzUyHbyI1w=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=elp5WGXufwUvFdsyO4ef2k4ziL6aRG86VR7ySCyAAEquWZZWqHuUxtVocs4VOh42h
	 og98mqc5pAhYKZ2cHeB051lwuvDf5D2Fski2bEKVFebg/RAcfQqLk8GfefiSgdQLOo
	 EZS3psmt+ZCaWYjfU/UMgEedZsWCDYACrGM98a+I=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F22F8F80229;
	Thu, 20 May 2021 18:33:42 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2141EF80217; Thu, 20 May 2021 18:33:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 81FB5F80127
 for <alsa-devel@alsa-project.org>; Thu, 20 May 2021 18:33:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 81FB5F80127
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="goTMduqK"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 14KGW0ig011261; Thu, 20 May 2021 11:33:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=PODMain02222019;
 bh=YHGDnB3/fKKfk2ymDd/HVOs1tLCKFJCMnts8DlcLJw0=;
 b=goTMduqKB/ozx4yGi6GaEyYu6savPRvRdPSJ2BQqeu//X9HlgIjePmkA8S0HzyT3VPRV
 egYb7DQWi+g9syhqyc4hJQpLdM2sAZdgrEAqPNN2uetWHgMIrF203IraSJBGuwF5FmzS
 WL4AQQnvzmZ3WS7y6sxWMJDlz1yrXTljy4UXg+ccnMsurhStvEFot5l5YO8TE6FvRVA2
 X23PS5x5yYaoOGMOhlU+oBaq2oKfrEUlM+dAAGqj3xtUWx2rOvRu6z2mTtMqGkWkopMv
 IMySxT4Sxj3bEQb/JM50CMkrtZQlPUa3TidKK1NwhzfanrERI9LhAJysrJPz3AnSFGLH 7w== 
Received: from ediex02.ad.cirrus.com ([87.246.76.36])
 by mx0a-001ae601.pphosted.com with ESMTP id 38n43v9qyw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Thu, 20 May 2021 11:33:30 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Thu, 20 May
 2021 17:33:27 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2242.4 via Frontend
 Transport; Thu, 20 May 2021 17:33:27 +0100
Received: from AUSNPC0LSNW1-debian.cirrus.com (AUSNPC0LSNW1.ad.cirrus.com
 [198.61.65.101])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 02E0611CD;
 Thu, 20 May 2021 16:33:26 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: <broonie@kernel.org>, <pierre-louis.bossart@linux.intel.com>,
 <cezary.rojewski@intel.com>, <liam.r.girdwood@linux.intel.com>,
 <yang.jie@linux.intel.com>
Subject: [PATCH] ASoC: Intel: boards: Select SND_SOC_HDAC_HDMI for Soundwire
 machine driver
Date: Thu, 20 May 2021 17:33:24 +0100
Message-ID: <20210520163324.19046-1-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: 7n3ICBrRN2cTxZYdQpGrXFphjaUoB_IP
X-Proofpoint-ORIG-GUID: 7n3ICBrRN2cTxZYdQpGrXFphjaUoB_IP
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 spamscore=0
 bulkscore=0 mlxlogscore=999 malwarescore=0 suspectscore=0 impostorscore=0
 lowpriorityscore=0 phishscore=0 adultscore=0 mlxscore=0 clxscore=1011
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2105200107
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 Richard Fitzgerald <rf@opensource.cirrus.com>, linux-kernel@vger.kernel.org
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

Add select of SND_SOC_HDAC_HDMI for SND_SOC_INTEL_SOUNDWIRE_SOF_MACH.
Without this the build results in missing references to
hdac_hdmi_jack_port_init and hdac_hdmi_jack_init.

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---
 sound/soc/intel/boards/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/intel/boards/Kconfig b/sound/soc/intel/boards/Kconfig
index eef5f4ac87c5..6a1639b14b67 100644
--- a/sound/soc/intel/boards/Kconfig
+++ b/sound/soc/intel/boards/Kconfig
@@ -601,6 +601,7 @@ config SND_SOC_INTEL_SOUNDWIRE_SOF_MACH
 	select SND_SOC_DMIC
 	select SND_SOC_INTEL_HDA_DSP_COMMON
 	select SND_SOC_INTEL_SOF_MAXIM_COMMON
+	select SND_SOC_HDAC_HDMI
 	help
 	  Add support for Intel SoundWire-based platforms connected to
 	  MAX98373, RT700, RT711, RT1308 and RT715
-- 
2.20.1

