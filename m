Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0853D34B1BF
	for <lists+alsa-devel@lfdr.de>; Fri, 26 Mar 2021 23:03:03 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 962701688;
	Fri, 26 Mar 2021 23:02:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 962701688
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1616796182;
	bh=lvupv3ozctx9trTgZbInubq3FRkPYBS7aCYNL7Ip2kc=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=htrB29XzLJrvDLOrE7TIqOPIabIZMhzaB5sfff7VSmy67dUTKeuC7zbLfxMT/OUku
	 +KYdyN5VVMwBxR0khbevmfJsHgW0b52XzujzUmPEsCrWXXS730C3s4fOac+z8UqWQg
	 IIzuXJSk15KUVtbadUriCu1ttu6FdFBP+X696qdY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CC6AEF804A9;
	Fri, 26 Mar 2021 23:00:19 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D9C5EF80104; Fri, 26 Mar 2021 23:00:10 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E8104F80104
 for <alsa-devel@alsa-project.org>; Fri, 26 Mar 2021 22:59:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E8104F80104
IronPort-SDR: FhjYkqfzkbX9ki2h14uUJhB2ByMBkS52GzJgJavne527MeDfyoyiXiT0aov4bjaWlAUJCopiEE
 1rudu13aFdig==
X-IronPort-AV: E=McAfee;i="6000,8403,9935"; a="211396692"
X-IronPort-AV: E=Sophos;i="5.81,281,1610438400"; d="scan'208";a="211396692"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2021 14:59:57 -0700
IronPort-SDR: pB408+pzBCoEPBT8sZF5FmcBw4LHKr5AyFUT6dU0vtpWt0fcCZ5siFsPnp18RzUiplSBJx9yZb
 nrgzhMs4AqfA==
X-IronPort-AV: E=Sophos;i="5.81,281,1610438400"; d="scan'208";a="416706683"
Received: from zcmahone-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.255.231.203])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2021 14:59:56 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 03/17] ASoC: atmel: atmel-i2s: remove useless initialization
Date: Fri, 26 Mar 2021 16:59:13 -0500
Message-Id: <20210326215927.936377-4-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210326215927.936377-1-pierre-louis.bossart@linux.intel.com>
References: <20210326215927.936377-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>, tiwai@suse.de,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 linux-kernel@vger.kernel.org,
 Ludovic Desroches <ludovic.desroches@microchip.com>, broonie@kernel.org,
 Codrin Ciubotariu <codrin.ciubotariu@microchip.com>,
 "moderated list:ARM/Microchip AT91 SoC support"
 <linux-arm-kernel@lists.infradead.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>
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

Cppcheck complains:

sound/soc/atmel/atmel-i2s.c:628:6: style: Redundant initialization for 'err'. The initialized value is overwritten before it is read. [redundantInitialization]
 err = devm_request_irq(&pdev->dev, irq, atmel_i2s_interrupt, 0,
     ^
sound/soc/atmel/atmel-i2s.c:598:10: note: err is initialized
 int err = -ENXIO;
         ^
sound/soc/atmel/atmel-i2s.c:628:6: note: err is overwritten
 err = devm_request_irq(&pdev->dev, irq, atmel_i2s_interrupt, 0,
     ^

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/atmel/atmel-i2s.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/atmel/atmel-i2s.c b/sound/soc/atmel/atmel-i2s.c
index 7c6187e41f2b..584656cc7d3c 100644
--- a/sound/soc/atmel/atmel-i2s.c
+++ b/sound/soc/atmel/atmel-i2s.c
@@ -595,7 +595,7 @@ static int atmel_i2s_probe(struct platform_device *pdev)
 	struct regmap *regmap;
 	void __iomem *base;
 	int irq;
-	int err = -ENXIO;
+	int err;
 	unsigned int pcm_flags = 0;
 	unsigned int version;
 
-- 
2.25.1

