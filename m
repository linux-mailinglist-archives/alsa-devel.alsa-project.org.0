Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D1342666DB
	for <lists+alsa-devel@lfdr.de>; Fri, 11 Sep 2020 19:34:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 97C7E1683;
	Fri, 11 Sep 2020 19:33:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 97C7E1683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1599845660;
	bh=KDucVu9J9Z2oc5rX1Vb+Kqpqe5eI4z3ohhdwuJt43HE=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=iKIXw1nAhW6O8NjX9SagnwI6YygERD77dDAX+ssGGjLi7Zw9L7JAboeMoZ0tUGlXi
	 cPCYiQ2CC0XeeMs+Q2poQgxMY6POtF7IJ3byVaSSZB2dgwlLLyXmPNEw/PslLM1mBz
	 WwmQxYQvyloUEbj46quObgIWnONjPdb1hZhwgdoI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 09D35F802C3;
	Fri, 11 Sep 2020 19:31:57 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 74A83F80240; Fri, 11 Sep 2020 19:31:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2290AF8021C
 for <alsa-devel@alsa-project.org>; Fri, 11 Sep 2020 19:31:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2290AF8021C
X-Originating-IP: 91.224.148.103
Received: from localhost.localdomain (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id C9F351BF205;
 Fri, 11 Sep 2020 17:31:42 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Subject: [PATCH 1/3] ASoC: tlv320aic32x4: Ensure a minimum delay before clock
 stabilization
Date: Fri, 11 Sep 2020 19:31:38 +0200
Message-Id: <20200911173140.29984-2-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200911173140.29984-1-miquel.raynal@bootlin.com>
References: <20200911173140.29984-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>
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

As indicated in the datasheet, a 10ms delay must be observed after
programming the divisors.

The lack of delay prevents the codec to work properly and the playback
appears extremely slow and totally un-audible on a custom sama5 based
board.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 sound/soc/codecs/tlv320aic32x4-clk.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/tlv320aic32x4-clk.c b/sound/soc/codecs/tlv320aic32x4-clk.c
index 156c153c12ab..2f78e6820c75 100644
--- a/sound/soc/codecs/tlv320aic32x4-clk.c
+++ b/sound/soc/codecs/tlv320aic32x4-clk.c
@@ -230,7 +230,14 @@ static int clk_aic32x4_pll_set_rate(struct clk_hw *hw,
 	if (ret < 0)
 		return -EINVAL;
 
-	return clk_aic32x4_pll_set_muldiv(pll, &settings);
+	ret = clk_aic32x4_pll_set_muldiv(pll, &settings);
+	if (ret)
+		return ret;
+
+	/* 10ms is the delay to wait before the clocks are stable */
+	msleep(10);
+
+	return 0;
 }
 
 static int clk_aic32x4_pll_set_parent(struct clk_hw *hw, u8 index)
-- 
2.20.1

