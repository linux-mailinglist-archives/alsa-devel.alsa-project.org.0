Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8464558A655
	for <lists+alsa-devel@lfdr.de>; Fri,  5 Aug 2022 09:06:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1856C868;
	Fri,  5 Aug 2022 09:05:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1856C868
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1659683176;
	bh=66OA9xKKxMZhYJl3eWwGCyE2aFtY8de5Hq6sHROmrPU=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=SSmMyjMrZtH1hf+tFuPsN24p73uDJojRtJkM6OOicsXery++3fm6zDF8ASc6arMKq
	 Vbh4hMrpWsvXEcJ/af4wGChzcHBK09fG9ngSpNOa36BUOLR+LdSBMpDXDAuKuY6Sb9
	 6chiZH2G4GYINctefqe4g9sM/FBcb5tJMbWbrkSg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9D473F8012F;
	Fri,  5 Aug 2022 09:05:16 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 403E9F8027C; Fri,  5 Aug 2022 09:05:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NO_DNS_FOR_FROM,RDNS_NONE,T_SCC_BODY_TEXT_LINE,
 UNPARSEABLE_RELAY,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B06F2F8013D;
 Fri,  5 Aug 2022 09:05:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B06F2F8013D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com
 header.b="NEh7adWU"
X-UUID: 87523fb0ff0b4102908d1d0899d44ba6-20220805
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=/879l+H3RFGaLmfxga/PuY3eIBIJa84JsBHgmHvRwH4=; 
 b=NEh7adWUFa1pxwxpRwfRhPpVIAXAgNMk1D85jtzfxNGoB8X6F9FOJtwtUWS/iK9Tb+94ZuUks9kJXd/CqDjRmQeG8QXUhZfTKPaxtbeWu1oobfN8nXLSUxV7QN8xFLiS11yyXIFuNjPD0mSf5VjzBybE2lIggr50k1QIysewRJM=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.8, REQID:d7c90f29-705b-44ed-b4d9-6bcb94a686ad, OB:0,
 LO
 B:0,IP:0,URL:5,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
 ON:release,TS:5
X-CID-META: VersionHash:0f94e32, CLOUDID:797cce48-f57f-4088-93dd-066979cdb4e6,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:1,File:nil
 ,QS:nil,BEC:nil,COL:0
X-UUID: 87523fb0ff0b4102908d1d0899d44ba6-20220805
Received: from mtkexhb02.mediatek.inc [(172.21.101.103)] by
 mailgw02.mediatek.com (envelope-from <chunxu.li@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1128453987; Fri, 05 Aug 2022 15:04:57 +0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Fri, 5 Aug 2022 15:04:56 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 5 Aug 2022 15:04:53 +0800
From: Chunxu Li <chunxu.li@mediatek.com>
To: <pierre-louis.bossart@linux.intel.com>, <peter.ujfalusi@linux.intel.com>, 
 <lgirdwood@gmail.com>, <broonie@kernel.org>,
 <angelogioacchino.delregno@collabora.com>, <daniel.baluta@nxp.com>
Subject: [PATCH v2 0/2] Introduce sof_of_machine_select
Date: Fri, 5 Aug 2022 15:04:47 +0800
Message-ID: <20220805070449.6611-1-chunxu.li@mediatek.com>
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

Change since v1:
  - remove the callback of_machine_select defined in sof-priv.h
  - move sof_of_machine_select to common code, and called in
    sof_machine_check
  - rename .board field to .compatible in structure snd_sof_of_mach

In these patches, we introduce function sof_of_machine_select for SOF

Chunxu Li (2):
  ASoC: SOF: Introduce function sof_of_machine_select
  ASoC: SOF: mediatek: Add sof_mt8186_machs for mt8186

 include/sound/sof.h                    |  2 ++
 sound/soc/sof/mediatek/mt8186/mt8186.c |  9 ++++++++
 sound/soc/sof/pcm.c                    |  8 ++++++-
 sound/soc/sof/sof-audio.c              | 30 ++++++++++++++++++++++++++
 sound/soc/sof/sof-of-dev.h             |  7 ++++++
 5 files changed, 55 insertions(+), 1 deletion(-)

-- 
2.25.1

