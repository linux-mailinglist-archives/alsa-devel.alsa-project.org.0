Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 15AF5404A74
	for <lists+alsa-devel@lfdr.de>; Thu,  9 Sep 2021 13:46:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B57B716B9;
	Thu,  9 Sep 2021 13:45:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B57B716B9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1631187967;
	bh=AV9wRD9lEMp2Qb/zjeTJnb2M22/TDCzs8tAi3oi+/+Q=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=IhT5UhVeZUDMMCcdPGqpO9qYPRHN+JeDGE9M9sFGpdZcvW9V6eK4gVeqEUY/FG0Ij
	 hz4PHcWWUO5gH1U1C+hm0a0ttrR/5sTtHXWnNTiBK/61D0W0k1qSEEiVAgl3bN32SY
	 PgRrueIXrHchpVZZOJsE7/E8ZhMaEZJvU5rIOUn0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CE5E1F80224;
	Thu,  9 Sep 2021 13:45:11 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C5A56F802DF; Thu,  9 Sep 2021 13:45:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 01C62F800FC
 for <alsa-devel@alsa-project.org>; Thu,  9 Sep 2021 13:45:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 01C62F800FC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="nBNnfYx7"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7B9F7613A7;
 Thu,  9 Sep 2021 11:44:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1631187900;
 bh=AV9wRD9lEMp2Qb/zjeTJnb2M22/TDCzs8tAi3oi+/+Q=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=nBNnfYx74BMsC9aStgnCqbnoRWlxitjegf1CLbwOp0mwn+PxFVsSRJ0nVqOXo/Y7Y
 RPSS8FaR2RznpAnEXrlp+0ak4376f4sws36iHYq07SU/53imA9EK5/8HDn7ooyUZFK
 av4feSlSTMXNlTG/5RlBFwQNJMm7nVcRv/zhqS/1LWAb4Mro06rSDqAuTuDXx/v5VD
 6V4v4GMsThw/hrLKW6mfOw6Paicr2Tb7CCU1ypIzfluBPsdhj2womyiQa0AbQnjJw2
 /TqHFCp5CUQ5AsPSUJiwL9GuKsnQzVDXDr7Zpbcpsb6AAGf9En9g4casx+zXDzAlEc
 dUfLCmoSPFZSw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.14 179/252] ASoC: rsnd: adg: clearly handle clock
 error / NULL case
Date: Thu,  9 Sep 2021 07:39:53 -0400
Message-Id: <20210909114106.141462-179-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210909114106.141462-1-sashal@kernel.org>
References: <20210909114106.141462-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Cc: Sasha Levin <sashal@kernel.org>, alsa-devel@alsa-project.org,
 Mark Brown <broonie@kernel.org>, Dan Carpenter <dan.carpenter@oracle.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
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

From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

[ Upstream commit cc64c390b215b404524725a94857d6fb58d9a62a ]

This driver is assuming that all adg->clk[i] is not NULL.
Because of this prerequisites, for_each_rsnd_clk() is possible to work
for all clk without checking NULL. In other words, all adg->clk[i]
should not NULL.

Some SoC might doesn't have clk_a/b/c/i. devm_clk_get() returns error in
such case. This driver calls rsnd_adg_null_clk_get() and use null_clk
instead of NULL in such cases.

But devm_clk_get() might returns NULL even though such clocks exist, but
it doesn't mean error (user deliberately chose to disable the feature).
NULL clk itself is not error from clk point of view, but is error from
this driver point of view because it is not assuming such case.

But current code is using IS_ERR() which doesn't care NULL.
This driver uses IS_ERR_OR_NULL() instead of IS_ERR() for clk check.
And it uses ERR_CAST() to clarify null_clk error.

One concern here is that it unconditionally uses null_clk if clk_a/b/c/i
was error. It is correct if it doesn't exist, but is not correct if it
returns error even though it exist.
It needs to check "clock-names" from DT before calling devm_clk_get() to
handling such case. But let's assume it is overkill so far.

Link: https://lore.kernel.org/r/YMCmhfQUimHCSH/n@mwanda
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Link: https://lore.kernel.org/r/87v940wyf9.wl-kuninori.morimoto.gx@renesas.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/sh/rcar/adg.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/sound/soc/sh/rcar/adg.c b/sound/soc/sh/rcar/adg.c
index 0ebee1ed06a9..5f1e72edfee0 100644
--- a/sound/soc/sh/rcar/adg.c
+++ b/sound/soc/sh/rcar/adg.c
@@ -391,9 +391,9 @@ static struct clk *rsnd_adg_create_null_clk(struct rsnd_priv *priv,
 	struct clk *clk;
 
 	clk = clk_register_fixed_rate(dev, name, parent, 0, 0);
-	if (IS_ERR(clk)) {
+	if (IS_ERR_OR_NULL(clk)) {
 		dev_err(dev, "create null clk error\n");
-		return NULL;
+		return ERR_CAST(clk);
 	}
 
 	return clk;
@@ -430,9 +430,9 @@ static int rsnd_adg_get_clkin(struct rsnd_priv *priv)
 	for (i = 0; i < CLKMAX; i++) {
 		clk = devm_clk_get(dev, clk_name[i]);
 
-		if (IS_ERR(clk))
+		if (IS_ERR_OR_NULL(clk))
 			clk = rsnd_adg_null_clk_get(priv);
-		if (IS_ERR(clk))
+		if (IS_ERR_OR_NULL(clk))
 			goto err;
 
 		adg->clk[i] = clk;
@@ -582,7 +582,7 @@ static int rsnd_adg_get_clkout(struct rsnd_priv *priv)
 	if (!count) {
 		clk = clk_register_fixed_rate(dev, clkout_name[CLKOUT],
 					      parent_clk_name, 0, req_rate[0]);
-		if (IS_ERR(clk))
+		if (IS_ERR_OR_NULL(clk))
 			goto err;
 
 		adg->clkout[CLKOUT] = clk;
@@ -596,7 +596,7 @@ static int rsnd_adg_get_clkout(struct rsnd_priv *priv)
 			clk = clk_register_fixed_rate(dev, clkout_name[i],
 						      parent_clk_name, 0,
 						      req_rate[0]);
-			if (IS_ERR(clk))
+			if (IS_ERR_OR_NULL(clk))
 				goto err;
 
 			adg->clkout[i] = clk;
-- 
2.30.2

