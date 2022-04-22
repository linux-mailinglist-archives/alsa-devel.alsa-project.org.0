Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 60C1450B952
	for <lists+alsa-devel@lfdr.de>; Fri, 22 Apr 2022 15:58:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0DD5717F4;
	Fri, 22 Apr 2022 15:57:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0DD5717F4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1650635896;
	bh=Cc5Age3uBOVbxJeFvpRpsNwNYRZx4fUfNPbGH7frztA=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=uRTGJcF2A7IX00QInYncXYoNuq7v26KpU+I4+GsZe/sds8fCLmvx7oF5u5RbAEZ9i
	 NH5QxKUt9nkUN2ExWx1l2p9p4BT3WQiSUMo1lNrmmAvkVRcQgRGT6GN7xiT5x4ZAZP
	 EKyL5KZ+putlQnnnFe0u3DZBXcLSRbFrl8Afho4w=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B8DBBF80508;
	Fri, 22 Apr 2022 15:33:53 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C2D19F804C1; Fri, 22 Apr 2022 07:57:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=1.0 required=5.0 tests=RDNS_NONE,SPF_HELO_NONE,
 SPF_NONE,T_SCC_BODY_TEXT_LINE,UNPARSEABLE_RELAY autolearn=disabled
 version=3.4.0
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A0576F80245;
 Fri, 22 Apr 2022 07:57:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A0576F80245
X-UUID: 9da354324c1a4640a505334e2494aed0-20220422
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.4, REQID:c12192c6-c32f-403c-a562-33a4f3a8ee32, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:100,FILE:0,RULE:Release_Ham,AC
 TION:release,TS:100
X-CID-INFO: VERSION:1.1.4, REQID:c12192c6-c32f-403c-a562-33a4f3a8ee32, OB:0,
 LOB:
 0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:100,FILE:0,RULE:Spam_GS981B3D,AC
 TION:quarantine,TS:100
X-CID-META: VersionHash:faefae9, CLOUDID:79e4bcef-06b0-4305-bfbf-554bfc9d151a,
 C
 OID:5502ed875025,Recheck:0,SF:13|15|28|16|19|48,TC:nil,Content:0,EDM:-3,Fi
 le:nil,QS:0,BEC:nil
X-UUID: 9da354324c1a4640a505334e2494aed0-20220422
Received: from mtkcas11.mediatek.inc [(172.21.101.40)] by mailgw01.mediatek.com
 (envelope-from <tinghan.shen@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1081602718; Fri, 22 Apr 2022 13:57:16 +0800
Received: from mtkexhb02.mediatek.inc (172.21.101.103) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Fri, 22 Apr 2022 13:57:15 +0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by mtkexhb02.mediatek.inc
 (172.21.101.103) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Fri, 22 Apr 2022 13:57:15 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Fri, 22 Apr 2022 13:57:14 +0800
From: Tinghan Shen <tinghan.shen@mediatek.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, Liam Girdwood
 <lgirdwood@gmail.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, 
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, Daniel Baluta
 <daniel.baluta@nxp.com>, Mark Brown <broonie@kernel.org>, Jaroslav Kysela
 <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, YC Hung <yc.hung@mediatek.com>, Allen-KH Cheng
 <allen-kh.cheng@mediatek.com>, Tinghan Shen <tinghan.shen@mediatek.com>,
 =?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>, "Geert
 Uytterhoeven" <geert@linux-m68k.org>
Subject: [PATCH v1 0/4] Add support of MediaTek mt8186 to SOF
Date: Fri, 22 Apr 2022 13:56:55 +0800
Message-ID: <20220422055659.8738-1-tinghan.shen@mediatek.com>
X-Mailer: git-send-email 2.15.GIT
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-Mailman-Approved-At: Fri, 22 Apr 2022 15:31:40 +0200
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 sound-open-firmware@alsa-project.org
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

Add support of MediaTek mt8186 SoC DSP to SOF.
This series is taken from thesofproject/linux/tree/topic/sof-dev-rebase.

Tinghan Shen (4):
  ASoC: SOF: mediatek: Add mt8186 hardware support
  ASoC: SOF: mediatek: Add mt8186 sof fw loader and dsp ops
  ASoC: SOF: mediatek: Add mt8186 dsp clock support
  ASoC: SOF: mediatek: Add DSP system PM callback for mt8186

 sound/soc/sof/mediatek/Kconfig                |   9 +
 sound/soc/sof/mediatek/Makefile               |   1 +
 sound/soc/sof/mediatek/adsp_helper.h          |   8 +
 sound/soc/sof/mediatek/mt8186/Makefile        |   4 +
 sound/soc/sof/mediatek/mt8186/mt8186-clk.c    | 101 +++++
 sound/soc/sof/mediatek/mt8186/mt8186-clk.h    |  24 +
 sound/soc/sof/mediatek/mt8186/mt8186-loader.c |  53 +++
 sound/soc/sof/mediatek/mt8186/mt8186.c        | 413 ++++++++++++++++++
 sound/soc/sof/mediatek/mt8186/mt8186.h        |  80 ++++
 9 files changed, 693 insertions(+)
 create mode 100644 sound/soc/sof/mediatek/mt8186/Makefile
 create mode 100644 sound/soc/sof/mediatek/mt8186/mt8186-clk.c
 create mode 100644 sound/soc/sof/mediatek/mt8186/mt8186-clk.h
 create mode 100644 sound/soc/sof/mediatek/mt8186/mt8186-loader.c
 create mode 100644 sound/soc/sof/mediatek/mt8186/mt8186.c
 create mode 100644 sound/soc/sof/mediatek/mt8186/mt8186.h

-- 
2.18.0

