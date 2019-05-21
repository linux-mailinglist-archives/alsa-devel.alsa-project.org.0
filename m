Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D5FE124B94
	for <lists+alsa-devel@lfdr.de>; Tue, 21 May 2019 11:32:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 69EB11687;
	Tue, 21 May 2019 11:31:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 69EB11687
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1558431148;
	bh=qi4Y5dkXof5S4j0ed38o3xLSPmUL5qu3As2steD+frg=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=nzC1E0KzqgbGNlApCHXPv+dSz98znaXlkJWiFTfIn7YLJaIEftWN/2djgPZnUR8UM
	 j+G7qdO5ji8ZfKHz+PPRwLCSZrkCwQgzgegOVwcAsWIB5wY9aKmEbcNuGrzSNvBGQm
	 ukF1vAVhGej1yHiF8lp4UqGCr6UOTqPc5dUwa+Kg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8552EF89725;
	Tue, 21 May 2019 11:30:07 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 207D4F89707; Tue, 21 May 2019 11:29:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=RDNS_NONE,SPF_HELO_NONE,
 SPF_PASS,UNPARSEABLE_RELAY autolearn=disabled version=3.4.0
Received: from mailgw01.mediatek.com (unknown [210.61.82.183])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CF828F806E7
 for <alsa-devel@alsa-project.org>; Tue, 21 May 2019 11:29:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CF828F806E7
X-UUID: d0773abac2f846758a9b0288926824a7-20190521
X-UUID: d0773abac2f846758a9b0288926824a7-20190521
Received: from mtkcas09.mediatek.inc [(172.21.101.178)] by
 mailgw01.mediatek.com (envelope-from <jiaxin.yu@mediatek.com>)
 (mhqrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1756520352; Tue, 21 May 2019 17:29:43 +0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs06n1.mediatek.inc (172.21.101.129) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Tue, 21 May 2019 17:29:42 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Tue, 21 May 2019 17:29:42 +0800
From: Jiaxin Yu <jiaxin.yu@mediatek.com>
To: <broonie@kernel.org>
Date: Tue, 21 May 2019 17:29:36 +0800
Message-ID: <1558430978-2440-1-git-send-email-jiaxin.yu@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
MIME-Version: 1.0
X-MTK: N
Cc: alsa-devel@alsa-project.org, wsd_upstream@mediatek.com,
 garlic.tseng@mediatek.com, Jiaxin Yu <jiaxin.yu@mediatek.com>,
 tzungbi@google.com, linux-mediatek@lists.infradead.org,
 kaichieh.chuang@mediatek.com
Subject: [alsa-devel] [PATCH 0/2] ASoC: Mediatek: MT8183: fix compile error
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

This patch fixed the compile error which patches for support S32_LE 
and S24_LE.
The patch is based on broonie "for-5.3" branch.

Jiaxin Yu (2):
  ASoC: Mediatek: MT8183: fix compile error
  ASoC: Mediatek: MT8183: fix compile error

 sound/soc/mediatek/common/mtk-afe-fe-dai.c |  3 +--
 sound/soc/mediatek/mt8183/mt8183-afe-pcm.c | 18 +++++++++---------
 2 files changed, 10 insertions(+), 11 deletions(-)

-- 
1.8.1.1.dirty

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
