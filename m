Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 864BE99444
	for <lists+alsa-devel@lfdr.de>; Thu, 22 Aug 2019 14:53:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ECCE71689;
	Thu, 22 Aug 2019 14:52:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ECCE71689
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1566478394;
	bh=G6Zsxt+dME3tDH3TIaXG3cpm34gw1JSrNjMUUh4j/Wk=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=QCOeadZDgmXDfgZGiKCk4TjLpzRImHC16tymW4s5zAafPSlIIteM4mD3R0OdzOwtl
	 JkPqjnGEOJsR6oD1NfqxCQ6voLsTJRWNJz6zwPembqLtFD1MFwDQoykXNjcvhKCahF
	 8/hk75N8voTI/9iMJ6awc0d/5uiy7kcQETGxyl6o=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5174CF8036E;
	Thu, 22 Aug 2019 14:51:31 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CD230F80391; Thu, 22 Aug 2019 14:51:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=RDNS_NONE,SPF_HELO_NONE,
 SPF_PASS,UNPARSEABLE_RELAY autolearn=disabled version=3.4.0
Received: from mailgw01.mediatek.com (unknown [210.61.82.183])
 by alsa1.perex.cz (Postfix) with ESMTP id A0063F80147
 for <alsa-devel@alsa-project.org>; Thu, 22 Aug 2019 14:51:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A0063F80147
X-UUID: 6661e146c4b249d5a986497cdf198d80-20190822
X-UUID: 6661e146c4b249d5a986497cdf198d80-20190822
Received: from mtkcas09.mediatek.inc [(172.21.101.178)] by
 mailgw01.mediatek.com (envelope-from <jiaxin.yu@mediatek.com>)
 (Cellopoint E-mail Firewall v4.1.10 Build 0707 with TLS)
 with ESMTP id 319058252; Thu, 22 Aug 2019 20:51:12 +0800
Received: from mtkcas09.mediatek.inc (172.21.101.178) by
 mtkmbs01n1.mediatek.inc (172.21.101.68) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Thu, 22 Aug 2019 20:51:06 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas09.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Thu, 22 Aug 2019 20:50:59 +0800
From: Jiaxin Yu <jiaxin.yu@mediatek.com>
To: <broonie@kernel.org>
Date: Thu, 22 Aug 2019 20:50:59 +0800
Message-ID: <1566478261-13464-1-git-send-email-jiaxin.yu@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
MIME-Version: 1.0
X-MTK: N
Cc: alsa-devel@alsa-project.org, ck.hu@medaitek.com, lgirdwood@gmail.com,
 jiaxin.yu@mediatek.com, tzungbi@google.com, linux-mediatek@lists.infradead.org,
 eason.yen@mediatek.com
Subject: [alsa-devel] [PATCH 0/2] ASoC: MediaTek: fix mt8183-mt6358 tdm out
	issues
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

These two patches are used to fix several issues related to TDM OUT.
The patches are based on broonie tre "for-next" branch.

Jiaxin Yu (2):
  ASoC: mediatek: mt8183: switch tdm pins gpio function when playback on
    or off
  ASoC: mediatek: mt8183: fix tdm out issue

 sound/soc/mediatek/common/mtk-afe-fe-dai.c         |   3 +-
 sound/soc/mediatek/mt8183/mt8183-dai-tdm.c         | 177 +++++++++++++++++----
 .../mt8183/mt8183-mt6358-ts3a227-max98357.c        | 118 +++++++++++++-
 sound/soc/mediatek/mt8183/mt8183-reg.h             |   8 +-
 4 files changed, 261 insertions(+), 45 deletions(-)

-- 
1.8.1.1.dirty

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
