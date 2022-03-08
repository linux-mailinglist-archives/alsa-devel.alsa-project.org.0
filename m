Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F0284D10F2
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Mar 2022 08:27:31 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EAD3F171D;
	Tue,  8 Mar 2022 08:26:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EAD3F171D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646724451;
	bh=BQ9bgyvG4zkx9gZ9Kq/tXnQJMO+3Jh5yqdnegtlogNY=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=QN4r/VR28hGkdkkw6EVCN0N1I7/47jUn83/qxTewd2nQbjnLlatNEDPKg30Zt05x1
	 hqOO/h+AlSEZbdhU5BAM33RdtfWMHbzHxYW0o0jHj+jQxSOExsZdVCM3IWxkk1vj2l
	 D7lD/3ZZyrCw8QZMbsJ4fkouBRoS+NitkFgQ/Zwc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D3678F80520;
	Tue,  8 Mar 2022 08:25:50 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6D21AF8051C; Tue,  8 Mar 2022 08:25:48 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=1.0 required=5.0 tests=RDNS_NONE,SPF_HELO_NONE,
 T_SCC_BODY_TEXT_LINE,UNPARSEABLE_RELAY autolearn=disabled version=3.4.0
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1B3BBF80121
 for <alsa-devel@alsa-project.org>; Tue,  8 Mar 2022 08:24:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1B3BBF80121
X-UUID: 8e0b449563f9494f8ff25ddbc85a45fb-20220308
X-UUID: 8e0b449563f9494f8ff25ddbc85a45fb-20220308
Received: from mtkexhb02.mediatek.inc [(172.21.101.103)] by
 mailgw02.mediatek.com (envelope-from <trevor.wu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 121888610; Tue, 08 Mar 2022 15:24:41 +0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Tue, 8 Mar 2022 15:24:40 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Tue, 8 Mar 2022 15:24:39 +0800
From: Trevor Wu <trevor.wu@mediatek.com>
To: <broonie@kernel.org>, <tiwai@suse.com>, <robh+dt@kernel.org>,
 <matthias.bgg@gmail.com>
Subject: [PATCH 0/5] ASoC: mediatek: Add support for MT8195 sound card with
 max98390 and rt5682
Date: Tue, 8 Mar 2022 15:24:30 +0800
Message-ID: <20220308072435.22460-1-trevor.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 trevor.wu@mediatek.com, yc.hung@mediatek.com, aaronyu@google.com,
 linux-arm-kernel@lists.infradead.org
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

This series of patches adds support for mt8195 board with mt6359, max98390
and rt5682.

Reset controller is included because mt8195 etdm is used to play sound via
max98390 before kernel boot.

In addition, the common part of machine driver is extracted for 
simplification.

Patches are based on broonie tree "for-next" branch.

Trevor Wu (5):
  ASoC: mediatek: mt8195: add reset controller
  dt-bindings: mediatek: mt8195: add reset property
  ASoC: mediatek: mt8195: common code for mt8195 machine driver
  ASoC: mediatek: mt8195: add machine driver with mt6359, max98390 and
    rt5682
  dt-bindings: mediatek: mt8195: add mt8195-mt6359-max98390-rt5682
    document

 .../bindings/sound/mt8195-afe-pcm.yaml        |   10 +
 .../sound/mt8195-mt6359-max98390-rt5682.yaml  |   61 +
 sound/soc/mediatek/Kconfig                    |   16 +
 sound/soc/mediatek/mt8195/Makefile            |   17 +-
 sound/soc/mediatek/mt8195/mt8195-afe-pcm.c    |   16 +
 .../mediatek/mt8195/mt8195-mt6359-common.c    |  398 +++++++
 .../mediatek/mt8195/mt8195-mt6359-common.h    |   30 +
 .../mt8195/mt8195-mt6359-max98390-rt5682.c    | 1058 +++++++++++++++++
 .../mt8195/mt8195-mt6359-rt1011-rt5682.c      |  406 +------
 .../mt8195/mt8195-mt6359-rt1019-rt5682.c      |  409 +------
 10 files changed, 1618 insertions(+), 803 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/sound/mt8195-mt6359-max98390-rt5682.yaml
 create mode 100644 sound/soc/mediatek/mt8195/mt8195-mt6359-common.c
 create mode 100644 sound/soc/mediatek/mt8195/mt8195-mt6359-common.h
 create mode 100644 sound/soc/mediatek/mt8195/mt8195-mt6359-max98390-rt5682.c

-- 
2.18.0

