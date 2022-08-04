Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B5DF35899C8
	for <lists+alsa-devel@lfdr.de>; Thu,  4 Aug 2022 11:15:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 09BEF85D;
	Thu,  4 Aug 2022 11:14:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 09BEF85D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1659604532;
	bh=2VuPPmG545zN0cpnJnouPdYqyoDopZkGjUL2UTQHYdo=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=A5xPd5+awvTwSG2n+mgdR+r9Kf6+p4qtyMyiILm+vxMsrmA38gSEFH1alEoohxCj8
	 RbROKTUy93CqV2SHB1DC8lDujvTJGF1YM6s1T4SsQc+WyoiRblSpyPpTCFw4gVD9/M
	 9C7rIOkYakpwQrIX80vQkiDCfAwUQLRVCW9XYz4E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7F91EF80083;
	Thu,  4 Aug 2022 11:14:34 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 693C0F802DF; Thu,  4 Aug 2022 11:14:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NO_DNS_FOR_FROM,RDNS_NONE,T_SCC_BODY_TEXT_LINE,
 UNPARSEABLE_RELAY,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EA5A4F8013D;
 Thu,  4 Aug 2022 11:14:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EA5A4F8013D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com
 header.b="bbdkB3bl"
X-UUID: 0a585d82a50d47088d980c8316575351-20220804
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=kjOc5b0zHei77TuohXdV+t0J6qAlX7EzPH7UVwUbzug=; 
 b=bbdkB3blVJjEA2qkbZy4G1MYaKRhH3OovvYd2bs4f6x6I6mn6w68CT4U8hwkBOOJz4r9LWlofbgWc2DhGDui69VTrSBUh2xcK3wVYqCtdEOpUpcN9uYRuCU3e2n0db/oTzyj/G2l+FkeB+WlwRRf1rJ5Zp8hI9M8nT7AX12jKuc=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.8, REQID:3d8176cc-4d88-4769-b193-5621907c1cea, OB:0,
 LO
 B:0,IP:0,URL:5,TC:0,Content:0,EDM:0,RT:0,SF:100,FILE:0,RULE:Release_Ham,AC
 TION:release,TS:105
X-CID-INFO: VERSION:1.1.8, REQID:3d8176cc-4d88-4769-b193-5621907c1cea, OB:0,
 LOB:
 0,IP:0,URL:5,TC:0,Content:0,EDM:0,RT:0,SF:100,FILE:0,RULE:Spam_GS981B3D,AC
 TION:quarantine,TS:105
X-CID-META: VersionHash:0f94e32, CLOUDID:cf9847d0-a6cf-4fb6-be1b-c60094821ca2,
 C
 OID:c5126c913861,Recheck:0,SF:28|17|19|48,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:1,File:nil,QS:nil,BEC:nil,COL:0
X-UUID: 0a585d82a50d47088d980c8316575351-20220804
Received: from mtkcas10.mediatek.inc [(172.21.101.39)] by mailgw01.mediatek.com
 (envelope-from <chunxu.li@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1736508669; Thu, 04 Aug 2022 17:14:10 +0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Thu, 4 Aug 2022 17:14:08 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 4 Aug 2022 17:14:07 +0800
From: Chunxu Li <chunxu.li@mediatek.com>
To: <pierre-louis.bossart@linux.intel.com>, <peter.ujfalusi@linux.intel.com>, 
 <lgirdwood@gmail.com>, <broonie@kernel.org>,
 <angelogioacchino.delregno@collabora.com>, <daniel.baluta@nxp.com>
Subject: [PATCH 0/2] ASoC: SOF: Introduce of_machine_select
Date: Thu, 4 Aug 2022 17:13:57 +0800
Message-ID: <20220804091359.31449-1-chunxu.li@mediatek.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Cc: alsa-devel@alsa-project.org, "chunxu.li" <chunxu.li@mediatek.com>,
 tinghan.shen@mediatek.com, linux-kernel@vger.kernel.org,
 project_global_chrome_upstream_group@mediatek.com,
 linux-mediatek@lists.infradead.org, yc.hung@mediatek.com,
 matthias.bgg@gmail.com, linux-arm-kernel@lists.infradead.org,
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

From: "chunxu.li" <chunxu.li@mediatek.com>

In these patches, we introduce of_machine_select for SOF

Chunxu Li (2):
  ASoC: SOF: Introduce optional callback of_machine_select
  ASoC: SOF: mediatek: Add .of_machine_select field for mt8186

 include/sound/sof.h                    |  2 ++
 sound/soc/sof/mediatek/mt8186/mt8186.c | 11 +++++++++++
 sound/soc/sof/ops.h                    |  9 +++++++++
 sound/soc/sof/pcm.c                    |  8 +++++++-
 sound/soc/sof/sof-audio.c              |  7 +++++++
 sound/soc/sof/sof-of-dev.c             | 23 +++++++++++++++++++++++
 sound/soc/sof/sof-of-dev.h             |  8 ++++++++
 sound/soc/sof/sof-priv.h               |  1 +
 8 files changed, 68 insertions(+), 1 deletion(-)

-- 
2.25.1

