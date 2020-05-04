Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CF26A1C33CE
	for <lists+alsa-devel@lfdr.de>; Mon,  4 May 2020 09:43:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7A7CA16D4;
	Mon,  4 May 2020 09:42:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7A7CA16D4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1588578204;
	bh=pcKozLi9X/YAm6pOAYTTf2juJDEqhd+HiZiYM4nyk8k=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=bsbc+OxE8+HbQ7DCaWhVBhjawa+lIzziwChYRhYTFJcDs6Pn/2Zpb2gsMlhz8YXPD
	 X9VND4xCI3FiISxuruXqW7jwBP0D5kEAERSu1CbsCHUEx78W+s84SqLihBofy3s/tv
	 LXee6t4Vnu8MIyuofq5moo1agMsQBMFaZ6nGdfvE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 125A7F80292;
	Mon,  4 May 2020 09:41:06 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4DBCEF80291; Mon,  4 May 2020 09:41:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 47200F800EE
 for <alsa-devel@alsa-project.org>; Mon,  4 May 2020 09:40:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 47200F800EE
Authenticated-By: 
X-SpamFilter-By: ArmorX SpamTrap 5.69 with qID 0447efWR3010031,
 This message is accepted by code: ctloc85258
Received: from mail.realtek.com (rtexmb06.realtek.com.tw[172.21.6.99])
 by rtits2.realtek.com.tw (8.15.2/2.66/5.86) with ESMTPS id 0447efWR3010031
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Mon, 4 May 2020 15:40:41 +0800
Received: from RTEXMB01.realtek.com.tw (172.21.6.94) by
 RTEXMB06.realtek.com.tw (172.21.6.99) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1779.2; Mon, 4 May 2020 15:40:41 +0800
Received: from localhost.localdomain (172.22.102.1) by RTEXMB01.realtek.com.tw
 (172.21.6.94) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1779.2; Mon, 4 May 2020
 15:40:40 +0800
From: Oder Chiou <oder_chiou@realtek.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>
Subject: [PATCH 1/2] ASoC: rt1308: Revise the devicetree file mode
Date: Mon, 4 May 2020 15:40:06 +0800
Message-ID: <20200504074007.13002-1-oder_chiou@realtek.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.22.102.1]
X-ClientProxiedBy: RTEXMB05.realtek.com.tw (172.21.6.98) To
 RTEXMB01.realtek.com.tw (172.21.6.94)
Cc: Oder Chiou <oder_chiou@realtek.com>, jack.yu@realtek.com,
 alsa-devel@alsa-project.org, derek.fang@realtek.com, shumingf@realtek.com,
 flove@realtek.com
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

The patch changes the devicetree file mode correctly.

Signed-off-by: Oder Chiou <oder_chiou@realtek.com>
---
 Documentation/devicetree/bindings/sound/rt1308.txt | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 mode change 100755 => 100644 Documentation/devicetree/bindings/sound/rt1308.txt

diff --git a/Documentation/devicetree/bindings/sound/rt1308.txt b/Documentation/devicetree/bindings/sound/rt1308.txt
old mode 100755
new mode 100644
-- 
2.25.1

