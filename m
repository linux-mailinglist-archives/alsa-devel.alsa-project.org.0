Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 064B65742C2
	for <lists+alsa-devel@lfdr.de>; Thu, 14 Jul 2022 06:26:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 92ADD179B;
	Thu, 14 Jul 2022 06:25:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 92ADD179B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657772785;
	bh=iA9/mffzugg5arwehs0PfA8MRLkpYI57QgbLR0O4YSE=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=agcUgubhEAcyABgDlgfuspxwUseOctrytYbSw8JmFxc8VAjnPDkcA/epcTUbuWW3h
	 fKCSaJCs0epmbVUhpWlkUHqqZ/v/oB5v10cUq25OWK7gCTs9Hnram8v8U9gO0Ky6Vl
	 vvLisEmrOBzfwCHha4VYL/kX9gFc4maxT2dyJGiw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B2C89F805BD;
	Thu, 14 Jul 2022 06:23:07 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B410CF805AF; Thu, 14 Jul 2022 06:23:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 70DBBF8058C
 for <alsa-devel@alsa-project.org>; Thu, 14 Jul 2022 06:22:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 70DBBF8058C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="l7uXCoUu"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id BB15BB82373;
 Thu, 14 Jul 2022 04:22:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3ADD3C3411C;
 Thu, 14 Jul 2022 04:22:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1657772575;
 bh=iA9/mffzugg5arwehs0PfA8MRLkpYI57QgbLR0O4YSE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=l7uXCoUu05LNZeVf9WvazV0SCXWy/EnwCX1SYtiyC92DKYbHDXr0hJgK/dCLtKiUp
 s2/KBbap9t2fumqVWnUuLQH+PWSCOLVNarC9NV3nU5zIwbYn0HEZT9ssTULNetC5iO
 8GfYew68JiZRYUgUMLZiU54JDr9kkPdsGx6DR3fXkXshhTE20HQkC69EqIw7f01d10
 Eu52gGpCAI31xmYrmin7i1Y9Q9Gh0fdAkIY8HMqqF8YJiW8PkbfrPQtAeREJdPnn4b
 rQzhNiVjzGoxt5bq6gResVxBnvUNU9eLmIztyt3jjNu6G8Tke2osPkZD6eVSokzeT/
 k+rDjbeto0HGA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.18 12/41] ASoC: wcd9335: Remove RX channel from old
 list before adding it to a new one
Date: Thu, 14 Jul 2022 00:21:52 -0400
Message-Id: <20220714042221.281187-12-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220714042221.281187-1-sashal@kernel.org>
References: <20220714042221.281187-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Cc: Sasha Levin <sashal@kernel.org>, alsa-devel@alsa-project.org,
 Yassine Oudjana <y.oudjana@protonmail.com>, tiwai@suse.com,
 lgirdwood@gmail.com, Mark Brown <broonie@kernel.org>,
 srinivas.kandagatla@linaro.org, bgoswami@quicinc.com
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

From: Yassine Oudjana <y.oudjana@protonmail.com>

[ Upstream commit be6dd72edb216f20fc80e426ece9fe9b8aabf033 ]

Currently in slim_rx_mux_put, an RX channel gets added to a new list
even if it is already in one. This can mess up links and make either
it, the new list head, or both, get linked to the wrong entries.
This can cause an entry to link to itself which in turn ends up
making list_for_each_entry in other functions loop infinitely.
To avoid issues, always remove the RX channel from any list it's in
before adding it to a new list.

Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>
Link: https://lore.kernel.org/r/20220606152226.149164-1-y.oudjana@protonmail.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/codecs/wcd9335.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/wcd9335.c b/sound/soc/codecs/wcd9335.c
index 1e60db4056ad..12be043ee9a3 100644
--- a/sound/soc/codecs/wcd9335.c
+++ b/sound/soc/codecs/wcd9335.c
@@ -1289,9 +1289,12 @@ static int slim_rx_mux_put(struct snd_kcontrol *kc,
 
 	wcd->rx_port_value[port_id] = ucontrol->value.enumerated.item[0];
 
+	/* Remove channel from any list it's in before adding it to a new one */
+	list_del_init(&wcd->rx_chs[port_id].list);
+
 	switch (wcd->rx_port_value[port_id]) {
 	case 0:
-		list_del_init(&wcd->rx_chs[port_id].list);
+		/* Channel already removed from lists. Nothing to do here */
 		break;
 	case 1:
 		list_add_tail(&wcd->rx_chs[port_id].list,
-- 
2.35.1

