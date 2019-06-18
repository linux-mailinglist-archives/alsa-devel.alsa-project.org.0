Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2636B4989E
	for <lists+alsa-devel@lfdr.de>; Tue, 18 Jun 2019 07:21:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9577D1704;
	Tue, 18 Jun 2019 07:20:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9577D1704
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1560835298;
	bh=HOWux7OIWayWlyChpxt285ms/YGaUKfmrdNParbOSpI=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=vvM9GqrMvnNlYK9swkIDYmVgFPUn5AISBrOPxxHTLxPyfu2n6KoA9DJUJiRHiabtv
	 T8rC2mwcuxF08cMTlLhSxD9wp6dvoeEi98kr6sHrdoFxifPib34quprbTL3eqG/lld
	 L55s6ZbAW6K0i0SKZLTLcYx325ba9N6MwWYVs8oo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 31D64F896F4;
	Tue, 18 Jun 2019 07:19:55 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B0FA0F896F4; Tue, 18 Jun 2019 07:19:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5AA47F8075C
 for <alsa-devel@alsa-project.org>; Tue, 18 Jun 2019 07:19:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5AA47F8075C
Received: from svr-orw-mbx-03.mgc.mentorg.com ([147.34.90.203])
 by relay1.mentorg.com with esmtps (TLSv1.2:ECDHE-RSA-AES256-SHA384:256)
 id 1hd6Wy-0004az-Q0 from Jiada_Wang@mentor.com ;
 Mon, 17 Jun 2019 22:19:40 -0700
Received: from jiwang-OptiPlex-980.tokyo.mentorg.com (147.34.91.1) by
 svr-orw-mbx-03.mgc.mentorg.com (147.34.90.203) with Microsoft SMTP Server
 (TLS) id 15.0.1320.4; Mon, 17 Jun 2019 22:19:37 -0700
From: Jiada Wang <jiada_wang@mentor.com>
To: <lgirdwood@gmail.com>, <broonie@kernel.org>, <perex@perex.cz>,
 <tiwai@suse.com>, <kuninori.morimoto.gx@renesas.com>
Date: Tue, 18 Jun 2019 14:19:53 +0900
Message-ID: <20190618051953.13419-1-jiada_wang@mentor.com>
X-Mailer: git-send-email 2.19.2
MIME-Version: 1.0
X-ClientProxiedBy: svr-orw-mbx-04.mgc.mentorg.com (147.34.90.204) To
 svr-orw-mbx-03.mgc.mentorg.com (147.34.90.203)
Cc: jiada_wang@mentor.com, alsa-devel@alsa-project.org, sudipi@jp.adit-jv.com,
 linux-kernel@vger.kernel.org
Subject: [alsa-devel] [PATCH v2 1/1] ASoC: rsnd: fixup mod ID calculation in
	rsnd_ctu_probe_
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

From: Nilkanth Ahirrao <anilkanth@jp.adit-jv.com>

commit c16015f36cc1 ("ASoC: rsnd: add .get_id/.get_id_sub")
introduces rsnd_ctu_id which calcualates and gives
the main Device id of the CTU by dividing the id by 4.
rsnd_mod_id uses this interface to get the CTU main
Device id. But this commit forgets to revert the main
Device id calcution previously done in rsnd_ctu_probe_
which also divides the id by 4. This path corrects the
same to get the correct main Device id.

The issue is observered when rsnd_ctu_probe_ is done for CTU1

Fixes: c16015f36cc1 ("ASoC: rsnd: add .get_id/.get_id_sub")

Signed-off-by: Nilkanth Ahirrao <anilkanth@jp.adit-jv.com>
Signed-off-by: Suresh Udipi <sudipi@jp.adit-jv.com>
Signed-off-by: Jiada Wang <jiada_wang@mentor.com>
---
v2: fixed commit id

v1: initial version
---
 sound/soc/sh/rcar/ctu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/sh/rcar/ctu.c b/sound/soc/sh/rcar/ctu.c
index 8cb06dab234e..7647b3d4c0ba 100644
--- a/sound/soc/sh/rcar/ctu.c
+++ b/sound/soc/sh/rcar/ctu.c
@@ -108,7 +108,7 @@ static int rsnd_ctu_probe_(struct rsnd_mod *mod,
 			   struct rsnd_dai_stream *io,
 			   struct rsnd_priv *priv)
 {
-	return rsnd_cmd_attach(io, rsnd_mod_id(mod) / 4);
+	return rsnd_cmd_attach(io, rsnd_mod_id(mod));
 }
 
 static void rsnd_ctu_value_init(struct rsnd_dai_stream *io,
-- 
2.19.2

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
