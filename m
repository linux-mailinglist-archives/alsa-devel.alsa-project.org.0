Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 288A34CDC3C
	for <lists+alsa-devel@lfdr.de>; Fri,  4 Mar 2022 19:20:07 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C14491F59;
	Fri,  4 Mar 2022 19:19:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C14491F59
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646418006;
	bh=KXlre7vJPtWd2GewZg7v5Vo0cSdmJiieiW46LwNAOnA=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=oEDy6MvkGGrN903URohUSp7xuca2Uc6WttYvIlKRilZ9tBDDqLOl48FDAZkiZSqyc
	 7zan4mPN2/PBkhejbCVxbs5HGIe5xUGhkXqWLjtLWZgiIxqtC144SeI/V0jYRjpMxJ
	 2Gw+3ZG/AZVQ1UfGTJwCoOzBqDD1A9imCAWCTVKU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 82823F80511;
	Fri,  4 Mar 2022 19:18:34 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C0D6FF80507; Fri,  4 Mar 2022 19:18:31 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.153.233])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D333CF800FA
 for <alsa-devel@alsa-project.org>; Fri,  4 Mar 2022 19:18:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D333CF800FA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com
 header.b="0RAjyHlQ"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1646417906; x=1677953906;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=KXlre7vJPtWd2GewZg7v5Vo0cSdmJiieiW46LwNAOnA=;
 b=0RAjyHlQktfiCCeuj2dnJJmB/kgv64DIg176qLmQslNLUisa7icNFxzl
 AgPkl+n13faqUxwRrs1TB1KCNbP6UbvvPoiwTx6Yl5tXq+KuYCll2E2Po
 Xdf2peSj3Nu2vKQD7u+Xh+0mVpx8mU5S+kl+AZkNwd1A4dCmgvGF1+jgZ
 vKD9bzp1rD62wCr4++GxB4bNuftpes7hAOOJ79cTIy3KKzOj7sbUkrBJC
 MI2OelSlP5P2sOKXqH9hlHvmGvAXdU1TeiQ+5ByRL70m9LLAPP9m7H52E
 HgAGddtOZYNZe5We4ZvXvHKn99HKvA8MUckiOJIrPT+nRhlD4bRseOgOw Q==;
X-IronPort-AV: E=Sophos;i="5.90,155,1643698800"; d="scan'208";a="155300391"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 04 Mar 2022 11:18:20 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Fri, 4 Mar 2022 11:18:19 -0700
Received: from rob-ult-m19940.amer.actel.com (10.10.115.15) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2375.17 via Frontend Transport; Fri, 4 Mar 2022 11:18:16 -0700
From: Codrin Ciubotariu <codrin.ciubotariu@microchip.com>
To: <alsa-devel@alsa-project.org>, <linux-kernel@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
Subject: [PATCH 1/6] ASoC: dmaengine: do not use a NULL prepare_slave_config()
 callback
Date: Fri, 4 Mar 2022 20:17:51 +0200
Message-ID: <20220304181756.1894561-2-codrin.ciubotariu@microchip.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220304181756.1894561-1-codrin.ciubotariu@microchip.com>
References: <20220304181756.1894561-1-codrin.ciubotariu@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Cc: lars@metafoo.de, nicolas.ferre@microchip.com, robh+dt@kernel.org,
 tiwai@suse.com, broonie@kernel.org,
 Codrin Ciubotariu <codrin.ciubotariu@microchip.com>
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

Even if struct snd_dmaengine_pcm_config is used, prepare_slave_config()
callback might not be set. Check if this callback is set before using it.

Fixes: fa654e085300 ("ASoC: dmaengine-pcm: Provide default config")
Signed-off-by: Codrin Ciubotariu <codrin.ciubotariu@microchip.com>
---
 sound/soc/soc-generic-dmaengine-pcm.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/soc-generic-dmaengine-pcm.c b/sound/soc/soc-generic-dmaengine-pcm.c
index 285441d6aeed..2ab2ddc1294d 100644
--- a/sound/soc/soc-generic-dmaengine-pcm.c
+++ b/sound/soc/soc-generic-dmaengine-pcm.c
@@ -86,10 +86,10 @@ static int dmaengine_pcm_hw_params(struct snd_soc_component *component,
 
 	memset(&slave_config, 0, sizeof(slave_config));
 
-	if (!pcm->config)
-		prepare_slave_config = snd_dmaengine_pcm_prepare_slave_config;
-	else
+	if (pcm->config && pcm->config->prepare_slave_config)
 		prepare_slave_config = pcm->config->prepare_slave_config;
+	else
+		prepare_slave_config = snd_dmaengine_pcm_prepare_slave_config;
 
 	if (prepare_slave_config) {
 		int ret = prepare_slave_config(substream, params, &slave_config);
-- 
2.32.0

