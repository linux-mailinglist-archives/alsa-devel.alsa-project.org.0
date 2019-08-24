Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A4469BBD3
	for <lists+alsa-devel@lfdr.de>; Sat, 24 Aug 2019 06:47:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0248A74C;
	Sat, 24 Aug 2019 06:46:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0248A74C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1566622022;
	bh=r8TL+hVfDVZOyRruEjffhcTzHF76NI4Js55/uGolmzk=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=s+dJ49nm7zpU8vMo39OBF/umzVUiwYy+h39tDnItV75tvY54o1oyya2Da9ZfTTZVB
	 6s6WfR0bLwVpcfAp7MOktqvTp7zG3XUa0CTH0Bcl45ErRLe9C9k/Q3UWJsxIhE8LCd
	 AnZPcn5OqUNmpCAf8euMRX28Go8SAgL+uj/IdzXw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AFEE5F803D5;
	Sat, 24 Aug 2019 06:45:36 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A6602F8036E; Sat, 24 Aug 2019 06:45:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=RDNS_NONE,SPF_HELO_NONE,
 SPF_PASS,UNPARSEABLE_RELAY autolearn=disabled version=3.4.0
Received: from mailgw01.mediatek.com (unknown [210.61.82.183])
 by alsa1.perex.cz (Postfix) with ESMTP id 298ADF80145
 for <alsa-devel@alsa-project.org>; Sat, 24 Aug 2019 06:45:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 298ADF80145
X-UUID: f2f2c70af7634b099e7739de1b7d56ca-20190824
X-UUID: f2f2c70af7634b099e7739de1b7d56ca-20190824
Received: from mtkexhb01.mediatek.inc [(172.21.101.102)] by
 mailgw01.mediatek.com (envelope-from <jiaxin.yu@mediatek.com>)
 (Cellopoint E-mail Firewall v4.1.10 Build 0707 with TLS)
 with ESMTP id 1250258858; Sat, 24 Aug 2019 12:39:15 +0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs01n1.mediatek.inc (172.21.101.68) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Sat, 24 Aug 2019 12:39:03 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Sat, 24 Aug 2019 12:37:45 +0800
From: Jiaxin Yu <jiaxin.yu@mediatek.com>
To: <broonie@kernel.org>
Date: Sat, 24 Aug 2019 12:37:22 +0800
Message-ID: <1566621445-26989-1-git-send-email-jiaxin.yu@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
MIME-Version: 1.0
X-MTK: N
Cc: alsa-devel@alsa-project.org, lgirdwood@gmail.com, jiaxin.yu@mediatek.com,
 tzungbi@google.com, linux-mediatek@lists.infradead.org, eason.yen@mediatek.com
Subject: [alsa-devel] [PATCH v2 0/3] ASoC: mediatek: mt8183: fix
	mt8183-mt6358 tdm out issues
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


v2: 
	1. Base on branch asoc-next that merged branch 'asoc-5.4'.
	2. Split the PATCH 2/2 that in v1 into three patches.

v1: 
	1. Base on branch asoc-next that merged branch 'asoc-5.3'.
	2. Mark suggest the patch would be split up into separate patches,
	   each fixing single issue.
	3. PATCH 1/2 has been applied to the asoc tree 'asoc-5.4'.

Jiaxin Yu (3):
  ASoC: mediatek: mt8183: fix tdm out data align issue
  ASoC: mediatek: mt8183: tdm hw support tdm out and 8ch i2s out
  ASoC: mediatek: mt8183: fix tdm out data is valid on rising edge

 sound/soc/mediatek/common/mtk-afe-fe-dai.c    |   3 +-
 sound/soc/mediatek/mt8183/mt8183-dai-tdm.c    | 177 ++++++++++++++----
 .../mt8183/mt8183-mt6358-ts3a227-max98357.c   |   3 +
 sound/soc/mediatek/mt8183/mt8183-reg.h        |   8 +-
 4 files changed, 152 insertions(+), 39 deletions(-)

-- 
2.18.0

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
