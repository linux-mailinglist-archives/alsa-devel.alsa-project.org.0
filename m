Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DE4D592389
	for <lists+alsa-devel@lfdr.de>; Sun, 14 Aug 2022 18:23:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0B4821633;
	Sun, 14 Aug 2022 18:22:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0B4821633
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1660494181;
	bh=HsE6Hc1g0L5kt8Rb3CEnOB/34WTJkVgtm0Yx9+swGaY=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=O6aqwvcvzko7G0ThplwcFpT9xDjcXId6oD6MZhFXvHvoPdIPZd2t2VTNUazMRjqno
	 n780LaUWE2jPkkIiJzRWpnqhpbWz3YQQ9y2dHYjgoXdndgDsOcO4o7yIjV7eQkOnUR
	 gaSo2v0Yv8Steh25wS+vlorqvUlaGIn5FLFe/1yY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DD932F80551;
	Sun, 14 Aug 2022 18:20:36 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 94BA9F8057D; Sun, 14 Aug 2022 18:20:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4A323F80551
 for <alsa-devel@alsa-project.org>; Sun, 14 Aug 2022 18:20:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4A323F80551
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="XUyOpqDi"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id DDD2C60F49;
 Sun, 14 Aug 2022 16:20:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F396EC433C1;
 Sun, 14 Aug 2022 16:20:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1660494027;
 bh=HsE6Hc1g0L5kt8Rb3CEnOB/34WTJkVgtm0Yx9+swGaY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=XUyOpqDiEwfTn1QCmkS//+t9YxiBXvWn6CTSAhwScMOjp1voIKaTn7DzFLPo/Cs+X
 u7GUm5N83C8uOeCPQaeNijO/yKEv1Ub3TDbjpcQMDH+9j7IeK3UXyxo++N9+ui5UR2
 9YMXvfLkxRDcK7dWUYPU6W+oGJ6ls8VvRqoZbfsFU1jQ2fumoCt7MvEGp4eTqwwH2t
 kRaBD0ip4gRyOh3mW46lfCnjeSh65aP6qVDs1kyr676m8yzMWNzwNQrmS7VnTzb7zH
 8nnaXchbPKIA0vK/t6PasNqj5FNuFN5zLGC+aH5SNAkpfAKSnD76Wl+0cVqGqQhUU8
 YhhZfv35GbkKQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.19 15/48] ASoC: rsnd: care default case on
 rsnd_ssiu_busif_err_irq_ctrl()
Date: Sun, 14 Aug 2022 12:19:08 -0400
Message-Id: <20220814161943.2394452-15-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220814161943.2394452-1-sashal@kernel.org>
References: <20220814161943.2394452-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Cc: Sasha Levin <sashal@kernel.org>, alsa-devel@alsa-project.org,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Nguyen Bao Nguyen <nguyen.nguyen.yj@renesas.com>, tiwai@suse.com,
 lgirdwood@gmail.com, Mark Brown <broonie@kernel.org>,
 Nishiyama Kunihiko <kunihiko.nishiyama.dn@renesas.com>
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

[ Upstream commit ef30911d3c39fd57884c348c29b9cbff88def155 ]

Before, ssiu.c didn't care SSI5-8, thus,
commit b1384d4c95088d0 ("ASoC: rsnd: care default case on
rsnd_ssiu_busif_err_status_clear()") cares it for status clear.

But we should care it for error irq handling, too.
This patch cares it.

Reported-by: Nguyen Bao Nguyen <nguyen.nguyen.yj@renesas.com>
Reported-by: Nishiyama Kunihiko <kunihiko.nishiyama.dn@renesas.com>
Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Link: https://lore.kernel.org/r/871quocio1.wl-kuninori.morimoto.gx@renesas.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/sh/rcar/ssiu.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/soc/sh/rcar/ssiu.c b/sound/soc/sh/rcar/ssiu.c
index 4b8a63e336c7..d7f4646ee029 100644
--- a/sound/soc/sh/rcar/ssiu.c
+++ b/sound/soc/sh/rcar/ssiu.c
@@ -67,6 +67,8 @@ static void rsnd_ssiu_busif_err_irq_ctrl(struct rsnd_mod *mod, int enable)
 		shift  = 1;
 		offset = 1;
 		break;
+	default:
+		return;
 	}
 
 	for (i = 0; i < 4; i++) {
-- 
2.35.1

