Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E52524E5E43
	for <lists+alsa-devel@lfdr.de>; Thu, 24 Mar 2022 06:40:17 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8433716A6;
	Thu, 24 Mar 2022 06:39:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8433716A6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1648100417;
	bh=QYXuX0WMBET/2e/3ElgS8A3KwaSResO7+GWCFe4w+SU=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=CgW13pug0BZseV1UrOux3qdW8HHDtTt+Avl1y+F/mprKE3/Uvnw99cy4RuFxgwfgW
	 LT5pZ0kjqoxyMo1RLkfJEm4Xtp9Q5VtdACxTAegUgSFtv8TX7E9SygbwyHK5QR77b6
	 LuoBAiKQV3RazABXb8O8G7vj05IZjTfLnAd4pTIs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DDFACF80516;
	Thu, 24 Mar 2022 06:39:11 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1116AF80139; Thu, 24 Mar 2022 06:39:08 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=1.0 required=5.0 tests=RDNS_NONE,SPF_HELO_NONE,
 SPF_NONE,T_SCC_BODY_TEXT_LINE,UNPARSEABLE_RELAY autolearn=disabled
 version=3.4.0
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8FD43F80139
 for <alsa-devel@alsa-project.org>; Thu, 24 Mar 2022 06:39:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8FD43F80139
X-UUID: ba22f226372e49a3ac08b383e9f021dc-20220324
X-UUID: ba22f226372e49a3ac08b383e9f021dc-20220324
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by
 mailgw01.mediatek.com (envelope-from <trevor.wu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 392250870; Thu, 24 Mar 2022 13:38:56 +0800
Received: from mtkexhb01.mediatek.inc (172.21.101.102) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 24 Mar 2022 13:38:54 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by mtkexhb01.mediatek.inc
 (172.21.101.102) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Thu, 24 Mar 2022 13:38:54 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 24 Mar 2022 13:38:54 +0800
From: Trevor Wu <trevor.wu@mediatek.com>
To: <broonie@kernel.org>, <tiwai@suse.com>, <robh+dt@kernel.org>,
 <matthias.bgg@gmail.com>
Subject: [PATCH v4 0/6] ASoC: mediatek: Add support for MT8195 sound card with
 max98390 and rt5682
Date: Thu, 24 Mar 2022 13:38:45 +0800
Message-ID: <20220324053851.27350-1-trevor.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, tzungbi@google.com, miles.chen@mediatek.com,
 linux-mediatek@lists.infradead.org, trevor.wu@mediatek.com,
 yc.hung@mediatek.com, aaronyu@google.com, linux-arm-kernel@lists.infradead.org,
 angelogioacchino.delregno@collabora.com
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

To prevent from copy-paste components, mt8195 machine drivers and 
dt-bindings are merged in the patch.

Patches are based on broonie tree "for-next" branch.

Changes since v3:
  - apply some suggested changes from reviewers

Changes since v2:
  - split "merge machine driver" into two parts for better understanding

Changes since v1:
  - remove merged patches about reset controller
  - propose a common machine driver instead of machine driver common code
  - propose a common dt-bindings for mt8195 sound card

Trevor Wu (6):
  ASoC: mediatek: mt8195: revise mt8195-mt6359-rt1019-rt5682.c
  ASoC: mediatek: mt8195: merge machine driver
  ASoC: dt-bindings: mediatek: mt8195: merge mt8195 machine yaml
  ASoC: mediatek: mt8195: rename card controls
  ASoC: mediatek: mt8195: add machine support for max98390 and rt5682
  ASoC: dt-bindings: mediatek: mt8195: support
    mt8195-mt6359-max98390-rt5682

 .../sound/mt8195-mt6359-rt1011-rt5682.yaml    |   51 -
 ...-rt1019-rt5682.yaml => mt8195-mt6359.yaml} |    9 +-
 sound/soc/mediatek/Kconfig                    |   26 +-
 sound/soc/mediatek/mt8195/Makefile            |    3 +-
 .../mt8195/mt8195-mt6359-rt1011-rt5682.c      | 1198 -----------------
 ...mt6359-rt1019-rt5682.c => mt8195-mt6359.c} |  862 +++++++-----
 6 files changed, 566 insertions(+), 1583 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/sound/mt8195-mt6359-rt1011-rt5682.yaml
 rename Documentation/devicetree/bindings/sound/{mt8195-mt6359-rt1019-rt5682.yaml => mt8195-mt6359.yaml} (84%)
 delete mode 100644 sound/soc/mediatek/mt8195/mt8195-mt6359-rt1011-rt5682.c
 rename sound/soc/mediatek/mt8195/{mt8195-mt6359-rt1019-rt5682.c => mt8195-mt6359.c} (78%)

-- 
2.18.0

