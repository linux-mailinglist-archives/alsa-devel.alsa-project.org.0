Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 33EE53EDD0D
	for <lists+alsa-devel@lfdr.de>; Mon, 16 Aug 2021 20:25:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BF97416A6;
	Mon, 16 Aug 2021 20:24:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BF97416A6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1629138326;
	bh=OGrgb+GAWH1wLfBU//8H8juQZZhyc5q6HiOwBkVEbko=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=KkohdPWZq1cvMDDA6OoqMRpo5PSvw2Y2NH7yYZtzQSNXiMXXhO0jCNDRWAM4zXr+O
	 QtRXyPMtDmSK6dxixcwOcS3vXIS9kLbqAn8gnUkP1/OIVQ8zQV00Y5DWTq42vpEhzG
	 MaxIuBO2yFK+WB+vsai7+dLrM42DY/5gHEH3SwnY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 217A3F80259;
	Mon, 16 Aug 2021 20:23:59 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5BF1AF80249; Mon, 16 Aug 2021 20:23:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=3.0 required=5.0 tests=AC_FROM_MANY_DOTS,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com
 [210.160.252.172])
 by alsa1.perex.cz (Postfix) with ESMTP id 11B68F80134
 for <alsa-devel@alsa-project.org>; Mon, 16 Aug 2021 20:23:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 11B68F80134
X-IronPort-AV: E=Sophos;i="5.84,326,1620658800"; d="scan'208";a="90815948"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
 by relmlie6.idc.renesas.com with ESMTP; 17 Aug 2021 03:23:42 +0900
Received: from localhost.localdomain (unknown [10.226.93.25])
 by relmlir6.idc.renesas.com (Postfix) with ESMTP id 0650440D2C9C;
 Tue, 17 Aug 2021 03:23:39 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Subject: [PATCH] ASoC: sh: rz-ssi: Fix wrong operator used issue
Date: Mon, 16 Aug 2021 19:23:36 +0100
Message-Id: <20210816182336.29959-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
Cc: alsa-devel@alsa-project.org, Geert Uytterhoeven <geert+renesas@glider.be>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 linux-renesas-soc@vger.kernel.org, Mark Brown <broonie@kernel.org>,
 Chris Paterson <Chris.Paterson2@renesas.com>,
 Biju Das <biju.das.jz@bp.renesas.com>, Biju Das <biju.das@bp.renesas.com>
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

Fix wrong operator used issue reported by Coverity by replacing |
operator with & operator.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
Reported-by: Colin Ian King <colin.king@canonical.com>
---
 sound/soc/sh/rz-ssi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/sh/rz-ssi.c b/sound/soc/sh/rz-ssi.c
index 69b45ee2d445..f097c773d413 100644
--- a/sound/soc/sh/rz-ssi.c
+++ b/sound/soc/sh/rz-ssi.c
@@ -368,7 +368,7 @@ static int rz_ssi_stop(struct rz_ssi_priv *ssi, struct rz_ssi_stream *strm)
 	/* Wait for idle */
 	timeout = 100;
 	while (--timeout) {
-		if (rz_ssi_reg_readl(ssi, SSISR) | SSISR_IIRQ)
+		if (rz_ssi_reg_readl(ssi, SSISR) & SSISR_IIRQ)
 			break;
 		udelay(1);
 	}
-- 
2.17.1

