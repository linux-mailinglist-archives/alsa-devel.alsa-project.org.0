Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 906E954A51F
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Jun 2022 04:14:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3E32218B8;
	Tue, 14 Jun 2022 04:13:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3E32218B8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655172844;
	bh=4seMafuumCFqNw+bDTbGN5XERJrkspwfxmcEylUX7QY=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=G9AW/Iy0CQ8FD4TA9vLbqlyb6MJtCOPSZ2em7wntyMC2b2rRDtzP4E+9lQscXRLOv
	 VMUBUkCgHUK+xKahsrn5j5RBlXnUZ/vXnxTgBp04WRHT3jhInKWb30r6vLqJ3PLAJ8
	 KwxvfKq9lncbo//juXyJRJ1Cgmmg+z5MxWhBtWCw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 279DBF805ED;
	Tue, 14 Jun 2022 04:07:36 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DAEF7F805EB; Tue, 14 Jun 2022 04:07:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6E60AF8053D
 for <alsa-devel@alsa-project.org>; Tue, 14 Jun 2022 04:07:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6E60AF8053D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="DAX+vGGh"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 11C92B8168A;
 Tue, 14 Jun 2022 02:07:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92714C385A2;
 Tue, 14 Jun 2022 02:07:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1655172442;
 bh=4seMafuumCFqNw+bDTbGN5XERJrkspwfxmcEylUX7QY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=DAX+vGGhlo34Eh9VR0dukyTGBEaiZyplLL3xjBuRnXazDejsMAot8SLCKL2fQTJNG
 WULweSdXbdce5wjhj6h3lFK7p3wFo69oyGmLLZeEVJcFnyPtTGjH85ac0ErNde2bas
 ifQvczgFoxc3vBUdzWF1wc14aY15eRChPeuPbRWzJFuNIo+7XlS1IbYBbkjd+VY28X
 lc85T7rGdbRgSV2ekCAYuS0IGW0r3noKPWBhOTkRZuzjSTGU5/xpd5XJNEShZA7iWr
 FrmR6URhuwefsXQmHxrCl9v07NSmv8yywg3Xaes2vc99v8J7yMsJKnGfnqM355Bx8k
 skC1sjF70klnQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.15 08/41] ASoC: cs35l36: Update digital volume TLV
Date: Mon, 13 Jun 2022 22:06:33 -0400
Message-Id: <20220614020707.1099487-8-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220614020707.1099487-1-sashal@kernel.org>
References: <20220614020707.1099487-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Cc: Sasha Levin <sashal@kernel.org>, brian.austin@cirrus.com,
 Charles Keepax <ckeepax@opensource.cirrus.com>, alsa-devel@alsa-project.org,
 tiwai@suse.com, lgirdwood@gmail.com, Paul.Handrigan@cirrus.com,
 Mark Brown <broonie@kernel.org>
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

From: Charles Keepax <ckeepax@opensource.cirrus.com>

[ Upstream commit 5005a2345825eb8346546d99bfe669f73111b5c5 ]

The digital volume TLV specifies the step as 0.25dB but the actual step
of the control is 0.125dB. Update the TLV to correct this.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
Link: https://lore.kernel.org/r/20220602162119.3393857-3-ckeepax@opensource.cirrus.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/codecs/cs35l36.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/cs35l36.c b/sound/soc/codecs/cs35l36.c
index d83c1b318c1c..0accdb45ed72 100644
--- a/sound/soc/codecs/cs35l36.c
+++ b/sound/soc/codecs/cs35l36.c
@@ -444,7 +444,8 @@ static bool cs35l36_volatile_reg(struct device *dev, unsigned int reg)
 	}
 }
 
-static DECLARE_TLV_DB_SCALE(dig_vol_tlv, -10200, 25, 0);
+static const DECLARE_TLV_DB_RANGE(dig_vol_tlv, 0, 912,
+				  TLV_DB_MINMAX_ITEM(-10200, 1200));
 static DECLARE_TLV_DB_SCALE(amp_gain_tlv, 0, 1, 1);
 
 static const char * const cs35l36_pcm_sftramp_text[] =  {
-- 
2.35.1

