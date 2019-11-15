Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D0955FDBAC
	for <lists+alsa-devel@lfdr.de>; Fri, 15 Nov 2019 11:48:32 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4879B11C;
	Fri, 15 Nov 2019 11:47:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4879B11C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1573814912;
	bh=pU0qj9cLiE+Dk6U9i5ooQekMKXTcGNFxSzF71F4fK0Y=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=S0vpXYPbmg0BJOLtsGLMpueVFRUP7DvFZqIgzVwf18FhYz3HVgLxi8Kd/kUmE/Pw/
	 3gtVEkLiy8wFOZVCxatytxbVkzgEVk+WTx6rahOCfy7rTUvlbSVBrVvVzbLxKZu5rN
	 nI/Y69F+N2ICyAhAh4nnSq3gmSW6fxCqGMhUXm6I=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8E9CFF80105;
	Fri, 15 Nov 2019 11:46:48 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CA8A6F80103; Fri, 15 Nov 2019 11:46:45 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, MIME_BASE64_TEXT, RDNS_NONE, SPF_HELO_NONE, SPF_PASS,
 SURBL_BLOCKED, 
 UNPARSEABLE_RELAY autolearn=disabled version=3.4.0
Received: from mailgw01.mediatek.com (unknown [210.61.82.183])
 by alsa1.perex.cz (Postfix) with ESMTP id ADE17F8007E
 for <alsa-devel@alsa-project.org>; Fri, 15 Nov 2019 11:46:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ADE17F8007E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com
 header.b="Kr1DaXRh"
X-UUID: 4e8cdbe1277c44a8b64edd28e9994f4c-20191115
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=XvSkp9xVpFWOB3NWQrX4rm3jnrQn3054pdByDxnuQzU=; 
 b=Kr1DaXRhpepMjBPTFzzkJ8Qqq4AmpHM8CVMR5I3IKYkkL+mM3+AFRh8RPaWzP8s6aQAtvMHMLj57UE+kEvGyU7Er2IVt4EoEir36yPnrKQ2c8OUHFJVim+NbNKnbjnoVxWyh7Q61Cu6MpesO+0eM8OfpLmR0929paDEe8X24TIw=;
X-UUID: 4e8cdbe1277c44a8b64edd28e9994f4c-20191115
Received: from mtkmrs01.mediatek.inc [(172.21.131.159)] by
 mailgw01.mediatek.com (envelope-from <eason.yen@mediatek.com>)
 (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
 with ESMTP id 1408849721; Fri, 15 Nov 2019 18:46:35 +0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs08n2.mediatek.inc (172.21.101.56) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Fri, 15 Nov 2019 18:46:29 +0800
Received: from mtksdaap41.mediatek.inc (172.21.77.4) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via
 Frontend Transport; Fri, 15 Nov 2019 18:46:30 +0800
From: Eason Yen <eason.yen@mediatek.com>
To: <broonie@kernel.org>
Date: Fri, 15 Nov 2019 18:46:28 +0800
Message-ID: <1573814790-15057-1-git-send-email-eason.yen@mediatek.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-TM-SNTS-SMTP: 0E10D15F3C201DB86376E220A1CD87BB91925424D676BEC5877C277BBC603FAA2000:8
X-MTK: N
Cc: alsa-devel@alsa-project.org, chipeng.chang@mediatek.com,
 jiaxin.yu@mediatek.com, linux-mediatek@lists.infradead.org,
 eason.yen@mediatek.com, matthias.bgg@gmail.com
Subject: [alsa-devel] [PATCH v2 0/2] ASoC: mediatek: common: refine
	mtk_afe_fe_hw_params
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

This patch is to add more helpers to control mtk_memif dma_address/format/pbuf_size
And refine hw_params and hw_prepare by these helpers.

*** BLURB HERE ***
v2 changes:
  split patch v1 to two seprated patches for different purpose.

v1 changes:
  1. patchwork list:
     https://mailman.alsa-project.org/pipermail/alsa-devel/2019-November/158394.html

Eason Yen (2):
  ASoC: mediatek: common: add some helpers to control mtk_memif
  ASoC: mediatek: common: refine hw_params and hw_prepare

 sound/soc/mediatek/common/mtk-afe-fe-dai.c | 359 +++++++++++++++++++++++------
 sound/soc/mediatek/common/mtk-afe-fe-dai.h |  16 ++
 sound/soc/mediatek/common/mtk-base-afe.h   |  28 ++-
 3 files changed, 336 insertions(+), 67 deletions(-)

-- 
1.9.1
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
