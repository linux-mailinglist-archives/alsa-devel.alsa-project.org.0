Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 26FEA537B8A
	for <lists+alsa-devel@lfdr.de>; Mon, 30 May 2022 15:27:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B792A1AF3;
	Mon, 30 May 2022 15:26:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B792A1AF3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1653917237;
	bh=e4rQjDbcX7pYuLi/MagzF5WQm9G9+qVy7DrNZMANN00=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QxSF0hVUcA1ZgOeKGC32EQhwYjJOg/3588U7nKgKCyQq/oDxEUk2yeOMtt7kAh6n/
	 0NaaM5T9Nz4SG9HyMLCCMF2hnz8YSKX0l/IpQ8NdsX8sKXqDEZr/ChBuRnMJ/0MdwC
	 VQap42+hjC4KZrbsyMVUySwFpNPDbXv7gJm6D0EE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D394DF804BD;
	Mon, 30 May 2022 15:26:19 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A0E20F800E5; Mon, 30 May 2022 15:26:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 91B06F800E5
 for <alsa-devel@alsa-project.org>; Mon, 30 May 2022 15:26:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 91B06F800E5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="QUAqlj54"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id C38E3B80AE8;
 Mon, 30 May 2022 13:26:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41E97C385B8;
 Mon, 30 May 2022 13:26:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1653917171;
 bh=e4rQjDbcX7pYuLi/MagzF5WQm9G9+qVy7DrNZMANN00=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=QUAqlj54GqXv9MhQ6OhugDUR7UE+huI+vvQ8hT5Wf8bkW9EoPe0Vr1Ep/QhZiMIFP
 E+4nvYCWg3PGMa+EHIg5C3tUF+hqyIBqjE1zcHj8tyrJcPAxwrcw/gOJAocyuikSBo
 wpC+1PcsQD9NSImiiNIQoJNu7nmdk8ad4fvxajSvdob4BD5UhwEA8JWZGnVSpC9mdJ
 ezLCvxsLzlWC9Tu257CJcBls2SiinX0SR1RFkHVKXWqhbw4HqVMEcJrZoeAPTs/ofu
 MB+9a1OtznMq2HMnE43GT103hKPLbWQ8zNa7Rh1moXu8MAzVwY2sHR0wUMao1oXqX8
 CZIRkMtY4Hlpw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.18 044/159] ASoC: rsnd: care default case on
 rsnd_ssiu_busif_err_status_clear()
Date: Mon, 30 May 2022 09:22:29 -0400
Message-Id: <20220530132425.1929512-44-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220530132425.1929512-1-sashal@kernel.org>
References: <20220530132425.1929512-1-sashal@kernel.org>
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

