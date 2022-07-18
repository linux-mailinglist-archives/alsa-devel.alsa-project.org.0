Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B824257D06F
	for <lists+alsa-devel@lfdr.de>; Thu, 21 Jul 2022 17:59:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2164C182F;
	Thu, 21 Jul 2022 17:58:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2164C182F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1658419146;
	bh=DzP6J5wmo23YPOZvEQWM22e3YADlcJlWB0RLeSNkXLg=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=peSbaQQDUtEj1BGrLPlsNXx6FOfO9WF1qRZ8cMFkVM2+sUKGJKCix1cIv2ulYA9Bv
	 2TBYwrwZ5FnvsijbsF1YHfqLyNsj0uxNOKkkxGuwTLiPhaMZAzWYlEd3Yat/LNPzvi
	 oIWUia40H8anBldeKVort6c27mM3k/s+R7woTPZ8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5EC86F80166;
	Thu, 21 Jul 2022 17:58:05 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 029E0F80517; Mon, 18 Jul 2022 13:04:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from esa3.mentor.iphmx.com (esa3.mentor.iphmx.com [68.232.137.180])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9D69FF80125
 for <alsa-devel@alsa-project.org>; Mon, 18 Jul 2022 13:04:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9D69FF80125
X-IronPort-AV: E=Sophos;i="5.92,280,1650960000"; d="scan'208";a="79788840"
Received: from orw-gwy-02-in.mentorg.com ([192.94.38.167])
 by esa3.mentor.iphmx.com with ESMTP; 18 Jul 2022 03:04:14 -0800
IronPort-SDR: KOLm0fDLK17UpztQZHEOU5e2xawaiZVzBw4G8CBYJEeLKxtuqJtFywAAQ9j0ljtTxxAP5TOKpW
 GyBfn0wKp9zk8UIadzBPooNUcb0tWXJoKzledJEWzThCBbnY4ZLGEoc6rs79HR84FToENs4DLo
 4lzixczAIatDJ8yy+x7Dr9U4VL/NjPPEVEURIL2W0zucDrOOy+2kI0ve3a7J8T2p3vnWCc95O6
 Y/8L7KCq73kAi5iGfFOaqXupBtRZjbzSl9PhkvY4mjMmnV1EY850RaTndEoyH7HOpk9ZGmT/ee
 OXg=
From: Jiada Wang <jiwang_wang@mentor.com>
To: <lgirdwood@gmail.com>, <broonie@kernel.org>, <perex@perex.cz>,
 <tiwai@suse.com>, <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v1 1/1] rsnd: ssiu: add missing .quit callback for gen2
Date: Mon, 18 Jul 2022 20:04:04 +0900
Message-ID: <20220718110404.1529085-1-jiwang_wang@mentor.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Mailman-Approved-At: Thu, 21 Jul 2022 17:58:03 +0200
Cc: jiada_wang@mentor.com, Dean_Jenkins@mentor.com, alsa-devel@alsa-project.org,
 erosca@de.adit-jv.com, linux-kernel@vger.kernel.org
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

From: Wang Jiada <jiada_wang@mentor.com>

commit 83b220cf8eb2a ("ASoC: rsnd: implement BUSIF related
code in ssiu.c") moved BUSIF related code in ssiu.c
which added .quit callback in ssiu.c to disable error irq
when ssiu quits.

But .quit callback was added only for gen1 and is missing
for gen2, this causes error irq is left enabled after ssiu
quits on gen2.

This commit adds missing .quit callback for gen2

Signed-off-by: Wang Jiada <jiada_wang@mentor.com>
Cc: Dean Jenkins <Dean_Jenkins@mentor.com>
Cc: Eugeniu Rosca <erosca@de.adit-jv.com>
---
 sound/soc/sh/rcar/ssiu.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/sh/rcar/ssiu.c b/sound/soc/sh/rcar/ssiu.c
index 4b8a63e336c7..19a8030a660d 100644
--- a/sound/soc/sh/rcar/ssiu.c
+++ b/sound/soc/sh/rcar/ssiu.c
@@ -417,6 +417,7 @@ static struct rsnd_mod_ops rsnd_ssiu_ops_gen2 = {
 	.name		= SSIU_NAME,
 	.dma_req	= rsnd_ssiu_dma_req,
 	.init		= rsnd_ssiu_init_gen2,
+	.quit		= rsnd_ssiu_quit,
 	.start		= rsnd_ssiu_start_gen2,
 	.stop		= rsnd_ssiu_stop_gen2,
 	.get_status	= rsnd_ssiu_get_status,
-- 
2.25.1

