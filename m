Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1327A43945C
	for <lists+alsa-devel@lfdr.de>; Mon, 25 Oct 2021 12:57:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0EDD016CF;
	Mon, 25 Oct 2021 12:57:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0EDD016CF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1635159478;
	bh=9I9a9v78vnq/7oll4gqn0eRFoLlDa1wuEceug0t0jZ8=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=sQsSvTDBKNevsQhMIiLj9pEEmI0Xo8N0s4pLBUNMB6lvNExEseH7jKWWtlQ5y0a9/
	 bQdB7lLEeY0GzE21A8HQFylkoFXLlxgxCBrkjDetE3Bowehh7tYdqXO/EOTc6jf+Im
	 4f1J6O0cd4Pj9YtVk802zLGO53oYED9NxbPV5uKI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5A737F8032B;
	Mon, 25 Oct 2021 12:57:07 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7C53BF80271; Mon, 25 Oct 2021 12:57:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=RDNS_NONE,SPF_HELO_NONE,
 SPF_NONE,UNPARSEABLE_RELAY,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 96729F8027B
 for <alsa-devel@alsa-project.org>; Mon, 25 Oct 2021 12:56:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 96729F8027B
X-UUID: 5886615dcb6e4d59b22152d99bffd937-20211025
X-UUID: 5886615dcb6e4d59b22152d99bffd937-20211025
Received: from mtkcas11.mediatek.inc [(172.21.101.40)] by mailgw02.mediatek.com
 (envelope-from <yc.hung@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 766094109; Mon, 25 Oct 2021 18:56:45 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 25 Oct 2021 18:56:44 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Mon, 25 Oct 2021 18:56:44 +0800
From: YC Hung <yc.hung@mediatek.com>
To: <broonie@kernel.org>, <tiwai@suse.com>, <robh+dt@kernel.org>,
 <matthias.bgg@gmail.com>
Subject: [PATCH v3 0/2] Add code to manage DSP clocks and provide dts-binding
 document
Date: Mon, 25 Oct 2021 18:56:33 +0800
Message-ID: <20211025105635.30625-1-yc.hung@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 allen-kh.cheng@mediatek.com, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, trevor.wu@mediatek.com,
 yc.hung@mediatek.com, daniel.baluta@nxp.com,
 linux-arm-kernel@lists.infradead.org, angelogioacchino.delregno@collabora.com
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

From: "yc.hung" <yc.hung@mediatek.com>

This code is based on top of SOF topic/sof-dev branch and we want to have a review 
with ALSA and device Tree communities the it will be merged to SOF tree and then
merged into ALSA tree. It provides two patches, one is for mt8195 dsp clocks related.
Another is for mt8195 dsp dts binding decription.

YC Hung (2):
  ASoC: SOF: mediatek: Add mt8195 dsp clock support
  dt-bindings: dsp: mediatek: Add mt8195 DSP binding support

 .../bindings/dsp/mtk,mt8195-dsp.yaml          | 139 +++++++++++++++
 sound/soc/sof/mediatek/adsp_helper.h          |   2 +-
 sound/soc/sof/mediatek/mt8195/Makefile        |   2 +-
 sound/soc/sof/mediatek/mt8195/mt8195-clk.c    | 163 ++++++++++++++++++
 sound/soc/sof/mediatek/mt8195/mt8195-clk.h    |  28 +++
 sound/soc/sof/mediatek/mt8195/mt8195.c        |  22 ++-
 6 files changed, 352 insertions(+), 4 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/dsp/mtk,mt8195-dsp.yaml
 create mode 100644 sound/soc/sof/mediatek/mt8195/mt8195-clk.c
 create mode 100644 sound/soc/sof/mediatek/mt8195/mt8195-clk.h

-- 
2.18.0

