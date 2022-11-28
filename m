Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 345CB63AF6C
	for <lists+alsa-devel@lfdr.de>; Mon, 28 Nov 2022 18:42:02 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 730961713;
	Mon, 28 Nov 2022 18:41:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 730961713
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1669657320;
	bh=PAxi6eeJkAJBPTiO6t6sK57HyXc9bdfpzD8eQdRXDQ4=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=kJWd6Av6PILchiuUEhr4C6G5VoHOIHKZtVW1csgEd1H9mmZEY42gzCcCo4C03O5Gg
	 LM57Kix+FwGBY9caI7Ik9rWBWNNlSLC+Czh3x5BPG2q2R311d5BZD8IrOaZlI7CBud
	 E8dGdUqIdq8JBnTxPXIH1IJMbJLwZDh4Yu83JSQc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 29D79F8053D;
	Mon, 28 Nov 2022 18:41:10 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6EA49F80557; Mon, 28 Nov 2022 18:41:08 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_DNSWL_HI,RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,
 SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS
 autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C5BF2F801D8
 for <alsa-devel@alsa-project.org>; Mon, 28 Nov 2022 18:41:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C5BF2F801D8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Zpmmo0XW"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 9FBA0612D2;
 Mon, 28 Nov 2022 17:41:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B187C43470;
 Mon, 28 Nov 2022 17:40:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1669657259;
 bh=PAxi6eeJkAJBPTiO6t6sK57HyXc9bdfpzD8eQdRXDQ4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Zpmmo0XWD03iRQhJiAN7FX2l+jo3CTEWSzMvV7ND5QyeNlp8S1L1AeHOa94aGtBVj
 ysAgr+j3gd2HS0mzOyf3m9BWj75FtSfbBzT+vjHNPofx7qPs6hEx6/pbd6tP5MCF69
 ONfhoXSdvdk53bh7/3+Z6Gr2fs1gogaOCZHNGBPD75oPJPbJjKYodERZ8WB/Lso1Ud
 /ZJzZAe1Od/b8NwZFGK8eIopz3F/HiNU9WElRUuGJci4/uIwB0DgiLfuFDvKBshZ7v
 27jZ6pxyYAe7OU8gcHdWBgtU+0fDWeB4Emx/DCGxByc7RVzo55fCHlLPjbEV6LwaQ9
 z9tZjwyne+9ow==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.15 13/24] ASoC: rt711-sdca: fix the latency time of
 clock stop prepare state machine transitions
Date: Mon, 28 Nov 2022 12:40:13 -0500
Message-Id: <20221128174027.1441921-13-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221128174027.1441921-1-sashal@kernel.org>
References: <20221128174027.1441921-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Cc: Sasha Levin <sashal@kernel.org>, oder_chiou@realtek.com,
 alsa-devel@alsa-project.org, tiwai@suse.com, lgirdwood@gmail.com,
 Mark Brown <broonie@kernel.org>, Shuming Fan <shumingf@realtek.com>
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

From: Shuming Fan <shumingf@realtek.com>

[ Upstream commit c7d7d4e7bb1290cc473610b0bb96d9fa606d00e7 ]

Due to the hardware behavior, it takes some time for CBJ detection/impedance sensing/de-bounce.
The ClockStop_NotFinished flag will be raised until these functions are completed.
In ClockStopMode0 mode case, the SdW controller might check this flag from D3 to D0 when the
jack detection interrupt happened.

Signed-off-by: Shuming Fan <shumingf@realtek.com>
Link: https://lore.kernel.org/r/20221116090318.5017-1-shumingf@realtek.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/codecs/rt711-sdca-sdw.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/rt711-sdca-sdw.c b/sound/soc/codecs/rt711-sdca-sdw.c
index a085b2f530aa..31e77d462ef3 100644
--- a/sound/soc/codecs/rt711-sdca-sdw.c
+++ b/sound/soc/codecs/rt711-sdca-sdw.c
@@ -230,7 +230,7 @@ static int rt711_sdca_read_prop(struct sdw_slave *slave)
 	}
 
 	/* set the timeout values */
-	prop->clk_stop_timeout = 20;
+	prop->clk_stop_timeout = 700;
 
 	/* wake-up event */
 	prop->wake_capable = 1;
-- 
2.35.1

