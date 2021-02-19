Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DCD5F3201AC
	for <lists+alsa-devel@lfdr.de>; Sat, 20 Feb 2021 00:19:26 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6324A168B;
	Sat, 20 Feb 2021 00:18:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6324A168B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1613776766;
	bh=DS9W5zO1FnM3qmVjehE/z/NHb50aJKutzIue7Cei1i8=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Ctr28S0fpWNwiEOajVL0dBmAEe0T18JqEVDMjVD5UyQ73BF8crduXwMqswJcfTKw/
	 LRr4a9W2aiWTiaHBNe7ERQRUrGFhF1UfTIeRK/jeH3DScmRoRiy8q6tSflTGxRCxX9
	 0K6EAS1qZbW2tDPwCPBPss6uMpKAfdJZr6dEgWtQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AD7AEF800C7;
	Sat, 20 Feb 2021 00:17:06 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 56875F802DB; Sat, 20 Feb 2021 00:17:03 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D154AF80258
 for <alsa-devel@alsa-project.org>; Sat, 20 Feb 2021 00:16:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D154AF80258
IronPort-SDR: E+fhIM2iwMfmAd6vv32uDXypqVycuzd1crud8MdufE/ATB91Ncj+J8HfaAVgIXI7ajeNNdODpN
 cKqbrZNWvfyQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9900"; a="203290906"
X-IronPort-AV: E=Sophos;i="5.81,191,1610438400"; d="scan'208";a="203290906"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2021 15:16:47 -0800
IronPort-SDR: gODTtMkoQnJmqnb4rqptw9tz8nGJlIL3Em+qLegV5KqAyDrArF4LXv8lE+PsI3NUbhDotzPnn3
 PEdTG/+t2N3Q==
X-IronPort-AV: E=Sophos;i="5.81,191,1610438400"; d="scan'208";a="420329786"
Received: from lkwerake-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.251.153.34])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2021 15:16:46 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 3/8] ASoC: sh: rcar: simplify return
Date: Fri, 19 Feb 2021 17:16:30 -0600
Message-Id: <20210219231635.5749-4-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210219231635.5749-1-pierre-louis.bossart@linux.intel.com>
References: <20210219231635.5749-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, broonie@kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
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

cppcheck warning:

sound/soc/sh/rcar/core.c:219:9: warning: Identical condition and
return expression 'ret', return value is always 0
[identicalConditionAfterEarlyExit]
 return ret;
        ^
sound/soc/sh/rcar/core.c:210:6: note: If condition 'ret' is true, the
function will return/exit
 if (ret)
     ^
sound/soc/sh/rcar/core.c:219:9: note: Returning identical expression
'ret'
 return ret;
        ^

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sh/rcar/core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/sh/rcar/core.c b/sound/soc/sh/rcar/core.c
index c405bf3b4c99..b1a75509851a 100644
--- a/sound/soc/sh/rcar/core.c
+++ b/sound/soc/sh/rcar/core.c
@@ -216,7 +216,7 @@ int rsnd_mod_init(struct rsnd_priv *priv,
 	mod->clk	= clk;
 	mod->priv	= priv;
 
-	return ret;
+	return 0;
 }
 
 void rsnd_mod_quit(struct rsnd_mod *mod)
-- 
2.25.1

