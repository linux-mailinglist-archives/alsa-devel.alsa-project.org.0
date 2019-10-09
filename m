Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D27E8D131A
	for <lists+alsa-devel@lfdr.de>; Wed,  9 Oct 2019 17:39:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 41A491673;
	Wed,  9 Oct 2019 17:38:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 41A491673
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1570635584;
	bh=GTfHvPAw+7I8XPSXDztOhV2tewQuFCrI1hPcKYMSlaU=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ZcK1+3w/j/wkEClSMl46TD+O4Yw1mZz2/YcEtzbH69kfrGKqpbXsBMafjioZdWmKU
	 teJ6xllLCS06WyftlsrZEBmFgjJtRckd33vp2xtXuA+umZ/Gmymw/UoRTZBwbKPbS3
	 iKsHyn17jOvAcSTE9Hkx2TS6KJbm6pZR0rRQ7doA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8F748F805FF;
	Wed,  9 Oct 2019 17:36:27 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E91A9F80113; Wed,  9 Oct 2019 17:36:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from inva020.nxp.com (inva020.nxp.com [92.121.34.13])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 37717F80113
 for <alsa-devel@alsa-project.org>; Wed,  9 Oct 2019 17:36:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 37717F80113
Received: from inva020.nxp.com (localhost [127.0.0.1])
 by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 523FB1A01A2;
 Wed,  9 Oct 2019 17:36:18 +0200 (CEST)
Received: from inva024.eu-rdc02.nxp.com (inva024.eu-rdc02.nxp.com
 [134.27.226.22])
 by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 463731A0084;
 Wed,  9 Oct 2019 17:36:18 +0200 (CEST)
Received: from fsr-ub1864-103.ea.freescale.net
 (fsr-ub1864-103.ea.freescale.net [10.171.82.17])
 by inva024.eu-rdc02.nxp.com (Postfix) with ESMTP id D2A8B2060B;
 Wed,  9 Oct 2019 17:36:17 +0200 (CEST)
From: Daniel Baluta <daniel.baluta@nxp.com>
To: perex@perex.cz,
	tiwai@suse.com,
	broonie@kernel.org
Date: Wed,  9 Oct 2019 18:36:15 +0300
Message-Id: <20191009153615.32105-3-daniel.baluta@nxp.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191009153615.32105-1-daniel.baluta@nxp.com>
References: <20191009153615.32105-1-daniel.baluta@nxp.com>
X-Virus-Scanned: ClamAV using ClamSMTP
Cc: alsa-devel@alsa-project.org, Daniel Baluta <daniel.baluta@nxp.com>,
 linux-kernel@vger.kernel.org, kuninori.morimoto.gx@renesas.com,
 linux-imx@nxp.com
Subject: [alsa-devel] [PATCH 2/2] ASoC: simple_card_utils.h: Fix potential
	multiple redefinition error
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

asoc_simple_debug_info and asoc_simple_debug_dai must be static
otherwise we might a compilation error if the compiler decides
not to inline the given function.

Fixes: 0580dde59438686d ("ASoC: simple-card-utils: add asoc_simple_debug_info()")
Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
---
 include/sound/simple_card_utils.h | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/include/sound/simple_card_utils.h b/include/sound/simple_card_utils.h
index 293ff8115960..bbdd1542d6f1 100644
--- a/include/sound/simple_card_utils.h
+++ b/include/sound/simple_card_utils.h
@@ -136,9 +136,9 @@ int asoc_simple_init_priv(struct asoc_simple_priv *priv,
 			       struct link_info *li);
 
 #ifdef DEBUG
-inline void asoc_simple_debug_dai(struct asoc_simple_priv *priv,
-				  char *name,
-				  struct asoc_simple_dai *dai)
+static inline void asoc_simple_debug_dai(struct asoc_simple_priv *priv,
+					 char *name,
+					 struct asoc_simple_dai *dai)
 {
 	struct device *dev = simple_priv_to_dev(priv);
 
@@ -168,7 +168,7 @@ inline void asoc_simple_debug_dai(struct asoc_simple_priv *priv,
 		dev_dbg(dev, "%s clk %luHz\n", name, clk_get_rate(dai->clk));
 }
 
-inline void asoc_simple_debug_info(struct asoc_simple_priv *priv)
+static inline void asoc_simple_debug_info(struct asoc_simple_priv *priv)
 {
 	struct snd_soc_card *card = simple_priv_to_card(priv);
 	struct device *dev = simple_priv_to_dev(priv);
-- 
2.17.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
