Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 026EF462C49
	for <lists+alsa-devel@lfdr.de>; Tue, 30 Nov 2021 06:41:11 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5EB531F07;
	Tue, 30 Nov 2021 06:40:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5EB531F07
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1638250869;
	bh=qv0QKWe1t1U2n+bd7b9coUdL/q7VdFMZYW7J9AHCxhs=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=FOm+x1huT1xxJPy4Sri0kvYfAOkBaZFkcNhTKFbYp9jnpaawWNsxYSiGzHcdxo1N/
	 apGDRjl0N34EBA1Lq1MtaWqsI3hY80GWd1bfEpN5GlEFRimb3sefmwJI/1gJ5hmhSI
	 KnBfrJQUBg5vfS+cXnFf9F5Xr8fRbIEpb8v+Tkhs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 90ABFF804F1;
	Tue, 30 Nov 2021 06:39:31 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7A5EFF802E0; Tue, 30 Nov 2021 06:39:26 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=RDNS_NONE,SPF_HELO_NONE,
 SPF_NONE,UNPARSEABLE_RELAY autolearn=disabled version=3.4.0
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 79047F8028D
 for <alsa-devel@alsa-project.org>; Tue, 30 Nov 2021 06:39:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 79047F8028D
X-UUID: 1f360361fbe74e1d9620dd415c113adc-20211130
X-UUID: 1f360361fbe74e1d9620dd415c113adc-20211130
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by
 mailgw02.mediatek.com (envelope-from <trevor.wu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 868584682; Tue, 30 Nov 2021 13:39:09 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 30 Nov 2021 13:39:07 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Tue, 30 Nov 2021 13:39:07 +0800
From: Trevor Wu <trevor.wu@mediatek.com>
To: <broonie@kernel.org>, <tiwai@suse.com>, <robh+dt@kernel.org>,
 <matthias.bgg@gmail.com>
Subject: [PATCH 0/2] ASoC: mediatek: support memory-region assignment
Date: Tue, 30 Nov 2021 13:39:03 +0800
Message-ID: <20211130053905.28470-1-trevor.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 trevor.wu@mediatek.com, yc.hung@mediatek.com,
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

This series of patches adds support for memory-region assignment, so the 
access region of DMA engine could be restricted.
Patches are based on broonie tree "for-next" branch.

Trevor Wu (2):
  ASoC: mediatek: mt8195: support reserved memory assignment
  dt-bindings: mediatek: mt8195: add memory-region property

 .../devicetree/bindings/sound/mt8195-afe-pcm.yaml         | 8 ++++++++
 sound/soc/mediatek/mt8195/mt8195-afe-pcm.c                | 7 +++++++
 2 files changed, 15 insertions(+)

-- 
2.18.0

