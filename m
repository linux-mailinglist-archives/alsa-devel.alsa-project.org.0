Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 81BE5537CC1
	for <lists+alsa-devel@lfdr.de>; Mon, 30 May 2022 15:41:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1950E1EE2;
	Mon, 30 May 2022 15:40:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1950E1EE2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1653918070;
	bh=e4rQjDbcX7pYuLi/MagzF5WQm9G9+qVy7DrNZMANN00=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QSBOCTg6oV5TrsNspzeB1/1r0sDL6Mrpi8RjOrF2229s8MYyNLsfEbFk6XO4wDa5s
	 FRkbnLdkP+M/PNBEygpFN6nTgZn5XXwXP30UERsDSVRKPVS5gJGv+yhCRCQWCYcnG6
	 C2ktVgyEWj/xILmQAIS02b9vdBbebgfJ91wHQwG4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6E54CF804B4;
	Mon, 30 May 2022 15:39:58 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3BD5AF80240; Mon, 30 May 2022 15:39:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1C548F8012F
 for <alsa-devel@alsa-project.org>; Mon, 30 May 2022 15:39:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1C548F8012F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="cDOThP3W"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 0AB7060F9E;
 Mon, 30 May 2022 13:39:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A25DC36AE3;
 Mon, 30 May 2022 13:39:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1653917988;
 bh=e4rQjDbcX7pYuLi/MagzF5WQm9G9+qVy7DrNZMANN00=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=cDOThP3WmMlomyWdbvkFuD0yr3Y4BRpJ+8bUMvVYG5sWmcWRtvg/zlqSvE4WTd6lv
 O/vkLEBafJe2N0TjQUrZ1/TT0FGGlCMpYISY48Us4R30CGK3mJgMKgyjbZCiczyDxV
 OU/JPBWySHlBsZA3k30Ptvgre572Xmvyt22Jp8M6u1jvSEv8plLh8cGj5tefWWLZ8w
 mSl3l1UU6cD3Y8cBBCKOb7GdwsJeF7YvcxJMCd9R35147qHDMilKgbKZOhEICajA74
 pBKAWrUv6XFC4T9MER5EI3rE7jf7nulsB7ihEcwXfI3pwcWhM7rA3sKbLXYK6NtGv8
 L2IirKIKeoSSA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.15 029/109] ASoC: rsnd: care default case on
 rsnd_ssiu_busif_err_status_clear()
Date: Mon, 30 May 2022 09:37:05 -0400
Message-Id: <20220530133825.1933431-29-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220530133825.1933431-1-sashal@kernel.org>
References: <20220530133825.1933431-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Cc: Sasha Levin <sashal@kernel.org>, alsa-devel@alsa-project.org,
 kernel test robot <lkp@intel.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, tiwai@suse.com,
 lgirdwood@gmail.com, Mark Brown <broonie@kernel.org>, colin.king@intel.com,
 Dan Carpenter <dan.carpenter@oracle.com>
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

[ Upstream commit b1384d4c95088d01f4266237faabf165d3d605fc ]

commit cfb7b8bf1e2d66 ("ASoC: rsnd: tidyup
rsnd_ssiu_busif_err_status_clear()") merged duplicate code, but it didn't
care about default case, and causes smatch warnings.

smatch warnings:
sound/soc/sh/rcar/ssiu.c:112 rsnd_ssiu_busif_err_status_clear() \
	error: uninitialized symbol 'offset'.
sound/soc/sh/rcar/ssiu.c:114 rsnd_ssiu_busif_err_status_clear() \
	error: uninitialized symbol 'shift'.

This patch cares it.

Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Link: https://lore.kernel.org/r/87r15rgn6p.wl-kuninori.morimoto.gx@renesas.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/sh/rcar/ssiu.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/sound/soc/sh/rcar/ssiu.c b/sound/soc/sh/rcar/ssiu.c
index 0d8f97633dd2..138f95dd9f4a 100644
--- a/sound/soc/sh/rcar/ssiu.c
+++ b/sound/soc/sh/rcar/ssiu.c
@@ -102,6 +102,8 @@ bool rsnd_ssiu_busif_err_status_clear(struct rsnd_mod *mod)
 		shift  = 1;
 		offset = 1;
 		break;
+	default:
+		goto out;
 	}
 
 	for (i = 0; i < 4; i++) {
@@ -120,7 +122,7 @@ bool rsnd_ssiu_busif_err_status_clear(struct rsnd_mod *mod)
 		}
 		rsnd_mod_write(mod, reg, val);
 	}
-
+out:
 	return error;
 }
 
-- 
2.35.1

